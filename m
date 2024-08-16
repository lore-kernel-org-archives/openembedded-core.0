Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D325EC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 15:46:25 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.151412.1723823176024319216
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 08:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=qPkLNh1H;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7a501dd544eso114363885a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723823175; x=1724427975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ett+ggzc+SjwGmMNGtOIzIryt5XuTBHS9+7YkAAbMFE=;
        b=qPkLNh1HdtOBjW+4MAewfvpv5H/k1hEIt1ophIi9lMNG55DtvfkQjB8mnR7D0tWWES
         KDVdSq3ly3uohFz3S6vPQnk0PT9h3jpJUFJ+YQt2ib2U87zgDE+fXiX2o6tK/LfLNFt9
         dY4qodUCDIAzKT/wn1hbQQtNbb58iusMzHqb2m5F4HSqNFBFdY3kcLz2/l+6rNtWTkjT
         W+PlRcQ2bwAI8X5ne1PS4P2MCb7qkitcd9hEJH4wY3N0dSQiZ9ujKnVua41Hz3wQwowC
         HMdOL00V0KmPlnKqYcTn/7c6Lz084qgEZ303s6u3du1Hft4OU91/aSW9STe4zFCJMWkC
         qM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723823175; x=1724427975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ett+ggzc+SjwGmMNGtOIzIryt5XuTBHS9+7YkAAbMFE=;
        b=drf26/7KueighwlP+HdfWQNKol4hCUUmTOX8YhZRFG/0ZKhxwl+pdD+LUfKHt2/M2A
         rhld9ZYIEn2dWaHfATTu85szRXky1/z7gZzXHeWNjfNrpwtfTD86NXVa07lCXvT1vPYF
         x6pQpmXfSNHt2t3dyeA7PE7U/T4bSTeRzqr1cwc5OuTiuEKtS1HGEkXRJML8dCSTPxJs
         URuYrH/HJ9VocY8/je307qY+tTTvQDPo2RHNFpm7A8gq1llj+GUh7TQ8JfG4wKGC7J+n
         /LqqfynkkEknTIDP9BjX6fxta5LzZCQeQAcKDWiq/aztc01tk5MtBmICKQOmRwgnM58I
         lgWQ==
X-Gm-Message-State: AOJu0Ywaw/u5q2JZLu2rE836Th/y7y+XS9GUKZhl4S5G3CtbJOmxGp+y
	T9mdwGKTiZwNAZnsA6Dx2JvNQhtbEP1PPRL2t2dsJcnfiTuibIoQHui7+1Dvzf+q4WH/COBIGdh
	nAPI=
X-Google-Smtp-Source: AGHT+IGRrtLgK0CYCZCSGQX5lvNndBy3fEq2iwYk5Cul0y2jq478GilHnk8kbLpg/vmH5iCrJCdZOQ==
X-Received: by 2002:a05:620a:2448:b0:79f:515:e211 with SMTP id af79cd13be357-7a5069cc9eemr350928585a.46.1723823174627;
        Fri, 16 Aug 2024 08:46:14 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff0523a6sm186867285a.46.2024.08.16.08.46.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:46:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] ovmf: upgrade edk2-stable202402 -> edk2-stable202405
Date: Fri, 16 Aug 2024 11:46:13 -0400
Message-Id: <20240816154613.4030253-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 15:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203469

Changelog (https://github.com/tianocore/edk2/releases):

New Features & Bug Fixes
- SecurityPkg:Add EFI Device Authentication Signature Database and SPDM
- CryptoPkg:add additional RSAES-OAEP crypto functions
- OvmfPkg:Add 5-level paging support
- OvmfPkg:SEV-SNP Support for running under an SVSM
- OvmfPkg:RBP register shall be cleared in TDVMCALL
- OvmfPkg:Harden #VC instruction emulation (CVE-2024-25742)
- Add SPI bus driver stack
- NetworkPkg: Predictable TCP ISNs
- NetworkPkg: Use of a Weak PseudoRandom Number Generator
- UefiCpuPkg: Add new SmmRelocationLib library

Update Notes
- NetworkPkg SECURITY PATCH CVE-2023-45237 requires the platform to
  provide the right implementation of the EFI_RNG_PROTOCOL (i.e., using
  a GUID that appears in the allowlist) and EFI_HASH2_PROTOCOL. If it is
  not implemented, the platform will lose the ability to do network
  boot.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 085574c0cbd..0d17da1d4d4 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0004-reproducible.patch \
            "
 
-PV = "edk2-stable202402"
-SRCREV = "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
+PV = "edk2-stable202405"
+SRCREV = "3e722403cd16388a0e4044e705a2b34c841d76ca"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 CVE_PRODUCT = "edk2"
-- 
2.39.2


