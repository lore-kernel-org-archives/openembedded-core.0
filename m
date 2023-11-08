Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7659AC04E83
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:57 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.14687.1699453010532210211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RyDijUNV;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-45db0df090eso1861231137.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699453009; x=1700057809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Au3LClJJZTE7UEuamkAnheDGKXX28miAdfflsbKGNik=;
        b=RyDijUNVSwiohAOCfwvONech0ZyTJmy6aIhPNeJKmR8cNmiDdM8llBiig36xCXQBWP
         ieXcZWtbDOe1GQBYeWboxxi4W6NvtAxK3BjB85bCqzd/8OrXIBB9hrv9CqrH+Q0NkXNc
         DaRaV2WUmKz3kWpy9rjDQOtRTfrhsO5qbgiWHygE3cuN+FNkQQr/6RNqkayHboZn7ZYh
         S6Vy9CGiPwhknS5P8UBsfs2L/iMOJ8+FzbKeJHZ6SL0l4B+JOtpkG3pifNFgmtmOXhSh
         VzmdFLyRFxtHF1RuJrbcJJ2oRlOXY99kQkRpE+eNzhYzed3zJcDRObllVp9ZIgnm1mbg
         VSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699453009; x=1700057809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au3LClJJZTE7UEuamkAnheDGKXX28miAdfflsbKGNik=;
        b=ROmUsK39D46JTDkJAnDB5oFga2ad88YV5m8f3LWbgp1KQR9S6P98NpjGNiZjioU+IP
         oTlxQM0xHmfd1HjjewnmVa5FsVnMM6qWME5ggyGOLqt0Vysy4Kh+Q82TE4OBNlIpYvUP
         RrFhr0ffMFp7WZBHLHEsxDnlgp6Ivd/jKfaoNBFLLOSpC1Qh6A9ymbqsR/WW5NPufPxG
         cCd8sdJ+ow3rsAbIz7lH9RXjTuzG6/tXyyGz5iPlEJxSDqhb2zL4iLI4INcYmTpy4r/j
         4QFYNF3rMNFGKB1wu0FeFn4sa+Dq0a+SnRpTuejlfJ9IS4OoyqCD9SucAV1ep7oa1miH
         4yhA==
X-Gm-Message-State: AOJu0YxsuBc/Uysv0vspoxVPcjC+vsE3LclhpzM6tikio4JdTwjfDWQp
	6Ca3zOqndQVsWyuTGVp3ATQCsc0AaOZ2MQGv
X-Google-Smtp-Source: AGHT+IF5Whn2s3k1jyStlbkZTVQbRWJFq/v4e3v0b/dzB1MvWwVhzAxLJtAe1s2ITq1DfGS4Gqn1IA==
X-Received: by 2002:a67:e149:0:b0:45d:9e46:fb50 with SMTP id o9-20020a67e149000000b0045d9e46fb50mr1932374vsl.10.1699453009412;
        Wed, 08 Nov 2023 06:16:49 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/12] linux-yocto/6.5: cfg: restore CONFIG_DEVMEM
Date: Wed,  8 Nov 2023 09:16:28 -0500
Message-Id: <6bba3b163b0425e2490aab21d5745f03151e6f02.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699452828.git.bruce.ashfield@gmail.com>
References: <cover.1699452828.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190349

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: C. Andy Martin
    Email: cam@myfastmail.com
    Subject: security.cfg: restore strict-only /dev/mem access
    Date: Fri, 27 Oct 2023 11:22:06 -0400

    CONFIG_DEVMEM was mistakenly not enabled, which defeats
    CONFIG_STRICT_DEVMEM and friends, as it completely removes all
    /dev/mem support.

    Signed-off-by: C. Andy Martin <cam@myfastmail.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index b34351529d..552df49949 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "a19b0be3292c96a0cc9c0ebb8f9d104d6a4d3e10"
-SRCREV_meta ?= "6e1f2cc45e8c78278fea51b7cfd0bf1180e5605a"
+SRCREV_meta ?= "fa8ffc924f6d91ea09c9f792a5bb8a184ec1657a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index abf548b2c8..194c5c10f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "4e79d57b9c5cc230d2d8cb40c393515fedfed134"
-SRCREV_meta ?= "6e1f2cc45e8c78278fea51b7cfd0bf1180e5605a"
+SRCREV_meta ?= "fa8ffc924f6d91ea09c9f792a5bb8a184ec1657a"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 120a3afe25..bec4b7c049 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
 SRCREV_machine:qemux86-64 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
 SRCREV_machine:qemumips64 ?= "3b119ebc63b9889194b0125bfae96ee5830e538c"
 SRCREV_machine ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
-SRCREV_meta ?= "6e1f2cc45e8c78278fea51b7cfd0bf1180e5605a"
+SRCREV_meta ?= "fa8ffc924f6d91ea09c9f792a5bb8a184ec1657a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


