Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB62C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 09:39:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.4662.1654162785348801734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 02:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MDmiTtWt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id q7so5713223wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pz9C8SGawdZT81FLuFCWLcQR+dD65hvoQYGoHZlkXy8=;
        b=MDmiTtWtaiXpJZESnVfwJtxQAU7AkfjaO4lv24nAU4fZ6/aZEj3TIdElL+/th0vnrb
         Z+hZyspstnK7cIX1DOXLAoFLaWsSfO8cmgNGHKCaZxk1iVj2ruu8mt8wRycOq10L7oI6
         thxsBCpp2RMDPP1htKvZzwV0fky/WCCOVC7ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pz9C8SGawdZT81FLuFCWLcQR+dD65hvoQYGoHZlkXy8=;
        b=begGtEjsT7gzb93FMj2H/fGuL+AWxN6SFnMHLc9hE8m5pqJtmoQ5mklZHRMriNwOqL
         c3XrHiVrtRK99KsEniZCL/SasWbmdLQMXrNbZAcrnWrcfSI3MLai1KtLRAN8NTqBKPrv
         IW0rHyJnmfnRd7AHaRmvJcYLKwzFpMu+H7d2PfgcMSb1WHB1twITt74o67cCy/kgmjLJ
         rA74XG1VPh8srFFfI4rekoh0zszAPMmgOTmubM1fRlBkn1pmnzXwbwcTubS7/Mq09KB+
         sXGdLR1KNiNGp96Hdi5+mWgvHSIcfSRFrYPOBcT7O+nkEdHnqlmbv2n8Xh+NnzkkHe4j
         epeQ==
X-Gm-Message-State: AOAM530DR3b337+rjiYYR7B+5cBw7TMTn9cBwq1ac0rR8VMFU3JOQfVz
	y+bI9kzZ2Nrj0/j4SWIKPNU6HOpBo09Sjlj+
X-Google-Smtp-Source: 
 ABdhPJys3KB8CcwGHs4b5/wq13mnJNJ4jNpcdEUnPV+R8CofgbrA6R4TYxpMRcE20nQa066pL24xfg==
X-Received: by 2002:adf:ea4f:0:b0:20f:ca53:c6bd with SMTP id
 j15-20020adfea4f000000b0020fca53c6bdmr2797542wrn.216.1654162783430;
        Thu, 02 Jun 2022 02:39:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:171c:95a:9d1d:26d3])
        by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0039c15861001sm1971575wmb.21.2022.06.02.02.39.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 02:39:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc-cross-canadian: Add nativesdk-zstd dependency
Date: Thu,  2 Jun 2022 10:39:42 +0100
Message-Id: <20220602093942.131393-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 09:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166466

To match the changes to gcc-cross, add a nativesdk-zstd dependency to ensure
our configurations match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 168486bd4ef..a87b446c4f0 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -175,7 +175,7 @@ do_install () {
 }
 
 ELFUTILS = "nativesdk-elfutils"
-DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
+DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib nativesdk-zstd"
 RDEPENDS:${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
 
 SYSTEMHEADERS = "${target_includedir}/"
-- 
2.34.1


