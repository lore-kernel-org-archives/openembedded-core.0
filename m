Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F24976E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 14:21:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 07:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,433,1459839600"; d="scan'208";a="970639779"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2016 07:21:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 4E0DB6A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:08:26 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 17:17:56 +0300
Message-Id: <2c8fb8f109fed515bb20c11e4e5f617404c97ced.1465308900.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465308900.git.ed.bartosh@linux.intel.com>
References: <cover.1465308900.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1465308900.git.ed.bartosh@linux.intel.com>
References: <cover.1465308900.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 4/4] image.bbclass: prefer specialized image creation methods over chaining
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
X-List-Received-Date: Tue, 07 Jun 2016 14:21:44 -0000

From: Patrick Ohly <patrick.ohly@intel.com>

If a certain image type can be created both by applying conversion
commands to a base type as well as via a specialized command (like a
fictious IMAGE_CMD_ext4.xz, or some dedicated task, as indicated by
IMAGE_TYPES_MASKED = ext4.xz), then pick the more specialized method
and skip generating the conversion commands.

That way developers can choose between using the builtin conversion
support or re-implementing certain types, for example more efficiently
without intermediate files.

Fixes: [YOCTO #9076]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ed Bartosh <eduard.bartosh@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass       | 17 ++++++++++-------
 meta/classes/image_types.bbclass | 16 +++++++++++++---
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 47d1c9f..ebbdf06 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -326,7 +326,7 @@ python () {
             alltypes.append("debugfs_" + t)
 
     def _add_type(t):
-        baset = image_split_type(t, ctypes)[0]
+        baset = image_split_type(t, ctypes, d)[0]
         input_t = t
         if baset not in basetypes:
             basetypes[baset]= []
@@ -345,7 +345,7 @@ python () {
             if dep not in alltypes:
                 alltypes.append(dep)
             _add_type(dep)
-            basedep = image_split_type(dep, ctypes)[0]
+            basedep = image_split_type(dep, ctypes, d)[0]
             typedeps[baset].add(basedep)
 
         if baset != input_t:
@@ -396,14 +396,17 @@ python () {
         d.delVarFlag('IMAGE_CMD_' + realt, 'func')
 
         rm_tmp_images = set()
-        def gen_conversion_cmds(bt):
+        def gen_conversion_cmds(basetype, type):
+            if basetype == type:
+                # Done, no further conversions needed.
+                return
             for ctype in ctypes:
-                if bt.endswith("." + ctype):
-                    type = bt[0:-len(ctype) - 1]
+                if type.endswith("." + ctype):
+                    type = type[0:-len(ctype) - 1]
                     if type.startswith("debugfs_"):
                         type = type[8:]
                     # Create input image first.
-                    gen_conversion_cmds(type)
+                    gen_conversion_cmds(basetype, type)
                     localdata.setVar('type', type)
                     cmd = "\t" + (localdata.getVar("CONVERSION_CMD_" + ctype, True) or localdata.getVar("COMPRESS_CMD_" + ctype, True))
                     if cmd not in cmds:
@@ -418,7 +421,7 @@ python () {
 
         for type in basetypes[t]:
             # Probably t == bt, but better check explicitly, perhaps that'll change.
-            bt = image_split_type(type, ctypes)[0]
+            bt = image_split_type(type, ctypes, d)[0]
             gen_conversion_cmds(bt, type)
 
         localdata.setVar('type', realt)
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 225142b..8e79731 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -9,10 +9,20 @@ IMAGE_NAME_SUFFIX ??= ".rootfs"
 # set this value to 2048 (2MiB alignment).
 IMAGE_ROOTFS_ALIGNMENT ?= "1"
 
-def image_split_type(type, allctypes):
+def image_split_type(type, allctypes, d):
     '''Returns (basetype, set of compression types in use).'''
     basetype = type
     compressiontypes = set()
+
+    # Abort stripping the type further if "basetype" has a matching
+    # IMAGE_CMD or is a masked image type. For example, if there
+    # was a fictional IMAGE_CMD_ext4.xz which creates a compressed
+    # file directly, then we should use that instead of using
+    # IMAGE_CMD_ext4 + CONVERSION_CMD_xz.
+    if d.getVar('IMAGE_CMD_' + basetype, True) or \
+        basetype in d.getVar('IMAGE_TYPES_MASKED', True).split():
+            return (basetype, compressiontypes)
+
     for ctype in allctypes:
         if type.endswith("." + ctype):
              basetype = type[:-len("." + ctype)]
@@ -21,7 +31,7 @@ def image_split_type(type, allctypes):
 
     if basetype != type:
         # New base type itself might be generated by a conversion command.
-        basetype, newctypes = image_split_type(basetype, allctypes)
+        basetype, newctypes = image_split_type(basetype, allctypes, d)
         compressiontypes.update(newctypes)
 
     return (basetype, compressiontypes)
@@ -38,7 +48,7 @@ def image_getdepends(d):
     deps = []
     ctypes = set(d.getVar('COMPRESSIONTYPES', True).split())
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
-        basetype, compressiontypes = image_split_type(type, ctypes)
+        basetype, compressiontypes = image_split_type(type, ctypes, d)
         for ctype in compressiontypes:
             adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
         for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
-- 
2.1.4


