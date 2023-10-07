Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A11E95A73
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:42 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.27675.1696717534230269333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q1hDWH+A;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c8a1541233so2501875ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717533; x=1697322333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9eqYBQLn61m/ih6ibUJfDbIg3r6V+LGdmObv6XwEhE=;
        b=Q1hDWH+AB04FJkrKgX5jE6fsnq7mG84aJ2uBHuVhyPanGLT4PeKQSNihuVssZZzT+d
         YgNdHhcL8mgT/dUqK5fl7bQXNvyg5Um04Ub0cnKyMb80lnIupEiTvTZKQ1pgIRaqKjmH
         ZppDHfj/bMaxDMi0mtpGY5Zj4ZsvvzgJv1cPp7EluzRvlyv0aPLIetZD+r6MFUX6EIwM
         UeSUFIDwNAegEqliY1trnOrJ7I3pqM2TFduU/6mTQRJdxSsQUh9W2i8s/2QQKRUNN549
         3Ffl8sr/v6BE6KZbrCPTtWPWMo6cVs1pvK+G+g73+32gjlYC1yKQlriGdAvk9TYVQDB4
         uQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717533; x=1697322333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9eqYBQLn61m/ih6ibUJfDbIg3r6V+LGdmObv6XwEhE=;
        b=BsRZTBf6nZkacp/FfJI7JVMUNk/24l+oi9aWD6XRVbQD8E3vw5QfFQcNeBzFoTPLfX
         mz8YwFq+GYH2ma0ixeMxNXJ79Bt21wT2FmMXpQAbNQl8jmdpTflhyvhulbqIOEGD2ld/
         7bd2PDEho09eH9uRd5FSvjH1zjNu5hymptJfjkD5LjZe4Wj9CrU0hf0h2pGZh3sdm7De
         mIK3xyG4JA0PO/LUkmczEMp3tkIBSlFWakKE6NA/IwslQemQr/iODBUygFDZjJCEpaNQ
         8nfTORYoAt4enMS8F7x0iTRjwf5ijSWiYMnkZxggV4PEJpcaoG0rzZkeoSSAUuZqUtn9
         ScoQ==
X-Gm-Message-State: AOJu0Yxw+1AGXDow5XTlRMFwnP/EL6wDdKfDnXzAUE4BmBbi8viHuZ9e
	45OyF9QjWZCWihYv+lymxRv4Dvzax70es+YfEKA=
X-Google-Smtp-Source: AGHT+IHT9qYE4eBMLEmqA5nmMwB1i0848aVCaOuJ5oLd1G5+hQ74lP1rmawSk1Fz+0mw4rimRsnBzg==
X-Received: by 2002:a17:902:8b8c:b0:1c0:aca0:8c44 with SMTP id ay12-20020a1709028b8c00b001c0aca08c44mr11014467plb.19.1696717533363;
        Sat, 07 Oct 2023 15:25:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/19] libsndfile1: upgrade 1.2.0 -> 1.2.2
Date: Sat,  7 Oct 2023 12:25:02 -1000
Message-Id: <7d5a6d6c908ce7e7601c85a00a2331039f1e5fe4.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696702947.git.steve@sakoman.com>
References: <cover.1696702947.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188807

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Fixed invalid regex in src/create_symbols_file.py
* Fixed passing null pointer to printf %s in tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit ff22e9ae6a237d8c48aa9eaee65de3157f52307b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsndfile/{libsndfile1_1.2.0.bb => libsndfile1_1.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.2.0.bb => libsndfile1_1.2.2.bb} (92%)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
similarity index 92%
rename from meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
rename to meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index b8001f4618..c7fbf409ac 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-SRC_URI[sha256sum] = "0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a"
+SRC_URI[sha256sum] = "3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
-- 
2.34.1


