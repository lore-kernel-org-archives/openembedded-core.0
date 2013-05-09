Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UaTVm-0001qt-71
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:16:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2013 08:55:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,641,1363158000"; d="scan'208";a="334364333"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.169])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2013 08:57:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 16:57:48 +0100
Message-Id: <04c56775ed2d60a9affcf46cf10fdaee455786bd.1368115039.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368115039.git.paul.eggleton@linux.intel.com>
References: <cover.1368115039.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368115039.git.paul.eggleton@linux.intel.com>
References: <cover.1368115039.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/buildhistory: track contents of selected files in images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 16:16:12 -0000

Add a BUILDHISTORY_IMAGE_FILES variable specifying a space-separated
list of files within an image to copy into buildhistory, so that changes
to them can be tracked. Typically this would be used for configuration
files, and by default this includes /etc/passwd and /etc/group, but the
user is free to extend this list by setting the variable in local.conf.

Implements [YOCTO #4154].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass    | 10 ++++++++++
 meta/lib/oe/buildhistory_analysis.py | 23 +++++++++++++++++------
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8efd41c..3b6ce99 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -12,6 +12,7 @@ BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
 BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}"
+BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 BUILDHISTORY_COMMIT ?= "0"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
@@ -396,6 +397,15 @@ buildhistory_get_imageinfo() {
 
 	buildhistory_list_files ${IMAGE_ROOTFS} ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt
 
+	# Collect files requested in BUILDHISTORY_IMAGE_FILES
+	rm -rf ${BUILDHISTORY_DIR_IMAGE}/image-files
+	for f in ${BUILDHISTORY_IMAGE_FILES}; do
+		if [ -f ${IMAGE_ROOTFS}/$f ] ; then
+			mkdir -p ${BUILDHISTORY_DIR_IMAGE}/image-files/`dirname $f`
+			cp ${IMAGE_ROOTFS}/$f ${BUILDHISTORY_DIR_IMAGE}/image-files/$f
+		fi
+	done
+
 	# Record some machine-readable meta-information about the image
 	printf ""  > ${BUILDHISTORY_DIR_IMAGE}/image-info.txt
 	cat >> ${BUILDHISTORY_DIR_IMAGE}/image-info.txt <<END
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 2306bcb..86b5a12 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -52,7 +52,10 @@ class ChangeRecord:
 
     def _str_internal(self, outer):
         if outer:
-            prefix = '%s: ' % self.path
+            if '/image-files/' in self.path:
+                prefix = '%s: ' % self.path.split('/image-files/')[0]
+            else:
+                prefix = '%s: ' % self.path
         else:
             prefix = ''
 
@@ -107,16 +110,21 @@ class ChangeRecord:
             diff = difflib.unified_diff(alines, blines, self.fieldname, self.fieldname, lineterm='')
             out += '\n  '.join(list(diff)[2:])
             out += '\n  --'
-        elif self.fieldname in img_monitor_files:
-            if outer:
-                prefix = 'Changes to %s ' % self.path
-            out = '(%s):\n  ' % self.fieldname
+        elif self.fieldname in img_monitor_files or '/image-files/' in self.path:
+            fieldname = self.fieldname
+            if '/image-files/' in self.path:
+                fieldname = os.path.join('/' + self.path.split('/image-files/')[1], self.fieldname)
+                out = 'Changes to %s:\n  ' % fieldname
+            else:
+                if outer:
+                    prefix = 'Changes to %s ' % self.path
+                out = '(%s):\n  ' % self.fieldname
             if self.filechanges:
                 out += '\n  '.join(['%s' % i for i in self.filechanges])
             else:
                 alines = self.oldvalue.splitlines()
                 blines = self.newvalue.splitlines()
-                diff = difflib.unified_diff(alines, blines, self.fieldname, self.fieldname, lineterm='')
+                diff = difflib.unified_diff(alines, blines, fieldname, fieldname, lineterm='')
                 out += '\n  '.join(list(diff))
                 out += '\n  --'
         else:
@@ -393,6 +401,9 @@ def process_changes(repopath, revision1, revision2 = 'HEAD', report_all = False)
                     changes.append(chg)
             elif filename == 'image-info.txt':
                 changes.extend(compare_dict_blobs(path, d.a_blob, d.b_blob, report_all))
+            elif '/image-files/' in path:
+                chg = ChangeRecord(path, filename, d.a_blob.data_stream.read(), d.b_blob.data_stream.read(), True)
+                changes.append(chg)
 
     # Look for added preinst/postinst/prerm/postrm
     # (without reporting newly added recipes)
-- 
1.8.1.2



