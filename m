Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82F0CA0ED3
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 05:25:55 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.43322.1725427549105141352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 22:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GpSEClDG;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-26fde6117cfso222133fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 22:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725427548; x=1726032348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ux3hAch/3rr9WvsRiZLfBzepvcbmEsFmFJftgFohTsY=;
        b=GpSEClDG1Syqf8xcEVEzrh8mnXQEdJp8B3Zudi6px9faRuHR5mzwjnrMSkP7tcW6uq
         9n9mx3b/BsXWVG0w6/oMhzcyKKg+R5aUtJqomhazowEliLbz3paMtHMrNy4ZrjKTWnBV
         SaPU3wU54NQCaSN/LDZMhY6LP6AGSsmd5EiuGsUzt7P0N2TLevWeGyD19xV4S5YuRaCG
         2D13nfSynRgM555oxIwjZMQXJ52QN+vOWwLJO1NNqHbjXOVYIeWjblkE4wLelAV8r2Fz
         2XwwmB61VseGlreEY7yWDWm7cY2JPLb6B7IYG6fQ/IcO8ykhH3a+wKpwojiXweoMB983
         2Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725427548; x=1726032348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ux3hAch/3rr9WvsRiZLfBzepvcbmEsFmFJftgFohTsY=;
        b=HEy+VGwkAlVHRjOUySPMCyXBj6DWUBflra5MKV4MCds9RWc5q8K14m+qJX+BB3aY/A
         ZKasAK8gn2KpSPfdb3oYBoMAd+yXWgtr3BUQl30iZ54bp5wyEEokfZPfM/8G8l0gH/Ai
         A8QqeW62sU2x6M84qPpEPFp5fpkQffDgNSQbdXLbBxx4f9JCVJwiLfKyU2trwqui1Wet
         ksSrriU8ikefHLq+AF8ZEBYQ961fIqlsBju7fpYI07tvHVAIffUSGunLcHYnQ1h5VwWq
         8E9DAdbPdQ4+Zuej7SlI2Pdc6oL17lmekmr9el6bJjwcZryQZRln6AH6gGjIK4JzHTe9
         OEZw==
X-Gm-Message-State: AOJu0YxrNMrbneQKYWXTOF4+fCX4q2l0CxCYXfMTDMwBaw02YlJZCPaj
	yHRtNiAMuTXhR3h/n9RbrXSeXZ+Ryhw69DizzkshjLbK2gfYqAL9Mzrqq6X1
X-Google-Smtp-Source: AGHT+IEzUR5FI2MOD7G60hc0ws9g9TcLXenLN5HRaB670YhjgcrzVTDPClUOa4t+LOEws6ylMIJQtA==
X-Received: by 2002:a05:6870:2c91:b0:277:c6e4:273c with SMTP id 586e51a60fabf-277c6e432d6mr14072367fac.45.1725427548223;
        Tue, 03 Sep 2024 22:25:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd962b0sm793183a12.56.2024.09.03.22.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 22:25:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mark Hatle <mark.hatle@amd.com>
Subject: [PATCH] gcc: Fix spurious '/' in GLIBC_DYNAMIC_LINKER on microblaze
Date: Tue,  3 Sep 2024 22:25:44 -0700
Message-ID: <20240904052544.2082232-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 05:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204186

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mark Hatle <mark.hatle@amd.com>
---
 ...fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 6ff16e38e19..4ed55015519 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From b597a2bc85ffdcf780731a44de02799ebc3d8f61 Mon Sep 17 00:00:00 2001
+From 4067ae345f0ff1fbf37c0348f2af09257513b817 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -184,7 +184,7 @@ index e5d84e180e3..98cb49c189f 100644
  #undef GNU_USER_TARGET_LINK_SPEC
  #define GNU_USER_TARGET_LINK_SPEC \
 diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux.h
-index 5ed8ee518be..5553e7cac21 100644
+index 5ed8ee518be..299d1a62c81 100644
 --- a/gcc/config/microblaze/linux.h
 +++ b/gcc/config/microblaze/linux.h
 @@ -28,7 +28,7 @@
@@ -192,7 +192,7 @@ index 5ed8ee518be..5553e7cac21 100644
  #define TLS_NEEDS_GOT 1
  
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
  #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
  
  #if TARGET_BIG_ENDIAN_DEFAULT == 0 /* LE */

