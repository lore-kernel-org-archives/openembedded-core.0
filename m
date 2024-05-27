Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426E9C27C4F
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.3774.1716833543289719423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ER0b+MRD;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5785199e0d6so4597588a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833541; x=1717438341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0vvCcO0gjhAVAZsba/+c22seZnTHVc9g5xBrxotrr0=;
        b=ER0b+MRDXobJkI8uxhRkngEZ/Rge8YlzV+F+9vLKlCMmticUuS4L7z1Q8woiU6TB0J
         8mbplulJb2Dk7qnYezSa4QRzU8eaTV9EYb4rEiD60Ihnep0GiZoUKwMKbp8CIZ7m213H
         3Iw7ldEAC6TqFzJPyA+SUZmGdt9UBCTpNf87/kJDzQ0YkLUgO6aV9wta5u7pPk/unuoZ
         HFAArtoLs3WtptM6hyaKojeBxw9iY16MdDi+Z8B+J3gx3YUM9JqD8TeVD6BGScUF6D+B
         RMk755xxWJGQdfjwdkw3Azo5Bw+bUnajUDKUkSs3t2OsqNJtaJlVownscdvFRJD4vkhr
         vWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833541; x=1717438341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0vvCcO0gjhAVAZsba/+c22seZnTHVc9g5xBrxotrr0=;
        b=h4u29GAgMOJ9N9L3Rm4k//PcZhsXn/X4ZBRNrUXpYdqi2cnbOGdeacTcOt5x+PfzmO
         qzAnoEVBLjFFRkN2qgcLDWcGln3FXb8+a/3LKNBBvrvBMDcYzKueTigRL1IFXIUW34IF
         xJ/cqmuyr9TvZ8U4YLMmbmtHkn2x+9VxoSWyWsJHR/OgsSbYQ6Jzeka3AgSA8L4zu80Z
         ruSbk2ol0ewCk5TZ932wXmrOINU1LFzxPaglg23WKK6lP+CujaGeU7WiFWq4r3Cow06E
         Jx+GDerDSIWqYs5owTvHq94N4K71RwkJYdmJBpMebprDw0rMsur/iNw99W9KiIJ71/0j
         /y8A==
X-Gm-Message-State: AOJu0YwLvcfbIpUYiTzd/C/lL7GJZXr2CBBSzfQ6kOWWYgGUzdzJCQYd
	D5Ojz5L8qbN8aXT9rDvSP3UpBPhzsi6GpSJnXQihFieINgfqzN4cj20eCA==
X-Google-Smtp-Source: AGHT+IHAdcdG7hpekbFcXeMSUiCmqZffPQwmcz05ZSzYtIgv2HVaQ5BUf9uK4RLlgYN1e4Bu2XUrfw==
X-Received: by 2002:a17:907:84ca:b0:a5a:7d28:54aa with SMTP id a640c23a62f3a-a62642e7557mr874299466b.23.1716833541576;
        Mon, 27 May 2024 11:12:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/13] zstd: upgrade 1.5.5 -> 1.5.6
Date: Mon, 27 May 2024 20:12:07 +0200
Message-Id: <20240527181214.1778037-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199923

From: Alexander Kanavin <alex@linutronix.de>

Drop patch that was merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-use-directly-for-the-test-c-snippet.patch | 39 -------------------
 .../zstd/{zstd_1.5.5.bb => zstd_1.5.6.bb}     |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-extended/zstd/zstd/0001-pzstd-use-directly-for-the-test-c-snippet.patch
 rename meta/recipes-extended/zstd/{zstd_1.5.5.bb => zstd_1.5.6.bb} (91%)

diff --git a/meta/recipes-extended/zstd/zstd/0001-pzstd-use-directly-for-the-test-c-snippet.patch b/meta/recipes-extended/zstd/zstd/0001-pzstd-use-directly-for-the-test-c-snippet.patch
deleted file mode 100644
index 847a641691d..00000000000
--- a/meta/recipes-extended/zstd/zstd/0001-pzstd-use-directly-for-the-test-c-snippet.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 121ef5253a49065dea6a89536ca7bd3dabd40e25 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 19 Jun 2023 17:10:09 +0200
-Subject: [PATCH] pzstd: use c++14 without conditions
-
-Doing this check with a direct c++ snippet is prone to portability problems:
-
-- \043 is not portable between shells: dash expands it to #,
-bash does not;
-
-- using # directly works with make 4.3 but does not with make 4.2.
-
-Let's just use the c++ version that covers both the code and the gtest.
-
-Upstream-Status: Submitted [https://github.com/facebook/zstd/pull/3682]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- contrib/pzstd/Makefile | 7 ++-----
- 1 file changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/contrib/pzstd/Makefile b/contrib/pzstd/Makefile
-index e62f8e87..58fb82a1 100644
---- a/contrib/pzstd/Makefile
-+++ b/contrib/pzstd/Makefile
-@@ -37,11 +37,8 @@ CFLAGS   += -Wno-deprecated-declarations
- PZSTD_INC  = -I$(ZSTDDIR) -I$(ZSTDDIR)/common -I$(PROGDIR) -I.
- GTEST_INC  = -isystem googletest/googletest/include
- 
--# If default C++ version is older than C++11, explicitly set C++11, which is the
--# minimum required by the code.
--ifeq ($(shell echo "\043if __cplusplus < 201103L\n\043error\n\043endif" | $(CXX) -x c++ -Werror -c - -o /dev/null 2>/dev/null && echo 1 || echo 0),0)
--PZSTD_CXX_STD := -std=c++11
--endif
-+# Set the minimum required by gtest
-+PZSTD_CXX_STD := -std=c++14
- 
- PZSTD_CPPFLAGS  = $(PZSTD_INC)
- PZSTD_CCXXFLAGS =
diff --git a/meta/recipes-extended/zstd/zstd_1.5.5.bb b/meta/recipes-extended/zstd/zstd_1.5.6.bb
similarity index 91%
rename from meta/recipes-extended/zstd/zstd_1.5.5.bb
rename to meta/recipes-extended/zstd/zstd_1.5.6.bb
index 2d72af50a43..0f3309d8afa 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.6.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0 \
                     "
 
-SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
-           file://0001-pzstd-use-directly-for-the-test-c-snippet.patch"
+SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https"
 
-SRCREV = "63779c798237346c2b245c546c40b72a5a5913fe"
+SRCREV = "794ea1b0afca0f020f4e57b6732332231fb23c70"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.39.2


