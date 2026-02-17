Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ECBE68169
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:27:25 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9224.1771324038065907858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pbtq0Op1;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8947e6ffd20so52410296d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 02:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771324036; x=1771928836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y1zD0Gu2VvSJQ/IBOhVYjg1d7aTyFf/WegzEpe6LU6U=;
        b=Pbtq0Op1X/HB+xX4WwqjPegkt38NxOJBF6G/TI13CWgjVB9NcK4XjonlE3sUnssfkI
         UwIG2DlIqsZOhUyZ8QKMKNUQIT5U2OMYJzXpJ4auSOJlfyoJ8NWHh6K3m3NIgp6Tjl9y
         SadFS3vCn3+hqg/aRH6eeamX7a/yF5+15mWwNa6erATh/2TxxFMW2RmuuRZttypLJHVP
         BjT2qHZ5YK8oXv1GjxLHonBklsfNF6XgsoaxuMi1pywG0Bj9xDb0+a8xXp7SwiMcI4UX
         DbSPUPj4Eg8lbYgo2cj3x+Y8OAx6q6j2E8UBF9keD2socZhUM6D0w0SfPbnWTfG3stvt
         cMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324036; x=1771928836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1zD0Gu2VvSJQ/IBOhVYjg1d7aTyFf/WegzEpe6LU6U=;
        b=FRxh+z+M/htIsVZloPLorMY8vAJgDhEVt7unP7y1hSwKhDqQCf2zW+bd87gZQTFPb8
         JmarklTVkuzVj/u9x8lBnFosL9b7sZel2llg5XQZL1GjaQzHRZUf7OdOcosF2OlQNmDG
         DOkQDjxKuvr//k5gPyoUsxd4oarAv5nBaSSSl2OcLRgVMfQjxu2Ze/sGrsPjAL1CVxyt
         0QO3l1vPpjq7lLpAtNkJdaBOx6FBzLdxFef6v92zF5Vd1m+TmlZ+6ObEVBBHJi2sl6P7
         XMNVXrCYeAL8rQjZZCSc9+QhI9Y7xpETxjvOGBM0aBy0l/zLuL8nZOlFKJWHoY7zTbfc
         /nYg==
X-Gm-Message-State: AOJu0Yw57uajTCCmDNAxOrCkOmgMRgH/528L9pGPWKeMDE0gGK7nuLQp
	3LSBxEjZaw5VvkmJswHueAOT8Yfle5rE/0p7oKgxfeUnk0lhWm3hP4BYU0j6cbSG
X-Gm-Gg: AZuq6aKRlOMJKtcYSoh25gekDrJSCdsxaVJBAk2JXgs5A1Tq+DDbVvOVsFy8pdDM6ID
	3EEiVO5dHPKYAAYlAMJ9YsbzDqMj9CyMIF8zDlcbQYDqTwuvz98Qhpx4cV8qvy3EVMCTKNZdGqB
	P7dFH4mRSxA2PZwEGn+CRRnIb357MwRatAtaeU7TY31k4G9egkdWpE1NKz5RZCA67dQ4CtPEj6L
	Laq8qPRuJmqfmluRraOve5ikil+b7+gZkf93j7IOZ5CX26AiTBFp4WD02uDgF/Whk5uV8THROdi
	Z7BpQl6Ay+lLY6ukG9nuz40jGWTvHwchSbCyE3i1Lgujpa/6SXIHeYcCnrWcHjRSJQVRbpqrJsJ
	Hxpp0fDyGFF8qATqSmeFg4TjRd9cGmlj+/3Qbp+yLbR5cSSnzzVcdAKw1E27bPkCODLJm8tfkv3
	VL3yo8VasVxJ/uqSNB9XUETmlLGnwvTg7AavG/3rx5idhUhIyFC2YNcP/YvAK1P1EN8TqLITSZh
	eDl
X-Received: by 2002:a05:6214:4003:b0:888:81bc:93c8 with SMTP id 6a1803df08f44-897360d3965mr190200886d6.23.1771324035515;
        Tue, 17 Feb 2026 02:27:15 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc7bbcdsm159026506d6.9.2026.02.17.02.27.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:27:14 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 1/2] wic: re-implement sector-size support
Date: Tue, 17 Feb 2026 05:27:06 -0500
Message-ID: <20260217102707.2542807-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 10:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231239

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

If the --sector-size command-line argument is not given, allow the
sector-size to be provided via the WIC_SECTOR_SIZE bitbake variable.
Warn the user whenever the WIC_SECTOR_SIZE bitbake variable is used,
mention it is deprecated, and suggest the user use the cmdline arg
instead. If both are given, warn the user that the cmdline argument
takes precedence.

