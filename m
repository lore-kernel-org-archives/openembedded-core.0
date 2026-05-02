Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5096BCD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9471.1777739384307893814
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GSw5RZFA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1744398f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739382; x=1778344182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7vgQTVxn5AFh46Sk7AVqAMZ8Rzcl9EylsunGf+cU50=;
        b=GSw5RZFAEKFFEitMkQRH9UgX9+xKRf2KTlgmuqiTTHR1hkTm9IzeS3Ml5CZy9pk6WI
         /IEipPCtABMKCPFBwUTsUQszI9ad9RDA0R2a1XGhxvg7jVqwh3eeyAZIYP0z7Na9R3ad
         4u7OSWtdSE3lpsOgmZWQK1kBDRdJczDIpScvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739382; x=1778344182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b7vgQTVxn5AFh46Sk7AVqAMZ8Rzcl9EylsunGf+cU50=;
        b=CTm7SkX1leD4WKOz40HHm0ATwv20Lisj2WGiWzL+mf68cV0XEks6WEn1lceEZ0uX4u
         v/SJEUejHMCf9P6ub8u7HvQ96/KIR9vgSXerj1O8zbEv3h1K4YEGcbLi2dnJ5febW+0g
         RyKF7LU6bYxY2CKaCpBcRfyQ66+06bqECzaKkNtpBdgzeav8Dvs5X0AR7OU0ErjIHMk0
         7iVLIe3u9t2qKuZUiHDtOjOjrZnVtKvSESzZuMsinYk1Uq95Dz4hUpT/3qmHIipqxYXI
         dstUmu4JxmhG49G0ZRznEYhT/BoNdqz1SNN8BZyFR0cIiO3Qx/vOMzMf7e7ahTII3biX
         vvNg==
X-Gm-Message-State: AOJu0YyEf2RrhLL/WYj/2ajUY4c2ZkkW4EMO3y8ssCJdKvk5CBLSPdFd
	9RmgKHY7gB+HuJJUIz8KMGaIfWsV2OI2NBxKmfUDOmUvJRE0+kJwtsnaS2R4AKLxELfKFFv4TQ8
	eXgnG9fmYYqh1oi3wf/XJZHe9zBYdAvxquCTOse+PU9O27/CximF81pV6WlljBhfpwpw22u+h/f
	+vqtieugO8G5xl0gs=
X-Gm-Gg: AeBDieunl5rBSpbEXk8oY+jDLdXsWb9fwgsgC0BNlNc+Dh1M9WfGShpfxI8hV0aVInL
	PFnviQLWrsobYW9mmSzrTwcJ9RrXc+zN27pCHMthd7vN8/RH8w6HKnqYw3pEhgSDgyrbCDAzZR4
	uYYPBksszBtDnB5Q3QCjIbjzQ8AokoyraPeiw1G7hCKXW3YkfBzmIoPRKxuNRYTOPIKiaNL18G0
	DojI0Cz0BmOM/t5o5lTcLJRtGghfDa4dnwkQ3bQY6bV7Q0IeuvfX9ZV1t86/v2TO//IEm3LwVPT
	X7YxyIk6bOGnFXBqz90EpmhgHZwfyElyMHsbjKmxBFd7fVTMsI/Thn1XELcNQXjYRiUwEhUQnjW
	dC61SDLIEbkE3BF1T8bxbTvTmtNx7HBjR43UdC1DVld+qxLkzJ6ChVc+TYTPIfXb2uD/IMn0vrI
	oEUpOHuO0SkWmvLghBzu1rBEbKUhCyvstQyOwIltV7MvMZ7DoJVsccZ/dCY6wQUDqpTbOp2R1Ek
	g==
X-Received: by 2002:a5d:5d81:0:b0:43c:f52b:8003 with SMTP id ffacd0b85a97d-44bb6ab1e92mr5340402f8f.36.1777739381990;
        Sat, 02 May 2026 09:29:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/62] ethtool: upgrade 6.19 -> 7.0
Date: Sat,  2 May 2026 17:28:27 +0100
Message-ID: <20260502162929.1377831-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236316

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.19.bb => ethtool_7.0.bb}             | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.19.bb => ethtool_7.0.bb} (94%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index c8e54663c80..dd64ef1a0b8 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 63f7fd18fe8ede3bde7fa54ef22980b4815330ed Mon Sep 17 00:00:00 2001
+From 3f6c7d7d311bc3abac02b4a18da7c49850fc4de4 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ebb978f..57b624b 100644
+index 06e2086..bca01e5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.19, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 7.0, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.19.bb b/meta/recipes-extended/ethtool/ethtool_7.0.bb
similarity index 94%
rename from meta/recipes-extended/ethtool/ethtool_6.19.bb
rename to meta/recipes-extended/ethtool/ethtool_7.0.bb
index 9ed94a901c5..eb5b6467014 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.19.bb
+++ b/meta/recipes-extended/ethtool/ethtool_7.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "1c1a2f9fc02670ab005fb3e5de16688852bd6cea7e15ebc6ec91d0278b00dd79"
+SRC_URI[sha256sum] = "1a17b13dba2aef3897bb66c6140d88dc19e807b7948de3773d37320daae5266c"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 

