Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F00C83F1B
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 15:35:54 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.11917.1752161746172624156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 08:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TasFzfy8;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a58f79d6e9so14377161cf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752161745; x=1752766545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F53uSdsdhLASLFMwvmHR0Nt3J3gte3uPuU+BvrbvxBY=;
        b=TasFzfy8PimqmzNJ7wu5+EMQuMHxT/xtEamls3yt5kFo6RMAgAP1Rn245Z6f75kBOr
         SHLJ8ZB6K63Gu+ldZSa+pk5MinljuP6BOzhMcUj4CbhgXnCDlIRFNQB97O262HLenurw
         WrreSrEzbLuP8mSDfsB/kSwxYA/2Z41LKp2KNkViu3IZjQgBh/uCgquMf4iFz2S/+K8p
         CIBRKSzcic3metLWc+8OEMqx+M3CsVYtixqYwhFf5Bs9Lm99v6Rm5BWeZTsyIq9NiUJb
         EHy7Z/57ZZeUyZfalTc7w5W8BGLZ2O91eMi/DDrTmsbZbSTymFjQh3fzH4jvGbwbTrH3
         Asag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752161745; x=1752766545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F53uSdsdhLASLFMwvmHR0Nt3J3gte3uPuU+BvrbvxBY=;
        b=jB9t0QAd9c0qcmWZNm8+acTqbk+WiN3xG6JTDbDLsoqQywBAPlzRhqFH12UNl/OOZ8
         a8n9q/0LAoPy2kiB6QbBu5XNwy/t992H4bUqBm/0yJ1iSTcIUVdMcERj3qmBks+aHNby
         VTa93qyLdxkxs9Z24dcZ2dgyKeu6b9sJiA/L8y3Hq+2835YPL9Q7Ma7zz4jb+qzvMRVv
         ci9uC7y5ruLp5JKLL6XRjI4fvAx+0bAFJuFqcck/eM8bdPfdLzhnJ9y9TGRUZLH6X5sk
         8Q4o5sTZ25qwwmXEFRboRgHqUdM90ZfR8hztU/89JYxiscGCRukcolgnpdoesPXB/P3m
         uOXw==
X-Gm-Message-State: AOJu0YwewevOdQA6gEgRCQ38UdcIBfHfIgcFXZ0mzVqxrqDIqHV6fa1W
	jB//Jw7tHiArbvfg1Rp4KB42zigqQgARF8Eh/WO1nDcHL2mqS+50XNCh
X-Gm-Gg: ASbGncvuif8kysLpmBLD3tdnicB3kzyk3e5B7FYRAh9ubpTdcPFfdrh2huiZ9/nA+tM
	OyRhnH6oCI0/LWJb0eoieFvi1+at0A+OxYExNt7R4vqYFd5+Xy4nDmtfp12w/aKyKElQGZXE1Vp
	tWV8r+lJOWyot0kWNdoyXx7Ooi0KS1JeJ+nCNx6CHQRhWVJd1c6bKBE04xzaM7adFu6Ynm0kb9M
	8ZSgGu4B1zPtrN1EP1PnmDEgHXsx814ukGo6FMOO37M9ez0G/yoWiGVn516om19Ngg4uaZqDkEb
	GcNAAVsVA8ocSyQCF4MCW0zCHcv0qICJ/6/sBhChY2PBSVUPH74Qx1pcdqBZ29ABJPZqlCBeI/C
	WJkkXD3hwWAAz+OhKq2zkNEMU2PVQokdSV1EcdmSBkOwhx1/FFriXA5u+7Q3XstA=
X-Google-Smtp-Source: AGHT+IETe93fOX1T/H5fRJr7f8ruTCaivFFU00FM/sle8/nA1fbVc+rVVrfky7H+JVkcdv/Z1AD17A==
X-Received: by 2002:a05:622a:5a9a:b0:4a6:b603:c37e with SMTP id d75a77b69052e-4a9dec26abamr112224201cf.2.1752161744695;
        Thu, 10 Jul 2025 08:35:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edc15d2asm9999041cf.10.2025.07.10.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:35:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] libc-headers: update to v6.15
Date: Thu, 10 Jul 2025 11:35:42 -0400
Message-Id: <20250710153542.1196388-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 15:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220125

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernel 6.15+ will be our next reference point, so we bump the libc
headers to match.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

I'll be following this with our new reference kernel in the next
few days. But I was able to build all arches with glibc and muslc
with this bump.

I didn't see any fallout from packages that normally have to be
tweaked when I bump tht headers.

If we are lucky, this is a seamless update (one of the few), but
either way, it needs some wider AB testing.

If I go to 6.16 for the release / reference kernel, I'll bump once
more, but again, either way it is good to have some valid points
along the way to our final libc-headers version.

Bruce

 .../{linux-libc-headers_6.12.bb => linux-libc-headers_6.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.12.bb => linux-libc-headers_6.15.bb} (80%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb
similarity index 80%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb
index dd6add38de..70d2fd80ee 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb
@@ -8,5 +8,5 @@ SRC_URI:append:libc-musl = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "b1a2562be56e42afb3f8489d4c2a7ac472ac23098f1ef1c1e40da601f54625eb"
+SRC_URI[sha256sum] = "7586962547803be7ecc4056efc927fb25214548722bd28171172f3599abb9764"
 
-- 
2.39.2


