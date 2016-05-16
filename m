Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1A59670018
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:13:40 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id l68so15349583qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=SsKmx12XkYRrqLOip2PI40f7Z9cJ+QtuyXBi8Nhufcg=;
	b=RB/gVD7p8kN40e7qCLfYmemQkULu9awUTLrUmTn0PaNUp5o6xCOlCa7XeeoOxpBeS6
	4pQOjyccT2OLnPAJpwzKCdLX0ajbyWD8s1sQMd2jnMUC56+V24Ue3CC7w+yUF1fpbmH/
	qZs8D0hWanipvKDelY7FD5srkjAzbQ5sjGghA+P/92NBiscmr4hR2vXCYNqgK0db9FC0
	uiwnAy6242acL95bNQLUc5B2TxxpDk1DdflkluqxtsSq3bcWTwTqyHJvEA7oYuHAvCFr
	wcSsT6eNJr8mmYSQPhISE60kqu7Tz092v7HUWNla7I8h/tnyMzwuvs8PpsIZNjbcMwYV
	7Uxg==
X-Gm-Message-State: AOPr4FXqqzYLC2WPBiWVJPEUcSoGcMfmdRlHbc2mVB6ZH62bl+r6zh3gBefhKo12bfXufg==
X-Received: by 10.55.22.5 with SMTP id g5mr19898554qkh.101.1463426021615;
	Mon, 16 May 2016 12:13:41 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 95sm15445931qgj.3.2016.05.16.12.13.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:13:40 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:13:32 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:05 -0300
Message-Id: <1463425932-10080-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 07/14] weston: Provide a default version of weston-launch that doesn't require PAM
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
X-List-Received-Date: Mon, 16 May 2016 19:13:41 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

weston-launch requires PAM for starting weston as a non-root user.

Since starting weston as root is a valid use case by itself, we check
the distro for 'pam' and build weston-launch with or without
non-root-user support.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- New patch.

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 ...ch-Provide-a-default-version-that-doesn-t.patch | 171 +++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.10.0.bb     |   9 +-
 2 files changed, 177 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
