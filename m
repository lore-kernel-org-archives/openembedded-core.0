Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.15376.1631124101919589639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kohQFR7B;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id d6so4511442wrc.11
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ego091PK22WI2BtwRjSDwr39ETzZk9FAJP7oxBEHy5I=;
        b=kohQFR7BGgUwghaE6jpoNwo1lNbvSufSHJF1D4jyj5snvuKyxgUrvGSOE7BcrscTpp
         FoxnOQoFJ68Q7fti/F/ujByhcxIaelJhbs/hD0iqGyenOXJXdCMEhRRGAPCaFr9hCCMs
         5dVGdqZ5XSnBNI7vm4J8y/ggrX5cyTrt3ZKGay020mguzgpkRqKR0ojaCNV13dOiPJk9
         94JCthTL2lg/qt+TgzanSazx5ZuPrvnkcFBTavuSsypBrQxw+YuyU4I/aF9JRCvGsw/q
         9nfYhvvEPTl0wW391DFXrdG8Cc8ii69pl3phEsJDji5KysauQY0+qi0A7cJQqsXQijnN
         mD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ego091PK22WI2BtwRjSDwr39ETzZk9FAJP7oxBEHy5I=;
        b=CTaaPPd4+nQBQLhpzvLHSawX5RYssfD9H4UWxGBK97jx1LHRiUeMMrYKfRzHk7pH7V
         oWCEka0GgZeRhBowk87tlD8eZhCIFQW0VITUxydIixvKVCzgJDPgWOqFBuFhT7aeNvFi
         hjiZSj0zIQx0SOu16/7kCntBHVRkKA1Ak7EvNYxwJ2DZ0XbPhswl6CePXo6VUGd1/+Qz
         3CRRJ3NbSOvfTaVd10oatkiukgdL6/R08Nna7PlP7UH4jZgLbZz/XQ0IKPhrVWbuPIC4
         2ogBQ4EroKCg3K8cJ/BNWG5ibaPMQdoBfMoTBQxwuj3oRwu7VW7GVg5ThJMQwebV3ANb
         80Tw==
X-Gm-Message-State: AOAM533yCW1A8w79DZKKGwZiDiTzNRK2/+KN6zqXQvBg/wLnzwVLdpTl
	KOLuQgQ8OBEft1cXC7anaDUQMrmuBCk=
X-Google-Smtp-Source: ABdhPJwpAj88P8YBNLhwhhbZ6DLxYiRxpA4jowgVJZgu+Atk2oOgkyIvuY5gXGPnZd2hKPyO+WKA/g==
X-Received: by 2002:adf:f143:: with SMTP id y3mr5429853wro.168.1631124100377;
        Wed, 08 Sep 2021 11:01:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/26] lttng: update 2.12 -> 2.13.0
Date: Wed,  8 Sep 2021 20:01:16 +0200
Message-Id: <20210908180125.103473-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Drop 0001-tests-regression-disable-the-tools-live-tests.patch
(mass-disabling of ptests) and replace that with more targeted fixes:

- a patch that adds explicit sleeps where races due to too tight timings
were observed (not a proper fix; upstream needs to figure out how
to sync explicitly and reliably)

- LD_LIBRARY_PATH so that helper binaries are able to find their
custom libraries they're linked with (we strip rpath from them
for reproducibility)

- set pgrep location explicitly as it used unconditionally
on target, but auto-detected (incorrectly) on the host

- enable kmod as it is available in target images

- correct various missing scripts, binaries, and inhibit stripping
where that is expected.

