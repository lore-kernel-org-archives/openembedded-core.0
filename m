Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id B76767F365
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 04:10:38 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id i11so934076iol.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 20:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NiVm5OpwaWZubqmsjv1km+VWNMFNeD0qnkiwFPTXveI=;
	b=bdv+yE8mgP47reh4qe16fb/T7iUY2YAgLnb2P/chhGsMOqDFV1PJWO784YyDRJAj+m
	5N57LeNW4vnAGV40Bfw2vfkg9MiiCVM5VCa2/gpJJ8OAfda+CdJ4Xgbu7ndgNRKU/haw
	hNB7NEfbmU9cl3XtUqTKgyYbBH2sYQtoVVaa33qEPQ7GqmLEnqrsQYVXlcoD8heDO7aR
	Ky07pmxfRnobSVNBpTnsxbZm/n8n1pCtCct5MPQlHwzHnJ33zFVTEYtJIeURa6uuAfLb
	n8VrCpDpgY3ymmI9C8YSQkfSkNW7/ahh+HThW8Za5DKIj1KRzApQLIaVtyltNrlOjExY
	x5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NiVm5OpwaWZubqmsjv1km+VWNMFNeD0qnkiwFPTXveI=;
	b=HJT9nV4gtSakkAZJNZEz0ndLIGk/Z9Xjgy9CUshC1fzs7azMyhN60+CAowI8RU0Yh4
	fE8qLWp4yP8UVvklrU06OLCs2Jk2B9PxgFpJNJzkDqBUK6JHcFwS1fIWK64xYSvhTESb
	KF4qpeX/1UzAuxbNKBuVXXA6Y0nULLrd5Q4hk6io9oizO5slcFYel9xVvD9zHrrs9WYL
	CssgyFjf2UUrmY/watzI+94mvrsVf5TQFXz/aweTHv7UvzkFhWLpKo0LLNd5S7M29Wqo
	eodQitc8Oat3i1PjlPWA3HWmN/7LrObzchCy8Z4NlcrXJyLzPIJF105XNfhjGNn+xPm6
	ZIBw==
X-Gm-Message-State: APjAAAX8H/UWvRRY4CvemT5SbDR5kU10+WW0vJAFY+f3//9JC9QJltJh
	WRCB2glneocMYt15yL70c0s8aQYLles=
X-Google-Smtp-Source: APXvYqz+MkBED+YE3O+23LIukXSbTOVyhqU3gCZfvRUcGd6Oiw8qOMmkipfekSSpkggELjMJCxqtgw==
X-Received: by 2002:a5e:d611:: with SMTP id w17mr1370089iom.262.1573618239250; 
	Tue, 12 Nov 2019 20:10:39 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id x18sm75174iob.70.2019.11.12.20.10.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 20:10:38 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2019 22:10:31 -0600
Message-Id: <20191113041031.718436-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] mc: Fix build reproducibility
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
X-List-Received-Date: Wed, 13 Nov 2019 04:10:39 -0000
Content-Transfer-Encoding: 8bit

Fixes some issues with reproducible builds. Adds a patch to allow the
configure arguments to be omitted from the build and also explicitly
setting some autoconf paths that were picking up hosttools.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...Add-option-to-control-configure-args.patch | 99 +++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.23.bb         |  5 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch

diff --git a/meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch b/meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch
new file mode 100644
index 00000000000..e76aac81612
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
index 83de8dbb2c6..71f61b48485 100644
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
2.23.0


