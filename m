Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB446FF93
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 04:00:24 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id i4so56936690qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2016 21:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OoxmkNB7ScIcWtMHIKzVlPN6ujo36T+qXivQtOctyks=;
	b=nCA8jyx0tDZcQ9LUlUn6/K72lgbbe0kuki6yDEQ8Kh5LIdGkF6PbFypIHtFg2QzoTU
	PnqgcCfiHZgQr8jwLVyFM90RMGSzOOvf00jg0hK9hRBzMSQn7rimPMgSDnFB07oRl+1N
	F7vo2J94cka6fm3lZ8bUc+oXXe2I9uX59LoRQQEezq1WQaLJKrUTz7du5M52j7/yicmN
	ekIyT39sjgA9vHtYhp6I+nGV+5mxyO04AFKV0LS9JQGGeS7pIUadTCPCREWPFA2QR7S+
	RUzUkHTKJjh+BlNOhybJwAd9vLAc0oEtJhXjGw650PL/AfvkZZStIXMc2swwE0iDv7fS
	ulbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OoxmkNB7ScIcWtMHIKzVlPN6ujo36T+qXivQtOctyks=;
	b=cPe18kBddlzxkmW0/7e1ar3coUo0eJkNQ5lLF/2MidnoBFAjxiUft+MwfaDWeS/w4f
	z8Iw5/x6Ajm0xfDGP1u1fSi8dKAsa/A6CcOYuOTMVNyTYCvwlPS34+QLTlNNXM0+9ibq
	xieMYh7cH5f5JjnjM4DrVnVnU+POr99C6Ipd8KLsKueIA9ACWHH9l6YuaXGBCdJBEnh/
	qpMzESdy0monba4cc7cVyxX/a9qdToBsipIczzJ/UqlFL7GceuFIwQyp8FBhauECQRTt
	8dpGOfBM1f4Mdivq/M0vY3jPn3y7toBs2rBOTxly0hYLUXYvp7Y4PMQsHYMqAfelrvbV
	CZQw==
X-Gm-Message-State: AD7BkJIKTDnsN02ekU7s1gjbXOeejE71YN5j3hBX16+gawLBwUxlMLKaF2H4+kJ0cw4ezA==
X-Received: by 10.55.79.5 with SMTP id d5mr32483911qkb.30.1459137625429;
	Sun, 27 Mar 2016 21:00:25 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	i46sm11057224qgd.19.2016.03.27.21.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Mar 2016 21:00:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 04:00:16 +0000
Message-Id: <3c4e5bf5fb419c372a3926f504fd8e4abed3cbbe.1459137452.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1459137452.git.raj.khem@gmail.com>
References: <cover.1459137452.git.raj.khem@gmail.com>
In-Reply-To: <cover.1459137452.git.raj.khem@gmail.com>
References: <cover.1459137452.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] gcc: Backport fixes for musl ssp configuration
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
X-List-Received-Date: Mon, 28 Mar 2016 04:00:25 -0000

We were trying to inject cached configure variables via
EXTRA_OECONF, but that was not working due to the fact
that gcc configure is called recursively via makefiles
and hence these were getting lost.

These backports from master fixes the problem by
defining the options in configure itself

dl_iterate_phdr is provided by musl as well, so lets
not depend on glibc defines like inhibit_libc alone

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  3 +-
 ...-provide-ssp-and-gcc_cv_target_dl_iterate.patch | 85 ++++++++++++++++++++++
 .../gcc/gcc-5.3/0057-unwind-fix-for-musl.patch     | 42 +++++++++++
 3 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0057-unwind-fix-for-musl.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index aa011fd..4adafd5 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -85,6 +85,8 @@ SRC_URI = "\
            file://0053-expr.c-PR-target-65358-Avoid-clobbering-partial-argu.patch \
            file://0054-support-ffile-prefix-map.patch \
            file://0055-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
+           file://0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch \
+           file://0057-unwind-fix-for-musl.patch \
 "
 
 BACKPORTS = ""
@@ -132,7 +134,6 @@ EXTRA_OECONF_INITIAL = "\
 "
 
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
-EXTRA_OECONF_append_libc-musl = " gcc_cv_libc_provides_ssp=yes gcc_cv_target_dl_iterate_phdr=yes "
 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch b/meta/recipes-devtools/gcc/gcc-5.3/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch
