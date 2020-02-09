Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4161660CD2
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:13 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9so1785339plo.11
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XXorizECtezDds0M5R21W+IMZO5HMLmf4+qRajqVZP4=;
	b=RcOj6K9MgI9Zd51q0s9dyL/U6GUJD9ZwSqQtBqkqB4QaszOuh92HOHpMSTFYzaRBB4
	oZv7cZmHeULKfoCkDYFRPt5SrarxuhrUz86+1lYwPqe0sxI2hkOv++YyYqGfNFLsH5Pt
	/SWAbu4GFLjKW7g8M8oKfVRB/CoVZdpVNDDn8ZaEQ2XEXHe4MWopmzibJk4W5+mxZDLe
	Gf/S9pdgzHK4mkuUKIf+t3WOzSDT3nXbGOwjunTL9iWWyUFC4b7II/P46L1BwCzTwBuC
	YIEaYsYJ76HQIWqxeBzWTy2BjroRJuOnTUBcho5PUs44gSPq+awElG5KKsNfv7xUPBlo
	HRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XXorizECtezDds0M5R21W+IMZO5HMLmf4+qRajqVZP4=;
	b=cOT36/sOv3ywa0CwD05PvaDMSyEQwjGcxHcjjX1FXBoKomqIzb3wVF5IKxCqfK5nbs
	flGqvR67XBZ65pEzf32TVcRvfjNEzqkE4IdTimWv0Q/7XyRqQ9YPzjSlq8h+1MeaZlC/
	nJe+f+ukWBc1At+BTwtsXKzilkig/GHzLh3yc0r5NKKwsxy4jGYIpYVP4KitMgFz1Flk
	DsH9D+VIXW4ASe8g0+D+zY/drNIhcVBUTlkvplcQtAsuo7z0G7Mb/x3A5+rEFoypRsAc
	sqpBM81tTcuaSbs1nmvUsjRDGMQWm8dXbl7YJJo2AGlWsq4RZXWoxqE8iAdZCuwpcTmC
	6qKw==
X-Gm-Message-State: APjAAAXqvjzJu8rBuFDwLgAoZdzRI6sMAKrm/cSKdrMWiT8LidfW5iJJ
	QIjNrRJHilXFAKc8otVp3aOCG1//
X-Google-Smtp-Source: APXvYqyb6X1eba+zOXfqQDwgxIiNiOAIsN+du+J1XC26XO3MAcJX/QmrO2boHJqOosRicpFIGZuvKg==
X-Received: by 2002:a17:90a:cb0f:: with SMTP id
	z15mr15834886pjt.67.1581264614111; 
	Sun, 09 Feb 2020 08:10:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.13
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:41 -0800
Message-Id: <0b225d2513272072f90b2e5f5a7ff36fddb4d6e3.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 13/29] mc: Fix build reproducibility
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:14 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Fixes some issues with reproducible builds. Adds a patch to allow the
configure arguments to be omitted from the build and also explicitly
setting some autoconf paths that were picking up hosttools.

(From OE-Core rev: f54d60ee8f15229aa515e168b9c7d248663b48fe)

(From OE-Core rev: 164d72b7a6ab20940f9a124beaf485be9ddc07ba)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...Add-option-to-control-configure-args.patch | 99 +++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.23.bb         |  5 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch

