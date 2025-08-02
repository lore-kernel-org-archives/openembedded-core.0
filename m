Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3FEC87FD2
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 09:29:13 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.3383.1754126952045563893
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 02:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout11.t-online.de (Postfix) with SMTP id CB7091BD94
	for <openembedded-core@lists.openembedded.org>; Sat,  2 Aug 2025 11:29:06 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.51]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ui8Y2-3YNb9t0; Sat, 2 Aug 2025 11:29:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3] autoconf-archive: add backport patches to fix gl and glx detection
Date: Sat,  2 Aug 2025 11:28:50 +0200
Message-ID: <20250802092850.1678997-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1754126943-A37EC6D2-61687161/0/0 CLEAN NORMAL
X-TOI-MSGID: ca30942a-c990-4b83-8eff-e96f8bccb72b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 09:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221380

Detecting opengl using autoconf-archive currently fails:
| aclocal: warning: couldn't open directory 'm4': No such file or directo=
ry
| configure.ac:306: error: _AX_CHECK_GL_MANUAL_LIBS_GENERIC: argument mus=
t not be empty
| ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:690: _AS_IF_ELSE is expand=
ed from...
| ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:697: AS_IF is expanded fro=
m...
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/cava/0.10.4/recipe-s=
ysroot-native/usr/share/aclocal/ax_check_gl.m4:187: _AX_CHECK_GL_MANUAL_L=
IBS_GENERIC is expanded from...
| ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:595: AS_CASE is expanded f=
rom...
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/cava/0.10.4/recipe-s=
ysroot-native/usr/share/aclocal/ax_check_gl.m4:253: AX_CHECK_GL is expand=
ed from...
| ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:697: AS_IF is expanded fro=
m...
| ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:697: AS_IF is expanded fro=
m...
| configure.ac:306: the top level
| autom4te: error: m4 failed with exit status: 1

This issue has already been fixed upstream, but there has been no new rel=
ease since then.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...daa3da0eb1a256fda631867e19345d5f6e3a.patch | 33 ++++++++++++++++
 ...226a2fe3980388abffd6de25ed6b9591cce3.patch | 39 +++++++++++++++++++
 ...8d9e3ead52f998535b86c763065c5b45cc59.patch | 38 ++++++++++++++++++
 .../autoconf-archive_2024.10.16.bb            |  3 ++
 4 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archi=
