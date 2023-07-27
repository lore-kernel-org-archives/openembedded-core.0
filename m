Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4096FC0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 06:58:38 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.2003.1690441111700820303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 23:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=We/pikoN;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-563643b2b4cso332908a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 23:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690441111; x=1691045911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+nVZPYSxZou/FlFs16ipD4Cyw1zsmwSmshGX+m+0nQ=;
        b=We/pikoNI7n2oRBbGKk7yCaUwlJURRlQr3w23f1OcsRMEzsPGwWtEjQiF9Xrju8Vrs
         BcX4j2rVh8uvBOr+tGFf2F9bXSXSYpN7NE/5n7l4AXlhyt21LUR1ATM/hx4tBjIY9Itk
         ZGCtVgcmWxO/gZQiCsvHFAnnSZiVgax6+k3dYjY8a3sd1WzBBF+DDE6jAI1+eqvP+ex2
         XkDvBdeZ93Kgzi1ZlstQcg1m0EYld1CavaqZNarGZdTPybpO8LjPaMWNWcSY1bhscNEb
         Da3bgyB5NM+pFtjt8t/PrU8Rmz2OyW0FC/xGiVPrAGw0P6FcWnd2TLJXvU/O89qlTUMh
         MfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690441111; x=1691045911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+nVZPYSxZou/FlFs16ipD4Cyw1zsmwSmshGX+m+0nQ=;
        b=ObJ/g5g+NdsT6QUtwHmDGYIxC6GlRRYkx2NdjgB4PYADvqY9N1oaUpHy7FKPPb/pn8
         eQ/mjtcBq5VOPTXR514GeaP1WnuzF9iwLQnUy42oNBPVH9yt3Z6eZYKCAFUMhrNkazgA
         a6c+XdFzCipokXUbWdtVQS/Yh92djJjLLXgxfxyiI1Y+GdBIyo+4IfCxd129mXZD2gRA
         rHfMeioCO38wQjdczPo48D9UfYCIGihFOk+HgSZJ8g6qP5SrRAw5R3LIqW0CVWYUwx7o
         2qEf900LE+uDPwkUHVWTXsjREj3Ti5SEb2R7kSeK9VoBzp5/Le2eb1YkVvUdyKVYbqTm
         dz2w==
X-Gm-Message-State: ABy/qLYc18yZVbM++BqzWtIbJjwsAQyw8o9iMEHqfTL/BQ32crcaN0tv
	C9/tnsTX15jupg/uqpegsOP0qy/WLTrqPQ==
X-Google-Smtp-Source: APBJJlHpA34ydVfMHdM0LoBfkXNRahcLj/laPzPZ302qL0+WFbNmirjMlS9upxC7A3FifMCp61OtBQ==
X-Received: by 2002:a17:90a:680f:b0:263:68b0:8ca5 with SMTP id p15-20020a17090a680f00b0026368b08ca5mr3396174pjj.43.1690441110598;
        Wed, 26 Jul 2023 23:58:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::37f0])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a01de00b00268032f6a64sm2352294pjd.25.2023.07.26.23.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 23:58:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] ltp: Use bfd linker when lld is distro linker default
Date: Wed, 26 Jul 2023 23:58:26 -0700
Message-ID: <20230727065827.2710834-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 06:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184912

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20230516.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20230516.bb b/meta/recipes-extended/ltp/ltp_20230516.bb
index e9407d3148e..e4ba3c68724 100644
--- a/meta/recipes-extended/ltp/ltp_20230516.bb
+++ b/meta/recipes-extended/ltp/ltp_20230516.bb
@@ -41,6 +41,7 @@ inherit autotools-brokensep pkgconfig
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18097
 # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -fuse-ld=bfd', '', d)}"
 
 # After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
 # https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
-- 
2.41.0


