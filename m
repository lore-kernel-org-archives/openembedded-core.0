Return-Path: <ecordonnier@snapchat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468CBC4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:25:01 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.11750.1667571897053550256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 07:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snapchat.com header.s=google header.b=IzAdRNMG;
 spf=pass (domain: snapchat.com, ip: 209.85.210.169, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pf1-f169.google.com with SMTP id m6so4700103pfb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 07:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snapchat.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUZ2v12N/XtqCMJG6gpC4+WwNcq/gUXRXl1GicQs42g=;
        b=IzAdRNMGNOh8Qs1InBDIsVRQFUxNfwbeC2ny4jHpiYlQsUs3eTgeYc/NnvFf8UDUDq
         VK+6asp65cG+NTYIAbe1jHkctRoZE87UnA73hf9Diamq9z1Fc0v2mDS10BRKr7OBZ36V
         ivwbb808szHhLQDzWPu7vISbV1jamM8A0fIDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUZ2v12N/XtqCMJG6gpC4+WwNcq/gUXRXl1GicQs42g=;
        b=ELpQXJxFa4OprLDhtU0gFYYMq1EObbFYVntTC2R6ndJ1Qsos1TQO4XGIgZCK/TX29S
         eeUM06U0qk0gJY3Rb9Scusa2vCuZdyrluNFNIf82ww3D/wm0fbh/65FBvgIEhch8Waci
         rdMlDKVU6dABQ2Rt5m+gCmsKJ+kRX2DavrQFv1FCU2caiXamRsLrENYtRrKjvCY/5SP9
         xM+vY8hXlAC2kVMMyz01DARFIqIXTI2HYVO4qwpxopqw3fSaXBLLMo63P/wvWVlh8HYW
         C0FLiGlscUz3667f8MinqUhKPkn1FPmXaT6tmaTPE/OwPqrzxJXOm3nKlZhjdiWw5amB
         cWIg==
X-Gm-Message-State: ACrzQf3mPH5Dj2kcJFDUvyQxigRVUVkHo+Ufdf43PJK1oO5ECNDyurGX
	EkrLI8804YSBra3bZkYi5BSjJQpCad/diROO
X-Google-Smtp-Source: AMsMyM57qa8TOHjjsbSipjOzZRCDAUd+Ei0atv0y5/ntFaiBVXm1hvaOKJcDXwRmP1uVZAbMErx2Dg==
X-Received: by 2002:a63:1a07:0:b0:46b:2825:f9cf with SMTP id a7-20020a631a07000000b0046b2825f9cfmr31536823pga.370.1667571895963;
        Fri, 04 Nov 2022 07:24:55 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.26])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902d14d00b0017f756563bcsm2711439plt.47.2022.11.04.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:24:55 -0700 (PDT)
From: Etienne Cordonnier <ecordonnier@snapchat.com>
X-Google-Original-From: Etienne Cordonnier <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] mirrors.bbclass: use shallow tarball for nativesdk-binutils
Date: Fri,  4 Nov 2022 15:24:43 +0100
Message-Id: <20221104142443.1728589-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 14:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172714

This is useful e.g. when using meta-clang, which introduces a dependency to nativesdk-binutils when
populating the SDK, and then a full tarball of binutils is fetched additionally to a shallow tarball.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-global/mirrors.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 81fef7f660..8b984de3bf 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -91,6 +91,8 @@ BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
 BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
 BB_GIT_SHALLOW:pn-binutils-native = "1"
+BB_GIT_SHALLOW:pn-nativesdk-binutils = "1"
+
 BB_GIT_SHALLOW:pn-glibc = "1"
 PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
               git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
-- 
2.36.1.vfs.0.0


