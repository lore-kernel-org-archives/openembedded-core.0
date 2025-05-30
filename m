Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC9BC5B549
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 15:40:17 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.9118.1748619612801259675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 08:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YLM5CYfk;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.173, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7caeeef95d4so199835485a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748619612; x=1749224412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IG+kSgMHRPRwjkeDgakoCfz7lmqZ3+rQMVMPwuiwI8g=;
        b=YLM5CYfkkIVVH3BPiPsIun1YzXE08xpMHui7KJcB+59wh4LJ1YTC6ZyPFpaUS1+rKa
         Ze3WiZ2Iv/4Aqo/2+Z22ueIM2HVZAqrSRxd/BLUMUfDMZIVWGGxB6x95kxkY/3Kjy7wR
         a7gBcCOtWkU2kAKbh5EaGSzJ+Z5EkSZM5pGeGxtHKh9m+RMrjS3Z0VUriVA4/bWMe2O6
         +Tldu35UbjkkdcRndsaRkZwOtTuCx/BFRcGx69CYlGI6yd0ndWJWAbyjNNLZrmjuNi0A
         IlBdPqY/jpCN5cFxYF4QydrUw6o2iJPe7pbG74IBTDGE4gwOApQQ6R/sV4GgT5NkUUT/
         qrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619612; x=1749224412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IG+kSgMHRPRwjkeDgakoCfz7lmqZ3+rQMVMPwuiwI8g=;
        b=wE1xxu3siHrcAypN85ZV7edfun0OIlHx1ek6TWHLkjUc5RQa5+q92rXUj/tBUyYNdy
         HcWk93lvWvyHrZFXOohPlvG6pd3NP0Zn0+xcGihmh48PNFigxc+k1oQQUM8kPcOzEOGV
         VyoHUYgXCLRTL/KLtWu1XqU93JKfpya/EWFoULG9n/r4GwfJvCOsKTtAgztEgKiM2KId
         /CSgI8M+B/e4YI7NnYnX4JiYYCnWKgE+SlgG5MiI17gz/YJyw3t+TX2WCuncoNPqMqEi
         QcQe2jatHqyJKDeE5SERTuCvHwbM0ROzDGlwQF7cfchlL44Gih7sSGvSESoeX8YgBv3Z
         PKgw==
X-Gm-Message-State: AOJu0YzGkAq7Kl65CGZvyVCe20CmC0dyF2bzNVpAh++N2b9oObXJcliz
	LTmgQEsY23sxYpDhH8IKHIx2kE2xbTWs7p+nahh5Wzrdc/6tuuguwJCuK/gnk36UlMUN9UIwThy
	qDBKG
X-Gm-Gg: ASbGncucl7u+JuXy+zmL+rcd0fDzEmjcI9z+GPORWPxcx9gPGU0m/1Dj7M55ab2/JHr
	7tOwIPMj/d1hvcMHNVGbYfQo06iHKlNu9J4tamTga3cwbRpO3qSU/kbQ7EUlLlNVp2JX1Gy/t/R
	RCKsv9NdoaFXBazHhcAzt72jYA7Ef2bcpJZ73WcySh9oiZ/AQbRc8UhIVezRcmamhGiTU+CABAg
	NQbPZpNYeZQgsMHQQV/964xWePSoFd1yKuKkJOPitcqWjNYQzA4JoFMLt3+n4fvH435TvN6pykA
	BnexKo0mGFf6OIPAJvPpCMdlxZiqs/rLw2rfVGDMkGQ=
X-Google-Smtp-Source: AGHT+IGUwh/0IbYbpNat9RCJO47qqubydjhF0756ZnrxK9u34Z6EsIrOIz4bBhElEr08WbCP6jCxhw==
X-Received: by 2002:a17:902:d4c1:b0:234:a063:e2af with SMTP id d9443c01a7336-23527b95a8fmr58954405ad.0.1748619601497;
        Fri, 30 May 2025 08:40:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf9116sm29903075ad.200.2025.05.30.08.40.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:40:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] binutils: Fix CVE-2025-1182
Date: Fri, 30 May 2025 08:39:44 -0700
Message-ID: <bbfdd5c44a5629b9158b418b5335ec4f1567b3f9.1748619488.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748619488.git.steve@sakoman.com>
References: <cover.1748619488.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217514

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b425859021d17adf62f06fb904797cf8642986ad]
CVE: CVE-2025-1182

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/0040-CVE-2025-1182.patch         | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch

diff --git a/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
new file mode 100644
index 0000000000..682f633927
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0040-CVE-2025-1182.patch
@@ -0,0 +1,31 @@
+From b425859021d17adf62f06fb904797cf8642986ad Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 16:27:38 +0000
+Subject: [PATCH] Fix another illegal memory access triggered by corrupt ELF
+ input files.
+
+PR 32644
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b425859021d17adf62f06fb904797cf8642986ad]
+
+CVE: CVE-2025-1182
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14711,6 +14711,10 @@
+        }
+       else
+        {
++         if (r_symndx >= rcookie->locsymcount)
++           /* This can happen with corrupt input.  */
++           return false;
++
+          /* It's not a relocation against a global symbol,
+             but it could be a relocation against a local
+             symbol for a discarded section.  */
-- 
2.43.0


