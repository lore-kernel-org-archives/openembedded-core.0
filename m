Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14142.1599291719859186100
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2020 00:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2500740BAB;
	Sat,  5 Sep 2020 07:41:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gzYPuF5YLyzc; Sat,  5 Sep 2020 07:41:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 04AAC40AB7;
	Sat,  5 Sep 2020 07:41:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 60F4D173085;
	Sat,  5 Sep 2020 03:41:57 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] weston: upgrade 8.0.0 -> 9.0.0
Date: Sat,  5 Sep 2020 03:41:47 -0400
Message-Id: <1599291707-36225-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Weston 9.0.0 is released! This release cycle has been pretty quiet,
with just a few new features:

- A new kiosk shell allows to display regular desktop apps in an
  always-fullscreen mode
- Improved testing infrastructure: the test harness has been
  redesigned, DRM tests are now supported, DRM and OpenGL tests are now
  enabled in our CI
- DRM panel orientation property support

As always, a number of bug fixes are included as well.
https://lists.freedesktop.org/archives/wayland-devel/2020-September/041595.html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ch-Provide-a-default-version-that-doesn-t.patch | 27 +++++++++++-----------
 .../wayland/{weston_8.0.0.bb => weston_9.0.0.bb}   |  3 +--
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_8.0.0.bb => weston_9.0.0.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index 62b864c..3279a72 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -1,7 +1,8 @@
-From 5f2d71998eb77068cbaee2d468cbb296a42d5739 Mon Sep 17 00:00:00 2001
+From a1548c742bf2dedbb47282d8a00407b60bbab669 Mon Sep 17 00:00:00 2001
 From: Tom Hochstein <tom.hochstein@nxp.com>
 Date: Wed, 22 Feb 2017 15:53:30 +0200
 Subject: [PATCH] weston-launch: Provide a default version that doesn't require
+
  PAM
 
 weston-launch requires PAM for starting weston as a non-root user.
@@ -57,7 +58,7 @@ index 08d23ec..cb9fd3f 100644
  		install: true
  	)
 diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
-index 8a711b4..54c567a 100644
+index 521cb2c..2d42d33 100644
 --- a/libweston/weston-launch.c
 +++ b/libweston/weston-launch.c
 @@ -51,7 +51,9 @@
@@ -97,7 +98,7 @@ index 8a711b4..54c567a 100644
  
  static int
  setup_launcher_socket(struct weston_launch *wl)
-@@ -431,6 +437,7 @@ quit(struct weston_launch *wl, int status)
+@@ -466,6 +472,7 @@ quit(struct weston_launch *wl, int status)
  	close(wl->signalfd);
  	close(wl->sock[0]);
  
@@ -105,15 +106,15 @@ index 8a711b4..54c567a 100644
  	if (wl->new_user) {
  		err = pam_close_session(wl->ph, 0);
  		if (err)
-@@ -438,6 +445,7 @@ quit(struct weston_launch *wl, int status)
+@@ -473,6 +480,7 @@ quit(struct weston_launch *wl, int status)
  				err, pam_strerror(wl->ph, err));
  		pam_end(wl->ph, err);
  	}
 +#endif
  
- 	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
- 	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
-@@ -666,6 +674,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+ 	/*
+ 	 * Get a fresh handle to the tty as the previous one is in
+@@ -710,6 +718,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  	setenv("HOME", wl->pw->pw_dir, 1);
  	setenv("SHELL", wl->pw->pw_shell, 1);
  
@@ -121,7 +122,7 @@ index 8a711b4..54c567a 100644
  	env = pam_getenvlist(wl->ph);
  	if (env) {
  		for (i = 0; env[i]; ++i) {
-@@ -674,6 +683,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -718,6 +727,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  		}
  		free(env);
  	}
@@ -129,7 +130,7 @@ index 8a711b4..54c567a 100644
  
  	/*
  	 * We open a new session, so it makes sense
-@@ -745,8 +755,10 @@ static void
+@@ -789,8 +799,10 @@ static void
  help(const char *name)
  {
  	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
@@ -140,7 +141,7 @@ index 8a711b4..54c567a 100644
  	fprintf(stderr, "  -t, --tty       Start session on alternative tty,\n"
  			"                  e.g. -t /dev/tty4, requires -u option.\n");
  	fprintf(stderr, "  -v, --verbose   Be verbose\n");
-@@ -760,7 +772,9 @@ main(int argc, char *argv[])
+@@ -804,7 +816,9 @@ main(int argc, char *argv[])
  	int i, c;
  	char *tty = NULL;
  	struct option opts[] = {
@@ -150,7 +151,7 @@ index 8a711b4..54c567a 100644
  		{ "tty",     required_argument, NULL, 't' },
  		{ "verbose", no_argument,       NULL, 'v' },
  		{ "help",    no_argument,       NULL, 'h' },
-@@ -772,11 +786,16 @@ main(int argc, char *argv[])
+@@ -816,11 +830,16 @@ main(int argc, char *argv[])
  	while ((c = getopt_long(argc, argv, "u:t:vh", opts, &i)) != -1) {
  		switch (c) {
  		case 'u':
@@ -167,7 +168,7 @@ index 8a711b4..54c567a 100644
  			break;
  		case 't':
  			tty = optarg;
-@@ -828,8 +847,10 @@ main(int argc, char *argv[])
+@@ -872,8 +891,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
@@ -179,7 +180,7 @@ index 8a711b4..54c567a 100644
  	if (setup_launcher_socket(&wl) < 0)
  		exit(EXIT_FAILURE);
 diff --git a/meson_options.txt b/meson_options.txt
-index c862ecc..73ef2c3 100644
+index 239bd2d..99e4ec3 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -73,6 +73,13 @@ option(
diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_8.0.0.bb
rename to meta/recipes-graphics/wayland/weston_9.0.0.bb
index 8fef864..7b38688 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -11,8 +11,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "53e4810d852df0601d01fd986a5b22b3"
-SRC_URI[sha256sum] = "7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51161927afa4329c027848"
+SRC_URI[sha256sum] = "5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbdabbdebe83e1f83aa098fe"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4

