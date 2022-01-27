Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1244C433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.26273.1643278819740991273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qWVi2k8M;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id m14so3569751wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yxIUn/7Mzo8tuXRo7r/XrEJuA0xBdW6H15xDds7hxBE=;
        b=qWVi2k8MDdit1JoUPrGRe1YP6WbL4DJzG8nAZwxClgtCEF/kr9vNhzpEvqGmkHDgeZ
         dXxmiK6ytg/hDGiuhX2mi5j7OQH4iKZb0QHqiFRbsFzkR4VabSFTNWzmOk5/lyuJ18Ql
         4Q5vFDFKOo8wywM9u+fFHCcYkg3bazywmmPIs5nSwiS94laJYT6f5Ey24VuoK6MEIjtD
         UGUPF4kQ1vKWreNC8/hQclRAXLrwSEw5gqR8loDyrDy3y1+AXMkkX3p8KHpKEx+NDLAU
         FErveXSQuqSlezzhWbo7Ik3v6y5zs7TLNYXhOMlNChd9AuJ53sESlgXLWKN3hwJG5T0O
         wWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxIUn/7Mzo8tuXRo7r/XrEJuA0xBdW6H15xDds7hxBE=;
        b=T1SOoulaQU5trwBpviwLX0UJg27wsuaF7FmW/3wXCubb5xL1kj/Qgl2yRUpGfUdrTY
         xpqw99QTaBSRlzRjdVyYD8LeFP5UspSdLZW64NI1EPccTk25i3SdvJVU3bl9Z0UHvn0U
         3oHUSognNw0AS3JVT0K5cgb7tANradvrQ65AJOTNSYMzde9LENEq0zGpZhR9mD6Etj6L
         UElwrI8hj7wPVbH5daBiteZZi+DyRHacI8ZaHEdVeSV99+bljK6vLNcYVYOQp/MIHPp4
         bBqfT3f4Ea648eT7JuNeITCpeCbWxvRnZh/xmDD7tkd9uY3VY7TeW+5LjpsIUZ4eDlcq
         APBw==
X-Gm-Message-State: AOAM530LDZuFu7x3eflincmUxT49iVrK0DhQbGU7owjg07/g9HlNhnT9
	LsvVFzsomsM8JHn8K/HAuNrzo80NMvs=
X-Google-Smtp-Source: 
 ABdhPJwfUTo96mOlQeA9/yFkcAdX8dgc8FaFyMYV9xyxAroopQvv3/sM5bVmMgzU8OFqvqRciou/iA==
X-Received: by 2002:a05:6000:170c:: with SMTP id
 n12mr2558150wrc.380.1643278818145;
        Thu, 27 Jan 2022 02:20:18 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/17] ethtool: upgrade 5.15 -> 5.16
Date: Thu, 27 Jan 2022 11:19:52 +0100
Message-Id: <20220127102005.3050843-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161026

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.15.bb => ethtool_5.16.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.15.bb => ethtool_5.16.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 0ec3537198..034dc92444 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From cd444e576d446b7ccb51a26a02c0e75d6ee2abf2 Mon Sep 17 00:00:00 2001
+From d98b1e29b89962954690e6a8ddfdd80276407ce7 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6c9453c..7c0f829 100644
+index 8fc93c8..94ee28d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.15, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.16, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.15.bb b/meta/recipes-extended/ethtool/ethtool_5.16.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.15.bb
rename to meta/recipes-extended/ethtool/ethtool_5.16.bb
index 4192dec300..861fe3bb7c 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.15.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.16.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "a6a1638192209269ca74a29d73903f28531ebdf0794f3e0bdfdbdee2dc75d98b"
+SRC_URI[sha256sum] = "4160fa127d75d5a6ebd5e871118486ac730dea2f28b2f1ad40fd1ed3d0d369e0"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.20.1


