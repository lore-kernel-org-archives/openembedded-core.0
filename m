Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 83920601CF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 07:28:54 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id l184so2258216pfl.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 23:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FP23SxAq+uYEy++HnPqZRNP7LxR98CstkRgd3dYTfOI=;
	b=Lp3J5uod33BCzx/anUsrOnzZe54vpJ2ANCdDwlDVe5rT/r8mdof8tiMd1LXpnK2cgU
	QwYILIY8Oq6XB19yXCQiYtixlyihzEZ7OklnEcBWyhkjtpsmGHY/vhIoU4Z7+Fj4ihSq
	as6NOdaCIZaZTb+EH7ZgCv5C5D2OqvtcMZkrIggH2OEwuQVvrJVrLY18ObGNVt2BetFp
	piNJlioA0XdK59B70lMFaoxXM9Gt/qkqBFqAAgjNeMZ8gMcqCy6NXBI8qznZSg0FhyCP
	6nPmBAnj3i4rtF6OEUz+9WD4HOiOVuCUtCPuXHB6hxhwEj0OUN3xdwG0yDEZoWL8ES06
	kaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FP23SxAq+uYEy++HnPqZRNP7LxR98CstkRgd3dYTfOI=;
	b=lheEMBNM8x4qXEt+25mHVpUENrQtmkLZD3MxOiGiMa/kW42GYQd/Hnwza1rnyZKgAU
	F53z9/hMdX9SRqmz4xN7pAIatAjw1S9VmiKM+p8XWDUZEza4VucOiQ89zj2ASn+h85ZC
	Td5snhX1wYyt1YF/w38/LKvu8t++oQgSImluS9T15gfxqtizZkg846wx959hM+BBc/IR
	23tSc+zyLbh41vZKoqmlcdriNMHyWxPy/VknRt3HnCF2tIL4OVPIOG2TjemdooVoVZw4
	d+q75LglEv5NITPtLw6kMRX54ukaOyd4HKKm59eRbLUxtYeLFWkHhQwa3RQPGv3VjgPn
	8maA==
X-Gm-Message-State: ANhLgQ3QmEdvJuw/CEZTYYmB+dAQiobyT5MzxYy11CU5rZX7v28uIftP
	Y+PShjtkuc68+Lz65dqvCxWQKlrhQrQ=
X-Google-Smtp-Source: ADFU+vva6IvloM6T46JjSpj3oaJra/jpFXyD+SNS6jAaGY2dEUZFC2Bv8i8wqhgCHGaNhDuIGpMOCA==
X-Received: by 2002:a63:e053:: with SMTP id n19mr7124696pgj.64.1583566134817; 
	Fri, 06 Mar 2020 23:28:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	b21sm39680490pfp.0.2020.03.06.23.28.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 23:28:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 23:29:04 -0800
Message-Id: <20200307072904.2435002-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] make: Fix build on arm/clang
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
X-List-Received-Date: Sat, 07 Mar 2020 07:28:54 -0000
Content-Transfer-Encoding: 8bit

clang defines __arm which is interpreted as non-posix by make build
system but thats not correct when using clang so patch addresses that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...inst-Do-not-undef-POSIX-on-clang-arm.patch | 38 +++++++++++++++++++
 meta/recipes-devtools/make/make_4.3.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/make/make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch

diff --git a/meta/recipes-devtools/make/make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch b/meta/recipes-devtools/make/make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch
new file mode 100644
index 0000000000..2da7c983dc
--- /dev/null
+++ b/meta/recipes-devtools/make/make/0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch
@@ -0,0 +1,38 @@
+From 86b7947156a0c33e768d0a265e38f2881a70a7e2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 6 Mar 2020 23:19:37 -0800
+Subject: [PATCH] makeinst: Do not undef POSIX on clang/arm
+
+if __arm internal compiler macro is defined then make assumes that the
+system is not posix and goes ahead and undefs POSIX, which results in
+miscompiling make with clang, since clang does define __arm unlike gcc
+which does not, but they both support posix just fine, so here check for
+compiler not being clang when __arm is defined before undefining posix
+
+Fixes error like
+../make-4.3/src/job.c:507:27: error: too many arguments to function call, expected 0, have 1
+  sigsetmask (siggetmask (0) & ~fatal_signal_mask)
+              ~~~~~~~~~~  ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/makeint.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/makeint.h b/src/makeint.h
+index c428a36..fadf963 100644
+--- a/src/makeint.h
++++ b/src/makeint.h
+@@ -115,7 +115,7 @@ extern int errno;
+ #endif
+ 
+ /* Some systems define _POSIX_VERSION but are not really POSIX.1.  */
+-#if (defined (butterfly) || defined (__arm) || (defined (__mips) && defined (_SYSTYPE_SVR3)) || (defined (sequent) && defined (i386)))
++#if (defined (butterfly) || (defined (__arm) && !defined(__clang__)) || (defined (__mips) && defined (_SYSTYPE_SVR3)) || (defined (sequent) && defined (i386)))
+ # undef POSIX
+ #endif
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/make/make_4.3.bb b/meta/recipes-devtools/make/make_4.3.bb
index cd0ecd4df2..3e0eb543ba 100644
--- a/meta/recipes-devtools/make/make_4.3.bb
+++ b/meta/recipes-devtools/make/make_4.3.bb
@@ -8,6 +8,7 @@ SRC_URI += "\
 	file://0001-src-dir.c-fix-buffer-overflow-warning.patch \
 	file://0002-w32-compat-dirent.c-follow-header.patch \
 	file://0003-posixfcn-fcntl-gnulib-make-emulated.patch \
+	file://0001-makeinst-Do-not-undef-POSIX-on-clang-arm.patch \
 "
 
 EXTRA_OECONF += "--without-guile"
-- 
2.25.1


