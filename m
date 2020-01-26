Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id AA93091757
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 17:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 77E7740BDA;
	Sun, 26 Jan 2020 17:51:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bBZjUNoopyi6; Sun, 26 Jan 2020 17:51:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 59A3340A4E;
	Sun, 26 Jan 2020 17:51:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A9F851743AA;
	Sun, 26 Jan 2020 12:51:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 12:51:03 -0500
Message-Id: <1580061063-46150-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] weston: upgrade 7.0.0 -> 8.0.0
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
X-List-Received-Date: Sun, 26 Jan 2020 17:51:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Here are some highlights:
- DRM hardware planes should be used more effectively
- The DRM backend now supports HDCP
- Headless backend now supports OpenGL
- DRM backend can now be built without GBM
- EGL_KHR_partial_update is now used when available, reducing memory
  bandwidth usage on some GPUs
- Logging framework improvements
- Documentation for weston can now be built
https://lists.freedesktop.org/archives/wayland-devel/2020-January/041147.html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ch-Provide-a-default-version-that-doesn-t.patch | 28 ++++++++++------------
 .../wayland/{weston_7.0.0.bb => weston_8.0.0.bb}   |  7 +++---
 2 files changed, 17 insertions(+), 18 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_7.0.0.bb => weston_8.0.0.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index e50845b..62b864c 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -1,4 +1,4 @@
-From 682b7d79a7b81ec8e38760381104b24ad549e8c0 Mon Sep 17 00:00:00 2001
+From 5f2d71998eb77068cbaee2d468cbb296a42d5739 Mon Sep 17 00:00:00 2001
 From: Tom Hochstein <tom.hochstein@nxp.com>
 Date: Wed, 22 Feb 2017 15:53:30 +0200
 Subject: [PATCH] weston-launch: Provide a default version that doesn't require
@@ -16,6 +16,7 @@ Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 Signed-off-by: Ming Liu <ming.liu@toradex.com>
+
 ---
  libweston/meson.build     | 16 ++++++++++++----
  libweston/weston-launch.c | 21 +++++++++++++++++++++
@@ -23,10 +24,10 @@ Signed-off-by: Ming Liu <ming.liu@toradex.com>
  3 files changed, 40 insertions(+), 4 deletions(-)
 
 diff --git a/libweston/meson.build b/libweston/meson.build
-index d8d3fc0..326683f 100644
+index 08d23ec..cb9fd3f 100644
 --- a/libweston/meson.build
 +++ b/libweston/meson.build
-@@ -199,16 +199,24 @@ dep_vertex_clipping = declare_dependency(
+@@ -216,16 +216,24 @@ dep_vertex_clipping = declare_dependency(
  )
  
  if get_option('weston-launch')
@@ -52,11 +53,11 @@ index d8d3fc0..326683f 100644
  		'weston-launch.c',
 -		dependencies: [dep_pam, systemd_dep, dep_libdrm],
 +		dependencies: deps_weston_launch,
- 		include_directories: include_directories('..'),
+ 		include_directories: common_inc,
  		install: true
  	)
 diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
-index 4962bd6..fc531c5 100644
+index 8a711b4..54c567a 100644
 --- a/libweston/weston-launch.c
 +++ b/libweston/weston-launch.c
 @@ -51,7 +51,9 @@
@@ -112,7 +113,7 @@ index 4962bd6..fc531c5 100644
  
  	if (ioctl(wl->tty, KDSKBMUTE, 0) &&
  	    ioctl(wl->tty, KDSKBMODE, wl->kb_mode))
-@@ -660,6 +668,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -666,6 +674,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  	setenv("HOME", wl->pw->pw_dir, 1);
  	setenv("SHELL", wl->pw->pw_shell, 1);
  
@@ -120,7 +121,7 @@ index 4962bd6..fc531c5 100644
  	env = pam_getenvlist(wl->ph);
  	if (env) {
  		for (i = 0; env[i]; ++i) {
-@@ -668,6 +677,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
+@@ -674,6 +683,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
  		}
  		free(env);
  	}
@@ -128,7 +129,7 @@ index 4962bd6..fc531c5 100644
  
  	/*
  	 * We open a new session, so it makes sense
-@@ -739,8 +749,10 @@ static void
+@@ -745,8 +755,10 @@ static void
  help(const char *name)
  {
  	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
@@ -139,7 +140,7 @@ index 4962bd6..fc531c5 100644
  	fprintf(stderr, "  -t, --tty       Start session on alternative tty,\n"
  			"                  e.g. -t /dev/tty4, requires -u option.\n");
  	fprintf(stderr, "  -v, --verbose   Be verbose\n");
-@@ -754,7 +766,9 @@ main(int argc, char *argv[])
+@@ -760,7 +772,9 @@ main(int argc, char *argv[])
  	int i, c;
  	char *tty = NULL;
  	struct option opts[] = {
@@ -149,7 +150,7 @@ index 4962bd6..fc531c5 100644
  		{ "tty",     required_argument, NULL, 't' },
  		{ "verbose", no_argument,       NULL, 'v' },
  		{ "help",    no_argument,       NULL, 'h' },
-@@ -766,11 +780,16 @@ main(int argc, char *argv[])
+@@ -772,11 +786,16 @@ main(int argc, char *argv[])
  	while ((c = getopt_long(argc, argv, "u:t:vh", opts, &i)) != -1) {
  		switch (c) {
  		case 'u':
@@ -166,7 +167,7 @@ index 4962bd6..fc531c5 100644
  			break;
  		case 't':
  			tty = optarg;
-@@ -822,8 +841,10 @@ main(int argc, char *argv[])
+@@ -828,8 +847,10 @@ main(int argc, char *argv[])
  	if (setup_tty(&wl, tty) < 0)
  		exit(EXIT_FAILURE);
  
@@ -178,7 +179,7 @@ index 4962bd6..fc531c5 100644
  	if (setup_launcher_socket(&wl) < 0)
  		exit(EXIT_FAILURE);
 diff --git a/meson_options.txt b/meson_options.txt
-index d5bf1d5..254eb2b 100644
+index c862ecc..73ef2c3 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -73,6 +73,13 @@ option(
@@ -195,6 +196,3 @@ index d5bf1d5..254eb2b 100644
  	'xwayland',
  	type: 'boolean',
  	value: true,
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.0.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/weston_7.0.0.bb
rename to meta/recipes-graphics/wayland/weston_8.0.0.bb
index e6548d3..83aee87 100644
--- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "cbfda483bc2501d0831af3f33c707850"
-SRC_URI[sha256sum] = "a00a6d207b6a45f95f4401c604772a307c3767e5e2beecf3d879110c43909a64"
+SRC_URI[md5sum] = "53e4810d852df0601d01fd986a5b22b3"
+SRC_URI[sha256sum] = "7518b49b2eaa1c3091f24671bdcc124fd49fc8f1af51161927afa4329c027848"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
@@ -93,7 +93,8 @@ do_install_append() {
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)} \
              libweston-${WESTON_MAJOR_VERSION} ${PN}-examples"
 
-FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
+FILES_${PN}-dev += "${libdir}/${BPN}/libexec_weston.so"
+FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so* ${datadir}"
 
 FILES_libweston-${WESTON_MAJOR_VERSION} = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-${WESTON_MAJOR_VERSION}/*.so"
 SUMMARY_libweston-${WESTON_MAJOR_VERSION} = "Helper library for implementing 'wayland window managers'."
-- 
2.7.4


