Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0065CDE000
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32868.1782253633250657387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dMi2T90h;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cdae130cso1779275e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253631; x=1782858431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XX/kHUxfa+LCnYOehDouzHV9/zTtokhkAeJ8FtJb7XU=;
        b=dMi2T90h6mnftGiUwzZT7WTJMa6GFnmP8QPyI8RxGDts+MK1q//hmHvJV27vRb5KBp
         6ey61XKqLF3VCce0LAPYq9c982CtsCwqCu6Wolwixea9JQVs3rINC8zXg2YJjMM4uJcY
         G7SwluWc+9Hcz7w1mRSXQPN/0zczsl7s8Vj0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253631; x=1782858431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XX/kHUxfa+LCnYOehDouzHV9/zTtokhkAeJ8FtJb7XU=;
        b=SNO2xyR7qTfcj6sr5zsxPQYQFyA6Z67H7e0ReVRvp/WcG71Vw/ZrpG/UOp/NIJD392
         a8ETETWmh4AMvKUgdR3acMlxxMQlaab84Doy9qdfM3XJ9Ch7nHpeUTvaFVSSXdmUUrfG
         cp131JnVNAuNTQq4IIrEHfYYw7M1dqoh25k1jq2mZyRrFILJRxlEDF2rZD+FuYhkmeeN
         evBDJr9DPE9cbwEvIdY64UM/xuPzWWiz8ZkTTmAX890KQwR6u11c1f9G30i+2MzgEWsK
         gkxeCiEMQzfapFk/5EqnWZBC9ZyjlN8//UCl9ZuDSxxubustawsn6mqRFeTQPxmKW2Ju
         CVEQ==
X-Gm-Message-State: AOJu0Yx8pjVGaobXlde8gh4iGjPwez7hfpuVaYM2B0Lbo3iWiB0y5wuF
	l9FSPyZAFoNq6rzPwzS2zSaNc3lrq4YNuz4/3i+JA5q0ktjuxMMpRvfik7phuyIvsupZTh30pJP
	bj+tU
X-Gm-Gg: AfdE7ckJIq7xW6Rp4mBHV5SHrkv+WpFjNdsOgqL545UFrx0ov31nQ+4PrfN2Q0Uwq05
	n8ifU4/QWj2bF2HZv0n/82dGp7Jy1VRSYR98dpWxBtCa6PNWop6nTNrxFtG9hDaU7VuM65dol3Q
	Gv89NdYyvy3K+LmpGKkNLUB/fs8OmytSVPnURbrvXk0GSUD4Xd0IX4dhV4GaAM2J2Cap3YnSdGV
	dTzDzdTH2AL0XJihFI9gE2VDch33D70Th/JtAkdIfy39V8fW1lVI6YLgXwImxFGHJZgqLXhgOfk
	kiERAduZcfvS5/c5cHGcUEQ6cVWQ/Jd8AIXylSO+ueii1QBY2uYv2KEw++8WS4BU/5e32xGnCxR
	JAqIxvWOimxL0HKjWK8qgQWEX67L2vPz56J2hWe10C4FrhAWTWy9vWt8i4ZYiNoeYAAMUz3rRei
	sM/AP6K2xygiD6f7P4YT1zFNaxFt9FvWpgabCfJyBnAA0Sm3zomYIcF5SH/yoNH5QbKHSbLi33A
	1qspMz34eLFc+cE
X-Received: by 2002:a05:600c:8216:b0:492:4d82:70c1 with SMTP id 5b1f17b1804b1-4926086e676mr6894585e9.22.1782253631445;
        Tue, 23 Jun 2026 15:27:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 25/41] go: set status for CVE-2026-39836
Date: Wed, 24 Jun 2026 00:26:24 +0200
Message-ID: <324359dcb7cbeb15ef51f5cc18924f590c81b1de.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239447

From: Sudhir Dumbhare <sudumbha@cisco.com>

This issue affects Windows only. The net.Dial and net.LookupPort
functions can panic when given input containing a NUL byte.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-39836
https://security-tracker.debian.org/tracker/CVE-2026-39836

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index f85104d6f15..c825ebd25a3 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -65,3 +65,4 @@ SRC_URI += "\
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
 CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2026-39836] = "not-applicable-platform: Issue only applies on Windows"

