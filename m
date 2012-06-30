Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SkpwA-0004b6-LJ
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 07:09:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5U4wfpM008310
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 21:58:41 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 29 Jun 2012 21:58:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jun 2012 00:07:44 -0500
Message-ID: <b3cf4c7f12d6cb30d69f37566ce244ef1a95458e.1341032578.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1341032578.git.mark.hatle@windriver.com>
References: <cover.1341032578.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/6] populate_sdk: enable basic multilib support
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
X-List-Received-Date: Sat, 30 Jun 2012 05:09:40 -0000
Content-Type: text/plain

In order to enable basic multilib support for the export of an SDK
image, a number of minor changes had to be made:

The value of MULTIMACH_TARGET_SYS needs to be variable.  This way we
can define the value to the appropriate multilib.  (Also in some cases
the default PACKAGE_ARCH is set to MACHINE_ARCH which is incorrect for
the SDK.)  Add a companion REAL_MULTIMACH_TARGET_SYS, based on code
from meta-environment, to allow for this.

We have to convert the do_populate_sdk into a python call, and then
break up the previous items into three parts.
  * Image construction
  * Setup of environment files
  * Generation of the tarball

Then we can iterate over the multilibs to populate the environment files.

Finally, matching changes were needed in the toolchain-scripts file.  And
what I presume is an optimization of immediate evaluation for
TOOLCHAIN_CONFIGSITE_NOCACHE and ..._SYSROOTCACHE needed to be done at
runtime, otherwise the wrong values may be used.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass |   42 ++++++++++++++++++++++++++++---
 meta/classes/toolchain-scripts.bbclass |   16 +++++++----
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 6508bd9..6dc66fb 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -16,6 +16,10 @@ TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
 SDK_DEPENDS = "virtual/fakeroot-native sed-native"
 
+# We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
+# could be set to the MACHINE_ARCH
+REAL_MULTIMACH_TARGET_SYS = "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+
 PID = "${@os.getpid()}"
 
 EXCLUDE_FROM_WORLD = "1"
@@ -27,7 +31,33 @@ python () {
         runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", d)
 }
 
-fakeroot do_populate_sdk() {
+fakeroot python do_populate_sdk() {
+	bb.build.exec_func("populate_sdk_image", d)
+
+	# Handle multilibs in the SDK environment, siteconfig, etc files...
+	localdata = bb.data.createCopy(d)
+
+	# make sure we only use the WORKDIR value from 'd', or it can change
+	localdata.setVar('WORKDIR', d.getVar('WORKDIR', True))
+
+	# make sure we only use the SDKTARGETSYSROOT value from 'd'
+	localdata.setVar('SDKTARGETSYSROOT', d.getVar('SDKTARGETSYSROOT', True))
+
+	# Process DEFAULTTUNE
+	bb.build.exec_func("create_sdk_files", localdata)
+
+	variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+	for item in variants.split():
+		# Load overrides from 'd' to avoid having to reset the value...
+		overrides = d.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+		localdata.setVar("OVERRIDES", overrides)
+		bb.data.update_data(localdata)
+		bb.build.exec_func("create_sdk_files", localdata)
+
+	bb.build.exec_func("tar_sdk", d)
+}
+
+fakeroot populate_sdk_image() {
 	rm -rf ${SDK_OUTPUT}
 	mkdir -p ${SDK_OUTPUT}
 
@@ -54,15 +84,19 @@ fakeroot do_populate_sdk() {
 
 	# Link the ld.so.cache file into the hosts filesystem
 	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
+}
 
+fakeroot create_sdk_files() {
 	# Setup site file for external use
-	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${MULTIMACH_TARGET_SYS}
+	toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}
 
-	toolchain_create_sdk_env_script
+	toolchain_create_sdk_env_script ${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 
 	# Add version information
-	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${MULTIMACH_TARGET_SYS}
+	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
+}
 
+fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 2099c4d..bedcd61 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -1,15 +1,19 @@
 inherit siteinfo
 
+# We want to be able to change the value of MULTIMACH_TARGET_SYS, because it
+# doesn't always match our expectations... but we default to the stock value
+REAL_MULTIMACH_TARGET_SYS ?= "${MULTIMACH_TARGET_SYS}"
+
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script
-	script=${SDK_OUTPUT}/${SDKPATH}/environment-setup-${MULTIMACH_TARGET_SYS}
+	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}}
 	rm -f $script
 	touch $script
-	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${MULTIMACH_TARGET_SYS}:$PATH' >> $script
+	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${REAL_MULTIMACH_TARGET_SYS}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${SDKTARGETSYSROOT}' >> $script
 	echo 'export PKG_CONFIG_PATH=${SDKTARGETSYSROOT}${libdir}/pkgconfig' >> $script
-	echo 'export CONFIG_SITE=${SDKPATH}/site-config-${MULTIMACH_TARGET_SYS}' >> $script
+	echo 'export CONFIG_SITE=${SDKPATH}/site-config-${REAL_MULTIMACH_TARGET_SYS}' >> $script
 	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
 	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
@@ -36,7 +40,7 @@ toolchain_create_sdk_env_script () {
 # This function creates an environment-setup-script in the TMPDIR which enables
 # a OE-core IDE to integrate with the build tree
 toolchain_create_tree_env_script () {
-	script=${TMPDIR}/environment-setup-${MULTIMACH_TARGET_SYS}
+	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
 	echo 'export PATH=${PATH}' >> $script
@@ -103,8 +107,8 @@ toolchain_create_sdk_env_script_for_installer () {
 }
 
 #we get the cached site config in the runtime
-TOOLCHAIN_CONFIGSITE_NOCACHE := "${@siteinfo_get_files(d, True)}"
-TOOLCHAIN_CONFIGSITE_SYSROOTCACHE := "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
+TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
+TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
 
 #This function create a site config file
-- 
1.7.3.4



