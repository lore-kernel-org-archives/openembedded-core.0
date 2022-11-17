Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C8FC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:13 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.1041.1668704111010043832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pITOAPRk;
 spf=pass (domain: linaro.org, ip: 209.85.219.48, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f48.google.com with SMTP id k2so392846qvo.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8Ilxs+9rqQK5eKtzY7ZzDIhkrSWPGI56XNBq5g4yNE=;
        b=pITOAPRkat4EcWmez5Q+Vlbe/5K75YCOLldRgPwmKMgpgbaMZL/nGtfuFQQ03d+wqs
         /QQVym6WEyywglytK4q2GoY+h1FDIexv6OYGrS5pFR60P8dQW4N+x0fkXNggEDoPqnNC
         cd102u2lt03jARhkS5TBvvny7ny1CuhvlkUChy17dwiWHnf6pNvwzRz66GqEDybddg6i
         N4giBWwU/mrDBkhB6LH6qgrHVOqQC1Ko8kDmmTeQ9zUkGVbc5+X6Px6YV7n/YEBp/G0s
         fg1IOGBEuZS5iIz4mQT2jxURyprclCrI+8Lg6yDP+xZQlYXUPRWI5LgLOJHDz/VuaEMP
         pe5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8Ilxs+9rqQK5eKtzY7ZzDIhkrSWPGI56XNBq5g4yNE=;
        b=td5KoJZ1hdd9czaYfLB2Zcuaa+XvaOFXZZPb+23sLoJJ5yRboRyhvMUEKVBZqDatHs
         MPvm+lNsHQAmDgzOvmYB4coc6hgK+Gl2RQt3W/1jcvlyxf+Lm4oIgPSr8olJA2QM2hgl
         g0yTxwJs0qMPrAnfzlsrMHTeZsSaWrOzmLMH+KDKrIIcF6PH6isisk+MfrW/u/5MCWEH
         rY7ZXqlQkuJisvkTXJs0lv9G02AjLUaaRUzrlXEb90T7nBNQsKtWwS4dfZiyeTlMXfMw
         5CWFiCE6lQHDz2BXgRoHAffPi6cokSZYefvl/R6TnM3Kdrk/sCxUVd91YTMqGn6ox1Hl
         HzwQ==
X-Gm-Message-State: ANoB5pmSvKjmYzjz4s/rOr6GcZBo96v35WZtiQachB4cex9JZCtE+XYw
	FK5RQ5xBqYcILdENBVKqK9M4rG9y50dMBg==
X-Google-Smtp-Source: AA0mqf6KC+6GhAHwTNGJSP36qUnOyy802cGYgIJXQDS7IMoFZfObuKfHyiHkr7FcyvXp2X3s0mRwLg==
X-Received: by 2002:ad4:57a9:0:b0:4bb:699e:4cec with SMTP id g9-20020ad457a9000000b004bb699e4cecmr3348888qvx.6.1668704110097;
        Thu, 17 Nov 2022 08:55:10 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:09 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 06/11] golang: fix CVE-2022-28327
Date: Thu, 17 Nov 2022 11:54:51 -0500
Message-Id: <20221117165456.1029099-6-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173439

Upstream-Status: Backport [https://github.com/golang/go/commit/7139e8b024604ab168b51b99c6e8168257a5bf58]
CVE: CVE-2022-28327
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2022-28327.patch           | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-28327.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index ddd08ce0c9..467ba13b72 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -47,6 +47,7 @@ SRC_URI += "\
     file://CVE-2021-44716.patch \
     file://CVE-2022-24921.patch \
     file://CVE-2022-28131.patch \
+    file://CVE-2022-28327.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-28327.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-28327.patch
new file mode 100644
index 0000000000..6361deec7d
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-28327.patch
@@ -0,0 +1,36 @@
+From 34d9ab78568d63d8097911237897b188bdaba9c2 Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Thu, 31 Mar 2022 12:31:58 -0400
+Subject: [PATCH] crypto/elliptic: tolerate zero-padded scalars in generic
+ P-256
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/7139e8b024604ab168b51b99c6e8168257a5bf58]
+CVE: CVE-2022-28327
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+
+
+Updates #52075
+Fixes #52076
+Fixes CVE-2022-28327
+
+Change-Id: I595a7514c9a0aa1b9c76aedfc2307e1124271f27
+Reviewed-on: https://go-review.googlesource.com/c/go/+/397136
+Trust: Filippo Valsorda <filippo@golang.org>
+Reviewed-by: Julie Qiu <julie@golang.org>
+---
+ src/crypto/elliptic/p256.go | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/crypto/elliptic/p256.go b/src/crypto/elliptic/p256.go
+index c23e414..787e3e7 100644
+--- a/src/crypto/elliptic/p256.go
++++ b/src/crypto/elliptic/p256.go
+@@ -51,7 +51,7 @@ func p256GetScalar(out *[32]byte, in []byte) {
+ 	n := new(big.Int).SetBytes(in)
+ 	var scalarBytes []byte
+ 
+-	if n.Cmp(p256Params.N) >= 0 {
++	if n.Cmp(p256Params.N) >= 0 || len(in) > len(out) {
+ 		n.Mod(n, p256Params.N)
+ 		scalarBytes = n.Bytes()
+ 	} else {
-- 
2.25.1


