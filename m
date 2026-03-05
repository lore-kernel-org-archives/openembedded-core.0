Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2D2EEF331
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:55:51 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40180.1772700949650616099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gklT2K3d;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso70734145e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700948; x=1773305748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehiShr3c2C4v1lOrNUpIgEsACwgAJ96RiOm+Q3kxkoE=;
        b=gklT2K3dy1PkN+8Poa98y0a+hilZwlpQKTAmAqKGbLJMVUEUZ2ItZjfJ0l9coP5TnL
         7e6qCO06UYYIu5sQdO52Ataa6bXQLoYEJOtmS7+nmpEdHk57av5OzcqyJh7+ZnmvsGWf
         /HBbPQbSug1Q3q0+8GbtkRRLpV9pHWUIAgPFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700948; x=1773305748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ehiShr3c2C4v1lOrNUpIgEsACwgAJ96RiOm+Q3kxkoE=;
        b=o/UeWteTmPxpY/q6aHMkuAjBeyki7o8EvohVJtg5D/c1NDxa+aPWLHauB3dkCCNjYi
         lNYbR3pxn4lwG+uuv/1NzmZlkfl/gQSJszKRj288OekcNn3ypdGMmqIaqs3uK3pFoW0h
         pSMK4mDFDsTax9DlHk6tPecytmOigiG5yQo/lOopZA6+XAcSgP5Ixlfv5xvcERHkCcbA
         sKOJJ5snGP0zjKzknoDG7XDjRfPsoqcfA1y21+YrGfvul3UZPuG85kEARCKk3qFzFvD7
         Tq2MruYrQhURhP4xT4U+q31A6vQO/AkE9+16v5oP/t32DahaEz4mThuI+heJO7YMX4Uh
         Uwdg==
X-Gm-Message-State: AOJu0Yy7SIWkbGI8Lrjwd308ygbzjDEnxMTRkqflJDvvXKmDz3qXXRBX
	/w+9vWlGrP3b532Ox7EH3/HTfHqG7axdwYaP3vBywCrSC11KuWDmLit3eTVk9FcytJAHRD801g5
	LSHK3
X-Gm-Gg: ATEYQzz5ONEzPrgVWdOfpSFmraZglMK1MtyCpkuxqeNdkU8fzv+JrvDp4/UuEVxa3S5
	I+i/iqDEQxrhhQnAwST1GDpGIfbFEor0n+KOQMIieB2hrAOT9IsqlNJ6Wdhui50S7lscHE15bgo
	M4jRqsj/EF9vL0GZwaxqc9sUMpuDm4bt8vF09JjnO/jK+Ycu6MxjvECvsFogVO+mpm26ZX4311U
	T3HtXxYxErftuQ4vX+gLsylb82c5GtoNcWB+SpRrUSKUYicsakJjG2HWz1L1q6NtXSKk0YFo/D4
	oh9WT0sOx81URfWwxJKZvXjQVieJF0vVY6gx9OKp3AeklHsc72wVEXItkBNwo5RG9FwSTPqHiWl
	m/vk4SF6ikHp8ETbDo+XHVe9CRr3JcR8jBY8Y+wnvxKVeJE6Hijr/s8Vab/FBbMD/8/m7tgcuWk
	pYz+om5ECaq1VXIDF1yueDInt4V/5HgjC26kAwFnZq0F55vLAkkfq+N4BF6W9fo5GKBG6qChtF+
	j5J8XB8Kx79YVvBKFOf18XZwhfaOE4mJkhRzes=
X-Received: by 2002:a05:600c:4f11:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-485198bda46mr81618635e9.30.1772700947682;
        Thu, 05 Mar 2026 00:55:47 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 03/12] gdk-pixbuf: Fix CVE-2025-6199
Date: Thu,  5 Mar 2026 09:54:52 +0100
Message-ID: <7dd07c908c00be28866690e32c2e6c37b3136c27.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232455

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
index 98993cc07d7..f22dc2cd915 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -22,6 +22,7 @@ SRC_URI += "\
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
+           file://CVE-2025-6199.patch \
            "
 
 GIR_MESON_OPTION = 'introspection'

