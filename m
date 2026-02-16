Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9966EE63F21
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 01:33:38 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10897.1771205614844635570
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 17:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i7XxwpQd;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-896f8feee14so40701196d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 17:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771205613; x=1771810413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uImekY7QWOv0eiaCvwqWfCwOF7KIhZtF7KN2ze8jGv4=;
        b=i7XxwpQdH3BXE6yr5U6/WwLTb+i3vV1mMsR3mKiI913NWAEMc33deRvn0mC1A/wwJM
         5HHqFGGFVcihlsYHhhshcdGaU71MJOg5aO+/MS00Q/cQ3fuzJfna5GeVEtx2V7iE/OFb
         xO7dm1T0M15p9TRZdC3zqRFjKiib0DW9ePAh/8/zBatJzHOUel9qnUh4HGm/xZLySkh8
         I5LiRU3PIDRGVnUOtEbYgi+rLwGqkYWhPGD5swFVf0vSsHGiVsNX3ftWDW9pC6YRRu+M
         3eLknpyJRN/i3poTM3eEI5SjBiSf4CU1uy53PiURY8nzXOH1x+fJ6ltmW05FDkq8ns9S
         meTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771205613; x=1771810413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uImekY7QWOv0eiaCvwqWfCwOF7KIhZtF7KN2ze8jGv4=;
        b=OkLV5fEB8pfpgYMWGakYvEEDDlXT4qLNog7gJLItj4vw+71ASf/1SoAMhCyMSn8XFc
         9Kng+DoZXJ6uidaJPUMHPrTcWxpDYj7w3/9SLjbdztn8z3RZKoo5DE95OwPjp/yiiLny
         LTkfpNg+mAZKHMMv0m/Ygd1ToPZjyafKaQMxHBGIfVMdXd7VCOZOPQ4HLvWKACXU09Kv
         ZEO+g1+xyHVul2Dv1xaqph8RRXFLC0aFqfvpHn1LTF62ea+L0+dPqDeyG5xKivhNQQ8w
         RzTt8JuwgmJq8opSgqSxRf7IGhKJbjE7VIbxw9lhFzk0cgQ8Y61qoaEHy+aSGLwZjnX9
         LK6w==
X-Gm-Message-State: AOJu0YyM2nWewS63FPieO7xTIMJ05SjlCoGbJUhUhquyBSDNGGzj6dvu
	Q9M10hQzYnN2fF7+TT35oUZ8192Nus5BjE8es+B1vvvxtpKprACVtEdnHzhTJyxE
X-Gm-Gg: AZuq6aLo6cmjagG/l73EK9b6ldXk1ZgAblOgRvIQ3vAIG/c9OlluKk1AgnWff7t9vpC
	0DcQc0uJqTs7wXWm9bVQUjQzD5ZT703Zn65Psd2PVwVOGz08Vpt1FFFbyBYWBCAdsGmvqk+Rz80
	GOieDRSK1RStrhkiwx5BWyd4xgJ8lsWqK+Yk0rREwUbTFgrwSHZxBNSKZFPDioc5HZgATSrViR2
	HmfgYGD38Uf/ouJ6PAk1PQlH7p8if9U6oxoCYIEP5vogu+v9oeiSWOeSuIuRgLHG92QI3+VdBKu
	zY/V4mhRU+Lg67kgs4EzCI2Zr5GW59M/26h9EbeZFY23QPERYxpXTMMR5zKFlLIfAtqwA1t8k4z
	U7YDh5b56kUj/5IP+tNr6MyLaHgrNRVmfbE6AfhTwJ3IUHANLv3KQqTj4IxYCRkNZsY5OrrvHcd
	jk23CnqX9EhnGajCAn6JpwT0g1iPMr8Z134f/4zRbqELZc0v6Ihh1vQk1QlhzRXp7gVA==
X-Received: by 2002:a05:6214:20ef:b0:895:369c:e3e5 with SMTP id 6a1803df08f44-8973628baf6mr130026356d6.64.1771205612631;
        Sun, 15 Feb 2026 17:33:32 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684bc39e6sm133146631cf.31.2026.02.15.17.33.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 17:33:30 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] wic: re-implement sector-size support
Date: Sun, 15 Feb 2026 20:33:23 -0500
Message-ID: <20260216013324.735425-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 01:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231172

The previous implementation to add variable sector-size support:
- required the variable WIC_SECTOR_SIZE either be defined in a
  configuration file or be defined in a --vars file
- this means that every invocation of "wic ls", "wic cp", or "wic rm"
  needed this variable defined (config or --vars)
- required the user to create separate *wks files for every sector size
  they wanted to use
- required the user to specify the mkfs-extraopts by hand to specify the
  correct sector size: e.g.
	bootloader --ptable gpt
	part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4096"
	part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"
