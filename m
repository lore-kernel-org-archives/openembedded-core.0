Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BA0C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.50337.1710953080891462415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rbIR0Kpp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso99114b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953080; x=1711557880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FFBPXBeDZxmg9WIrfGltp9RsfYGigeAeqmBuMuSioo=;
        b=rbIR0Kppd+oCI8BzdxE5YILYi2RBkXH8uma0NTmuIXmZ/NjCmt9z2/uJ3H1swvBIWe
         qOG4HCrxPlwMz4aGRwSo01inKGi7Y7S6OhmqdoAhHc10cDV2eomKhr5YEqyd0R1vx88U
         xC9nAG8jfRG5BQ+HzKPBHRBzy0T5zzPT6M7dBv8jEW6NWONtPEpDIGp0fuz2zdeRhLgw
         bohSg1NESBpD8x+kV3rNzoRzWcYUJh2q8rrh2yktflXI0FJbAC94fY1RWUzGqc/lIfGD
         BW/4PdVr19sx4y5Mb7FgOzDRTymt/1nBwPDGlA+3VME4ap5Wc5NwuFCmImTRKESo0BI4
         zCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953080; x=1711557880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FFBPXBeDZxmg9WIrfGltp9RsfYGigeAeqmBuMuSioo=;
        b=Kus+ARAiaz8ynoXvbevvylOxaUdnoFtF2Z7v/DPWb1LN5Lv/lVz+dBJ+oh+JgEbhi7
         GF70+gJmTf2Po7XmiVS7DN49vJXTsdhqwKE151EVIhuELIZvwLa/CS4oxCOn1swXJ0yj
         VN8wQam+okGHcjkdGbzyzaRen4Nm70ni8VhDxIKrgFc2Y/h6hs7Zcd8IIW5FpJb++k/T
         ONIkpo1VCbFBcSoe7ndkpdU8V4jmZKH8vLNPt61meX7zrrAiEB/KZ+wc/Mq6Wz6YiST9
         GK+GFPaUYSowOQzg6CniRiR9UhqlnB8Z6kqZKHN9yIE2I083xuGdWNxVq2dQ2kELt9zu
         Yprg==
X-Gm-Message-State: AOJu0YwiYyGPgpw2wOCcBJJQA3mbBBX58/w6LV5i9IbhGUlNCNS0n3w6
	jCyJOifT+g3e9YOqIug8dEmUtI2rYKVDjy+EVsCRy0QsHsS25w/YJxY9EJsJdch9DaRuwz9NyvM
	ME7E=
X-Google-Smtp-Source: AGHT+IFWE2TMYxh8MK7LE3FLZ5PBgP2e6hl3jpMcrnB9Ou+bisXm0aKzA7MgMvR3xsI3g8HeY6LL6Q==
X-Received: by 2002:a62:d153:0:b0:6e6:fcd4:5a23 with SMTP id t19-20020a62d153000000b006e6fcd45a23mr12363597pfl.32.1710953079984;
        Wed, 20 Mar 2024 09:44:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] yocto-uninative: Update to 4.4 for glibc 2.39
Date: Wed, 20 Mar 2024 06:44:06 -1000
Message-Id: <d0811b98fa3847dbbfcfe6a80694509bb29aaf9c.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197399

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


