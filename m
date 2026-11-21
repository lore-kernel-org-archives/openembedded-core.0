Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19211.1795278139692701318
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 08:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=t4K32xfo;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout04.t-online.de (Postfix) with SMTP id ECA8E53D
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 17:22:16 +0100 (CET)
Received: from localhost.localdomain ([84.154.170.58]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xUnqy-2ZMwO80; Sat, 21 Nov 2026 17:22:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] python3: backport the fix for _Py_STDC_VERSION in pyport.h
Date: Sat, 21 Nov 2026 17:22:02 +0100
Message-ID: <20261121162210.2347337-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1795278136-A9FD89F7-4AFC1A89/0/0 CLEAN NORMAL
X-TOI-MSGID: 4d0e8ceb-fe37-4309-8dbf-eb96b1c99e89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1795278136; i=f_l_k@t-online.de;
	bh=3zqnZIGRraWaRcPq7qbEzLPvwtzskev+BbGAoMdsX9k=;
	h=From:To:Subject:Date;
	b=t4K32xfoxe1FlJ5N6TeMmG0Sc+mBNXPGYmQ8b6258JFmgC08FDauyOJH1o6K7gN0O
	 ZI62Yg9/aNSv8I8aLl/p1x0oF8n0MeqBUhT7BQc8pt9s8WuVi3pTCcv8gZ8/YZxgKm
	 yxod97tUUbVqvavkUoNAT5htrSXK+d4iVzLxIMxBaD1/4FNRjiMzhuxM7h+SUXOB+l
	 5awjqYmilTGGnwNDb11Uw8dydVysxX9BXjfQ7UirRM29GSOJZLJR5dTc+s+L4B2jMp
	 4Oe5il0D89vGETskpNe2Bv/6hhDDl6i/+R4KsL77SYgzZ5wIEqIMGS3DUqdmdcZGZL
	 sIj1wtG7/J+6g==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 16:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250851

pyport.h tests _Py_STDC_VERSION without defined(), so code built with
-Werror=3Dundef fails on the Python 3.15 headers; libpeas is one of them.
Backport the fix from the 3.15 branch.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ly-use-_Py_STDC_VERSION-when-defined.patch | 80 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.15.2.bb |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-3.15-gh-154=
643-Only-use-_Py_STDC_VERSION-when-defined.patch

