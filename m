Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 87FC176E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:48 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id e32so258873640qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=A71wkhRb/KdKJN5ettIY2JJf70cQv6JDjEVfp/oPbvU=;
	b=XwlftrrNafnPW+7ufC2B1HhuE4QZXbdFlJWDghnYPyoI6zDa8UiB1SQYOHqfPUJGtH
	0uRiu6DrGjiLYjSzXxPrRjFH3CSvuCMQcHK+oS/pxY5oPxtAxCT+mXgNk8FGm3e/jsmH
	KVAmnODtLsfECBsH3IremtkUXX3bVWHncVmRr7pU90vH+ap4VOCmweTXshxoqpVJm9d4
	P/fK1d9hfJnqZCFlBLbDpGVB/BlkHNb8ueK+ZoA2+66IZ4zMgI6qDWxtFfTACS/UUtJ1
	kNRSoGt6lV79IHCvv1B1Xnj3R5wdM51TJoNrYxsDD5ldFWj7lzmB3ksfcVoL2GpN58ik
	/QAw==
X-Received: by 10.140.128.8 with SMTP id 8mr124961604qha.54.1452248388788;
	Fri, 08 Jan 2016 02:19:48 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:00 +0000
Message-Id: <e720072046be2c34dfd077be9ea4433ebb596715.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 32/53] libunwind: backtrace APIs are glibc specific
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:49 -0000

Make backtrace() API's use conditional on glibc
this helps make libunwind compile on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-backtrace-Use-only-with-glibc-and-uclibc.patch | 45 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-glibc-and-uclibc.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-glibc-and-uclibc.patch b/meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-glibc-and-uclibc.patch
new file mode 100644
index 0000000..9aed419
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/0001-backtrace-Use-only-with-glibc-and-uclibc.patch
@@ -0,0 +1,45 @@
+From 04437142399662b576bd55a85485c6dcc14d0812 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Dec 2015 06:44:07 +0000
+Subject: [PATCH] backtrace: Use only with glibc and uclibc
+
+backtrace API is glibc specific not linux specific
+so make it behave so.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ tests/test-coredump-unwind.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test-coredump-unwind.c b/tests/test-coredump-unwind.c
+index 5254708..8767b42 100644
+--- a/tests/test-coredump-unwind.c
++++ b/tests/test-coredump-unwind.c
+@@ -57,7 +57,9 @@
+ #include <grp.h>
+ 
+ /* For SIGSEGV handler code */
++#ifdef __GLIBC__
+ #include <execinfo.h>
++#endif
+ #include <sys/ucontext.h>
+ 
+ #include <libunwind-coredump.h>
+@@ -238,11 +240,11 @@ void handle_sigsegv(int sig, siginfo_t *info, void *ucontext)
+ 			ip);
+ 
+   {
++#ifdef __GLIBC__
+     /* glibc extension */
+     void *array[50];
+     int size;
+     size = backtrace(array, 50);
+-#ifdef __linux__
+     backtrace_symbols_fd(array, size, 2);
+ #endif
+   }
+-- 
+2.6.4
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index aa62bcc..7df9f5e 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -7,6 +7,7 @@ SRC_URI += "\
     file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
     file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch \
     file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
+    file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
 "
 
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
-- 
2.7.0


