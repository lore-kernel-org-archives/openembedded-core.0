Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111B0C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 09:05:58 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.156669.1692176754525153159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 02:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=icng/9ox;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.47, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99bcc0adab4so817110866b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 02:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692176752; x=1692781552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OkfOgYiiThEWvaA0nG+g0f0BSvl78/mWCH56N2SvtjI=;
        b=icng/9oxMEbqDypSKcnOxlaVmBjKLmx3MrkdwbiIsxSzZQ6bmv6DCLTPTJiI7ymhQJ
         3wi4V9jzbw258cBRdB9RS4N+8igATk78yJZU06TO1nvINpMSSRl4RV1RwRb4Z/7zWJMf
         NtYor/oABzZfw2k0mGqsAwn0zKFOxR9bQtxqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692176752; x=1692781552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkfOgYiiThEWvaA0nG+g0f0BSvl78/mWCH56N2SvtjI=;
        b=IxtO6MFEfwgEZIQ6oWL6GyCZ01xQd5ovP504l4th2sa4Ob+seEKeggFO304qsSP1WQ
         Nsz6srIXw6jL3VhsQHr5rtRZvibT/aOFGL2DgDLhefpxckpbaVCBNTK9dMC+a8LcKG9i
         LiPIglFNuqKk699r/FGWetU+0zrMQAgddnCvyc/k+rscbXkUxdjZsco2AGg9nyEdi2Zg
         5R1b4AryvW5yddYLJBfGHgtsU4zpNyyO8jGYmxvlmM1mqbHzLV/L9Qbf0+Jex+oSrxgI
         QnktixQ6LjN+nawUrwpNbRFSbNJWtKNjKEy++2lWiabFx6XNQjfmg4xXjnOk1OqNmJB8
         ITXQ==
X-Gm-Message-State: AOJu0YwXwN4+PnLgrPPWcNbfVZIPir+/gfEs2V/nDy319jotne3KUJ4T
	XrmdLFGsSu2jNo56XSu0AGZCnuW7ATIgZbhhP4GjdK/Q
X-Google-Smtp-Source: AGHT+IGn7UKss1RPPAFW2dY0DeYh9L5jYbEe0prSEYygFupSDl6MVT4EkJjLMgmqVCKV0yYUGaVgXg==
X-Received: by 2002:a17:906:256:b0:99d:f3d4:8391 with SMTP id 22-20020a170906025600b0099df3d48391mr581204ejl.44.1692176752232;
        Wed, 16 Aug 2023 02:05:52 -0700 (PDT)
Received: from hd-yct-laptop.camp.ccc.de ([2001:67c:20a1:1136:2f83:cb70:b04f:4ebf])
        by smtp.gmail.com with ESMTPSA id a10-20020a170906244a00b00992d70f8078sm8206536ejb.106.2023.08.16.02.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 02:05:51 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] yocto-uninative: Update to 4.2 for glibc 2.38
Date: Wed, 16 Aug 2023 02:05:44 -0700
Message-ID: <20230816090544.17331-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 09:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186119

Uninative 4.2 adds glibc 2.38.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index b3bd7794fb..6596c0f4a2 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "4.1"
+UNINATIVE_MAXGLIBCVERSION = "2.38"
+UNINATIVE_VERSION = "4.2"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b6ff9171aa7d3828bc81197822e804725908856bbd488bf412121cc0deddcb60"
-UNINATIVE_CHECKSUM[i686] ?= "6354fd2e09af1f111bad5e34ce7af4f9ad7cd266188af7eeceaeb982afd5354b"
-UNINATIVE_CHECKSUM[x86_64] ?= "f83eca543170adfd2432b135ca655922a4303622d73cc4b13e92b973cdf49e3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "cff40e7bdde50aeda06707af8c001796a71b4cf33c5ae1616e5c47943ff6b94e"
+UNINATIVE_CHECKSUM[i686] ?= "a70516447e9a9f1465ffaf1c7f89e79d1692d2356d86fd2a5a63acd908db1ff2"
+UNINATIVE_CHECKSUM[x86_64] ?= "6a86d71eeafba4fefec600c9bf8cf4a01324d1eb52788b6e398d3f23c10d19fb"
-- 
2.41.0


