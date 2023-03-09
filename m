Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00699C74A44
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.16123.1678375210112749934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ItRe1/td;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id g3so2242366wri.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFaEO5L6BiI0MP2NZfXgYGI0aa3cxfygwv5zFjbd4xE=;
        b=ItRe1/tdj7YzGaEEqdF3wpVbAs+RW7JDP+BknI8QEQVqKiUPxav0ToBl4SJrjg6ERk
         YgJLr4uJyqUxgxhSYFSHG2nztP/Rju2LNqXmVt08mlWpMcLfeAinkzM0EOLQp7HP5ah7
         wZqtXdvVYee/Io/6kf8INO5YZobSgobLcipIOoKpM3wKMjN6v2T6f96nP7wf9qpsKew7
         QNKoA3AGBUCPXRdm6RfmQEGa6Yf5gtq2L+N4Mbdn1zfcGMbnjBrb6SQIxaoB8nvL6CZW
         dw1K3t0vLlInpzVd4r6hmkPD5BtMKiTMhBJERZE1zawbvSxKhZ+gLvMPqPWvUCzD88gD
         4KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFaEO5L6BiI0MP2NZfXgYGI0aa3cxfygwv5zFjbd4xE=;
        b=mNLQkIEymjg5dqK/mKLXaYErLGcA/ZpcH+RJt8WUFLYasULXsdih21nwYXiVKo2Ipr
         5Hm1i0CxEIK96mckuq6aDUlwU6yKZ/Lq3/nkxkb9U6pCYK/JRSj0c9ig7mnrX1m3WGur
         CzjIJp/dxYm8FPsmaRhHcqhMdJzUiaERiZ6vzMlaRJZXtlfGMo1zJE+ykgRIrqXx93+A
         m6bEt90o5rMzerBkuGYcAb5Kx2IenkttCr0LvCvvKSAUTkUWnr+EKMheZoh4PxR5/xGu
         APycCXL7n1tQBXsFE7uKxhXXeFqbbWOEmhv7lDSAyDHHe8I1gM5cxwx+RW5iNfVW4ZCo
         9tpg==
X-Gm-Message-State: AO0yUKVyZ8XcmM8j5wu0AjSsNUmYOVdAjiFAYaa5+GUzNOGfCr6s6TjD
	nwfZWUB0Up+KXO+UcFw5J/cOhMgLZOs=
X-Google-Smtp-Source: AK7set/H4kwGIkJnKoFpxYEm1ksCbo3WYWJCIo7ybXGgXjXKI3xSZa6yGagklD5XlHW6frdun/ruhQ==
X-Received: by 2002:a5d:50c7:0:b0:2cb:29eb:a35e with SMTP id f7-20020a5d50c7000000b002cb29eba35emr18957959wrt.11.1678375208632;
        Thu, 09 Mar 2023 07:20:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/26] ethtool: update 6.1 -> 6.2
Date: Thu,  9 Mar 2023 16:19:40 +0100
Message-Id: <20230309151958.3619193-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178233

Drop patch merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-marvell.c-define-_GNU_SOURCE.patch   | 59 -------------------
 .../ethtool/avoid_parallel_tests.patch        |  6 +-
 .../{ethtool_6.1.bb => ethtool_6.2.bb}        |  3 +-
 3 files changed, 4 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch
 rename meta/recipes-extended/ethtool/{ethtool_6.1.bb => ethtool_6.2.bb} (90%)

diff --git a/meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch b/meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch
deleted file mode 100644
index 8a7eeafb9c..0000000000
--- a/meta/recipes-extended/ethtool/ethtool/0001-marvell.c-define-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 5112785191e3279c671a027fe797be77e1071ecd Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 2 Jan 2023 13:45:46 +0100
-Subject: [PATCH] marvell.c: use portable integer types
-
-u_int32_t is not portable, but uint32_t is.
-
-Upstream-Status: Submitted [by email to mkubecek@suse.cz]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- marvell.c | 34 +++++++++++++++++-----------------
- 1 file changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/marvell.c b/marvell.c
-index d3d570e..3d42eed 100644
---- a/marvell.c
-+++ b/marvell.c
-@@ -31,23 +31,23 @@ static void dump_timer(const char *name, const void *p)
- static void dump_queue(const char *name, const void *a, int rx)
- {
- 	struct desc {
--		u_int32_t		ctl;
--		u_int32_t		next;
--		u_int32_t		data_lo;
--		u_int32_t		data_hi;
--		u_int32_t		status;
--		u_int32_t		timestamp;
--		u_int16_t		csum2;
--		u_int16_t		csum1;
--		u_int16_t		csum2_start;
--		u_int16_t		csum1_start;
--		u_int32_t		addr_lo;
--		u_int32_t		addr_hi;
--		u_int32_t		count_lo;
--		u_int32_t		count_hi;
--		u_int32_t               byte_count;
--		u_int32_t               csr;
--		u_int32_t               flag;
-+		uint32_t		ctl;
-+		uint32_t		next;
-+		uint32_t		data_lo;
-+		uint32_t		data_hi;
-+		uint32_t		status;
-+		uint32_t		timestamp;
-+		uint16_t		csum2;
-+		uint16_t		csum1;
-+		uint16_t		csum2_start;
-+		uint16_t		csum1_start;
-+		uint32_t		addr_lo;
-+		uint32_t		addr_hi;
-+		uint32_t		count_lo;
-+		uint32_t		count_hi;
-+		uint32_t                byte_count;
-+		uint32_t                csr;
-+		uint32_t               flag;
- 	};
- 	const struct desc *d = a;
- 
diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 4994369682..d5cb8705c2 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 0d066a901292e6a44ff7bc7ee16f99dd2ba4ea15 Mon Sep 17 00:00:00 2001
+From b4ec6635af4d4a47e9ab7bbd5347e78710d19362 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3eb4e7b..ee5c72f 100644
+index ebdfd39..c93b79a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 6.1, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 6.2, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.1.bb b/meta/recipes-extended/ethtool/ethtool_6.2.bb
similarity index 90%
rename from meta/recipes-extended/ethtool/ethtool_6.1.bb
rename to meta/recipes-extended/ethtool/ethtool_6.2.bb
index 2b9bbe69db..881e638851 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.1.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.2.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest \
            file://avoid_parallel_tests.patch \
-           file://0001-marvell.c-define-_GNU_SOURCE.patch \
            "
 
-SRC_URI[sha256sum] = "1d03f1ce324fbd95591191c42ac0c4c9cc721e067b929083a20a46c4b4731436"
+SRC_URI[sha256sum] = "1a9f95c3d8c1795a942220912d72c06a208f1c122a78f7690259402856ff06a0"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.30.2


