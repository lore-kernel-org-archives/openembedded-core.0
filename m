Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 216F7755CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 18:52:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2015 11:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,477,1427785200"; d="scan'208";a="497168906"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com) ([10.252.3.49])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 11:52:12 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 21:51:54 +0300
Message-Id: <1746143daff17607effbe92b9aa9d06fb6b63723.1432320274.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH v3 3/5] pulseaudio: conf-parser: add support for .d directories
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
X-List-Received-Date: Fri, 22 May 2015 18:52:12 -0000

Sato images should set allow-autospawn-for-root=true in
/etc/pulse/client.conf, but in non-Sato images that option should be
disabled by default. I first tried to have two packages that ship
different versions of the client.conf file, but it turned out to be
tricky to ensure that the package manager always chooses the package
that provides the default version when the Sato package is not
explicitly requested. This patch allows the Sato specific
configuration to be installed in /etc/pulse/client.conf.d without
replacing the default version of client.conf, which makes packaging
much simpler.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 ...onf-parser-add-support-for-.d-directories.patch | 196 +++++++++++++++++++++
 .../pulseaudio/pulseaudio_6.0.bb                   |   1 +
 2 files changed, 197 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch
new file mode 100644
index 0000000..a9f1b2a
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch
@@ -0,0 +1,196 @@
+From 8cb643bbf0a287d67794e680d26f49c503f31053 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
+Date: Thu, 21 May 2015 21:00:59 +0300
+Subject: [PATCH] conf-parser: add support for .d directories
+
+This allows a configuration scheme where prior to loading
+configuration from "somefile", the parser first loads configuration
+from files in directory "somefile.d". This feature is currently
+enabled only for client.conf and daemon.conf.
+
+This makes it easier to create configuration packages in distributions
+when there's need to have different configuration in different setups.
+For example, the graphical Sato environment in OpenEmbedded-core needs
+to set allow-autospawn-for-root=true in client.conf, but the default
+configuration in OpenEmbedded-core should not set that option. With
+this patch, I can create a Sato-specific package that simply installs
+50-sato.conf in /etc/pulse/client.conf.d without conflicting with the
+main client.conf file coming from a different package.
+
+Upstream-Status: Submitted [http://thread.gmane.org/gmane.comp.audio.pulseaudio.general/23592]
+
+Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
+---
+ src/daemon/daemon-conf.c                |  2 +-
+ src/modules/alsa/alsa-mixer.c           |  4 ++--
+ src/modules/module-augment-properties.c |  2 +-
+ src/pulse/client-conf.c                 |  2 +-
+ src/pulsecore/conf-parser.c             | 42 +++++++++++++++++++++++++++++++--
+ src/pulsecore/conf-parser.h             |  8 ++++++-
+ 6 files changed, 52 insertions(+), 8 deletions(-)
+
+diff --git a/src/daemon/daemon-conf.c b/src/daemon/daemon-conf.c
+index 21a8edb..1332fc6 100644
+--- a/src/daemon/daemon-conf.c
++++ b/src/daemon/daemon-conf.c
+@@ -617,7 +617,7 @@ int pa_daemon_conf_load(pa_daemon_conf *c, const char *filename) {
+     ci.default_channel_map_set = ci.default_sample_spec_set = false;
+     ci.conf = c;
+ 
+-    r = f ? pa_config_parse(c->config_file, f, table, NULL, NULL) : 0;
++    r = f ? pa_config_parse(c->config_file, f, table, NULL, true, NULL) : 0;
+ 
+     if (r >= 0) {
+ 
+diff --git a/src/modules/alsa/alsa-mixer.c b/src/modules/alsa/alsa-mixer.c
+index 2314612..988b4fe 100644
+--- a/src/modules/alsa/alsa-mixer.c
++++ b/src/modules/alsa/alsa-mixer.c
+@@ -2483,7 +2483,7 @@ pa_alsa_path* pa_alsa_path_new(const char *paths_dir, const char *fname, pa_alsa
+ 
+     fn = pa_maybe_prefix_path(fname, paths_dir);
+ 
+-    r = pa_config_parse(fn, NULL, items, p->proplist, p);
++    r = pa_config_parse(fn, NULL, items, p->proplist, false, p);
+     pa_xfree(fn);
+ 
+     if (r < 0)
+@@ -4288,7 +4288,7 @@ pa_alsa_profile_set* pa_alsa_profile_set_new(const char *fname, const pa_channel
+                               pa_run_from_build_tree() ? PA_SRCDIR "/modules/alsa/mixer/profile-sets/" :
+                               PA_ALSA_PROFILE_SETS_DIR);
+ 
+-    r = pa_config_parse(fn, NULL, items, NULL, ps);
++    r = pa_config_parse(fn, NULL, items, NULL, false, ps);
+     pa_xfree(fn);
+ 
+     if (r < 0)
+diff --git a/src/modules/module-augment-properties.c b/src/modules/module-augment-properties.c
+index 42b6fd9..541f0e7 100644
+--- a/src/modules/module-augment-properties.c
++++ b/src/modules/module-augment-properties.c
+@@ -204,7 +204,7 @@ static void update_rule(struct rule *r) {
+     table[0].data = &r->application_name;
+     table[1].data = &r->icon_name;
+ 
+-    if (pa_config_parse(fn, NULL, table, NULL, r) < 0)
++    if (pa_config_parse(fn, NULL, table, NULL, false, r) < 0)
+         pa_log_warn("Failed to parse .desktop file %s.", fn);
+ 
+     pa_xfree(fn);
+diff --git a/src/pulse/client-conf.c b/src/pulse/client-conf.c
+index 83331f8..3c3384d 100644
+--- a/src/pulse/client-conf.c
++++ b/src/pulse/client-conf.c
+@@ -149,7 +149,7 @@ void pa_client_conf_load(pa_client_conf *c, bool load_from_x11, bool load_from_e
+ 
+     f = pa_open_config_file(DEFAULT_CLIENT_CONFIG_FILE, DEFAULT_CLIENT_CONFIG_FILE_USER, ENV_CLIENT_CONFIG_FILE, &fn);
+     if (f) {
+-        pa_config_parse(fn, f, table, NULL, NULL);
++        pa_config_parse(fn, f, table, NULL, true, NULL);
+         pa_xfree(fn);
+         fclose(f);
+     }
+diff --git a/src/pulsecore/conf-parser.c b/src/pulsecore/conf-parser.c
+index 2dcd45a..d473232 100644
+--- a/src/pulsecore/conf-parser.c
++++ b/src/pulsecore/conf-parser.c
+@@ -21,6 +21,7 @@
+ #include <config.h>
+ #endif
+ 
++#include <dirent.h>
+ #include <string.h>
+ #include <stdio.h>
+ #include <errno.h>
+@@ -103,7 +104,7 @@ static int parse_line(pa_config_parser_state *state) {
+             }
+         }
+ 
+-        r = pa_config_parse(fn, NULL, state->item_table, state->proplist, state->userdata);
++        r = pa_config_parse(fn, NULL, state->item_table, state->proplist, false, state->userdata);
+         pa_xfree(path);
+         return r;
+     }
+@@ -152,8 +153,13 @@ static int parse_line(pa_config_parser_state *state) {
+         return normal_assignment(state);
+ }
+ 
++static int conf_filter(const struct dirent *entry) {
++    return pa_endswith(entry->d_name, ".conf");
++}
++
+ /* Go through the file and parse each line */
+-int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_proplist *proplist, void *userdata) {
++int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_proplist *proplist, bool use_dot_d,
++                    void *userdata) {
+     int r = -1;
+     bool do_close = !f;
+     pa_config_parser_state state;
+@@ -163,6 +169,38 @@ int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_p
+ 
+     pa_zero(state);
+ 
++    if (use_dot_d) {
++        char *dir_name;
++        int n;
++        struct dirent **entries = NULL;
++
++        dir_name = pa_sprintf_malloc("%s.d", filename);
++
++        n = scandir(dir_name, &entries, conf_filter, alphasort);
++        if (n >= 0) {
++            int i;
++
++            for (i = 0; i < n; i++) {
++                char *filename2;
++
++                filename2 = pa_sprintf_malloc("%s" PA_PATH_SEP "%s", dir_name, entries[i]->d_name);
++                pa_config_parse(filename2, NULL, t, proplist, false, userdata);
++                pa_xfree(filename2);
++
++                free(entries[i]);
++            }
++
++            free(entries);
++        } else {
++            if (errno == ENOENT)
++                pa_log_debug("scandir(\"%s\") failed: %s", dir_name, pa_cstrerror(errno));
++            else
++                pa_log_warn("scandir(\"%s\") failed: %s", dir_name, pa_cstrerror(errno));
++        }
++
++        pa_xfree(dir_name);
++    }
++
+     if (!f && !(f = pa_fopen_cloexec(filename, "r"))) {
+         if (errno == ENOENT) {
+             pa_log_debug("Failed to open configuration file '%s': %s", filename, pa_cstrerror(errno));
+diff --git a/src/pulsecore/conf-parser.h b/src/pulsecore/conf-parser.h
+index dbb6f5c..cc20d7d 100644
+--- a/src/pulsecore/conf-parser.h
++++ b/src/pulsecore/conf-parser.h
+@@ -59,6 +59,11 @@ struct pa_config_parser_state {
+  * pa_config_items in *t that is terminated by an item where lvalue is
+  * NULL.
+  *
++ * If use_dot_d is true, then before parsing the file named by the filename
++ * argument, the function will parse all files ending with ".conf" in
++ * alphabetical order from a directory whose name is filename + ".d", if such
++ * directory exists.
++ *
+  * Some configuration files may contain a Properties section, which
+  * is a bit special. Normally all accepted lvalues must be predefined
+  * in the pa_config_item table, but in the Properties section the
+@@ -68,7 +73,8 @@ struct pa_config_parser_state {
+  * properties, and those properties will be merged into the given
+  * proplist. If proplist is NULL, then sections named "Properties"
+  * are not allowed at all in the configuration file. */
+-int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_proplist *proplist, void *userdata);
++int pa_config_parse(const char *filename, FILE *f, const pa_config_item *t, pa_proplist *proplist, bool use_dot_d,
++                    void *userdata);
+ 
+ /* Generic parsers for integers, size_t, booleans and strings */
+ int pa_config_parse_int(pa_config_parser_state *state);
+-- 
+1.9.3
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
index 465b224..10969bd 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
@@ -3,6 +3,7 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-padsp-Make-it-compile-on-musl.patch \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
+           file://0001-conf-parser-add-support-for-.d-directories.patch \
            file://volatiles.04_pulse \
 "
 SRC_URI[md5sum] = "b691e83b7434c678dffacfa3a027750e"
-- 
1.9.3


