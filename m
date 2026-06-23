Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5504FCDE003
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20457.1782220484893417670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gcGFxTts;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490a76757e5so35504735e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220483; x=1782825283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGleD6hhpZ+IyQpm/s4yTdo4tp1DsJfwgTMKkfLK6fw=;
        b=gcGFxTtsvDWYoF1amEIqGYu1e5jwDTo8TNIUBJyePrpmqhL49rdgqelK/c/VMac84k
         28M6adxdjZLn0t/Yzb58awxivoMRbh5X4j9A/npy8ToICi7PP24aVeDJ8pZmMBVRTwmY
         +eOGvdfzQ5XFiqyHIXQAF4Fo4olXjViVow6Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220483; x=1782825283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGleD6hhpZ+IyQpm/s4yTdo4tp1DsJfwgTMKkfLK6fw=;
        b=jm4eC/XgaaYipcUzKJ+h+dgsKgLA8oRnWPGXGxS+lJ4MzcgvE3JVg/6J9dQax/tZ/c
         I6xWDQzSVNqj+6tQP8wAaXEU/RsYpJlQm1J6xjfalX5xMbhHRE7K4SHrL2twZ10a3WyQ
         8YbxkXPhA++xkxZWGWPCqIb28pOcmH13dz4uYIZjED+U3xqA7oRtI6w6b0yIo+gDgkzb
         3yqhrNPRI6eYt5rBxgYvRW/ZBjoQYzTv68WMB12IWE7LbpwIdqVwdhd7h43P+Y4ZAoTd
         PS8S8SEhcGYJOpEdAXO6MwsQWclKiinJKVrUVQkwZ6dx5JTVxpXhVsl/WDY3ohM4i8ev
         LtXA==
X-Gm-Message-State: AOJu0YwqXQ9TG9e9x3dj/YZItnXNpQHD1mCHzwDNfHpjKH0b90fltJ9G
	U/Ewtjq6ArwSLf5XL4vPhruEpg1zyB/DeBuoa8adveKertg+6VS6VWtlodfja89Zyek+NPtdBKE
	k07Kp
X-Gm-Gg: AfdE7cnQNHM1S35u8j4ap1L7OVizm78BD5+ItZ3MKMCau4apNSxrX8Ko8+bVwjk9pDr
	++yikyG8/EtUImnhnIpBOZKbDs+bzUAkKM6S/jHbobxhSpfg/KUWiz7Vm52SVi2D/cTqZJhRZMe
	3hk8/bPTzWkbuE3SPLvs0lJ8Wo4HCTYg+kM8znHXPGS0k980yo1d7Hk3GlRcnA7mSXO+WDXANYO
	YUmepHC6goGd/WTrZxRuQGei/B23LqUSgHKUkpPkQdvEEChJvtGeuVxnGubwtUTx4Dtwk0H8QXG
	tdhmGbZk2BctyB+oau662WtkeXEuiDvg9OeyzQx+7XwE+6WAeIHKdGaxphhiHLP4RqdA/uUIKNq
	d9orNCm/BsIRxiCUSPmTUIoNti7zrhFbiALnAm+oacWSb8gRsmpAQ4njPTQqjWKq96sPlS/nUnA
	Xy+M8eBToxNX2VRoBSEUIQ7hLI1llLdSjrDCvvhUGwLY465nvHetAX514UUiIRcz6W+0rQc6Tgl
	ImyYhV/f50KkgbpWA==
X-Received: by 2002:a05:600c:818e:b0:492:4d56:d5fe with SMTP id 5b1f17b1804b1-4925b39249dmr40891505e9.14.1782220483121;
        Tue, 23 Jun 2026 06:14:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/26] apr: Add CVE_PRODUCT to support product name
Date: Tue, 23 Jun 2026 15:14:04 +0200
Message-ID: <d93c564790a51b53347bde257151c778e8867624.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239389

From: Himanshu Jadon <hjadon@cisco.com>

apr is tracked in NVD under apache:portable_runtime rather than the
recipe name apr. Set CVE_PRODUCT accordingly so cve-check uses the
correct NVD product identity for APR.

No additional alias was found to be necessary for this recipe.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit bc3803e12d4938e2de514c39bd5d0f011f883ace)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/apr/apr_1.7.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/apr/apr_1.7.5.bb b/meta/recipes-support/apr/apr_1.7.5.bb
index 78796476e22..7a3445aa201 100644
--- a/meta/recipes-support/apr/apr_1.7.5.bb
+++ b/meta/recipes-support/apr/apr_1.7.5.bb
@@ -136,3 +136,6 @@ do_install_ptest() {
 }
 
 export CONFIG_SHELL="/bin/bash"
+
+# Add CVE_PRODUCT to match the NVD CPE product name
+CVE_PRODUCT = "apache:portable_runtime"

