Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A87CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 14:34:37 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web01.23233.1761834876919055320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 07:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoAivq6L;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63e255e9a20so1345714d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761834876; x=1762439676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vdDn5WiXLZAG4GYb6GBDuMGipy8kVN07vvJyESoZqI=;
        b=FoAivq6Lyqe6yVLaRDu/sT/+obXExshnsG8EClnUU+4xIYC8b6Ffk/az78J/NfLxg7
         v1hWtMT/9NrcP1+ilxy5r4Q6YaZsJfwuys9UFx328yAF1uS8966VgvkXRuGuWeJEsXuF
         WmVyaVSsk2OuwuRiIIRa2uiF/wr2Gj34LPzcXoYadPVvk0JTvCmm6Ue/nVuSSCs/L/cj
         DwROvcMzZu9Ais9aaL+7oVg9xEQX/1j9SGmv8dIPMqDlUNYjv060z7c4/KBOkK/3Gh5C
         Z83ZTFd/XCmlbqbmHEy78SiHVxnkW4dhPPy/qv20teBNnH/AuxRf7dnNwXpbipFalCSk
         BmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761834876; x=1762439676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vdDn5WiXLZAG4GYb6GBDuMGipy8kVN07vvJyESoZqI=;
        b=eH/FWG28XEnYIAch+Wf+MAd5kRdK8gED02ZWTEY81iK9HR/qTLGbDIZxXDCSSn+l05
         ZXq6Ft8eoYFXy/pEaRZuc8k0YPetlrJ+6VB5caFE6RcLSmJwl+v0AohSKpK+7bjYB+X4
         1PH/bcTcHtaZkgSB3GL/KmxTTVa3ruZMkrfV1qJYqNx3etJ1DRmkZox+vCc4EzMpHkAw
         B7xOlx0SirCe3zuQmez9m1IONB09j6fly0sQa8urzHtzn5kUs1Y83HkfKpgw6FJxpCiK
         Xn1Hm9HMm2qGfTgYm8TFYlJIb+7IGKsYTl3qaGtjt2nj71tAl2yxTH1YBeNvjS3sXVR9
         kX0Q==
X-Gm-Message-State: AOJu0YxjIGohGEJYlHClbzcvUr0sSBU2kL7XVp2rNVVp9O4zzM6g6CMH
	FaHOwFJc+nDgyRpNYbJ+v33CWzUBTyuckXub3sEak51ItRySnlz76VqkAf80dMWp
X-Gm-Gg: ASbGncufrIyXkaoriLyO4425I3isLpZXl0GOy2ClgIYKZUd5p/x7fONiNH6WsNDrNqF
	/NWQHugPm4wzrxaY52Iu2ut5r1ymm8CqalHO8VCskYT9tR4xVUYBAKxu5KNRRgTsxd+qSoY0rwb
	n/TnqR7MKZJaWHamrMgkhfzhBrp5o2c7usG3K5XAV7PtG1OPvrb2juGycEopm26sJcFJ7ChZEoH
	AyWen5KMnh8AkbRuMzSnqqT8HAMBGUV3CxsSwk4LYxafnLWvznut5rIepNa+CS5OXKSQTcQRJpW
	U6fCYo0xylGPKznC8uPvBXJ7lJNquEHJk+SAkx8twopjM2f+8a07X+EV1brlgFCUahADwrEUFpo
	yCWLuxlipGXY/DtlKeuzQugwjG7JnziIKUN9AoKTn7a3GAujU2PtQFe3TxL30clPsTZcn6UQiwW
	nqeY3UxtbY6/6ZJuaKsVSN3LkvLEhpEi4=
X-Google-Smtp-Source: AGHT+IFo64yyKS4xJ2iPL1V2HilxmZJlBYNGtfidAjdW5ZpgKtVAR3GiZ5/xN0cVYPYbIPjlJhshPA==
X-Received: by 2002:a05:690e:d5a:b0:63e:c25:9706 with SMTP id 956f58d0204a3-63f8382a3a9mr2191804d50.2.1761834875495;
        Thu, 30 Oct 2025 07:34:35 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-785ed1e0b24sm46118587b3.51.2025.10.30.07.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:34:35 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [oe-core][kirkstone][PATCH] Don't use ftp.gnome.org
Date: Thu, 30 Oct 2025 10:34:21 -0400
Message-ID: <20251030143421.8110-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 14:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225495

http://ftp.gnome.org/pub/gnome redirects to https://download.gnome.org

 bitbake.conf defines ${GNOME_MIRROR} to be https://download.gnome.org/sources/

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.42.0.bb | 2 +-
 meta/recipes-devtools/vala/vala.inc                      | 2 +-
 meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb                 | 2 +-
 meta/recipes-gnome/libgudev/libgudev_237.bb              | 2 +-
 meta/recipes-support/libxslt/libxslt_1.1.35.bb           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
index 360996dbb7..7798148094 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME="pygobject"
 
 SRC_URI = " \
-    http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
+    ${GNOME_MIRROR}/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
 SRC_URI[sha256sum] = "9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b"
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 87d8fedc3f..3e5194e688 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz"
 inherit autotools pkgconfig upstream-version-is-even
 
 FILES:${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
index 3e974c91e5..e6c8e43923 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
@@ -2,7 +2,7 @@ require gtk+3.inc
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
diff --git a/meta/recipes-gnome/libgudev/libgudev_237.bb b/meta/recipes-gnome/libgudev/libgudev_237.bb
index 9ce43ce34b..4b4121980c 100644
--- a/meta/recipes-gnome/libgudev/libgudev_237.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_237.bb
@@ -22,7 +22,7 @@ GIR_MESON_DISABLE_FLAG = 'disabled'
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-UPSTREAM_CHECK_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgudev/"
+UPSTREAM_CHECK_URI = "${GNOME_MIRROR}/libgudev/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>(\d+))"
 
 # This isn't a GNOME-style version do gnome_verdir fails. Just return the
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index f1532a05c1..fc1fafbf19 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/libxslt/1.1/libxslt-${PV}.tar.xz \
            file://CVE-2024-55549.patch \
            file://CVE-2025-24855.patch \
            file://CVE-2023-40403-001.patch \
-- 
2.43.0


