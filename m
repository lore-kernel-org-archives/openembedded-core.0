Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB44BCD98D6
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105059.1781424253143410546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CLmvYya8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b613a17bso19545105e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424251; x=1782029051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/I+quYmyLlVUReFUV3MHJwq+d3W3I2377ACdKFUIA8=;
        b=CLmvYya8PJl653FwpOJOAYN3Q4NNPiPIoR07gbLPnKYnJc86AXlastPWpp+kSnLN32
         PHX0V/9bGU9bK6jJkye1+4DnVpJ/++F9JJmYS72UxmcaRsOrXPGT0Sr3SZAvMwYaSpSj
         zDD+uA52WiHR6uYOGART9lCKi/zulsuhQbpY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424251; x=1782029051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8/I+quYmyLlVUReFUV3MHJwq+d3W3I2377ACdKFUIA8=;
        b=j+hYTt3JPvPAcMZXipS8Tm/Ta8kI4qYZjcSUaxlNemZ11cSQZdMeetZiiaNt6UgbKu
         Fs8AY3ZC587BBqlXB3qy5K/aTxyn5LHN7awv4c1pE4ORIMue9PSwrhpKhzIQAaUk4XSy
         WFouaE344CIWtns0PNMJx3ITo8osLKniNKxgKBm80q/PZGp0yZL/CpLvmPp+8W4i8nZP
         zSr+7faqETRqkjcbkUscN5UrjhMREcQ/G8oTNYlX5zyqerfQAxS+cB3OfVcecRAjEWIJ
         /i88I/VopZpfJkPOij/+730IEJhSctANOpwJDBPdKVqHL8vtgTf3XBRMKcMcse0FlyXS
         Ornw==
X-Gm-Message-State: AOJu0Ywy1C74wvwL7ZhVf9imcsxk0Y/3oz/mpjQnN9IfqEjk114BGKWC
	rVhY5xPsIhr/3U+ZWapez5XfhV0SHVzQP0huaHGH2GvdEgdblABVH39AM0fdSTa3kqmUX3ABZkz
	bZbEZ
X-Gm-Gg: Acq92OG85OZFXPglLI3V2GWV53kUeA4ZbJn+vml5PEoLbA9Z4fj5tbNsk5EVkLyRnUY
	ZIDsr5QuIBCOlkDQg+kjS61pum3FJGnYTWBuRKSpzGZtadqSlYW1CCOM0hhpt01h08DMStgkLQp
	aitr5vm0c1xmykzW5cFfsxjFy3P6F1PBfZSi5D1mMjEFhtEQ2i9FAQmbWGtEUDa2qDQmQBRFrrc
	HcIHrkDUh1vJnn4K0r0eYOTV3GqDAU6g6O5ylF0hwjPg5/oWW8ozBGn8Z545K5x2q76p0irqwg3
	4vQrlM2SD0pCWgzyhH4eIqg24fPcm3cfOjxPTzx8qcnMeEVakP3fotiAKoGLtQTOaPqY1vHYCtx
	gxmulvNJO/PsBzkAWaPc/SyiSMN6pLAKzewYc+kpVPi1126lwBAFJOqslegnVbws+s/wqUoAsEc
	dWCOqPLNlFf2SqdAq1D/VbSp5TyIhM8wKBx5bXFVkR56AI34spZxe4
X-Received: by 2002:a05:600c:3b15:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490ec522d44mr137327375e9.33.1781424251240;
        Sun, 14 Jun 2026 01:04:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 40/56] python3-trove-classifiers: upgrade 2026.4.28.13 -> 2026.6.1.19
Date: Sun, 14 Jun 2026 09:02:51 +0100
Message-ID: <20260614080307.4017177-40-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238724

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...2026.4.28.13.bb => python3-trove-classifiers_2026.6.1.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2026.4.28.13.bb => python3-trove-classifiers_2026.6.1.19.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb
index 1ed81eccff2..99282cf3dc6 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "c85bb8a53c3de7330d1699b844ed9fb809a602a09ac15dc79ad6d1a509be0676"
+SRC_URI[sha256sum] = "c5132b4b61a829d11cfbd2d72e97f20a45ed6edb95e45c5efdeb5e00836b2745"
 
 PYPI_PACKAGE = "trove_classifiers"
 

