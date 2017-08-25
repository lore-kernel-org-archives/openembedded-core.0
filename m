Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 14286784AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 20:13:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Aug 2017 13:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,426,1498546800"; d="scan'208";a="128303988"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2017 13:13:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6BD1758048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:13:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 23:12:27 +0300
Message-Id: <ca4ee516ba1e788f950a4fec1441eaf029f97ff0.1503691753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503691753.git.ed.bartosh@linux.intel.com>
References: <cover.1503691753.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 6/8] wic: implement 'wic write' command
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Aug 2017 20:13:05 -0000

This command writes image to the media or another file with
the possibility to expand partitions to fill free target space.

[YOCTO #11278]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 146 ++++++++++++++++++++++++++++++++++++++++++++++
 scripts/lib/wic/help.py   |  40 +++++++++++++
 scripts/wic               |  55 +++++++++++++++++
 3 files changed, 241 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 4ffb08d..303f323 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -31,6 +31,8 @@
 import logging
 import os
 import tempfile
+import json
+import subprocess
 
 from collections import namedtuple, OrderedDict
 from distutils.spawn import find_executable
@@ -340,6 +342,143 @@ class Disk:
                 raise err
         self._put_part_image(pnum)
 
+    def write(self, target, expand):
+        """Write disk image to the media or file."""
+        def write_sfdisk_script(outf, parts):
+            for key, val in parts['partitiontable'].items():
+                if key in ("partitions", "device", "firstlba", "lastlba"):
+                    continue
+                if key == "id":
+                    key = "label-id"
+                outf.write("{}: {}\n".format(key, val))
+            outf.write("\n")
+            for part in parts['partitiontable']['partitions']:
+                line = ''
+                for name in ('attrs', 'name', 'size', 'type', 'uuid'):
+                    if name == 'size' and part['type'] == 'f':
+                        # don't write size for extended partition
+                        continue
+                    val = part.get(name)
+                    if val:
+                        line += '{}={}, '.format(name, val)
+                if line:
+                    line = line[:-2] # strip ', '
+                if part.get('bootable'):
+                    line += ' ,bootable'
+                outf.write("{}\n".format(line))
+            outf.flush()
+
+        def read_ptable(path):
+            out = exec_cmd("{} -dJ {}".format(self.sfdisk, path))
+            return json.loads(out)
+
+        def write_ptable(parts, target):
+            with tempfile.NamedTemporaryFile(prefix="wic-sfdisk-", mode='w') as outf:
+                write_sfdisk_script(outf, parts)
+                cmd = "{} --no-reread {} < {} 2>/dev/null".format(self.sfdisk, target, outf.name)
+                try:
+                    subprocess.check_output(cmd, shell=True)
+                except subprocess.CalledProcessError as err:
+                    raise WicError("Can't run '{}' command: {}".format(cmd, err))
+
+        if expand is None:
+            sparse_copy(self.imagepath, target)
+        else:
+            # copy first sectors that may contain bootloader
+            sparse_copy(self.imagepath, target, length=2048 * self._lsector_size)
+
+            # copy source partition table to the target
+            parts = read_ptable(self.imagepath)
+            write_ptable(parts, target)
+
+            # get size of unpartitioned space
+            free = None
+            for line in exec_cmd("{} -F {}".format(self.sfdisk, target)).splitlines():
+                if line.startswith("Unpartitioned space ") and line.endswith("sectors"):
+                    free = int(line.split()[-2])
+            if free is None:
+                raise WicError("Can't get size of unpartitioned space")
+
+            # calculate expanded partitions sizes
+            sizes = {}
+            for num, part in enumerate(parts['partitiontable']['partitions'], 1):
+                if num in expand:
+                    if expand[num] != 0: # don't resize partition if size is set to 0
+                        sectors = expand[num] // self._lsector_size
+                        free -= sectors - part['size']
+                        part['size'] = sectors
+                        sizes[num] = sectors
+                elif part['type'] != 'f':
+                    sizes[num] = -1
+
+            for num, part in enumerate(parts['partitiontable']['partitions'], 1):
+                if sizes.get(num) == -1:
+                    part['size'] += free // len(sizes)
+
+            # write resized partition table to the target
+            write_ptable(parts, target)
+
+            # read resized partition table
+            parts = read_ptable(target)
+
+            # copy partitions content
+            for num, part in enumerate(parts['partitiontable']['partitions'], 1):
+                pnum = str(num)
+                fstype = self.partitions[pnum].fstype
+
+                # copy unchanged partition
+                if part['size'] == self.partitions[pnum].size // self._lsector_size:
+                    logger.info("copying unchanged partition {}".format(pnum))
+                    sparse_copy(self._get_part_image(pnum), target, seek=part['start'] * self._lsector_size)
+                    continue
+
+                # resize or re-create partitions
+                if fstype.startswith('ext') or fstype.startswith('fat') or \
+                   fstype.startswith('linux-swap'):
+
+                    partfname = None
+                    with tempfile.NamedTemporaryFile(prefix="wic-part{}-".format(pnum)) as partf:
+                        partfname = partf.name
+
+                    if fstype.startswith('ext'):
+                        logger.info("resizing ext partition {}".format(pnum))
+                        partimg = self._get_part_image(pnum)
+                        sparse_copy(partimg, partfname)
+                        exec_cmd("{} -pf {}".format(self.e2fsck, partfname))
+                        exec_cmd("{} {} {}s".format(\
+                                 self.resize2fs, partfname, part['size']))
+                    elif fstype.startswith('fat'):
+                        logger.info("copying content of the fat partition {}".format(pnum))
+                        with tempfile.TemporaryDirectory(prefix='wic-fatdir-') as tmpdir:
+                            # copy content to the temporary directory
+                            cmd = "{} -snompi {} :: {}".format(self.mcopy,
+                                                               self._get_part_image(pnum),
+                                                               tmpdir)
+                            exec_cmd(cmd)
+                            # create new msdos partition
+                            label = part.get("name")
+                            label_str = "-n {}".format(label) if label else ''
+
+                            cmd = "{} {} -C {} {}".format(self.mkdosfs, label_str, partfname,
+                                                          part['size'])
+                            exec_cmd(cmd)
+                            # copy content from the temporary directory to the new partition
+                            cmd = "{} -snompi {} {}/* ::".format(self.mcopy, partfname, tmpdir)
+                            exec_cmd(cmd, as_shell=True)
+                    elif fstype.startswith('linux-swap'):
+                        logger.info("creating swap partition {}".format(pnum))
+                        label = part.get("name")
+                        label_str = "-L {}".format(label) if label else ''
+                        uuid = part.get("uuid")
+                        uuid_str = "-U {}".format(uuid) if uuid else ''
+                        with open(partfname, 'w') as sparse:
+                            os.ftruncate(sparse.fileno(), part['size'] * self._lsector_size)
+                        exec_cmd("{} {} {} {}".format(self.mkswap, label_str, uuid_str, partfname))
+                    sparse_copy(partfname, target, seek=part['start'] * self._lsector_size)
+                    os.unlink(partfname)
+                elif part['type'] != 'f':
+                    logger.warn("skipping partition {}: unsupported fstype {}".format(pnum, fstype))
+
 def wic_ls(args, native_sysroot):
     """List contents of partitioned image or vfat partition."""
     disk = Disk(args.path.image, native_sysroot)
@@ -370,6 +509,13 @@ def wic_rm(args, native_sysroot):
     disk = Disk(args.path.image, native_sysroot)
     disk.remove(args.path.part, args.path.path)
 
+def wic_write(args, native_sysroot):
+    """
+    Write image to a target device.
+    """
+    disk = Disk(args.image, native_sysroot, ('fat', 'ext', 'swap'))
+    disk.write(args.target, args.expand)
+
 def find_canned(scripts_path, file_name):
     """
     Find a file either by its path or by name in the canned files dir.
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 99912cd..ccd3382 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -468,6 +468,46 @@ DESCRIPTION
     containing the tools(parted and mtools) to use.
 """
 
+wic_write_usage = """
+
+ Write image to a device
+
+ usage: wic write <image> <target device> [--expand [rules]] [--native-sysroot <path>]
+
+ This command writes wic image to a target device (USB stick, SD card etc).
+
+ See 'wic help write' for more detailed instructions.
+
+"""
+
+wic_write_help = """
+
+NAME
+    wic write - write wic image to a device
+
+SYNOPSIS
+    wic write <image> <target>
+    wic write <image> <target> --expand auto
+    wic write <image> <target> --expand 1:100M-2:300M
+    wic write <image> <target> --native-sysroot <path>
+
+DESCRIPTION
+    This command writes wic image to a target device (USB stick, SD card etc)
+
+        $ wic write ./tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic /dev/sdb
+
+    The --expand option is used to resize image partitions.
+    --expand auto expands partitions to occupy all free space available on the target device.
+    It's also possible to specify expansion rules in a format
+    <partition>:<size>[-<partition>:<size>...] for one or more partitions.
+    Specifying size 0 will keep partition unmodified.
+    Note: Resizing boot partition can result in non-bootable image for non-EFI images. It is
+    recommended to use size 0 for boot partition to keep image bootable.
+
+    The --native-sysroot option is used to specify the path to the native sysroot
+    containing the tools(parted, resize2fs) to use.
+"""
+
 wic_plugins_help = """
 
 NAME
diff --git a/scripts/wic b/scripts/wic
index 02bc82c..592a0e4 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -257,6 +257,13 @@ def wic_rm_subcommand(args, usage_str):
     """
     engine.wic_rm(args, args.native_sysroot)
 
+def wic_write_subcommand(args, usage_str):
+    """
+    Command-line handling for writing images.
+    The real work is done by engine.wic_write()
+    """
+    engine.wic_write(args, args.native_sysroot)
+
 def wic_help_subcommand(args, usage_str):
     """
     Command-line handling for help subcommand to keep the current
@@ -298,6 +305,9 @@ helptopics = {
     "rm":        [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_rm_help],
+    "write":     [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_write_help],
     "list":      [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_list_help]
@@ -397,6 +407,47 @@ def wic_init_parser_rm(subparser):
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
 
+def expandtype(rules):
+    """
+    Custom type for ArgumentParser
+    Converts expand rules to the dictionary {<partition>: size}
+    """
+    if rules == 'auto':
+        return {}
+    result = {}
+    for rule in rules.split('-'):
+        try:
+            part, size = rule.split(':')
+        except ValueError:
+            raise argparse.ArgumentTypeError("Incorrect rule format: %s" % rule)
+
+        if not part.isdigit():
+            raise argparse.ArgumentTypeError("Rule '%s': partition number must be integer" % rule)
+
+        # validate size
+        multiplier = 1
+        for suffix, mult in [('K', 1024), ('M', 1024 * 1024), ('G', 1024 * 1024 * 1024)]:
+            if size.upper().endswith(suffix):
+                multiplier = mult
+                size = size[:-1]
+                break
+        if not size.isdigit():
+            raise argparse.ArgumentTypeError("Rule '%s': size must be integer" % rule)
+
+        result[int(part)] = int(size) * multiplier
+
+    return result
+
+def wic_init_parser_write(subparser):
+    subparser.add_argument("image",
+                        help="path to the wic image")
+    subparser.add_argument("target",
+                        help="target file or device")
+    subparser.add_argument("-e", "--expand", type=expandtype,
+                        help="expand rules: auto or <partition>:<size>[,<partition>:<size>]")
+    subparser.add_argument("-n", "--native-sysroot",
+                        help="path to the native sysroot containing the tools")
+
 def wic_init_parser_help(subparser):
     helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
     for helptopic in helptopics:
@@ -425,6 +476,10 @@ subcommands = {
                   hlp.wic_rm_usage,
                   hlp.wic_rm_help,
                   wic_init_parser_rm],
+    "write":     [wic_write_subcommand,
+                  hlp.wic_write_usage,
+                  hlp.wic_write_help,
+                  wic_init_parser_write],
     "help":      [wic_help_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_help_help,
-- 
2.1.4


