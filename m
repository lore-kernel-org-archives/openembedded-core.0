Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC6E77FA6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:34:46 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u36so7280190pgn.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N7zsB47nghQ4O3jAnqRHL0p/EDTr628nlgcqynXgeyM=;
	b=lnmqlqUYRKhVVJGU+DCuz524H/R5SQth3Rd1NhEixQDfpVIp67o//O9L41gqXo5P68
	/mnKzDGil6vRHj+pX56pjGOr/VKmySVQQSXELo+dfqPM+SiL9CIDU4MZKApnMiAWOtO4
	rJH257MzQmPaiGhbF5CCezv/BK/Z6GUKK8QMjLCDO+1TK4nYOWbgDpw+W9agWuxsYOGS
	pabdBCnPn5lKaVHn3fSorCk1eKgF9qFEqq71MDWUXQlVm6uWC7zb1MAHPsxJfiIZRFcU
	bUvaH5tvV9cs195Q3bavWU8082mf4qeoCzMM3qZtxaYNy8XRrCNwntVkqoiGWq6nXu2f
	UEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N7zsB47nghQ4O3jAnqRHL0p/EDTr628nlgcqynXgeyM=;
	b=SfaD9mE5fPIWLM7PdCObtotGqPEWXQvbVQmlRsgtllYV/lrOb8h4JhvcpKGGC+T66s
	32YH1/oWzDOhW5NYk33OK8dxN9GagOPN22MjerdXz7BGBoBo1yTC6u0anl5iE9bfEefC
	AajmXROxpYyFne5qfF0NZ/mjE4GGO57lg2RxjxKJgV1HIJxm/EN8q6zD15A0VpxPtn/m
	/5Av3z8azGXqbaSGz8XcPBKjWpIKCKRfyznaNavcNc40R6M/RsqOa9yUnOBWSNmuvTRz
	sMHfG2IGPHrenBJqJrzQqMkgakts3ZPr63kGcoN/pcYSx0DK68hN9Xrnyu7vc7ZRvHXW
	/D+g==
X-Gm-Message-State: AIVw113a1XNA9hjpWO0l2nk//cgEl6GYWS/R2dH1jJ0GQf+5xzICKEb8
	BKufIm0KkscUHuje
X-Received: by 10.101.90.69 with SMTP id z5mr67413pgs.277.1499520887478;
	Sat, 08 Jul 2017 06:34:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	i27sm15575561pfi.82.2017.07.08.06.34.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:34:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:34:26 -0700
Message-Id: <9022f8b6aebf235ad76235d25d9a87e26820ef2f.1499520469.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499520469.git.raj.khem@gmail.com>
References: <cover.1499520469.git.raj.khem@gmail.com>
Subject: [PATCH 07/10] gcc: Fix libssh_nonshared linker specs for ppc/musl
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
X-List-Received-Date: Sat, 08 Jul 2017 13:34:46 -0000

The change to link libssp_nonshared.a only for musl was to move
spec file changes to config/linux.h under a conditional when
DEFAULT_LIBC == LIBC_MUSL which worked fine for all but ppc
since gcc for ppc provided its own linux.h overrides which are
used. This patch duplicates the change in those headers too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...shared-to-link-commandline-for-musl-targe.patch | 55 ++++++++++++++++++++--
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 310f7aacba..29b7ce72d2 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0040-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 75a42d6d0f1f9784327f74882195a5c24843d5a8 Mon Sep 17 00:00:00 2001
+From 210f6b3b82084cc756e02b8bc12f909a43b14ee8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH 40/49] Add ssp_nonshared to link commandline for musl targets
@@ -17,18 +17,21 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/config/linux.h | 6 ++++++
- 1 file changed, 6 insertions(+)
+ gcc/config/linux.h          |  7 +++++++
+ gcc/config/rs6000/linux.h   | 10 ++++++++++
+ gcc/config/rs6000/linux64.h | 10 ++++++++++
+ 3 files changed, 27 insertions(+)
 
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 2e683d0c430..5ff0a2cb2ff 100644
+index 2e683d0c430..1b4df798671 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -182,6 +182,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
      { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
    }
 +#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
 +#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
 +		       "|fstack-protector-strong|fstack-protector-explicit" \
 +		       ":-lssp_nonshared}"
@@ -37,6 +40,48 @@ index 2e683d0c430..5ff0a2cb2ff 100644
  #endif
  
  #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
+diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
+index 684afd6c190..22cfa391b89 100644
+--- a/gcc/config/rs6000/linux.h
++++ b/gcc/config/rs6000/linux.h
+@@ -91,6 +91,16 @@
+ 					 " -m elf32ppclinux")
+ #endif
+ 
++/* link libssp_nonshared.a with musl */
++#if DEFAULT_LIBC == LIBC_MUSL
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++#endif
++
+ #undef LINK_OS_LINUX_SPEC
+ #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
+   %{rdynamic:-export-dynamic} \
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 3b00ec0fcf0..8371f8d7b6b 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -465,6 +465,16 @@ extern int dot_symbols;
+ 					   " -m elf64ppc")
+ #endif
+ 
++/* link libssp_nonshared.a with musl */
++#if DEFAULT_LIBC == LIBC_MUSL
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++#endif
++
+ #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!static: \
+   %{rdynamic:-export-dynamic} \
+   -dynamic-linker " GNU_USER_DYNAMIC_LINKER32 "}} \
 -- 
 2.13.2
 
-- 
2.13.2