License-Update: license info consolidated in LICENSE
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-src-common-correct-header-location.patch | 41 +++++++++
 ...ression-disable-the-tools-live-tests.patch | 55 ------------
 ...more-before-analysing-traces-or-star.patch | 88 +++++++++++++++++++
 .../lttng/lttng-tools/run-ptest               |  1 +
 ...-tools_2.12.4.bb => lttng-tools_2.13.0.bb} | 22 +++--
 ...-common-link-with-liburcu-explicitly.patch | 25 ++++++
 ...Makefile.am-Add-install-lib-to-setup.patch | 22 +++--
 ...ttng-ust_2.12.2.bb => lttng-ust_2.13.0.bb} |  7 +-
 8 files changed, 185 insertions(+), 76 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-wait-some-more-before-analysing-traces-or-star.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.4.bb => lttng-tools_2.13.0.bb} (88%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.12.2.bb => lttng-ust_2.13.0.bb} (83%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch
new file mode 100644
index 0000000000..925b51c3ce
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-src-common-correct-header-location.patch
@@ -0,0 +1,41 @@
+From 790ef313364d1f1efb6f283705bb324eea2979ba Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 5 Sep 2021 10:13:08 +0200
+Subject: [PATCH] src/common: correct header location
+
+sys/unistd.h is not guaranteed to exist, and does not with
+e.g. musl C library.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/common/kernel-probe.c    | 2 +-
+ src/common/userspace-probe.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/common/kernel-probe.c b/src/common/kernel-probe.c
+index 2beb53f..44100bc 100644
+--- a/src/common/kernel-probe.c
++++ b/src/common/kernel-probe.c
+@@ -20,7 +20,7 @@
+ #include <lttng/kernel-probe.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ 
+ static
+ int lttng_kernel_probe_location_address_serialize(
+diff --git a/src/common/userspace-probe.c b/src/common/userspace-probe.c
+index 67b0ee6..66afc6f 100644
+--- a/src/common/userspace-probe.c
++++ b/src/common/userspace-probe.c
+@@ -20,7 +20,7 @@
+ #include <lttng/userspace-probe-internal.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+-#include <sys/unistd.h>
++#include <unistd.h>
+ 
+ static
+ int lttng_userspace_probe_location_function_set_binary_fd_handle(
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
deleted file mode 100644
index 08c1423310..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From de9fc501e775cae05f1f87534b4237cd78e8d9a8 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 24 Jan 2020 18:03:25 +0100
-Subject: [PATCH] tests/regression: disable the tools/live tests
-
-They have been found to sporadically fail; the issue has been
-reported upstream and they will work to investigate and fix:
-https://bugs.lttng.org/issues/1217
-
-Upstream-Status: Inappropriate [upstream is working on a real fix]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- tests/regression/Makefile.am | 10 +---------
- 1 file changed, 1 insertion(+), 9 deletions(-)
-
-diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index cbac90d..d467886 100644
---- a/tests/regression/Makefile.am
-+++ b/tests/regression/Makefile.am
-@@ -11,16 +11,10 @@ TESTS = tools/filtering/test_invalid_filter \
- 	tools/filtering/test_valid_filter \
- 	tools/streaming/test_ust \
- 	tools/health/test_thread_ok \
--	tools/live/test_ust \
--	tools/live/test_ust_tracefile_count \
--	tools/live/test_lttng_ust \
- 	tools/tracefile-limits/test_tracefile_count \
- 	tools/tracefile-limits/test_tracefile_size \
--	tools/exclusion/test_exclusion \
- 	tools/snapshots/test_ust_fast \
--	tools/snapshots/test_ust_streaming \
- 	tools/save-load/test_save \
--	tools/save-load/test_load \
- 	tools/save-load/test_autoload \
- 	tools/mi/test_mi \
- 	tools/wildcard/test_event_wildcard \
-@@ -38,8 +32,7 @@ TESTS = tools/filtering/test_invalid_filter \
- 	tools/working-directory/test_relayd_working_directory \
- 	tools/notification/test_notification_multi_app \
- 	tools/clear/test_ust \
--	tools/clear/test_kernel \
--	tools/tracker/test_event_tracker
-+	tools/clear/test_kernel
- 
- if HAVE_LIBLTTNG_UST_CTL
- SUBDIRS += ust
-@@ -60,7 +53,6 @@ TESTS += ust/before-after/test_before_after \
- 	ust/multi-lib/test_multi_lib \
- 	ust/rotation-destroy-flush/test_rotation_destroy_flush \
- 	ust/namespaces/test_ns_contexts \
--	ust/namespaces/test_ns_contexts_change \
- 	tools/metadata/test_ust \
- 	tools/relayd-grouping/test_ust
- endif # HAVE_LIBLTTNG_UST_CTL
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-wait-some-more-before-analysing-traces-or-star.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-wait-some-more-before-analysing-traces-or-star.patch
new file mode 100644
index 0000000000..c4cac9cc58
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-wait-some-more-before-analysing-traces-or-star.patch
@@ -0,0 +1,88 @@
+From 8d9daede0882d239b0a47b0f7a6db68ba4934a7d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sat, 4 Sep 2021 13:57:39 +0200
+Subject: [PATCH] tests: wait some more before analysing traces or starting
+ tracing
+
+Otherwise, there are sporadic race failures where lttng tracing
+is stopped before all expected events are collected or is started too soon, e.g.:
+
+PASS: tools/tracker/test_event_tracker 205 - Traced application stopped.
+PASS: tools/tracker/test_event_tracker 206 - Stop lttng tracing for session
+PASS: tools/tracker/test_event_tracker 207 - Destroy session tracker
+FAIL: tools/tracker/test_event_tracker 208 - Validate empty trace
+
+PASS: ust/namespaces/test_ns_contexts_change 42 - Stop lttng tracing for session mnt_ns
+PASS: ust/namespaces/test_ns_contexts_change 43 - Destroy session mnt_ns
+PASS: ust/namespaces/test_ns_contexts_change 44 - Wait after kill session daemon
+PASS: ust/namespaces/test_ns_contexts_change 45 - Validate trace for event mnt_ns = 4026531840, 1000 events
+PASS: ust/namespaces/test_ns_contexts_change 46 - Read a total of 1000 events, expected 1000
+PASS: ust/namespaces/test_ns_contexts_change 47 - Validate trace for event mnt_ns = 4026532303, 233 events
+FAIL: ust/namespaces/test_ns_contexts_change 48 - Read a total of 233 events, expected 1000
+
+This is a hack; issue should be fixed upstream with explicit syncs.
+It has been reported here: https://bugs.lttng.org/issues/1217
+
+Upstream-Status: Inappropriate [needs a real fix]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/regression/tools/tracker/test_event_tracker       | 8 ++++++++
+ tests/regression/ust/namespaces/test_ns_contexts_change | 2 ++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/regression/tools/tracker/test_event_tracker
+index feb3787..a0f2257 100755
+--- a/tests/regression/tools/tracker/test_event_tracker
++++ b/tests/regression/tools/tracker/test_event_tracker
+@@ -130,6 +130,8 @@ function test_event_vpid_tracker()
+ 
+ 	prepare_"$domain"_app
+ 
++sleep 5
++
+ 	start_lttng_tracing_ok
+ 
+ 	if [ "$expect_event" -eq 1 ]; then
+@@ -173,6 +175,8 @@ function test_event_pid_tracker()
+ 
+ 	prepare_"$domain"_app
+ 
++sleep 5
++
+ 	start_lttng_tracing_ok
+ 
+ 	if [ "$expect_event" -eq 1 ]; then
+@@ -275,6 +279,8 @@ function test_event_vpid_track_untrack()
+ 
+ 	prepare_"$domain"_app
+ 
++sleep 5
++
+ 	start_lttng_tracing_ok
+ 
+ 	lttng_track_"$domain"_ok "--vpid ${CHILD_PID}"
+@@ -315,6 +321,8 @@ function test_event_pid_track_untrack()
+ 
+ 	prepare_"$domain"_app
+ 
++sleep 5
++
+ 	start_lttng_tracing_ok
+ 
+ 	lttng_track_"$domain"_ok "--pid ${CHILD_PID}"
+diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/tests/regression/ust/namespaces/test_ns_contexts_change
+index c0af15e..b111bfe 100755
+--- a/tests/regression/ust/namespaces/test_ns_contexts_change
++++ b/tests/regression/ust/namespaces/test_ns_contexts_change
+@@ -79,6 +79,8 @@ function test_ns()
+ 
+ 	touch "$file_sync_before_last"
+ 
++sleep 5
++
+ 	# stop and destroy
+ 	stop_lttng_tracing_ok "$session_name"
+ 	destroy_lttng_session_ok "$session_name"
+-- 
+2.20.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
index eaa2e7b29d..c4dbe50f21 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -1,6 +1,7 @@
 #!/bin/sh
 # Without --ignore-exit, the tap harness causes any FAILs within a
 # test plan to raise ERRORs; this is just noise.
+export LD_LIBRARY_PATH=FIXMEPTESTPATH/tests/utils/testapp/userspace-probe-elf-binary/.libs
 makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=$PWD top_builddir=$PWD"
 make -k -t all >/dev/null 2>&1
 exec make -k -s $makeargs check 2>/dev/null | sed -e 's#/tmp/tmp\...........#/tmp/tmp.XXXXXXXXXX#g'
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
similarity index 88%
rename from meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
index ba26c15cdd..95bb2519d7 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
@@ -25,7 +25,7 @@ PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
                  PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
 "
-PACKAGECONFIG ??= "${LTTNGUST}"
+PACKAGECONFIG ??= "${LTTNGUST} kmod"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
 PACKAGECONFIG[lttng-ust] = "--with-lttng-ust, --without-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--with-kmod, --without-kmod, kmod"
@@ -35,14 +35,17 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-tests-do-not-strip-a-helper-library.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
-           file://0001-tests-regression-disable-the-tools-live-tests.patch \
            file://determinism.patch \
+           file://0001-src-common-correct-header-location.patch \
+           file://0001-tests-wait-some-more-before-analysing-traces-or-star.patch \
            "
 
-SRC_URI[sha256sum] = "d729f8c2373a41194f171aeb0da0a9bb35ac181f31afa7e260786d19a500dea1"
+SRC_URI[sha256sum] = "8dc894f9a7a840e943c1c344345c75f001a9529daa9157f1a0e6175c081c29e6"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
+CACHED_CONFIGUREVARS = "PGREP=/usr/bin/pgrep"
+
 SYSTEMD_SERVICE:${PN} = "lttng-sessiond.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
@@ -72,14 +75,18 @@ do_install_ptest () {
     for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng \
             tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh \
             tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh \
+            tests/regression/tools/notification/util_event_generator.sh \
             tests/regression/tools/base-path/*.lttng; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-    for f in config/tap-driver.sh config/test-driver src/common/config/session.xsd src/common/mi-lttng-4.0.xsd; do
+    for f in tests/utils/tap-driver.sh config/test-driver src/common/config/session.xsd src/common/mi-lttng-4.1.xsd; do
         install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
     done
 
+    # Patch in the correct path for the custom libraries a helper executable needs
+    sed -i -e 's!FIXMEPTESTPATH!${PTEST_PATH}!' "${D}${PTEST_PATH}/run-ptest"
+
     # Prevent 'make check' from recursing into non-test subdirectories.
     sed -i -e 's!^SUBDIRS = .*!SUBDIRS = tests!' "${D}${PTEST_PATH}/Makefile"
 
@@ -107,7 +114,7 @@ do_install_ptest () {
         for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
             cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
             case $f in
-                *.so)
+                *.so|userspace-probe-elf-binary)
                     install -d ${D}${PTEST_PATH}/tests/$d/
                     ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
                     # Remove any rpath/runpath to pass QA check.
@@ -175,3 +182,8 @@ do_install_ptest () {
         esac
     done
 }
+
+INHIBIT_PACKAGE_STRIP_FILES = "\
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \
+    "
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
new file mode 100644
index 0000000000..2d61dfa525
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with-liburcu-explicitly.patch
@@ -0,0 +1,25 @@
+From 2058584b7e87d6bd9d1765577766e0df7752232c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 5 Sep 2021 10:44:19 +0200
+Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
+
+Otherwise linking errors are seen on x86-32.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/lib/lttng-ust-common/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib/lttng-ust-common/Makefile.am b/src/lib/lttng-ust-common/Makefile.am
+index caeea2b..30febf0 100644
+--- a/src/lib/lttng-ust-common/Makefile.am
++++ b/src/lib/lttng-ust-common/Makefile.am
+@@ -15,6 +15,7 @@ liblttng_ust_common_la_SOURCES = \
+ 
+ liblttng_ust_common_la_LIBADD = \
+ 	$(top_builddir)/src/common/libcommon.la \
++        $(URCU_LIBS) \
+ 	$(DL_LIBS)
+ 
+ liblttng_ust_common_la_LDFLAGS = -no-undefined -version-info $(LTTNG_UST_LIBRARY_VERSION)
diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
index c2028d0e1a..fd9b6ea7ff 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
@@ -1,4 +1,4 @@
-From f79dac30af9adda12996da7f6aa6667d3b580537 Mon Sep 17 00:00:00 2001
+From dd1fdc841d069dbd4e284f430a88af79de951124 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 26 Sep 2019 17:54:00 +0800
 Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup.py
@@ -9,23 +9,21 @@ building.
 Upstream-Status: Submitted [https://github.com/lttng/lttng-ust/pull/59]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
- python-lttngust/Makefile.am | 2 +-
+ src/python-lttngust/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/python-lttngust/Makefile.am b/python-lttngust/Makefile.am
-index 6c0d20d..38b51b8 100644
---- a/python-lttngust/Makefile.am
-+++ b/python-lttngust/Makefile.am
-@@ -9,7 +9,7 @@ install-exec-local:
+diff --git a/src/python-lttngust/Makefile.am b/src/python-lttngust/Makefile.am
+index f95482d..f76d95b 100644
+--- a/src/python-lttngust/Makefile.am
++++ b/src/python-lttngust/Makefile.am
+@@ -32,7 +32,7 @@ install-exec-local: build-python-bindings.stamp
  	if [ "$(DESTDIR)" != "" ]; then \
  		opts="$$opts --root=$(DESTDIR)"; \
  	fi; \
--	$(PYTHON) setup.py install $$opts;
-+	$(PYTHON) setup.py install $$opts --install-lib=$(pythondir);
+-	$(PYTHON) $(builddir)/setup.py install $$opts;
++	$(PYTHON) $(builddir)/setup.py install $$opts --install-lib=$(pythondir);
  
  clean-local:
  	rm -rf $(builddir)/build
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
similarity index 83%
rename from meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
index 54a473d2cb..2074b8c318 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
@@ -4,9 +4,7 @@ HOMEPAGE = "http://lttng.org/ust"
 BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
 
 LICENSE = "LGPLv2.1+ & MIT & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
-                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
-                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a46577a38ad0c36ff6ff43ccf40c480f"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
@@ -31,9 +29,10 @@ PE = "2"
 
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
+           file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "bcd0f064b6ca88c72d84e760eac3472ae5c828411c634435922bee9fce359fc7"
+SRC_URI[sha256sum] = "54e4c933679cf6a07971dc5861ce57fc4876ab740ab612407b30b5fc85371750"
 
 CVE_PRODUCT = "ust"
 
-- 
2.31.1

