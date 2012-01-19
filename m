Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rnpdl-0002GJ-09
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 11:54:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2012 02:32:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113934464"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.198])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2012 02:32:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 10:32:09 +0000
Message-Id: <8d032f5a699276899327fcb4bd04bedf96b9b53a.1326968802.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326968802.git.paul.eggleton@linux.intel.com>
References: <cover.1326968802.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326968802.git.paul.eggleton@linux.intel.com>
References: <cover.1326968802.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] buildhistory: record additional image info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2012 10:54:46 -0000

Record some additional information about images - the uncompressed size
of the final image as well as the values of various variables that may
have influenced its contents. This is recorded in a machine-readable
"image-info.txt" file similar in structure to the package history files.

Also add some code to analyse changes to these values. (Most of the
variable values aren't monitored directly but will be used as contextual
information when they change at the same time as the content of the
image changing.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass    |   18 ++++++++++++
 meta/lib/oe/buildhistory_analysis.py |   51 +++++++++++++++++++--------------
 2 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 34cc297..69a9d02 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -312,6 +312,14 @@ buildhistory_get_imageinfo() {
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
 	( cd ${IMAGE_ROOTFS} && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' > ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt )
 
+	# Record some machine-readable meta-information about the image
+	echo -n > ${BUILDHISTORY_DIR_IMAGE}/image-info.txt
+	cat >> ${BUILDHISTORY_DIR_IMAGE}/image-info.txt <<END
+${@buildhistory_get_imagevars(d)}
+END
+	imagesize=`du -ks ${IMAGE_ROOTFS} | awk '{ print $1 }'`
+	echo "IMAGESIZE = $imagesize" >> ${BUILDHISTORY_DIR_IMAGE}/image-info.txt
+
 	# Add some configuration information
 	echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO} ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id
 
@@ -330,6 +338,16 @@ def buildhistory_get_layers(d):
 	return layertext
 
 
+def buildhistory_get_imagevars(d):
+	imagevars = "DISTRO DISTRO_VERSION USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS ROOTFS_POSTPROCESS_COMMAND IMAGE_POSTPROCESS_COMMAND"
+
+	ret = ""
+	for var in imagevars.split():
+		value = d.getVar(var, True) or ""
+		ret += "%s = %s\n" % (var, value)
+	return ret.rstrip('\n')
+
+
 buildhistory_commit() {
 	if [ ! -d ${BUILDHISTORY_DIR} ] ; then
 		# Code above that creates this dir never executed, so there can't be anything to commit
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 9f42fe3..d3c0448 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -15,16 +15,15 @@ import git
 
 
 # How to display fields
-pkg_list_fields = ['DEPENDS', 'RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILES', 'FILELIST']
-pkg_numeric_fields = ['PKGSIZE']
+list_fields = ['DEPENDS', 'RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILES', 'FILELIST', 'USER_CLASSES', 'IMAGE_CLASSES', 'IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS']
+numeric_fields = ['PKGSIZE', 'IMAGESIZE']
 # Fields to monitor
-pkg_monitor_fields = ['RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILELIST', 'PKGSIZE']
+monitor_fields = ['RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE']
 # Percentage change to alert for numeric fields
-pkg_monitor_numeric_threshold = 20
-# Image files to monitor
+monitor_numeric_threshold = 20
+# Image files to monitor (note that image-info.txt is handled separately)
 img_monitor_files = ['installed-package-names.txt', 'files-in-image.txt']
 
-
 class ChangeRecord:
     def __init__(self, path, fieldname, oldvalue, newvalue):
         self.path = path
@@ -34,13 +33,13 @@ class ChangeRecord:
         self.filechanges = None
 
     def __str__(self):
-        if self.fieldname in pkg_list_fields:
+        if self.fieldname in list_fields:
             aitems = self.oldvalue.split(' ')
             bitems = self.newvalue.split(' ')
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
             return '%s: %s:%s%s' % (self.path, self.fieldname, ' removed "%s"' % ' '.join(removed) if removed else '', ' added "%s"' % ' '.join(added) if added else '')
-        elif self.fieldname in pkg_numeric_fields:
+        elif self.fieldname in numeric_fields:
             aval = int(self.oldvalue)
             bval = int(self.newvalue)
             percentchg = ((bval - aval) / float(aval)) * 100
@@ -190,6 +189,25 @@ def compare_lists(alines, blines):
     return filechanges
 
 
+def compare_dict_blobs(path, ablob, bblob, report_all):
+    adict = blob_to_dict(ablob)
+    bdict = blob_to_dict(bblob)
+
+    changes = []
+    for key in adict:
+        if report_all or key in monitor_fields:
+            if adict[key] != bdict[key]:
+                if (not report_all) and key in numeric_fields:
+                    aval = int(adict[key])
+                    bval = int(bdict[key])
+                    percentchg = ((bval - aval) / float(aval)) * 100
+                    if percentchg < monitor_numeric_threshold:
+                        continue
+                chg = ChangeRecord(path, key, adict[key], bdict[key])
+                changes.append(chg)
+    return changes
+
+
 def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False):
     repo = git.Repo(repopath)
     assert repo.bare == False
@@ -200,20 +218,7 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
     for d in diff.iter_change_type('M'):
         path = os.path.dirname(d.a_blob.path)
         if path.startswith('packages/'):
-            adict = blob_to_dict(d.a_blob)
-            bdict = blob_to_dict(d.b_blob)
-
-            for key in adict:
-                if report_all or key in pkg_monitor_fields:
-                    if adict[key] != bdict[key]:
-                        if (not report_all) and key in pkg_numeric_fields:
-                            aval = int(adict[key])
-                            bval = int(bdict[key])
-                            percentchg = ((bval - aval) / float(aval)) * 100
-                            if percentchg < pkg_monitor_numeric_threshold:
-                                continue
-                        chg = ChangeRecord(path, key, adict[key], bdict[key])
-                        changes.append(chg)
+            changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
         elif path.startswith('images/'):
             filename = os.path.basename(d.a_blob.path)
             if filename in img_monitor_files:
@@ -236,5 +241,7 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
                 else:
                     chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read())
                     changes.append(chg)
+            elif filename == 'image-info.txt':
+                changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
 
     return changes
-- 
1.7.5.4



