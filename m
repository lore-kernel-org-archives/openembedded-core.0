Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 51DFF7F89A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:45:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id l17so7040131wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iVc2xWedWH6VjSv7rs3yZE/RfHbaFEoVSr2AsRKhs9o=;
	b=Kl9aG9Aubo4WppVTQ8A681ZVx/hTM++1JsSkrWpGXVQvwiSodBqHlkcDV+NI9JLQuB
	PpKIolcKR6rN2moi1KuVrryoEObb8wD8qaKfKozf45MKbXezAYur9SbbvXWqysMQ7fhs
	hxzDWXLVhUsCQ5nY7bHPSH7DJpe8gzaNa7cEx7TjjNcPgMwtJ1K7oKrO1ehI0Q590Hy6
	xXYJSYVHXTZEePXHt4eUILpJIBUjaf1rot6CQwf9xmT1luu9bkOd3YpqKOAmLZppHxsG
	6LbtIqsFTY07sH1J/CuztLza256X36jxijQu+9mabaOUi4fP/mddtfsp76D1N++gdbZW
	AMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iVc2xWedWH6VjSv7rs3yZE/RfHbaFEoVSr2AsRKhs9o=;
	b=dC2r01mJejJG6XJjdADONhgN6brW7tB22uBE100Rec9V4VFgflTtDaTRmjuZIkHU5Z
	DzYekmYFPgMf+N+h+yLtKce/pAp37Udfqc1oEUz3CNmHZg/+rKPgZt+5CCVcIhBZOstz
	XV7o+DtPpmc1dEEweZi2COsiBuNAVPWIe3vFmUaf3zFtxG3hxtMenOhvIgavsmag+3vi
	sPncICoW6u7BGSBoNIUIVA/xSCgwCBhNN3Nav2H+W9ajf0aGs2V8J/OHLn31vx50nSPv
	iMl6MicsVlo3nz9Z6gcPxSX+L0dAdPyYC3jgnFTBgx70QC4CBQd4MvNa2L6tKGJvbw2+
	eTMw==
X-Gm-Message-State: APjAAAX9ds9G9Zh4rzoA02PeTgZtCdbCp3da5K5/jYOgInFt1+3z8hH/
	yGwbEhs01gsAfwQtPnyHCOFsJ3sm
X-Google-Smtp-Source: APXvYqzwE6bZad5LBZD1EQ12CDWm2udG7KZTJpSuKsIi2R/QwY5gVI759r3t76A/sNPoi8UukDA1VQ==
X-Received: by 2002:a1c:e915:: with SMTP id q21mr3423732wmc.164.1574257525650; 
	Wed, 20 Nov 2019 05:45:25 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o189sm7031771wmo.23.2019.11.20.05.45.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 05:45:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 14:44:54 +0100
Message-Id: <20191120134455.125118-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120134455.125118-1-alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/11] mc: backport a patch to fix builds with latest gettext
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
X-List-Received-Date: Wed, 20 Nov 2019 13:45:26 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...29-configure.ac-drop-bundled-gettext.patch | 110 ++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.23.bb         |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch

diff --git a/meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch b/meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch
new file mode 100644
index 00000000000..8f357378d02
--- /dev/null
+++ b/meta/recipes-extended/mc/files/0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch
@@ -0,0 +1,110 @@
+From 0d677a014a87b968d79eea2353ac4e342b0fd4ca Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Wed, 11 Sep 2019 22:58:18 +0100
+Subject: [PATCH] Ticket #3629: configure.ac: drop bundled gettext
+
+Bundled libintl did not support linking to internal static
+libraries (libmc in our case): directly specified static
+libraries are not pulled by libtool and are not usable for
+dynamic libraries as PIC-related flags are not passed for
+compilation.
+
+This renders bundled libintl library unusable.
+
+The change drops libintl bundling support and always relies
+on external libintl (or falls back to disabled NLS).
+
+On a related note gettext-0.20 drops support for bundling
+or libintl and this change will ease migration to newer version.
+
+The change is tested on x86_64-gentoo-linux-musl: mc builds
+and links all tests successfully. A few tests fail for lack
+of NLS support.
+
+Upstream-Status: Backport [https://github.com/MidnightCommander/mc/commit/f30e6ff283f4bc86177e4360de94dad794678395]
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am           | 2 +-
+ configure.ac          | 5 +++--
+ doc/doxygen.cfg       | 2 +-
+ lib/Makefile.am       | 2 +-
+ m4.include/mc-i18n.m4 | 5 -----
+ 5 files changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ac05a83..f86f6ed 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,7 +1,7 @@
+ ## Process this file with automake to create Makefile.in.
+ AUTOMAKE_OPTIONS = 1.5
+ 
+-SUBDIRS = intl po lib src doc contrib misc
++SUBDIRS = po lib src doc contrib misc
+ 
+ if HAVE_TESTS
+     SUBDIRS += tests
+diff --git a/configure.ac b/configure.ac
+index a1948f6..bbc9e71 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -272,7 +272,9 @@ dnl ############################################################################
+ dnl Internationalization
+ dnl ############################################################################
+ 
+-AM_GNU_GETTEXT([no-libtool], [need-ngettext])
++AC_CHECK_FUNCS([setlocale])
++
++AM_GNU_GETTEXT([external], [need-ngettext])
+ AM_GNU_GETTEXT_VERSION([0.18.1])
+ 
+ mc_I18N
+@@ -680,7 +682,6 @@ doc/hlp/pl/Makefile
+ doc/hlp/ru/Makefile
+ doc/hlp/sr/Makefile
+ 
+-intl/Makefile
+ po/Makefile.in
+ ])
+ 
+diff --git a/doc/doxygen.cfg b/doc/doxygen.cfg
+index 07bc973..1118062 100644
+--- a/doc/doxygen.cfg
++++ b/doc/doxygen.cfg
+@@ -91,7 +91,7 @@ FILE_PATTERNS          = *.c \
+ RECURSIVE              = YES
+ EXCLUDE                =
+ EXCLUDE_SYMLINKS       = NO
+-EXCLUDE_PATTERNS       = */intl/* */tests/* */.git/*
++EXCLUDE_PATTERNS       = */tests/* */.git/*
+ EXCLUDE_SYMBOLS        =
+ EXAMPLE_PATH           = $(SRCDIR)
+ EXAMPLE_PATTERNS       =
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index c448e2d..455f9dd 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -74,4 +74,4 @@ else
+     libmc_la_LIBADD += $(GLIB_LIBS)
+ endif
+ 
+-libmc_la_LIBADD += $(PCRE_LIBS) $(LIBICONV) $(LIBINTL)
++libmc_la_LIBADD += $(PCRE_LIBS)
+diff --git a/m4.include/mc-i18n.m4 b/m4.include/mc-i18n.m4
+index dd10d00..ec08324 100644
+--- a/m4.include/mc-i18n.m4
++++ b/m4.include/mc-i18n.m4
+@@ -8,11 +8,6 @@ dnl @license GPL
+ dnl @copyright Free Software Foundation, Inc.
+ 
+ AC_DEFUN([mc_I18N],[
+-
+-    if test "x$USE_INCLUDED_LIBINTL" = xyes; then
+-        CPPFLAGS="$CPPFLAGS -I\$(top_builddir)/intl -I\$(top_srcdir)/intl"
+-    fi
+-
+     dnl User visible support for charset conversion.
+     AC_ARG_ENABLE([charset],
+         AS_HELP_STRING([--enable-charset], [Support for charset selection and conversion @<:@yes@:>@]))
diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.23.bb
index 71f61b48485..ac40e561832 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.23.bb
@@ -9,6 +9,7 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://0001-Add-option-to-control-configure-args.patch \
+           file://0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch \
            "
 SRC_URI[md5sum] = "152927ac29cf0e61d7d019f261bb7d89"
 SRC_URI[sha256sum] = "238c4552545dcf3065359bd50753abbb150c1b22ec5a36eaa02c82808293267d"
-- 
2.17.1


