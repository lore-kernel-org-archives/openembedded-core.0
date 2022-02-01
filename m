Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [RFC PATCH 2/2] weston: upgrade 9.0.0 -> 10.0.0
Date: Tue,  1 Feb 2022 14:30:54 +0100
Message-Id: <20220201133054.3265186-2-alex@linutronix.de>
In-Reply-To: <20220201133054.3265186-1-alex@linutronix.de>
References: <20220201133054.3265186-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Marius Vlad <marius.vlad@collabora.com>, Daniel Stone <daniel.stone@collabora.com>, Chen Qi <Qi.Chen@windriver.com>, Denys Dmytriyenko <denys@ti.com>, Tom Hochstein <tom.hochstein@nxp.com>, Jussi Kukkonen <jussi.kukkonen@intel.com>, Ming Liu <ming.liu@toradex.com>

Upstream has deprecated both weston-launch and fbdev backend, so let's
not delay the inevitable and find replacements.

Fbdev can be replaced by passing --use-pixman to drm backend;
this will bypass the opengl paths and use CPU for rendering.
Apply where GL is too slow or unavailable.

weston-launch can be replaced by starting weston directly, with
a seat management daemon for support. This is provided either
by systemd, or on systemd-less systems, by seatd. The sysvinit
startup scripts and tests have been rewritten accordingly. Bonus
fix: under sysvinit weston now starts under weston user as it should,
and not under root.

Upstream discussion:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/runtime/cases/weston.py         |   6 +-
 .../recipes-graphics/wayland/weston-init/init |   2 +-
 .../wayland/weston-init/weston-start          |  30 +--
 ...d-drm-Re-order-gbm-destruction-at-DR.patch |  50 -----
 ...001-meson.build-fix-incorrect-header.patch |  32 ---
 ...ntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch |  47 -----
 ...ovide-a-default-version-that-doesn-t.patch | 199 ------------------
 .../weston/dont-use-plane-add-prop.patch      |  13 +-
 .../{weston_9.0.0.bb => weston_9.0.93.bb}     |  50 +++--
 9 files changed, 52 insertions(+), 377 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
 rename meta/recipes-graphics/wayland/{weston_9.0.0.bb => weston_9.0.93.bb} (79%)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index b3a7c2776d..b81cc299ef 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -10,7 +10,7 @@ import threading
 import time
 
 class WestonTest(OERuntimeTestCase):
-    weston_log_file = '/tmp/weston.log'
+    weston_log_file = '/tmp/weston-2.log'
 
     @classmethod
     def tearDownClass(cls):
@@ -31,13 +31,13 @@ class WestonTest(OERuntimeTestCase):
         return output.split(" ")
 
     def get_weston_command(self, cmd):
-        return 'export XDG_RUNTIME_DIR=/run/user/0; export WAYLAND_DISPLAY=wayland-0; %s' % cmd
+        return 'export XDG_RUNTIME_DIR=/run/user/`id -u weston`; export WAYLAND_DISPLAY=wayland-1; %s' % cmd
 
     def run_weston_init(self):
         if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
             self.target.run('systemd-run --collect --unit=weston-ptest.service --uid=0 -p PAMName=login -p TTYPath=/dev/tty6 -E XDG_RUNTIME_DIR=/tmp -E WAYLAND_DISPLAY=wayland-0 /usr/bin/weston --socket=wayland-1 --log=%s' % self.weston_log_file)
         else:
-            self.target.run(self.get_weston_command('openvt -- weston --socket=wayland-1 --log=%s' % self.weston_log_file))
+            self.target.run(self.get_weston_command('openvt -- weston --socket=wayland-2 --log=%s' % self.weston_log_file))
 
     def get_new_wayland_processes(self, existing_wl_processes):
         try_cnt = 0
diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index a849f29bcb..d3b0d1873e 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -32,7 +32,7 @@ case "$1" in
         . /etc/profile
 	export HOME=ROOTHOME
 
