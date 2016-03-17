Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id AF0AA71957
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 05:18:37 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id u110so63171669qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 22:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=S9mRWVC+O35o4vpYG+ETGuxj72zFMW7TxoxWDTXrKHg=;
	b=h6H6hKrZeLNpqISFLZ7FxiKQ2hTKv7tfbp+pLF7OHgoKfnCvcp30EonSSiLDc0URWZ
	b83aJ+vtxLpkfidRO8Ti6kTTdjxIDYxffhPPznbwDFJa+sB9a/asjdTMWvg1/IYn3TzS
	SBsvtWFQiimD4Ivh0vXKub+L5JNjuM1eQo3uoJ73EnqlHih2X8oQ213UvrESC3Z3Bz4N
	cVcZy6SvRhw9ACr1tec0551A0A02YHGq2nBaEbKQ4EAzH9kkw6nqqwgp/fzrRqe5zfSP
	Uxw/boVSrkjW1ylCNpaSfz7Z8paJS8t/3eMVqrHy8eHSEXSKSEtcXm2fOpBhrl2YTY7U
	xZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=S9mRWVC+O35o4vpYG+ETGuxj72zFMW7TxoxWDTXrKHg=;
	b=Y7fsd4C//xg+t3W2krpZTrFYl1PtfhpQ9M/u+aWkq1kbsPgBOOIKhtQuPvCIXY8HQ4
	yl3ZVdyPLC5D5yI0aCoYY1JazWolJt//fLulNFAiYYVzhnxKuT0AY+sMcv4tQ1GwBGRv
	NxkOcUD7Kps8MG2JTU4mlJE7kpB2KXl3PCnyqAfyFw61hoCpgeWeaL7V0QokkUdXAA8i
	Cg850i2OJ6df9lQ8aKAYgftNeliokJPvlGAuqu1xlgWeMSf5Qh9WORiYjO7vIxyaL2ZG
	ocahR5t+p+Mc9AnI4VY3o6xApv5LE0pbsRvB9jXDNcDO7AxJGXjfi2iS9sTbFqywKHdA
	6LWg==
X-Gm-Message-State: AD7BkJJLrjM4ifbPgpJAnsI/wBbdT91bogmmj9sCa92vLYm3Efn/Q9J/IovYSMqa4IvDcQ==
X-Received: by 10.140.129.79 with SMTP id 76mr12212389qhb.28.1458191918130;
	Wed, 16 Mar 2016 22:18:38 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	i46sm2216771qgd.19.2016.03.16.22.18.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Mar 2016 22:18:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 05:18:21 +0000
Message-Id: <211ddae1f500686c06caae8c6df2589a95ac8259.1458191793.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] python-numpy: Fix build on musl
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
X-List-Received-Date: Thu, 17 Mar 2016 05:18:38 -0000

Match API version in cached _numpyconfig.h to the
one mandated by numpy version in use.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python-numpy/aarch64/_numpyconfig.h     |  3 +-
 .../python/python-numpy/add-glibc-check.patch      | 36 ++++++++++++++++++++++
 .../python/python-numpy/mips/_numpyconfig.h        |  3 +-
 .../python/python-numpy/mips64/_numpyconfig.h      |  3 +-
 .../python/python-numpy/mips64n32/_numpyconfig.h   |  3 +-
 .../python/python-numpy/powerpc/_numpyconfig.h     |  3 +-
 .../python/python-numpy/powerpc64/_numpyconfig.h   |  3 +-
 .../python/python-numpy/x86-64/_numpyconfig.h      |  3 +-
 .../recipes-devtools/python/python-numpy_1.10.4.bb |  1 +
 9 files changed, 51 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-numpy/add-glibc-check.patch

diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
index be57ac2..191e5a1 100644
--- a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
@@ -20,10 +20,11 @@
 #define NPY_HAVE_COMPLEX_DOUBLE 1
 #define NPY_HAVE_COMPLEX_FLOAT 1
 #define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
 #define NPY_USE_C99_FORMATS 1
 #define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
 #define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
+#define NPY_API_VERSION 0x0000000A
 
 #ifndef __STDC_FORMAT_MACROS
 #define __STDC_FORMAT_MACROS 1
diff --git a/meta/recipes-devtools/python/python-numpy/add-glibc-check.patch b/meta/recipes-devtools/python/python-numpy/add-glibc-check.patch
new file mode 100644
index 0000000..29768f3
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/add-glibc-check.patch
@@ -0,0 +1,36 @@
+Dont punish musl for glibc's trignometeric functions problems
+additionally ensure that glibc specific macros are not used
+unconditionally
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: numpy-1.10.4/numpy/core/src/private/npy_config.h
+===================================================================
+--- numpy-1.10.4.orig/numpy/core/src/private/npy_config.h
++++ numpy-1.10.4/numpy/core/src/private/npy_config.h
+@@ -75,10 +75,12 @@
+ 
+ #if defined(HAVE_FEATURES_H)
+ #include <features.h>
++#ifdef __GLIBC__
+ #define TRIG_OK __GLIBC_PREREQ(2, 16)
+ #else
+ #define TRIG_OK 0
+ #endif
++#endif
+ 
+ #if !TRIG_OK
+ #undef HAVE_CASIN
+Index: numpy-1.10.4/numpy/core/src/npymath/ieee754.c.src
+===================================================================
+--- numpy-1.10.4.orig/numpy/core/src/npymath/ieee754.c.src
++++ numpy-1.10.4/numpy/core/src/npymath/ieee754.c.src
+@@ -612,7 +612,7 @@ void npy_set_floatstatus_invalid(void)
+ }
+ 
+ 
+-#elif defined(__GLIBC__) || defined(__APPLE__) || \
++#elif defined(__linux__) || defined(__APPLE__) || \
+       defined(__CYGWIN__) || defined(__MINGW32__) || \
+       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
+ #  include <fenv.h>
diff --git a/meta/recipes-devtools/python/python-numpy/mips/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/mips/_numpyconfig.h
index c0c4285..05d2b8b 100644
--- a/meta/recipes-devtools/python/python-numpy/mips/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/mips/_numpyconfig.h
@@ -8,6 +8,7 @@
 #define NPY_SIZEOF_COMPLEX_DOUBLE 16
 #define NPY_SIZEOF_LONGDOUBLE 8
 #define NPY_SIZEOF_COMPLEX_LONGDOUBLE 16
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
 #define NPY_SIZEOF_PY_INTPTR_T 4
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
@@ -23,7 +24,7 @@
 #define NPY_USE_C99_FORMATS 1
 #define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
 #define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
