Return-Path: <sukdo399@daum.net>
Received: from mail-smail-vm81.hanmail.net (mail-smail-vm81.daum.net
	[211.231.106.156])
	by mail.openembedded.org (Postfix) with ESMTP id 82DC06E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 00:48:21 +0000 (UTC)
Received: from mail-hmail-smtp3.pg1.krane.9rum.cc ([10.194.31.36])
	by mail-smail-vm81.hanmail.net (8.13.8/8.9.1) with SMTP id
	w7R0mDkI013745; Mon, 27 Aug 2018 09:48:13 +0900
X-Hermes-Message-Id: m7R9mBJkx228736660
Received: from mail-qpsmtp-vm13 ([10.61.241.143]) by hermes of
	mail-hmail-smtp3.pg1.krane.9rum.cc (10.194.31.36) with ESMTP id
	m7R9mBJkx228736660; Mon, 27 Aug 2018 09:48:11 +0900 (KST)
Received: from [182.212.44.138] (HELO localhost.localdomain) (182.212.44.138)
	by  (8.12.9/8.9.1) with ESMTPA; ??, 27  8?? 2018 09:48:11 +0900
Authentication-Results: mail-qpsmtp-vm13;
	auth=pass (plain) smtp.auth=sukdo399@daum.net
Errors-To: <sukdo399@daum.net>
X-Originating-IP: 182.212.44.138
From: Seokha Ko <sukdo399@daum.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Aug 2018 09:47:56 +0900
Message-Id: <20180827004756.20237-1-sukdo399@daum.net>
X-Mailer: git-send-email 2.17.1
X-HM-UT: xEzQNHotdNI/7frzsypURPFdugrUhY3upSfJ6//IJWw=
Subject: [PATCH v2] nativesdk-packagegroup-sdk-host: Add wayland-scanner to the SDK native toolchain
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
X-List-Received-Date: Mon, 27 Aug 2018 00:48:21 -0000

The wayland-scanner was missing from the native toolchain for SDK build
because it's copied from wayland dev package.
So make the wayland-scanner package and include it to SDK native toolchain.

Signed-off-by: Seokha Ko <sukdo399@daum.net>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb          | 1 +
 meta/recipes-graphics/wayland/wayland_1.15.0.bb               | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index e2f6169994..6eab7ffe99 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
     nativesdk-dnf \
     nativesdk-cmake \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-scanner', '', d)} \
     nativesdk-sdk-provides-dummy \
     "
 
diff --git a/meta/recipes-graphics/wayland/wayland_1.15.0.bb b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
index d037dc4654..2eafaf51d9 100644
--- a/meta/recipes-graphics/wayland/wayland_1.15.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.15.0.bb
@@ -39,6 +39,8 @@ sysroot_stage_all_append_class-target () {
 }
 
 FILES_${PN} = "${libdir}/*${SOLIBS}"
-FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
+FILES_${PN}-dev += "${datadir}/wayland"
+PACKAGES += "${PN}-scanner"
+FILES_${PN}-scanner = "${bindir}/wayland-scanner"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


