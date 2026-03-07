Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86403F55119
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 22:52:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19037.1772923974850886205
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 14:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BkYMOmvZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so86946495e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 14:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772923973; x=1773528773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTqA8WctbHwI2mVOZIWaQhzbYg+so1hCFQfeMRXMWvE=;
        b=BkYMOmvZZRSDxB9le0aQ0UMGbrpmqAY8XAsAHUiUOZGNTvO5aAQ+7IMgsjsjfds6T0
         BmqBxIc9v+ZTUmVMe/bfmWdrupz+MPGVY6nUSNC08hohZgd6xs9p7k294lFYqk10aAjG
         pcxffikcl6h3oay+bRz1NrbxM2h/n/8EXdQFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923973; x=1773528773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vTqA8WctbHwI2mVOZIWaQhzbYg+so1hCFQfeMRXMWvE=;
        b=t0xzP22WwQOuyJ2kMXX8oQbvHiLmnGM4UnO64mJCp2jNYTxr9L/ZHG1wH29i4AShND
         y7/xrdJnDNwGk6bEb7wH8sRDqe/XCsr9VxOnpQU/m+kXFWGYFX2JpadHihOjr4is2zIW
         gghFATOrRwn6IJwThVyymY8Y2qOBvvM7or9pvkKhaJFkwQXCJ1jea6AUioZqIFagl5xM
         UkCsW1Yg6g8/CsuKmcHaLJkSLRDCkGDAaLsmJXvWkQxyfPuMaiUbevJfMWhgBgBNT+Ek
         Ajfl7kjUTFt6yrjqkgwWNGN2WN86H6RfwnqdjXJw9yRAoUXNvO6KN8QWuZuM7d2MJIcL
         nm2A==
X-Gm-Message-State: AOJu0YwqHoR3nMdpuBcL7ZDaXErGnfVemlo4rIuuCD2Jcom+3/FValQj
	2pikik5JkvHljzzElB2s6SKYYOSnw3DvAVyZ6k/Ssy7soJCd4uECT+M0PXx8bzp14C2D7KS8KWU
	9AnJZ
X-Gm-Gg: ATEYQzyJhyfrtCvs8ka0cTkPe4eJh+GpOIdS1beVjFUZNi83Kuz8tnLcQ/r9tKEcmNf
	P2MciKFyq1DCiyRxyIAXmKIEbf0lLdbkRgwNviMEkAOlqR/Fr/FDQnN9+1TYs+cu9caDu9ioAcT
	JgGhJKDni/qkKmdstL+ImEVGrXdlCfuDp7a8UIRcruvFHz0U0z0og3bVZtYhIGiRaDFNqRoDSq1
	+RM7UMKEpQLZo+sv11Q6AD9t2LSPUgfpgmJtkqu7XoJYVNKsFLrXHg0Df9W+HXM012rLE6fQ2YQ
	418C7uj179ZtrdgT4FPCykSAyxfOONThgGjbPwyg6zSAsEnBNH3Ug0ZSAxmNQAwoSjY1rcYRCvZ
	IIWirrMsQO2iAmbXw1Tq2AMW5adujtRUlgHO2qzYwYcwi5287Lxi7HBqnrbpHcFYF3Lv3OzHX9b
	8jqromcH1NiXBnuxKQZEJU0jBPdOeuhiOL9f2lOB+jWfCpqMcF27Hnst9qBIn+8c4noIwwxQ8fQ
	BVV3nzjtHxxkyYftayk8KOf9mo=
X-Received: by 2002:a05:600c:474f:b0:485:35d3:ce73 with SMTP id 5b1f17b1804b1-48535d3cf36mr7777055e9.32.1772923972884;
        Sat, 07 Mar 2026 14:52:52 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm133287175e9.6.2026.03.07.14.52.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:52:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/11] gdk-pixbuf: Fix CVE-2025-6199
Date: Sat,  7 Mar 2026 23:52:18 +0100
Message-ID: <f9c759f488ad398e88607ab800b955ef10092aec.1772923420.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772923420.git.yoann.congal@smile.fr>
References: <cover.1772923420.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 22:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232626

From: Shaik Moin <careers.myinfo@gmail.com>

Backport the fix for CVE-2025-6199
Add below patch to fix
CVE-2025-6199.patch

Reference: In Ubuntu and debian, fixed patch is given -> [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32]

Signed-off-by: Shaik Moin <moins@kpit.com>
[YC: Link to Debian security tracker: https://security-tracker.debian.org/tracker/CVE-2025-6199 ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch | 36 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
new file mode 100644
index 00000000000..1952e3ceaf5
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
@@ -0,0 +1,36 @@
+From 140200be0b4d5355aab76a6fd474e17d117045ca Mon Sep 17 00:00:00 2001
+From: lumi <lumi@suwi.moe>
+Date: Sat, 7 Jun 2025 22:27:06 +0200
+Subject: [PATCH] lzw: Fix reporting of bytes written in decoder
+
+When the LZW decoder encounters an invalid code, it stops
+processing the image and returns the whole buffer size.
+It should return the amount of bytes written, instead.
+
+Fixes #257
+
+CVE: CVE-2025-6199
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32]
+
+Signed-off-by: Shaik Moin <moins@kpit.com>
+---
+ gdk-pixbuf/lzw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
+index 15293560b..4f3dd8beb 100644
+--- a/gdk-pixbuf/lzw.c
++++ b/gdk-pixbuf/lzw.c
+@@ -208,7 +208,7 @@ lzw_decoder_feed (LZWDecoder *self,
+                                 /* Invalid code received - just stop here */
+                                 if (self->code >= self->code_table_size) {
+                                         self->last_code = self->eoi_code;
+-                                        return output_length;
++                                        return n_written;
+                                 }
+ 
+                                 /* Convert codeword into indexes */
+-- 
+2.34.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index ff1c7a1fb2c..7c58fe1e1d6 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            file://CVE-2025-7345.patch \
+           file://CVE-2025-6199.patch \
            "
 
 SRC_URI[sha256sum] = "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"

