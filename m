Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A486DC87FD1
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:36:10 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.5262.1753392969802393448
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cndjcP31;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7426c44e014so1297434b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392969; x=1753997769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EUzBbuX5jJiyLwh16AZ5V0k/dCAbCosKGG4CIDqINk=;
        b=cndjcP31+WUTEqVD9Xl37LAcfYLIDgbmYUgWvgpiGt4k6SFHRJbd5JBry5Esbh/hvr
         M3uP/4+SZ59f/Qp6+KKDkqCfV93WuuN/LsHTZpEhKE1Mtq3Pq5zhb0UsRF0dOKO6OvSO
         raEj0LOyrS0qv9/S24pAB+RpLUcKz5JO16oTufiYtUVkXGOKA+FzQkcJrtxeJQAGUCx2
         /P/UvU2nv7i3LHror+xC5wPJMnEkwaFoPZIRa7s5z5R9CM5Y0M1umXj2vuHSHCahaUVd
         x/HE08Jxi5CeRDVHli8Ro64r+pVi8RytwG5X0k0S6VK3GWF3TTmktdcprF9jf0ISZvPB
         d2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392969; x=1753997769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EUzBbuX5jJiyLwh16AZ5V0k/dCAbCosKGG4CIDqINk=;
        b=INeAmQD4Y0QHY6Jo8E//PMZiLA3IpXnfmiccZzt1ef0FmRXkXAPIO4uBSFNPqZ3C8N
         r1e8mwtV9FhqAT/wfv5RFOgWi1qjkb6E6QOnPhxe0h0COAHfDf19aaWISRkT7+lfVbE1
         35wy+K6rEZTuFENHDpITXrkW4+ZxWPDjM9nH4xEmnrwjq6rb8NVgzMAosgEva4ObuO83
         SDZbLwcB2WiQFMJeEJJLUaWJftFU39z8mKQ2x/x+Bej2VKlRuZvOA1CAJQ8w+PBPwrmg
         Htdb0HybXuxzQKfNRXtyX+2mv5mWF72tQfDKvfyya63RZ35aLsOJM69by+XThqBa813k
         jHRw==
X-Gm-Message-State: AOJu0YypNTjU2kq0ZLnHwjPPSvWVje7P1rop//T+CCulE5+yrwPvKkv+
	QUrohVVpTKtUjXyf4epsIBjD0JNCOsJq3XlkvP4k+B7L/fB35EZWrKJ+ODDOx8m/sQPgsGU1jVo
	gcyyx
X-Gm-Gg: ASbGncuKdDP/KV6C+SBlTxi13UCpJIiiJKkkE2+rYsgEUUfyWZR3rsyepNDOkgxvPq8
	PjT37k6RxpyAMQaQy4pIUqtwR/FiDpejtivNxHE+XBd38nWg49UMCEJVVavUEIvQdCxjdUFBBzd
	q10IKMqj0kmucKALxQNjmfULtIhJX8iMGQH6kwDR827jN5OQgkF17QMaovZzE1ncjjBx/yNcOFo
	Q4tR/e7JVx9UfdqoDebQCIbGlwgzTP7a1erlUgwWXisO972ojnaqotN0lGgIYy28M9NF3oSBtyF
	boc5a2jdZXHsImCmXwKLrNgbKIwmfrLvNK4XEK6nUpbyCU5h2Nj0q7Z3E9gRq9WUaEvFS683PBc
	FkzBgPaYYQbaf
X-Google-Smtp-Source: AGHT+IEh7YGKKnBKG6sXcDDJwFzzNPgM7rKkkJY9jJIneK4t0zK0oYbzJoVMKPCClxsiFvVqkBf6og==
X-Received: by 2002:a05:6a00:3a09:b0:746:2ae9:fc42 with SMTP id d2e1a72fcca58-76035df1466mr12605736b3a.19.1753392969020;
        Thu, 24 Jul 2025 14:36:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.36.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:36:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/16] mtools: upgrade 4.0.48 -> 4.0.49
Date: Thu, 24 Jul 2025 14:35:32 -0700
Message-ID: <55bf577848f4dfdd9a5daed77f800332cb2b07e1.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220889

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

New version includes check for overlong file names, see [1].

[1] https://lists.gnu.org/archive/html/info-mtools/2025-06/msg00005.html

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

(From OE-Core rev: 044c2bceefcc12262cb2421e8f1da5f6c2ed9f72)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.48.bb b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.48.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.49.bb
index 646735f3b3..294b2f37b2 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.48.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "03c29aac8735dd7154a989fbc29eaf2b506121ae1c3a35cd0bf2a02e94d271a9"
+SRC_URI[sha256sum] = "6fe5193583d6e7c59da75e63d7234f76c0b07caf33b103894f46f66a871ffc9f"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.43.0


