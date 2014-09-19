Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5580060144
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 17:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8JH9BFX013198 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 18:09:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5ScLR95lVRbO
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 18:09:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8JH99NN013195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 18:09:10 +0100
Message-ID: <1411146552.4736.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Sep 2014 18:09:12 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_base/meta-environment: Remove overlap from the two
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
X-List-Received-Date: Fri, 19 Sep 2014 17:09:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently we have the horrible situation where meta-environment packages
the toolchain environment files and they get included in the SDK but are
broken, then, the SDK code overwrites them with good versions. This is
suboptimal.

This change fixes the code in meta-environment to create working
files and adds in the multilib support from populate_sdk_base, then
we remove the code in that base bbclass and rely on the packages
being installed if/as/when needed. This removes the duplication
and the broken versions of the files, hopefully making all well.

[YOCTO #6608]
[YOCTO #6613]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 946a1d4..de72e32 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -88,25 +88,8 @@ fakeroot python do_populate_sdk() {
 
     populate_sdk(d)
 
-    # Handle multilibs in the SDK environment, siteconfig, etc files...
-    localdata = bb.data.createCopy(d)
-
-    # make sure we only use the WORKDIR value from 'd', or it can change
-    localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
-
-    # make sure we only use the SDKTARGETSYSROOT value from 'd'
-    localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT', True))
-
     # Process DEFAULTTUNE
-    bb.build.exec_func("create_sdk_files", localdata)
-
-    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
-    for item in variants.split():
-        # Load overrides from 'd' to avoid having to reset the value...
-        overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
-        localdata.setVar("OVERRIDES", overrides)
-        bb.data.update_data(localdata)
-        bb.build.exec_func("create_sdk_files", localdata)
+    bb.build.exec_func("create_sdk_files", d)
 
     bb.build.exec_func("tar_sdk", d)
 
@@ -114,14 +97,6 @@ fakeroot python do_populate_sdk() {
 }
 
 fakeroot create_sdk_files() {
-	# Setup site file for external use
-	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
-
-	toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
-
-	# Add version information
-	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
-
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
 
 	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index c80f8a8..c6d3bb8 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -18,20 +18,41 @@ SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${TARGET_SYS}"
 inherit cross-canadian
 
 do_generate_content[nostamp] = "1"
-do_generate_content() {
+do_generate_content[cleandirs] = "${SDK_OUTPUT}"
+do_generate_content[dirs] = "${SDK_OUTPUT}/${SDKPATH}"
+python do_generate_content() {
+    # Handle multilibs in the SDK environment, siteconfig, etc files...
+    localdata = bb.data.createCopy(d)
 
-    rm -rf ${SDK_OUTPUT}
-    mkdir -p ${SDK_OUTPUT}/${SDKPATH}
+    # make sure we only use the WORKDIR value from 'd', or it can change
+    localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
 
-    toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
+    # make sure we only use the SDKTARGETSYSROOT value from 'd'
+    localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT', True))
 
-    toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS} ${REAL_MULTIMACH_TARGET_SYS} '##SDKTARGETSYSROOT##'  ${target_libdir} 
+    # Process DEFAULTTUNE
+    bb.build.exec_func("create_sdk_files", localdata)
 
-    # Add version information
-    toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    for item in variants.split():
+        # Load overrides from 'd' to avoid having to reset the value...
+        overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+        localdata.setVar("OVERRIDES", overrides)
+        bb.data.update_data(localdata)
+        bb.build.exec_func("create_sdk_files", localdata)
 }
 addtask generate_content before do_install after do_compile
 
+create_sdk_files() {
+	# Setup site file for external use
+	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
+
+	toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
+
+	# Add version information
+	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
+}
+
 do_install[nostamp] = "1"
 do_install() {
     install -d ${D}/${SDKPATH}



