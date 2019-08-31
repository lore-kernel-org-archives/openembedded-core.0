Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id B52D87DDAA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 05:23:26 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id o3so4243432plb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 22:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Oih8fyY0tJfCNxXY88xRO9dFNcGaPxPMjyUw/HSrCyw=;
	b=kgCOqAmn1XnVI0PS9GaQWKlmCVqY3jv/ZIQ1ktEpNsqzxBvANPyBqkXPZz/M1YgOCA
	UQ4GB3akofxbMD/qAkIryttLEQqOIN469Svwb9DTTU1SS2OQ8nZCjVtehhMxbIfgtj6Z
	uBjgKnlOQI1sWBFVOZlIFdrh9m7+AiH0FIZV2pRVICzrrUF7eFZjpaBZl4mJqAbOa45y
	r5FJGYe7VZmsxRghtWcvJiPVUEPQJxKThU5HlkYbYNTQ9OM7/uu28YQUGwT0xy0iG0Yz
	ROyT7iUF32GkcNNfVMUssOLAMXFW59SbkKJ7ec+jFrQEJQjKhaxK78f1hCBpzRQ88hrM
	Eghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Oih8fyY0tJfCNxXY88xRO9dFNcGaPxPMjyUw/HSrCyw=;
	b=TLUEk28mJFYjkkT713WKfvnPtWv66+m5ijzj8N3q+2xvvxxmnNf4Cl3eNwPc47xSgk
	SZONefLzD7Spf6o3xz+P5WCy98Awadhtuu05uz82cz/6qecZTqd2OBQreh2lnyI2WMju
	9NYTX+1M0EFfUX8TjJ7oiX9gPRELBU13bjLgDvDaQJ+6OU+7kLliyhNuRPVLz2JKS/Dk
	BpYWAKc2mIYs0AoIP5KMhNxHnqmQZ+GozrF4ljm9ugkQm0IWTOfx/54pUdMxnCDkFSVY
	sf7l2otcuxusL/LgfQzkZDTTtnzRMEOehFwBzhZnqZlGX+VYHtwMIANW5BKQ+5g2SIAb
	KlwA==
X-Gm-Message-State: APjAAAX01zE242evc9dS8hiU5Pq7Zutm71vJpsty8UoSlspMg94FSebX
	k07wkgNMixMCpWux3dFH16PX5aaTbZ0=
X-Google-Smtp-Source: APXvYqww625cesEIOtGo4ASwwd4Y0gYXB7xHijVtZdeFZEZ01tF6tg3ZZiCgyMMfwSdWQg2+exlVPw==
X-Received: by 2002:a17:902:ab86:: with SMTP id f6mr522049plr.15.1567229007411;
	Fri, 30 Aug 2019 22:23:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	131sm6493221pge.37.2019.08.30.22.23.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 22:23:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 22:23:13 -0700
Message-Id: <20190831052314.19974-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190831052314.19974-1-raj.khem@gmail.com>
References: <20190831052314.19974-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] gcc: Move STANDARD_STARTFILE_PREFIX_1 and STANDARD_STARTFILE_PREFIX_2 back to gcc.c
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
X-List-Received-Date: Sat, 31 Aug 2019 05:23:26 -0000
Content-Transfer-Encoding: 8bit

when compiling for ppc64, build emits additional
STANDARD_STARTFILE_PREFIX_1 and STANDARD_STARTFILE_PREFIX_2 into
gcc/defaults.h which is not conditional because it really want to
override others with this new value, but it ends up with two definitions
since it gets emitted _after_ the definition this patch moves to
default.h and ends up in duplicate defines.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-target-gcc-headers-can-be-included.patch | 47 +------------------
 1 file changed, 2 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch
index af0ea5c60a..53f9e99d07 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -22,8 +22,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/gcc.c        | 7 -------
  4 files changed, 15 insertions(+), 7 deletions(-)
 
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 0064a282488..98d1488171f 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -618,6 +618,7 @@ libexecdir = @libexecdir@
@@ -34,7 +32,7 @@ index 0064a282488..98d1488171f 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -2866,6 +2867,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -2866,6 +2867,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localed
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
@@ -42,11 +40,9 @@ index 0064a282488..98d1488171f 100644
    -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
    -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
    -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
-diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index c4796385643..980e2bd47a7 100644
 --- a/gcc/cppdefault.c
 +++ b/gcc/cppdefault.c
-@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[]
+@@ -59,6 +59,10 @@ const struct default_include cpp_include
      /* This is the dir for gcc's private headers.  */
      { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
  #endif
@@ -57,42 +53,3 @@ index c4796385643..980e2bd47a7 100644
  #ifdef LOCAL_INCLUDE_DIR
      /* /usr/local/include comes before the fixincluded header files.  */
      { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
-diff --git a/gcc/defaults.h b/gcc/defaults.h
-index b7534256119..41ca579b267 100644
---- a/gcc/defaults.h
-+++ b/gcc/defaults.h
-@@ -1459,4 +1459,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- #define DWARF_GNAT_ENCODINGS_DEFAULT DWARF_GNAT_ENCODINGS_GDB
- #endif
- 
-+/* Default prefixes to attach to command names.  */
-+
-+#ifndef STANDARD_STARTFILE_PREFIX_1
-+#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
-+#endif
-+#ifndef STANDARD_STARTFILE_PREFIX_2
-+#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
-+#endif
-+
- #endif  /* ! GCC_DEFAULTS_H */
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 4e7c45b268c..1a3704b2763 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1470,13 +1470,6 @@ static const char *gcc_libexec_prefix;
- 
- /* Default prefixes to attach to command names.  */
- 
--#ifndef STANDARD_STARTFILE_PREFIX_1
--#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
--#endif
--#ifndef STANDARD_STARTFILE_PREFIX_2
--#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
--#endif
--
- #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cross compiler.  */
- #undef MD_EXEC_PREFIX
- #undef MD_STARTFILE_PREFIX
--- 
-2.22.1
-
-- 
2.23.0


