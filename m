Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3698473184
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 02:41:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2015 18:41:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="712450087"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by orsmga003.jf.intel.com with ESMTP; 21 Dec 2015 18:41:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 15:41:28 +1300
Message-Id: <87d8deea507c74100612445e3feffdcad3627269.1450751834.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450751834.git.paul.eggleton@linux.intel.com>
References: <cover.1450751834.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450751834.git.paul.eggleton@linux.intel.com>
References: <cover.1450751834.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] buildhistory: improve support for extensible SDK
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
X-List-Received-Date: Tue, 22 Dec 2015 02:41:55 -0000

* Ensure extensible SDK and standard SDK go into their own directories
* Record extra extensible SDK variables
* Write sstate-package-sizes.txt and sstate-task-sizes.txt files so you
  can analyse the size of the contents
* Add BUILDHISTORY_SDK_FILES (similar to BUILDHISTORY_IMAGE_FILES) and
  default it to pick up config files installed in the extensible SDK

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass     | 41 ++++++++++++++++++++++++++++++++---
 meta/classes/populate_sdk_ext.bbclass |  3 +++
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index c0dba59..943c8d7 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -11,8 +11,9 @@ BUILDHISTORY_FEATURES ?= "image package sdk"
 BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
-BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}/${IMAGE_BASENAME}"
+BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}${SDK_EXT}/${IMAGE_BASENAME}"
 BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
+BUILDHISTORY_SDK_FILES ?= "conf/local.conf conf/locked-sigs.inc conf/devtool.conf"
 BUILDHISTORY_COMMIT ?= "0"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
@@ -510,6 +511,15 @@ buildhistory_get_sdkinfo() {
 
 	buildhistory_list_files ${SDK_OUTPUT} ${BUILDHISTORY_DIR_SDK}/files-in-sdk.txt
 
+	# Collect files requested in BUILDHISTORY_SDK_FILES
+	rm -rf ${BUILDHISTORY_DIR_SDK}/sdk-files
+	for f in ${BUILDHISTORY_SDK_FILES}; do
+		if [ -f ${SDK_OUTPUT}/${SDKPATH}/$f ] ; then
+			mkdir -p ${BUILDHISTORY_DIR_SDK}/sdk-files/`dirname $f`
+			cp ${SDK_OUTPUT}/${SDKPATH}/$f ${BUILDHISTORY_DIR_SDK}/sdk-files/$f
+		fi
+	done
+
 	# Record some machine-readable meta-information about the SDK
 	printf ""  > ${BUILDHISTORY_DIR_SDK}/sdk-info.txt
 	cat >> ${BUILDHISTORY_DIR_SDK}/sdk-info.txt <<END
@@ -519,6 +529,29 @@ END
 	echo "SDKSIZE = $sdksize" >> ${BUILDHISTORY_DIR_SDK}/sdk-info.txt
 }
 
+python buildhistory_get_extra_sdkinfo() {
+    import operator
+    if d.getVar('BB_CURRENTTASK', True) == 'populate_sdk_ext':
+        tasksizes = {}
+        filesizes = {}
+        for root, _, files in os.walk('${SDK_OUTPUT}/${SDKPATH}/sstate-cache'):
+            for fn in files:
+                if fn.endswith('.tgz'):
+                    fsize = os.path.getsize(os.path.join(root, fn))
+                    task = fn.rsplit(':', 1)[1].split('_', 1)[1].split('.')[0]
+                    origtotal = tasksizes.get(task, 0)
+                    tasksizes[task] = origtotal + fsize
+                    filesizes[fn] = fsize
+        with open('${BUILDHISTORY_DIR_SDK}/sstate-package-sizes.txt', 'w') as f:
+            filesizes_sorted = sorted(filesizes.items(), key=operator.itemgetter(1), reverse=True)
+            for fn, size in filesizes_sorted:
+                f.write('%10d KiB %s\n' % (size, fn))
+        with open('${BUILDHISTORY_DIR_SDK}/sstate-task-sizes.txt', 'w') as f:
+            tasksizes_sorted = sorted(tasksizes.items(), key=operator.itemgetter(1), reverse=True)
+            for task, size in tasksizes_sorted:
+                f.write('%10d KiB %s\n' % (size, task))
+}
+
 # By using ROOTFS_POSTUNINSTALL_COMMAND we get in after uninstallation of
 # unneeded packages but before the removal of packaging files
 ROOTFS_POSTUNINSTALL_COMMAND += " buildhistory_list_installed_image ;\
@@ -532,7 +565,7 @@ POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_targ
 POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host ;\
                                           buildhistory_get_sdk_installed_host ; "
 
-SDK_POSTPROCESS_COMMAND_append = " buildhistory_get_sdkinfo ; "
+SDK_POSTPROCESS_COMMAND_append = " buildhistory_get_sdkinfo ; buildhistory_get_extra_sdkinfo; "
 
 def buildhistory_get_build_id(d):
     if d.getVar('BB_WORKERCONTEXT', True) != '1':
@@ -584,7 +617,9 @@ def buildhistory_get_sdkvars(d):
     if d.getVar('BB_WORKERCONTEXT', True) != '1':
         return ""
     sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
-    listvars = "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS PACKAGE_EXCLUDE"
+    if d.getVar('BB_CURRENTTASK', True) == 'populate_sdk_ext':
+        sdkvars += " SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST SDK_UPDATE_URL"
+    listvars = "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS PACKAGE_EXCLUDE SDK_LOCAL_CONF_WHITELIST SDK_LOCAL_CONF_BLACKLIST SDK_INHERIT_BLACKLIST"
     return outputvars(sdkvars, listvars, d)
 
 
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 802cbe1..7163b99 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -15,6 +15,9 @@ SDK_RDEPENDS_append_task-populate-sdk-ext = " ${SDK_TARGETS}"
 
 SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
 
+SDK_EXT = ""
+SDK_EXT_task-populate-sdk-ext = "-ext"
+
 SDK_LOCAL_CONF_WHITELIST ?= ""
 SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION BB_NUMBER_THREADS PARALLEL_MAKE PRSERV_HOST"
 SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
-- 
2.5.0


