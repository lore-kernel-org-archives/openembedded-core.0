Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04531CDE006
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20459.1782220486869729017
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cs8nJcfs;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso38930025e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220485; x=1782825285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64hfPaR3ZCGTt0j3dgFtHIXQWCvzcBg66HuUDhzXeqk=;
        b=Cs8nJcfse1PM+Mxsj3pcauHwbIseMAKmfky1G34DliRkQLfzU7aXQqpDFSFhaB6CzC
         9STazK6Hs54mafsUjKm93FPBhr4D80WS3ogVegQ4YTMDbe9gS9tVBSuc8p4+oLKPlf/P
         qzHhkbpfBHHaNPHewtkFXE8yEUy5zBdKkxHHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220485; x=1782825285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64hfPaR3ZCGTt0j3dgFtHIXQWCvzcBg66HuUDhzXeqk=;
        b=gblrpF1okk4GQboT3kKOvtlllY+zHHRSHe2ZbAYtq5NU3wvIhuvyql7bnxjKFo+aA4
         p6M2jqGK7FqDFHaqCh4gsjv9n09sLW7hseuCGjVGNYiMOXa5mzvtpfbtMbywvs7QbbaF
         dkK02Crq81q5juwgH3p8c7R9gyBeXVQoYO5F0lzWRMQsK8SMJksefe+p4tPjzlOv7akP
         9Y0emgL3hMwf+AFOAl8WHyU0kCg6TEWWRCylp2D94+mCIXYNlEb8u5TmUmce3E0TC21m
         oqAaYxWYhd0TOvbKdmQugUBp3KiQktvnfSvnMnq+L2P8l2weTXGGLtY/6cFNr9K3zC1e
         4FdQ==
X-Gm-Message-State: AOJu0YzT26ufXC6crzWlhtwKlNesKdRMN9hGYG8IFH41Na0+xmOKe2p2
	VrnG5KxCGSbhvP9xiCxwZTXnORAMytnHNP4qT2gGcFYaypRoimtNEiaTu3mFKzwADJYwM056p41
	ksXOJ
X-Gm-Gg: AfdE7cngMMLVWNvYZA1WCi2mK0ZC1WBPutmc5evOfGRa2H4rnfl5VKQgfmCFa7W+2hr
	zXdkzU6+dirLLIkel6+Wrr7qINQ1PEaIQBrEGQvuy4R+W/WqFKPawnG6gEtyNhuAwlVBYC0hcHj
	Q2yDrSNLvTxmQZyCXOZpq7VcmZ3VzQAN52Yn9yKvxsgLSEZWq0lpwWnaW+5GKu2ocKu7B77Novo
	HG7lhTQjhf+um2xrVBwO3XSbc8bkHDpRyklWhIFdGy9VuVIGbLeQ8/u1PZA61Z+/qYWpNrUBBQW
	tdtk5dkCofLH1gEZZv2CnCctQGZC5BFRo/jlL+wYbWCYn4mX/wYSI/kp+Qk4WERQ36Nu02uBF20
	gE35PquVfOw+VBGD51GT+U5lDF1uQLP1yX3yyV0FF/H+YMSFg+d3c4vch6wap3p5K2jIOLBcbBq
	Ad7xgo00BOx2MhgRWWI3iBnmnqsX0e0toK0ZMg+WVXhOXUpJ5hy1zl8qj+5BChfpRXkzoXqig/p
	E9oQ05ZtDuagH1uEbb2l9689bN/
X-Received: by 2002:a05:600c:350f:b0:492:564f:5603 with SMTP id 5b1f17b1804b1-492564f563amr137229305e9.14.1782220484116;
        Tue, 23 Jun 2026 06:14:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/26] go-binary-native: set status for CVE-2026-39836
Date: Tue, 23 Jun 2026 15:14:05 +0200
Message-ID: <8aab8b31425b3820ef65fc40061b9377c574607b.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239391

From: Sudhir Dumbhare <sudumbha@cisco.com>

This issue affects Windows only. The net.Dial and net.LookupPort
functions can panic when given input containing a NUL byte.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-39836
https://security-tracker.debian.org/tracker/CVE-2026-39836

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-binary-native_1.22.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index 7688a090f40..dd84021cc9e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
 CVE_PRODUCT = "golang:go"
 CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
 CVE_STATUS[CVE-2025-0913] = "not-applicable-platform: Issue only applies on Windows"
+CVE_STATUS[CVE-2026-39836] = "not-applicable-platform: Issue only applies on Windows"
 
 S = "${WORKDIR}/go"
 

