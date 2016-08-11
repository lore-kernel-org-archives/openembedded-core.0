Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF10771D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475623"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:44:59 +1200
Message-Id: <0c94799c7fde5ee1fd17e0c6dad720ad98e5d938.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/10] classes/populate_sdk_ext: ensure eSDK can build without uninative enabled
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:28 -0000

We were relying on uninative being enabled in the build in which the
eSDK was being produced, which is not the case for example for OE-Core's
default configuration. Move the code that copies the uninative tarball
and writes the checksum to copy_buildsystem so that it happens early
enough for that part of the configuration to be set up when we do the
filtering (which requires running bitbake).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index f6b0834..f758d98 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -233,6 +233,14 @@ python copy_buildsystem () {
         f.write('    $' + '{SDKBASEMETAPATH}/workspace \\\n')
         f.write('    "\n')
 
+    # Copy uninative tarball
+    # For now this is where uninative.bbclass expects the tarball
+    uninative_file = d.expand('${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2')
+    uninative_checksum = bb.utils.sha256_file(uninative_file)
+    uninative_outdir = '%s/downloads/uninative/%s' % (baseoutpath, uninative_checksum)
+    bb.utils.mkdirhier(uninative_outdir)
+    shutil.copy(uninative_file, uninative_outdir)
+
     env_whitelist = (d.getVar('BB_ENV_EXTRAWHITE', True) or '').split()
     env_whitelist_values = {}
 
@@ -267,7 +275,8 @@ python copy_buildsystem () {
             # Write a newline just in case there's none at the end of the original
             f.write('\n')
 
-            f.write('INHERIT += "%s"\n\n' % 'uninative')
+            f.write('INHERIT += "%s"\n' % 'uninative')
+            f.write('UNINATIVE_CHECKSUM[%s] = "%s"\n\n' % (d.getVar('BUILD_ARCH', True), uninative_checksum))
             f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
 
             # Some classes are not suitable for SDK, remove them from INHERIT
@@ -446,18 +455,10 @@ install_tools() {
 	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
-	localconf=${SDK_OUTPUT}/${SDKPATH}/conf/local.conf
-
 	# find latest buildtools-tarball and install it
 	buildtools_path=`ls -t1 ${SDK_DEPLOY}/${@extsdk_get_buildtools_filename(d)} | head -n1`
 	install $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
 
-	# For now this is where uninative.bbclass expects the tarball
-	chksum=`sha256sum ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2 | cut -f 1 -d ' '`
-	install -d ${SDK_OUTPUT}/${SDKPATH}/downloads/uninative/$chksum/
-	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2 ${SDK_OUTPUT}/${SDKPATH}/downloads/uninative/$chksum/
-	echo "UNINATIVE_CHECKSUM[${BUILD_ARCH}] = '$chksum'" >> ${SDK_OUTPUT}/${SDKPATH}/conf/local.conf
-
 	install -m 0644 ${COREBASE}/meta/files/ext-sdk-prepare.py ${SDK_OUTPUT}/${SDKPATH}
 }
 do_populate_sdk_ext[file-checksums] += "${COREBASE}/meta/files/ext-sdk-prepare.py:True"
-- 
2.5.5


