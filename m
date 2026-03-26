Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2484109E534
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 00:12:04 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37004.1774483919835257958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 17:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DKpD+oyr;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506aa685d62so2827571cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 17:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774483918; x=1775088718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6Smqfxb3R0hs0mFM23KQEI9nBFvrdBsVLq4SzornlI=;
        b=DKpD+oyrCwLlpoR2NIw+VbaxRxp9QHyMQa4MKJxEo+BFnbOCkchQI++Um/213OV/WD
         X1KObtAtaI0baJFxqQEfL19pdvi2MPq/FfDwZVal5UDcZpaCMQ7m1jdcvOh3LzCB5cV2
         nUJyH12gqdr0jCoze5H9U23gz64o01YPrTRyDDQMxonOqPjgp7hqYJU/ljNIQpeEUj7Q
         z2JgQlHWgrK7f1U7FcJ8Pj8ummUc5vv6zUtfwepPJUU6F+8w2X0YArE8g6x1oQxWhsq7
         Ql3HNsmqTsxENHD/S4aCStM2hZWGkj5gUPIKMvmMcq931LZCznx1+0t2NrVXltzk9JIG
         Z6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774483918; x=1775088718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6Smqfxb3R0hs0mFM23KQEI9nBFvrdBsVLq4SzornlI=;
        b=iFF7BG0IbtqVH16YkR6e21AskSY2coV0fv9AeQlSDaeAC5+VLH0XT8cMAnudF7YBMP
         S/yAzUY7nVfBE1K7PUYrKnHEg76S6GjDAsbVX5+6bPCa3k9yiIriVyuXV2GGpDXoOJzn
         CsU39SwVQI64mb2ETzif5iCbL8atucvPYkVIfQvGNWfwFq1R2uJg1aqW2ZD4go1A83Vk
         84IC2JzbeA45QYiSPUKkN/4838dIbgucWhgHpDcoctZIS8DhPfliqW+1IqKQn1t16R7+
         BdL051WVKS8t3aiQGiWh4tntczVmxJHBnryp96hVkiEoB1T2Pn9y3dN9ZUE1inxuc59+
         A7HQ==
X-Gm-Message-State: AOJu0YwZQxtolLqtcVP7MT8wLbNi1ie07qRoesldnGXVHSR7mbzDHj5w
	rz/SeZxCU2JFgdllNcXexFRYNN0x8iA5m7LKxycg1P0qrgIiiYuanvBId6RMjw==
X-Gm-Gg: ATEYQzzusKmoAmJwBMEQeK6FbdwT4Cq/d6ngyOJfE5BSW4jzDvHymxOOakEx3MC00TC
	eG74vOdpV9mdOLSSRikPWXAQDeZhZWI/sP9HUfAvmlZRU0S5QuvGyNi0abkRVCN7Vxxx2kd8iiO
	EmbfG6lJtX4MN0ynL0dvMxXQdolhfy3BqD3sx3waTZeImMyDgk0923DLjUiSvc3r40HFFbbt3tS
	8yrZh9StL/vgcuk4q7goYo8HhH0w14G0S7d4NyoJouNtpLa96j8RSgEyUHIG0hLztx9PkLwLQGA
	DEVi5JlCImx3YcbDY1StIhAtbtBhszDIEEw6AlRFNW4lPOWdS9XaBZfm58b10AyeK1TJibr2IMr
	7ODEeAn23oX0qN4DL4Jazf5hBu61oNgPImfZ/fBri3Ygtl7s6zrKDoNY41Ok/YeVOjihTi1ls4R
	kFSdLmtr2IyLDt4Bmy73SjRL3wMy6JkS0KiZC4qwug/C/M6DK8lkaq9pQxhrIvcCuJSw==
X-Received: by 2002:a05:622a:a6ce:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50b80ed50d4mr68298321cf.63.1774483917806;
        Wed, 25 Mar 2026 17:11:57 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b920f77dasm11638521cf.3.2026.03.25.17.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 17:11:56 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [PATCH v8 1/1] wic: re-implement sector-size support
Date: Wed, 25 Mar 2026 20:11:50 -0400
Message-ID: <20260326001150.203099-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326001150.203099-1-twoerner@gmail.com>
References: <20260326001150.203099-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 00:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233939

The previous implementation had the following limitations:
- required the variable WIC_SECTOR_SIZE either be defined in a
  configuration file or be defined in a --vars file
- this means that every invocation of "wic ls", "wic cp", or "wic rm"
  needed this variable defined (config or --vars)
- required the user to create separate *wks files for every sector size
  they wanted to use
- required the user to specify the --mkfs-extraopts by hand to specify the
  correct sector size: e.g.
	bootloader --ptable gpt
        part --fstype vfat --label emptyfat --mkfs-extraopts "-S 4096"
	part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4096"
	part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"
- it would not be possible to generate images with different sector
  sizes in the same build since the configuration and *wks files would
  need to change and the build re-run for each size

The new implementation handles the sector-size via a CLI argument, while
preserving the previously implemented variable definitions:
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
variable. The user is warned that this behavior is deprecated. If both
are given, warn the user that the cmdline argument takes precedence.

AI-Generated: codex/gpt-5.1-codex-max
Signed-off-by: Trevor Woerner <twoerner@gmail.com>

- restore environ test case, as it is still supported (but obsolete)
- revised commit message above

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
changes in v8:
- Mark Hatle stepped in to help provide advice and updates
- add back the code and test to support/allow users to specify a
  sector-size in --mkfs-extraopts, this gives the user 3 places in which
  the sector-size can be specified:
  1. cmdline
  2. --mkfs-extraopts in *.wks files
  3. WIC_SECTOR_SIZE bitbake variable/--vars file

