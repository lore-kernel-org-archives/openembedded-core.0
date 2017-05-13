Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id ABF9177D21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 02:59:51 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a23so8879383pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 19:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YC/+O+U7GuhJ5bPmFUEYuAGafouugVgCzaG6XjSxnhs=;
	b=KfVWeRy6vnz9XI3nYiB3hmmYr916/fWYdA/x8WGc16z3cPJTvjJL/pmNynTx/F2gOy
	EVCsVqYkcnlfr3MatqGFsrdV0lhOQPuwt8hqe+ELZHbcLjdNNEz1enwNOxTdAjfobYT9
	aQ/nDA49q5aGl0tuztOVH/7Akgfk3Ll4vOrEmJuCVcUPzXll87t9wwXMVFNWB88J6Rxr
	gN/AOT/t3RhG76bxDmfhN+dtu/Mts6UX7Tj2p7rZaEv7XZVMbCqVlYHJyA7F0JECIxB9
	GurqFy+lWjVu5s9S0Cb99MxINuXveqvnHnIsm70QRb2z35GyI8EJNwmT6/BMexhdSN+h
	Shdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YC/+O+U7GuhJ5bPmFUEYuAGafouugVgCzaG6XjSxnhs=;
	b=ByoVWP69fa9RobaIJwSAfMAhZDgloLO/EFBnOHqzaeRb0qh4htRUhm70idkFnvC8y5
	Djvyvq9JhwNV1O5DpSPutl8ToV7dXw/LTVtXai9ZTqOeCDNh6z6JTr3h+q5/7hezc16s
	oUs8hWo4smKLCmWc/LdgUU+wRJtKTXvDa4bRJqg7Dn4+MgEP6+eotTn+FicBbI/xvF2k
	SSXYgwGd5S6WWbrO73BYAJsVlWIlYkqPIudUumn7aCjvwt2BALL8G0sGryi029P6syBS
	9apaUiAGo7vZCH2eEoZnC1JQFU/DqTYbXoJ4yqODThiCzR8IbHOvNfyb+KVtoPxmplsx
	4DbA==
X-Gm-Message-State: AODbwcA/7VJb4kjTGn9xJbrBcA4uBTcBwDoWht51w7pRXgmybV+sV4KQ
	Qhr3p7ypnodJdQ==
X-Received: by 10.99.39.194 with SMTP id n185mr7550164pgn.15.1494644393254;
	Fri, 12 May 2017 19:59:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id q4sm4541134pgf.9.2017.05.12.19.59.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 19:59:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 19:59:32 -0700
Message-Id: <20170513025932.26254-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170513025932.26254-1-raj.khem@gmail.com>
References: <20170513025932.26254-1-raj.khem@gmail.com>
Subject: [PATCH 7/7] linux-yocto_4.1.bb: Fix build with gcc7
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
X-List-Received-Date: Sat, 13 May 2017 02:59:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ve-up-on-gcc-ilog2-constant-optimizations.patch | 134 +++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   2 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-gcc-ilog2-constant-optimizations.patch

diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-gcc-ilog2-constant-optimizations.patch b/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-gcc-ilog2-constant-optimizations.patch
new file mode 100644
index 0000000000..35c4484f20
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/0001-give-up-on-gcc-ilog2-constant-optimizations.patch
@@ -0,0 +1,134 @@
+From 273bf720b7acb5f808337fe57c5f400422a30051 Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Thu, 2 Mar 2017 12:17:22 -0800
+Subject: [PATCH] give up on gcc ilog2() constant optimizations
+
+commit 474c90156c8dcc2fa815e6716cc9394d7930cb9c upstream.
+
+gcc-7 has an "optimization" pass that completely screws up, and
+generates the code expansion for the (impossible) case of calling
+ilog2() with a zero constant, even when the code gcc compiles does not
+actually have a zero constant.
+
+And we try to generate a compile-time error for anybody doing ilog2() on
+a constant where that doesn't make sense (be it zero or negative).  So
+now gcc7 will fail the build due to our sanity checking, because it
+created that constant-zero case that didn't actually exist in the source
+code.
+
+There's a whole long discussion on the kernel mailing about how to work
+around this gcc bug.  The gcc people themselevs have discussed their
+"feature" in
+
+   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=72785
+
+but it's all water under the bridge, because while it looked at one
+point like it would be solved by the time gcc7 was released, that was
+not to be.
+
+So now we have to deal with this compiler braindamage.
+
+And the only simple approach seems to be to just delete the code that
+tries to warn about bad uses of ilog2().
+
+So now "ilog2()" will just return 0 not just for the value 1, but for
+any non-positive value too.
+
+It's not like I can recall anybody having ever actually tried to use
+this function on any invalid value, but maybe the sanity check just
+meant that such code never made it out in public.
+
+Reported-by: Laura Abbott <labbott@redhat.com>
+Cc: John Stultz <john.stultz@linaro.org>,
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Cc: Jiri Slaby <jslaby@suse.cz>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Backport
+
+ include/linux/log2.h       | 13 ++-----------
+ tools/include/linux/log2.h | 13 ++-----------
+ 2 files changed, 4 insertions(+), 22 deletions(-)
+
+diff --git a/include/linux/log2.h b/include/linux/log2.h
+index fd7ff3d91e6a..f38fae23bdac 100644
+--- a/include/linux/log2.h
++++ b/include/linux/log2.h
+@@ -16,12 +16,6 @@
+ #include <linux/bitops.h>
+ 
+ /*
+- * deal with unrepresentable constant logarithms
+- */
+-extern __attribute__((const, noreturn))
+-int ____ilog2_NaN(void);
+-
+-/*
+  * non-constant log of base 2 calculators
+  * - the arch may override these in asm/bitops.h if they can be implemented
+  *   more efficiently than using fls() and fls64()
+@@ -85,7 +79,7 @@ unsigned long __rounddown_pow_of_two(unsigned long n)
+ #define ilog2(n)				\
+ (						\
+ 	__builtin_constant_p(n) ? (		\
+-		(n) < 1 ? ____ilog2_NaN() :	\
++		(n) < 2 ? 0 :			\
+ 		(n) & (1ULL << 63) ? 63 :	\
+ 		(n) & (1ULL << 62) ? 62 :	\
+ 		(n) & (1ULL << 61) ? 61 :	\
+@@ -148,10 +142,7 @@ unsigned long __rounddown_pow_of_two(unsigned long n)
+ 		(n) & (1ULL <<  4) ?  4 :	\
+ 		(n) & (1ULL <<  3) ?  3 :	\
+ 		(n) & (1ULL <<  2) ?  2 :	\
+-		(n) & (1ULL <<  1) ?  1 :	\
+-		(n) & (1ULL <<  0) ?  0 :	\
+-		____ilog2_NaN()			\
+-				   ) :		\
++		1 ) :				\
+ 	(sizeof(n) <= 4) ?			\
+ 	__ilog2_u32(n) :			\
+ 	__ilog2_u64(n)				\
+diff --git a/tools/include/linux/log2.h b/tools/include/linux/log2.h
+index 41446668ccce..d5677d39c1e4 100644
+--- a/tools/include/linux/log2.h
++++ b/tools/include/linux/log2.h
+@@ -13,12 +13,6 @@
+ #define _TOOLS_LINUX_LOG2_H
+ 
+ /*
+- * deal with unrepresentable constant logarithms
+- */
+-extern __attribute__((const, noreturn))
+-int ____ilog2_NaN(void);
+-
+-/*
+  * non-constant log of base 2 calculators
+  * - the arch may override these in asm/bitops.h if they can be implemented
+  *   more efficiently than using fls() and fls64()
+@@ -78,7 +72,7 @@ unsigned long __rounddown_pow_of_two(unsigned long n)
+ #define ilog2(n)				\
+ (						\
+ 	__builtin_constant_p(n) ? (		\
+-		(n) < 1 ? ____ilog2_NaN() :	\
++		(n) < 2 ? 0 :			\
+ 		(n) & (1ULL << 63) ? 63 :	\
+ 		(n) & (1ULL << 62) ? 62 :	\
+ 		(n) & (1ULL << 61) ? 61 :	\
+@@ -141,10 +135,7 @@ unsigned long __rounddown_pow_of_two(unsigned long n)
+ 		(n) & (1ULL <<  4) ?  4 :	\
+ 		(n) & (1ULL <<  3) ?  3 :	\
+ 		(n) & (1ULL <<  2) ?  2 :	\
+-		(n) & (1ULL <<  1) ?  1 :	\
+-		(n) & (1ULL <<  0) ?  0 :	\
+-		____ilog2_NaN()			\
+-				   ) :		\
++		1 ) :				\
+ 	(sizeof(n) <= 4) ?			\
+ 	__ilog2_u32(n) :			\
+ 	__ilog2_u64(n)				\
+-- 
+2.12.2
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index bf7f266ee6..f90d5159d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -24,6 +24,8 @@ SRCREV_meta ?= "7140ddb86e4b01529185e6d4a606001ad152b8f3"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
+SRC_URI += "file://0001-give-up-on-gcc-ilog2-constant-optimizations.patch"
+
 LINUX_VERSION ?= "4.1.38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
2.13.0


