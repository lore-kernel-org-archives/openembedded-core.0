Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9DA771C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 06:28:04 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id y9so4215709qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 22:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xHbyECsM9mzBBCELV/KJUvR3IwEJbf870tz2GjWf17U=;
	b=Fc0BLseB2iVXWLCKt1wn5uQXwdkIHIhmNv3jkZFE+dKaouVN1m8g0vdZZzo1z6yD8g
	S7cnMSQBbKcsDKorKQQzQP5pVQHC2fEf+ySazQS+UCzOpaV5gWCpu7UciebUhVeOS6Km
	pW6lXpjrAKghB4uYz7HqQin7dHbFXPLpPzt0C3uDbxA81d0hNDpQsuMBNTA1gABhUKCr
	VlRyb1zDQJSULhWWoCzGMJdK4azT7+qCIIcq18IbF0ugkoe0+17LoDmwwK8HNyQTyYix
	aM8J7GYmfkbnW2K0++4iuG+jt2QQng1cQxdcwIXvMViEUApqwrzP8T5AHQNOzdGmkzEx
	3+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=xHbyECsM9mzBBCELV/KJUvR3IwEJbf870tz2GjWf17U=;
	b=C+yONx0FGGrOOqZnT7+m90Thcozh0Oxj2hufw+QcRTpM252qIoWrYMciAd7R6lj8DK
	/vJfdmQ//5oGSwZUVV2w6frFfI0yDANLmBg9LBBy/+0UFcHz5qU+y6/nfDIMEDfNoTIY
	8/3ewKE7/62eVeSm19nvCK4xSe2uwQV8cp94qXpYoMhO2Q9TZSEGwBs2qq6XEEgPVlDP
	7c8vVLSnDfdUlVSl1PPqQ4VMRGC8jozxQMmv9FBVcIpHP/BlYutM59GaaDyWqoOlgq7g
	A2drZbMXCWtxWnKQ+T7+fu2adnlzThTohoAFlZSjWC3bl52NViD3ExdBJLF5P9Az5F9T
	Elzg==
X-Gm-Message-State: AG10YOT66uGsGH7UkMVpt2NMyp14p4Rckl2P1o7WIptvZra+/948+r3mY6rSboU1wfeG4Q==
X-Received: by 10.140.131.17 with SMTP id 17mr8524864qhd.12.1454480885492;
	Tue, 02 Feb 2016 22:28:05 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	t187sm2246973qht.39.2016.02.02.22.28.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 22:28:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 06:27:55 +0000
Message-Id: <df18e21a5a75ac2bbeedda82c730921afc7df990.1454480571.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
References: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454480571.git.raj.khem@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
Subject: [PATCH 2/6] gcc: Fix build on musl with -fstack-protector
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
X-List-Received-Date: Wed, 03 Feb 2016 06:28:05 -0000

When enabling the secutity flags on musl based targets the builds fail
due to libssp(gcc-runtime) build asking to link with libssp and
libssp_nonshared.a when configuring libssp itself. This does not work
with musl since it does provide ssp implementation but not like glibc
where these libraries are separate to libc

Fix the nios2 patch with upstream status while at it and generate the
patch after applying to my tree

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 ++-
 .../gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch    | 11 --------
 .../0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch    | 28 +++++++++++++++++++++
 .../gcc/gcc-5.3/0048-ssp_nonshared.patch           | 29 ++++++++++++++++++++++
 4 files changed, 59 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0048-ssp_nonshared.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 80999c1..e12bfad 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -76,7 +76,8 @@ SRC_URI = "\
            file://0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch \
            file://0045-Support-for-arm-linux-musl.patch \
            file://0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch \
-	   file://0047-Fix-nios2-musl-build.patch \
+           file://0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
+           file://0048-ssp_nonshared.patch \
           "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch b/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
deleted file mode 100644
index 44cea84..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.3/0047-Fix-nios2-musl-build.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -Naru gcc-5.3.0.orig/gcc/config/nios2/linux.h gcc-5.3.0/gcc/config/nios2/linux.h
---- gcc-5.3.0.orig/gcc/config/nios2/linux.h	2015-05-28 16:08:37.000000000 +0200
-+++ gcc-5.3.0/gcc/config/nios2/linux.h	2016-01-04 02:42:46.878844806 +0100
-@@ -30,6 +30,7 @@
- #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
-+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
- 
- #undef LINK_SPEC
- #define LINK_SPEC LINK_SPEC_ENDIAN \
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-5.3/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch
new file mode 100644
index 0000000..a1cfb9c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0047-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -0,0 +1,28 @@
+From f5ca07132b9292d2045ca7204e9cbfde2e59d0bf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2016 10:26:10 -0800
+Subject: [PATCH 47/48] nios2: Define MUSL_DYNAMIC_LINKER
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gcc/config/nios2/linux.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
+index f43f655..5587ab3 100644
+--- a/gcc/config/nios2/linux.h
++++ b/gcc/config/nios2/linux.h
+@@ -30,6 +30,7 @@
+ #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
+ 
+ #undef LINK_SPEC
+ #define LINK_SPEC LINK_SPEC_ENDIAN \
+-- 
+2.7.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0048-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-5.3/0048-ssp_nonshared.patch
new file mode 100644
index 0000000..5ddd40a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0048-ssp_nonshared.patch
@@ -0,0 +1,29 @@
+From 3cb6013cf287ed9b1247ea37541e64b9810a121d Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <nsz@port70.net>
+Date: Sat, 7 Nov 2015 14:58:40 +0000
+Subject: [PATCH 48/48] ssp_nonshared
+
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+ gcc/gcc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 8f53aea..3ddc658 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -732,7 +732,8 @@ proper position among the other output files.  */
+ #ifndef LINK_SSP_SPEC
+ #ifdef TARGET_LIBC_PROVIDES_SSP
+ #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
+-		       "|fstack-protector-strong|fstack-protector-explicit:}"
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
+ #else
+ #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
+ 		       "|fstack-protector-strong|fstack-protector-explicit" \
+-- 
+2.7.0
+
-- 
2.7.0


