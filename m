Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D80756C0ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 02:44:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBC2i9uw025991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Dec 2018 18:44:09 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 11 Dec 2018 18:43:56 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <tanuk@iki.fi>
Date: Wed, 12 Dec 2018 10:43:54 +0800
Message-ID: <1544582634-36575-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V3] pulseaudio: improve reproducibility
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
X-List-Received-Date: Wed, 12 Dec 2018 02:44:20 -0000
Content-Type: text/plain

There are two fixes, one is sent to upstream,
and another is oe specific.

[YOCTO #12638]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   5 +-
 ...-special-build-flag-to-explicitly-disable.patch | 161 +++++++++++++++++++++
 ...lay-CLFAGS-to-improve-reproducibility-bui.patch |  30 ++++
 .../pulseaudio/pulseaudio_12.2.bb                  |   2 +
 4 files changed, 196 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-introduce-a-special-build-flag-to-explicitly-disable.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index f526690..91d9b8e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -76,8 +76,9 @@ EXTRA_OECONF = "\
 		--with-database=simple \
 		--without-zsh-completion-dir \
 		--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d \
-                ac_cv_header_valgrind_memcheck_h=no \
-                --disable-tests \
+		ac_cv_header_valgrind_memcheck_h=no \
+		--disable-tests \
+		--disable-running-from-build-tree \
 "
 
 # soxr (the SoX Resampler library) doesn't seem to be currently packaged in
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-introduce-a-special-build-flag-to-explicitly-disable.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-introduce-a-special-build-flag-to-explicitly-disable.patch
new file mode 100644
index 0000000..b7e9cd8
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-introduce-a-special-build-flag-to-explicitly-disable.patch
@@ -0,0 +1,161 @@
+From 36feb98e568221e24286615730888d5f6ff323f0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 7 Dec 2018 15:12:38 +0800
+Subject: [PATCH] introduce a special build flag to explicitly disables running
+ from build tree
+
+It is helpful to improve reproducibility build [1] since
+PA_SRCDIR/PA_BUILDDIR contains build path, disable running
+from build tree could drop these macros at precompilation.
+
+[1] https://reproducible-builds.org/
+
+Upstream-Status: Submitted [pulseaudio-discuss@lists.freedesktop.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Acked-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ configure.ac                             | 10 ++++++++++
+ src/daemon/daemon-conf.c                 |  4 +++-
+ src/daemon/main.c                        |  6 ++++++
+ src/modules/alsa/alsa-mixer.c            |  4 ++++
+ src/modules/gconf/module-gconf.c         |  2 +-
+ src/modules/gsettings/module-gsettings.c |  2 +-
+ src/pulsecore/core-util.c                |  4 +++-
+ 7 files changed, 28 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c9c414f..8b345ef 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -998,6 +998,16 @@ AS_IF([test "x$enable_asyncns" = "xyes" && test "x$HAVE_LIBASYNCNS" = "x0"],
+ AM_CONDITIONAL([HAVE_LIBASYNCNS], [test "x$HAVE_LIBASYNCNS" = x1])
+ AS_IF([test "x$HAVE_LIBASYNCNS" = "x1"], AC_DEFINE([HAVE_LIBASYNCNS], 1, [Have libasyncns?]))
+ 
++#### Running from build tree (optional) ####
++
++AC_ARG_ENABLE([running-from-build-tree],
++    AS_HELP_STRING([--disable-running-from-build-tree],[Disable running from build tree]))
++
++AS_IF([test "x$enable_running_from_build_tree" != "xno"],
++      AC_DEFINE([HAVE_RUNNING_FROM_BUILD_TREE], 1, [Have running from build tree]))
++
++AC_SUBST(HAVE_RUNNING_FROM_BUILD_TREE)
++
+ #### TCP wrappers (optional) ####
+ 
+ AC_ARG_ENABLE([tcpwrap],
+diff --git a/src/daemon/daemon-conf.c b/src/daemon/daemon-conf.c
+index 9883126..f01eff4 100644
+--- a/src/daemon/daemon-conf.c
++++ b/src/daemon/daemon-conf.c
+@@ -155,12 +155,14 @@ pa_daemon_conf *pa_daemon_conf_new(void) {
+     c->dl_search_path = pa_sprintf_malloc("%s" PA_PATH_SEP "lib" PA_PATH_SEP "pulse-%d.%d" PA_PATH_SEP "modules",
+                                           pa_win32_get_toplevel(NULL), PA_MAJOR, PA_MINOR);
+ #else
++#ifdef HAVE_RUNNING_FROM_BUILD_TREE
+     if (pa_run_from_build_tree()) {
+         pa_log_notice("Detected that we are run from the build tree, fixing search path.");
+         c->dl_search_path = pa_xstrdup(PA_BUILDDIR);
+     } else
+-        c->dl_search_path = pa_xstrdup(PA_DLSEARCHPATH);
+ #endif
++        c->dl_search_path = pa_xstrdup(PA_DLSEARCHPATH);
++#endif //Endof #ifdef OS_IS_WIN32
+ 
+     return c;
+ }
+diff --git a/src/daemon/main.c b/src/daemon/main.c
+index c80fa94..1e00388 100644
+--- a/src/daemon/main.c
++++ b/src/daemon/main.c
+@@ -932,6 +932,12 @@ int main(int argc, char *argv[]) {
+ 
+     pa_log_debug("Running in VM: %s", pa_yes_no(pa_running_in_vm()));
+ 
++#ifdef HAVE_RUNNING_FROM_BUILD_TREE
++    pa_log_debug("Running from build tree: %s", pa_yes_no(pa_run_from_build_tree()));
++#else
++    pa_log_debug("Running from build tree: no");
++#endif
++
+ #ifdef __OPTIMIZE__
+     pa_log_debug("Optimized build: yes");
+ #else
+diff --git a/src/modules/alsa/alsa-mixer.c b/src/modules/alsa/alsa-mixer.c
+index a524d6d..670f646 100644
+--- a/src/modules/alsa/alsa-mixer.c
++++ b/src/modules/alsa/alsa-mixer.c
+@@ -2571,9 +2571,11 @@ static int path_verify(pa_alsa_path *p) {
+ }
+ 
+ static const char *get_default_paths_dir(void) {
++#ifdef HAVE_RUNNING_FROM_BUILD_TREE
+     if (pa_run_from_build_tree())
+         return PA_SRCDIR "/modules/alsa/mixer/paths/";
+     else
++#endif
+         return PA_ALSA_PATHS_DIR;
+ }
+ 
+@@ -4455,7 +4457,9 @@ pa_alsa_profile_set* pa_alsa_profile_set_new(const char *fname, const pa_channel
+         fname = "default.conf";
+ 
+     fn = pa_maybe_prefix_path(fname,
++#ifdef HAVE_RUNNING_FROM_BUILD_TREE
+                               pa_run_from_build_tree() ? PA_SRCDIR "/modules/alsa/mixer/profile-sets/" :
++#endif
+                               PA_ALSA_PROFILE_SETS_DIR);
+ 
+     r = pa_config_parse(fn, NULL, items, NULL, false, ps);
+diff --git a/src/modules/gconf/module-gconf.c b/src/modules/gconf/module-gconf.c
+index c0f4dde..76a1f19 100644
+--- a/src/modules/gconf/module-gconf.c
++++ b/src/modules/gconf/module-gconf.c
+@@ -51,7 +51,7 @@ int pa__init(pa_module*m) {
+     u->buf_fill = 0;
+ 
+     if ((u->fd = pa_start_child_for_read(
+-#if defined(__linux__) && !defined(__OPTIMIZE__)
++#if defined(__linux__) && defined(HAVE_RUNNING_FROM_BUILD_TREE)
+                               pa_run_from_build_tree() ? PA_BUILDDIR "/gconf-helper" :
+ #endif
+                  PA_GCONF_HELPER, NULL, &u->pid)) < 0)
+diff --git a/src/modules/gsettings/module-gsettings.c b/src/modules/gsettings/module-gsettings.c
+index 330eca1..209c857 100644
+--- a/src/modules/gsettings/module-gsettings.c
++++ b/src/modules/gsettings/module-gsettings.c
+@@ -51,7 +51,7 @@ int pa__init(pa_module*m) {
+     u->buf_fill = 0;
+ 
+     if ((u->fd = pa_start_child_for_read(
+-#if defined(__linux__) && !defined(__OPTIMIZE__)
++#if defined(__linux__) && defined(HAVE_RUNNING_FROM_BUILD_TREE)
+                               pa_run_from_build_tree() ? PA_BUILDDIR "/gsettings-helper" :
+ #endif
+                  PA_GSETTINGS_HELPER, NULL, &u->pid)) < 0)
+diff --git a/src/pulsecore/core-util.c b/src/pulsecore/core-util.c
+index 64e9f21..f85dd20 100644
+--- a/src/pulsecore/core-util.c
++++ b/src/pulsecore/core-util.c
+@@ -3436,15 +3436,17 @@ void pa_reset_personality(void) {
+ }
+ 
+ bool pa_run_from_build_tree(void) {
+-    char *rp;
+     static bool b = false;
+ 
++#ifdef HAVE_RUNNING_FROM_BUILD_TREE
++    char *rp;
+     PA_ONCE_BEGIN {
+         if ((rp = pa_readlink("/proc/self/exe"))) {
+             b = pa_startswith(rp, PA_BUILDDIR);
+             pa_xfree(rp);
+         }
+     } PA_ONCE_END;
++#endif
+ 
+     return b;
+ }
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
new file mode 100644
index 0000000..43add75
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
@@ -0,0 +1,30 @@
+From f0ddd7c36556ad05c1398fdd132947323ad26473 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 6 Dec 2018 11:43:41 +0800
+Subject: [PATCH 2/2] do not display CLFAGS to improve reproducibility build
+
+Macro PA_CFLAGS contains build path, do not use it to
+display CFLAGS which could improve reproducibility build.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/daemon/main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/daemon/main.c b/src/daemon/main.c
+index c80fa94..75496be 100644
+--- a/src/daemon/main.c
++++ b/src/daemon/main.c
+@@ -908,7 +908,7 @@ int main(int argc, char *argv[]) {
+ 
+     pa_log_info("This is PulseAudio %s", PACKAGE_VERSION);
+     pa_log_debug("Compilation host: %s", CANONICAL_HOST);
+-    pa_log_debug("Compilation CFLAGS: %s", PA_CFLAGS);
++    pa_log_debug("Compilation CFLAGS: ***");
+ 
+ #ifdef HAVE_LIBSAMPLERATE
+     pa_log_warn("Compiled with DEPRECATED libsamplerate support!");
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
index 36d92bc..c020fbd 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
@@ -2,6 +2,8 @@ require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
+           file://0001-introduce-a-special-build-flag-to-explicitly-disable.patch \
+           file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
            file://volatiles.04_pulse \
            "
 SRC_URI[md5sum] = "c42f1f1465e8df9859d023dc184734bf"
-- 
2.7.4


