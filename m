Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6136EF96
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:50:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2014 05:49:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,501,1389772800"; d="scan'208";a="485189768"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2014 05:49:49 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2014 15:49:44 +0200
Message-Id: <e7feddd1dafc5eb02b80b8d43aca504b17151e5c.1392731055.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392731055.git.laurentiu.palcu@intel.com>
References: <cover.1392731055.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392731055.git.laurentiu.palcu@intel.com>
References: <cover.1392731055.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] lib/oe/image.py: add image dependency mechanism
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
X-List-Received-Date: Tue, 18 Feb 2014 13:50:14 -0000

This commit adds a dependency mechanism to image creation, so that we can
split the images creation execution in groups, that can be executed in
parallel, having the dependencies satisfied in the same time. The old
code didn't need this since everything was serialized.

Technically, it adds a dependency graph topological sort class that the
main Image class can use to sort out the dependencies.

Images that have dependencies have to declare them using the NEW
IMAGE_TYPEDEP variable, like in the example below:

For:
IMAGE_FSTYPES = "i1 i2 i3 i4 i5"
IMAGE_TYPEDEP_i4 = "i2"
IMAGE_TYPEDEP_i5 = "i6 i4"
IMAGE_TYPEDEP_i6 = "i7"
IMAGE_TYPEDEP_i7 = "i2"

We'll get the following image groups, sorted out by their dependencies:

[['i1', 'i3', 'i2'], ['i4', 'i7'], ['i6'], ['i5']]

The algorithm can probably be optimized but, given the small size of the
graphs, it'll do.

