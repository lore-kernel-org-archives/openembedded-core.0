Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 120896059E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 23:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8LNO6CF032595 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 00:24:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YHBbttld-aGt
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 00:24:06 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8LNO3aC032592
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 00:24:04 +0100
Message-ID: <1474500243.7207.350.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2016 00:24:03 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] uninative-tarball: Make stamp independent
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
X-List-Received-Date: Wed, 21 Sep 2016 23:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The uninative tarball only contains nativesdk compoents. It should
not get regenerated when MACHINE changes for example. Currently its
sstate arch is also incorrect so changing SDKMACHINE results in other
variants being removed from the deploy directory.

This patch removes the target architecture dependencies so that
deploy artefacts can overlap and it doesn't continually rebuild. This
also fixes various autobuilder/release artefact issues we're having
as a result of these issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 4ead812..0dad974 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -18,6 +18,9 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
 PACKAGE_ARCH = "${SDK_ARCH}"
+PACKAGE_ARCHS = ""
+TARGET_ARCH = "none"
+TARGET_OS = "none"
 
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_ARCH}-nativesdk-libc"
 
@@ -27,16 +30,19 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit meta
 inherit populate_sdk
+inherit nopackages
 
 deltask install
 deltask package
 deltask packagedata
+deltask populate_sysroot
 
 do_populate_sdk[stamp-extra-info] = "${SDKMACHINE}"
 
 SDK_DEPENDS += "patchelf-native"
 
 SDK_PACKAGING_FUNC = ""
+REAL_MULTIMACH_TARGET_SYS = "none"
 
 fakeroot create_sdk_files() {
 	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/