AI-Generated: codex/gpt-5.1-codex-max
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes from v3:
- allow the sector-size to be set from WIC_SECTOR_SIZE (environment or
  vars file) but mark its use deprecated, suggest the user use the
  cmdline arg instead; if both are given point out that the cmdline
  value takes precedence

changes from v2:
- none

changes from v1:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py           | 39 ++++---------
 scripts/lib/wic/engine.py                     | 45 +++++++--------
 scripts/lib/wic/help.py                       | 23 +++++---
 scripts/lib/wic/misc.py                       |  6 ++
 scripts/lib/wic/partition.py                  | 55 +++++++++++++++++--
 scripts/lib/wic/plugins/imager/direct.py      | 18 ++----
 scripts/lib/wic/plugins/source/bootimg_efi.py |  5 +-
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 11 ++--
 .../wic/plugins/source/isoimage_isohybrid.py  |  5 +-
 scripts/wic                                   | 42 ++++++++++++++
 10 files changed, 165 insertions(+), 84 deletions(-)

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
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 1a7c140fa6c8..310e6367a2ad 100644
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
index 9137208f5e8f..42b17d6034f4 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -103,6 +103,38 @@ class RootfsArgAction(argparse.Action):
         namespace.__dict__['rootfs_dir'][key] = rootfs_dir
 
 
+def _apply_sector_size_default(args):
+    """
+    Populate args.sector_size.
+    Prefer --sector-size if given, WIC_SECTOR_SIZE if not, otherwise fall back to 512.
+    """
+    if not hasattr(args, "sector_size"):
+        return
+
+    env_val = None
+    BB_VARS.vars_dir = args.vars_dir
+    tmp_val = get_bitbake_var("WIC_SECTOR_SIZE", args.image_name)
+    if tmp_val:
+        try:
+            env_val = int(tmp_val)
+        except ValueError:
+            raise WicError("Invalid WIC_SECTOR_SIZE value '%s'; please provide an integer or use --sector-size." % tmp_val)
+
+    if env_val is not None and args.sector_size is not None:
+        logger.warning("WIC_SECTOR_SIZE (%d) and --sector-size (%d) were both provided; --sector-size used.", env_val, args.sector_size)
+        logger.warning("DEPRECATED: WIC_SECTOR_SIZE is deprecated and will be removed, use the --sector-size command-line argument instead.")
+        return
+    if env_val is not None and args.sector_size is None:
+        logger.warning("WIC_SECTOR_SIZE (%s) provided but --sector-size not provided; use --sector-size to avoid confusion.", env_val)
+        logger.warning("DEPRECATED: WIC_SECTOR_SIZE is deprecated and will be removed, use the --sector-size command-line argument instead.")
+        args.sector_size = env_val
+        return
+    if env_val is None and args.sector_size is not None:
+        return
+
+    args.sector_size = 512
+
+
 def wic_create_subcommand(options, usage_str):
     """
     Command-line handling for image creation.  The real work is done
@@ -376,6 +408,8 @@ def wic_init_parser_create(subparser):
                       default="direct", help="the wic imager plugin")
     subparser.add_argument("--extra-space", type=int, dest="extra_space",
                       default=0, help="additional free disk space to add to the image")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=None,
+                      help="sector size in bytes (default: 512)")
     return
 
 
@@ -413,6 +447,8 @@ def imgtype(arg):
 def wic_init_parser_ls(subparser):
     subparser.add_argument("path", type=imgtype,
                         help="image spec: <image>[:<vfat partition>[<path>]]")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=None,
+                        help="sector size in bytes (default: 512)")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
     subparser.add_argument("-e", "--image-name", dest="image_name",
@@ -433,6 +469,8 @@ def wic_init_parser_cp(subparser):
                         help="image spec: <image>:<vfat partition>[<path>] or <file>")
     subparser.add_argument("dest",
                         help="image spec: <image>:<vfat partition>[<path>] or <file>")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=None,
+                        help="sector size in bytes (default: 512)")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
     subparser.add_argument("-e", "--image-name", dest="image_name",
@@ -445,6 +483,8 @@ def wic_init_parser_cp(subparser):
 def wic_init_parser_rm(subparser):
     subparser.add_argument("path", type=imgpathtype,
                         help="path: <image>:<vfat partition><path>")
+    subparser.add_argument("--sector-size", dest="sector_size", type=int, default=None,
+                        help="sector size in bytes (default: 512)")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
     subparser.add_argument("-r", dest="recursive_delete", action="store_true", default=False,
@@ -569,6 +609,8 @@ def main(argv):
     if args.debug:
         logger.setLevel(logging.DEBUG)
 
+    _apply_sector_size_default(args)
+
     if "command" in vars(args):
         if args.command == "help":
             if args.help_topic is None:
-- 
2.51.0