diff --git a/meta/recipes-devtools/python/python3/0001-3.15-gh-154643-Onl=
y-use-_Py_STDC_VERSION-when-defined.patch b/meta/recipes-devtools/python/=
python3/0001-3.15-gh-154643-Only-use-_Py_STDC_VERSION-when-defined.patch
new file mode 100644
index 0000000000..4058bd5db1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-3.15-gh-154643-Only-use-_=
Py_STDC_VERSION-when-defined.patch
@@ -0,0 +1,80 @@
+From beff3c022fe787f6879c7e38a6b8a64243184ab3 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Thu, 12 Nov 2026 07:39:16 -0800
+Subject: [PATCH] [3.15] gh-154643: Only use _Py_STDC_VERSION when define=
d
+ (GH-154650) (GH-161874)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Co-authored-by: Miro Hron=C4=8Dok <miro@hroncok.cz>
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/beff=
3c022fe787f6879c7e38a6b8a64243184ab3]
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ Include/cpython/pyatomic.h                                  | 2 +-
+ Include/pyport.h                                            | 2 +-
+ Lib/test/test_cext/setup.py                                 | 6 ++++++
+ .../C_API/2026-07-24-22-30-40.gh-issue-154643.z-ZutK.rst    | 2 ++
+ 4 files changed, 10 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/C_API/2026-07-24-22-30-40.gh-issue-=
154643.z-ZutK.rst
+
+diff --git a/Include/cpython/pyatomic.h b/Include/cpython/pyatomic.h
+index 71a76bdc82ce475..0a11f7781f07e00 100644
+--- a/Include/cpython/pyatomic.h
++++ b/Include/cpython/pyatomic.h
+@@ -585,7 +585,7 @@ static inline void _Py_atomic_fence_release(void);
+ #  define Py_ATOMIC_GCC_H
+ #  include "pyatomic_gcc.h"
+ #  undef Py_ATOMIC_GCC_H
+-#elif _Py_STDC_VERSION >=3D 201112L && !defined(__STDC_NO_ATOMICS__)
++#elif defined(_Py_STDC_VERSION) && _Py_STDC_VERSION >=3D 201112L && !de=
fined(__STDC_NO_ATOMICS__)
+ #  define Py_ATOMIC_STD_H
+ #  include "pyatomic_std.h"
+ #  undef Py_ATOMIC_STD_H
+diff --git a/Include/pyport.h b/Include/pyport.h
+index 6bf011e87709cc0..44d76511fbffbe2 100644
+--- a/Include/pyport.h
++++ b/Include/pyport.h
+@@ -491,7 +491,7 @@ extern "C" {
+ #ifdef WITH_THREAD
+ #  ifdef thread_local
+ #    define _Py_thread_local thread_local
+-#  elif _Py_STDC_VERSION >=3D 201112L && !defined(__STDC_NO_THREADS__)
++#  elif defined(_Py_STDC_VERSION) && _Py_STDC_VERSION >=3D 201112L && !=
defined(__STDC_NO_THREADS__)
+ #    define _Py_thread_local _Thread_local
+ #  elif defined(_MSC_VER)  /* AKA NT_THREADS */
+ #    define _Py_thread_local __declspec(thread)
+diff --git a/Lib/test/test_cext/setup.py b/Lib/test/test_cext/setup.py
+index 10a3887931932ac..3b613ee729f52c4 100644
+--- a/Lib/test/test_cext/setup.py
++++ b/Lib/test/test_cext/setup.py
+@@ -42,6 +42,9 @@
+=20
+         # Ask for strict(er) compliance with the standard
+         '-pedantic-errors',
++
++        # gh-154643: Headers should not use undefined macros in #if
++        '-Werror=3Dundef',
+     ]
+     if not support.Py_GIL_DISABLED:
+         PUBLIC_CFLAGS.append(
+@@ -94,6 +97,9 @@
+=20
+         # We also use `long long`, a C++11 feature we can enable indivi=
dually.
+         '-Wno-long-long',
++
++        # gh-154643: Headers should not use undefined macros in #if
++        '-Werror=3Dundef',
+     ]
+     INTERNAL_CXXFLAGS =3D [
+         # Do not complain about unused parameteres in the internal C AP=
I
+diff --git a/Misc/NEWS.d/next/C_API/2026-07-24-22-30-40.gh-issue-154643.=
z-ZutK.rst b/Misc/NEWS.d/next/C_API/2026-07-24-22-30-40.gh-issue-154643.z=
-ZutK.rst
+new file mode 100644
+index 000000000000000..17c2a58555e7ae9
+--- /dev/null
++++ b/Misc/NEWS.d/next/C_API/2026-07-24-22-30-40.gh-issue-154643.z-ZutK.=
rst
+@@ -0,0 +1,2 @@
++In ``pyport.h`` and ``pyatomic.h`` don't use ``_Py_STDC_VERSION`` when =
it is
++not defined, fixing build errors for C or C++ code built with ``-Werror=
=3Dundef``.
diff --git a/meta/recipes-devtools/python/python3_3.15.2.bb b/meta/recipe=
s-devtools/python/python3_3.15.2.bb
index bfc783c922..0d1c3f05f8 100644
--- a/meta/recipes-devtools/python/python3_3.15.2.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-3.15-gh-158097-Make-test_staggered_race_with_eage=
r_t.patch \
            file://0001-3.15-gh-160924-Don-t-run-the-build-Python-with-RU=
NSH.patch \
            file://0001-gh-160881-Fix-test_is_python_process_non_python_s=
ubp.patch \
+           file://0001-3.15-gh-154643-Only-use-_Py_STDC_VERSION-when-def=
ined.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
--=20
2.56.1

