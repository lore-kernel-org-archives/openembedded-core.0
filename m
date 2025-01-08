Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41199E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:46:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22871.1736351202208580438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2BAE13D5
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jan 2025 07:47:09 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CD703F66E
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jan 2025 07:46:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libtheora: backport a patch to fix autoreconf
Date: Wed,  8 Jan 2025 15:46:34 +0000
Message-ID: <20250108154636.1431857-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250108154636.1431857-1-ross.burton@arm.com>
References: <20250108154636.1431857-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209570

This is needed so that autoreconf works without any macro path fiddling,
which autotools may no longer be doing implicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libtheora-1.1.1/autoreconf.patch          | 42 +++++++++++++++++++
 .../libtheora/libtheora_1.1.1.bb              |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtheora/libtheora-1.1.1/aut=
oreconf.patch

diff --git a/meta/recipes-multimedia/libtheora/libtheora-1.1.1/autoreconf=
.patch b/meta/recipes-multimedia/libtheora/libtheora-1.1.1/autoreconf.pat=
ch
new file mode 100644
index 00000000000..0fc09ba413c
--- /dev/null
+++ b/meta/recipes-multimedia/libtheora/libtheora-1.1.1/autoreconf.patch
@@ -0,0 +1,42 @@
+From 859e58b440e64aeec446ae0a923a638e4203f408 Mon Sep 17 00:00:00 2001
+From: Tim Terriberry <tterribe@xiph.org>
+Date: Fri, 20 May 2011 20:41:50 +0000
+Subject: [PATCH] Make autoreconf -i -f work.
+
+Patch from David Schleef.
+
+svn path=3D/trunk/theora/; revision=3D17990
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ Makefile.am  | 2 ++
+ configure.ac | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d833491..369978d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,6 +2,8 @@
+=20
+ AUTOMAKE_OPTIONS =3D foreign 1.6 dist-zip dist-bzip2
+=20
++ACLOCAL_AMFLAGS=3D-I m4
++
+ if THEORA_ENABLE_EXAMPLES
+ EXAMPLES_DIR =3D examples
+ else
+diff --git a/configure.ac b/configure.ac
+index 8260bdf..d4feb86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -61,7 +61,7 @@ AC_LIBTOOL_WIN32_DLL
+ AM_PROG_LIBTOOL
+=20
+ dnl Add parameters for aclocal
+-AC_SUBST(ACLOCAL_AMFLAGS, "-I m4")
++AC_CONFIG_MACRO_DIR([m4])
+=20
+ dnl Check for doxygen
+ AC_CHECK_PROG(HAVE_DOXYGEN, doxygen, true, false)
diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/=
recipes-multimedia/libtheora/libtheora_1.1.1.bb
index 11674af379f..f3d053d9f47 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -9,6 +9,7 @@ DEPENDS =3D "libogg"
=20
=20
 SRC_URI =3D "http://downloads.xiph.org/releases/theora/libtheora-${PV}.t=
ar.bz2 \
+           file://autoreconf.patch \
            file://no-docs.patch"
=20
 SRC_URI[md5sum] =3D "292ab65cedd5021d6b7ddd117e07cd8e"
--=20
2.43.0