+#define NPY_API_VERSION 0x0000000A
 
 #ifndef __STDC_FORMAT_MACROS
 #define __STDC_FORMAT_MACROS 1
diff --git a/meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h
index be57ac2..8e2b5d0 100644
--- a/meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/mips64/_numpyconfig.h
@@ -8,6 +8,7 @@
 #define NPY_SIZEOF_COMPLEX_DOUBLE 16
 #define NPY_SIZEOF_LONGDOUBLE 16
 #define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
 #define NPY_SIZEOF_PY_INTPTR_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
@@ -23,7 +24,7 @@
 #define NPY_USE_C99_FORMATS 1
 #define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
 #define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
+#define NPY_API_VERSION 0x0000000A
 
 #ifndef __STDC_FORMAT_MACROS
 #define __STDC_FORMAT_MACROS 1
diff --git a/meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h
index be57ac2..8e2b5d0 100644
--- a/meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h
@@ -8,6 +8,7 @@
 #define NPY_SIZEOF_COMPLEX_DOUBLE 16
 #define NPY_SIZEOF_LONGDOUBLE 16
 #define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
 #define NPY_SIZEOF_PY_INTPTR_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
@@ -23,7 +24,7 @@
 #define NPY_USE_C99_FORMATS 1
 #define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
 #define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
+#define NPY_API_VERSION 0x0000000A
 
 #ifndef __STDC_FORMAT_MACROS
 #define __STDC_FORMAT_MACROS 1
diff --git a/meta/recipes-devtools/python/python-numpy/powerpc/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/powerpc/_numpyconfig.h
index 73cbfb1..0f45d5b 100644
--- a/meta/recipes-devtools/python/python-numpy/powerpc/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/powerpc/_numpyconfig.h
@@ -8,6 +8,7 @@
 #define NPY_SIZEOF_COMPLEX_DOUBLE 16
 #define NPY_SIZEOF_LONGDOUBLE 16
 #define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
 #define NPY_SIZEOF_PY_INTPTR_T 4
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
@@ -23,7 +24,7 @@
 #define NPY_USE_C99_FORMATS 1
 #define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
 #define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
+#define NPY_API_VERSION 0x0000000A
 
 #ifndef __STDC_FORMAT_MACROS
 #define __STDC_FORMAT_MACROS 1
diff --git a/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
index be57ac2..8e2b5d0 100644
--- a/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/powerpc64/_numpyconfig.h
@@ -8,6 +8,7 @@
 #define NPY_SIZEOF_COMPLEX_DOUBLE 16
 #define NPY_SIZEOF_LONGDOUBLE 16
 #define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
 #define NPY_SIZEOF_PY_INTPTR_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
@@ -23,7 +24,7 @@
 #define NPY_USE_C99_FORMATS 1
 #define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
 #define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
+#define NPY_API_VERSION 0x0000000A
 
 #ifndef __STDC_FORMAT_MACROS
 #define __STDC_FORMAT_MACROS 1
diff --git a/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
index be57ac2..8e2b5d0 100644
--- a/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
+++ b/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
@@ -8,6 +8,7 @@
 #define NPY_SIZEOF_COMPLEX_DOUBLE 16
 #define NPY_SIZEOF_LONGDOUBLE 16
 #define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
 #define NPY_SIZEOF_PY_INTPTR_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8
 #define NPY_SIZEOF_LONGLONG 8
@@ -23,7 +24,7 @@
 #define NPY_USE_C99_FORMATS 1
 #define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
 #define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x00000007
+#define NPY_API_VERSION 0x0000000A
 
 #ifndef __STDC_FORMAT_MACROS
 #define __STDC_FORMAT_MACROS 1
diff --git a/meta/recipes-devtools/python/python-numpy_1.10.4.bb b/meta/recipes-devtools/python/python-numpy_1.10.4.bb
index fa651cb..8a562dc 100644
--- a/meta/recipes-devtools/python/python-numpy_1.10.4.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.10.4.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9f4e88b5748e8313caaf33d081ce65a3"
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://remove-build-path-in-comments.patch \
+           file://add-glibc-check.patch \
            ${CONFIGFILESURI} "
 
 CONFIGFILESURI ?= ""
-- 
1.9.1


