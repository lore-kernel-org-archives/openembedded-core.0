Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2A4C2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.4652.1741809165412264364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Wt0+Ff2f;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22435603572so4564525ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809165; x=1742413965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+dhLEdzbbb3WP7oQTfol2gKG48r/p1juguvxS4YaHc=;
        b=Wt0+Ff2fqu8HVhpUnXQdT7TfL6XzHK6Qo2aiL9xiBiZHRVF/SdKX1VrJaNVWxf5bex
         B8qOGXpaDo8HlNmLMDVIjzo9NDe5TjlbzcvA9670Pye8JeGlIgk/woQwmj68jpIYZo4m
         MoS467ckOPxv4lwb4DuHx3wva6F94raoSa46XWmZ1N6lITU+MagNUTqy04XyBiXHl323
         cXN5lPcvUvay771I/nQ5Fyn2jiFk1fPHRvwztSd0mDgsKdhpWghAMs1hNBF8eRrR8VRJ
         4xmc+zxwVXFFfdRwdxrSm/ao3hHkeoUGZDyyVmSn7XXmzPuOMpjoI9/2K8A1jMnqi5au
         m9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809165; x=1742413965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+dhLEdzbbb3WP7oQTfol2gKG48r/p1juguvxS4YaHc=;
        b=sXtw0zn8kLCa0eAOXK82xd3TvJ7htXjm2f+v0gq9telq5n1RzQWuQfZF1O0uY6m5pn
         sWelmVKquW8LZVQxCojuKnPWkPxiSjtbjuKm2lrRK/jiZ77pPknOTBL5wS/uMOOx+hdH
         FpSYDVs3B7GMahH0elXI7kENMinUzhAsr168AfjfyRuHHD+k6gsUR1SiWHEF4LL/BHQW
         xWnJgrSH+Eh65qoe2nlJUlKpIbrNqf8BedTZjd2w4WN6yR6DbI5mlQ50E/NMvWO2725y
         Ar4upw6IgX4ku78aykaJEpcIJEK/UPPvinNA61H0xkGZdXqU2c3KCYy+t0SkBr6BPdY7
         mjtw==
X-Gm-Message-State: AOJu0YwyQR4xCy9MrqDkXaFVEfyJNsmIeFjrv67CWXNv1snqbUPGJakF
	L5JO9k8KVk9zU/BooCx5WBNcBH6tfLgAQU3cBgtEeYCE7mHhcYZDkQIuWewvtcBlq4+zesu6csF
	n
X-Gm-Gg: ASbGnctKXIII0WAV+kSasoJ0/uMUtiRuyDIAdMuucS+wRaIGzt6YcpoT6JS4krvWSY7
	zRzP+QdcciW5YYdLxVKbLcoGUqD+48mEDR+C6XfJJRCJl5kHhhSbjmDuKo1pZSenvTGMkKMT7q8
	+jgDO6w5yKjZLIqKg65IlNqgUmNx2wi8CQ4EuSZBizkcyVq2KgeuQkXilBZONgb/F5tBtNxWVei
	2VsXFwZDJB8TL9QieGoy4AVItqVzJvpR5uqP7sFppWBxFCIcT6s05UP94tv5imEYOcSM4UxD51k
	uvPdb/FRwsvrKWAAc6NV+7xId+9NmpvKe88=
X-Google-Smtp-Source: AGHT+IHAa5D2eaf7FdhqyxadT5psB6RBrePKcATENCYJqmOX3Zr3TLbuIcIRRFIkOYyQ5spDxLO8Xg==
X-Received: by 2002:a05:6a21:6b04:b0:1f5:5903:edcf with SMTP id adf61e73a8af0-1f55903f14amr28122640637.16.1741809164630;
        Wed, 12 Mar 2025 12:52:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 03/25] grub: drop obsolete CVE statuses
Date: Wed, 12 Mar 2025 12:52:11 -0700
Message-ID: <7d35eefd2290bad78199354157e5d275ceda0ce2.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212670

From: Peter Marko <peter.marko@siemens.com>

CVE-2021-46705 was needed only with 2.06
CVE-2023-4692 and CVE-2023-4693 were fixed in NVD DB meanwhile

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 07b4000e04..c93b9594c8 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -23,11 +23,8 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
 
 CVE_STATUS[CVE-2019-14865] = "not-applicable-platform: applies only to RHEL"
-CVE_STATUS[CVE-2021-46705] = "not-applicable-platform: Applies only to SUSE"
 CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
-CVE_STATUS[CVE-2023-4692]  = "cpe-incorrect: Fixed in version 2.12 already"
-CVE_STATUS[CVE-2023-4693]  = "cpe-incorrect: Fixed in version 2.12 already"
 
 DEPENDS = "flex-native bison-native gettext-native"
 
-- 
2.43.0


