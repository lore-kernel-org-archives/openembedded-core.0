Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CB4BA607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:29:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jul 2016 06:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="1003503234"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2016 06:28:58 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 754A76A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:28:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 15:51:24 +0300
Message-Id: <7e6b6521ef58b2122e44bc773d7281bb5f609055.1469623667.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1469623667.git.ed.bartosh@linux.intel.com>
References: <cover.1469623667.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1469623667.git.ed.bartosh@linux.intel.com>
References: <cover.1469623667.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v4 4/4] image.bbclass: prefer specialized image creation methods over chaining
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
X-List-Received-Date: Wed, 27 Jul 2016 13:29:04 -0000

From: Patrick Ohly <patrick.ohly@intel.com>

If a certain image type can be created both by applying conversion
commands to a base type as well as via a specialized command (like a
fictious IMAGE_CMD_ext4.xz, or some dedicated task, as indicated by
IMAGE_TYPES_MASKED = ext4.xz), then pick the more specialized method
and skip generating the conversion commands.

That way developers can choose between using the builtin conversion
support or re-implementing certain types, for example more efficiently
without intermediate files.

[YOCTO #9076]

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass       | 21 +++++++++++++--------
 meta/classes/image_types.bbclass | 16 +++++++++++++---
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 5edbca1..d497747 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -372,7 +372,7 @@ python () {
             alltypes.append("debugfs_" + t)
 
     def _add_type(t):
-        baset = image_split_type(t, ctypes)[0]
+        baset = image_split_type(t, ctypes, d)[0]
         input_t = t
         if baset not in basetypes:
             basetypes[baset]= []
@@ -391,7 +391,7 @@ python () {
             if dep not in alltypes:
                 alltypes.append(dep)
             _add_type(dep)
-            basedep = image_split_type(dep, ctypes)[0]
+            basedep = image_split_type(dep, ctypes, d)[0]
             typedeps[baset].add(basedep)
 
         if baset != input_t:
@@ -442,14 +442,17 @@ python () {
         d.delVarFlag('IMAGE_CMD_' + realt, 'func')
 
         rm_tmp_images = set()
-        def gen_conversion_cmds(bt):
+        def gen_conversion_cmds(basetype, type):
+            if basetype == type:
+                # Done, no further conversions needed.
+                return
             for ctype in ctypes:
-                if bt[bt.find('.') + 1:] == ctype:
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
@@ -462,8 +465,10 @@ python () {
                     if type not in alltypes:
                         rm_tmp_images.add(localdata.expand("${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"))
 
-        for bt in basetypes[t]:
-            gen_conversion_cmds(bt)
+        for type in basetypes[t]:
+            # Probably t == bt, but better check explicitly, perhaps that'll change.
+            bt = image_split_type(type, ctypes, d)[0]
+            gen_conversion_cmds(bt, type)
 
         localdata.setVar('type', realt)
         if t not in alltypes:
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index e632fd1..8a5346e 100644
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
     ctypes = set(d.getVar('CONVERSIONTYPES', True).split())
     for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
-        basetype, compressiontypes = image_split_type(type, ctypes)
+        basetype, compressiontypes = image_split_type(type, ctypes, d)
         for ctype in compressiontypes:
             adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype, True), deps)
         for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
-- 
2.1.4