- specifying --mkfs-extraopts replaces the defaults with the
  user-supplied values
- only provided details to support using variable sector-sizes with
  ext[234] filesystems
- it would not be possible to generate images with different sector
  sizes in the same build since the configuration and *wks files would
  need to change and the build re-run for each size

Update the sector-size handling so that:
- the sector-size will now be provided on the cmdline to the "wic ls",
  "wic cp", "wic rm", and "wic create" commands: default = 512
- this means the configuration and/or --vars file does not need to be
  changed in order to perform those operations on images with different
  sector sizes
- support is provided implicitly for mkdosfs and ext[234] partitions
- the user no longer needs to know and supply the sector-size magic in
  --mkfs-extraopts (thereby clobbering the other defaults)

AI-Generated: codex/gpt-5.1-codex-max
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes from v1:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py           | 39 ++++---------
 scripts/lib/wic/engine.py                     | 45 +++++++--------
 scripts/lib/wic/help.py                       | 23 +++++---
 scripts/lib/wic/partition.py                  | 55 +++++++++++++++++--
 scripts/lib/wic/plugins/imager/direct.py      | 18 ++----
 scripts/lib/wic/plugins/source/bootimg_efi.py |  5 +-
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 11 ++--
 .../wic/plugins/source/isoimage_isohybrid.py  |  5 +-
 scripts/wic                                   |  8 +++
 9 files changed, 125 insertions(+), 84 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ecaee5a29144..7ad61fa700f7 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -935,33 +935,22 @@ bootloader --ptable gpt""")
         finally:
             os.remove(wks_file)
 
-    def test_wic_sector_size(self):
-        """Test generation image sector size"""
- 
+    def test_wic_sector_size_cli(self):
+        """Test sector size handling via CLI option."""
+
         oldpath = os.environ['PATH']
         os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
 
         try:
-            # Add WIC_SECTOR_SIZE into config
-            config = 'WIC_SECTOR_SIZE = "4096"\n'\
-                     'WICVARS:append = " WIC_SECTOR_SIZE"\n'
-            self.append_config(config)
             bitbake('core-image-minimal')
 
-            # Check WIC_SECTOR_SIZE apply to bitbake variable
-            wic_sector_size_str = get_bb_var('WIC_SECTOR_SIZE', 'core-image-minimal')
-            wic_sector_size = int(wic_sector_size_str)
-            self.assertEqual(4096, wic_sector_size)
-
-            self.logger.info("Test wic_sector_size: %d \n" % wic_sector_size)
-
             with NamedTemporaryFile("w", suffix=".wks") as wks:
                 wks.writelines(
                     ['bootloader --ptable gpt\n',
-                     'part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4096"\n',
-                     'part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"\n'])
+                     'part --fstype ext4 --source rootfs --label rofs-a\n',
+                     'part --fstype ext4 --source rootfs --use-uuid\n'])
                 wks.flush()
-                cmd = "wic create %s -e core-image-minimal -o %s" % (wks.name, self.resultdir)
+                cmd = "wic create %s -e core-image-minimal -o %s --sector-size 4096" % (wks.name, self.resultdir)
                 runCmd(cmd)
                 wksname = os.path.splitext(os.path.basename(wks.name))[0]
                 images = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -969,24 +958,18 @@ bootloader --ptable gpt""")
 
             sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
             # list partitions
-            result = runCmd("wic ls %s -n %s" % (images[0], sysroot))
+            result = runCmd("wic ls %s -n %s --sector-size 4096" % (images[0], sysroot))
             self.assertEqual(3, len(result.output.split('\n')))
 
-            # verify partition size with wic
-            res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p" % (wic_sector_size, images[0]),
+            # verify partition size with parted output
+            res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m %s unit b p" % (4096, images[0]),
                          stderr=subprocess.PIPE)
 
-            # parse parted output which looks like this:
-            # BYT;\n
-            # /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:4096:4096:gpt::;\n
-            # 1:139264B:39284735B:39145472B:ext4:rofs-a:;\n
-            # 2:39284736B:78430207B:39145472B:ext4:primary:;\n
             disk_info = res.output.splitlines()[1]
-            # Check sector sizes
             sector_size_logical = int(disk_info.split(":")[3])
             sector_size_physical = int(disk_info.split(":")[4])
-            self.assertEqual(wic_sector_size, sector_size_logical, "Logical sector size is not %d." % wic_sector_size)
-            self.assertEqual(wic_sector_size, sector_size_physical, "Physical sector size is not %d." % wic_sector_size)
+            self.assertEqual(4096, sector_size_logical, "Logical sector size is not 4096.")
+            self.assertEqual(4096, sector_size_physical, "Physical sector size is not 4096.")
 
         finally:
             os.environ['PATH'] = oldpath
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 9d596be3a723..7753f431f91d 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -224,7 +224,7 @@ def wic_list(args, scripts_path):
 
 
 class Disk:
