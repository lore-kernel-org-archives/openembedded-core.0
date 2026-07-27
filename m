Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F609C54F54
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43804.1785192985595760299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Y10VMjdi;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so23934245e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192984; x=1785797784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jDLIHv4DLgNGI4sdQKwr8nddqqyp2rRSKH/Bpntxpc=;
        b=Y10VMjdiD3y4wAlvwiauzAAY7nttSNV7ogYyDK2rJKXMCDft/PWhRqaRUSQdGi7vHc
         UhyLxITIM9/j6fBIc4oWcp84GNMbXDvS6DYrg1oVjgawBjTW2AI9f+DV5c01biZy10w8
         /l+bwI9bJdqzgg8TJeAp4eu+JdXVxflHxuomA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192984; x=1785797784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6jDLIHv4DLgNGI4sdQKwr8nddqqyp2rRSKH/Bpntxpc=;
        b=iaq8ZV+W9tcD3+e3Y51npFPyAv5Cet44IhUXAElibQ318Zacz1E6X2SgqXosk7w1J+
         Zy5wmb6hWdACp4LlcJ3ZRpyTdXLodMx62Nm/8y06EdW6jWM3He/ei/I6YpiXGzGhgKPX
         7h8tyg69jMe/HUHS6chBahnupnxny9BMUuB77vdNwAOV45HbeLCP7XE/bKbOtX4t83qD
         xfoRDA7aAgA36NFFKxK2/58JJ871AmEoIDPuNRo0T4nk5uVGhMCW/mw69LR2zwa/RQfI
         z002Jz1Wk8VBKZVsyL6jxqkDoaMssGZxMq3rLkx+OA9iZ9bf1uxeag84xp2dD7ig0oED
         HcDA==
X-Gm-Message-State: AOJu0YyBT4KWvpUwYzXI63phrA7+lb4YQsh+ipa03pMCN0zJNpZPRqo8
	jhrjUijuoTe/bZZl9/QhnwF0WNvlE4XT3/APJSDF1JGdnaf7C7PDAv3/1KVvvumTXEi5kzJJWYU
	YsE59viI=
X-Gm-Gg: AR+sD12NARAjs+0cspP66Yb0tMUCiEeVm1tUAcmMcERkSiCxWL727WqsG88qGwMpgMy
	y1uN41oJggm32v0/WDSdgU4/11ebrV6WQy4waF0G2Gp1vL+TyhKmU/N+2snmN8kBu6Hk1NHHvIC
	4Qoz1jvCsHtcEEuRHNr606HqU9gYVoLrQ+xelfOqknKWIuJLkPEtXP/qun5v1moUgqDFXBVml7I
	xaGMaTt/TnBFNy9UrWQ+MVprPc9/wpqaFLwKuK2ohSVNWjbY5LA1wJuq0yTu5Uv+lAceC0jOZ46
	DIeSfmtH3vboZJ5YhueE1DK3LglGdSCydqaB5N2ko+B494hTvVbQRTZKNQBn4pHpbCkmhXMWeHf
	ujMjvD96kBkRqWsfa2TKGalArHTkSA+Zaebh4exbNpO16eiJks6eUl5zDCcmYTN8C5A9+/63cFx
	D3vPU/iBJj3niDqk7/eNRg+sXvVxwHF/gfPZVVEZmTPVZuthesONTGL2K9vV3kkpvXrf6CyF6Nh
	QOhJrAJasSmFZMh
X-Received: by 2002:a05:600c:3b27:b0:495:3c6d:f294 with SMTP id 5b1f17b1804b1-496b5717d1bmr126258035e9.23.1785192983872;
        Mon, 27 Jul 2026 15:56:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/36] python3-pyasn1: set CVE_PRODUCT
Date: Tue, 28 Jul 2026 00:55:30 +0200
Message-ID: <676fcd8a20ab5b83835fcf9f56b5fb493384c60e.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242127

From: mark.yang <mark.yang@lge.com>

The default python:pyasn1 does not match the NVD/CNA entries which use
pyasn1 as vendor, so CVEs like CVE-2026-30922 are never reported. Use
the exact pyasn1:pyasn1 pair.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4971337840e8855740409e8f5dadb3ab3661f033)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
index 01157e251e6..b44e8774474 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
@@ -14,4 +14,6 @@ RDEPENDS:${PN}:class-target += " \
     python3-shell \
 "
 
+CVE_PRODUCT = "pyasn1:pyasn1"
+
 BBCLASSEXTEND = "native nativesdk"

