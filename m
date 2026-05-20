Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C9ECD5BB3
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7281.1779265266020113921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yQKHUQMp;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48d146705b4so50172675e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265264; x=1779870064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKAibZaJIyPC5sMXiaobr2pZnJFF43Hci6ox8FMVN7s=;
        b=yQKHUQMpRd5M0QMBqE8xdRObix1pZBJoGqdGjrGeE/2qvgZYfH5U6PELs1vsxHf12U
         emFn5CTarL2X9y7f+tpDGtcRtY6tH0AVuRyJnRqwkBV1Gk2TGnbCQPVU7JrB4trenBBy
         Z3OzP7e0XxFj9xvbOKcoCTw9vjpMsvnoC+J90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265264; x=1779870064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oKAibZaJIyPC5sMXiaobr2pZnJFF43Hci6ox8FMVN7s=;
        b=b4U0X1xFBqDvc5pz3ikjyzKGFmEc+Ez60RTUQ4jvn3AdtCors8zTzb3knly0BnehhC
         FCT5w1McHUIyVDrG8JrT77H6ngruK5BBm5dmXNVpeFbchiAZIdvpW19U4NyakT3yfm5V
         8om7yYCHyIBgROpm0pK/bVrnNSa16irDndILi9ygg9+cfadAjN2fji+0cmeamKG6h0h9
         TakFNV9BUXShC5d9QQYuiPh+6S8YAxZDj3+Q1QramY7nVXTCsjIQZBz8vDU7dfgLjeJi
         inei2AeMQ8SKluXGDQ/EoQqvm2k3fZikq3BcNXLRk3cdSty6rimlqvyTVW0/nXCvbGRR
         ub3w==
X-Gm-Message-State: AOJu0Yyse/kIGN2ouogkFQGN7ycPgr1ayLAf6Y8DAnnOV624Y9mVo7K/
	NUjHaRqcMIhzYQ1362lOQQGFIdnoNS9gqLh3VDqMQ/WZdsCFHsKbuCKo00ElgVQgbs0qqboVFVv
	OlLuu
X-Gm-Gg: Acq92OH4ZWB0a1d844+YspuTShyj4Xbl6joUZ9P7aIfvWzpwV523HlGMlPTKHTZV5xv
	3hgiZAxCfOiurv5vW3e4H2bva8qTEsJXIBiwWe5+Z2w0qH1opEwsBOkVnaYg0uY7/h4Vh04+FA1
	LyMfs8X4BkSLUSpw/76B+/gNSB4q8W3DbKWfMkKL5AZx6r3gvW4Qs9fxM6YY2kPO7ELW7Irwa3f
	cT4IwxYWkt6Nl/OClV/q8JhA/tgNzCq20BgAeo1vQxp9gRn+F8X7EyXAUY1L0lgO0AYNzgle/RJ
	QXt9TJaL47Bp3S7xeuffpdm8MQuXsWCArrUiwsmAKWxbHw/HHfZSsIeW6RKuWXC1bPDm2jiocfE
	pSvzT/IjCLz9Iw6TqS7awJDbYGGZXGy+50oTEJbpXrg2bS9+CI1ttpEdXtNo67aWKdnayOfoZP3
	AvlDrYgwcxkZW1tM814ViC2y6IWDBBxTw2Y460waH4yMbBSfxe6cC/Fdp8fpbjkWCm36H8l7VbQ
	Uve4kKOhXy3oM9gGSWW6+VMC/gg
X-Received: by 2002:a05:600c:8184:b0:48f:d1b8:9aa5 with SMTP id 5b1f17b1804b1-48fe60ecd7dmr347858565e9.8.1779265264042;
        Wed, 20 May 2026 01:21:04 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 11/28] libsoup: set status for CVE-2026-2369
Date: Wed, 20 May 2026 10:20:12 +0200
Message-ID: <89d30abf282d593766f4e8362fc595a73488bbc6.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237410

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed by commit in version 3.6.6.
It is RedHat version-less CVE.

[1] https://security-tracker.debian.org/tracker/CVE-2026-2369

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14d6ba9a0f4a2813c1dd7554e4eddf93bd2f2b55)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/libsoup/libsoup_3.6.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index b36976a2be4..792cb26e930 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -63,5 +63,6 @@ BBCLASSEXTEND = "native nativesdk"
 CVE_STATUS[CVE-2026-1467] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1536] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-1801] = "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-2369] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2436] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2443] = "fixed-version: fixed in 3.6.6"

