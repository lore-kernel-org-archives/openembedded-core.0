Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 112997845E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:42:34 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 25 Aug 2017 06:42:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,425,1498546800"; d="scan'208";a="143871674"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 25 Aug 2017 06:42:35 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0FC6458048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:42:34 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 16:41:43 +0300
Message-Id: <5765d286e638d5607ef883807dfbb499e4f1f02e.1503667857.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503667857.git.ed.bartosh@linux.intel.com>
References: <cover.1503667857.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/10] wic: implement 'wic write' command
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
X-List-Received-Date: Fri, 25 Aug 2017 13:42:34 -0000

This command writes image to the media or another file with
the possibility to expand partitions to fill free target space.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 142 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 3c1f0d3..303f323 100644
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
@@ -374,7 +513,8 @@ def wic_write(args, native_sysroot):
     """
     Write image to a target device.
     """
-    pass
+    disk = Disk(args.image, native_sysroot, ('fat', 'ext', 'swap'))
+    disk.write(args.target, args.expand)
 
 def find_canned(scripts_path, file_name):
     """
-- 
2.1.4


