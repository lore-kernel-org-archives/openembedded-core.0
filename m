Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 85D7A6C12F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 20:10:27 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id r136so8206993pfc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 12:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0pLDxKS3iPjVQEcXjiGvACUVv3xyzkF9acS1Y60kpbE=;
	b=aA/YA10AzRl9MXbQZ0KI9j1H/W4a+HoIButE1Out0ejt2tG52co7b78s7jl/uCWxjE
	XKKJYIL/iIbO6OA+qPhB7545UrDC5yf/Pw+1TJXodEgkV/XuJ+HUT3F+zxXiJktgla+i
	j374qTImySZs+AEsJPPKJ4J88EZcsLg7aLfPj+Ef54o5zuR6IyG+I73Ca3sPC6bFJALL
	Cnyc5qj9Io2jtFLcBhIVVo9aYRwbU3AVVXf1qgTVSICqEwj7/a2XfGdiJkvWMli2q8zJ
	YjoPrOTEcpAngCYAOO+BUaIoEd6bGGEmzwuU3tPRIQSCNA2bG/dWgegE4LAuV3rPKNB5
	qfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0pLDxKS3iPjVQEcXjiGvACUVv3xyzkF9acS1Y60kpbE=;
	b=T2dh71KwOjuOSGQhOmBU7gpQZCD2AZzu+0Zf5LvDQit7PbofvBOCCfGg2ddoqA1Uu+
	tiZDKm4luw6BuJWKkuijRpAoFqm1i332YMq9T8HNFJq8pUJjIZESrbYvHs8Tfpz84hTG
	eR/w8CnWDgM78E/1nrCBAnnKYT5rPrrO+y9iJQ4mwFEzpAwhPzxKInfMUY41TXCjrB57
	9oTkkSR1HMIK6TYIM7aCPWkimHDyJSh7Ja8yBm2rn9I5/q2SV/Qw6j4a8xHhCjRXcK+p
	rstjgzbFEKQFWaeAdJiaM11eTIg1E4wNZv55J/X166xEzRFQNFhlytk1CHNg4j0Y3GMo
	oKsA==
X-Gm-Message-State: AJcUukfRRYAwxo1UIFxhm7HE3zOWzs0ki0S2sJTAPb5d3jM+mpfByO6K
	Xdpqq/BAVomYulf1FMTMEN7LG7uF7v4=
X-Google-Smtp-Source: ALg8bN5FaA8whbxakc6QCGpJvZPf1k/TXA3amW8Iua7XqP7sf/Og5o+lWB24o4FydS31YD4xnWTMIg==
X-Received: by 2002:a65:64c8:: with SMTP id t8mr19868144pgv.31.1545855028276; 
	Wed, 26 Dec 2018 12:10:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	l3sm60029493pga.92.2018.12.26.12.10.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 12:10:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2018 12:09:51 -0800
Message-Id: <20181226200954.5267-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226200954.5267-1-raj.khem@gmail.com>
References: <20181226200954.5267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] gdb: Backport a fix to build with gcc9
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
X-List-Received-Date: Wed, 26 Dec 2018 20:10:27 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-8.2.inc         |  1 +
 ...1-Fix-build-with-latest-GCC-9.0-tree.patch | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-Fix-build-with-latest-GCC-9.0-tree.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.2.inc b/meta/recipes-devtools/gdb/gdb-8.2.inc
index 7e0809de72..f6d75ed081 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.2.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-Fix-invalid-sigprocmask-call.patch \
            file://gdbserver-ctrl-c-handling.patch \
+           file://0001-Fix-build-with-latest-GCC-9.0-tree.patch \
 "
 SRC_URI[md5sum] = "b5a49dbff00d9a87fbe114d14b3101c0"
 SRC_URI[sha256sum] = "c3a441a29c7c89720b734e5a9c6289c0a06be7e0c76ef538f7bbcef389347c39"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-Fix-build-with-latest-GCC-9.0-tree.patch b/meta/recipes-devtools/gdb/gdb/0001-Fix-build-with-latest-GCC-9.0-tree.patch
new file mode 100644
index 0000000000..2a962929d7
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-Fix-build-with-latest-GCC-9.0-tree.patch
@@ -0,0 +1,50 @@
+From 7406a50077773e78282a495cb32ef5b8179f6a33 Mon Sep 17 00:00:00 2001
+From: Dimitar Dimitrov <dimitar@dinux.eu>
+Date: Mon, 17 Dec 2018 21:30:52 +0200
+Subject: [PATCH] Fix build with latest GCC 9.0 tree
+
+A recent patch [1] to fix a GCC PR [2] actually broke the GDB build.
+To fix, remove the stack pointer clobber. GCC will ignore the clobber
+marker, and will not save or restore the stack pointer.
+
+I ran "make check-gdb" on x86_64 to ensure there are no regressions.
+
+gdb/ChangeLog:
+
+2018-12-17  Dimitar Dimitrov  <dimitar@dinux.eu>
+
+	* nat/linux-ptrace.c (linux_ptrace_test_ret_to_nx): Remove sp clobbers.
+
+[1] https://gcc.gnu.org/ml/gcc-patches/2018-12/msg00532.html
+[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813
+
+Upstream-Status: Backport
+Signed-off-by: Dimitar Dimitrov <dimitar@dinux.eu>
+---
+ gdb/ChangeLog          | 5 +++++
+ gdb/nat/linux-ptrace.c | 4 ++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
+index d4c1b8f9fd..187cfeb9bc 100644
+--- a/gdb/nat/linux-ptrace.c
++++ b/gdb/nat/linux-ptrace.c
+@@ -161,14 +161,14 @@ linux_ptrace_test_ret_to_nx (void)
+ 			".globl linux_ptrace_test_ret_to_nx_instr;"
+ 			"linux_ptrace_test_ret_to_nx_instr:"
+ 			"ret"
+-			: : "r" (return_address) : "%esp", "memory");
++			: : "r" (return_address) : "memory");
+ #elif defined __x86_64__
+ 	  asm volatile ("pushq %0;"
+ 			".globl linux_ptrace_test_ret_to_nx_instr;"
+ 			"linux_ptrace_test_ret_to_nx_instr:"
+ 			"ret"
+ 			: : "r" ((uint64_t) (uintptr_t) return_address)
+-			: "%rsp", "memory");
++			: "memory");
+ #else
+ # error "!__i386__ && !__x86_64__"
+ #endif
+--
+2.20.1
-- 
2.20.1


