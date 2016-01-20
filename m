Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2140C6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 02:48:04 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id tr5so42729699obc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Nfl/aWMliSehKTY6ia1Q+8ji4xuhXJsDDX29x1gSjn4=;
	b=vDV9b2VIavFkB20V2ITQnFTbFRkrQiv21ICX9Deq17xhETVgxcvCZ2ntjDsfzhXAGA
	DS8Wh+aU+deOceEING9Ukxj3SAVhbK5x6zrs0ROgTtrkhn7LsK03M+icrpktxhCsmjiI
	oouiGJ9bPQkiAPvf73+wMKHOpq26+SY3JiN0OpL8eNo7md3L2Iponiz4fmOo6WRRaV4Q
	RqfQ2GqVh7bWbJcQMojrb39dwhysua9VZjD3b5qeMWPbQlkHHz1nEYKkwIskI9O9aDyD
	pPqzNy7FEGEieg1cJdQbR2k5/hSrbMx+f/a+kJhJr+5zxAuhnQSOcW+1tRduwPFRrmEI
	7fBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Nfl/aWMliSehKTY6ia1Q+8ji4xuhXJsDDX29x1gSjn4=;
	b=U2BaYg/AuVqDC324zH+0K4pO0KbXmnr462P03QmqGSdw6/q3+0GNH8pCm8rSzh4N8w
	158+hsvlckJUVxKBlg10Ibj9XkwuamWR+WQ8Z2hlgidgXRbDb7g3o6YrZuMNkp5gPwhi
	Nia/2K/LXvie9g5TnBrM501wMDrbh8zYETitvM9pFeTe5udUgG+igHg6RAemuRspjAvJ
	jByEfzuyJnVaW7Yrm6Z52b4d14ynRS11kWxAdXuPomFAR4xt19+I4rDf1MluRTEBP3UR
	dLYRuIUOsFe+DSSRiETIVaLiA/QqU8L9G8cRhetef4HY1K8gUjjprx2cloYrNZDA1TsN
	+GXA==
X-Gm-Message-State: AG10YOQ8MmAi6agXm8Ff0N/jpd8bim4ZIkEo0gVc4Jw2rGx8rx+nYfVP5lKEBD38vAIGOA==
X-Received: by 10.60.178.70 with SMTP id cw6mr4878783oec.46.1453258085618;
	Tue, 19 Jan 2016 18:48:05 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	v142sm17042620oie.28.2016.01.19.18.48.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 18:48:04 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:47:51 -0800
Message-Id: <1453258071-22847-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453258071-22847-1-git-send-email-armccurdy@gmail.com>
References: <1453258071-22847-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 3/3] valgrind: avoid neon for targets which don't support it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jan 2016 02:48:05 -0000

The sh-mem-random.c test app tries to use neon loads and stores to
test 64-bit float copies when building for ARM. Allow it to do so if
possible, but fallback to C when building for ARM targets which don't
support neon.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...d-neon-for-targets-which-don-t-support-it.patch | 33 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
new file mode 100644
index 0000000..5fcfec0
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -0,0 +1,33 @@
+From 8facc29c3c56e6cf9cfef70986cf73876044a3fb Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 19 Jan 2016 16:42:36 -0800
+Subject: [PATCH] avoid neon for targets which don't support it
+
+The sh-mem-random.c test app tries to use neon loads and stores to
+test 64-bit float copies when building for ARM. Allow it to do so if
+possible, but fallback to C when building for ARM targets which don't
+support neon.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ memcheck/tests/sh-mem-random.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/memcheck/tests/sh-mem-random.c b/memcheck/tests/sh-mem-random.c
+index ae82248..816e139 100644
+--- a/memcheck/tests/sh-mem-random.c
++++ b/memcheck/tests/sh-mem-random.c
+@@ -191,7 +191,7 @@ void do_test_at ( U1* arr )
+                "emms"
+                : : "r"(arr+dst), "r"(arr+src) : "memory"
+             );
+-#elif defined(__linux__) && defined(__arm__) && !defined(__aarch64__)
++#elif defined(__linux__) && defined(__arm__) && defined(__ARM_NEON__) && !defined(__aarch64__)
+             /* On arm32, many compilers generate a 64-bit float move
+                using two 32 bit integer registers, which completely
+                defeats this test.  Hence force a 64-bit NEON load and
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 4f7c39a..7ef1e48 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
+           file://avoid-neon-for-targets-which-don-t-support-it.patch \
            "
 
 SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
-- 
1.9.1


