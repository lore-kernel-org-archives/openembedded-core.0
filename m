Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D27C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 23:02:26 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.314.1654124540430137704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 16:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bS+qM0Fw;
 spf=pass (domain: mvista.com, ip: 209.85.215.182,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id r71so3228228pgr.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 16:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QolVIzy929IMxYYFxgncpxzG6w0CKwzlCQgG2dgb0JU=;
        b=bS+qM0Fw84HSTbPjgR1WJrOaToVxJn8Pmar92/8CVSkJ9G3xN4+w5cZx1qFS4XsTJG
         y73I/QDFIgbpzRvmvGPvWljcPDVhxkmuzR3nj8kOiYcrHJc18vJnFy0NQLWdHnRtsn7X
         b6iy5bcBQ7xV49nCcUydI3EABJ62spREByQxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QolVIzy929IMxYYFxgncpxzG6w0CKwzlCQgG2dgb0JU=;
        b=gMz/lUUwI8vkHBU5RGi/AZlru+lHxezeIs61grjLkJSz8nx1huK9X/0AXdaFPaKuK2
         EN3qsNtuRsGKyhkxUHHtotUeKVLp7FsTTXMukOhkrXooq3Yjke34eNNxSyCnIRrt4k8f
         4FNJiECltuDlqu5vJRU4HFS/QDzk+t3dp6YiOJ1AVDdXe7hSF+eF1kUQgH7cPlFoorNY
         awNRTUDPWn1vx/m7M/M1fJrzajOtEfeEdfWmPn9fgyGlEofKjqQrK5qnEV9G2DM9hODh
         0WwOLbUBf9+3NBtz/+hYpTCvEg3qoef6PdvUfs7Kgnfm9fco/Yj8wS8U0PmLrk85Yb4B
         UWSQ==
X-Gm-Message-State: AOAM530jF34IeZ55xzHCE6UmpfgRocs1mHjpBETC2srv2DJEO0o1P4ck
	2A5YeqNneUsJ8zkZjTj3prR53vRmbm8vuQ==
X-Google-Smtp-Source: 
 ABdhPJxS3FquHOTWPDjHGRkyBcGFi1gcYzxgY7J6VNiaDGEURU/v4uz56BUBTHsG1d7F4E5Tmd9tIQ==
X-Received: by 2002:a63:cf51:0:b0:3fc:b9f1:2882 with SMTP id
 b17-20020a63cf51000000b003fcb9f12882mr1458436pgj.431.1654124539714;
        Wed, 01 Jun 2022 16:02:19 -0700 (PDT)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a056a001ac800b0051b516fd1dcsm2169356pfv.91.2022.06.01.16.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 16:02:19 -0700 (PDT)
Received: by red (sSMTP sendmail emulation); Wed, 01 Jun 2022 19:02:16 -0400
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [PATCH] gcc: depend on zstd-native
Date: Wed,  1 Jun 2022 19:02:15 -0400
Message-Id: <20220601230215.280708-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 23:02:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166446

Sharing sstate cache binaries between two systems, one with libzstd installed
and the other without, leads to various gcc components being linked against
the system libzstd and failing to run on the system with out it installed.

Make zstd-native from our system available.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/gcc/gcc-12.1.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtools/gcc/gcc-12.1.inc
index c8c4ae93e1..250b587e78 100644
--- a/meta/recipes-devtools/gcc/gcc-12.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.1.inc
@@ -11,7 +11,7 @@ BINV = "12.1.0"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
 
-- 
2.31.1