new file mode 100644
index 0000000..9791342
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch
@@ -0,0 +1,85 @@
+From 5c7bd853c8703f65904083778712ef625c3f3814 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 Mar 2016 20:31:50 -0700
+Subject: [PATCH 56/57] Enable libc provide ssp and
+ gcc_cv_target_dl_iterate_phdr for musl
+
+        * configure.ac (gcc_cv_libc_provides_ssp): Add *-*-musl*.
+        (gcc_cv_target_dl_iterate_phdr): Add *-linux-musl*.
+        * configure: Regenerate.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Backport
+
+ gcc/configure    | 7 +++++++
+ gcc/configure.ac | 7 +++++++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/gcc/configure b/gcc/configure
+index fcb05e7..81a449c 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -27814,6 +27814,9 @@ if test "${gcc_cv_libc_provides_ssp+set}" = set; then :
+ else
+   gcc_cv_libc_provides_ssp=no
+     case "$target" in
++       *-*-musl*)
++        # All versions of musl provide stack protector
++        gcc_cv_libc_provides_ssp=yes;;
+        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
+       # glibc 2.4 and later provides __stack_chk_fail and
+       # either __stack_chk_guard, or TLS access to stack guard canary.
+@@ -27846,6 +27849,7 @@ fi
+ 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
+ 	 # simply assert that glibc does provide this, which is true for all
+ 	 # realistically usable GNU/Hurd configurations.
++	 # All supported versions of musl provide it as well
+ 	 gcc_cv_libc_provides_ssp=yes;;
+        *-*-darwin* | *-*-freebsd*)
+ 	 ac_fn_c_check_func "$LINENO" "__stack_chk_fail" "ac_cv_func___stack_chk_fail"
+@@ -27942,6 +27946,9 @@ case "$target" in
+       gcc_cv_target_dl_iterate_phdr=no
+     fi
+     ;;
++  *-linux-musl*)
++    gcc_cv_target_dl_iterate_phdr=yes
++    ;;
+ esac
+ 
+ if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 923bc9a..b08e3dc 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -5291,6 +5291,9 @@ AC_CACHE_CHECK(__stack_chk_fail in target C library,
+       gcc_cv_libc_provides_ssp,
+       [gcc_cv_libc_provides_ssp=no
+     case "$target" in
++       *-*-musl*)
++        # All versions of musl provide stack protector
++        gcc_cv_libc_provides_ssp=yes;;
+        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
+       # glibc 2.4 and later provides __stack_chk_fail and
+       # either __stack_chk_guard, or TLS access to stack guard canary.
+@@ -5317,6 +5320,7 @@ AC_CACHE_CHECK(__stack_chk_fail in target C library,
+ 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
+ 	 # simply assert that glibc does provide this, which is true for all
+ 	 # realistically usable GNU/Hurd configurations.
++	 # All supported versions of musl provide it as well
+ 	 gcc_cv_libc_provides_ssp=yes;;
+        *-*-darwin* | *-*-freebsd*)
+ 	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
+@@ -5390,6 +5394,9 @@ case "$target" in
+       gcc_cv_target_dl_iterate_phdr=no
+     fi
+     ;;
++  *-linux-musl*)
++    gcc_cv_target_dl_iterate_phdr=yes
++    ;;
+ esac
+ GCC_TARGET_TEMPLATE([TARGET_DL_ITERATE_PHDR])
+ if test x$gcc_cv_target_dl_iterate_phdr = xyes; then
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0057-unwind-fix-for-musl.patch b/meta/recipes-devtools/gcc/gcc-5.3/0057-unwind-fix-for-musl.patch
new file mode 100644
index 0000000..c193587
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0057-unwind-fix-for-musl.patch
@@ -0,0 +1,42 @@
+From c5c33bf881a2aea355310dd90873ed39bc272b3c Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 22 Apr 2015 14:20:01 +0000
+Subject: [PATCH 57/57] unwind fix for musl
+
+On behalf of szabolcs.nagy@arm.com
+
+2015-04-22  Gregor Richards  <gregor.richards@uwaterloo.ca>
+	    Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* unwind-dw2-fde-dip.c (USE_PT_GNU_EH_FRAME): Define it on
+	Linux if target provides dl_iterate_phdr.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@222328 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Backport
+
+ libgcc/unwind-dw2-fde-dip.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libgcc/unwind-dw2-fde-dip.c b/libgcc/unwind-dw2-fde-dip.c
+index e1e566b..137dced 100644
+--- a/libgcc/unwind-dw2-fde-dip.c
++++ b/libgcc/unwind-dw2-fde-dip.c
+@@ -59,6 +59,12 @@
+ 
+ #if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
+     && defined(TARGET_DL_ITERATE_PHDR) \
++    && defined(__linux__)
++# define USE_PT_GNU_EH_FRAME
++#endif
++
++#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) \
++    && defined(TARGET_DL_ITERATE_PHDR) \
+     && (defined(__DragonFly__) || defined(__FreeBSD__))
+ # define ElfW __ElfN
+ # define USE_PT_GNU_EH_FRAME
+-- 
+2.7.4
+
-- 
1.8.3.1


