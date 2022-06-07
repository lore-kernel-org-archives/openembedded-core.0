Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6A5C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 13:59:51 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.12691.1654610389287398660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ij1AuFBe;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 68so4793953qkk.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 06:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rUDD8PEiq/i7kXinJj/d8IAj/3ZBz1ser6NopH0m2Wk=;
        b=Ij1AuFBeP0MsVPvIfQIf47t5rrYCyBBcf6k6TYfZXW3/PLZyY9MCJsjiicB1RyQQ1O
         YRsbBL7nnD+MZWZ0fYbt5CZoHH1yFlA+hmMbWbPRj2ob3Tiuv98b7peAIURXygZno6ce
         ldtiPlCT18/TrtXLkr1a7yXk6PmRzZCgYodRG66d/v8tnhLXEVDc90lYdiSpjE/NReEQ
         5ZSAyZA3fv98W3vMvf7fcNez5exr6HS0NtYV1vJsuCe2OGhldU3oFZPNBA9vV0gbnbJ2
         gYvKiMwkaqA9/HzYcFNH1taED9kpWC3iF9h7R2GqbA5PS552IHD7a1JWwfn/I6pTW0JX
         ao3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rUDD8PEiq/i7kXinJj/d8IAj/3ZBz1ser6NopH0m2Wk=;
        b=B37FDVsYZmxMJhLXbF+FLTkflBwlDnKhg4O8cC1lCkhmShnJmqX6LM/izOL78uW7/J
         ETF1cahFqm8Lh32FtQoizfU7A0qtcjWca/RWPny7cDTbRP6WfwN1UHXjT/ZjBGeuifHB
         NedX/8HVNuyQXQU9C6yVoWxGHL0J7kVhbQxkpzrD23lRFwWpvVy8lPbOeODf84Xu9lp0
         58P5oR9SmvtP8A5Su4tLHjFTQNtOgpEdOniAsfoA+v6o1vO9qCHIDJEQU2tQBEYkKVw1
         TrbmDv8xn+kDhn/4atWerDjYeYD2kxHRGTHH5zMsqoR0ZLDxY24hvV+ghcOJat0WzuFJ
         YJxw==
X-Gm-Message-State: AOAM531KM/3zF1A2hsOYlk4/Z4mwLi5eZDO/UMleWzNdAx+9N4n+5KvH
	ZWMnBc7j1M7L6cT4DrYalJDoiuCBm+xvbA==
X-Google-Smtp-Source: 
 ABdhPJwtDe3XPdU5RPf8+VmQ2pJ/mlfxjhiQ7iQtjZF5s6h9Af2af7SvOwK1CHAxuvVVskLxQVITvA==
X-Received: by 2002:ae9:e910:0:b0:6a6:ae7c:ef25 with SMTP id
 x16-20020ae9e910000000b006a6ae7cef25mr11074599qkf.343.1654610388320;
        Tue, 07 Jun 2022 06:59:48 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a05620a284a00b006a6c552736asm4053134qkp.119.2022.06.07.06.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:59:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/5.15: cfg/xen: Move x86 configs to separate
 file
Date: Tue,  7 Jun 2022 09:59:35 -0400
Message-Id: 
 <8566505b26d3cc87bdd86118a1260b7f20df41d6.1654610230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1654610229.git.bruce.ashfield@gmail.com>
References: <cover.1654610229.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 13:59:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166666

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    ad633e22764 features/xen: Move x86 configs to separate file

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 059c0e9a99..034656017c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "0349dadc971ea2a9ad780b9be95df3c7b9f08eac"
-SRCREV_meta ?= "529199264800b52ae173fc91241c8e64615850e3"
+SRCREV_meta ?= "ad633e2276497d00ecc9b7dab7ce03e429cb2f39"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 40212beed9..e9991a66fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "bec753cf26f9924ed9e4e583032687e4a2a947f4"
-SRCREV_meta ?= "529199264800b52ae173fc91241c8e64615850e3"
+SRCREV_meta ?= "ad633e2276497d00ecc9b7dab7ce03e429cb2f39"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 2128f85355..b7fdaebd3e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
 SRCREV_machine:qemux86-64 ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
 SRCREV_machine:qemumips64 ?= "cc95aac05d6fb9f0fbe1c336127568df916e2fed"
 SRCREV_machine ?= "41470215f97ee60487e6c36b562c5b7ecb8a8c7d"
-SRCREV_meta ?= "529199264800b52ae173fc91241c8e64615850e3"
+SRCREV_meta ?= "ad633e2276497d00ecc9b7dab7ce03e429cb2f39"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


