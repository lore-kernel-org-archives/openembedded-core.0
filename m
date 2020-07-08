Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4714.1594242486477629777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=ZXatwZ2l;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjJ52TNz4t
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242484;
	bh=GD7EruQRuJkv1eY5z4cDk2U0p+cyc8ISHRwODXKbjjc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZXatwZ2l0GK1g9TtX4pmtklbTL9Svb8nrgOwRn0JhfokI6DKMY63lN0hnQGin8RTV
	 GOWfDOObi+5kNkvadl8XA6pE+rO0hj47bnnwXbA3Kkz4kO1nyLNYykCY0xDZwK8Kwg
	 gkaIoG9Pji1e2SSemv9heP99cirdUJNncJIke/RNvId6v/ZCzXTctMWGZLz+PZcg3i
	 hgF2hZFRCuOQHOL15zPSFLU9k6t03l7BG4VKf9Q6pm726BL5OgBqQGoqpql5fl8Dar
	 MBfMavQXLrEWb5xdPlKHBQGoKEfZYb4vbZ4Vk6bJM52qXksl5cw21id9tkc4Tr38QL
	 xGGTv4bsAMKWvzCzcbvQw9U19oYooBQtlZQKYdSJZmbHN3hLrSm6nfM7o/V/CZI0Le
	 31yaN0yLpMnjpFCXBirKi2N73hYtSR3IyV2brMvTe1UFVeH8SPhkuZVPEcENkYseAp
	 LyCktLisJ5gcHwQy0KyTjR56rB4kU5seWkxItKxrxhn/IX5F0HxFzyv+NIxPTLfBmH
	 GFPdaJyQikIYIeJZjxK/rUcPvLf5CRqVe2XBaAZNqLdCM1wpADnMRLu5/CuE/0JtKD
	 HaNYd4xzRZz3InrUnZsTPZwPjspd4SYJX0YIxGf+lLS89EczRttubZLb1jOVUiJ+IG
	 fJBOQTYX5wmIw717kQXwSMLs=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 04/19] gcr: depends on gnupg-native
Date: Thu,  9 Jul 2020 00:07:46 +0300
Message-Id: <20200708210801.5553-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Kai Kang <kai.kang@windriver.com>

It fails to build gcr if no commmand gpg on build host:

| meson.build:44:0: ERROR: Program(s) ['gpg2', 'gpg'] not found or not executable

Add dependency gnupg-native to fix the error.

(From OE-Core rev: da7360247995d7c8e79dfcaa0c0761952a9013f1)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
(cherry picked from commit e4a6eda4c246b2bca059defed796bdab19a7ab5f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-gnome/gcr/gcr_3.28.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gcr/gcr_3.28.1.bb b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
index 2299199c31..64b0569f04 100644
--- a/meta/recipes-gnome/gcr/gcr_3.28.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.28.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt \
+DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
 inherit gnomebase gtk-icon-cache gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection
-- 
2.17.1

