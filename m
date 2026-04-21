Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF4EF8925A
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 10:41:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22300.1776768111676775887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 03:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bSh1E9Mj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891f625344so21587635e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 03:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776768110; x=1777372910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYwTCwCco7pSyd9RlhyZNoAJXoG9zuuYbYt6fq9BPvY=;
        b=bSh1E9MjMvf6scxs0Zt51Uz8OdjAok9JjcB7WDqArTcd5B09EkKXrnD0KahBnUd7T5
         Ap5N3eF9fs4+ravQpwQIFkvAFq+QzMrhXA2x/yU8gT+riuDVsctSygikJwHm8WByUrII
         uKeEOLTezjdPZ03N/Bvdegt7SpVUF1hk3Eddc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768110; x=1777372910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYwTCwCco7pSyd9RlhyZNoAJXoG9zuuYbYt6fq9BPvY=;
        b=L9YDOvLZmSIB9nJqv72FycIBMhYj4VQAedVXqBk8v1Bzs53lQopSabtZ3GR+ht92Fu
         nTG9oqFkIQKZhjuW32buOVeRAXco6wGcKupguqZvgE1hEIdjxOR579ANXzq1U47qAERR
         nmYsiajZEB2sjT2xaOPzbbDSSc4MIRSHF29/KC0QbhNzHJTJ5ospE3ZXDEMKrCxnfhzd
         H9CUHPYkralTk0Jv11hN+wEq8w5ILsNNnutoxvN1/oJqKddRk78E4Cf29aIDAWVDgw4p
         GCdXNWuZLJJhz1Kn/nNpWwKz/gE31wpx2uPH5QiRKZV+WoBjerfJXRk1yyRCef2XpSGA
         4XQA==
X-Gm-Message-State: AOJu0YzdIukpaUa03mTVXnt0jyF6Q+SE41QZmzDRV25LIWijdb3b6ogM
	4AGsT4361RnaIMLgWBF3nS7zclIAd7iiPBC+06KMeNSakqU+CIczYwMQxWInwKMl95tN881cdrD
	Ucx05QtQ=
X-Gm-Gg: AeBDieu1E0WzDr80v8qAVrFr3RGIs5UvjsJWUjvNTPFCKMIvk9mrViTsHMzrNWSuK4J
	IYecPDvc8gVwD05diutm4EQ1WpWtyWQZ9e2HevHtXItEq6Ed26vO2LrbzR96lopn+mcqVyzMqu9
	ZCc/1dz0ELITPUCaITAsOW/SzHSy96MwDe5hD+JWhgPs3m9+vxw9MdgXSf3wy6t/5s2G1plrSJc
	Hz61hM9gcNXSuzOyNd7YKQKRB7Q5uOy5BT+co87ataTWBsyQuyo0wiL7wnUkdtewvI27m7Xf4xf
	bVoHvM5coImRYao6VkuLYFs4VzCgWn1M93S2ixR18/2QYFPEngDzzCmBDvPRT5EM6wk7ej6GBX8
	816GkGQtqzXng0AsM4jsVLhQ7t+zd0a1l1vz88n9ApxBRmqfF191sD1WUQ/6QtcMFOwDJYWQsP+
	D+msv1OosdTFmgGSWFhjnb6kuN/Nhd16ALXBhEx0S6o97nqLafsJhpMV+Lz4VOwBc=
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fb8859ddmr234463735e9.2.1776768109342;
        Tue, 21 Apr 2026 03:41:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aba4:e0e8:1cef:1732])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm163759995e9.3.2026.04.21.03.41.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:41:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] pseudo: Update to 1.7.4
Date: Tue, 21 Apr 2026 11:41:45 +0100
Message-ID: <20260421104147.1994119-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 10:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235663

Update to pull in a full openat2 wrapper which works on Fedora 44.

This update includes the commits:
  * Makefile.in: Bump version to 1.9.4
  * test: Add renameat2 test cases
  * test: Add openat2 test cases
  * makewrappers/openat2: Add preserve_path option
  * openat2: Implement openat2 wrapper
  * ports/linux/guts/renameat2.c: Add comment why this isn't implemented
  * Add b4 configuration
  * pseudo_setupenvp: Handle malloc failure safely
  * pseudo_setupenvp: Allocate space for new env vars if needed

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4d316299033..68b311cb916 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
-PV = "1.9.3+git"
+SRCREV = "6c0d8c6b81ca7c2ef2b5a9a996605e1a51814442"
+PV = "1.9.4"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

