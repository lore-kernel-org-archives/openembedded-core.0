Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 60A5E78871
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 21:31:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2017 13:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,398,1508828400"; d="scan'208";a="12082178"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 13 Dec 2017 13:31:42 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 13:31:16 -0800
Message-Id: <1513200676-59900-5-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
References: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 4/4] pulseaudio: improve reproducibility
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
X-List-Received-Date: Wed, 13 Dec 2017 21:31:41 -0000

1. Remove build host references from CFLAGS in generated config.h file.
   They end up compiled in the image, but are only used for information.
2. Remove PA_BUILDDIR hardcoded references: safe to remove as we are guaranteed
   not to run from the build directory when the image is cross-compiled
3. Take care of any embedded __FILE__ strings, but only if the compiler supports
   -ffile-prefix-map option.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../pulseaudio/pulseaudio/no-builddir.patch        | 74 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_11.1.bb                  | 12 +++-
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/no-builddir.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/no-builddir.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/no-builddir.patch
new file mode 100644
index 0000000..fcef858
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/no-builddir.patch
@@ -0,0 +1,74 @@
+Improve reproducibility.
+Remove hard coded build host references (PA_BUILDDIR) from the cross-compiled
+image. For cross-compiled images we are guaranteed not to run from build directory.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+diff --git a/src/daemon/daemon-conf.c b/src/daemon/daemon-conf.c
+index f0ed0b4..94a56d3 100644
+--- a/src/daemon/daemon-conf.c
++++ b/src/daemon/daemon-conf.c
+@@ -153,11 +153,7 @@ pa_daemon_conf *pa_daemon_conf_new(void) {
+     c->dl_search_path = pa_sprintf_malloc("%s" PA_PATH_SEP "lib" PA_PATH_SEP "pulse-%d.%d" PA_PATH_SEP "modules",
+                                           pa_win32_get_toplevel(NULL), PA_MAJOR, PA_MINOR);
+ #else
+-    if (pa_run_from_build_tree()) {
+-        pa_log_notice("Detected that we are run from the build tree, fixing search path.");
+-        c->dl_search_path = pa_xstrdup(PA_BUILDDIR);
+-    } else
+-        c->dl_search_path = pa_xstrdup(PA_DLSEARCHPATH);
++    c->dl_search_path = pa_xstrdup(PA_DLSEARCHPATH);
+ #endif
+ 
+     return c;
+diff --git a/src/modules/alsa/alsa-mixer.c b/src/modules/alsa/alsa-mixer.c
+index 3dbf6b1..98cb738 100644
+--- a/src/modules/alsa/alsa-mixer.c
++++ b/src/modules/alsa/alsa-mixer.c
+@@ -2505,10 +2505,7 @@ static int path_verify(pa_alsa_path *p) {
+ }
+ 
+ static const char *get_default_paths_dir(void) {
+-    if (pa_run_from_build_tree())
+-        return PA_SRCDIR "/modules/alsa/mixer/paths/";
+-    else
+-        return PA_ALSA_PATHS_DIR;
++    return PA_ALSA_PATHS_DIR;
+ }
+ 
+ pa_alsa_path* pa_alsa_path_new(const char *paths_dir, const char *fname, pa_alsa_direction_t direction) {
+@@ -4383,9 +4380,7 @@ pa_alsa_profile_set* pa_alsa_profile_set_new(const char *fname, const pa_channel
+     if (!fname)
+         fname = "default.conf";
+ 
+-    fn = pa_maybe_prefix_path(fname,
+-                              pa_run_from_build_tree() ? PA_SRCDIR "/modules/alsa/mixer/profile-sets/" :
+-                              PA_ALSA_PROFILE_SETS_DIR);
++    fn = pa_maybe_prefix_path(fname, PA_ALSA_PROFILE_SETS_DIR);
+ 
+     r = pa_config_parse(fn, NULL, items, NULL, false, ps);
+     pa_xfree(fn);
+diff --git a/src/pulsecore/core-util.c b/src/pulsecore/core-util.c
+index 873f86a..937bac6 100644
+--- a/src/pulsecore/core-util.c
++++ b/src/pulsecore/core-util.c
+@@ -3397,17 +3397,7 @@ void pa_reset_personality(void) {
+ }
+ 
+ bool pa_run_from_build_tree(void) {
+-    char *rp;
+-    static bool b = false;
+-
+-    PA_ONCE_BEGIN {
+-        if ((rp = pa_readlink("/proc/self/exe"))) {
+-            b = pa_startswith(rp, PA_BUILDDIR);
+-            pa_xfree(rp);
+-        }
+-    } PA_ONCE_END;
+-
+-    return b;
++    return false;
+ }
+ 
+ const char *pa_get_temp_dir(void) {
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
index a50b5a0..c9c2d2d 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
@@ -5,10 +5,20 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://volatiles.04_pulse \
 "
+
+SRC_URI_append_class-target = " \
+           file://no-builddir.patch \
+"
+
 SRC_URI[md5sum] = "390de38231d5cdd6b43ada8939eb74f1"
 SRC_URI[sha256sum] = "f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e"
 
-do_compile_prepend() {
+inherit compiler-options
+
+do_compile() {
     mkdir -p ${S}/libltdl
+    sed -i -e 's|${DEBUG_PREFIX_MAP}||g' ${B}/config.h
     cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
+    cc_extra=$(file_prefix_map_option_supported ${CC})
+    oe_runmake CFLAGS="${CFLAGS} $cc_extra"
 }
-- 
2.7.4


