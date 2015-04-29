Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75E6673D5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:08:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T88cTZ004150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 01:08:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.192) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 29 Apr 2015 01:08:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 16:08:37 +0800
Message-ID: <203a7291ad8678391e4cf6d7785cb22e23ea43de.1430294879.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430294879.git.Qi.Chen@windriver.com>
References: <cover.1430294879.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Wed, 29 Apr 2015 08:08:38 -0000
Content-Type: text/plain

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
---
 meta/classes/populate_sdk_ext.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 7925ece..0e4ee31 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -188,7 +188,17 @@ install_tools() {
 	ln -sr ${SDK_OUTPUT}/${SDKPATH}/${scriptrelpath}/recipetool ${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/recipetool
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
-	install ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKGARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh ${SDK_OUTPUT}/${SDKPATH}
+	# find latest buildtools-tarball and install it
+	maxseconds=0
+	buildtools_path=""
+	for f in `ls ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKGARCH}-buildtools-nativesdk-standalone-*.sh`; do
+		seconds=`stat -c "%Y" $f`
+		if [ $seconds -gt $maxseconds ]; then
+			maxseconds=$seconds
+			buildtools_path="$f"
+		fi
+	done
+	install $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
 
 	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2 ${SDK_OUTPUT}/${SDKPATH}
 }
-- 
1.9.1


