Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CE7CDB46F
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:38 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5966.1781960433771079938
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LnrmVEdT;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4629051c946so2202261f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960432; x=1782565232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/taymTgv+5QjxtWuMQ7BnZNfhOd2KmIBjHPaCWqHzUc=;
        b=LnrmVEdTxdhrh2AGVM6C5AslPnv7VVW1G4bB4+PqVX6ZkU/X2A0ba/bO1HL2hypO2Q
         UUC4ZtxB4DltMrEFw/qEcM51ieP+jdXURRit1f78+aciSc7BNeCNqJi+N31c9abkl49B
         /xdxBGHEwUV6cxhDEK3g1IyGW8AI0iEj3m3Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960432; x=1782565232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/taymTgv+5QjxtWuMQ7BnZNfhOd2KmIBjHPaCWqHzUc=;
        b=Box2d6iDWJSvtoYj/nfVEpEzqkmBlUvdSOtv3RVogfWqXsm0F9sdZze+90Rk7ChWvO
         P/1TuQ3aiHc4seUss62dvogZNP3cT3G7Ok0GDNbsWQ/nHUwEQpMNiuRisvbv8JtWD0KY
         agwYJJzvYonSC969nQSFAMnHX5CIbraM4ojR+DUGE+abFLnaRvocg44jEuy//hVgnOzM
         TROZcB7+2UlsffHxVKB4qk5IYK/doHsV7JP85mCfGWhrnkEOfbNwM3C2NgBk+9jKPMv5
         IEqm6pNMhLsyBxzTneTsis8jPnwApb6hO1bjzkdwE5hddsb35KN4OpWp/Ov5P6AleZqj
         5d5g==
X-Gm-Message-State: AOJu0YzbUnESBnSlootvzEo0L/Czhw5QQry+bpDo1TutKZ3lhu89OV7o
	aOxhjGvm/A4rXHNkcNHa4W8W5m60wS8okj71ggIWf4lcGPyq34aXZ3DnpE8nCrnzuk8YBMi/Ndn
	JEQPb
X-Gm-Gg: AfdE7cn4pnkC0QqEMJ8qZaKGfBmD19LKGBquV0GApMstfdSQfJrMZhd91dbSl6uOWOw
	B89uVTdNEldYtuQZhR4KezJKFhBeS36Jg3RTytqHHErzaKyQ/Rk8ZQief6dy7lQqjhy8SJpQ5xc
	c8iZgoJkad3Q27lVCDHInx2H2kfCn+Gd9zEoB9ROSK8rE7IoC7HHq12VCycIjxR/gJ5XUazj4I+
	tDeMK6x021rxlHY4wctehQEDzUb+V3N/DerfzK8HXh45VZL/XfFsuoJnBG/RSxRzRV/azkDBxt6
	NiXAsb68pfmlGWQA63HFfmEeKQ3vktCCVYk4hn529rcKJNB+0NPVavVUluHxLRkstBq4FsH8SwC
	0YO4wZ2mqUs3u9fW3vO9iAU/wPbxVIxuZPGb2icolvLJFGlt4JwBshmRHaQT4WPPzeYDcmIj27M
	382i7qgTUj4BWAiZQ7KU3zKXsCD0953huUc28xan2PBgp8cCyO2ryD7geX5RqxSXRjPzoQczwLI
	3NEL61GCQd3qQlH
X-Received: by 2002:a05:6000:1885:b0:457:ff13:b2a4 with SMTP id ffacd0b85a97d-4651bc7c10dmr10738009f8f.3.1781960431961;
        Sat, 20 Jun 2026 06:00:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/36] python3-pycryptodome: Update LICENSE PD -> Unlicense
Date: Sat, 20 Jun 2026 14:59:48 +0200
Message-ID: <252020203de1a4500fa86ade1449efe189c5c989.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239243

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The "public domain" license in the code matches the SPDX Unlicense
license, update accordinly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a5f842cc62f4b3f7a98ffced085f89110895ab0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python-pycryptodome.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index ec9241e6d5d..466da553e75 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -2,7 +2,7 @@ SUMMARY = "Cryptographic library for Python"
 DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
-LICENSE = "PD & BSD-2-Clause"
+LICENSE = "Unlicense & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93"
 
 inherit pypi

