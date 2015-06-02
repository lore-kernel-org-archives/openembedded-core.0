Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED4A757B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 01:06:50 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so120362200pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jun 2015 18:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VVsAIlGKAWZ7v/82pJsHeuMmHr+cJZy5D2k+kyx/GYY=;
	b=e3VWgUwghuncLh6RBBXY9VhpfYL6RmPxDM6B2Z4HoBdRdfH8uX3ufOTn+Cs2JKMYYk
	Q+TUw93dKfbri/pDaNznrj2jtknxev6ofQxW5UvDkqTUjwa3wMVUvTtoTQikG5tj3Koc
	HeNcAxI8+skNY6j9HQbLZwjH4Pf3LFNd33m/+Z2q6TcggG4SF7ZPC7/AzSOzBm6NG0u3
	5gWlnsWIQ/o9BnZlHRSQPwYoaYSKVVbV64Oh+s8i6rjYJgBiX3xqKc1Q0CI1FsvQgIjq
	O/HgIJ4C1QKGdl1WCgNV1Xbe1FuM6F7Fm5Jep51rnklJqRD6R6s0okyxnywTanJaCR4G
	LwWQ==
X-Received: by 10.70.51.67 with SMTP id i3mr45393932pdo.145.1433207212007;
	Mon, 01 Jun 2015 18:06:52 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	ho10sm15507200pbc.27.2015.06.01.18.06.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Jun 2015 18:06:51 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jun 2015 18:06:44 -0700
Message-Id: <1433207204-20974-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] glibc: Fix __memcpy_chk on non-SSE2 CPUs
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
X-List-Received-Date: Tue, 02 Jun 2015 01:06:54 -0000

Backport from upstream glibc:

  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=132a1328eccd20621b77f7810eebbeec0a1af187

Note that the fix is only required when glibc is built for i686/multiarch,
so is not applicable in the default oe-core x86 configuration (which builds
glibc for i586 and therefore does not include SSE2 optimised memcpy etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch  | 36 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb              |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch

diff --git a/meta/recipes-core/glibc/glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch b/meta/recipes-core/glibc/glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch
new file mode 100644
index 0000000..2e768bb
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch
@@ -0,0 +1,36 @@
+From 132a1328eccd20621b77f7810eebbeec0a1af187 Mon Sep 17 00:00:00 2001
+From: Evangelos Foutras <evangelos@foutrelis.com>
+Date: Tue, 10 Feb 2015 03:22:58 +0000
+Subject: [PATCH] Fix __memcpy_chk on non-SSE2 CPUs
+
+In commit 8b4416d, the 1: jump label in __mempcpy_chk was accidentally
+moved.  This resulted in failures of mempcpy on CPU without SSE2.
+
+Upstream-Status: Backport
+
+  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=132a1328eccd20621b77f7810eebbeec0a1af187
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+---
+ sysdeps/i386/i686/multiarch/mempcpy_chk.S | 4 ++--
+ 3 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/sysdeps/i386/i686/multiarch/mempcpy_chk.S b/sysdeps/i386/i686/multiarch/mempcpy_chk.S
+index 207b648..b6fa202 100644
+--- a/sysdeps/i386/i686/multiarch/mempcpy_chk.S
++++ b/sysdeps/i386/i686/multiarch/mempcpy_chk.S
+@@ -36,8 +36,8 @@ ENTRY(__mempcpy_chk)
+ 	cmpl	$0, KIND_OFFSET+__cpu_features@GOTOFF(%ebx)
+ 	jne	1f
+ 	call	__init_cpu_features
+-	leal	__mempcpy_chk_ia32@GOTOFF(%ebx), %eax
+-1:	testl	$bit_SSE2, CPUID_OFFSET+index_SSE2+__cpu_features@GOTOFF(%ebx)
++1:	leal	__mempcpy_chk_ia32@GOTOFF(%ebx), %eax
++	testl	$bit_SSE2, CPUID_OFFSET+index_SSE2+__cpu_features@GOTOFF(%ebx)
+ 	jz	2f
+ 	leal	__mempcpy_chk_sse2_unaligned@GOTOFF(%ebx), %eax
+ 	testl	$bit_Fast_Unaligned_Load, FEATURE_OFFSET+index_Fast_Unaligned_Load+__cpu_features@GOTOFF(%ebx)
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 03c5461..81b5a2b 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
            file://0001-yes-within-the-path-sets-wrong-config-variables.patch \
            file://elf-Makefile-fix-a-typo.patch \
            file://makesyscall.patch \
+           file://Fix-__memcpy_chk-on-non-SSE2-CPUs.patch \
            ${EGLIBCPATCHES} \
            ${CVEPATCHES} \
           "
-- 
1.9.1


