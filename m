Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F33E6918F
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87788.1766434088486859252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PUyrWnSu;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7ce5d6627dso670658966b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434087; x=1767038887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdj7FgfZVuGOCg277wUeQgqyk+IvqLeC31M/Z650/dI=;
        b=PUyrWnSuAOE7j8wtW91MKOOXfNltwvqssya7OtWjK48F1zbu/lJ4UjXLYxNUZhVntX
         HzgR5kOgxO8izS6pBrTjpYk2LIIdm05YXPsqgT0fPlxeEo1acB2hUys73t0iPDkjaidg
         KEC1uEX0IvjDHcyALP1oPfjwvSkpa8/V/eRpwgmhtEnK875BAzUw79mvMF05D9jUaRCE
         43UryauZ5wzxnfPMDEd24nXt/ljEGEn1f8qYlveG7QZ2ZI5+JSgf/AX+tCnJKhwhFCff
         ZMBNmpZQig24oOnMwfV77BGnsSjEEsLHVGkctXpFlC2Se1Vnub0SXj0H1Rfu/x5TEYj6
         ex1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434087; x=1767038887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zdj7FgfZVuGOCg277wUeQgqyk+IvqLeC31M/Z650/dI=;
        b=LjrQlRzOLV7Ove6uCsXg0R+wdU4f91qS4zmtGmyk+Xy2suyw6suf3b6FVVApqSq8jd
         O5hG3xOl6R/1Gqpv2/yErPi1eWcNU9dOWRWBjn9WLcVsCKzSZe4Pz2/LmBBYYqZzkQCm
         SFy4G5PMfquoKaJljZKqBOSowYI9Q2CyijXg8U/FQBugvPumh8X6W8weecb19uGR4Fed
         iYMiWD6Sp122ceJlu9uujf0l9M5E8/T24pcxHQqyp08+Vg82fWVuF+L0a/hdYLqehCZd
         zkp/c7SRYgoh7TsIYRvN70STG7tMh/I+LbUrFlnlaWkEQLF/UBxSinFpYtniM6zPoBxm
         RBnA==
X-Gm-Message-State: AOJu0Yz9ias3KQx3HbFXl+5+NmdnnE56Rq1GpMdRBbDMj6MnlFLPqNe8
	r67mKZ1zpdnnUUq44606v4aViPcQv/HYurHhLVCnOa603CaV6ZoTwwbhLHcf0w==
X-Gm-Gg: AY/fxX4F9sCEKqICrtbatMu1d+sx7efCz03J94QjrORawgA0eHvZmsYPKWMOubE/QJt
	jL5LKxT6q1CUWlz98geAoP8u3bKBxIAp7bCdVp5WG14W45x6VtznpZd1iPVn96FtV5UuU8+2Uf2
	Zl2NHJUBOlwhGCFUPvvduz+Bmw1I5icD8A6ZNDnaK2s74OkBt3dE/FKRt+QMjaac13wnd7DYVQC
	Hv9dkdBMlhVJRL6QbbJmrhZA+Ijhh4AKI2wda67qivIry+nGHdbLi028Ic8NfwLESHP9t/Mg4ON
	cw2rr++zWolEQzLaf95IWBLeUsCemxqwd2OMJWBLEWBcu3sp658j3y8UyCpcqJcm5BpGQ/PmjZ/
	7fmGAVGnZcGyrzEQGEzfx3HF66jTj4fxFKOu2xLp/65TOf3n6kb8TYVNdiXvE4rxNBo+Xx6J11G
	aTXoPRsEbfcrT9EnVOHX8PdagUmd3w6WNtPvP1lugSLyHtpXE=
X-Google-Smtp-Source: AGHT+IHuYQUumm6pDA8knmys/uEzMLZujESrZQawOOYxK6UJIGMu77OLbPPG3mrIHs1Q7yXV/uRRHA==
X-Received: by 2002:a17:906:2081:b0:b80:415e:5b2 with SMTP id a640c23a62f3a-b80415e05efmr966530566b.4.1766434086817;
        Mon, 22 Dec 2025 12:08:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 029/114] libdisplay-info: upgrade 0.2.0 -> 0.3.0
Date: Mon, 22 Dec 2025 21:06:11 +0100
Message-ID: <20251222200739.2278706-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228354

From: Alexander Kanavin <alex@linutronix.de>

Add a weston patch to make it compatible with this version.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...d-drm-meson.build-allow-libdisplay-i.patch | 28 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_14.0.2.bb |  1 +
 ...info_0.2.0.bb => libdisplay-info_0.3.0.bb} |  2 +-
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
 rename meta/recipes-support/libdisplay-info/{libdisplay-info_0.2.0.bb => libdisplay-info_0.3.0.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
new file mode 100644
index 0000000000..07916f77b3
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch
@@ -0,0 +1,28 @@
+From fe8166164170465458561581afd55c325d8e138b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 17 Dec 2025 12:54:20 +0100
+Subject: [PATCH] libweston/backend-drm/meson.build: allow libdisplay-info
+ 0.3.0
+
+The patch in the main branch is against top level meson.build,
+so I manually edited in the same tweak in the 14.x codebase.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1815]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ libweston/backend-drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
+index 002669e..a8f2ea5 100644
+--- a/libweston/backend-drm/meson.build
++++ b/libweston/backend-drm/meson.build
+@@ -4,7 +4,7 @@ endif
+ 
+ dep_libdisplay_info = dependency(
+ 	'libdisplay-info',
+-	version: ['>= 0.1.1', '< 0.3.0'],
++	version: ['>= 0.1.1', '< 0.4.0'],
+ 	fallback: ['display-info', 'di_dep'],
+ 	default_options: [
+ 		'werror=false',
diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-graphics/wayland/weston_14.0.2.bb
index 73c9ce38bf..c53b03def0 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
+           file://0001-libweston-backend-drm-meson.build-allow-libdisplay-i.patch \
            "
 
 SRC_URI[sha256sum] = "b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac"
diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
similarity index 92%
rename from meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
rename to meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
index 812a30495e..3dc02261dd 100644
--- a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.3.0.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
 DEPENDS = "hwdata-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
-SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
+SRCREV = "47a5590e9c4eb35d67651b8c05a55f1a48259329"
 
 inherit meson pkgconfig lib_package
-- 
2.47.3


