Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id BB34979558
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 10:12:52 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id j25-v6so9081437wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 03:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2h8zhEBctrHd/J7Gxgm/ua6rjfRzcc9stbSSNDxkqTI=;
	b=nxLsLMnZw3w2OXBXRk0MkH5yB+GlLPZTZp3bVay1pkEzv99VKfYPgh8ju1GtmbqFtA
	RizApq2N0uXkRTMqpze8DEqFZ+RNRNi/Yeve1d69rKSKCz8LEzp1sI6a1iA5B3uHR0oI
	4hmF9cRaxsxOoLb64jU74p37HxzLzCmqDLv/aqNZclV74VcFC0Zs+AAAjuTWexP07ue9
	+4wP7/W8/T5O0ie/L8z2q6AFEIZivIGdAN1MQeq2NZtYhH1jNmq5iPnQTAFqKdFS8tsa
	fgvypwuIbtpr085fy5r6ervVXHOXC+Izdb1wfOAsYEt4mpi8eFIQTWNcQMG9azUwdhgL
	9dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2h8zhEBctrHd/J7Gxgm/ua6rjfRzcc9stbSSNDxkqTI=;
	b=oIXN8jaSJqFZD4iHrf1HN4VMTqbcxTVDAKmrCt0G71njEqoEf4JylvuQkx04OnvQEh
	gCa7THVqYGUhNG2LDbvrgjUEf2fyPOgnICFlz6QQuIoV4Hny79IiUzeffd33fshEUNBy
	6X36kLjWrCNqhbHKIDdfNZAf++fzqgnUmzGuonJuyP8Fk33Ls+iTiWoUwpk8OLFfwLW1
	taae/16lZccSjg8z6cpjBV/3pj63KUycbkT/4fyzCkjgMxmEmdJiKnjR8A1DyTgqla8D
	AGNcIm/xc25n030D+CFHVoPGKF/bnSPHqMfYOOgazfHypbXZs9ocqHWcSjNSlW3xf6Gk
	VQFA==
X-Gm-Message-State: APzg51C47bHSAY1O9L+WPJJYfoOO1C8fq98gcqcSPFFcR8+ldMXC+Xtr
	yRlWGgmcOTW74UIdCEYoiQbVaw7i
X-Google-Smtp-Source: ANB0VdYNuwkdrr5ga/JCYiorczoVh4hwcnz2FbS29XKVD1QQZcQ+1c+OzY8yPePG6aAYJWvPwzMEbg==
X-Received: by 2002:a1c:385:: with SMTP id
	127-v6mr18819019wmd.92.1537351972799; 
	Wed, 19 Sep 2018 03:12:52 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w15-v6sm18385283wrs.8.2018.09.19.03.12.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Sep 2018 03:12:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 10:12:51 +0000
Message-Id: <20180919101251.9217-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQdF1WoUTRuNeLuj8Bna8Jj8TmTEg4makNcOeL0i3=NLCg@mail.gmail.com>
References: <CA+chaQdF1WoUTRuNeLuj8Bna8Jj8TmTEg4makNcOeL0i3=NLCg@mail.gmail.com>
Subject: [PATCHv2] glibc: fix build with -O
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
X-List-Received-Date: Wed, 19 Sep 2018 10:12:53 -0000

* tested for qemuarm, qemux86 with -O, -O0, -Os, with gcc
* to build with -O0 I had to remove restriction from systemtap first

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glibc/glibc.inc             | 12 ---
 ...4-prevent-maybe-uninitialized-errors.patch | 95 +++++++++++++++++++
 ...2-soft-fp-ignore-maybe-uninitialized.patch | 72 ++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb         |  2 +
 4 files changed, 169 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 91491a35f0..e673707369 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -6,18 +6,6 @@ STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
 STAGINGCC_class-nativesdk = "gcc-crosssdk-initial-${SDK_SYS}"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
