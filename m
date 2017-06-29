Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 10D3177F79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 04:59:13 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id c73so44226059pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 21:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YpuMXa6ZGKqGBQZOjgSg9r8DWize58/farv+hdisPZQ=;
	b=Ysxa1fSHtfJnJBlqJ6wYi/tLw5Z7Y2iKL3R6hUx1bSZmM81GQfOJhbQPRiuuK6ML5b
	IG/ysGswRRrwVogMcQSl7Jn/CE2b/V5S2OK4aaxPzw3Re9EA7bSpydloGpBva/S9JNfX
	GSeZRLuvfEHPZrQeV1cPsGOzd2lIL2d8tBZQgwhIyOkZK/Lo7q8bSI8llI16gmYbHC5f
	NujdGZm4JsW5nE//un+4modXHG//AbfmzWHB4ss/V3D7OVNi+wPTzaCvj2K6TREkiZmq
	y6heuV4R1uCs1G4bRLYNxlPha3WfrHdWUQBr4jE52ds91nDAlLKh7KCmuEi6LwIoAeLg
	Fl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YpuMXa6ZGKqGBQZOjgSg9r8DWize58/farv+hdisPZQ=;
	b=D0j0V/PUBiIFeF9cTmfNYYfjuStHfdDCs5USzLTj+o7U97MQ5alQtNfAp17sw18a8k
	e84aWIrZxHwhzlr8880VFMFoV7080NqDvM532uGar56D7YucZoR/G5ccqnbY7BllRc8K
	aXRLAYasHDgTXiYDppK3oLlDjbjNBKhSnK4htej12777SsOJGrv7PjI6CFAkulE02Wjw
	PFXfpDC0b/Mt0/lCcyd3iBBg58YBretEEkHMiqtzMeLhdhp3qXGP0Hbt18jRUoQROP03
	c/V4BfAwdXYCuBtda1HPtPkUWy0c3ITo3gsrBTtKLhGq/lO4RoPn8vNT60hAgqAk7HE/
	Ox4g==
X-Gm-Message-State: AKS2vOwVlWsqn5zkCucSx9gdJ2tPHVRJ+r8M9/7XvHUqK2ZwnHTjbqHN
	CqDGs2oKa1BXUuMa
X-Received: by 10.98.16.150 with SMTP id 22mr831250pfq.4.1498712354614;
	Wed, 28 Jun 2017 21:59:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm1831468pfl.41.2017.06.28.21.59.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 21:59:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 21:59:02 -0700
Message-Id: <346c4fc83163f915454219c57b59c4753dfd23be.1498712182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498712182.git.raj.khem@gmail.com>
References: <cover.1498712182.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] valgrind: Fix build with glibc 2.26
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
X-List-Received-Date: Thu, 29 Jun 2017 04:59:14 -0000

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
index a81adc31d6..3fce5de0a7 100644
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