new file mode 100644
index 0000000..9a401ee
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -0,0 +1,171 @@
+From 228349e796e9baa86f2ba8232c730c18ac41283d Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Fri, 13 May 2016 09:31:55 -0500
+Subject: [PATCH weston] weston-launch: Provide a default version that doesn't
+ require PAM
+
+weston-launch requires PAM for starting weston as a non-root user.
+
+Since starting weston as root is a valid use case by itself, if
+PAM is not available, provide a default version of weston-launch
+without non-root-user support.
+
+Upstream-Status: Pending
+
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+---
+ Makefile.am         |  3 ---
+ configure.ac        | 12 +++++++-----
+ src/weston-launch.c | 20 ++++++++++++++++++++
+ 3 files changed, 27 insertions(+), 8 deletions(-)
+
+Index: weston-1.10.0/configure.ac
+===================================================================
+--- weston-1.10.0.orig/configure.ac	2016-05-13 11:02:05.711817559 -0500
++++ weston-1.10.0/configure.ac	2016-05-13 13:30:28.000000000 -0500
+@@ -445,13 +445,17 @@
+ AS_IF([test "x$have_systemd_login_209" = "xyes"],
+       [AC_DEFINE([HAVE_SYSTEMD_LOGIN_209], [1], [Have systemd-login >= 209])])
+ 
++AC_ARG_WITH(pam,
++            AS_HELP_STRING([--with-pam], [Use PAM]),
++            [use_pam=$withval], [use_pam=yes])
+ AC_ARG_ENABLE(weston-launch, [  --enable-weston-launch],, enable_weston_launch=yes)
+ AM_CONDITIONAL(BUILD_WESTON_LAUNCH, test x$enable_weston_launch == xyes)
+-if test x$enable_weston_launch == xyes; then
++if test x$enable_weston_launch = xyes -a x$use_pam = xyes; then
+   AC_CHECK_LIB([pam], [pam_open_session], [have_pam=yes], [have_pam=no])
+   if test x$have_pam == xno; then
+-    AC_ERROR([weston-launch requires pam])
++    AC_ERROR([PAM support is explicitly requested, but libpam couldn't be found])
+   fi
++  AC_DEFINE([HAVE_PAM], [1], [Define if PAM is available])
+   PAM_LIBS=-lpam
+   AC_SUBST(PAM_LIBS)
+ fi
+@@ -667,6 +671,7 @@
+ 	Enable developer documentation	${enable_devdocs}
+ 
+ 	weston-launch utility		${enable_weston_launch}
++	PAM support			${use_pam}
+ 	systemd-login support		${have_systemd_login}
+ 	systemd notify support		${enable_systemd_notify}
+ 
+Index: weston-1.10.0/src/weston-launch.c
+===================================================================
+--- weston-1.10.0.orig/src/weston-launch.c	2016-05-13 11:02:05.779817896 -0500
++++ weston-1.10.0/src/weston-launch.c	2016-05-13 11:02:05.851818253 -0500
+@@ -51,7 +51,9 @@
+ 
+ #include <pwd.h>
+ #include <grp.h>
++#ifdef HAVE_PAM
+ #include <security/pam_appl.h>
++#endif
+ 
+ #ifdef HAVE_SYSTEMD_LOGIN
+ #include <systemd/sd-login.h>
+@@ -93,8 +95,10 @@
+ #endif
+ 
+ struct weston_launch {
++#ifdef HAVE_PAM
+ 	struct pam_conv pc;
+ 	pam_handle_t *ph;
++#endif
+ 	int tty;
+ 	int ttynr;
+ 	int sock[2];
+@@ -181,6 +185,7 @@
+ 	return false;
+ }
+ 
++#ifdef HAVE_PAM
+ static int
+ pam_conversation_fn(int msg_count,
+ 		    const struct pam_message **messages,
+@@ -221,6 +226,7 @@
+ 
+ 	return 0;
+ }
++#endif
+ 
+ static int
+ setup_launcher_socket(struct weston_launch *wl)
+@@ -414,6 +420,7 @@
+ 	close(wl->signalfd);
+ 	close(wl->sock[0]);
+ 
++#ifdef HAVE_PAM
+ 	if (wl->new_user) {
+ 		err = pam_close_session(wl->ph, 0);
+ 		if (err)
+@@ -421,6 +428,7 @@
+ 				err, pam_strerror(wl->ph, err));
+ 		pam_end(wl->ph, err);
+ 	}
++#endif
+ 
+ 	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
+ 	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
+@@ -600,6 +608,7 @@
+ 	setenv("HOME", wl->pw->pw_dir, 1);
+ 	setenv("SHELL", wl->pw->pw_shell, 1);
+ 
++#ifdef HAVE_PAM
+ 	env = pam_getenvlist(wl->ph);
+ 	if (env) {
+ 		for (i = 0; env[i]; ++i) {
+@@ -608,6 +617,7 @@
+ 		}
+ 		free(env);
+ 	}
++#endif
+ }
+ 
+ static void
+@@ -665,7 +675,9 @@
+ help(const char *name)
+ {
+ 	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
++#ifdef HAVE_PAM
+ 	fprintf(stderr, "  -u, --user      Start session as specified username\n");
++#endif
+ 	fprintf(stderr, "  -t, --tty       Start session on alternative tty\n");
+ 	fprintf(stderr, "  -v, --verbose   Be verbose\n");
+ 	fprintf(stderr, "  -h, --help      Display this help message\n");
+@@ -678,7 +690,9 @@
+ 	int i, c;
+ 	char *tty = NULL;
+ 	struct option opts[] = {
++#ifdef HAVE_PAM
+ 		{ "user",    required_argument, NULL, 'u' },
++#endif
+ 		{ "tty",     required_argument, NULL, 't' },
+ 		{ "verbose", no_argument,       NULL, 'v' },
+ 		{ "help",    no_argument,       NULL, 'h' },
+@@ -690,9 +704,13 @@
+ 	while ((c = getopt_long(argc, argv, "u:t::vh", opts, &i)) != -1) {
+ 		switch (c) {
+ 		case 'u':
++#ifdef HAVE_PAM
+ 			wl.new_user = optarg;
+ 			if (getuid() != 0)
+ 				error(1, 0, "Permission denied. -u allowed for root only");
++#else
++			error(1, 0, "-u is unsupported in this weston-launch build");
++#endif
+ 			break;
+ 		case 't':
+ 			tty = optarg;
+@@ -730,8 +748,10 @@
+ 	if (setup_tty(&wl, tty) < 0)
+ 		exit(EXIT_FAILURE);
+ 
++#ifdef HAVE_PAM
+ 	if (wl.new_user && setup_pam(&wl) < 0)
+ 		exit(EXIT_FAILURE);
++#endif
+ 
+ 	if (setup_launcher_socket(&wl) < 0)
+ 		exit(EXIT_FAILURE);
diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 0b881ee..7190b90 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-make-error-portable.patch \
            file://0001-configure.ac-Use-PKG_CONFIG_SYSROOT_DIR-for-protocol.patch \
            file://make-weston-launch-exit-for-unrecognized-option.patch \
+           file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
 SRC_URI[md5sum] = "1cd17c54ecac6d9a3cd90bf12eaa3e20"
 SRC_URI[sha256sum] = "e0b2004d00d8293ddf7903ca283c1746afa9ccb5919ab50fd04397ff472aa5c1"
@@ -37,9 +38,9 @@ EXTRA_OECONF_append_qemux86-64 = "\
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-                   clients"
+                   clients launch"
 #
 # Compositor choices
 #
@@ -54,7 +55,7 @@ PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compo
 # Weston on framebuffer
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
 # weston-launch
-PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam drm"
+PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,drm"
 # VA-API desktop recorder
 PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
 # Weston with EGL support
@@ -75,6 +76,8 @@ PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland"
 PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
 # Clients support
 PACKAGECONFIG[clients] = "--enable-clients --enable-simple-clients --enable-demo-clients-install,--disable-clients --disable-simple-clients"
+# Weston with PAM support
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.8.2


