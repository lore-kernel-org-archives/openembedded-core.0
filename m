Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF21CDB470
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6023.1781960433163555133
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nBMf27Zc;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4908b92904fso38709115e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960431; x=1782565231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XZjybpDvxFLDy4lwe8mZ1LQMgNoDhOQH4wBx8WcdtY=;
        b=nBMf27ZcJQHDtO27zP5XZSoOM9DNfOAirut3ujTaGbsxo6tZMcrrwClrI8K2+RBZrM
         m+oUNeyLjaLdDjJ/WvFo8WigIoAtUFi5+aI3DGA7W1iKNrliWp9SMOzo/6y72Bi5al1A
         jenQ8lTdivAGOX09DbiJTrRAYnnbsmR4uCDwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960431; x=1782565231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XZjybpDvxFLDy4lwe8mZ1LQMgNoDhOQH4wBx8WcdtY=;
        b=d9Rf8lT8eXAi/TnvKKUYvMJ7jVs2SNT/v46Ai+6hKJHDMvqscsjmUHtc5H5DNWWkLY
         4NJNi3QQOR3wsZQGNyuwcqOSm9e0zOzfG1bXscVL8qGfL53x2xYai+LoYUneF3+OF9GO
         ierBm8zkrgy5wz/grDEThhlJsnVfLoXGri3KSinkADM8mogJIUaIfqB/ybIU/Yc1C+x0
         rek4VdFQLOO6NRp/fyi1LjdvEXG7Ki5ugn2RXxYr3NB9oywG6nqsxJU2jD0kWjrOkjXR
         7yD+nFSb/Iqpkjbw7cyCtlISrk1UUlqZV8k15wS3f3gJeo15edcuQnt3s4rwc1Hd0bjf
         7DHQ==
X-Gm-Message-State: AOJu0YyQZTjhQELMFjvI62rrkiieCDBZ8r9FSGvN351+6R87jt/4276g
	aYW6aWWpbVdMa0tRqt6Xte8LQWC9N5PbRXX1/1oMcJaRmfpHnDcIGBRSP8aWL1NE07JSIZaIlx9
	J7qP4
X-Gm-Gg: AfdE7cmivx8PWOjbS5PTXbbrbJY2EftwnCfPTturZ6bFKsT9dN9UboCPZP0W33soBOW
	aYFYByrGSVCYY1YPK+9YRcPaUUbt8ZmyaoKk/fxm4tteIEVfBbVgBaBOwf/Uq9BH+Oh0ITZUPrx
	nuy822TlcRhSnIts0mySqEijBDQSWmUjSPZZgk5WcSIK7SBq0wUzZBGPg8ZLZ3aCMLMf4NNjb6n
	SKdZvYTPSS2vPtGCTfYmfpv/ehohinj52SfcQh0QDhlfRI8VuAa+yNeubh/a4nTrRt8QEryZIVw
	OAKOgXjE6axXoDzZ4zH0f8KrtYjELoE+wRAB3h62y1vJFGnQn9Yfzx4iBHWWF2/zmUZHf9BBw4a
	ke/N3SYqscknULAwG1IDouLS+M67tMaHGu+0F/EGySo0Q9ZmE3c0OQzu7k5wbRPuCQvHigtVuZk
	sdfVUrZBhiIA6u/rbr8wX/kkEmOdV6DR54+hBEDVW51As5lhH8DdEacJkhAHhlnF9zoANKwX7u2
	w/MWAwD8ouoDyb0
X-Received: by 2002:a05:600c:8b73:b0:490:c682:e37d with SMTP id 5b1f17b1804b1-4924258f728mr112333285e9.32.1781960431354;
        Sat, 20 Jun 2026 06:00:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 32/36] python3-pyelftools: Update license to Unlicense
Date: Sat, 20 Jun 2026 14:59:47 +0200
Message-ID: <210c7b90a87e98814460b92b68b3447bc65c796e.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239242

From: Joshua Watt <JPEWhacker@gmail.com>

The license used is actually the Unlicense (which is a variant of public
domain), so update license field to reflect this.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b767ca1c436115ab18ab60dda32552ff8a955a8e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pyelftools_0.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
index 447c8ad6afe..7e50cef2488 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
@@ -1,7 +1,7 @@
 SUMMARY = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
 HOMEPAGE = "https://github.com/eliben/pyelftools"
 SECTION = "devel/python"
-LICENSE = "PD"
+LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
 SRC_URI[sha256sum] = "6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5"

