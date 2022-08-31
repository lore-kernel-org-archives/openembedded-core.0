Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88ECECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 11:10:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.24188.1661944225493905288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YMf9dCDD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id u18so5113499wrq.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=zpH2Y78mCFS4OcbIAzFDhGz0qJidbIRkyyQ46Hruk1U=;
        b=YMf9dCDD85xLYQTjwp7q7o0NZ8ESCutJD8QVnFktEXmWdNOUr4Q1FKRpZ7tGoQfzsC
         snKtivWE7pyz8mHRZFimPFCPUJX/POhROxuy9F2qVtDYC6ESMlhj9i5yIVt4JL1nVMxt
         5sHAl87KYv1FOno9ZO0bbCPrYfURtntgMIvd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=zpH2Y78mCFS4OcbIAzFDhGz0qJidbIRkyyQ46Hruk1U=;
        b=M9RCbcv6epAxgwR11VsKlInR3uO/z6vISsnbK9/A3ZtNxQ9KJCJhnHxRcGoqqm7zmh
         5I9we5WuuVxoJQk1qtuZFu1O7y3i0OkrwU/jjzKqR7ee4wFx2PMeJpn+5vIB87EOOUPb
         SWg6zpjLN6/vaHCpBTndXZxycW6pgqIqWHJXOzYJgdOfT3jbvYXT5o7Exc4bPSTNSiBp
         anHtBeUk+XfRYyeGMs+pUjGQaIujgCBONFZXHgiJfM7Wof+zqu2b884fdJ/n+zBJtvyU
         VMIgXGr11bljoTbqhArnyBDSFQuBlpi13u1079ZSGIPvocmjk3xgLR0zpb9B+vMroErd
         9lPA==
X-Gm-Message-State: ACgBeo1x/IxRspubKxHnllA8G1IuGjqPfoerQ1eTZ0eHjv/jZTvKYn37
	gm7REO2Qltga3VumfBD2Tzh1TuMBVpdBhQ==
X-Google-Smtp-Source: 
 AA6agR5STq6nko4DmaaimNc67+5rgQZY6Fca+V+VsQLYIzHbnyoHZHtdV29H875KdPMEONGwdUjBuw==
X-Received: by 2002:adf:e549:0:b0:226:cf45:a6ae with SMTP id
 z9-20020adfe549000000b00226cf45a6aemr11680238wrm.290.1661944223297;
        Wed, 31 Aug 2022 04:10:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e8fb:7413:92ab:6224])
        by smtp.gmail.com with ESMTPSA id
 v15-20020adfe28f000000b002255eebf785sm12266878wri.89.2022.08.31.04.10.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 04:10:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to include recent upstream minor fixes
Date: Wed, 31 Aug 2022 12:10:22 +0100
Message-Id: <20220831111022.164429-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 11:10:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170099

Pull in some minor fixes:

 pseudo_util: Silence symlink errors and fix resolution bug
 ports/linux: Remove build dependency on libattr
 Minor build fixes
 pseudo_util: Fix resolving relative paths from "/"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index e7ef6a730c2..c34580b4ff9 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "2b4b88eb513335b0ece55fe51854693d9b20de35"
+SRCREV = "c9670c27ff67ab899007ce749254b16091577e55"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


