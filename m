Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB58CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:59:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2252.1762203581805910393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q5gv6+Jj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-295df6ad56cso8832995ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762203581; x=1762808381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHM+X2r5IhHYUn+yN2XwHFIZ5PEZtQ/bTkqL64aMuzw=;
        b=Q5gv6+JjG1W2vqsr06z2XRAgJyWhDyqvKLA1AnIMXA5gQyvTwpFfpcaYSAuc46fyVp
         aeyVsoYPccrAVjViQXE1DX5+lqZpg0us54fNXylv5q8V4dPMWNMXY7EJkICo3KiFw55y
         J533+X+jXTh8aX9e0QRv+M7sUfvO05D9xVefvzAgHxLPsOMhcoIQGgbVVzE6wNeKxqJE
         pNfD3xK9eevE44GdzVNuJvcR/UeRnNKIy2gxpbIJPMGP4LKrxhYnfH7XWb7vDsxXJwUF
         F+41uxfyVIXgkXXXHLn/uONhTrRNWU12Up0qUYOgzI4SJmix6OiGqCn2SH+2Cng7oJE9
         51dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203581; x=1762808381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHM+X2r5IhHYUn+yN2XwHFIZ5PEZtQ/bTkqL64aMuzw=;
        b=V0AP1tE9hi8CfDZ44p7oXdPI82JEF60rOQP3twXE7RdlW7NVdg2sfHRExNj372uVvn
         HrhpRMCNNrlntpeB3bJ6nsQUNfefDitgTFcShwylUIWiHeOnKUXHOKgq+KA2BLrWOLAS
         //furVfpnu4ChqMOtUNcfQebIvCueppR04VTPBV60yCAuuAl14rBl4pupBwsRL+vSTv1
         oCg0ZmmqxXvLeYX+GNUWiGkTwL3KRrjlv094I9cBdLF2wiCsj1CXz1Xx0DYnmMH1QGWL
         axEfvsyG8uHSWPgIgcaQNMDmN8Pj2QTwvWOsQqsghv6nvn6NX07oG/mS5EcI3r+TLb2V
         QOrQ==
X-Gm-Message-State: AOJu0YxcubpnlUXB2Py2ZEsoX0Dfhm6zGASffV7NJE993jeqpSNwW7hu
	ziE+j3k1weOLa79qkMlWvoPqcflQGMHuLWAKjYTWHpg+/GTjtAzgSPnfdVXbb/2LbuH+1HRVvly
	lq+Q2Hjg=
X-Gm-Gg: ASbGncv3d5uZA2i0fqWFkU8gCnk/88BmDWlED0PzG1NwJGc8Pvp03ZCafXMAmHBShgH
	crX46UUjUTS7irJhCVgBiekur1Y/bJA9pNWlMg12ujKcfAWckHCI7aN6CZQJLIwLiZECGGMGfxd
	glIoOlYJMRyy+oFByy8OdY0Py3/mJad7qvyHJvPDWQ53vJdSqt9ibZxceeqq+KccjjhJJn6nYS3
	waGE1EtHDo3VyhOlm7x4h2+LOTMfMU/TmskRsf82p2reL2RHyADsW5LrLvC3y8XXSZyra/V8cZa
	EhZ06jOADzDEq9U4VU41vQbAi94U3zd4buBCJJrQnae39L1aC7CfYqeVU/LVAVB++v64A98YEzw
	0zx3Sok7YT20GlGNiDt4fQp8x22KA7EM2CCTkVaKAwXgQiw9v+kqQctwF5FN4o3f7Lzmywlibpq
	7bZQ==
X-Google-Smtp-Source: AGHT+IGdjfNZwEH3bNNgDJs9t0QHZ0aRUs7ORyET388nVweTuL4rgH4rmyQIuyzB2HoZ3itka/Oo6w==
X-Received: by 2002:a17:902:cece:b0:295:5668:2f26 with SMTP id d9443c01a7336-295566831admr140127455ad.46.1762203580902;
        Mon, 03 Nov 2025 12:59:40 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:6a2d:a521:f4d2:20a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415b02891asm2024911a91.9.2025.11.03.12.59.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:59:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] Don't use ftp.gnome.org
Date: Mon,  3 Nov 2025 12:59:15 -0800
Message-ID: <1e1993b72f2b6109ce3d0ef950553b74b2b37b27.1762203396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762203396.git.steve@sakoman.com>
References: <cover.1762203396.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225704

From: Jason Schonberg <schonm@gmail.com>

http://ftp.gnome.org/pub/gnome redirects to https://download.gnome.org

 bitbake.conf defines ${GNOME_MIRROR} to be https://download.gnome.org/sources/

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


