Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D075D106FD60
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 00:29:28 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5307.1773361761633929967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 17:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 62D0SkjE2351651;
	Thu, 12 Mar 2026 19:28:47 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org, twoerner@gmail.com
Cc: mark.hatle@amd.com
Subject: [PATCH 2/2] wic: re-implement sector-size support
Date: Thu, 12 Mar 2026 19:28:46 -0500
Message-Id: <1773361726-30192-3-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1773361726-30192-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1773361726-30192-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 00:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233018

From: Trevor Woerner <twoerner@gmail.com>

The previous implementation had the following limitations:
- required the variable WIC_SECTOR_SIZE either be defined in a
  configuration file or be defined in a --vars file
- this means that every invocation of "wic ls", "wic cp", or "wic rm"
  needed this variable defined (config or --vars)
- required the user to create separate *wks files for every sector size
  they wanted to use
- required the user to specify the mkfs-extraopts by hand to specify the
  correct sector size: e.g.
	bootloader --ptable gpt
        part --fstype vfat --label emptyfat --mkfs-extraopts "-S 4096"
	part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4096"
	part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"
- specifying --mkfs-extraopts replaces the defaults with the
  user-supplied values
- it would not be possible to generate images with different sector
  sizes in the same build since the configuration and *wks files would
  need to change and the build re-run for each size

The new implementation handles the sector-size via a CLI argument, while
preserving the existing variable definition previously implement:
- the sector-size may now be provided on the cmdline to the "wic ls",
  "wic cp", "wic rm", and "wic create" commands: default = 512
- this means the configuration and/or --vars file does not need to be
  changed in order to perform those operations on images with different
  sector sizes
- support is provided implicitly for mkdosfs and ext[234] partitions
- the user no longer needs to know and supply the sector-size magic in
  --mkfs-extraopts (thereby clobbering the other defaults)

As before, if the --sector-size command-line argument is not given,
allow the sector-size to be provided via the WIC_SECTOR_SIZE bitbake
variable.  The user is warned that this behavior is deprecated.  If
both are given, warn the user that the cmdline argument takes
precedence.

AI-Generated: codex/gpt-5.1-codex-max
Signed-off-by: Trevor Woerner <twoerner@gmail.com>

restore environ test case, as it is still supported (but obsolete)

Revised commit message above.

Rework _mkdosfs_extraopts and _mkfs_ext_extraopts to verify that
the sector-size and any manual size match, otherwise error.  This
change was needed to keep existing workflow where a user can use
either (or both) WIC_SECTOR_SIZE and/or --mkfs-extraopts to select
partition sizes.   Note, before it may have been possible, but
not valid, to select a different overall sector size from the
individual partition sector sizes.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oeqa/selftest/cases/wic.py                | 78 ++++++++++++++++-
 scripts/lib/wic/engine.py                          | 60 +++++++------
 scripts/lib/wic/help.py                            | 23 +++--
 scripts/lib/wic/misc.py                            |  6 ++
 scripts/lib/wic/partition.py                       | 97 ++++++++++++++++++++--
 scripts/lib/wic/plugins/imager/direct.py           | 18 ++--
 scripts/lib/wic/plugins/source/bootimg_efi.py      |  5 +-
 scripts/lib/wic/plugins/source/bootimg_pcbios.py   | 11 +--
 .../lib/wic/plugins/source/isoimage_isohybrid.py   |  5 +-
 scripts/wic                                        | 41 +++++++++
 10 files changed, 280 insertions(+), 64 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index c4bc5a4..fb53997 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -935,8 +935,8 @@ bootloader --ptable gpt""")
         finally:
             os.remove(wks_file)
 
-    def test_wic_sector_size(self):
-        """Test generation image sector size"""
+    def test_wic_sector_size_env(self):
+        """Test generation image sector size via environment (obsolete)"""
  
         oldpath = os.environ['PATH']
         os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
@@ -972,8 +972,8 @@ bootloader --ptable gpt""")
             # list partitions
             result = runCmd("wic ls %s -n %s" % (images[0], sysroot))
             print(result.output)
-            # 4 lines of output: header + 3 partition
-            self.assertEqual(4, len(result.output.split('\n')))
+            # Deprecated message + 4 lines of output: header + 3 partitions
+            self.assertEqual(5, len(result.output.split('\n')))
 
             # verify partition size with wic
             res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p" % (wic_sector_size, images[0]),
