Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18170C7EE2D
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:23:54 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.39154.1683653031827222728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ogji8atM;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9661a1ff1e9so568237266b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653030; x=1686245030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RX8QW5/cMGoCSjfXJ+BHPgzn3sH1a4kHSLIXapjRU6A=;
        b=Ogji8atM4ZJaL2QvdWJEwv+Y9E8wITpeVhtWVIjfUg5oakt9+WIY0cCUGk8mR0Iy+P
         lyPJYr6bKcbPxPiWl4jORTAysH6rHKW9nwK9tEmHwWPbrcUD3Wv4YaFWMf4RphmryFtc
         gNuEbR9Xi2Fr6MCmHVgPOqTJVls4RGXN2jTIYxJwBxelwzv4xmBplaY571K+gjIuJuDD
         w5vyqhEsHTcNWJrMFxadVXdx9fAk+R+bpKbcJX7lDusZjkgcRO/msVYtO/pVFbc4Kwnm
         Ekr+MgJHYOyexLbPBy1gJArErx36UoJ/DFeeBVU4WXEI4xksa5pT02Y0x5iKOOsXxLE1
         QVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653030; x=1686245030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RX8QW5/cMGoCSjfXJ+BHPgzn3sH1a4kHSLIXapjRU6A=;
        b=hpbo36WF66c2psilEhVedoSMRPbau94ZZPFJTeaKHn5RRDLHpA08Yaqh1DIdjCCWeD
         +uoETn2cOL04KnsqtMT2F95J7OONr0pzVSIJUEIXCdNxGNvv0T1/Hy4hnMdrWhWP0Gdq
         nYBQewImReTX4Fd7y0Qxvd0RZoo3V+xwodNkCqUu1piL8hlONqu1Nhg8u11alQX33Hr2
         5aJiNivBrzmNQacvsYhhKln3Uh8c1wdMH4GZKlBDOyBt7aoAHIIMISybMJ4dxlPITPTe
         P1x2eYgF3iK/mjkUtd5AWpCc5wXe/1Qq0N7z8KPe6QFh95zyjLX0dCMXJCi90U2dKNBn
         i5EA==
X-Gm-Message-State: AC+VfDw27r9QrCJjs+NaOqfPEA7E5iHqllcjHSlMYYhgWXKsAllelD2B
	fWuY8ASxltW5BCjiDoHDoGyXrY7eJ18=
X-Google-Smtp-Source: ACHHUZ7w0R+9yfk2EAhTdxLuJQc2CUBTHDr59B9nv4VKH4H6FRX4xuXTEGbcvMpkfmaftgtflesldw==
X-Received: by 2002:a17:906:eec5:b0:94b:cd7c:59f4 with SMTP id wu5-20020a170906eec500b0094bcd7c59f4mr11914043ejb.16.1683653030167;
        Tue, 09 May 2023 10:23:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/27] glib-2.0: upgrade 2.74.6 -> 2.76.2
Date: Tue,  9 May 2023 19:23:21 +0200
Message-Id: <20230509172344.1516743-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181059

Drop backports.

