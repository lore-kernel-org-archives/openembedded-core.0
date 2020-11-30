Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.53736.1606698750617407323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: aPCVkdWLpUHUUjonLBnRrmeEVTGd2te1YSZt5/4lYWIhQEYKxzUttsP9bPS1YNU2tvuny0E8Kc
 1+9fT8FzxAWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004422"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004422"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:13 -0800
IronPort-SDR: bDVVsfwl3DX8PJ04c/dZRzmK3CmBPlGXP0hvn+uLSXI+m6ZeG41eyfIaKGKj0PhvBSovys9cve
 H/JPko+7wNdg==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302704"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:12 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/21] valgrind: helgrind: Intercept libc functions
Date: Mon, 30 Nov 2020 09:11:30 +0800
Message-Id: <4c33ce1b1eca9aff0009bf71ce50f6398f7cd281.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

PTH_FUNC definition needs to be modified in order to
intercept posix thread functions in both libc and libpthread.
In order to handle this in helgrind, weak alias the pthread functions in glibc.
Include a special case for musl.

See https://bugs.kde.org/show_bug.cgi?id=428909 for additional
discussion.

Upstream-Status: Submitted

Signed-off-by: Paul Floyd <paulf@free.fr>
Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5da46a552d54de34a5243e1d90dcc6f52b7af746)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...01-helgrind-Intercept-libc-functions.patch | 54 +++++++++++++++++++
 .../valgrind/valgrind_3.16.1.bb               |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch b/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
new file mode 100644
index 0000000000..f66df3d2d2
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
@@ -0,0 +1,54 @@
+From cdec010444df5a4328e90d07a2024fdeefcc74b5 Mon Sep 17 00:00:00 2001
+From: Paul Floyd <paulf@free.fr>
+Date: Wed, 18 Nov 2020 12:49:20 -0400
+Subject: [PATCH] helgrind: Intercept libc functions
+
+PTH_FUNC definition needs to be modified in order to
+intercept posix thread functions in both libc and
+libpthread. In order to handle this in helgrind, weak alias
+the pthread functions in glibc.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Paul Floyd <paulf@free.fr>
+Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
+---
+ helgrind/hg_intercepts.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/helgrind/hg_intercepts.c b/helgrind/hg_intercepts.c
+index a10c3a4a3..316140ca6 100644
+--- a/helgrind/hg_intercepts.c
++++ b/helgrind/hg_intercepts.c
+@@ -77,6 +77,11 @@
+ /*---                                                          ---*/
+ /*----------------------------------------------------------------*/
+ 
++#define hg_expand(tok) #tok
++#define hg_str(tok) hg_expand(tok)
++# define hg_weak_alias(name, aliasname) \
++  extern __typeof (name) aliasname __attribute__ ((weak, alias(hg_str(name))))
++
+ #if defined(VGO_solaris)
+ /* On Solaris, libpthread is just a filter library on top of libc.
+  * Threading and synchronization functions in runtime linker are not
+@@ -91,9 +96,16 @@
+ #define CREQ_PTHREAD_T Word
+ #define SEM_ERROR ret
+ #else
++#ifdef MUSL_LIBC
++#define PTH_FUNC(ret_ty, f, args...) \
++   ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args); \
++   ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args)
++#else
+ #define PTH_FUNC(ret_ty, f, args...) \
+    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args); \
++   hg_weak_alias(I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f), I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBC_SONAME,f)); \
+    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args)
++#endif
+ #define CREQ_PTHREAD_T pthread_t
+ #define SEM_ERROR errno
+ #endif /* VGO_solaris */
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index bcba55f327..5db181ac14 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-drd-Port-to-Fedora-33.patch \
            file://0001-drd-musl-fix.patch \
+           file://0001-helgrind-Intercept-libc-functions.patch \
            "
 SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
 SRC_URI[sha256sum] = "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
-- 
2.28.0

