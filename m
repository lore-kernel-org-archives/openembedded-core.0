Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFB6775DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:24:01 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id k14so98736pgr.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/krXaZn8j6f+TDf5TFEKD/Myd6MuIo4lRFQd1H+KxTA=;
	b=KAtsbLmOurmdLo6oW2cuUr2UdxQbolJ6Pklr1LLw5laRwg+uRH2tqKlcuZpXFqOiGL
	YGVvq/84dh9fxTHkEU/KF081shBXtu4N889nQm7vI35KB9Mx2BUUd9M5Mh7ea5wHOwZw
	wCx8dJcvHO4NPhvTpFPIIpHfbXQJOsyo24CDbp4d2JpWfDP1Ov5dKBZ+56x/EwdMSuAD
	D69nlHZPYfOwp6sCJnFo8C0O3rwamFOwlUt2jlIFdys9v0wj5OdGLiI5Ikb9mR8SBLJZ
	y6sW+qFQ5anXPVI/I3emi3mvnbaFLsH3WjKSNk0k586vuiExrI0+wHX0n6LfWmc7ZTJ7
	I+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/krXaZn8j6f+TDf5TFEKD/Myd6MuIo4lRFQd1H+KxTA=;
	b=Jqm82294YFnbqvmDZ6t+caro3M4vszF5s7fm85cW2PLPFrbM8K6M0sOHCARuAJdElV
	F5h35PA8D8G5ZjEHWXwkuNPCynpqtLMj+IdAOZI0b1oFg2d4kSV4lX+yLlBn8CUkIg4G
	MOsugFquzoo8HILgo4qyOabEKMPkOdtXkTSx8N5HXfRjNIg0iUgoqTz/AANy4HarhG8g
	rE7YJi1j7Nd+qEI3g2Yx6e+WVmSU+/7CiCGwmMeFg+8dPpJOQzIPi147WW9FSGeZpjYH
	E+X2uUyui9Tz7JiXlO4Y+MgaGTtgvYllar222wnhbRDBST6gUUdM/ytOrPF8F6B+F89t
	HYPw==
X-Gm-Message-State: AIVw1104V9yZoQ5WFqr66tKVJNRd4PNXYOk6qaXGQJkNxGX+f9s9oXGT
	gAAdH7Hj0/DLIIll
X-Received: by 10.98.104.71 with SMTP id d68mr962557pfc.35.1498919042741;
	Sat, 01 Jul 2017 07:24:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.24.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:24:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:19 -0700
Message-Id: <b5dd75791bca9645923aa1dda29e0967fb4ca5c4.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 16/19] valgrind: Fix build with glibc 2.26
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
X-List-Received-Date: Sat, 01 Jul 2017 14:24:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sts-Use-ucontext_t-instead-of-struct-ucon.patch | 30 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch
new file mode 100644
index 0000000000..bf16a1adfe
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch
@@ -0,0 +1,30 @@
+From 629ac492b1d9bc709d17337eb9b1c28603eca250 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Jun 2017 11:01:25 -0700
+Subject: [PATCH] memcheck/tests: Use ucontext_t instead of struct ucontext
+
+glibc 2.26 does not expose struct ucontext anymore
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=381769]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ memcheck/tests/linux/stack_changes.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/stack_changes.c
+index ffb49c6..acc4109 100644
+--- a/memcheck/tests/linux/stack_changes.c
++++ b/memcheck/tests/linux/stack_changes.c
+@@ -11,7 +11,7 @@
+ // checks that Valgrind notices their stack changes properly.
+ 
+ #ifdef __GLIBC__
+-typedef  struct ucontext  mycontext;
++typedef ucontext_t  mycontext;
+ 
+ mycontext ctx1, ctx2, oldc;
+ int count;
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 888b132ec7..4cf8062031 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0004-pth_atfork1.c-Define-error-API-for-musl.patch \
            file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
            file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
+           file://0001-memcheck-tests-Use-ucontext_t-instead-of-struct-ucon.patch \
            "
 SRC_URI_append_libc-musl = "\
            file://0001-fix-build-for-musl-targets.patch \
-- 
2.13.2


