Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BEAC7EE32
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:39 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.3373.1685672557613458609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FriDZkd0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-650c89c7e4fso1254830b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672557; x=1688264557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ek7bqI8K5zpPpJkjXdp64vlTCfvLnxYtpvfTiTf2D9A=;
        b=FriDZkd0fpNX0zll2GGGgbMYZu9wg4Py2y0x1ncI98vGndvPlcPZkyclWzGz+HySWc
         ikBosDUGy/2xEXgmrUd0ulGWGy3AS7XxEVkmI2JnnYtv7FIBm5sWBwoutBRLOcIhwTko
         Nk78Z+x63DPe3VCRHwqpVv6ftJTJJ6r1SuwErNvGp2OJ5xgV2iLSU/t16Sb/5C/WiCuQ
         yaoWcCIkFcJQM5MR3vjHOsVWt3VeN3kDjzZxCiIBiOMTD9yFmCclbLHo00MFRxGhmLZR
         LJjpepug4SXoVsHfeXVXgQtHwgWWaYtMyXuLA/y3KhbrbwVtwgvEoUuF5W9sAbmmFc2J
         ZjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672557; x=1688264557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek7bqI8K5zpPpJkjXdp64vlTCfvLnxYtpvfTiTf2D9A=;
        b=FFWrpsiHDUcL0HcBz2S/8dKt4BqoVhMIYvdBgzV8ab8y9YutHRr23dcgxxPKFg694v
         b/Ek8COei2R4T0L7XWdOoivAwQHKfwiMqwuGvi/G/+ILL+SMg444yCnmFxD48NNNdEEA
         YNLbr7VZOlwxLqpF1w96OwmetBBRBNYXSd6XrutuvA4zKMngj8sCVKr7eZY0rOgn62+M
         6YSjl9P91FSG/PbIQG6NeP3D1m3RnS2ZAIN8y46jhr2TwJCMQiBfI2KzRbfNwYR9cNj0
         rKghF70uqGLnvOrv2qwbL5yXhMTZUtx1vEgMqgKAlZggNl6iOJUl8IyquZJZvjY5wZ2L
         2CIQ==
X-Gm-Message-State: AC+VfDzxJ/byptdwntNBWfSD9LwMaWWZBfXpn1WNhUYUjmyHrCT5Txqm
	+TMgUieMAnaBqAFuzBGRITL6sSdrj7AiXULPNsM=
X-Google-Smtp-Source: ACHHUZ4nKCtS8jx9essgFL0EXsC3HooldM+PMotBIBmJP3Ix6MWkchcZ0RDSiNBZ9aoXyJRc6DaxdQ==
X-Received: by 2002:a05:6a20:c704:b0:105:a24f:cff1 with SMTP id hi4-20020a056a20c70400b00105a24fcff1mr9647575pzb.24.1685672556630;
        Thu, 01 Jun 2023 19:22:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/13] e2fsprogs: fix ptest bug for second running
Date: Thu,  1 Jun 2023 16:22:07 -1000
Message-Id: <d40b69d0a5a3eceff6b7d97601f560846cc2ef36.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182131

From: Qiu Tingting <qiutt@fujitsu.com>

At second running, there are four new failed case:
  d_loaddump f_bigalloc_badinode f_bigalloc_orphan_list f_dup_resize

The test_data.tmp is necessary, but it is deleted by run-ptest.
So it should be restored after testing.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit d0d08dd9a8a179e25b9cfcbac696c1d212a1910c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 1 +
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index c97c0377e9..279923db8e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -8,3 +8,4 @@ rm -f *.tmp
 rm -f *.ok
 rm -f *.failed
 rm -f *.log
+cp ../data/test_data.tmp ./
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index 2620610903..403995e9cf 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -140,4 +140,7 @@ do_install_ptest() {
 
         install -d ${D}${PTEST_PATH}/lib
         install -m 0644 ${B}/lib/config.h  ${D}${PTEST_PATH}/lib/
+
+        install -d ${D}${PTEST_PATH}/data
+        install -m 0644 ${B}/tests/test_data.tmp ${D}${PTEST_PATH}/data/
 }
-- 
2.34.1