-        weston-start -- $OPTARGS
+        WESTON_USER=weston weston-start $OPTARGS &
   ;;
 
   stop)
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 0f1bc4c29d..01670cd4f5 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -6,7 +6,7 @@ export PATH="/sbin:/usr/sbin:/bin:/usr/bin"
 
 usage() {
 	cat <<EOF
-	$0 [<openvt arguments>] [-- <weston options>]
+	$0 [<weston options>]
 EOF
 }
 
@@ -18,11 +18,6 @@ add_weston_argument() {
 	weston_args="$weston_args $1"
 }
 
-# Add openvt extra argument
-add_openvt_argument() {
-	openvt_args="$openvt_args $1"
-
-}
 ## Add module to --modules argument
 add_weston_module() {
 	if [[ "x${weston_modules}" == "x" ]]; then
@@ -37,33 +32,12 @@ if [ -n "$WAYLAND_DISPLAY" ]; then
 fi
 
 if [ -n "$WESTON_USER" ]; then
-	if [ -z "$WESTON_TTY" ]; then
-		echo "ERROR: If you have WESTON_USER variable set, you also need WESTON_TTY."
-		exit 1
-	fi
 	if [ -z "$WESTON_GROUP" ]; then
 		# no explicit WESTON_GROUP given, therefore use WESTON_USER
 		export WESTON_GROUP="${WESTON_USER}"
 	fi
-	weston_args_user="-u $WESTON_USER -t $WESTON_TTY"
 fi
 
-if [ -n "$DISPLAY" ]; then
-	launcher="weston"
-else
-	launcher="weston-launch $weston_args_user --"
-fi
-
-openvt_args="-s"
-while [ -n "$1" ]; do
-	if [ "$1" = "--" ]; then
-		shift
-		break
-	fi
-	openvt_args="$openvt_args $1"
-	shift
-done
-
 weston_args=$*
 
 # Load and run modules
@@ -94,4 +68,4 @@ if test -z "$XDG_RUNTIME_DIR"; then
 	fi
 fi
 
-exec openvt $openvt_args -- $launcher $weston_args --log=@LOCALSTATEDIR@/log/weston.log
+su -c "XDG_RUNTIME_DIR=/run/user/`id -u ${WESTON_USER}` weston $weston_args --log=/tmp/weston.log" $WESTON_USER
diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch
deleted file mode 100644
index f8f7589499..0000000000
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From c8bfa1f8d576cdc6d515dbbac36c48c6166be0d5 Mon Sep 17 00:00:00 2001
-From: Marius Vlad <marius.vlad@collabora.com>
-Date: Thu, 1 Apr 2021 00:12:00 +0300
-Subject: [PATCH] libweston/backend-drm: Re-order gbm destruction at DRM-backend tear down
-
-Tearing down the drm-backend when there are no input devices, would call
-for the gbm device destruction before compositor shutdown. The latter
-would call into the renderer detroy function and assume that the
-EGLDisplay, which was created using the before-mentioned gbm device, is
-still available. This patch re-orders the gbm destruction after the
-compositor shutdown when no one would make use of it.
-
-Fixes: #314
-
-Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
-Suggested-by: Daniel Stone <daniel.stone@collabora.com>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/wayland/weston/-/commit/d171c7b3ba346c4d0bd6494f45ebf0be3c3cc5fb]
----
- libweston/backend-drm/drm.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
-index 2780f3b..fbcfeca 100644
---- a/libweston/backend-drm/drm.c
-+++ b/libweston/backend-drm/drm.c
-@@ -3025,10 +3025,6 @@ err_drm_source:
- err_udev_input:
- 	udev_input_destroy(&b->input);
- err_sprite:
--#ifdef BUILD_DRM_GBM
--	if (b->gbm)
--		gbm_device_destroy(b->gbm);
--#endif
- 	destroy_sprites(b);
- err_udev_dev:
- 	udev_device_unref(drm_device);
-@@ -3038,6 +3034,10 @@ err_launcher:
- 	weston_launcher_destroy(compositor->launcher);
- err_compositor:
- 	weston_compositor_shutdown(compositor);
-+#ifdef BUILD_DRM_GBM
-+	if (b->gbm)
-+		gbm_device_destroy(b->gbm);
-+#endif
- 	free(b);
- 	return NULL;
- }
---
-2.33.0
diff --git a/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch b/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch
deleted file mode 100644
index 06e0f7baec..0000000000
--- a/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a2ba4714a6872e547621d29d9ddcb0f374b88cf6 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 20 Apr 2021 20:42:18 -0700
-Subject: [PATCH] meson.build: fix incorrect header
-
-The wayland.c actually include 'xdg-shell-client-protocol.h' instead of
-the server one, so fix it. Otherwise, it's possible to get build failure
-due to race condition.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- libweston/backend-wayland/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libweston/backend-wayland/meson.build b/libweston/backend-wayland/meson.build
-index 7e82513..29270b5 100644
---- a/libweston/backend-wayland/meson.build
-+++ b/libweston/backend-wayland/meson.build
-@@ -10,7 +10,7 @@ srcs_wlwl = [
- 	fullscreen_shell_unstable_v1_protocol_c,
- 	presentation_time_protocol_c,
- 	presentation_time_server_protocol_h,
--	xdg_shell_server_protocol_h,
-+	xdg_shell_client_protocol_h,
- 	xdg_shell_protocol_c,
- ]
- 
--- 
-2.30.2
-
diff --git a/meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch b/meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
deleted file mode 100644
index 6fe86ff3f0..0000000000
--- a/meta/recipes-graphics/wayland/weston/0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 58760e09eed662a72da939ff4802d605489cff8e Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 8 Sep 2020 19:37:42 -0400
-Subject: [PATCH] tests: include fcntl.h for open(), O_RDWR, O_CLOEXEC and
- O_CREAT
-
-musl libc (unlike glibc) requires explicitly incuding fcntl.h to define open(),
-O_RDWR, O_CLOEXEC and O_CREAT. Otherwise the build fails with the errors:
-
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c: In function 'wait_for_lock':
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:7: warning: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
-|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
-|       |       ^~~~
-|       |       popen
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: error: 'O_RDWR' undeclared (first use in this function)
-|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
-|       |                       ^~~~~~
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:23: note: each undeclared identifier is reported only once for each function it appears in
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:32: error: 'O_CLOEXEC' undeclared (first use in this function)
-|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
-|       |                                ^~~~~~~~~
-| ../weston-9.0.0/tests/weston-test-fixture-compositor.c:135:44: error: 'O_CREAT' undeclared (first use in this function)
-|   135 |  fd = open(lock_path, O_RDWR | O_CLOEXEC | O_CREAT, 00700);
-|       |                                            ^~~~~~~
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/493/diffs?commit_id=b10c0e843dcb8148bbe869bb15261955b94ac98c]
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- tests/weston-test-fixture-compositor.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/weston-test-fixture-compositor.c b/tests/weston-test-fixture-compositor.c
-index 0c9855f..e0e32c9 100644
---- a/tests/weston-test-fixture-compositor.c
-+++ b/tests/weston-test-fixture-compositor.c
-@@ -31,6 +31,7 @@
- #include <unistd.h>
- #include <sys/file.h>
- #include <errno.h>
-+#include <fcntl.h>
- 
- #include "shared/helpers.h"
- #include "weston-test-fixture-compositor.h"
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
deleted file mode 100644
index f6ebfd8f61..0000000000
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ /dev/null
@@ -1,199 +0,0 @@
-From a1548c742bf2dedbb47282d8a00407b60bbab669 Mon Sep 17 00:00:00 2001
-From: Tom Hochstein <tom.hochstein@nxp.com>
-Date: Wed, 22 Feb 2017 15:53:30 +0200
-Subject: [PATCH] weston-launch: Provide a default version that doesn't require
-
- PAM
-
-weston-launch requires PAM for starting weston as a non-root user.
-
-Since starting weston as root is a valid use case by itself, if
-PAM is not available, provide a default version of weston-launch
-without non-root-user support.
-
-Upstream-Status: Denied [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725]
-
-Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-Signed-off-by: Ming Liu <ming.liu@toradex.com>
-
----
- libweston/meson.build     | 16 ++++++++++++----
- libweston/weston-launch.c | 21 +++++++++++++++++++++
- meson_options.txt         |  7 +++++++
- 3 files changed, 40 insertions(+), 4 deletions(-)
-
-diff --git a/libweston/meson.build b/libweston/meson.build
-index 08d23ec..cb9fd3f 100644
---- a/libweston/meson.build
-+++ b/libweston/meson.build
-@@ -216,16 +216,24 @@ dep_vertex_clipping = declare_dependency(
- )
- 
- if get_option('weston-launch')
--	dep_pam = cc.find_library('pam')
-+	deps_weston_launch = [systemd_dep, dep_libdrm]
- 
--	if not cc.has_function('pam_open_session', dependencies: dep_pam)
--		error('pam_open_session not found for weston-launch')
-+	if get_option('pam')
-+		dep_pam = cc.find_library('pam')
-+		if not cc.has_function('pam_open_session', dependencies: dep_pam)
-+			error('pam_open_session not found for weston-launch')
-+		endif
-+
-+		if dep_pam.found()
-+			deps_weston_launch += dep_pam
-+			config_h.set('HAVE_PAM', '1')
-+		endif
- 	endif
- 
- 	executable(
- 		'weston-launch',
- 		'weston-launch.c',
--		dependencies: [dep_pam, systemd_dep, dep_libdrm],
-+		dependencies: deps_weston_launch,
- 		include_directories: common_inc,
- 		install: true
- 	)
-diff --git a/libweston/weston-launch.c b/libweston/weston-launch.c
-index 521cb2c..2d42d33 100644
---- a/libweston/weston-launch.c
-+++ b/libweston/weston-launch.c
-@@ -51,7 +51,9 @@
- 
- #include <pwd.h>
- #include <grp.h>
-+#ifdef HAVE_PAM
- #include <security/pam_appl.h>
-+#endif
- 
- #ifdef HAVE_SYSTEMD_LOGIN
- #include <systemd/sd-login.h>
-@@ -100,8 +102,10 @@ drmSetMaster(int drm_fd)
- #endif
- 
- struct weston_launch {
-+#ifdef HAVE_PAM
- 	struct pam_conv pc;
- 	pam_handle_t *ph;
-+#endif
- 	int tty;
- 	int ttynr;
- 	int sock[2];
-@@ -192,6 +196,7 @@ weston_launch_allowed(struct weston_launch *wl)
- 	return false;
- }
- 
-+#ifdef HAVE_PAM
- static int
- pam_conversation_fn(int msg_count,
- 		    const struct pam_message **messages,
-@@ -232,6 +237,7 @@ setup_pam(struct weston_launch *wl)
- 
- 	return 0;
- }
-+#endif
- 
- static int
- setup_launcher_socket(struct weston_launch *wl)
-@@ -466,6 +472,7 @@ quit(struct weston_launch *wl, int status)
- 	close(wl->signalfd);
- 	close(wl->sock[0]);
- 
-+#ifdef HAVE_PAM
- 	if (wl->new_user) {
- 		err = pam_close_session(wl->ph, 0);
- 		if (err)
-@@ -473,6 +480,7 @@ quit(struct weston_launch *wl, int status)
- 				err, pam_strerror(wl->ph, err));
- 		pam_end(wl->ph, err);
- 	}
-+#endif
- 
- 	/*
- 	 * Get a fresh handle to the tty as the previous one is in
-@@ -710,6 +718,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
- 	setenv("HOME", wl->pw->pw_dir, 1);
- 	setenv("SHELL", wl->pw->pw_shell, 1);
- 
-+#ifdef HAVE_PAM
- 	env = pam_getenvlist(wl->ph);
- 	if (env) {
- 		for (i = 0; env[i]; ++i) {
-@@ -718,6 +727,7 @@ setup_session(struct weston_launch *wl, char **child_argv)
- 		}
- 		free(env);
- 	}
-+#endif
- 
- 	/*
- 	 * We open a new session, so it makes sense
-@@ -789,8 +799,10 @@ static void
- help(const char *name)
- {
- 	fprintf(stderr, "Usage: %s [args...] [-- [weston args..]]\n", name);
-+#ifdef HAVE_PAM
- 	fprintf(stderr, "  -u, --user      Start session as specified username,\n"
- 			"                  e.g. -u joe, requires root.\n");
-+#endif
- 	fprintf(stderr, "  -t, --tty       Start session on alternative tty,\n"
- 			"                  e.g. -t /dev/tty4, requires -u option.\n");
- 	fprintf(stderr, "  -v, --verbose   Be verbose\n");
-@@ -804,7 +816,9 @@ main(int argc, char *argv[])
- 	int i, c;
- 	char *tty = NULL;
- 	struct option opts[] = {
-+#ifdef HAVE_PAM
- 		{ "user",    required_argument, NULL, 'u' },
-+#endif
- 		{ "tty",     required_argument, NULL, 't' },
- 		{ "verbose", no_argument,       NULL, 'v' },
- 		{ "help",    no_argument,       NULL, 'h' },
-@@ -816,11 +830,16 @@ main(int argc, char *argv[])
- 	while ((c = getopt_long(argc, argv, "u:t:vh", opts, &i)) != -1) {
- 		switch (c) {
- 		case 'u':
-+#ifdef HAVE_PAM
- 			wl.new_user = optarg;
- 			if (getuid() != 0) {
- 				fprintf(stderr, "weston: Permission denied. -u allowed for root only\n");
- 				exit(EXIT_FAILURE);
- 			}
-+#else
-+			fprintf(stderr, "weston: -u is unsupported in this weston-launch build\n");
-+			exit(EXIT_FAILURE);
-+#endif
- 			break;
- 		case 't':
- 			tty = optarg;
-@@ -872,8 +891,10 @@ main(int argc, char *argv[])
- 	if (setup_tty(&wl, tty) < 0)
- 		exit(EXIT_FAILURE);
- 
-+#ifdef HAVE_PAM
- 	if (wl.new_user && setup_pam(&wl) < 0)
- 		exit(EXIT_FAILURE);
-+#endif
- 
- 	if (setup_launcher_socket(&wl) < 0)
- 		exit(EXIT_FAILURE);
-diff --git a/meson_options.txt b/meson_options.txt
-index 239bd2d..99e4ec3 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -73,6 +73,13 @@ option(
- )
- 
- option(
-+	'pam',
-+	type: 'boolean',
-+	value: true,
-+	description: 'Define if PAM is available'
-+)
-+
-+option(
- 	'xwayland',
- 	type: 'boolean',
- 	value: true,
diff --git a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch b/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
index a4444e5d18..c2486b90bf 100644
--- a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
+++ b/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
@@ -1,4 +1,7 @@
-Fix atomic modesetting with musl
+From 2501702805a1ba669c546111f1a4840e49a29d75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Sep 2020 14:04:04 -0700
+Subject: [PATCH] Fix atomic modesetting with musl
 
 atomic modesetting seems to fail with drm weston backend and this patch fixes
 it, below errors are seen before weston exits
@@ -8,9 +11,15 @@ atomic: couldn't commit new state: Invalid argument
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/issues/158]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+---
+ libweston/backend-drm/kms.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libweston/backend-drm/kms.c b/libweston/backend-drm/kms.c
+index 780d007..9994da1 100644
 --- a/libweston/backend-drm/kms.c
 +++ b/libweston/backend-drm/kms.c
-@@ -1168,8 +1168,8 @@ drm_pending_state_apply_atomic(struct dr
+@@ -1142,8 +1142,8 @@ drm_pending_state_apply_atomic(struct drm_pending_state *pending_state,
  		wl_list_for_each(plane, &b->plane_list, link) {
  			drm_debug(b, "\t\t[atomic] starting with plane %lu disabled\n",
  				  (unsigned long) plane->plane_id);
diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.93.bb
similarity index 79%
rename from meta/recipes-graphics/wayland/weston_9.0.0.bb
rename to meta/recipes-graphics/wayland/weston_9.0.93.bb
index 59ab217a3b..88fd859e72 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.93.bb
@@ -1,24 +1,43 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- libweston/compositor.c
+# +++ libweston/compositor.c
+# @@ -1,7 +1,7 @@
+#  /*
+#   * Copyright © 2010-2011 Intel Corporation
+#   * Copyright © 2008-2011 Kristian Høgsberg
+# - * Copyright © 2012-2018 Collabora, Ltd.
+# + * Copyright © 2012-2018, 2021 Collabora, Ltd.
+#   * Copyright © 2017, 2018 General Electric Company
+#   *
+#   * Permission is hereby granted, free of charge, to any person obtaining
+# 
+#
+
 SUMMARY = "Weston, a Wayland compositor"
 DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
 HOMEPAGE = "http://wayland.freedesktop.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
-                    file://libweston/compositor.c;endline=27;md5=6c53bbbd99273f4f7c4affa855c33c0a"
+                    file://libweston/compositor.c;endline=27;md5=eb6d5297798cabe2ddc65e2af519bcf0 \
+                    "
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
            file://systemd-notify.weston-start \
-           file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
-           file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch \
-           file://0001-meson.build-fix-incorrect-header.patch \
-           file://0001-libweston-backend-drm-Re-order-gbm-destruction-at-DR.patch \
-"
+           "
 
 SRC_URI:append:libc-musl = " file://dont-use-plane-add-prop.patch "
 
-SRC_URI[sha256sum] = "5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbdabbdebe83e1f83aa098fe"
+SRC_URI[sha256sum] = "4536cf68f320d260a891871f3607b93d8cc9111fbb12df1e0460d26490129ef7"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
@@ -32,15 +51,16 @@ DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'lto', '-Wl,-z,undefs', '', d)}"
 
-WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
+#WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
+WESTON_MAJOR_VERSION = "10"
 
-EXTRA_OEMESON += "-Dbackend-default=auto -Dpipewire=false"
+EXTRA_OEMESON += "-Dpipewire=false"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl clients', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayland egl clients', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd x11', d)} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
                    ${@bb.utils.contains_any('DISTRO_FEATURES', 'wayland x11', '', 'headless', d)} \
-                   launch \
+                   ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'sysvinit', 'launcher-libseat', '', d)} \
                    image-jpeg \
                    screenshare \
                    shell-desktop \
@@ -59,7 +79,7 @@ PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libx
 # Headless Weston
 PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
 # Weston on framebuffer
-PACKAGECONFIG[fbdev] = "-Dbackend-fbdev=true,-Dbackend-fbdev=false,udev mtdev"
+PACKAGECONFIG[fbdev] = "-Ddeprecated-backend-fbdev=true,-Ddeprecated-backend-fbdev=false,udev mtdev"
 # Weston on RDP
 PACKAGECONFIG[rdp] = "-Dbackend-rdp=true,-Dbackend-rdp=false,freerdp"
 # weston-launch
@@ -82,8 +102,6 @@ PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-color
 PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
 PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0 gstreamer1.0-plugins-base"
-# Weston with PAM support
-PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
 # Weston with screen-share support
 PACKAGECONFIG[screenshare] = "-Dscreenshare=true,-Dscreenshare=false"
 # Traditional desktop shell
@@ -94,6 +112,8 @@ PACKAGECONFIG[shell-fullscreen] = "-Dshell-fullscreen=true,-Dshell-fullscreen=fa
 PACKAGECONFIG[shell-ivi] = "-Dshell-ivi=true,-Dshell-ivi=false"
 # JPEG image loading support
 PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
+# support libseat based launch
+PACKAGECONFIG[launcher-libseat] = "-Dlauncher-libseat=true,-Dlauncher-libseat=false,seatd"
 
 do_install:append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.20.1