[YOCTO #5830]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/image.py |  282 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 191 insertions(+), 91 deletions(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index c15296f..488683e 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -19,9 +19,124 @@ def generate_image(arg):
     return None
 
 
-class Image(object):
+"""
+This class will help compute IMAGE_FSTYPE dependencies and group them in batches
+that can be executed in parallel.
+
+The next example is for illustration purposes, highly unlikely to happen in real life.
+It's just one of the test cases I used to test the algorithm:
+
+For:
+IMAGE_FSTYPES = "i1 i2 i3 i4 i5"
+IMAGE_TYPEDEP_i4 = "i2"
+IMAGE_TYPEDEP_i5 = "i6 i4"
+IMAGE_TYPEDEP_i6 = "i7"
+IMAGE_TYPEDEP_i7 = "i2"
+
+We get the following list of batches that can be executed in parallel, having the
+dependencies satisfied:
+
+[['i1', 'i3', 'i2'], ['i4', 'i7'], ['i6'], ['i5']]
+"""
+class ImageDepGraph(object):
     def __init__(self, d):
         self.d = d
+        self.graph = dict()
+        self.deps_array = dict()
+
+    def _construct_dep_graph(self, image_fstypes):
+        graph = dict()
+
+        def add_node(node):
+            deps = (self.d.getVar('IMAGE_TYPEDEP_' + node, True) or "")
+            if deps != "":
+                graph[node] = deps
+
+                for dep in deps.split():
+                    if not dep in graph:
+                        add_node(dep)
+            else:
+                graph[node] = ""
+
+        for fstype in image_fstypes:
+            add_node(fstype)
+
+        return graph
+
+    def _clean_graph(self):
+        # Live and VMDK images will be processed via inheriting
+        # bbclass and does not get processed here. Remove them from the fstypes
+        # graph. Their dependencies are already added, so no worries here.
+        remove_list = (self.d.getVar('IMAGE_TYPES_MASKED', True) or "").split()
+
+        for item in remove_list:
+            self.graph.pop(item, None)
+
+    def _compute_dependencies(self):
+        """
+        returns dict object of nodes with [no_of_depends_on, no_of_depended_by]
+        for each node
+        """
+        deps_array = dict()
+        for node in self.graph:
+            deps_array[node] = [0, 0]
+
+        for node in self.graph:
+            deps = self.graph[node].split()
+            deps_array[node][0] += len(deps)
+            for dep in deps:
+                deps_array[dep][1] += 1
+
+        return deps_array
+
+    def _sort_graph(self):
+        sorted_list = []
+        group = []
+        for node in self.graph:
+            if node not in self.deps_array:
+                continue
+
+            depends_on = self.deps_array[node][0]
+
+            if depends_on == 0:
+                group.append(node)
+
+        if len(group) == 0 and len(self.deps_array) != 0:
+            bb.fatal("possible fstype circular dependency...")
+
+        sorted_list.append(group)
+
+        # remove added nodes from deps_array
+        for item in group:
+            for node in self.graph:
+                if item in self.graph[node]:
+                    self.deps_array[node][0] -= 1
+
+            self.deps_array.pop(item, None)
+
+        if len(self.deps_array):
+            # recursive call, to find the next group
+            sorted_list += self._sort_graph()
+
+        return sorted_list
+
+    def group_fstypes(self, image_fstypes):
+        self.graph = self._construct_dep_graph(image_fstypes)
+
+        self._clean_graph()
+
+        self.deps_array = self._compute_dependencies()
+
+        alltypes = [node for node in self.graph]
+
+        return (alltypes, self._sort_graph())
+
+
+class Image(ImageDepGraph):
+    def __init__(self, d):
+        self.d = d
+
+        super(Image, self).__init__(d)
 
     def _get_rootfs_size(self):
         """compute the rootfs size"""
@@ -82,66 +197,44 @@ class Image(object):
 
                         os.remove(img)
 
+    """
+    This function will just filter out the compressed image types from the
+    fstype groups returning a (filtered_fstype_groups, cimages) tuple.
+    """
+    def _filter_out_commpressed(self, fstype_groups):
+        ctypes = self.d.getVar('COMPRESSIONTYPES', True).split()
+        cimages = {}
+
+        filtered_groups = []
+        for group in fstype_groups:
+            filtered_group = []
+            for type in group:
+                basetype = None
+                for ctype in ctypes:
+                    if type.endswith("." + ctype):
+                        basetype = type[:-len("." + ctype)]
+                        if basetype not in filtered_group:
+                            filtered_group.append(basetype)
+                        if basetype not in cimages:
+                            cimages[basetype] = []
+                        if ctype not in cimages[basetype]:
+                            cimages[basetype].append(ctype)
+                        break
+                if not basetype and type not in filtered_group:
+                    filtered_group.append(type)
+
+            filtered_groups.append(filtered_group)
+
+        return (filtered_groups, cimages)
+
     def _get_image_types(self):
         """returns a (types, cimages) tuple"""
 
-        alltypes = self.d.getVar('IMAGE_FSTYPES', True).split()
-        types = []
-        ctypes = self.d.getVar('COMPRESSIONTYPES', True).split()
-        cimages = {}
+        alltypes, fstype_groups = self.group_fstypes(self.d.getVar('IMAGE_FSTYPES', True).split())
 
-        # Image type b depends on a having been generated first
-        def addtypedepends(a, b):
-            if a in alltypes:
-                alltypes.remove(a)
-                if b not in alltypes:
-                    alltypes.append(b)
-                alltypes.append(a)
-
-        # The elf image depends on the cpio.gz image already having
-        # been created, so we add that explicit ordering here.
-        addtypedepends("elf", "cpio.gz")
-
-        # Filter out all the compressed images from alltypes
-        for type in alltypes:
-            basetype = None
-            for ctype in ctypes:
-                if type.endswith("." + ctype):
-                    basetype = type[:-len("." + ctype)]
-                    if basetype not in types:
-                        types.append(basetype)
-                    if basetype not in cimages:
-                        cimages[basetype] = []
-                    if ctype not in cimages[basetype]:
-                        cimages[basetype].append(ctype)
-                    break
-            if not basetype and type not in types:
-                types.append(type)
+        filtered_groups, cimages = self._filter_out_commpressed(fstype_groups)
 
-        # Live and VMDK images will be processed via inheriting
-        # bbclass and does not get processed here.
-        # vmdk depend on live images also depend on ext3 so ensure its present
-        # Note: we need to ensure ext3 is in alltypes, otherwise, subimages may
-        # not contain ext3 and the .rootfs.ext3 file won't be created.
-        if "vmdk" in types:
-            if "ext3" not in types:
-                types.append("ext3")
-            if "ext3" not in alltypes:
-                alltypes.append("ext3")
-            types.remove("vmdk")
-        if "live" in types or "iso" in types or "hddimg" in types:
-            if "ext3" not in types:
-                types.append("ext3")
-            if "ext3" not in alltypes:
-                alltypes.append("ext3")
-            if "live" in types:
-                types.remove("live")
-            if "iso" in types:
-                types.remove("iso")
-            if "hddimg" in types:
-                types.remove("hddimg")
-
-        return (alltypes, types, cimages)
+        return (alltypes, filtered_groups, cimages)
 
     def _write_script(self, type, cmds):
         tempdir = self.d.getVar('T', True)
@@ -164,36 +257,42 @@ class Image(object):
     def _get_imagecmds(self):
         old_overrides = self.d.getVar('OVERRIDES', 0)
 
-        alltypes, types, cimages = self._get_image_types()
+        alltypes, fstype_groups, cimages = self._get_image_types()
 
-        image_cmds = []
-        for type in types:
-            cmds = []
-            subimages = []
+        image_cmd_groups = []
 
-            localdata = bb.data.createCopy(self.d)
-            localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overrides))
-            bb.data.update_data(localdata)
-            localdata.setVar('type', type)
+        bb.note("The image creation groups are: %s" % str(fstype_groups))
+        for fstype_group in fstype_groups:
+            image_cmds = []
+            for type in fstype_group:
+                cmds = []
+                subimages = []
 
