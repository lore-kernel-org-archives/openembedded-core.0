Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CC9C36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.43705.1742834024088752783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DVxtmCY3;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227914acd20so42906495ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834023; x=1743438823; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzXAGxKMvNINZ8Nmsry4POJpnkHjjaPqFkq4KEqx2Yo=;
        b=DVxtmCY3ZNksjQPy8gKiq+9XfnJTuJJNDCa5xk7kEAIixCvLDUbLXkW7QNy2GNWJ3q
         SUuO23ufO0tnrMBjfY16DfWY6JvbgJH4YrRlct9PEOy/9rhcV0JT29CUmDotNvGhzT6W
         wPP6bfTgievnxJZFIJXIaRxJpJ7+GsGIF7/uCEqIp/uHz+RJpty+uJqWzsNfDk7Q1MQd
         WhJBL7sMYwLw3rYvWHDUP0pIs0/I3cUB18Gzg8ux0wgmPo66/OGzBv98IMp9uFd4YF5q
         9wInoCDBU5wr2JwwKVdV0LU1UzgJ6ndf7NSjyPP+3cunFzeQPmcrIdzZxGwzfmgbpp8m
         Y0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834023; x=1743438823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzXAGxKMvNINZ8Nmsry4POJpnkHjjaPqFkq4KEqx2Yo=;
        b=CqKDIU7GNV0Hpcz8psdu9ctbCZdH7HRGGboLcoWfRBDnvG+5VCvYUPWmm+7ldy3BGw
         jtezpvstehaXLGPtucp5Q/1GGfghgsxIUG54nbExkBo8mJJmn776mkv+7ggwuzY4t0V1
         4KIDJI6jsc1ttPT5FF1vDsAEyCu70Eofg7zCIcN4T0w5NZ9gX4UgV4VPPSBq/4WKCFpa
         p2pM4xAngEB90jSICsUOsvxgn2t+KF13cfH7r8t94Q/6la4Cuw4jO8BwK32nrm3wOoeB
         xxe06AoLUYerw3gUY3vEAn2LZXZYQJpiej6DhTnvdMy8C/PnUHRJFTciwqpe30OoruWe
         N3pA==
X-Gm-Message-State: AOJu0Yz4a96QCm6ePPrHWkKlIXeziCOZ/3VkHhtlKWd97+u98XK6QHyr
	G9dNmzN7/S7Ze931cHEt9WOP5VISmh7eOncJIDqKNgCdx0KDTYUrrdAkhyv+
X-Gm-Gg: ASbGnct2tfZ1+chwQv+ywM5Yc2XTXkafj7L+Xxe9quco3e2AB+5jNzSJ01Lk9SJu19p
	AGgHO7p2MdtSGIRMQLNvT4uOExqhDMvdYAWBZIbIusKpMlJvJ/P38sutJgpmcF7dBJXFI++5A6y
	OjQNef2PugLH/NRgLt8TWpHgLYROzsXPmQYYJsbhCtDl6GyrR16OOihQPs7tb9/K84ieE8uBmGP
	cuzwLCjeG6Ejov8f3hXp+YTWRb1IQMKNi3jnwTrVM6A00rrFKFgTyR7n42Y2KoWsIdDqmpbRgkw
	CAAG46Pz1N6P9ZPRtbVyp3nEZIFA/aXol5wPnRivxmVXk44=
X-Google-Smtp-Source: AGHT+IFderUP1LVclBU+48jn5U6tux9j6Yiru3H5zDa7UMXbQKml+xiFcaGqB7AX6fCrX/zcJ2FgRA==
X-Received: by 2002:a05:6a20:c886:b0:1db:822f:36d8 with SMTP id adf61e73a8af0-1fe42770d03mr23361363637.3.1742834023225;
        Mon, 24 Mar 2025 09:33:43 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:24 -0700
Subject: [PATCH 03/21] nettle: Fix build with GCC-15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-3-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213535

These signatures are exposed when build with musl particularly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-getopt-getenv-signatures-in-declarations.patch | 44 ++++++++++++++++++++++
 meta/recipes-support/nettle/nettle_3.10.1.bb       |  1 +
 2 files changed, 45 insertions(+)

diff --git a/meta/recipes-support/nettle/nettle/0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch b/meta/recipes-support/nettle/nettle/0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch
new file mode 100644
index 0000000000000000000000000000000000000000..c6f75e9150aa0108bfbc852784073f24c4245779
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle/0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch
@@ -0,0 +1,44 @@
+From 20eb61eded3bf2ef03e1f37c8c1535b9c246d0f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Mar 2025 13:48:29 -0700
+Subject: [PATCH] getopt: Fix getopt/getenv signatures in declarations
+
+GCC-15 complains about this when trying to build on musl
+
+| ../nettle-3.10.1/getopt.c:139:14: error: conflicting types for 'getenv'; have 'char *(void)'
+|   139 | extern char *getenv ();
+|       |              ^~~~~~
+
+Upstream-Status: Submitted [https://lists.lysator.liu.se/mailman/hyperkitty/list/nettle-bugs@lists.lysator.liu.se/thread/R6BDHRO44KSRDAOZQAREYICI2RG5PVNC/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ getopt.c | 2 +-
+ getopt.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/getopt.c b/getopt.c
+index 9d29de7..5b89302 100644
+--- a/getopt.c
++++ b/getopt.c
+@@ -136,7 +136,7 @@ static struct _getopt_data getopt_data;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *);
+ #endif
+ 
+ #endif /* not __GNU_LIBRARY__ */
+diff --git a/getopt.h b/getopt.h
+index da1a01f..ab50792 100644
+--- a/getopt.h
++++ b/getopt.h
+@@ -166,7 +166,7 @@ extern int __posix_getopt (int ___argc, char *const *___argv,
+ #  endif
+ # endif
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt(int, char * const [], const char *);
+ #endif /* __GNU_LIBRARY__ */
+ 
+ #ifndef __need_getopt
diff --git a/meta/recipes-support/nettle/nettle_3.10.1.bb b/meta/recipes-support/nettle/nettle_3.10.1.bb
index 85c470b10da41b3f0e1e0a6a241c415c273e9932..267a6ed44955c8bd648f0ff5d12f71406e279e1a 100644
--- a/meta/recipes-support/nettle/nettle_3.10.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.10.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://Add-target-to-only-build-tests-not-run-them.patch \
            file://run-ptest \
            file://check-header-files-of-openssl-only-if-enable_.patch \
+           file://0001-getopt-Fix-getopt-getenv-signatures-in-declarations.patch \
            "
 
 SRC_URI[sha256sum] = "b0fcdd7fc0cdea6e80dcf1dd85ba794af0d5b4a57e26397eee3bc193272d9132"

-- 
2.49.0