-python () {
-    opt_effective = "-O"
-    for opt in d.getVar('SELECTED_OPTIMIZATION').split():
-        if opt in ("-O0", "-O", "-O1", "-O2", "-O3", "-Os"):
-            opt_effective = opt
-    if opt_effective == "-O0":
-        bb.fatal("%s can't be built with %s, try -O1 instead" % (d.getVar('PN'), opt_effective))
-    if opt_effective in ("-O", "-O1", "-Os"):
-        bb.note("%s doesn't build cleanly with %s, adding -Wno-error to SELECTED_OPTIMIZATION" % (d.getVar('PN'), opt_effective))
-        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
-}
-
 # siteconfig.bbclass runs configure which needs a working compiler
 # For the compiler to work we need a working libc yet libc isn't
 # in the sysroots directory at this point. This means the libc.so
diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
new file mode 100644
index 0000000000..f1c5727b6f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch
@@ -0,0 +1,95 @@
+From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 14 Sep 2018 23:23:03 +0000
+Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized errors
+
+* with -O included in BUILD_OPTIMIZATION when DEBUG_BUILD
+  is used, nativesdk-glibc fails with:
+../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_jnl':
+../sysdeps/ieee754/ldbl-96/e_jnl.c:146:20: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+      b = invsqrtpi * temp / sqrtl (x);
+          ~~~~~~~~~~^~~~~~
+../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_ynl':
+../sysdeps/ieee754/ldbl-96/e_jnl.c:375:16: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+  b = invsqrtpi * temp / sqrtl (x);
+      ~~~~~~~~~~^~~~~~
+
+* work around the issue instead of removing -O like we do with
+  SELECTED_OPTIMIZATION
+
+Upstream-Status: Submitted https://www.sourceware.org/ml/libc-alpha/2018-09/msg00299.html
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ sysdeps/ieee754/dbl-64/e_jn.c    | 2 ++
+ sysdeps/ieee754/ldbl-128/e_jnl.c | 4 ++++
+ sysdeps/ieee754/ldbl-96/e_jnl.c  | 4 ++++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/sysdeps/ieee754/dbl-64/e_jn.c b/sysdeps/ieee754/dbl-64/e_jn.c
+index 9181b22bb8..74a6b5f149 100644
+--- a/sysdeps/ieee754/dbl-64/e_jn.c
++++ b/sysdeps/ieee754/dbl-64/e_jn.c
+@@ -108,6 +108,7 @@ __ieee754_jn (int n, double x)
+ 	      case 1: temp = -c + s; break;
+ 	      case 2: temp = -c - s; break;
+ 	      case 3: temp = c - s; break;
++	      default: temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+ 	      }
+ 	    b = invsqrtpi * temp / sqrt (x);
+ 	  }
+@@ -315,6 +316,7 @@ __ieee754_yn (int n, double x)
+ 	  case 1: temp = -s - c; break;
+ 	  case 2: temp = -s + c; break;
+ 	  case 3: temp = s + c; break;
++	  default: temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+ 	  }
+ 	b = invsqrtpi * temp / sqrt (x);
+       }
+diff --git a/sysdeps/ieee754/ldbl-128/e_jnl.c b/sysdeps/ieee754/ldbl-128/e_jnl.c
+index 7739eec291..b6a1275464 100644
+--- a/sysdeps/ieee754/ldbl-128/e_jnl.c
++++ b/sysdeps/ieee754/ldbl-128/e_jnl.c
+@@ -149,6 +149,8 @@ __ieee754_jnl (int n, _Float128 x)
+ 	      case 3:
+ 		temp = c - s;
+ 		break;
++	      default:
++	        temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+ 	      }
+ 	    b = invsqrtpi * temp / sqrtl (x);
+ 	  }
+@@ -385,6 +387,8 @@ __ieee754_ynl (int n, _Float128 x)
+ 	  case 3:
+ 	    temp = s + c;
+ 	    break;
++	  default:
++	    temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+ 	  }
+ 	b = invsqrtpi * temp / sqrtl (x);
+       }
+diff --git a/sysdeps/ieee754/ldbl-96/e_jnl.c b/sysdeps/ieee754/ldbl-96/e_jnl.c
+index 394921f564..2263b02203 100644
+--- a/sysdeps/ieee754/ldbl-96/e_jnl.c
++++ b/sysdeps/ieee754/ldbl-96/e_jnl.c
+@@ -142,6 +142,8 @@ __ieee754_jnl (int n, long double x)
+ 	      case 3:
+ 		temp = c - s;
+ 		break;
++	      default:
++	        temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+ 	      }
+ 	    b = invsqrtpi * temp / sqrtl (x);
+ 	  }
+@@ -371,6 +373,8 @@ __ieee754_ynl (int n, long double x)
+ 	  case 3:
+ 	    temp = s + c;
+ 	    break;
++	  default:
++	    temp = 0; // just to prevent error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+ 	  }
+ 	b = invsqrtpi * temp / sqrtl (x);
+       }
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch b/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch
new file mode 100644
index 0000000000..4b40fe3f97
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0032-soft-fp-ignore-maybe-uninitialized.patch
@@ -0,0 +1,72 @@
+From 0efa7fd1c800277d5323d05cb245c0536fe9ce22 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 16 Sep 2018 12:39:22 +0000
+Subject: [PATCH] soft-fp: ignore maybe-uninitialized
+
+* with -O it fails with:
+
+In file included from ../soft-fp/soft-fp.h:318,
+                 from ../sysdeps/ieee754/soft-fp/s_fdiv.c:28:
+../sysdeps/ieee754/soft-fp/s_fdiv.c: In function '__fdiv':
+../soft-fp/op-2.h:98:25: error: 'R_f1' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+        X##_f0 = (X##_f1 << (_FP_W_TYPE_SIZE - (N)) | X##_f0 >> (N) \
+                         ^~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f1' was declared here
+   FP_DECL_D (R);
+              ^
+../soft-fp/op-2.h:37:36: note: in definition of macro '_FP_FRAC_DECL_2'
+   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
+                                    ^
+../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
+ # define FP_DECL_D(X)  _FP_DECL (2, X)
+                        ^~~~~~~~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
+   FP_DECL_D (R);
+   ^~~~~~~~~
+../soft-fp/op-2.h:101:17: error: 'R_f0' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+       : (X##_f0 << (_FP_W_TYPE_SIZE - (N))) != 0)); \
+                 ^~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f0' was declared here
+   FP_DECL_D (R);
+              ^
+../soft-fp/op-2.h:37:14: note: in definition of macro '_FP_FRAC_DECL_2'
+   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
+              ^
+../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
+ # define FP_DECL_D(X)  _FP_DECL (2, X)
+                        ^~~~~~~~
+../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
+   FP_DECL_D (R);
+   ^~~~~~~~~
+
+Upstream-Status: Submitted https://www.sourceware.org/ml/libc-alpha/2018-09/msg00300.html
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ soft-fp/op-2.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/soft-fp/op-2.h b/soft-fp/op-2.h
+index 6020d663d4..6672337949 100644
+--- a/soft-fp/op-2.h
++++ b/soft-fp/op-2.h
+@@ -92,6 +92,8 @@
+ 	      X##_f1 = 0;						\
+ 	    }))
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
+ #define _FP_FRAC_SRS_2(X, N, sz)					\
+   (void) (((N) < _FP_W_TYPE_SIZE)					\
+ 	  ? ({								\
+@@ -109,6 +111,7 @@
+ 			    | X##_f0) != 0));				\
+ 	      X##_f1 = 0;						\
+ 	    }))
++#pragma GCC diagnostic pop
+ 
+ #define _FP_FRAC_ADDI_2(X, I)	\
+   __FP_FRAC_ADDI_2 (X##_f1, X##_f0, I)
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 0ebbaf9610..df60ba8445 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -45,6 +45,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
            file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
+           file://0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors.patch \
+           file://0032-soft-fp-ignore-maybe-uninitialized.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.17.1


