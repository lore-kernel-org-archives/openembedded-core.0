Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE0E65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 20:02:19 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so135893405pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 13:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JDrqGX4NgXHBgg37tAdAyV7gLTq0NeTqpGQKA5FCTdo=;
	b=RB+1AzLCuubqTPitQBjOk2cAnClWHyaIwjxQ8MCUmF9yRxDr2+JMhHQFuaoPfg24nx
	RZwhZ28vMswfqaFgiUcxbBVVyFgg5R9G9wHFac58EaVFeLtXGftoaRzO/46Vzr8hQNs1
	QDYZ07eoLHEEl/F2UsYnFOa0Dhj9O3T1N/JUtPm4UUvgq1C61CqblBqEAZyio9P8xIjk
	RJldbKCVRkM1LlMPyazcCPLmYm4VMMZL82WGk8DYsEx4dULyLiORMk0yIvus9jdWv4TY
	S70HGZ8UdOlKDQfOw5kNeUrCi+QimoAUu2TmiYTAvv5zqWUM8JItvIZb3Ze0Hjvkw+Ep
	EMzw==
X-Gm-Message-State: ALoCoQm07Asamry5qmSavRuVkX7nq+kGcs/6G8BjMWFMKjDFxgm6gvoWb1BauREKqAmdkxQZVU/L
X-Received: by 10.68.69.17 with SMTP id a17mr61988843pbu.10.1441742539973;
	Tue, 08 Sep 2015 13:02:19 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	j17sm4377423pdl.59.2015.09.08.13.02.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 13:02:19 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Sep 2015 01:32:01 +0530
Message-Id: <1441742521-19851-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] binutils: Add thunderx support to gas
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
X-List-Received-Date: Tue, 08 Sep 2015 20:02:22 -0000

Without this patch, cross compiling for AArch64 with
"-mcpu=thunderx" fails with below error,

-- snip --
Assembler messages:
Error: unknown cpu `thunderx'
Error: unrecognized option -mcpu=thunderx
-- CUT --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.25.1.inc |  1 +
 .../binutils/add-thunderx-support-for-gas.patch    | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
index 120db87..f3817fa 100644
--- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.25.1.inc
@@ -34,6 +34,7 @@ SRC_URI = "\
      file://0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch \
      file://0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch \
      file://binutils-octeon3.patch \
+     file://add-thunderx-support-for-gas.patch \
      "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch b/meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch
new file mode 100644
index 0000000..0f6875e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch
@@ -0,0 +1,33 @@
+Add thunderx support to gas
+
+Upstream-Status: Submitted [https://sourceware.org/ml/binutils/2014-10/msg00170.html]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+Author: Andrew Pinski <apinski@cavium.com>
+Date: Mon, 20 Oct 2014 11:42:58 -0700
+
+    This patch adds -mcpu=thunderx support to gas.
+
+diff -Naurp git_org/gas/config/tc-aarch64.c git/gas/config/tc-aarch64.c
+--- git_org/gas/config/tc-aarch64.c	2015-09-07 02:13:51.988973523 -0700
++++ git/gas/config/tc-aarch64.c	2015-09-07 02:15:21.705981540 -0700
+@@ -7206,6 +7206,7 @@ static const struct aarch64_cpu_option_t
+ 				 AARCH64_FEATURE_CRC), "Cortex-A57"},
+   {"cortex-a72", AARCH64_FEATURE (AARCH64_ARCH_V8,
+ 				  AARCH64_FEATURE_CRC), "Cortex-A72"},
++  {"thunderx",		AARCH64_ARCH_V8, "Cavium ThunderX"},				  
+   {"exynos-m1", AARCH64_FEATURE (AARCH64_ARCH_V8,
+ 				 AARCH64_FEATURE_CRC | AARCH64_FEATURE_CRYPTO),
+ 				 "Samsung Exynos M1"},
+diff -Naurp git_org/gas/doc/c-aarch64.texi git/gas/doc/c-aarch64.texi
+--- git_org/gas/doc/c-aarch64.texi	2015-09-07 02:13:51.969973522 -0700
++++ git/gas/doc/c-aarch64.texi	2015-09-07 02:16:03.364985262 -0700
+@@ -58,6 +58,7 @@ on the target processor.  The following
+ @code{cortex-a53},
+ @code{cortex-a57},
+ @code{cortex-a72},
++@code{thunderx},
+ @code{exynos-m1},
+ @code{xgene1},
+ and
-- 
1.9.1