@@ -1016,6 +1016,76 @@ bootloader --ptable gpt""")
         finally:
             os.environ['PATH'] = oldpath
 
+    def test_wic_sector_size_cli(self):
+        """Test sector size handling via CLI option."""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        try:
+            bitbake('core-image-minimal')
+
+            with NamedTemporaryFile("w", suffix=".wks") as wks:
+                wks.writelines(
+                    ['bootloader --ptable gpt\n',
+                     'part --fstype vfat --fstype vfat --label emptyfat --size 1M\n',
+                     'part --fstype ext4 --source rootfs --label rofs-a\n',
+                     'part --fstype ext4 --source rootfs --use-uuid\n'])
+                wks.flush()
+                cmd = "wic create %s -e core-image-minimal -o %s --sector-size 4096" % (wks.name, self.resultdir)
+                runCmd(cmd)
+                wksname = os.path.splitext(os.path.basename(wks.name))[0]
+                images = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
+                self.assertEqual(1, len(images))
+
+            sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
+            # list partitions
+            result = runCmd("wic ls %s -n %s --sector-size 4096" % (images[0], sysroot))
+            print(result.output)
+            # 4 lines of output: header + 3 partitions
+            self.assertEqual(4, len(result.output.split('\n')))
+
+            # verify partition size with parted output
+            res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p" % (4096, images[0]),
+                         stderr=subprocess.PIPE)
+
+            print(res.output)
+            # parse parted output which looks like this:
+            # BYT;\n
+            # /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:4096:4096:gpt::;\n
+            # 1:139264B:1187839B:1048576B::emptyfat:msftdata;
+            # 2:1187840B:149270527B:148082688B:ext4:rofs-a:;
+            # 3:149270528B:297353215B:148082688B:ext4:primary:;
+            disk_info = res.output.splitlines()[1]
+            # Check sector sizes
+            sector_size_logical = int(disk_info.split(":")[3])
+            sector_size_physical = int(disk_info.split(":")[4])
+            self.assertEqual(4096, sector_size_logical, "Logical sector size is not 4096.")
+            self.assertEqual(4096, sector_size_physical, "Physical sector size is not 4096.")
+
+            # It is a known issue with parsed that a 4K FAT partition does
+            # not have a recognized filesystem type of *fat.
+            part_info = res.output.splitlines()[2]
+            partname = part_info.split(":")[5]
+            parttype = part_info.split(":")[6]
+            self.assertEqual('emptyfat', partname)
+            self.assertEqual('msftdata;', parttype)
+
+            part_info = res.output.splitlines()[3]
+            parttype = part_info.split(":")[4]
+            partname = part_info.split(":")[5]
+            self.assertEqual('ext4', parttype)
+            self.assertEqual('rofs-a', partname)
+
+            part_info = res.output.splitlines()[4]
+            parttype = part_info.split(":")[4]
+            partname = part_info.split(":")[5]
+            self.assertEqual('ext4', parttype)
+            self.assertEqual('primary', partname)
+
+        finally:
+            os.environ['PATH'] = oldpath
+
 class Wic2(WicTestCase):
 
     def test_bmap_short(self):
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 8682ca3..e12eee8 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -252,7 +252,7 @@ def debugfs_version_check(debugfs_path, min_ver=(1, 46, 5)):
 
 
 class Disk:
-    def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
+    def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext'), sector_size=512):
         self.imagepath = imagepath
         self.native_sysroot = native_sysroot
         self.fstypes = fstypes
@@ -261,16 +261,7 @@ class Disk:
         self._lsector_size = None
         self._psector_size = None
         self._ptable_format = None
-
-        # define sector size
-        sector_size_str = get_bitbake_var('WIC_SECTOR_SIZE')
-        if sector_size_str is not None:
-            try:
-                self.sector_size = int(sector_size_str)
-            except ValueError:
-                self.sector_size = None
-        else:
-            self.sector_size = None
+        self.sector_size = sector_size
 
         # find parted
         # read paths from $PATH environment variable
@@ -299,11 +290,8 @@ class Disk:
         if self._partitions is None:
             self._partitions = OrderedDict()
 
-            if self.sector_size is not None:
-                out = exec_cmd("export PARTED_SECTOR_SIZE=%d; %s -sm %s unit B print" % \
-                           (self.sector_size, self.parted, self.imagepath), True)
-            else:
-                out = exec_cmd("%s -sm %s unit B print" % (self.parted, self.imagepath))
+            out = exec_cmd("export PARTED_SECTOR_SIZE=%d; %s -sm %s unit B print" % \
+                       (self.sector_size, self.parted, self.imagepath), True)
 
             parttype = namedtuple("Part", "pnum start end size fstype")
             splitted = out.splitlines()
@@ -339,12 +327,26 @@ class Disk:
         if pnum not in self.partitions:
             raise WicError("Partition %s is not in the image" % pnum)
         part = self.partitions[pnum]
+
         # check if fstype is supported
+        """
+        NOTE:
+        ^^^^
+        wic uses "parted -m ..." to determine partition types (the "-m" is used
+        so its output is easy to parse in a script). However there appears to
+        be a bug in parted whereby it is unable to identify dos/vfat partition
+        types if the sector-size is not 512 bytes. Therefore if sector-size=512
+        then accept parted's assessment of fileysystem type (including None).
+        But if sector-size!=512 then accept parted's assessment of filesystem
+        type, unless it says None, in which case assume "fat".
+        """
+        part_fstype = part.fstype if part.fstype or self.sector_size == 512 else 'fat'
+
         for fstype in self.fstypes:
-            if part.fstype.startswith(fstype):
+            if part_fstype.startswith(fstype):
                 break
         else:
-            raise WicError("Not supported fstype: {}".format(part.fstype))
+            raise WicError("Not supported fstype: {}".format(part_fstype))
         if pnum not in self._partimages:
             tmpf = tempfile.NamedTemporaryFile(prefix="wic-part")
             dst_fname = tmpf.name
@@ -615,8 +617,9 @@ class Disk:
                             label = part.get("name")
                             label_str = "-n {}".format(label) if label else ''
 
-                            cmd = "{} {} -C {} {}".format(self.mkdosfs, label_str, partfname,
-                                                          part['size'])
+                            sector_str = "-S {}".format(self.sector_size) if self.sector_size else ''
+                            cmd = "{} {} {} -C {} {}".format(self.mkdosfs, label_str, sector_str, partfname,
+                                                             part['size'])
                             exec_cmd(cmd)
                             # copy content from the temporary directory to the new partition
                             cmd = "{} -snompi {} {}/* ::".format(self.mcopy, partfname, tmpdir)
@@ -638,14 +641,19 @@ class Disk:
 
 def wic_ls(args, native_sysroot):
     """List contents of partitioned image or vfat partition."""
-    disk = Disk(args.path.image, native_sysroot)
+    disk = Disk(args.path.image, native_sysroot, sector_size=args.sector_size)
     if not args.path.part:
         if disk.partitions:
             print('Num     Start        End          Size      Fstype')
             for part in disk.partitions.values():
+                # size values are in bytes from parted; convert to sectors if a custom sector size was requested
+                display_size = part.size
+                if args.sector_size and args.sector_size != disk._lsector_size:
+                    display_size = part.size // args.sector_size
                 print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
-                          part.pnum, part.start, part.end,
-                          part.size, part.fstype))
+                          part.pnum, part.start // args.sector_size,
+                          part.end // args.sector_size,
+                          display_size, part.fstype))
     else:
         path = args.path.path or '/'
         print(disk.dir(args.path.part, path))
@@ -656,9 +664,9 @@ def wic_cp(args, native_sysroot):
     partitioned image.
     """
     if isinstance(args.dest, str):
