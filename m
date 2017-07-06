Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A726774FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:58 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q85so531477pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N7zsB47nghQ4O3jAnqRHL0p/EDTr628nlgcqynXgeyM=;
	b=X7uU3/eklfFRyv1d+CHtCnxgfir5VU9qbYfZSgU89f8CNKRh7znB6MYtXL0V3V6wJt
	AdalsrWCBFY63eathuNqqxphc9TUga3G//eui2hgY94JFvcTQ+HqoTfZEDcHBaeWO+Vf
	J4NwNny5LBQVTwd04d/qe3UXoEkA6HR3ThCOM0hXXOkeimv5h9S9stFjCu+HoKbNTGk/
	vHymr2q+Xcee1cQGLgz44ij6goAXOO1cWWZ45hco1lqhT+Ray1efftYCbfYwzVBHCm9o
	UO7wy+12wP4Bl3UkxvVv2XNykg8I+ymwPrurkpySHX2Gce9HYixAGrtSQB95fOk2ao8y
	ulAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N7zsB47nghQ4O3jAnqRHL0p/EDTr628nlgcqynXgeyM=;
	b=EGhAkHuJrm2PDD4xxctGtKpf/OvSDjcFDFaV25RNebM/IIxrkFRHT8I0WJ4J+GfG5A
	mCo82rM4JaX8cFQ7/A7hxTWXUPTCTBHZfUqrOK3nfqMxSi/X09xkbn8JWiLDbVd7lwtB
	UOBZjRIiRJnl+Ci2gKnPZUotWVowVti6ntA2/jYIqLpu7WkGOlWwQgZiXf55JawTR89D
	Y6/tbJxGxDOIu2Eo3aw6UEIOAJUwinOrx/wJxs+JcS47y5OD/+d91pYerpYQH/6b49Up
	i+QKM/tfABM3znOH4EIpr5c03iXfY7LroNFUZ8fuk0rwEj9znKOf6pXSnaBZxa5z+wL0
	jA0A==
X-Gm-Message-State: AIVw113FnnMmB0phEto5qJq4as9cFjTEnAUXZKSGuvDe3AeRfOoaWI9R
	EQFyedvJDKtJE2qP
X-Received: by 10.99.96.141 with SMTP id u135mr26172581pgb.129.1499351639403; 
	Thu, 06 Jul 2017 07:33:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:17 -0700
Message-Id: <84c79d2fe0d932429a6055b73a6f0bb84ed0f4a0.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 16/22] gcc: Fix libssh_nonshared linker specs for ppc/musl
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:58 -0000

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


