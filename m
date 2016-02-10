Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 93F43731F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:43 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id y89so1752640qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=j2bzPJZhBsGToSqik2aOArSFzYhlMlOjRYUnq0k+4Zg=;
	b=lIhM/bYAoh63DRh9Q9R5xIsjOTSS3h6yI8fFY34I/Z9uoil8lgcbHqW2xt6rM/K2Fg
	C1/GeTUkFD+B+OJZlLrLzf6s37gEvBoYMuY3kOU8EUf7kcmEe/82SQpJygDtDJYA/rPr
	jos2P6cN2gAcnlmhiTrzzgIG0/y9Emcn/IECyT21hJuqeZqaLjas1vkr3lvjy0ntrpzJ
	Xsy94FlIUfCud7r1+lWvOsjLhtX7LAeFFTcj6STFTdD+D3ISHVfCkcvvxZvGeJcUTais
	GhYUUxrnaqZfNAz3uk98SA0K1hhm1UbdaN96KiHP9vIEtkhjNWiDesA+621XQBvAbd9Q
	ZYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=j2bzPJZhBsGToSqik2aOArSFzYhlMlOjRYUnq0k+4Zg=;
	b=O5xZCphmu5UIBnRBA01+g15W7gQkMGhAZKiIXwcMgBOA4Ufwpfk1iDtP/0BsQcyI2Z
	YVkNWGwWw5/VzJxvh4t7acSkVFfjfWQofj9kZwTjJMyoSnk2qOsmUWdc8jfQ6406y+Tf
	0yLOM0RPSr/Cacbl6eqAve2H0Un6FawT3WVyRIVPDdBv4QRKF+EYKuHXXPi5g513c8Wt
	AoNFP+tiOxiyd4tQlRfbjwIoaccqlXNgzbHrIKxSWfU4ZvgeSXtilTJeW7VF8GCzJ4r+
	BrukWycDr4JOggwCDtbJaDsDvSLTrNux60xa1toT+gehpOJY/0WxMnOPM619xLQY5udM
	ckow==
X-Gm-Message-State: AG10YOTunoqEWybsv0ync273UGtG/hf6I12RbbpWXIZEgZE86Pn1vyAok+pYrGWBix+8zQ==
X-Received: by 10.140.32.100 with SMTP id g91mr44649490qgg.47.1455126223952;
	Wed, 10 Feb 2016 09:43:43 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a66sm1724349qkb.20.2016.02.10.09.43.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:33 +0000
Message-Id: <281319e79b93709f4a4c09f8c4dce88c3d605326.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
Subject: [PATCH 6/9] strace: build fix for MIPS + musl libc
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:43 -0000

From: Andre McCurdy <armccurdy@gmail.com>

The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
but not by musl. Regardless of the libc, the kernel headers provide
<asm/sgidefs.h> which provides the same definitions, so use that
instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../strace/strace/use-asm-sgidefs.h.patch          | 51 ++++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.11.bb        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch

diff --git a/meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch b/meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch
new file mode 100644
index 0000000..db83d11
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch
@@ -0,0 +1,51 @@
+From 2995245d7e3f46e8b3995002995ebd28beca7d55 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 5 Feb 2016 14:00:00 -0800
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc.
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1524b9b..287e03d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -196,20 +196,20 @@ AC_SUBST(arch_mx32)
+ if test "$arch" = mips; then
+ 	AC_CACHE_CHECK([for _MIPS_SIM], [st_cv__MIPS_SIM],
+ 		       [AC_COMPUTE_INT([st_cv__MIPS_SIM], [_MIPS_SIM],
+-				       [#include <sgidefs.h>],
++				       [#include <asm/sgidefs.h>],
+ 				       [AC_MSG_ERROR([_MIPS_SIM cannot be determined])])])
+ 
+ 	AC_CACHE_CHECK([for MIPS ABI], [st_cv_mips_abi],
+ 		[AC_COMPILE_IFELSE(
+-			[AC_LANG_PROGRAM([[#include <sgidefs.h>]],
++			[AC_LANG_PROGRAM([[#include <asm/sgidefs.h>]],
+ 					 [[int i[_MIPS_SIM == _MIPS_SIM_ABI32 ? 1 : - 1];]])],
+ 			[st_cv_mips_abi=o32],
+ 		[AC_COMPILE_IFELSE(
+-			[AC_LANG_PROGRAM([[#include <sgidefs.h>]],
++			[AC_LANG_PROGRAM([[#include <asm/sgidefs.h>]],
+ 					 [[int i[_MIPS_SIM == _MIPS_SIM_NABI32 ? 1 : - 1];]])],
+ 			[st_cv_mips_abi=n32],
+ 		[AC_COMPILE_IFELSE(
+-			[AC_LANG_PROGRAM([[#include <sgidefs.h>]],
++			[AC_LANG_PROGRAM([[#include <asm/sgidefs.h>]],
+ 					 [[int i[_MIPS_SIM == _MIPS_SIM_ABI64 ? 1 : - 1];]])],
+ 			[st_cv_mips_abi=n64],
+ 			[st_cv_mips_abi=unknown])])])])
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.11.bb
index a72a1f9..95d13e6 100644
--- a/meta/recipes-devtools/strace/strace_4.11.bb
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -8,6 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://disable-git-version-gen.patch \
            file://more-robust-test-for-m32-mx32-compile-support.patch \
            file://update-gawk-paths.patch \
+           file://use-asm-sgidefs.h.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
           "
-- 
2.7.1


