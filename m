Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC22C677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:28 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.91293.1749571765066974713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vvqHijHK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234fcadde3eso66503225ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571764; x=1750176564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmUduIBM+HbdREk56fWYnEa2ynKE99Oi0P5HZ69BRb8=;
        b=vvqHijHKIvap0XVEZI+HlAzsdfoajUdNXv3S1ROyCz0pFNkGUjZJEBBGYyG1+DdjoS
         87iLjX3ryOdWvzhfXYZ/aZX9n2yxj8K748PEr+6ORPAcVp/2r2frnPDFw/V+Lp/cnP6H
         r95Kb7IyobPVmzBZtXFHi9vNNdZXsLVO0HJ8mBLGbkdo2c87jJOYQS0B56OdWSfedE2R
         ySo1pTfJW/0N9wYGdONC2k1/ybhtAfl6FyOuXPBZqdmA3lTytGJyUCHCDdMqZVO6ozSC
         jpjq7A1shcMy62PnACkspeQpDvQNUw97hmpRXxz87ovhdUvBVX6p5NF6HsKz7SuW2LRe
         6xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571764; x=1750176564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmUduIBM+HbdREk56fWYnEa2ynKE99Oi0P5HZ69BRb8=;
        b=oc/s3eiwiBmiv+mi14kEz/j/IdHXvZY7p/gKShkTcWhnHvSI8qT9kEvSAvyNAy1iCc
         hmWfTmOxRMplv781dthIAW6r8LXo4uAYQG32tppvufB95vfG+WoWM8SWhHEUYO65qCfG
         6F7iWp3klhR6EhGvVGs4DaLRpUE1Z1NPcCu/Dn8jxdG7cYBHuc/JDCFqQwuxJBE+GtSf
         jr3U7kmCJ+fm6ij8veUVA2k3xe7TzbM9SD6vSLqu7UHiAtellNBk6pDf4xgLOoDwlbU3
         WWyWKJW6/qi0O52TTo+snWQa5LQIGUMULgrNxs4oYp6aE/xdc4758GJAD5h9+OayzjBh
         nynw==
X-Gm-Message-State: AOJu0YzSRUkGcThMJBLtuOgU5lCw3DESuuERKcbtoG0BHcZyOW9XPC1c
	5bhD4VhL32MJJB2/ygC1olZZn5+dX6hSF6FTWHPchHySyBFQ9DRfOU2E8pyALI6ZUE1qjiGF8ZL
	AThC0
X-Gm-Gg: ASbGncvYxmmMMduHqxpC5D5lWGAczhrQvlzepVL5XmL6xfHAXpbs8wiUShe6ISx8/GO
	WPA1Jfr0QuZZFDV3J8PLGN4GqhRz3jEcQQ4zzvn44bots5l2CvmdCQDRvUAZmFGj9nc2gcadYun
	GOMCe9K4rj8TFxNdRiKPoWt5bdUS7dS5QOK99zqmKFbG4dDu9JmLduL0Yeco7gXiGbIKAOtRJVm
	ooSNdWPwx8Czq7q41Ikps+b1yNq7pf7aiIAk+X0Bt2rAIBWJ88Pv2ho0ZK8lcLIrWkJS0/FRHRN
	hKABwetJaxscL8SKAcHSSXE88Z8IAUGCDdQXDEyCXJrRn0z+4f/DeA==
X-Google-Smtp-Source: AGHT+IGsZiNxm6o7CY7Fi9Mm86a2+ggshTRwhSvY3o7Omaf/ek9J/xr+NI2yJ//XoG+wDOxplVuGPg==
X-Received: by 2002:a17:902:ccd2:b0:235:779:ede3 with SMTP id d9443c01a7336-23601dc0173mr270264175ad.41.1749571763210;
        Tue, 10 Jun 2025 09:09:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 19/32] libsoup-2.4: fix CVE-2025-4969
Date: Tue, 10 Jun 2025 09:08:32 -0700
Message-ID: <e6f07ad948254c445bc9f5c94211148c8b7b7a68.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218388

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/447

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   | 37 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
new file mode 100644
index 0000000000..7bc3e8da99
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
@@ -0,0 +1,37 @@
+From a7d0c58608ed830bedfb6b92aea11e00feb55aa9 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Mon, 19 May 2025 17:48:27 +0200
+Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
+ members
+
+The boundary could be at a place which, calculated, pointed
+before the beginning of the array. Check the bounds, to avoid
+read out of the array bounds.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
+
+CVE: CVE-2025-4969
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/467/diffs?commit_id=b5b4dd10d4810f0c87b4eaffe88504f06e502f33]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index ce2fc10..a29cdf0 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -108,7 +108,7 @@ find_boundary (const char *start, const char *end,
+ 			continue;
+ 
+ 		/* Check that it's at start of line */
+-		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
++		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
+ 			continue;
+ 
+ 		/* Check for "--" or "\r\n" after boundary */
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 911d95901e..e005e7200e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4476.patch \
            file://CVE-2025-32907.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-4969.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


