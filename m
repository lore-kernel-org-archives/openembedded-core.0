Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DEFAB76FDE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940040"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:21 +0100
Message-Id: <458cb48e473044d4bb4525a45207a9457934ce3e.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/11] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:46 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

If we do `bitbake buildtools-tarball' and then after one day do `bitbake
core-image-minimal -c populate_sdk_ext', we would meet errors like below.

| install: cannot stat '/buildarea2/chenqi/poky/build-systemd/tmp/deploy/sdk/
poky-glibc-x86_64-buildtools-tarball-core2-64-buildtools-nativesdk-standalone
-1.8+snapshot-20150429.sh': No such file or directory

The problem is that the output name for buildtools-tarball has ${DATE} in it.
So if populate_sdk_ext task is executed but buildtools-tarball is not rebuilt,
the above error appears.

Instead of hardcoding ${DISTRO_VERSION} which consists of ${DATE} in the
install_tools() function, we should find the latest buildtools-tarball based
on the modification time and install it.

[YOCTO #7674]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 8509f0c..5dd6051 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -163,13 +163,21 @@ python copy_buildsystem () {
         pass
 }
 
+def extsdk_get_buildtools_filename(d):
+    # This is somewhat of a hack
+    localdata = bb.data.createCopy(d)
+    localdata.setVar('PN', 'buildtools-tarball')
+    return localdata.expand('${SDK_NAME}-buildtools-nativesdk-standalone-*.sh')
+
 install_tools() {
 	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}
 	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/devtool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/devtool
 	lnr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
-	install ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKGARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh ${SDK_OUTPUT}/${SDKPATH}
+	# find latest buildtools-tarball and install it
+	buildtools_path=`ls -t1 ${SDK_DEPLOY}/${@extsdk_get_buildtools_filename(d)} | head -n1`
+	install $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
 
 	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2 ${SDK_OUTPUT}/${SDKPATH}
 }
-- 
2.1.0