-        disk = Disk(args.src.image, native_sysroot)
+        disk = Disk(args.src.image, native_sysroot, sector_size=args.sector_size)
     else:
-        disk = Disk(args.dest.image, native_sysroot)
+        disk = Disk(args.dest.image, native_sysroot, sector_size=args.sector_size)
     disk.copy(args.src, args.dest)
 
 
@@ -667,7 +675,7 @@ def wic_rm(args, native_sysroot):
     Remove files or directories from the vfat partition of
     partitioned image.
     """
-    disk = Disk(args.path.image, native_sysroot)
+    disk = Disk(args.path.image, native_sysroot, sector_size=args.sector_size)
     disk.remove(args.path.part, args.path.path, args.recursive_delete)
 
 def wic_write(args, native_sysroot):
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 6b49a67..5d7c404 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -118,7 +118,7 @@ wic_create_usage = """
  usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
             [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
             [-r, --rootfs-dir] [-b, --bootimg-dir]
-            [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
+            [-k, --kernel-dir] [-n, --native-sysroot] [--sector-size <bytes>] [-f, --build-rootfs]
             [-c, --compress-with] [-m, --bmap]
 
  This command creates an OpenEmbedded image based on the 'OE kickstart
@@ -139,13 +139,16 @@ SYNOPSIS
     wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
         [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
         [-r, --rootfs-dir] [-b, --bootimg-dir]
-        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
+        [-k, --kernel-dir] [-n, --native-sysroot] [--sector-size <bytes>] [-f, --build-rootfs]
         [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
 
 DESCRIPTION
     This command creates an OpenEmbedded image based on the 'OE
     kickstart commands' found in the <wks file>.
 
+    Use the --sector-size option to select the sector size (in bytes)
+    used for partition layout calculations (default is 512).
+
     In order to do this, wic needs to know the locations of the
     various build artifacts required to build the image.
 
@@ -278,7 +281,7 @@ wic_ls_usage = """
 
  List content of a partitioned image
 
- usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>]
+ usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>] [--sector-size <bytes>]
 
  This command  outputs either list of image partitions or directory contents
  of vfat and ext* partitions.
@@ -296,7 +299,7 @@ SYNOPSIS
     wic ls <image>
     wic ls <image>:<vfat or ext* partition>
     wic ls <image>:<vfat or ext* partition><path>
-    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path>
+    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path> [--sector-size <bytes>]
 
 DESCRIPTION
     This command lists either partitions of the image or directory contents
@@ -336,6 +339,8 @@ DESCRIPTION
 
     The -n option is used to specify the path to the native sysroot
     containing the tools(parted and mtools) to use.
+    The --sector-size option sets the sector size used for partition math
+    (default is 512 bytes).
 
 """
 
@@ -343,7 +348,7 @@ wic_cp_usage = """
 
  Copy files and directories to/from the vfat or ext* partition
 
- usage: wic cp <src> <dest> [--native-sysroot <path>]
+ usage: wic cp <src> <dest> [--native-sysroot <path>] [--sector-size <bytes>]
 
  source/destination image in format <image>:<partition>[<path>]
 
@@ -364,7 +369,7 @@ SYNOPSIS
     wic cp <src> <dest>:<partition>
     wic cp <src>:<partition> <dest>
     wic cp <src> <dest-image>:<partition><path>
-    wic cp <src> <dest-image>:<partition><path> --native-sysroot <path>
+    wic cp <src> <dest-image>:<partition><path> --native-sysroot <path> [--sector-size <bytes>]
 
 DESCRIPTION
     This command copies files or directories either
@@ -408,13 +413,15 @@ DESCRIPTION
 
     The -n option is used to specify the path to the native sysroot
     containing the tools(parted and mtools) to use.
+    The --sector-size option sets the sector size used for partition math
+    (default is 512 bytes).
 """
 
 wic_rm_usage = """
 
  Remove files or directories from the vfat or ext* partitions
 
- usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
+ usage: wic rm <image>:<partition><path> [--native-sysroot <path>] [--sector-size <bytes>]
 
  This command  removes files or directories from the vfat or ext* partitions of
  the partitioned image.
@@ -466,6 +473,8 @@ DESCRIPTION
 
     The -n option is used to specify the path to the native sysroot
     containing the tools(parted and mtools) to use.
+    The --sector-size option sets the sector size used for partition math
+    (default is 512 bytes).
 
     The -r option is used to remove directories and their contents
     recursively,this only applies to ext* partition.
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 1a7c140..310e636 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -263,4 +263,10 @@ def get_bitbake_var(var, image=None, cache=True):
     Provide old get_bitbake_var API by wrapping
     get_var method of BB_VARS singleton.
     """
+    if var == "WIC_SECTOR_SIZE":
+        env_val = os.environ.get("WIC_SECTOR_SIZE")
+        if env_val is not None:
+            logger.warning("DEPRECATED: Using WIC_SECTOR_SIZE from environment; prefer --sector-size to avoid surprises.")
+            return env_val
+
     return BB_VARS.get_var(var, image, cache)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 8fed686..430c212 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -65,6 +65,92 @@ class Partition():
 
         self.lineno = lineno
         self.source_file = ""
+        self.sector_size = 512
+
+    def _mkdosfs_extraopts(self):
+        """
+        Build mkdosfs extra options ensuring the CLI sector size is applied.
+
+        Generate cmdline options for mkdosfs. A user can supply options
+        they want to see used via a wks file. Check that the user has
+        not supplied an "-S <logical-sector-size>" option that conflicts
+        with the wic command-line sector size. If they have specified
+        one that matches, it is silently ignored. Then add our own
+        "-S <logical-sector-size>" option based on the value of
+        self.sector_size.
+        """
+        extraopts = self.mkfs_extraopts or ''
+        tokens = []
+        s_value = None
+        it = iter(extraopts.split())
+        for tok in it:
+            if tok == '-S':
+                # '-S size' format
+                try:
+                    s_value = next(it)
+                except StopIteration:
+                    pass
+            elif tok.startswith('-S') and tok[2:].isdigit():
+                # '-Ssize' format
+                s_value = tok[2:]
+            else:
+                tokens.append(tok)
+        if s_value is not None and s_value != str(self.sector_size):
+            raise WicError("A sector/block size is specified in both "
+                           "the mkfs-extraopts argument (-S %s) and the "
+                           "wic arguments (%s) and they do not match."
+                           % (s_value, self.sector_size))
+        tokens.extend(['-S', str(self.sector_size)])
+        return ' '.join(tokens).strip()
+
+    def _mkfs_ext_extraopts(self, base_opts):
+        """
+        Build mkfs.ext* extra options ensuring the CLI sector size is applied.
+
+        Generate cmdline options for mkfs.ext*. Different parts of the
+        code want to provide different default sets of ext* options for
+        mkfs. But the user can provide their own options via the wks
+        file; in which case the user options completely replace the
+        in-code default options. In either case when sector-size!=512
+        we want to supply an additional "-b <block-size>" argument
+        (using self.sector_size). However we also have to make sure the
+        user (or the code) has not provided their own "-b <block-size>"
+        option which conflicts with self.sector_size, in this case throw
+        an error.
+
+        NOTE: the default sector/block size for an ext* filesystem depends on
+        a number of factors and it is generally best to allow the tools to
+        determine the sector/block size heuristically. Therefore only specify
+        the size explicitly when it is not the default. Specifying a sector-size
+        of 512, for example, for an ext4 filesystem will result in:
+            ERROR: mkfs.ext4: invalid block size - 512
+        See the mkfs.ext4 man page for details on the -b option.
+        """
+        extraopts = self.mkfs_extraopts or base_opts
+        tokens = []
+        b_value = None
+        it = iter(extraopts.split())
+        for tok in it:
+            if tok == '-b':
+                # '-b size' format
+                try:
+                    b_value = next(it)
+                except StopIteration:
+                    pass
+            elif tok.startswith('-b') and tok[2:].isdigit():
+                # '-bsize' format
+                b_value = tok[2:]
+            else:
+                tokens.append(tok)
+        if b_value is not None and b_value != str(self.sector_size):
+            raise WicError("A sector/block size is specified in both "
+                           "the mkfs-extraopts argument (-b %s) and the "
+                           "wic arguments (%s) and they do not match."
+                           % (b_value, self.sector_size))
+        elif self.sector_size != 512:
+            tokens.extend(['-b', str(self.sector_size)])
+            return ' '.join(tokens).strip()
+        return extraopts
 
     def get_extra_block_count(self, current_blocks):
         """
@@ -138,6 +224,8 @@ class Partition():
         Prepare content for individual partitions, depending on
         partition command parameters.
         """
+        # capture the sector size requested on the CLI for mkdosfs invocations
+        self.sector_size = getattr(creator, 'sector_size', 512)
         self.updated_fstab_path = updated_fstab_path
         if self.updated_fstab_path and not (self.fstype.startswith("ext") or self.fstype == "msdos"):
             self.update_fstab_in_rootfs = True
@@ -293,7 +381,7 @@ class Partition():
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), rootfs_size * 1024)
 
-        extraopts = self.mkfs_extraopts or "-F -i 8192"
+        extraopts = self._mkfs_ext_extraopts("-F -i 8192")
 
         # use hash_seed to generate reproducible ext4 images
         (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, pseudo)
@@ -401,7 +489,7 @@ class Partition():
 
         size_str = ""
 
-        extraopts = self.mkfs_extraopts or '-S 512'
+        extraopts = self._mkdosfs_extraopts()
 
         dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
                     (label_str, self.fsuuid, size_str, extraopts, rootfs,
@@ -452,7 +540,7 @@ class Partition():
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), size * 1024)
 
-        extraopts = self.mkfs_extraopts or "-i 8192"
+        extraopts = self._mkfs_ext_extraopts("-i 8192")
 
         # use hash_seed to generate reproducible ext4 images
         (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, None)
@@ -498,7 +586,7 @@ class Partition():
 
         size_str = ""
 
-        extraopts = self.mkfs_extraopts or '-S 512'
+        extraopts = self._mkdosfs_extraopts()
 
         dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
                     (label_str, self.fsuuid, extraopts, size_str, rootfs,
@@ -559,4 +647,3 @@ class Partition():
                     logger.warn("%s Inodes (of size %d) are too small." %
                                 (get_err_str(self), size))
                 break
-
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index ad922cf..832d0e6 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -67,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
         self._image = None
         self.ptable_format = self.ks.bootloader.ptable
         self.parts = self.ks.partitions
+        self.sector_size = options.sector_size or 512
 
         # as a convenience, set source to the boot partition source
         # instead of forcing it to be set via bootloader --source
@@ -78,7 +79,7 @@ class DirectPlugin(ImagerPlugin):
         image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
         self._image = PartitionedImage(image_path, self.ptable_format, self.ks.bootloader.diskid,
                                        self.parts, self.native_sysroot,
-                                       options.extra_space)
+                                       options.extra_space, self.sector_size)
 
     def setup_workdir(self, workdir):
         if workdir:
@@ -294,15 +295,13 @@ MBR_OVERHEAD = 1
 # Overhead of the GPT partitioning scheme
 GPT_OVERHEAD = 34
 
-# Size of a sector in bytes
-SECTOR_SIZE = 512
-
 class PartitionedImage():
     """
     Partitioned image in a file.
     """
 
-    def __init__(self, path, ptable_format, disk_id, partitions, native_sysroot=None, extra_space=0):
+    def __init__(self, path, ptable_format, disk_id, partitions, native_sysroot=None, extra_space=0,
+                 sector_size=512):
         self.path = path  # Path to the image file
         self.numpart = 0  # Number of allocated partitions
         self.realpart = 0 # Number of partitions in the partition table
@@ -332,14 +331,7 @@ class PartitionedImage():
         self.partitions = partitions
         self.partimages = []
         # Size of a sector used in calculations
-        sector_size_str = get_bitbake_var('WIC_SECTOR_SIZE')
-        if sector_size_str is not None:
-            try:
-                self.sector_size = int(sector_size_str)
-            except ValueError:
-                self.sector_size = SECTOR_SIZE
-        else:
-            self.sector_size = SECTOR_SIZE
+        self.sector_size = sector_size
 
         self.native_sysroot = native_sysroot
         num_real_partitions = len([p for p in self.partitions if not p.no_table])
diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
index 430b0a4..69aa38b 100644
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
@@ -415,8 +415,9 @@ class BootimgEFIPlugin(SourcePlugin):
 
         label = part.label if part.label else "ESP"
 
-        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
-                    (label, part.fsuuid, bootimg, blocks)
+        sector_size = getattr(creator, 'sector_size', 512)
+        dosfs_cmd = "mkdosfs -v -n %s -i %s -S %d -C %s %d" % \
+                    (label, part.fsuuid, sector_size, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
         logger.debug("mkdosfs:\n%s" % (str(out)))
 
diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index a7cc5d1..1e5ec3a 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -132,7 +132,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
                 cls._do_prepare_grub(part, cr_workdir, oe_builddir,
                                 kernel_dir, rootfs_dir, native_sysroot)
             elif source_params['loader-bios'] == 'syslinux':
-                cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
+                cls._do_prepare_syslinux(part, creator, cr_workdir, bootimg_dir,
                                     kernel_dir, native_sysroot)
             else:
                 raise WicError("unrecognized bootimg_pcbios loader: %s" % source_params['loader-bios'])
@@ -142,7 +142,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         except KeyError:
             # Required by do_install_disk
             cls.loader = 'syslinux'
-            cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
+            cls._do_prepare_syslinux(part, creator, cr_workdir, bootimg_dir,
                                 kernel_dir, native_sysroot)
 
     @classmethod
@@ -240,7 +240,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def _do_prepare_syslinux(cls, part, cr_workdir, bootimg_dir,
+    def _do_prepare_syslinux(cls, part, creator, cr_workdir, bootimg_dir,
                              kernel_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
@@ -292,8 +292,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         label = part.label if part.label else "boot"
 
-        dosfs_cmd = "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
-                    (label, part.fsuuid, bootimg, blocks)
+        sector_size = getattr(creator, 'sector_size', 512)
+        dosfs_cmd = "mkdosfs -n %s -i %s -S %d -C %s %d" % \
+                    (label, part.fsuuid, sector_size, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
index fdab188..0a3ecd3 100644
--- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
@@ -367,8 +367,9 @@ class IsoImagePlugin(SourcePlugin):
 
             esp_label = source_params.get('esp_label', 'EFIimg')
 
-            dosfs_cmd = 'mkfs.vfat -n \'%s\' -S 512 -C %s %d' \
-                        % (esp_label, bootimg, blocks)
+            sector_size = getattr(creator, 'sector_size', 512)
+            dosfs_cmd = "mkfs.vfat -n '%s' -S %d -C %s %d" % \
+                        (esp_label, sector_size, bootimg, blocks)
             exec_native_cmd(dosfs_cmd, native_sysroot)
 
             mmd_cmd = "mmd -i %s ::/EFI" % bootimg
diff --git a/scripts/wic b/scripts/wic
index 9137208..a3402bf 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -103,6 +103,37 @@ class RootfsArgAction(argparse.Action):
         namespace.__dict__['rootfs_dir'][key] = rootfs_dir
 
 
+def _apply_sector_size_default(args):
+    """
+    Populate args.sector_size.
+    Prefer --sector-size if given, WIC_SECTOR_SIZE if not, otherwise fall back to 512.
+    """
+    if not hasattr(args, "sector_size"):
+        return
+
+    BB_VARS.vars_dir = args.vars_dir
+    try:
+        tmp_val = get_bitbake_var("WIC_SECTOR_SIZE", args.image_name)
+        if tmp_val:
+            try:
+                env_val = int(tmp_val)
+            except ValueError:
+                raise WicError("Invalid WIC_SECTOR_SIZE value '%s'; please provide an integer or use --sector-size." % tmp_val)
+
+            logger.warning("DEPRECATED: WIC_SECTOR_SIZE is deprecated, use the --sector-size command-line argument instead.")
+            if args.sector_size is not None:
+                logger.warning("WIC_SECTOR_SIZE (%d) and --sector-size (%d) were both provided; --sector-size used.", env_val, args.sector_size)
+            else:
+                args.sector_size = env_val
+            return
+    except:
+        pass
+
+    if args.sector_size is not None:
+        return
+    args.sector_size = 512
+
+
 def wic_create_subcommand(options, usage_str):
     """
     Command-line handling for image creation.  The real work is done
@@ -376,6 +407,8 @@ def wic_init_parser_create(subparser):
                       default="direct", help="the wic imager plugin")
     subparser.add_argument("--extra-space", type=int, dest="extra_space",
                       default=0, help="additional free disk space to add to the image")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=None,
+                      help="sector size in bytes (default: 512)")
     return
 
 
@@ -413,6 +446,8 @@ def imgtype(arg):
 def wic_init_parser_ls(subparser):
     subparser.add_argument("path", type=imgtype,
                         help="image spec: <image>[:<vfat partition>[<path>]]")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=None,
+                        help="sector size in bytes (default: 512)")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
     subparser.add_argument("-e", "--image-name", dest="image_name",
@@ -433,6 +468,8 @@ def wic_init_parser_cp(subparser):
                         help="image spec: <image>:<vfat partition>[<path>] or <file>")
     subparser.add_argument("dest",
                         help="image spec: <image>:<vfat partition>[<path>] or <file>")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=None,
+                        help="sector size in bytes (default: 512)")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
     subparser.add_argument("-e", "--image-name", dest="image_name",
@@ -445,6 +482,8 @@ def wic_init_parser_cp(subparser):
 def wic_init_parser_rm(subparser):
     subparser.add_argument("path", type=imgpathtype,
                         help="path: <image>:<vfat partition><path>")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=None,
+                        help="sector size in bytes (default: 512)")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
     subparser.add_argument("-r", dest="recursive_delete", action="store_true", default=False,
@@ -569,6 +608,8 @@ def main(argv):
     if args.debug:
         logger.setLevel(logging.DEBUG)
 
+    _apply_sector_size_default(args)
+
     if "command" in vars(args):
         if args.command == "help":
             if args.help_topic is None:
-- 
1.8.3.1


