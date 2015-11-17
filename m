Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF0D60616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 20:21:17 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tAHKLIfG017069 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 14:21:18 -0600
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015111714211814-80713 ;
	Tue, 17 Nov 2015 14:21:18 -0600 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 14:21:12 -0600
Message-Id: <1447791672-3404-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.6.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 11/17/2015 02:21:18 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 11/17/2015 02:21:18 PM,
	Serialize complete at 11/17/2015 02:21:18 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-11-17_12:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [PATCH] populate_sdk_base: Add sysroot symlink check
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
X-List-Received-Date: Tue, 17 Nov 2015 20:21:19 -0000

Add optional check to do_populate_sdk() that verifies SDK sysroots don't
contain dangling or escaping symlinks before attempting to tar an archive.
Such links may fail a `tar -h` operation (-h => follow symlinks) or
archive the build system's files.

Set CHECK_SDK_SYSROOTS = "1" to enable this check.

Use case: The -h option may be set via SDKTAROPTS in some configurations
to create symlink-less SDK archives for Windows file systems.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/classes/populate_sdk_base.bbclass | 53 +++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 35e129b..23dc115 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -80,7 +80,7 @@ python write_host_sdk_manifest () {
 
 POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
 POPULATE_SDK_POST_HOST_COMMAND_append = " write_host_sdk_manifest; "
-SDK_POSTPROCESS_COMMAND = " create_sdk_files; tar_sdk; ${SDK_PACKAGING_FUNC}; "
+SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK_PACKAGING_FUNC}; "
 
 # Some archs override this, we need the nativesdk version
 # turns out this is hard to get from the datastore due to TRANSLATED_TARGET_ARCH
@@ -120,6 +120,57 @@ fakeroot create_sdk_files() {
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 }
 
+python check_sdk_sysroots() {
+    # Fails build if there are broken or dangling symlinks in SDK sysroots
+
+    if d.getVar('CHECK_SDK_SYSROOTS', True) != '1':
+        # disabled, bail out
+        return
+
+    def norm_path(path):
+        return os.path.abspath(path)
+
+    # Get scan root
+    SCAN_ROOT = norm_path("${SDK_OUTPUT}/${SDKPATH}/sysroots/")
+
+    bb.note('Checking SDK sysroots at ' + SCAN_ROOT)
+
+    def check_symlink(linkPath):
+        if not os.path.islink(linkPath):
+            return
+
+        linkDirPath = os.path.dirname(linkPath)
+
+        targetPath = os.readlink(linkPath)
+        if not os.path.isabs(targetPath):
+            targetPath = os.path.join(linkDirPath, targetPath)
+        targetPath = norm_path(targetPath)
+
+        if SCAN_ROOT != os.path.commonprefix( [SCAN_ROOT, targetPath] ):
+            bb.error("Escaping symlink {0!s} --> {1!s}".format(linkPath, targetPath))
+            return
+
+        if not os.path.exists(targetPath):
+            bb.error("Broken symlink {0!s} --> {1!s}".format(linkPath, targetPath))
+            return
+
+        if os.path.isdir(targetPath):
+            dir_walk(targetPath)
+
+    def walk_error_handler(e):
+        bb.error(str(e))
+
+    def dir_walk(rootDir):
+        for dirPath,subDirEntries,fileEntries in os.walk(rootDir, followlinks=False, onerror=walk_error_handler):
+            entries = subDirEntries + fileEntries
+            for e in entries:
+                ePath = os.path.join(dirPath, e)
+                check_symlink(ePath)
+
+    # start
+    dir_walk(SCAN_ROOT)
+}
+
 SDKTAROPTS = "--owner=root --group=root"
 
 fakeroot tar_sdk() {
-- 
2.6.2


