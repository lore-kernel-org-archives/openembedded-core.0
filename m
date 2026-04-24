Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD194FC0379
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:50 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31963.1777064205123310151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=N7Wk0czO;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48896199cbaso80392835e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064203; x=1777669003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkaEFcrzHtiCHYOPXLBZ+9n6etF3lqpWSa+xcs3KFtg=;
        b=N7Wk0czOsQslpOGaooVfwZBgCBbYOXgbNc6oBqjTPMDncm2ildiJGItMkg66gwEe/b
         7oxZBk8PI6vGYFF/lvZcWMafP/pv9rfRPElRaMOcJ1VsTSg+3yOteOCuQT6YG/2NrK0w
         CUKg8stGHS5ZhWPL9PQZymia13HQ0lVwROSNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064203; x=1777669003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AkaEFcrzHtiCHYOPXLBZ+9n6etF3lqpWSa+xcs3KFtg=;
        b=PFcislPd80iuPlbnxbkf5QYD+ZDZtdylMBftkOrZmHm7SWtW4txUQZwSPrhmbKGxCp
         qMuGjKI2hbKF2PfYLyEJkLIDfrp5Zt5LYXvrerMSmyFGNsksqoOGboLOp40RWL8IJ4EC
         6YF/8n4LghUzlbww/dfj9ik+KMVKM9a7n3BYk1VsKFAJNwyRHhiNISvpgKk8cKksYMH5
         HHGgJxqpQ+rrVd3/WcpQnpVXkQlW5tcC6WXA1K2l+03LroRl8P3X0JN4Ihf03HcBxLYP
         p8Y7+9FADhf5Wz491T1ffS7C70rPQTSamnk5JTbF2PZ8h0VOa5iJXdTuOMFb+amw10BR
         3Jiw==
X-Gm-Message-State: AOJu0YxQDwBigXLV2+ljSJl86aRlPF7J/UsGC/eDLr1QKhQg4nM/3SoW
	Aj4shMwLlXnJtqm6VydYsB11GtgXBbkmjSFVMYSuPn9EPX+2gwKC0asWXPIGAUflBWPYsFYgXEM
	aZtIq5MsjAUa+
X-Gm-Gg: AeBDieuQgBNnWSTxn3x6m7k7vleyaDDUV58XGvs8SoPBckTpNEeRxl0Ri3c6SLMSkjn
	JftL2l9S6n0Fb5Qxx0dd0ScE4zHFB03nsmin7TRGmqMRS0rqwUhc1m2DSEsKWw6UnM0cKvCbMMj
	SgXkEqiLUL8+pTdIripn2n6lYNUEuzbtWevqSs4Vlg49Kt9lie2up/PwpdtJFx9ElH/U90u+NNL
	YXsZN5eBiR01IuoOLJR1YmGzzD/968/3y3jhKkZbtAjIko7KKIPnUS+4dmJr9fCj/ovSFoHlhuf
	kGkyq1Whp8JquXqEfQm7q1kPW53RcFBd0hj1zxmeIf4dWHDNcggl20hg+p42B/zFWN7IZcsc8RH
	tc/pmSirvJshn369DQ2fUgiIje2G1W2x5lHgyzr5yKVfY/0dD4l2R59MwS/woUikP5uKvjIGlkg
	aPkogsN3MIlfxVHkChxM/UgtHQFf9L7ZW8DCA0RftFEjvV/Yp6Nz/qse8FWfY4dEoI5FD+PLQY2
	szrZeIHr7lI88u82XaS3v0rhwSNJvqCg5qx0Q==
X-Received: by 2002:a05:600c:a416:b0:488:e7e4:8425 with SMTP id 5b1f17b1804b1-488fb787674mr379604485e9.23.1777064203249;
        Fri, 24 Apr 2026 13:56:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/66] binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed
Date: Fri, 24 Apr 2026 22:55:09 +0200
Message-ID: <55a0d8abad8a81f7d900557c2eb2d9327ee115df.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235883

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Both CVEs are disputed by third parties. The observed behavior
(double free / invalid pointer free in readelf) only occurred in
pre-release code and did not affect any tagged version [1][2].

CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"

[1] https://www.cve.org/CVERecord?id=CVE-2025-69650
[2] https://www.cve.org/CVERecord?id=CVE-2025-69651

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
(cherry picked from commit 9c6df56fe18237880c391798c2083dca595566f4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 839d31242ef..e27502af72e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,6 +20,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 CVE_STATUS[CVE-2025-1180] = "patched: fixed by patch for CVE-2025-1176" 
+CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
+CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
 
 SRCREV ?= "f9488b0d92b591bdf3ff8cce485cb0e1b3727cc0"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"

