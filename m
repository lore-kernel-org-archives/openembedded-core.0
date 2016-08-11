Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 57096771EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475699"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:45:06 +1200
Message-Id: <8aa96837fb9a30d03e547d7c7d58706f7d7a8aab.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/10] classes/populate_sdk_ext: add some pre-install checks
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:42 -0000

Check a number of things as early as possible in the eSDK installer
script so that the user gets an error up front rather than waiting for
the build system to be extracted and then have the error produced:

* Check for missing utilities specified in SANITY_REQUIRED_UTILITIES
  (along with gcc and g++), taking into account that some of these are
  satisfied by buildtools which ships as part of the SDK. We use the
  newly added capability to list an SDK's contents to allow us to see
  exactly which binaries are inside the buildtools installer.
* Check that Python is available (since the buildtools installer's
  relocate script is written in Python).
* Check that locale value set by the script is actually available
* Check that the install path is not on NFS

This does duplicate some of the checks in sanity.bbclass but it's
difficult to avoid that given that here they have to be written in shell
and there they are written in Python, as well as the fact that we only
need to run some of the checks here and not all (i.e. the ones that
relate to the host system or install path, and not those that check the
configuration or metadata). Given those issues and the fact that the
amount of code is fairly small I elected to just re-implement the checks
here.

Fixes [YOCTO #8657].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 60 +++++++++++++++++++++++++++++++++--
 meta/files/toolchain-shar-extract.sh  | 10 ++++++
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 2464acb..f1ae7c1 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -459,6 +459,36 @@ def get_current_buildtools(d):
     btfiles.sort(key=os.path.getctime)
     return os.path.basename(btfiles[-1])
 
+def get_sdk_required_utilities(buildtools_fn, d):
+    """Find required utilities that aren't provided by the buildtools"""
+    sanity_required_utilities = (d.getVar('SANITY_REQUIRED_UTILITIES', True) or '').split()
+    sanity_required_utilities.append(d.expand('${BUILD_PREFIX}gcc'))
+    sanity_required_utilities.append(d.expand('${BUILD_PREFIX}g++'))
+    buildtools_installer = os.path.join(d.getVar('SDK_DEPLOY', True), buildtools_fn)
+    filelist, _ = bb.process.run('%s -l' % buildtools_installer)
+    localdata = bb.data.createCopy(d)
+    localdata.setVar('SDKPATH', '.')
+    sdkpathnative = localdata.getVar('SDKPATHNATIVE', True)
+    sdkbindirs = [localdata.getVar('bindir_nativesdk', True),
+                  localdata.getVar('sbindir_nativesdk', True),
+                  localdata.getVar('base_bindir_nativesdk', True),
+                  localdata.getVar('base_sbindir_nativesdk', True)]
+    for line in filelist.splitlines():
+        splitline = line.split()
+        if len(splitline) > 5:
+            fn = splitline[5]
+            if not fn.startswith('./'):
+                fn = './%s' % fn
+            if fn.startswith(sdkpathnative):
+                relpth = '/' + os.path.relpath(fn, sdkpathnative)
+                for bindir in sdkbindirs:
+                    if relpth.startswith(bindir):
+                        relpth = os.path.relpath(relpth, bindir)
+                        if relpth in sanity_required_utilities:
+                            sanity_required_utilities.remove(relpth)
+                        break
+    return ' '.join(sanity_required_utilities)
+
 install_tools() {
 	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}
 	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/devtool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/devtool
@@ -472,13 +502,38 @@ install_tools() {
 }
 do_populate_sdk_ext[file-checksums] += "${COREBASE}/meta/files/ext-sdk-prepare.py:True"
 
-# Since bitbake won't run as root it doesn't make sense to try and install
-# the extensible sdk as root.
 sdk_ext_preinst() {
+	# Since bitbake won't run as root it doesn't make sense to try and install
+	# the extensible sdk as root.
 	if [ "`id -u`" = "0" ]; then
 		echo "ERROR: The extensible sdk cannot be installed as root."
 		exit 1
 	fi
+	if ! command -v locale > /dev/null; then
+		echo "ERROR: The installer requires the locale command, please install it first"
+		exit 1
+	fi
+        # Check setting of LC_ALL set above
+	canonicalised_locale=`echo $LC_ALL | sed 's/UTF-8/utf8/'`
+	if ! locale -a | grep -q $canonicalised_locale ; then
+		echo "ERROR: the installer requires the $LC_ALL locale to be installed (but not selected), please install it first"
+		exit 1
+	fi
+	# The relocation script used by buildtools installer requires python
+	if ! command -v python > /dev/null; then
+		echo "ERROR: The installer requires python, please install it first"
+		exit 1
+	fi
+	missing_utils=""
+	for util in ${SDK_REQUIRED_UTILITIES}; do
+		if ! command -v $util > /dev/null; then
+			missing_utils="$missing_utils $util"
+		fi
+	done
+	if [ -n "$missing_utils" ] ; then
+		echo "ERROR: the SDK requires the following missing utilities, please install them: $missing_utils"
+		exit 1
+	fi
 	SDK_EXTENSIBLE="1"
 	if [ "$publish" = "1" ] ; then
 		EXTRA_TAR_OPTIONS="$EXTRA_TAR_OPTIONS --exclude=ext-sdk-prepare.py"
@@ -542,6 +597,7 @@ fakeroot python do_populate_sdk_ext() {
 
     d.setVar('SDK_INSTALL_TARGETS', get_sdk_install_targets(d))
     buildtools_fn = get_current_buildtools(d)
+    d.setVar('SDK_REQUIRED_UTILITIES', get_sdk_required_utilities(buildtools_fn, d))
     d.setVar('SDK_BUILDTOOLS_INSTALLER', buildtools_fn)
 
     bb.build.exec_func("do_populate_sdk", d)
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 4345104..66c017f 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -143,6 +143,16 @@ if [ "$SDK_EXTENSIBLE" = "1" ]; then
 		     "characters such as spaces, @, \$ or +. Abort!"
 		exit 1
 	fi
+	# The build system doesn't work well with /tmp on NFS
+	fs_dev_path="$target_sdk_dir"
+	while [ ! -d "$fs_dev_path" ] ; do
+		fs_dev_path=`dirname $fs_dev_path`
+        done
+	fs_dev_type=`stat -f -c '%t' "$fs_dev_path"`
+	if [ "$fsdevtype" = "6969" ] ; then
+		echo "The target directory path $target_sdk_dir is on NFS, this is not possible. Abort!"
+		exit 1
+	fi
 else
 	if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
 		echo "The target directory path ($target_sdk_dir) contains spaces. Abort!"
-- 
2.5.5


