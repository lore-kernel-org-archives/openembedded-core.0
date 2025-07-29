Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0B8C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 10:32:01 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.4002.1753785116990880499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 03:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 7BAD62AEE2
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 12:31:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.235.207]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ughcN-4A2kTp0; Tue, 29 Jul 2025 12:31:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH]] autoconf-archive: add backport patch to fix gl detection
Date: Tue, 29 Jul 2025 12:31:26 +0200
Message-ID: <20250729103126.1806165-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1753785095-317F053D-06A60E60/0/0 CLEAN NORMAL
X-TOI-MSGID: 7b546572-0ef3-4645-a10e-6b8455e1e775
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 10:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221058

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
 ...226a2fe3980388abffd6de25ed6b9591cce3.patch | 39 +++++++++++++++++++
 .../autoconf-archive_2024.10.16.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archi=
ve/427e226a2fe3980388abffd6de25ed6b9591cce3.patch

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive/427e=
226a2fe3980388abffd6de25ed6b9591cce3.patch b/meta/recipes-devtools/autoco=
nf-archive/autoconf-archive/427e226a2fe3980388abffd6de25ed6b9591cce3.patc=
h
new file mode 100644
index 0000000000..99c6ae0aec
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
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Backport [https://github.com/autoconf-archive/autoconf-=
archive/commit/427e226a2fe3980388abffd6de25ed6b9591cce3]
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
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024=
.10.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.=
10.16.bb
index 11708de1c8..5d780d2f7c 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.=
bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.=
bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D11cc2d3ee574f9=
d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=3Dfdef168ebff3bc2f13664c365a5fb515"
=20
 SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI +=3D "file://427e226a2fe3980388abffd6de25ed6b9591cce3.patch"
 SRC_URI[sha256sum] =3D "7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219=
c592d62502a57363"
=20
 inherit autotools allarch texinfo
--=20
2.50.1


