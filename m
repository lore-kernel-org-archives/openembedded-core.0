Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88777745F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 06:35:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB66YVXL031989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Dec 2018 22:34:41 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 22:34:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <tanuk@iki.fi>
Date: Thu, 6 Dec 2018 14:34:18 +0800
Message-ID: <1544078058-38009-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] pulseaudio: improve reproducibility
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
X-List-Received-Date: Thu, 06 Dec 2018 06:35:34 -0000
Content-Type: text/plain

There are two fixes, one is sent to upstream,
and another is oe specific.

[YOCTO #12638]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-improve-reproducibility-build.patch       | 97 ++++++++++++++++++++++
 ...lay-CLFAGS-to-improve-reproducibility-bui.patch | 30 +++++++
 .../pulseaudio/pulseaudio_12.2.bb                  |  2 +
 3 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility-build.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility-build.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility-build.patch
new file mode 100644
index 0000000..2658100
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-improve-reproducibility-build.patch
@@ -0,0 +1,97 @@
+From 08e2195e9d110323ebeb7bf91dcf8e3f7870423f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 6 Dec 2018 11:30:13 +0800
+Subject: [PATCH 1/2] improve reproducibility build
+
+While running pulseaudio out of build dir (especially for cross
+compiling), we should not expose pulseaudio build path[1], it is
+helpful for reproducibility build[2].
+
+As commit introduced [3cae4a0 doc: Add info about running pulseaudio
+from the build dir], run pulseaudio from the build dir, __OPTIMIZE__
+should be diabled, so add macro checking to drop PA_SRCDIR/PA_BUILDDIR
+(in which contains build path) at precompilation.
+
+[1] https://reproducible-builds.org/docs/build-path/
+[2] https://reproducible-builds.org/
+
+Upstream-Status: Submitted [pulseaudio-discuss@lists.freedesktop.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/daemon/daemon-conf.c      | 4 +++-
+ src/modules/alsa/alsa-mixer.c | 4 ++++
+ src/pulsecore/core-util.c     | 4 +++-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/daemon/daemon-conf.c b/src/daemon/daemon-conf.c
+index 9883126..9d40896 100644
+--- a/src/daemon/daemon-conf.c
++++ b/src/daemon/daemon-conf.c
+@@ -155,12 +155,14 @@ pa_daemon_conf *pa_daemon_conf_new(void) {
+     c->dl_search_path = pa_sprintf_malloc("%s" PA_PATH_SEP "lib" PA_PATH_SEP "pulse-%d.%d" PA_PATH_SEP "modules",
+                                           pa_win32_get_toplevel(NULL), PA_MAJOR, PA_MINOR);
+ #else
++#if !defined(__OPTIMIZE__)
+     if (pa_run_from_build_tree()) {
+         pa_log_notice("Detected that we are run from the build tree, fixing search path.");
+         c->dl_search_path = pa_xstrdup(PA_BUILDDIR);
+     } else
+-        c->dl_search_path = pa_xstrdup(PA_DLSEARCHPATH);
+ #endif
++        c->dl_search_path = pa_xstrdup(PA_DLSEARCHPATH);
++#endif // Endof OS_IS_WIN32
+ 
+     return c;
+ }
+diff --git a/src/modules/alsa/alsa-mixer.c b/src/modules/alsa/alsa-mixer.c
+index a524d6d..a1eae79 100644
+--- a/src/modules/alsa/alsa-mixer.c
++++ b/src/modules/alsa/alsa-mixer.c
+@@ -2571,9 +2571,11 @@ static int path_verify(pa_alsa_path *p) {
+ }
+ 
+ static const char *get_default_paths_dir(void) {
++#if defined(__linux__) && !defined(__OPTIMIZE__)
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
++#if defined(__linux__) && !defined(__OPTIMIZE__)
+                               pa_run_from_build_tree() ? PA_SRCDIR "/modules/alsa/mixer/profile-sets/" :
++#endif
+                               PA_ALSA_PROFILE_SETS_DIR);
+ 
+     r = pa_config_parse(fn, NULL, items, NULL, false, ps);
+diff --git a/src/pulsecore/core-util.c b/src/pulsecore/core-util.c
+index 64e9f21..3267907 100644
+--- a/src/pulsecore/core-util.c
++++ b/src/pulsecore/core-util.c
+@@ -3436,15 +3436,17 @@ void pa_reset_personality(void) {
+ }
+ 
+ bool pa_run_from_build_tree(void) {
+-    char *rp;
+     static bool b = false;
+ 
++#if defined(__linux__) && !defined(__OPTIMIZE__)
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
index 36d92bc..922da07 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
@@ -2,6 +2,8 @@ require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
+           file://0001-improve-reproducibility-build.patch \
+           file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
            file://volatiles.04_pulse \
            "
 SRC_URI[md5sum] = "c42f1f1465e8df9859d023dc184734bf"
-- 
2.7.4


