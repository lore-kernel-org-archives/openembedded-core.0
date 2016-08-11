Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7371B771F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475676"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:45:04 +1200
Message-Id: <f72d50e1d3c4c76ff93acfebc4a05084f009cba2.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/10] classes/populate_sdk_ext: properly determine buildtools filename
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:37 -0000

Determine the name of the current buildtools installer ahead of time,
set it in a variable and use that variable rather than the wildcarded
version everywhere, since it's much tidier.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 18013564..2464acb 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -452,8 +452,12 @@ python copy_buildsystem () {
                 f.write('%s\t%s\n' % (chksum, os.path.relpath(fn, baseoutpath)))
 }
 
-def extsdk_get_buildtools_filename(d):
-    return '*-buildtools-nativesdk-standalone-*.sh'
+def get_current_buildtools(d):
+    """Get the file name of the current buildtools installer"""
+    import glob
+    btfiles = glob.glob(os.path.join(d.getVar('SDK_DEPLOY', True), '*-buildtools-nativesdk-standalone-*.sh'))
+    btfiles.sort(key=os.path.getctime)
+    return os.path.basename(btfiles[-1])
 
 install_tools() {
 	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}
@@ -462,8 +466,7 @@ install_tools() {
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
 	# find latest buildtools-tarball and install it
-	buildtools_path=`ls -t1 ${SDK_DEPLOY}/${@extsdk_get_buildtools_filename(d)} | head -n1`
-	install $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
+	install ${SDK_DEPLOY}/${SDK_BUILDTOOLS_INSTALLER} ${SDK_OUTPUT}/${SDKPATH}
 
 	install -m 0644 ${COREBASE}/meta/files/ext-sdk-prepare.py ${SDK_OUTPUT}/${SDKPATH}
 }
@@ -491,10 +494,10 @@ sdk_ext_postinst() {
 	printf "\nExtracting buildtools...\n"
 	cd $target_sdk_dir
 	env_setup_script="$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}"
-	printf "buildtools\ny" | ./*buildtools-nativesdk-standalone* > buildtools.log || { printf 'ERROR: buildtools installation failed:\n' ; cat buildtools.log ; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+	printf "buildtools\ny" | ./${SDK_BUILDTOOLS_INSTALLER} > buildtools.log || { printf 'ERROR: buildtools installation failed:\n' ; cat buildtools.log ; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 
 	# Delete the buildtools tar file since it won't be used again
-	rm ./*buildtools-nativesdk-standalone*.sh -f
+	rm -f ./${SDK_BUILDTOOLS_INSTALLER}
 	# We don't need the log either since it succeeded
 	rm -f buildtools.log
 
@@ -538,6 +541,8 @@ fakeroot python do_populate_sdk_ext() {
         bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH', True), d.getVar('BUILD_ARCH', True)))
 
     d.setVar('SDK_INSTALL_TARGETS', get_sdk_install_targets(d))
+    buildtools_fn = get_current_buildtools(d)
+    d.setVar('SDK_BUILDTOOLS_INSTALLER', buildtools_fn)
 
     bb.build.exec_func("do_populate_sdk", d)
 }
-- 
2.5.5