-    def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
+    def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext'), sector_size=512):
         self.imagepath = imagepath
         self.native_sysroot = native_sysroot
         self.fstypes = fstypes
@@ -233,16 +233,7 @@ class Disk:
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
@@ -271,7 +262,7 @@ class Disk:
         if self._partitions is None:
             self._partitions = OrderedDict()
 
-            if self.sector_size is not None:
+            if self.sector_size:
                 out = exec_cmd("export PARTED_SECTOR_SIZE=%d; %s -sm %s unit B print" % \
                            (self.sector_size, self.parted, self.imagepath), True)
             else:
@@ -312,11 +303,15 @@ class Disk:
             raise WicError("Partition %s is not in the image" % pnum)
         part = self.partitions[pnum]
         # check if fstype is supported
+        # NOTE: parted is unable to identify dos-type partitions with a 4k sector-size
+        #       if the type is empty and a non-default sector size is used, assume 'fat'
+        #       fdisk identifies them without issue
+        part_fstype = part.fstype if part.fstype or self.sector_size == 512 else 'fat'
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
@@ -586,8 +581,9 @@ class Disk:
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
@@ -609,14 +605,19 @@ class Disk:
 
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
@@ -627,9 +628,9 @@ def wic_cp(args, native_sysroot):
     partitioned image.
     """
     if isinstance(args.dest, str):
-        disk = Disk(args.src.image, native_sysroot)
+        disk = Disk(args.src.image, native_sysroot, sector_size=args.sector_size)
     else:
-        disk = Disk(args.dest.image, native_sysroot)
+        disk = Disk(args.dest.image, native_sysroot, sector_size=args.sector_size)
     disk.copy(args.src, args.dest)
 
 
@@ -638,7 +639,7 @@ def wic_rm(args, native_sysroot):
     Remove files or directories from the vfat partition of
     partitioned image.
     """
-    disk = Disk(args.path.image, native_sysroot)
+    disk = Disk(args.path.image, native_sysroot, sector_size=args.sector_size)
     disk.remove(args.path.part, args.path.path, args.recursive_delete)
 
 def wic_write(args, native_sysroot):
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 6b49a67de938..5d7c40456a80 100644
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
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 8fed686e903e..df6e3271649b 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -65,6 +65,50 @@ class Partition():
 
         self.lineno = lineno
         self.source_file = ""
+        self.sector_size = 512
+
+    def _mkdosfs_extraopts(self):
+        """
+        Build mkdosfs extra options ensuring the CLI sector size is applied.
+        """
+        extraopts = self.mkfs_extraopts or ''
+        tokens = []
+        skip_next = False
+        for tok in extraopts.split():
+            if skip_next:
+                skip_next = False
+                continue
+            if tok == '-S':
+                skip_next = True
+                continue
+            if tok.startswith('-S'):
+                continue
+            tokens.append(tok)
+        tokens.extend(['-S', str(self.sector_size)])
+        return ' '.join(tokens).strip()
+
+    def _mkfs_ext_extraopts(self, base_opts):
+        """
+        Build mkfs.ext* extra options ensuring the CLI sector size is applied.
+        """
+        extraopts = self.mkfs_extraopts or base_opts
+        # Only add an explicit block size when a non-default sector size is requested.
+        if self.sector_size and self.sector_size != 512:
+            tokens = []
+            skip_next = False
+            for tok in extraopts.split():
+                if skip_next:
+                    skip_next = False
+                    continue
+                if tok == '-b':
+                    skip_next = True
+                    continue
+                if tok.startswith('-b'):
+                    continue
+                tokens.append(tok)
+            tokens.extend(['-b', str(self.sector_size)])
+            return ' '.join(tokens).strip()
+        return extraopts
 
     def get_extra_block_count(self, current_blocks):
         """
@@ -138,6 +182,8 @@ class Partition():
         Prepare content for individual partitions, depending on
         partition command parameters.
         """
+        # capture the sector size requested on the CLI for mkdosfs invocations
+        self.sector_size = getattr(creator, 'sector_size', 512) or 512
         self.updated_fstab_path = updated_fstab_path
         if self.updated_fstab_path and not (self.fstype.startswith("ext") or self.fstype == "msdos"):
             self.update_fstab_in_rootfs = True
@@ -293,7 +339,7 @@ class Partition():
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), rootfs_size * 1024)
 