-            cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
-            cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
+                localdata = bb.data.createCopy(self.d)
+                localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overrides))
+                bb.data.update_data(localdata)
+                localdata.setVar('type', type)
 
-            if type in cimages:
-                for ctype in cimages[type]:
-                    cmds.append("\t" + localdata.getVar("COMPRESS_CMD_" + ctype, True))
-                    subimages.append(type + "." + ctype)
+                cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
+                cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
 
-            if type not in alltypes:
-                cmds.append(localdata.expand("\trm ${IMAGE_NAME}.rootfs.${type}"))
-            else:
-                subimages.append(type)
+                if type in cimages:
+                    for ctype in cimages[type]:
+                        cmds.append("\t" + localdata.getVar("COMPRESS_CMD_" + ctype, True))
+                        subimages.append(type + "." + ctype)
+
+                if type not in alltypes:
+                    cmds.append(localdata.expand("\trm ${IMAGE_NAME}.rootfs.${type}"))
+                else:
+                    subimages.append(type)
+
+                script_name = self._write_script(type, cmds)
 
-            script_name = self._write_script(type, cmds)
+                image_cmds.append((type, subimages, script_name))
 
-            image_cmds.append((type, subimages, script_name))
+            image_cmd_groups.append(image_cmds)
 
-        return image_cmds
+        return image_cmd_groups
 
     def create(self):
         bb.note("###### Generate images #######")
@@ -204,22 +303,23 @@ class Image(object):
 
         self._remove_old_symlinks()
 
-        image_cmds = self._get_imagecmds()
+        image_cmd_groups = self._get_imagecmds()
 
-        # create the images in parallel
-        nproc = multiprocessing.cpu_count()
-        pool = bb.utils.multiprocessingpool(nproc)
-        results = list(pool.imap(generate_image, image_cmds))
-        pool.close()
-        pool.join()
+        for image_cmds in image_cmd_groups:
+            # create the images in parallel
+            nproc = multiprocessing.cpu_count()
+            pool = bb.utils.multiprocessingpool(nproc)
+            results = list(pool.imap(generate_image, image_cmds))
+            pool.close()
+            pool.join()
 
-        for result in results:
-            if result is not None:
-                bb.fatal(result)
+            for result in results:
+                if result is not None:
+                    bb.fatal(result)
 
-        for image_type, subimages, script in image_cmds:
-            bb.note("Creating symlinks for %s image ..." % image_type)
-            self._create_symlinks(subimages)
+            for image_type, subimages, script in image_cmds:
+                bb.note("Creating symlinks for %s image ..." % image_type)
+                self._create_symlinks(subimages)
 
         execute_pre_post_process(self.d, post_process_cmds)
 
-- 
1.7.9.5


