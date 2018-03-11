Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 17B6478989
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:43:22 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id r66so4711913wrb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=H1hYZ+f9bWqN2yxiSUbhXgKM48fI15FL5ieBxRF7sdc=;
	b=bY7RCRvvUDg8NIFuGvazPQKwUdzrxzN2rppRDCiMwOPCX/F9KgPRK5iBhj2Keit5lP
	VLN1fPwtwvxH9UegyxTcpzFmR0+zik480QPJrYRd1/MgZpZcqudDoKABvv+23JzWw+ke
	Y/nHsiUOeGrP6lMB7I2GOy0woN3pSU3ACfzengrjgNBQ20vgrCY4n1gIT5Zn7cbaY2hk
	gMi5+Wk5c2oOWZ6pEKycZGfq0qRYpmTQxU1JgfkJ0K3Yj5bUYkoubGPgS9kihUTUCfd4
	NHcVI48eFh0CxTYQ7OKzuHL4kPR57L8K/lEtvBcL1zdgJdpaO3zV91QVC8T/foMsybXH
	ORdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=H1hYZ+f9bWqN2yxiSUbhXgKM48fI15FL5ieBxRF7sdc=;
	b=Nn9ewEZBAImglFRTjTN3dGavGBWWnBNA/20FGa5PiRYK/vqM+bY+CAmikI9uidDgMt
	atsDbNOMF/UK55HW8EIkoADNXmlOrh70ivrTOj3FNwifW4GqRZiiWKUAAN+O0sWVnvUL
	qmZfDmoVNorRySt/dQEy904fF/do49ZAqnA39UbwWtPGooydiF+9j+b6wTnxwYH3qo8K
	t58x4zfuITQL72582UQVv0/+aSna9RcGJf4jm+Wqbp8lt3r5ufOLgCgI9HW/qQjeWqbg
	mxK5Yzdn4tqEeZBr0fNzm27ZZCQTiuLmrcXKRncIIBmtHwDS1gLXfhmVhbu4eVk7NMdr
	COqg==
X-Gm-Message-State: AElRT7Hp2QolB57nToIbVhW2Q/Xy0Fj9kvmtJMm9un0YuWaHw9pE6RfT
	HiZ53/t+EaPd1UrUKjh7yUxdFg==
X-Google-Smtp-Source: AG47ELuPgtn7f4RJs6jVK76ltdQNZt1Wh+4SHxyg53MYKWttLOw+B4ooX9bSbEUfNaII3APmYeWDXA==
X-Received: by 10.223.191.6 with SMTP id p6mr2413463wrh.247.1520729003301;
	Sat, 10 Mar 2018 16:43:23 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i49sm5004423wra.44.2018.03.10.16.43.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:43:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:43:13 +0000
Message-Id: <e50d2c3c522e046366bdfe898b15a5677fa004e7.1520728804.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728804.git.Martin.Jansa@gmail.com>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
Subject: [rocko][PATCH 4/8] gcc: Fix libssh_nonshared linker specs for ppc/musl
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
X-List-Received-Date: Sun, 11 Mar 2018 00:43:22 -0000

From: Khem Raj <raj.khem@gmail.com>

The change to link libssp_nonshared.a only for musl was to move
spec file changes to config/linux.h under a conditional when
DEFAULT_LIBC == LIBC_MUSL which worked fine for all but ppc
since gcc for ppc provided its own linux.h overrides which are
used. This patch duplicates the change in those headers too

Cherry-picked from oe-core master 9d39168a6acfa1f289a4448271c0bf9caaea10ec

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...shared-to-link-commandline-for-musl-targe.patch | 55 ++++++++++++++++++++--
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 310f7aacba..29b7ce72d2 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc-6.3/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
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
2.15.1


