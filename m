Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19625C35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:07 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.4463.1741809180507653971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n4MS5iKm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-300f92661fcso465519a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809180; x=1742413980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g0NqsgsBOScO59p2TtyQVHHrARTXOsCnX2aRAt9jZE=;
        b=n4MS5iKmc13fTUhePCE0vmvgBHaTgE1EiXLoDiK+A/lQxxWZBKm1zRMr44mdU3uTWA
         mndW1bKZNR7VsaNEc9aNDtc1ULVxHS2Uw4dCCvkK/VSAEZW34xN68h5KyuY1sIRfgecm
         utc+wji9SI3QutEpjfnLDDliEdFs+7ttkbRIQEEZEPSkL8GExzbuBadDfZ6GbMbHig+l
         y6EZF6QJtY/FcSjb05uZQgIhGwGa+TmXRUMzjZ33QA7Sqx6n+bdueQb0Gs47QsPy2ovP
         la4OKKH+504Bu3ZJpeV/wObeDUMjqwKZD0SgQiq9Gon/PHOSOROCzVx5bH4m1btnWvDT
         U8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809180; x=1742413980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2g0NqsgsBOScO59p2TtyQVHHrARTXOsCnX2aRAt9jZE=;
        b=oD/3Ma0717lBU3nwCQsPzXEHp74dg7nCMrNI6HbYsbBOK6j9EmQPGm5CEk0rjNgpBU
         bZObCg+cEGd4M0jueSWk9J2Jf6cv+DyCS38SRGenfhYr0AqUV7FKkRXBxJJ9bj95589H
         rW72LXYLmKEu5sTyMCSjE5Z4VoHIJupbCTuQzKYbd1s5R2u16XtZFJS1XwNgZWoIt7hu
         5CwEDzdoSoZJwzkw+tVOouHJRPd9buyIKxgZIRELC6beTZXUwzx2cl1PX3lBR0T+BKe/
         dOV55AqC8rLvhDNYgHmLquvA2xMT2oqwhfbrHDvcgPiApWI7pss1c3uqdj/nAJO1a2Ak
         yqow==
X-Gm-Message-State: AOJu0YxxzK2d2WzIFVnhAlk0i3dz4NxfRy+WDA8n5D3lYLi6T5U5KxyL
	1zLzir3IJO00Z8wrCIL8Fg/nMy81C33fnMgAagA4rU88MkvXgnm8Ghnnw1koslIzrf2+cD+3w3g
	+
X-Gm-Gg: ASbGncs4di1rAETK2gUZJLIKApQeg9PrCLY35YOWgVV6CB2Ov+9s4VI+0IyOmnPfzAK
	WjLyI1jiudmpermN73OLZznVI+luyPuP8cKACjlNhKyujViBFby3Xf7qMOIhCxac6a9L0qXScHh
	DQQlGKAxe1hT/BcPhslqPKnbAezlMWQNIEkkNhchYUp12xyiNM51dggKg5oY9tWJ7RHGqh9Mw/e
	pGSt+dttNs8hIMt8xMy0vX+lql+5y6+4GktvVUZuGzKtAwhyNRqK+rwtQdyL61YPGxLIOoMa+on
	bdGl3y18lireuXNGVWPcIGS4eernglEHWZE=
X-Google-Smtp-Source: AGHT+IECL8zf2hTMK+RVsu82haYYkLZK3ncfl5lqhHDe67sslS66wRiMdCFhafTAhO4VubdhcOjbjA==
X-Received: by 2002:a05:6a20:729d:b0:1ee:a914:1d67 with SMTP id adf61e73a8af0-1f544ad7917mr37423428637.2.1741809179725;
        Wed, 12 Mar 2025 12:52:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 13/25] grub: patch CVE-2024-45776
Date: Wed, 12 Mar 2025 12:52:21 -0700
Message-ID: <ba19a6126d315c964214e7ca89895ea1ba8b4a15.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212680

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45776.patch           | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45776.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45776.patch b/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
new file mode 100644
index 0000000000..8deea958b8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
@@ -0,0 +1,39 @@
+From 09bd6eb58b0f71ec273916070fa1e2de16897a91 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:56 +0000
+Subject: [PATCH] gettext: Integer overflow leads to heap OOB write or read
+
+Calculation of ctx->grub_gettext_msg_list size in grub_mofile_open() may
+overflow leading to subsequent OOB write or read. This patch fixes the
+issue by replacing grub_zalloc() and explicit multiplication with
+grub_calloc() which does the same thing in safe manner.
+
+Fixes: CVE-2024-45776
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45776
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=09bd6eb58b0f71ec273916070fa1e2de16897a91]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/gettext/gettext.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index e4f4f8ee6..63bb1ab73 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -323,8 +323,8 @@ grub_mofile_open (struct grub_gettext_context *ctx,
+   for (ctx->grub_gettext_max_log = 0; ctx->grub_gettext_max >> ctx->grub_gettext_max_log;
+        ctx->grub_gettext_max_log++);
+ 
+-  ctx->grub_gettext_msg_list = grub_zalloc (ctx->grub_gettext_max
+-					    * sizeof (ctx->grub_gettext_msg_list[0]));
++  ctx->grub_gettext_msg_list = grub_calloc (ctx->grub_gettext_max,
++					    sizeof (ctx->grub_gettext_msg_list[0]));
+   if (!ctx->grub_gettext_msg_list)
+     {
+       grub_file_close (fd);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7d463f8aeb..581855eb4b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -29,6 +29,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0622-01.patch \
            file://CVE-2025-0622-02.patch \
            file://CVE-2025-0622-03.patch \
+           file://CVE-2024-45776.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