Refactor relocate-modules.patch; upstream has implemented the same
logic, but made it os x only - we can simply drop those ifdef guards:
https://gitlab.gnome.org/GNOME/glib/-/commit/af83c6571e47d06468b8162dd29ad57bcf4967a8

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-info-don-t-assume-million-in-one-ev.patch | 50 ------------
 ...build-do-not-use-can_run_host_binari.patch | 48 ------------
 .../glib-2.0/glib-2.0/cpp-null.patch          | 77 -------------------
 .../glib-2.0/glib-2.0/cpp-null2.patch         | 31 --------
 .../glib-2.0/glib-2.0/relocate-modules.patch  | 47 +++++------
 ...{glib-2.0_2.74.6.bb => glib-2.0_2.76.2.bb} |  6 +-
 6 files changed, 22 insertions(+), 237 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.74.6.bb => glib-2.0_2.76.2.bb} (87%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
deleted file mode 100644
index 57ada66907e..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d563e Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 6 Jul 2021 19:26:03 +0100
-Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one events
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
- don't happen
-
-The access and creation time tests create a file, gets the time in
-seconds, then gets the time in microseconds and assumes that the
-difference between the two has to be above 0.
-
-As rare as this may be, it can happen:
-
-$ stat g-file-info-test-50A450 -c %y
-2021-07-06 18:24:56.000000767 +0100
-
-Change the test to simply assert that the difference not negative to
-handle this case.
-
-This is the same fix as 289f8b, but that was just modification time.
-
----
- gio/tests/g-file-info.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
-index d9ad045..c9b12b0 100644
---- a/gio/tests/g-file-info.c
-+++ b/gio/tests/g-file-info.c
-@@ -307,7 +307,7 @@ test_g_file_info_access_time (void)
-   g_assert_nonnull (dt_usecs);
- 
-   ts = g_date_time_difference (dt_usecs, dt);
--  g_assert_cmpint (ts, >, 0);
-+  g_assert_cmpint (ts, >=, 0);
-   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
- 
-   /* Try again with nanosecond precision. */
-@@ -442,7 +442,7 @@ test_g_file_info_creation_time (void)
-   g_assert_nonnull (dt_usecs);
- 
-   ts = g_date_time_difference (dt_usecs, dt);
--  g_assert_cmpint (ts, >, 0);
-+  g_assert_cmpint (ts, >=, 0);
-   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
- 
-   /* Try again with nanosecond precision. */
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
deleted file mode 100644
index db08b5af555..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From fdbffaea2fa85c203cc6aacb5734acac65aeaa19 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 11 Nov 2022 13:12:42 +0100
-Subject: [PATCH] tests/meson.build: do not use can_run_host_binaries()
-
-can_run_host_binaries() returns true even when cross compiling,
-if there is an executable wrapper defined that can run
-cross-binaries under some kind of emulation.
-
-Unfortunately, custom_target() will not use the wrapper
-and will attempt to execute the command directly. Until
-this is addressed in meson upstream, we have to disable
-these targets in cross scenarios.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- gio/tests/meson.build  | 2 +-
- glib/tests/meson.build | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 49cfa25ce..ea59656f9 100644
---- a/gio/tests/meson.build
-+++ b/gio/tests/meson.build
-@@ -652,7 +652,7 @@ if installed_tests_enabled
-   endforeach
- endif
- 
--if meson.can_run_host_binaries()
-+if not meson.is_cross_build()
- 
-   compiler_type = '--compiler=@0@'.format(cc.get_id())
- 
-diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index 69508178e..e4f75f302 100644
---- a/glib/tests/meson.build
-+++ b/glib/tests/meson.build
-@@ -411,7 +411,7 @@ executable('testing-helper', 'testing-helper.c',
- )
- 
- # some testing of gtester functionality
--if meson.can_run_host_binaries() and host_system != 'windows'
-+if not meson.is_cross_build() and host_system != 'windows'
-   xmllint = find_program('xmllint', required: false)
-   if xmllint.found()
-     tmpsample_xml = custom_target('tmpsample.xml',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
deleted file mode 100644
index 63cbf90ab23..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 0ca5254c5d92aec675b76b4bfa72a6885cde6066 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
-Date: Sat, 29 Oct 2022 04:30:52 +0200
-Subject: [PATCH] glib/gmacros: Always define NULL as nullptr in C++11 and
- newer
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/0ca5254c5d92aec675b76b4bfa72a6885cde6066]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- glib/gmacros.h     |  9 ++++++++-
- glib/tests/cxx.cpp | 13 -------------
- 2 files changed, 8 insertions(+), 14 deletions(-)
-
-diff --git a/glib/gmacros.h b/glib/gmacros.h
-index 5302841105..9fe8270822 100644
---- a/glib/gmacros.h
-+++ b/glib/gmacros.h
-@@ -870,10 +870,17 @@
-  */
- #ifndef NULL
- #  ifdef __cplusplus
--#  define NULL        (0L)
-+#    if __cplusplus >= 201103L
-+#      define NULL (nullptr)
-+#    else
-+#      define NULL (0L)
-+#    endif /* __cplusplus >= 201103L */
- #  else /* !__cplusplus */
- #  define NULL        ((void*) 0)
- #  endif /* !__cplusplus */
-+#elif defined (__cplusplus) && __cplusplus >= 201103L
-+#  undef NULL
-+#  define NULL (nullptr)
- #endif
- 
- #ifndef	FALSE
-diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
-index 6ac60791c8..045457c6e2 100644
---- a/glib/tests/cxx.cpp
-+++ b/glib/tests/cxx.cpp
-@@ -34,21 +34,12 @@ test_typeof (void)
-   MyObject *obj3 = g_atomic_pointer_get (&obj2);
-   g_assert_true (obj3 == obj);
- 
--#if __cplusplus >= 201103L
--  MyObject *obj4 = nullptr;
--#else
-   MyObject *obj4 = NULL;
--#endif
-   g_atomic_pointer_set (&obj4, obj3);
-   g_assert_true (obj4 == obj);
- 
--#if __cplusplus >= 201103L
--  MyObject *obj5 = nullptr;
--  g_atomic_pointer_compare_and_exchange (&obj5, nullptr, obj4);
--#else
-   MyObject *obj5 = NULL;
-   g_atomic_pointer_compare_and_exchange (&obj5, NULL, obj4);
--#endif
-   g_assert_true (obj5 == obj);
- 
-   MyObject *obj6 = g_steal_pointer (&obj5);
-@@ -195,11 +186,7 @@ test_steal_pointer (void)
- int
- main (int argc, char *argv[])
- {
--#if __cplusplus >= 201103L
--  g_test_init (&argc, &argv, nullptr);
--#else
-   g_test_init (&argc, &argv, NULL);
--#endif
- 
-   g_test_add_func ("/C++/typeof", test_typeof);
-   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
--- 
-GitLab
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
deleted file mode 100644
index 763d5ce539f..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7dc19632f3115e3f517c6bc80436fe72c1dcdeb4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
-Date: Sat, 29 Oct 2022 04:16:00 +0200
-Subject: [PATCH] glib/tests/cxx: Ensure NULL is always casted to a pointer
- type
-
-Otherwise it may not be recognized as valid sentinel
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e3f517c6bc80436fe72c1dcdeb4]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- glib/tests/cxx.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
-index 045457c6e2..aa5e0cb576 100644
---- a/glib/tests/cxx.cpp
-+++ b/glib/tests/cxx.cpp
-@@ -186,7 +186,11 @@ test_steal_pointer (void)
- int
- main (int argc, char *argv[])
- {
-+#if __cplusplus >= 201103L
-   g_test_init (&argc, &argv, NULL);
-+#else
-+  g_test_init (&argc, &argv, static_cast<void *>(NULL));
-+#endif
- 
-   g_test_add_func ("/C++/typeof", test_typeof);
-   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
--- 
-GitLab
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index ae6881b61e8..3dba599fc0b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From a3cdf17643bf33d532ec269913974195e136b7fc Mon Sep 17 00:00:00 2001
+From 38e401969a2ff8269919cbeacec733a67f041735 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -13,38 +13,33 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
 ---
- gio/giomodule.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
+ gio/giomodule.c | 5 -----
+ 1 file changed, 5 deletions(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index f5dbb45..c926e77 100644
+index 11ce7d8..cc27ecd 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -58,6 +58,8 @@
- #ifdef G_OS_WIN32
- #include "gregistrysettingsbackend.h"
- #include "giowin32-priv.h"
-+#else
-+#include <dlfcn.h>
- #endif
- #include <glib/gstdio.h>
- 
-@@ -1261,7 +1263,15 @@ get_gio_module_dir (void)
-                                      NULL);
+@@ -1271,9 +1271,6 @@ get_gio_module_dir (void)
        g_free (install_dir);
  #else
--      module_dir = g_strdup (GIO_MODULE_DIR);
-+      Dl_info info;
-+
-+      if (dladdr (g_io_module_new, &info)) {
-+        char *libdir = g_path_get_dirname (info.dli_fname);
-+        module_dir = g_build_filename (libdir, "gio", "modules", NULL);
-+        g_free (libdir);
-+      } else {
-+        module_dir = g_strdup (GIO_MODULE_DIR);
-+      }
+       module_dir = g_strdup (GIO_MODULE_DIR);
+-#ifdef __APPLE__
+-#include "TargetConditionals.h"
+-#if TARGET_OS_OSX
+ #include <dlfcn.h>
+       {
+         g_autofree gchar *path = NULL;
+@@ -1292,8 +1289,6 @@ get_gio_module_dir (void)
+               }
+           }
+       }
+-#endif
+-#endif
  #endif
      }
  
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
similarity index 87%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
index 5b79ae481c3..224f2c262e0 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
@@ -14,14 +14,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-           file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch \
-           file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch \
-           file://cpp-null.patch \
-           file://cpp-null2.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "069cf7e51cd261eb163aaf06c8d1754c6835f31252180aff5814e5afc7757fbc"
+SRC_URI[sha256sum] = "24f3847857b1d8674cdb0389a36edec0f13c666cd3ce727ecd340eb9da8aca9e"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.30.2