-        extraopts = self.mkfs_extraopts or "-F -i 8192"
+        extraopts = self._mkfs_ext_extraopts("-F -i 8192")
 
         # use hash_seed to generate reproducible ext4 images
         (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, pseudo)
@@ -401,7 +447,7 @@ class Partition():
 
         size_str = ""
 
-        extraopts = self.mkfs_extraopts or '-S 512'
+        extraopts = self._mkdosfs_extraopts()
 
         dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
                     (label_str, self.fsuuid, size_str, extraopts, rootfs,
@@ -452,7 +498,7 @@ class Partition():
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), size * 1024)
 
-        extraopts = self.mkfs_extraopts or "-i 8192"
+        extraopts = self._mkfs_ext_extraopts("-i 8192")
 
         # use hash_seed to generate reproducible ext4 images
         (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, None)
@@ -498,7 +544,7 @@ class Partition():
 
         size_str = ""
 
-        extraopts = self.mkfs_extraopts or '-S 512'
+        extraopts = self._mkdosfs_extraopts()
 
         dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
                     (label_str, self.fsuuid, extraopts, size_str, rootfs,
@@ -559,4 +605,3 @@ class Partition():
                     logger.warn("%s Inodes (of size %d) are too small." %
                                 (get_err_str(self), size))
                 break
-
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index ad922cfbf122..3adc6eee6280 100644
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
+        self.sector_size = sector_size or 512
 
         self.native_sysroot = native_sysroot
         num_real_partitions = len([p for p in self.partitions if not p.no_table])
diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
index 430b0a4b023a..864d6898fc9d 100644
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
@@ -415,8 +415,9 @@ class BootimgEFIPlugin(SourcePlugin):
 
         label = part.label if part.label else "ESP"
 
-        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
-                    (label, part.fsuuid, bootimg, blocks)
+        sector_size = getattr(creator, 'sector_size', 512) or 512
+        dosfs_cmd = "mkdosfs -v -n %s -i %s -S %d -C %s %d" % \
+                    (label, part.fsuuid, sector_size, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
         logger.debug("mkdosfs:\n%s" % (str(out)))
 
diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index a7cc5d12c620..32edac47fa09 100644
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
+        sector_size = getattr(creator, 'sector_size', 512) or 512
+        dosfs_cmd = "mkdosfs -n %s -i %s -S %d -C %s %d" % \
+                    (label, part.fsuuid, sector_size, bootimg, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
index fdab188db1f8..9195ef5f3184 100644
--- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
@@ -367,8 +367,9 @@ class IsoImagePlugin(SourcePlugin):
 
             esp_label = source_params.get('esp_label', 'EFIimg')
 
-            dosfs_cmd = 'mkfs.vfat -n \'%s\' -S 512 -C %s %d' \
-                        % (esp_label, bootimg, blocks)
+            sector_size = getattr(creator, 'sector_size', 512) or 512
+            dosfs_cmd = "mkfs.vfat -n '%s' -S %d -C %s %d" % \
+                        (esp_label, sector_size, bootimg, blocks)
             exec_native_cmd(dosfs_cmd, native_sysroot)
 
             mmd_cmd = "mmd -i %s ::/EFI" % bootimg
diff --git a/scripts/wic b/scripts/wic
index 9137208f5e8f..0cef84ef630c 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -376,6 +376,8 @@ def wic_init_parser_create(subparser):
                       default="direct", help="the wic imager plugin")
     subparser.add_argument("--extra-space", type=int, dest="extra_space",
                       default=0, help="additional free disk space to add to the image")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=512,
+                      help="sector size in bytes (default: 512)")
     return
 
 
@@ -413,6 +415,8 @@ def imgtype(arg):
 def wic_init_parser_ls(subparser):
     subparser.add_argument("path", type=imgtype,
                         help="image spec: <image>[:<vfat partition>[<path>]]")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=512,
+                        help="sector size in bytes (default: 512)")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
     subparser.add_argument("-e", "--image-name", dest="image_name",
@@ -433,6 +437,8 @@ def wic_init_parser_cp(subparser):
                         help="image spec: <image>:<vfat partition>[<path>] or <file>")
     subparser.add_argument("dest",
                         help="image spec: <image>:<vfat partition>[<path>] or <file>")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=512,
+                        help="sector size in bytes (default: 512)")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
     subparser.add_argument("-e", "--image-name", dest="image_name",
@@ -445,6 +451,8 @@ def wic_init_parser_cp(subparser):
 def wic_init_parser_rm(subparser):
     subparser.add_argument("path", type=imgpathtype,
                         help="path: <image>:<vfat partition><path>")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=512,
+                        help="sector size in bytes (default: 512)")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
     subparser.add_argument("-r", dest="recursive_delete", action="store_true", default=False,
-- 
2.51.0