changes in v7:
- none

changes in v6:
- many comments were expanded to provide deeper explanations
- in many places we know that sector_size will be defined (for example
  by virtue of it being an argument with a default value) therefore
  checks to make sure sector_size exists can be removed
- when processing --mkfs-extraopts for fat and ext* filesystems, error
  out if the user provides sector-size options in the wks file since
  these will conflict with sector-size settings on the cmdline or via
  WIC_SECTOR_SIZE
- clean up the logic related to warning the user if WIC_SECTOR_SIZE is
  used

changes in v5:
- fix a bug in the case where WIC_SECTOR_SIZE does not exist at all and
  is not provided neither in the environment nor a config file

changes in v4:
- allow the sector-size to be set from WIC_SECTOR_SIZE (environment or
  vars file) but mark its use deprecated, suggest the user use the
  cmdline arg instead; if both are given point out that the cmdline
  value takes precedence

changes in v3:
- none

changes in v2:
- none
---
 meta/lib/oeqa/selftest/cases/wic.py           | 78 ++++++++++++++++++-
 scripts/lib/wic/engine.py                     | 60 +++++++-------
 scripts/lib/wic/help.py                       | 23 ++++--
 scripts/lib/wic/misc.py                       |  6 ++
 scripts/lib/wic/partition.py                  | 63 +++++++++++++--
 scripts/lib/wic/plugins/imager/direct.py      | 18 ++---
 scripts/lib/wic/plugins/source/bootimg_efi.py |  5 +-
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 11 +--
 .../wic/plugins/source/isoimage_isohybrid.py  |  5 +-
 scripts/wic                                   | 41 ++++++++++
 10 files changed, 246 insertions(+), 64 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 644247684576..13c2bd684780 100644
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
index 8682ca3176c2..e12eee8b6993 100644
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
index 8fed686e903e..435d31db0c6b 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -65,6 +65,58 @@ class Partition():
 
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
+        not supplied an "-S <logical-sector-size>" option, if they
+        have not, we define "-S <logical-sector-size>" option based on
+        the value of self.sector_size.
+        """
+        extraopts = self.mkfs_extraopts
+        for token in extraopts.split():
+            if token == '-S' or (token.startswith('-S') and token[2:].isdigit()):
+                # Nothing to do, the user already supplied a value
+                return extraopts
+
+        # Supply the default based on the partitioning sector_size
+        return extraopts + " -S %d" % (self.sector_size)
+
+    def _mkfs_ext_extraopts(self, base_opts):
+        """
+        Build mkfs.ext* extra options ensuring the CLI sector size is applied.
+
+        Generate cmdline options for mkfs.ext*. Different parts of the
+        code want to provide different default sets of ext* options for
+        mkfs. But the user can provide their own options via the wks
+        file; in which case the user options completely replace the
+        in-code default options. If the user does not specify an option
+        as long as sector-size != 512 we supply an additional
+        "-b <block-size>" argument to align the filesystem with the
+        overall block-size.
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
+        for token in extraopts.split():
+            if token == '-b' or (token.startswith('-b') and token[2:].isdigit()):
+                # Nothing to do, the user already supplied a value
+                return extraopts
+
+        if self.sector_size != 512:
+            # Supply the default based on the partitioning sector_size
+            return extraopts + " -b %d" % (self.sector_size)
+        return extraopts
 
     def get_extra_block_count(self, current_blocks):
         """
@@ -138,6 +190,8 @@ class Partition():
         Prepare content for individual partitions, depending on
         partition command parameters.
         """
+        # capture the sector size requested on the CLI for mkdosfs invocations
+        self.sector_size = getattr(creator, 'sector_size', 512)
         self.updated_fstab_path = updated_fstab_path
         if self.updated_fstab_path and not (self.fstype.startswith("ext") or self.fstype == "msdos"):
             self.update_fstab_in_rootfs = True
@@ -293,7 +347,7 @@ class Partition():
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), rootfs_size * 1024)
 
-        extraopts = self.mkfs_extraopts or "-F -i 8192"
+        extraopts = self._mkfs_ext_extraopts("-F -i 8192")
 
         # use hash_seed to generate reproducible ext4 images
         (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, pseudo)
@@ -401,7 +455,7 @@ class Partition():
 
         size_str = ""
 
-        extraopts = self.mkfs_extraopts or '-S 512'
+        extraopts = self._mkdosfs_extraopts()
 
         dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
                     (label_str, self.fsuuid, size_str, extraopts, rootfs,
@@ -452,7 +506,7 @@ class Partition():
         with open(rootfs, 'w') as sparse:
             os.ftruncate(sparse.fileno(), size * 1024)
 
-        extraopts = self.mkfs_extraopts or "-i 8192"
+        extraopts = self._mkfs_ext_extraopts("-i 8192")
 
         # use hash_seed to generate reproducible ext4 images
         (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, None)
@@ -498,7 +552,7 @@ class Partition():
 
         size_str = ""
 
-        extraopts = self.mkfs_extraopts or '-S 512'
+        extraopts = self._mkdosfs_extraopts()
 
         dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
                     (label_str, self.fsuuid, extraopts, size_str, rootfs,
@@ -559,4 +613,3 @@ class Partition():
                     logger.warn("%s Inodes (of size %d) are too small." %
                                 (get_err_str(self), size))
                 break
-
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index ad922cfbf122..832d0e692818 100644
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
index 430b0a4b023a..69aa38bd5ec7 100644
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
index a7cc5d12c620..1e5ec3aa2cf3 100644
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
index fdab188db1f8..0a3ecd3424c4 100644
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
index 9137208f5e8f..a3402bffcc63 100755
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
2.51.0


