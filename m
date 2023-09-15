Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AB1EED616
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:34:26 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.23790.1694792059758955976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RjVzmYMv;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c43fe0c0bfso4015225ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694792059; x=1695396859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UP6N2Ko/23ZTaww/zhwNtvnC+3Jr/wGo/N29K13gcuU=;
        b=RjVzmYMvion/MgpnuRE0KgiMcn2GLjpIGM9O0prSSoQH8DyTeZLe4lCLnq5r4Rmggk
         WZkxA+fpTH26TRy5m+sj+w/v/D4/PLSHxt+zxwbwr+A7NreAXnMMg/nIeHxEgV6pAH+K
         G+haQ9C3HfFt2MftaiC/bs42RprshYVwqld+VHIm1GgcI3tYdxjcGPrBVCGkCOtnX+1N
         eazfA3oyk4h2SfRShSgdU3xNWjwfKgtf0uGme4ZP1NvS4UDo8NZwPBwlRJKy/mazPZdE
         f6PE7eXR7/FwON9168lspL1y8EYk7xIx4xdHfkpL+dGybIB0NzVTmRiKaTaigrpaozOp
         1/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694792059; x=1695396859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UP6N2Ko/23ZTaww/zhwNtvnC+3Jr/wGo/N29K13gcuU=;
        b=UMVZGJnlKbrgeS2xLptdz56FjNzA1RFfw8kvVPVGl7/mY1J7UxTrY/x+xRuBs2Iyq0
         wVgcZvg7RxBks7l2kz8u40dsZ8NNlXMkX4rpeMHSoj+dShkQYazwdoRjE/b72Tzesg2e
         dwoOnwVK745Bza77hlxXe+QEmDcGR81thSfNxjJc0MvAO+yTSk6vld7Ay3pc2j3FNVGD
         rvG5IREdE1M7rKnFBceDwSSwDiZVltEGLHimM4HgBFTkTZlEQM1BtqcxCz18LddQq0IC
         hqAkFGTFTxRjMHtOnXl+EuFqSZ+8FnEXcUS9hw3J2gQGaZVqja3dZzpt8XyZcRaNZNX+
         5O1w==
X-Gm-Message-State: AOJu0Yzf/NUwPL9B8nMqopIl+BQKmCT/J7r+36SyTl7Dg0TUSSRm41Vt
	fppji12uWJfoN9xWMlGi9ka4yCTYKnk=
X-Google-Smtp-Source: AGHT+IGh04VlzhKOkLaWjNV32QfLGI/lMcELnO7yeQC/V0tpnMNRsxC9i4ZmY3Sd23BDGQCaLxug+w==
X-Received: by 2002:a17:902:9b83:b0:1c0:aca0:8c2d with SMTP id y3-20020a1709029b8300b001c0aca08c2dmr1472439plp.67.1694792058990;
        Fri, 15 Sep 2023 08:34:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902b94300b001b66a71a4a0sm3647309pls.32.2023.09.15.08.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:34:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] util-linux: Disable failing tests on musl
Date: Fri, 15 Sep 2023 08:34:14 -0700
Message-ID: <20230915153415.3241307-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915153415.3241307-1-raj.khem@gmail.com>
References: <20230915153415.3241307-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187679

These tests need strptime with %s which is glibc specific extention

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.39.1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.1.bb b/meta/recipes-core/util-linux/util-linux_2.39.1.bb
index c81405533c4..821a44a1453 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.1.bb
@@ -322,3 +322,12 @@ do_install_ptest() {
         rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
     fi
 }
+
+# Delete tests not working on musl
+do_install_ptest:append:libc-musl() {
+    for t in tests/ts/col/multibyte \
+            tests/ts/lib/timeutils \
+            tests/ts/dmesg/limit; do
+        rm -rf ${D}${PTEST_PATH}/$t
+    done
+}
-- 
2.42.0


