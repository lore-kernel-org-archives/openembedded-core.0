Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6CFEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:05:16 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.13055.1686751513764345951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 07:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=l8SKYLVN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-652426346bbso5230884b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686751513; x=1689343513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpVZf3lpteyHltvKEjFugbQr5EgAqmQPo5T6LKcodBI=;
        b=l8SKYLVNjm+fAAVZx+ld2ofNvMT6eK/D1+iocv6fI8GQsYwDSd8l7HKSlq6kq6U9TC
         o50zJMubvkB0UDoBDoKaGC2Ua+pvWDRUcPUpIs4pCCuyV8bqZ1PrSoIBfSXnfGxjC4WU
         G6hAS/DfzTriyqYoEyKqVR9O2UnX6Da5mfuWmYLz3/HPdz9CImW39rexCLEGg20g0cdc
         dVCXlcjS0/ojOMj3a2HEuR1sXMXbDIsBs8jHKGpaCbjNyH7iva9+uj4HXRn8QSbHgdei
         evmNnYIgAoUA+WQwe7hl7D109twPv9rQXYMRpda+Ucc7/ywfBPGi1zQgQ1aWeFcP0ay8
         SxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686751513; x=1689343513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpVZf3lpteyHltvKEjFugbQr5EgAqmQPo5T6LKcodBI=;
        b=FjY2lk1Xh9H8JwTJ3q+Pe2K9qLvKsV5+G/U83CawZSZzO/phH5/mO4iTiZ8zECUs9p
         xkumflPC330DUpwvbu32N3TEeM+uY1WDczppjrazqQ2ZKrLlWWvtaMDhTeUNsyZ6YqmA
         ELbZFXW46kVZAe6ylyW+Ll12bOT40yZGIwRnlrC/tUzELWPqF7q7G9mqjcFV6p41T5gV
         22avDAC6clfvM6o6v7qp/hyUXqNluMcOr+KsZ8AxJgArIM2S6iYqOQJBhKYESLqiYlNM
         HU0uGvw0cze4NfwCiSekJ4Mw/8FE2/lKE8XwtbIn4JRU8tuVFxhuJUrivDLr0OvdSiVf
         /b9A==
X-Gm-Message-State: AC+VfDwbU4h57/K6FqV9huOozqI1pwsUFuF5r4v7KKcJ6WjAnegEQofN
	Vlf6E0sKJTdBK4fEQaAVTmD31LvRSYZdUNNvx3Q=
X-Google-Smtp-Source: ACHHUZ6kHlnU1RRbr19gaTmcU7WR6Hu3Z16sbr2OJ8WOI2LsNQIq6k/dsV7pJQhEhE/eqFWUc5NoJg==
X-Received: by 2002:a05:6a21:32a6:b0:117:a86:6c7a with SMTP id yt38-20020a056a2132a600b001170a866c7amr1754810pzb.12.1686751512821;
        Wed, 14 Jun 2023 07:05:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 187-20020a6306c4000000b005439aaf0301sm703757pgg.64.2023.06.14.07.05.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:05:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/5] vim: upgrade 9.0.1429 -> 9.0.1527
Date: Wed, 14 Jun 2023 04:04:53 -1000
Message-Id: <51a6a2f7917f18f67879ea9559084393ab68520b.1686751371.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686751371.git.steve@sakoman.com>
References: <cover.1686751371.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 14:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182810

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-2426
caf642c25 patch 9.0.1499: using uninitialized memory with fuzzy matching

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4f9a8df5aca99d0a5c2d2346b27ce7be08e7896c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 94eabfa197..800ee40f92 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1429"
-SRCREV = "1a08a3e2a584889f19b84a27672134649b73da58"
+PV .= ".1527"
+SRCREV = "c28e7a2b2f23dbd246a1ad7ad7aaa6f7ab2e5887"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


