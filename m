Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EFFEEF334
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:56:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40181.1772700951113969344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I6Y585dS;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso64609825e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700949; x=1773305749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzRtz2kQKFk0agpovMJatOOGc0oV13I2FcQL+YGZZeg=;
        b=I6Y585dS7qnFTUqS9TEJOVGxpA64Sc/1yQZ0QwNYyUEbhonEfwlKqVOHDjS0/j+lRb
         H+ej2DO9rFPW4JVcSJ8sPCRX6oIzHrnEHweOgYUxXlfvIpB+KsfAqCnbN6d/vZ+U+H/j
         89D/Vm2Uy3OwCHEEoIxCcvXljPbD6U01O/HVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700949; x=1773305749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pzRtz2kQKFk0agpovMJatOOGc0oV13I2FcQL+YGZZeg=;
        b=QUe5f+1YFu+IPKg3U57upBST29JtEegHeULtUXoPAIl/K7B9e1fI4VCbYh6JTdP+up
         Jq4Y+r4tE1smXXBkX1koIXz/eTrTIwX+2JvNoQR+u5xiWw3NaU5AN+3Jw6YdsKrewNrD
         ZTAjZ/NJOpV7BTC6L71xLCyPs1mIJOChSnS7M2C+JtyQt7M92++V+UC0VIL/tCIDrQ1e
         z/UtsqQukMQA13Rbhq0pB4JVNryrk9+jLUGyQz9dsOqdd6Y6X9ooiTb1KtTZqWW9hQsy
         uH4K4MqXJXj89RgRXcQnzCjEpWdNhP+jKTHC+rR/k2yoIduyfpjIneT7+MChw+4lokcG
         0gjw==
X-Gm-Message-State: AOJu0YyG9I8tJfZuaJUqKliSG48pGldpInrNkgEBItqWvhalDt09R46z
	4XkpDQCOlFPv7d7+ZACKSifefPBw8jlkhEOtjK+LIbae4AYeZKRK83U1STqbRRzGQu2r965467G
	ayLRh
X-Gm-Gg: ATEYQzzA49a5wHS/FcPezWrV/qRRZIVWS6MNm3DSR9d6Eg1LsjK5H8JHG993Hnat5Kp
	Uv4KseyeVMQvFmWDWRYsIki9ycvpCS6DQsmsfZCdKRl7JMmwmxvvtdb9osAiaqq7zMqFfA3WNu4
	zrhb6JzP2Mo3xhQHyzhw2scFypFb4EmTJiDbOQRVBEI3+FatvZS4KARmLJykBuVT2sx8T4BKNo2
	V3DSRyng0/JNHjW3xPOciVXNIzZSBf8Hn5cbMW0eF9Sfi/v+RyEbRiiFy6VVJDoMlQ5eu8SLxao
	Wzr2i02edHXMi4SkaIMQNzCM+tk3+aPyQ3oGIad25e3nGWoR7tmtR6V4B4iBkA+wlN1FPoLqSqm
	37SZQVTTuv8A1mRSoTaMVfvjrLcamDeLc9TfjGz4nD0m1zC8Ub8jYkUMfMMHFBybWn0R32bEKpT
	Jb+A8D74qMqAplr+pBW1cfKzzsO6G60ZjHulMPcxw4VaqDsCJsHhVHuA/2j1HMBGbSVKpBet8RD
	2cOXhnw31yvrGQgosiLeHADxwqC
X-Received: by 2002:a05:600c:4503:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-48519899450mr79301235e9.22.1772700949204;
        Thu, 05 Mar 2026 00:55:49 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 05/12] cve-exclusions: set status for 5 CVEs
Date: Thu,  5 Mar 2026 09:54:54 +0100
Message-ID: <896237f72aa5c5b46023fcb39de64935da11dfda.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232457

From: Peter Marko <peter.marko@siemens.com>

Reuse work of Debian researchers and set status for fixed CVEs
accordingly.
These are not tracked by kernel itself, so generated exclusions won't
help here.

* https://security-tracker.debian.org/tracker/CVE-2022-38096
* https://security-tracker.debian.org/tracker/CVE-2023-39176
* https://security-tracker.debian.org/tracker/CVE-2023-39179
* https://security-tracker.debian.org/tracker/CVE-2023-39180
* https://security-tracker.debian.org/tracker/CVE-2023-6535

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 699dbbdf3ab2693bae8a7e0425e2519250fdfec4)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index 80c76433ef2..7d68a9bbaac 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -157,3 +157,19 @@ CVE_STATUS[CVE-2023-7042] = "fixed-version: Fixed from 6.9rc1"
 
 #Fix https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7315dc1e122c85ffdfc8defffbb8f8b616c2eb1a
 CVE_STATUS[CVE-2024-0193] = "fixed-version: Fixed from 6.7"
+
+# Fix https://git.kernel.org/linus/517621b7060096e48e42f545fa6646fc00252eac
+CVE_STATUS[CVE-2022-38096] = "fixed-version: Fixed from 6.9"
+
+# Fix https://git.kernel.org/linus/5aa4fda5aa9c2a5a7bac67b4a12b089ab81fee3c
+# Fix https://git.kernel.org/linus/79ed288cef201f1f212dfb934bcaac75572fb8f6
+CVE_STATUS[CVE-2023-39176] = "fixed-version: Fixed from 6.5"
+
+# Fix https://git.kernel.org/linus/e202a1e8634b186da38cbbff85382ea2b9e297cf
+CVE_STATUS[CVE-2023-39179] = "fixed-version: Fixed from 6.5"
+CVE_STATUS[CVE-2023-39180] = "fixed-version: Fixed from 6.5"
+
+# Fix https://git.kernel.org/linus/efa56305908ba20de2104f1b8508c6a7401833be
+# Fix https://git.kernel.org/linus/0849a5441358cef02586fb2d60f707c0db195628
+# Fix https://git.kernel.org/linus/9a1abc24850eb759e36a2f8869161c3b7254c904
+CVE_STATUS[CVE-2023-6535] = "fixed-version: Fixed from 6.8"