diff --git a/meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch b/meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch
new file mode 100644
index 0000000000..e76aac8161
--- /dev/null
+++ b/meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch
@@ -0,0 +1,99 @@
+From a54501d3c9541bc8600225aa2d42531f93c6def7 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Sat, 9 Nov 2019 20:01:48 -0600
+Subject: [PATCH] Add option to control configure args
+
+Embedding the configure time options into the executable can lead to
+non-reproducible builds, since configure options often have embedded
+paths. Add a configure time option to control if the configure args are
+embedded so this can be disabled.
+
+Upstream-Status: Submitted [https://midnight-commander.org/ticket/4031]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ configure.ac   | 6 ++++++
+ src/args.c     | 6 ++++++
+ src/textconf.c | 2 ++
+ 3 files changed, 14 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 19d1a76be..a1948f6b9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -544,6 +544,12 @@ dnl Clarify do we really need GModule
+ AM_CONDITIONAL([HAVE_GMODULE], [test -n "$g_module_supported" && \
+                                 test x"$textmode_x11_support" = x"yes" -o x"$enable_aspell" = x"yes"])
+ 
++AC_ARG_ENABLE([configure-args],
++    AS_HELP_STRING([--enable-configure-args], [Handle all compiler warnings as errors]))
++if test "x$enable_configure_args" != xno; then
++    AC_DEFINE([ENABLE_CONFIGURE_ARGS], 1, [Define to enable showing configure arguments in help])
++fi
++
+ AC_DEFINE_UNQUOTED([MC_CONFIGURE_ARGS], ["$ac_configure_args"], [MC configure arguments])
+ 
+ AC_CONFIG_FILES(
+diff --git a/src/args.c b/src/args.c
+index baef1a1c8..f8dc24020 100644
+--- a/src/args.c
++++ b/src/args.c
+@@ -95,7 +95,9 @@ static gboolean mc_args__nouse_subshell = FALSE;
+ #endif /* ENABLE_SUBSHELL */
+ static gboolean mc_args__show_datadirs = FALSE;
+ static gboolean mc_args__show_datadirs_extended = FALSE;
++#ifdef ENABLE_CONFIGURE_ARGS
+ static gboolean mc_args__show_configure_opts = FALSE;
++#endif
+ 
+ static GOptionGroup *main_group;
+ 
+@@ -125,6 +127,7 @@ static const GOptionEntry argument_main_table[] = {
+      NULL
+     },
+ 
++#ifdef ENABLE_CONFIGURE_ARGS
+     /* show configure options */
+     {
+      "configure-options", '\0', G_OPTION_FLAG_IN_MAIN, G_OPTION_ARG_NONE,
+@@ -132,6 +135,7 @@ static const GOptionEntry argument_main_table[] = {
+      N_("Print configure options"),
+      NULL
+     },
++#endif
+ 
+     {
+      "printwd", 'P', G_OPTION_FLAG_IN_MAIN, G_OPTION_ARG_STRING,
+@@ -758,11 +762,13 @@ mc_args_show_info (void)
+         return FALSE;
+     }
+ 
++#ifdef ENABLE_CONFIGURE_ARGS
+     if (mc_args__show_configure_opts)
+     {
+         show_configure_options ();
+         return FALSE;
+     }
++#endif
+ 
+     return TRUE;
+ }
+diff --git a/src/textconf.c b/src/textconf.c
+index 1e0613e58..f39b9e028 100644
+--- a/src/textconf.c
++++ b/src/textconf.c
+@@ -232,10 +232,12 @@ show_datadirs_extended (void)
+ 
+ /* --------------------------------------------------------------------------------------------- */
+ 
++#ifdef ENABLE_CONFIGURE_ARGS
+ void
+ show_configure_options (void)
+ {
+     (void) printf ("%s\n", MC_CONFIGURE_ARGS);
+ }
++#endif
+ 
+ /* --------------------------------------------------------------------------------------------- */
+-- 
+2.23.0
+
diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.23.bb
index 83de8dbb2c..71f61b4848 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.23.bb
@@ -8,6 +8,7 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
+           file://0001-Add-option-to-control-configure-args.patch \
            "
 SRC_URI[md5sum] = "152927ac29cf0e61d7d019f261bb7d89"
 SRC_URI[sha256sum] = "238c4552545dcf3065359bd50753abbb150c1b22ec5a36eaa02c82808293267d"
@@ -21,9 +22,11 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
-EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
+EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --disable-configure-args"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
+CACHED_CONFIGUREVARS += "ac_cv_path_PYTHON='/usr/bin/env python'"
+CACHED_CONFIGUREVARS += "ac_cv_path_GREP='/usr/bin/env grep'"
 
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
-- 
2.17.1