ve/3a23daa3da0eb1a256fda631867e19345d5f6e3a.patch
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archi=
ve/427e226a2fe3980388abffd6de25ed6b9591cce3.patch
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archi=
ve/e25f8d9e3ead52f998535b86c763065c5b45cc59.patch

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive/3a23=
daa3da0eb1a256fda631867e19345d5f6e3a.patch b/meta/recipes-devtools/autoco=
nf-archive/autoconf-archive/3a23daa3da0eb1a256fda631867e19345d5f6e3a.patc=
h
new file mode 100644
index 0000000000..64d73781d3
--- /dev/null
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive/3a23daa3da0=
eb1a256fda631867e19345d5f6e3a.patch
@@ -0,0 +1,33 @@
+From 3a23daa3da0eb1a256fda631867e19345d5f6e3a Mon Sep 17 00:00:00 2001
+From: Eli Schwartz <eschwartz93@gmail.com>
+Date: Sat, 19 Oct 2024 21:58:52 -0400
+Subject: [PATCH] ax_switch_flags.m4: properly quote m4_fatal
+
+It needs to only run as an argument of m4_if, not all the time.
+
+Fixes: 2adff78e224c908fd58df91852c8301c25777a8f
+
+Upstream-Status: Backport [https://github.com/autoconf-archive/autoconf-=
archive/commit/3a23daa3da0eb1a256fda631867e19345d5f6e3a]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ m4/ax_switch_flags.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ax_switch_flags.m4 b/m4/ax_switch_flags.m4
+index dc79d1e9..777aeb0b 100644
+--- a/m4/ax_switch_flags.m4
++++ b/m4/ax_switch_flags.m4
+@@ -36,10 +36,10 @@
+ #   and this notice are preserved. This file is offered as-is, without =
any
+ #   warranty.
+=20
+-#serial 5
++#serial 6
+=20
+ AC_DEFUN([AX_SWITCH_FLAGS], [
+-  m4_if($1, [], m4_fatal([$0: namespace is empty]))
++  m4_if($1, [], [m4_fatal([$0: namespace is empty])])
+   AC_REQUIRE(AX_SAVE_FLAGS)
+   AC_REQUIRE(AX_RESTORE_FLAGS)
+   AX_SAVE_FLAGS($1[])
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive/427e=
226a2fe3980388abffd6de25ed6b9591cce3.patch b/meta/recipes-devtools/autoco=
nf-archive/autoconf-archive/427e226a2fe3980388abffd6de25ed6b9591cce3.patc=
h
new file mode 100644
index 0000000000..8a86d0a4d8
--- /dev/null
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive/427e226a2fe=
3980388abffd6de25ed6b9591cce3.patch
@@ -0,0 +1,39 @@
+From 427e226a2fe3980388abffd6de25ed6b9591cce3 Mon Sep 17 00:00:00 2001
+From: Eli Schwartz <eschwartz93@gmail.com>
+Date: Sat, 19 Oct 2024 21:51:30 -0400
+Subject: [PATCH] ax_check_gl.m4: properly quote m4_fatal
+
+It needs to only run as an argument of m4_if, not all the time.
+
+Fixes: 753493bf7e251997f02559b98fc599d4a337d8cd
+Bug: https://bugs.gentoo.org/941845
+
+Upstream-Status: Backport [https://github.com/autoconf-archive/autoconf-=
archive/commit/427e226a2fe3980388abffd6de25ed6b9591cce3]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ m4/ax_check_gl.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ax_check_gl.m4 b/m4/ax_check_gl.m4
+index 850d407d..4c2e4efb 100644
+--- a/m4/ax_check_gl.m4
++++ b/m4/ax_check_gl.m4
+@@ -85,7 +85,7 @@
+ #   modified version of the Autoconf Macro, you may extend this special
+ #   exception to the GPL to apply to your modified version as well.
+=20
+-#serial 23
++#serial 24
+=20
+ # example gl program
+ m4_define([_AX_CHECK_GL_PROGRAM],
+@@ -187,7 +187,7 @@ AC_DEFUN([_AX_CHECK_GL_LINK_CV],
+ AC_DEFUN([_AX_CHECK_GL_MANUAL_LIBS_GENERIC], [
+   AS_IF([test -n "$GL_LIBS"],[], [
+     ax_check_gl_manual_libs_generic_extra_libs=3D"$1"
+-    m4_if($1, [], m4_fatal([$0: argument must not be empty]))
++    m4_if($1, [], [m4_fatal([$0: argument must not be empty])])
+=20
+     _AX_CHECK_GL_SAVE_FLAGS([CFLAGS])
+     AC_SEARCH_LIBS([glBegin],[$ax_check_gl_manual_libs_generic_extra_li=
bs], [
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive/e25f=
8d9e3ead52f998535b86c763065c5b45cc59.patch b/meta/recipes-devtools/autoco=
nf-archive/autoconf-archive/e25f8d9e3ead52f998535b86c763065c5b45cc59.patc=
h
new file mode 100644
index 0000000000..9e2689010f
--- /dev/null
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive/e25f8d9e3ea=
d52f998535b86c763065c5b45cc59.patch
@@ -0,0 +1,38 @@
+From e25f8d9e3ead52f998535b86c763065c5b45cc59 Mon Sep 17 00:00:00 2001
+From: Eli Schwartz <eschwartz93@gmail.com>
+Date: Sat, 19 Oct 2024 21:57:16 -0400
+Subject: [PATCH] ax_check_glx.m4: properly quote m4_fatal
+
+It needs to only run as an argument of m4_if, not all the time.
+
+Fixes: 40ca66e7e52bb63e3eee2514855fcf3ad2df7673
+
+Upstream-Status: Backport [https://github.com/autoconf-archive/autoconf-=
archive/commit/e25f8d9e3ead52f998535b86c763065c5b45cc59]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ m4/ax_check_glx.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ax_check_glx.m4 b/m4/ax_check_glx.m4
+index c7890d9c..b5027f9b 100644
+--- a/m4/ax_check_glx.m4
++++ b/m4/ax_check_glx.m4
+@@ -61,7 +61,7 @@
+ #   modified version of the Autoconf Macro, you may extend this special
+ #   exception to the GPL to apply to your modified version as well.
+=20
+-#serial 9
++#serial 10
+=20
+ # example program
+ m4_define([_AX_CHECK_GLX_PROGRAM],
+@@ -183,7 +183,7 @@ AC_DEFUN([_AX_CHECK_GLX_HEADERS],
+ AC_DEFUN([_AX_CHECK_GLX_MANUAL_LIBS_GENERIC],
+ [dnl
+  ax_check_glx_manual_libs_generic_extra_libs=3D"$1"
+- m4_if($1, [], m4_fatal([$0: argument must not be empty]))
++ m4_if($1, [], [m4_fatal([$0: argument must not be empty])])
+=20
+  AC_LANG_PUSH([C])
+  _AX_CHECK_GLX_SAVE_FLAGS()
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024=
.10.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.=
10.16.bb
index 11708de1c8..46d1b91d65 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.=
bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.=
bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D11cc2d3ee574f9=
d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=3Dfdef168ebff3bc2f13664c365a5fb515"
=20
 SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI +=3D "file://427e226a2fe3980388abffd6de25ed6b9591cce3.patch"
+SRC_URI +=3D "file://3a23daa3da0eb1a256fda631867e19345d5f6e3a.patch"
+SRC_URI +=3D "file://e25f8d9e3ead52f998535b86c763065c5b45cc59.patch"
 SRC_URI[sha256sum] =3D "7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219=
c592d62502a57363"
=20
 inherit autotools allarch texinfo
--=20
2.50.1


