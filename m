Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BE4C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.26316.1668880099409590250
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UH4XVTHW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso10955076pjg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhdbC3RWVka9fOVF7NzRRg0nCLpJRdDefxRhVQGji98=;
        b=UH4XVTHWO2CjHp+aYB0TreAJ+nLWGUowUNymNF8A00WEwyJ7B7iy/IO2oKTExXtdmd
         OaIG9Sc40Owrb9uHIRnLNPGE8osP42fwqG4N2j+B5uMiXiRjcuqW05QjjyvsYIlOeMoy
         ZQfdTwmeeYr3ldRA4loQ8Ofs+b6Pe5HsIO19gIGzlyzqiQFfQE8pEhrTHKEkmCpJ3efD
         Lrs6ipfRHoledRRjY9pgWNiFLiTotmto7SkkqSa2iOHYisrKOXTZF8NfFQo550o6Dmys
         HlV1nYyagmeDv/834IeNw7xPHR92PemZsHhevhaDTfkcMepdYvnp6C9vmRDpt7+QXsH7
         M3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhdbC3RWVka9fOVF7NzRRg0nCLpJRdDefxRhVQGji98=;
        b=v9Yk9fLEWQy+4wr8wmP7qlSPO++P9MA0sTW5JBOOuXA6Ulopfs4RrU/UqnqE5dzbZw
         R6lvyf1OpjelG/Ihg4jDDCUgyUVGmwlhfqnsW6TXpz72m5sUp6YnaVTHdfUD1Nrrt+ZP
         4KfaoOHgxvdTts3x6DMPdQMcaOVCQu+dD33AQWHrVrZAliV71dN22+8yLsa1u6NCVBqe
         msRKwhPME4gbJ4gxJOR9+5jDFO6JrXGiO1wc8SazseHwU4Z+TqieKAdfEbB3933/FZWQ
         i9/BWAtgyf4akdnoF/4cjejjjbmWHIVrI2PHGk6BIhUJ4qzywFUjds7rDu2NHnHwJkEh
         +VbA==
X-Gm-Message-State: ANoB5pnHxJt28BUyH6bVkN5dyyZ8M/+KrRmX3gsewoFl3eNf+2nkeeUB
	D1EWyDsHKvrU1I8WTvtbMTraMX3oM4Emq/y6UkM=
X-Google-Smtp-Source: AA0mqf50QRwWWUmJX9YGE9yVrA73LXBvtW5/NAprnk27eCH6OZnABi0/5gux0GNrEPYnG7HlOxg1hg==
X-Received: by 2002:a17:903:2144:b0:188:a1eb:9a8a with SMTP id s4-20020a170903214400b00188a1eb9a8amr4548707ple.153.1668880098416;
        Sat, 19 Nov 2022 09:48:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/21] golang: fix CVE-2022-28327
Date: Sat, 19 Nov 2022 07:47:40 -1000
Message-Id: <7333de25c554375a5ea9ba21a6bdc79036e7bb6d.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173530

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Upstream-Status: Backport [https://github.com/golang/go/commit/7139e8b024604ab168b51b99c6e8168257a5bf58]
CVE: CVE-2022-28327
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2022-28327.patch           | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-28327.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 525a3e77c5..6e596f4141 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -48,6 +48,7 @@ SRC_URI += "\
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


