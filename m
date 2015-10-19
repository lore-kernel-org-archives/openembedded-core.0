Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id DB53D77070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 14:17:14 +0000 (UTC)
Received: by lbcao8 with SMTP id ao8so144648406lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=rhpI+IqJik4TtwljIR9TmTpcWQTBtXdQ2UqVLEgXYEg=;
	b=ot/FO8vRPVuQtqkMzGKH0cBlGuWbF6fRyT9Qxt3iueUSIRtqy1e4lapsmE80gOrmJs
	WH5EorLWG9Qceu2Fvk4pW6xh40pDs1cl9vYOTNFtEGC/8KuwgDF1zYEWdfFxPAlousw4
	UHcyPu1h2duwWO1AWYyWTgofUu9yU+0BPZQhBx+sDadYui7NhbXf1R25xca8wVMXba3m
	IyJwPjK8HR0xe0HePtND9N2VYt56tfoRm0oH2qiDY+pomMSoVd0aJthAiGuesAaKqNN/
	Qi1bKZNkJYRTQGcjQ5y7wrgGhuRvn+dHHqv3KVVdt1QI4UL1muqPE85P302ZD8qaoA3e
	GhiQ==
X-Received: by 10.112.17.34 with SMTP id l2mr14723740lbd.117.1445264233044;
	Mon, 19 Oct 2015 07:17:13 -0700 (PDT)
Received: from umbar.auriga.ru ([81.95.26.90])
	by smtp.gmail.com with ESMTPSA id
	yb3sm5452380lbb.39.2015.10.19.07.17.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 07:17:12 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 17:17:08 +0300
Message-Id: <1445264230-1126-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [PATCH 1/3] libsdl: support native compilation
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
X-List-Received-Date: Mon, 19 Oct 2015 14:17:17 -0000

qemu-native can use SDL backend for graphical output. Currently it is
expected to use libsdl provided by the host. However this can lead to
library incompatibilities between host and target. Make libsdl recipe
support native compilation.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index c0d5c6a..c9f3e00 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -17,6 +17,7 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'libglu', '', d)} \
            tslib"
+DEPENDS_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11-native libxrandr-native libxrender-native libxext-native', '', d)}"
 DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
 PR = "r3"
@@ -65,4 +66,4 @@ do_configure_prepend() {
         export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
 }
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.6.1


