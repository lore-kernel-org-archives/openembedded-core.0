Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB7BC001B3
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:33:54 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.3948.1688092429315787378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cilxTFja;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a1c162cdfeso967575b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092428; x=1690684428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQPGJtg9ZgrTIwlmtdMDyD0VOycpbQjIX1SJDTSLFZU=;
        b=cilxTFjaEffnmnPFKMxiHwGswHj5bmoOiyWeOX0uCh6YF6oYqKag2pa7+epguVk8lX
         kzO2VKX+VvTuemfh5cCGvfMNy4UdCPyUAmlyx+a5DwPk2a7LiTzWBLnZ+TdarBV04Pn4
         J2nAZgVlAxapp1TwPhcO0tkGEyItKvu9gnAfLUiNuFC1BDSMjZHDMbwHvjWEhFBM04Uu
         M7ELGRixDDPstFbzgkBo/uRSZzRwMAQhMm4goKEsiA0pFC8VvmAffaecd/CDvGKkxUp1
         DWmexmkAAOlGnbyTuOlzI9sdxzClQJefeE1Vwsnf3pCMh/aKe3LT8noLNPHeJOOo3wGw
         5rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092428; x=1690684428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQPGJtg9ZgrTIwlmtdMDyD0VOycpbQjIX1SJDTSLFZU=;
        b=W6UP25oRnhyNwrYP8M8q+slsU/lQNB+cbtr08aQ7d/D8+IUDhZfaCjQJwxOIUcsjRU
         FFFprg6nNUe2W9sHdAYd/h6G0C+Fp8BxZusPHpR1H7U0SQOnVX3syqOR6KW07P96+mtQ
         rZy0ZxglT0qrSb3e3TTti5ooAYWVBba1KTtTtu9NeNJRhYASbAwD0iTUtAlZeRyhpmIL
         ktCU7E47tNaM/C/+b8+ap8U0dnfvY228Ia/yT2OF5Iy5d9CkuQz8EjDloxlI63t3cyDy
         LviCs0YhcOdOR059phO3pyiYe8CfZzDUvSRw6fW8C2XJbLtJ/3+sihYU4elCUxm63y3L
         kPQA==
X-Gm-Message-State: AC+VfDwKjnXwgVV1QUxQgue3+eCfLbqmh2+K95v8fAy9WbAwdGlko9Tw
	SZyySdm3PfujjHMEpqGzyel6LWVsAOUmk6SSMbegCg==
X-Google-Smtp-Source: ACHHUZ4lnC89t6cE9D43iDlP5zlM6xkWmt10/avxBfvBDtDPXkfMemuCfUjdTVHhwfooVqojLSzZIA==
X-Received: by 2002:a05:6808:1824:b0:39e:c660:a5fa with SMTP id bh36-20020a056808182400b0039ec660a5famr1796318oib.10.1688092428285;
        Thu, 29 Jun 2023 19:33:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id l22-20020a62be16000000b006815fbe3245sm3028607pff.37.2023.06.29.19.33.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:33:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/10] linux-yocto/5.4: cfg: fix DECNET configuration warning
Date: Thu, 29 Jun 2023 16:33:23 -1000
Message-Id: <b7530e5360babbe9321ee4cf1e336412116a98cb.1688092252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092252.git.steve@sakoman.com>
References: <cover.1688092252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183681

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Dropping CONFIG_DECNET as it has been removed from -stable
and we now get a configuration warning.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 541d169379..d775a60e9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "8d8179549a233e7517523ac12887016451da2e20"
-SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
+SRCREV_meta ?= "465d61ba36f5c7e32d1fddef078d5d2068fcc2cc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 171ff8493c..5e2b2ab6cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "ca5368c73bab4eb276a8e721df28c02ceb8f3eeb"
 SRCREV_machine ?= "abb579170926348d1518bc1a2de8cb1cdf403808"
-SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
+SRCREV_meta ?= "465d61ba36f5c7e32d1fddef078d5d2068fcc2cc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 527728d9d0..336e72eede 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
 SRCREV_machine_qemux86-64 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
 SRCREV_machine_qemumips64 ?= "66cac7d41a43594760f6ac48e848d73315cc5dd3"
 SRCREV_machine ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
-SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
+SRCREV_meta ?= "465d61ba36f5c7e32d1fddef078d5d2068fcc2cc"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.34.1


