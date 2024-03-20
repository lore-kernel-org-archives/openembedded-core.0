Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A531AC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:11:13 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.49284.1710951066727228567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3Gyhzlyu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1deffa23bb9so36763445ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951066; x=1711555866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FFBPXBeDZxmg9WIrfGltp9RsfYGigeAeqmBuMuSioo=;
        b=3Gyhzlyu0jnTOjxKC2ItNLsjHpfwiAPODSihbSy/HiZGamYjNXnuuYg1+iVJ/3lyEj
         sLxTIPp8UwM+pBeU0heMax4OlqCF/cT9v81YJgc9eyYf3KSkcTSmK2JeOtMBqHmAcT6V
         J5vrpDK1x38XfPrDKAZHxocZbEMWtz6aHhCyxa4ezDx7Ndf/OGqfEz/Znf+0psG4P6c0
         K4FYriUEI3KZM5raOCMF5Z49pKWkdeptj2p5+tygr5bNU0cHvzvLDmZeIMRJLrxWUz0k
         /V48SY8BCozfsKVdv9uoSIdX6SwXa6JtfNaV7qYlHGxJ8mmCSGJCrTVNWwSsca5ds5u2
         JyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951066; x=1711555866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FFBPXBeDZxmg9WIrfGltp9RsfYGigeAeqmBuMuSioo=;
        b=L4LuaXVT6qwhOs+bXLWlAdrmWjxxGL1lom1llXA6ua9qbT3hIEFgWUzeiRsIrzCqXr
         Um9yo4H9SDc8OSDayuNceO0Wfc1SGxi7yore3C0QW89gaPTWTbzXL0KfN2CYcdLbUH7O
         GqkWdKriiTXvlsr9OcW/ysczNa+ht2hy19znL0jf/bfj3IX2aHzNMCNgEBiTRwtzInaT
         Km2xdsKJ3fjsOV4Oi3SO+ViLfpK6kaDqLgwjSKhJPv7eOBTpDVD14VIRhTdqq1Rh2yu/
         EqTERdY4i3qF9ap/GVa6laZT/4bSnyiOR6vlvBgd6ak2qh50/yJybcfrGcc/smoNb3nq
         nt7g==
X-Gm-Message-State: AOJu0YytsrP7+rnsrO+MaJyDALb/pgqDaDW+q/IwL4VPfRHT7vyiQ/K7
	fteonDuBlPklTQbi8/trmfo0cGkxbRvLFJeS3VCT0yclfYOXfDZAUPMHXm3osXiaND2axIwjC3x
	aSvM=
X-Google-Smtp-Source: AGHT+IEflQ5l7L/uJ4uvytMnzD6evDHVHXfc66lZuPYYtYGHyQSZZSK7RWc2nd+vFPoiUjkNX7jvwQ==
X-Received: by 2002:a17:903:246:b0:1dd:da26:8597 with SMTP id j6-20020a170903024600b001ddda268597mr22782702plh.66.1710951066034;
        Wed, 20 Mar 2024 09:11:06 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] yocto-uninative: Update to 4.4 for glibc 2.39
Date: Wed, 20 Mar 2024 06:09:51 -1000
Message-Id: <d8e3d1eb489f658c8c328a35d41b29bc849c3207.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197384

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56fdd8b79e2f7ec30d2cdcfa0c399a6553efac1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index eaa3e9b31c..4ac66fd506 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.38"
-UNINATIVE_VERSION = "4.3"
+UNINATIVE_MAXGLIBCVERSION = "2.39"
+UNINATIVE_VERSION = "4.4"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "8df05f4a41455018b4303b2e0ea4eac5c960b5a13713f6dbb33dfdb3e32753ec"
-UNINATIVE_CHECKSUM[i686] ?= "bea76b4a97c9ba0077c0dd1295f519cd599dbf71f0ca1c964471c4cdb043addd"
-UNINATIVE_CHECKSUM[x86_64] ?= "1c35f09a75c4096749bbe1e009df4e3968cde151424062cf4aa3ed89db22b030"
+UNINATIVE_CHECKSUM[aarch64] ?= "b61876130f494f75092f21086b4a64ea5fb064045769bf1d32e9cb6af17ea8ec"
+UNINATIVE_CHECKSUM[i686] ?= "9f28627828f0082cc0344eede4d9a861a9a064bfa8f36e072e46212f0fe45fcc"
+UNINATIVE_CHECKSUM[x86_64] ?= "d81c54284be2bb886931fc87281d58177a2cd381cf99d1981f8923039a72a302"
-- 
2.34.1


