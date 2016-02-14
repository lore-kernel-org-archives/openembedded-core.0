Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 67EC47002B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:52:59 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id b67so98780433qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 12:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ilpcgIY8438hm/NET5eHAtXNciM4X+iKisswj8SHcyQ=;
	b=qGURJ9B4egubnzLvhSwdM5M6I4/TA2JkmSpmk2O+X1yc2bbZjDsOQpXGTrK6ZC6dmo
	93+iZp9CZblOZQODwP2u4AUSAGsWG1NGrj+HlMc6GtqXNmbUim6PPcBGA7k4W2UdmPsa
	t8krnraS4c8CYJdV+qkpnCJ9ZribS+NbhAEIyiD23ksZcKOSHsxh+5kbGs4hUk/uGUhW
	K7L7OR/Np7iZWr8h71agLh6NelajBiPTy3pI41+xZix1gS+74zdJjzRORcLojhO1ZtbP
	Tsw2U9asB/cSYz/g0/IpQZjflpi8iOfsPTJcsFCmwlS2o9EXPuapBfYaF27Bm6U0hCbT
	mS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ilpcgIY8438hm/NET5eHAtXNciM4X+iKisswj8SHcyQ=;
	b=k2LNyVcQF9l4fpB56kugiY1zGpkLhyjdV6c/atlmOwkVrcsV3jE2f6hfbeRIE21t5x
	DEdGEcBG9UYrOaLzfLSciHdUTsCINojnuv5JwMFbxcpVPaJ78D9GuJc2WwrFF54w8XNL
	bCgcumCiFzwalonIOGcOP2w+yRp6mfF2MdOq5KlUF/6zBihsoTCkDLVJHkRHRSy3wMgg
	d15wSevvP1VkyaaxeRWAPlHLorB2/UZOikVVJdKi69OUjWMYK5wRc3/a39shFcPRANs0
	+PvEKNC93XxexHE09aMaDS5JufK9Y2pPNmkeijS3Iq174rzI89OAYlsc5XO8TojQtVsc
	NzJA==
X-Gm-Message-State: AG10YOR9hPeiG3Pnc80ppZic9Mvs+AftbyAJ8L+9beWgMe0gYiQwmQtvAKGP+tzwCEweGQ==
X-Received: by 10.140.102.232 with SMTP id w95mr11940048qge.21.1455483180722; 
	Sun, 14 Feb 2016 12:53:00 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	q22sm9893272qkl.19.2016.02.14.12.53.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 12:53:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Feb 2016 20:52:50 +0000
Message-Id: <1455483171-66851-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
References: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/5] valgrind: Fix build with musl
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
X-List-Received-Date: Sun, 14 Feb 2016 20:53:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../valgrind/0001-fix-build-for-musl-targets.patch | 69 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |  6 +-
 2 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch b/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
new file mode 100644
index 0000000..dc6feff
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-fix-build-for-musl-targets.patch
@@ -0,0 +1,69 @@
+From 1b1a024efd18d44294e184e792c1e039cab02bfe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 14 Feb 2016 09:14:12 +0000
+Subject: [PATCH] fix build for musl targets
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ configure.ac             | 2 --
+ coregrind/vg_preloaded.c | 2 +-
+ include/pub_tool_redir.h | 7 +++++--
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9366dc7..679f514 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1066,8 +1066,6 @@ case "${GLIBC_VERSION}" in
+ 	;;
+      2.0|2.1|*)
+ 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
+-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
+-	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
+ 	;;
+ esac
+ 
+diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
+index 2ea7a7a..e49c832 100644
+--- a/coregrind/vg_preloaded.c
++++ b/coregrind/vg_preloaded.c
+@@ -56,7 +56,7 @@
+ void VG_NOTIFY_ON_LOAD(freeres)( void );
+ void VG_NOTIFY_ON_LOAD(freeres)( void )
+ {
+-#  if !defined(__UCLIBC__) \
++#  if !defined(__UCLIBC__) && defined(__GLIBC__) \
+       && !defined(VGPV_arm_linux_android) \
+       && !defined(VGPV_x86_linux_android) \
+       && !defined(VGPV_mips32_linux_android) \
+diff --git a/include/pub_tool_redir.h b/include/pub_tool_redir.h
+index bac00d7..fbb2ef2 100644
+--- a/include/pub_tool_redir.h
++++ b/include/pub_tool_redir.h
+@@ -242,8 +242,7 @@
+ /* --- Soname of the standard C library. --- */
+ 
+ #if defined(VGO_linux) || defined(VGO_solaris)
+-#  define  VG_Z_LIBC_SONAME  libcZdsoZa              // libc.so*
+-
++#  define  VG_Z_LIBC_SONAME  libcZdZa                // libc.*
+ #elif defined(VGO_darwin) && (DARWIN_VERS <= DARWIN_10_6)
+ #  define  VG_Z_LIBC_SONAME  libSystemZdZaZddylib    // libSystem.*.dylib
+ 
+@@ -274,7 +273,11 @@
+ /* --- Soname of the pthreads library. --- */
+ 
+ #if defined(VGO_linux)
++# if defined(__GLIBC__) || defined(__UCLIBC__)
+ #  define  VG_Z_LIBPTHREAD_SONAME  libpthreadZdsoZd0     // libpthread.so.0
++# else
++#  define  VG_Z_LIBPTHREAD_SONAME  libcZdZa              // libc.*
++#endif
+ #elif defined(VGO_darwin)
+ #  define  VG_Z_LIBPTHREAD_SONAME  libSystemZdZaZddylib  // libSystem.*.dylib
+ #elif defined(VGO_solaris)
+-- 
+2.7.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 7ef1e48..7e23240 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -23,8 +23,10 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
-           "
-
+"
+SRC_URI_append_libc-musl = "\
+           file://0001-fix-build-for-musl-targets.patch \
+"
 SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
 SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
 
-- 
2.7.1


