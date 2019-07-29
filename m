Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 097577CBE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 11:37:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xyMz6YLJz4R
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 13:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564400240;
	bh=V/kFO0LzMGiJeB+LKNpSvJHU0DxgHBbB6jUAUvB9BFQ=;
	h=From:To:Subject:Date:From;
	b=ktdEuBMgBsaAjFveAk/muOkuOukZ0Onlb6IzI+7BHZ4rktRXxEYQwLbcsMm//EAet
	n/8/LCSJtAhvsVclY0wZilGLXpEAR5hlCiLMl8KJcIw6DXoea1/F27YkSSvf7mX86z
	kUMfRgoKC7ni7bxut3LemcVsiB2RcSsP1lXXcJWTnco3QAlgGfuLTtr/qfDNKGbW76
	FCxaIO+gMLOmU4MNG1GWOxQrH80izk5K2UpSWJ26N/M+DcRrXli87WSkzRGvjid1cS
	d8hbe2tnTBMYV0UwwpyS82Sajh31u5P9dF8L9WN0OOmBjJpdyOvrvLEk3exMqtAPGy
	ApeWzbbI8N3WHcZ0Y4FIh7iOG1wXXKpS9q+3VoDT9S70wgeDpTw3Pd1OtHIKbeywzt
	bMMN+iyashILzfQ26wqxaiTkawmAQD5EgD6Fo9ozefeHi8SjiUOtFqMWokY9bcq0d5
	lYeVFgOr8dQCfgF9p8mNGfvsRbJHFWeIrgG6mJL6UJm49WnXPCwg1SbnUKf6jML+jK
	9Fjit8B1trfyDVGVzZHjusjk/Gm/1ud1Rm85R+3YZ1lvMDPX63C3hQG8ern6eNL/wU
	KUuAJ9SeCcjnL3SNDHVKXOQ+LSRuQNi3pyl5d5qUdVkVf3+3oEvtb3Y6wafANl0pbt
	jx23nyTSu5OKen7Jm5uB+a6s=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 14:37:19 +0300
Message-Id: <20190729113719.15521-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] webkitgtk: Reenable on mips
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
X-List-Received-Date: Mon, 29 Jul 2019 11:37:20 -0000

It builds using the generic C_LOOP code.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-gnome/epiphany/epiphany_3.32.3.bb | 3 ---
 meta/recipes-sato/webkit/webkitgtk_2.24.2.bb   | 4 +---
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
index d1c6af52ed..de1b6e2f84 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
@@ -16,8 +16,5 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
 SRC_URI[archive.md5sum] = "c4976507bf3de69f27a050ad09531f5a"
 SRC_URI[archive.sha256sum] = "3ccb6859a43b839b714aa425cb185056f1e8604adbaab6a1bc179d1ba641a33f"
 
-# webkitgtk doesn't work with tune 'mips'
-COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains('DEFAULTTUNE', 'mips', 'null', 'mips.*-linux', d)}"
-
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
index 891266b220..7f01c4e26d 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
@@ -43,8 +43,6 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
 	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
           "
 
-COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains('DEFAULTTUNE', 'mips', 'null', 'mips.*-linux', d)}"
-
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
                    enchant \
@@ -97,7 +95,7 @@ EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 
 # JIT not supported on MIPS either
-EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
+EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
 
 # JIT not supported on X32
 # An attempt was made to upstream JIT support for x32 in
-- 
2.17.1


