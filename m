Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Subject: [RFC 2/2] gstreamer1.0: add support for running native test
Date: Thu, 17 Feb 2022 23:00:23 +0000
Message-Id: <20220217230023.727460-2-quaresma.jose@gmail.com>
In-Reply-To: <20220217230023.727460-1-quaresma.jose@gmail.com>
References: <20220217230023.727460-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>

This is an exmple of using the native meson test

gstreamer1.0-meson-qemuwrapper-test.inc
^ this is receipe part

meson-qemuwrapper-helper.sh
^ this is an helper script to skip unsupported tests

meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-show-the-reason-when-spawning-of-gst.patch
^ this patch helps debugind unsupported tests

With EXTRA_OEMESON_TEST = "gst_gstbin" it will only run
the gst_gstbin test and the output
is the following

+ meson_do_test
+ export GST_DEBUG=6
+ meson test -C /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build --print-errorlogs gst_gstbin

ninja: Entering directory `/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build'

ninja: no work to do.

1/1 gst_gstbin TIMEOUT        180.12s   killed by signal 15 SIGTERM

>>> GST_PLUGIN_SCANNER_1_0=/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build/libs/gst/helpers/gst-plugin-scanner GST_PLUGIN_LOADING_WHITELIST=gstreamer GST_STATE_IGNORE_ELEMENTS='' MESON_EXE_WRAPPER=/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/meson-qemuwrapper GST_PLUGIN_PATH_1_0=/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build MALLOC_PERTURB_=192 GST_REGISTRY=/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build/tests/check/gst_gstbin.registry CK_DEFAULT_TIMEOUT=20 GST_PLUGIN_SYSTEM_PATH_1_0='' /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/meson-qemuwrapper /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build/tests/check/gst_gstbin
――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
Listing only the last 100 lines from a long log.
0:00:07.719379569 440069   0x4000025400 DEBUG             GST_STATES gstbin.c:2990:gst_bin_change_state_func:<bin0> iterator done
0:00:07.719393717 440069   0x4000061180 LOG              GST_MESSAGE gstmessage.c:304:gst_message_new_custom: source fakesink0: creating new message 0x400c002100 latency
0:00:07.719413507 440069   0x4000025400 LOG               GST_STATES gstelement.c:3282:gst_element_change_state_func:<bin0> default handler tries setting state from PLAYING to PAUSED (0023)
0:00:07.719438100 440069   0x4000061180 DEBUG                GST_BUS gstbus.c:338:gst_bus_post:<bus0> [msg 0x400c002100] posting on bus latency message: 0x400c002100, time 99:99:99.999999999, seq-num 31, element 'fakesink0', (NULL)
0:00:07.719441024 440069   0x4000025400 DEBUG             GST_STATES gstbin.c:3006:gst_bin_change_state_func:<bin0> we have ASYNC elements SUCCESS -> ASYNC
0:00:07.719467032 440069   0x4000025400 DEBUG                    bin gstbin.c:2383:gst_bin_sort_iterator_free:<bin0>
.
.
.
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
Summary of Failures:

1/1 gst_gstbin TIMEOUT        180.12s   killed by signal 15 SIGTERM

Ok:                 0
Expected Fail:      0
Fail:               0
Unexpected Pass:    0
Skipped:            0
Timeout:            1

Full log written to /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build/meson-logs/testlog.txt

+ bb_sh_exit_handler

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer1.0-meson-qemuwrapper-test.inc   | 15 ++++++
 ...show-the-reason-when-spawning-of-gst.patch | 53 +++++++++++++++++++
 .../gstreamer1.0/meson-qemuwrapper-helper.sh  | 15 ++++++
 .../gstreamer/gstreamer1.0_1.20.0.bb          |  6 +++
 4 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemuwrapper-test.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-show-the-reason-when-spawning-of-gst.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemuwrapper-helper.sh

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemuwrapper-test.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemuwrapper-test.inc
new file mode 100644
index 0000000000..c9f4885f82
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemuwrapper-test.inc
@@ -0,0 +1,15 @@
+SRC_URI += "file://0001-gstpluginloader-show-the-reason-when-spawning-of-gst.patch;striplevel=3"
+SRC_URI += "file://meson-qemuwrapper-helper.sh"
+
+#MESON_QEMU_WRAPPER_HELPER = "${WORKDIR}/meson-qemuwrapper-helper.sh"
+
+PACKAGECONFIG[tests] = "-Dtests=enabled,-Dtests=disabled"
+
+# run single test
+EXTRA_OEMESON_TEST = "gst_gstbin"
+
+meson_do_test:prepend() {
+    # run the test with the debug mode enabled
+    # logs will be placed at build/meson-logs/testlog.txt
+    export GST_DEBUG=6
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-show-the-reason-when-spawning-of-gst.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-show-the-reason-when-spawning-of-gst.patch
new file mode 100644
index 0000000000..22c8750f5b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-show-the-reason-when-spawning-of-gst.patch
@@ -0,0 +1,53 @@
+From 8e1de3f84c2e654515b6d6b16783a4a08dfd118d Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Wed, 8 Dec 2021 22:13:15 +0000
+Subject: [PATCH] gstpluginloader: show the reason when spawning of
+ gst-plugin-scanner fail
+
+This fix helps in cross compiling when the meson tests runs using a qemu wraper
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1701>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/8e1de3f84c2e654515b6d6b16783a4a08dfd118d]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ subprojects/gstreamer/gst/gstpluginloader.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/subprojects/gstreamer/gst/gstpluginloader.c b/subprojects/gstreamer/gst/gstpluginloader.c
+index 10a446fa5e..fb8b45cffa 100644
+--- a/subprojects/gstreamer/gst/gstpluginloader.c
++++ b/subprojects/gstreamer/gst/gstpluginloader.c
+@@ -413,6 +413,7 @@ gst_plugin_loader_try_helper (GstPluginLoader * loader, gchar * location)
+ {
+   char *argv[6] = { NULL, };
+   int c = 0;
++  GError *error = NULL;
+ 
+ #if defined (__APPLE__) && defined (USR_BIN_ARCH_SWITCH)
+   if (gst_plugin_loader_use_usr_bin_arch ()) {
+@@ -432,11 +433,16 @@ gst_plugin_loader_try_helper (GstPluginLoader * loader, gchar * location)
+     GST_LOG ("Trying to spawn gst-plugin-scanner helper at %s", location);
+   }
+ 
+-  if (!g_spawn_async_with_pipes (NULL, argv, NULL,
+-          G_SPAWN_DO_NOT_REAP_CHILD /* | G_SPAWN_STDERR_TO_DEV_NULL */ ,
+-          NULL, NULL, &loader->child_pid, &loader->fd_w.fd, &loader->fd_r.fd,
+-          NULL, NULL))
++  g_spawn_async_with_pipes (NULL, argv, NULL,
++      G_SPAWN_DO_NOT_REAP_CHILD /* | G_SPAWN_STDERR_TO_DEV_NULL */ ,
++      NULL, NULL, &loader->child_pid, &loader->fd_w.fd, &loader->fd_r.fd,
++      NULL, &error);
++
++  if (error) {
++    GST_ERROR ("Spawning gst-plugin-scanner helper failed: %s", error->message);
++    g_clear_error (&error);
+     return FALSE;
++  }
+ 
+   gst_poll_add_fd (loader->fdset, &loader->fd_w);
+   gst_poll_add_fd (loader->fdset, &loader->fd_r);
+-- 
+2.35.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemuwrapper-helper.sh b/meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemuwrapper-helper.sh
new file mode 100644
index 0000000000..7f03f79292
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemuwrapper-helper.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+#set -x
+
+test="$(basename "$1")"
+
+# some tests currently fails so there we skipped the already knowns
+skipped="$skipped elements_dataurisrc"
+skipped="$skipped libs_gstnettimeprovider"
+skipped="$skipped gst_gstelement"
+skipped="$skipped gst_gstregistry"
+for s in $skipped; do
+    if [ "$s" = "$test" ]; then
+        exit 77
+    fi
+done
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
index 243f99fee9..38595b8789 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
@@ -70,3 +70,9 @@ FILES:${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 CVE_PRODUCT = "gstreamer"
 
 PTEST_BUILD_HOST_FILES = ""
+
+MESON_QEMU_WRAPPER_TEST_ENABLED = "1"
+
+GST_MESON_TEST = "${@"gstreamer1.0-meson-qemuwrapper-test.inc" if d.getVar('MESON_QEMU_WRAPPER_TEST_ENABLED') == '1' else ""}"
+
+require ${GST_MESON_TEST}
-- 
2.35.1

