Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F10C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 19:48:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.168610.1680810479561513991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 12:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R5GX6IEm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0C74D240005;
	Thu,  6 Apr 2023 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680810477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W+2RI+4DmQ7y2f6WE7fZyBuo8uwr33DZ1Wq2Pb4Wo54=;
	b=R5GX6IEmqz/apkNe+XHAVAeXSk4Vyj9zXwtCRbUCvytCWbM20MDkD5+KM378/N7QSph81k
	+YByiWzjyjdTSmNlZ2buWhvODuZsc/L55Ur9hUN969h1GzrGMirFPdIAaHfoZqp7q95p9q
	0kJs1IoZ5KXg57QpDlrqbasRE5qrHk/c2eBWbFSS3I3BlNIcc5SEZG/uambaHTWoE4O4Xp
	Xn3sISqIa5b1avpNPICiJ4dkJM6NSVnA6aL2VppJvwiv1uAEpzXg+F+O5/4WWjvm7fqA2D
	O5eRBhgfAfjWIwKdt+/w6I593zGIdCzM5cLdWe1spoIEb1h0IRcc9m2hRrui8Q==
Date: Thu, 6 Apr 2023 21:47:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCHv5 1/8] glib-2.0: update 2.74.6 ->
 2.76.1
Message-ID: <20230406194756e8cc3cfd@mail.local>
References: <20230328103144.5757-1-f_L_K@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328103144.5757-1-f_L_K@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 19:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179805

Hello Markus,

Do you mind rebasing that on top of master or ideally my own branch,
abelloni/master-next?

The series seemed to build fine but we had other conflicting patches
that were taken for mickledore.

Thanks!

On 28/03/2023 12:31:37+0200, Markus Volk wrote:
> From: Markus Volk <f_l_k@t-online.de>
> 
> ---
>  ...-info-don-t-assume-million-in-one-ev.patch | 50 ------------
>  ...build-do-not-use-can_run_host_binari.patch | 48 ------------
>  .../glib-2.0/glib-2.0/cpp-null.patch          | 77 -------------------
>  .../glib-2.0/glib-2.0/cpp-null2.patch         | 31 --------
>  .../glib-2.0/glib-2.0/relocate-modules.patch  | 11 ++-
>  ...{glib-2.0_2.74.6.bb => glib-2.0_2.76.1.bb} |  6 +-
>  6 files changed, 8 insertions(+), 215 deletions(-)
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.74.6.bb => glib-2.0_2.76.1.bb} (87%)
> 
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
> deleted file mode 100644
> index 57ada66907..0000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d563e Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Tue, 6 Jul 2021 19:26:03 +0100
> -Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one events
> -
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> - don't happen
> -
> -The access and creation time tests create a file, gets the time in
> -seconds, then gets the time in microseconds and assumes that the
> -difference between the two has to be above 0.
> -
> -As rare as this may be, it can happen:
> -
> -$ stat g-file-info-test-50A450 -c %y
> -2021-07-06 18:24:56.000000767 +0100
> -
> -Change the test to simply assert that the difference not negative to
> -handle this case.
> -
> -This is the same fix as 289f8b, but that was just modification time.
> -
> ----
> - gio/tests/g-file-info.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
> -index d9ad045..c9b12b0 100644
> ---- a/gio/tests/g-file-info.c
> -+++ b/gio/tests/g-file-info.c
> -@@ -307,7 +307,7 @@ test_g_file_info_access_time (void)
> -   g_assert_nonnull (dt_usecs);
> - 
> -   ts = g_date_time_difference (dt_usecs, dt);
> --  g_assert_cmpint (ts, >, 0);
> -+  g_assert_cmpint (ts, >=, 0);
> -   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
> - 
> -   /* Try again with nanosecond precision. */
> -@@ -442,7 +442,7 @@ test_g_file_info_creation_time (void)
> -   g_assert_nonnull (dt_usecs);
> - 
> -   ts = g_date_time_difference (dt_usecs, dt);
> --  g_assert_cmpint (ts, >, 0);
> -+  g_assert_cmpint (ts, >=, 0);
> -   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
> - 
> -   /* Try again with nanosecond precision. */
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
> deleted file mode 100644
> index db08b5af55..0000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From fdbffaea2fa85c203cc6aacb5734acac65aeaa19 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Fri, 11 Nov 2022 13:12:42 +0100
> -Subject: [PATCH] tests/meson.build: do not use can_run_host_binaries()
> -
> -can_run_host_binaries() returns true even when cross compiling,
> -if there is an executable wrapper defined that can run
> -cross-binaries under some kind of emulation.
> -
> -Unfortunately, custom_target() will not use the wrapper
> -and will attempt to execute the command directly. Until
> -this is addressed in meson upstream, we have to disable
> -these targets in cross scenarios.
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> -
> ----
> - gio/tests/meson.build  | 2 +-
> - glib/tests/meson.build | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> -index 49cfa25ce..ea59656f9 100644
> ---- a/gio/tests/meson.build
> -+++ b/gio/tests/meson.build
> -@@ -652,7 +652,7 @@ if installed_tests_enabled
> -   endforeach
> - endif
> - 
> --if meson.can_run_host_binaries()
> -+if not meson.is_cross_build()
> - 
> -   compiler_type = '--compiler=@0@'.format(cc.get_id())
> - 
> -diff --git a/glib/tests/meson.build b/glib/tests/meson.build
> -index 69508178e..e4f75f302 100644
> ---- a/glib/tests/meson.build
> -+++ b/glib/tests/meson.build
> -@@ -411,7 +411,7 @@ executable('testing-helper', 'testing-helper.c',
> - )
> - 
> - # some testing of gtester functionality
> --if meson.can_run_host_binaries() and host_system != 'windows'
> -+if not meson.is_cross_build() and host_system != 'windows'
> -   xmllint = find_program('xmllint', required: false)
> -   if xmllint.found()
> -     tmpsample_xml = custom_target('tmpsample.xml',
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
> deleted file mode 100644
> index 63cbf90ab2..0000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 0ca5254c5d92aec675b76b4bfa72a6885cde6066 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
> -Date: Sat, 29 Oct 2022 04:30:52 +0200
> -Subject: [PATCH] glib/gmacros: Always define NULL as nullptr in C++11 and
> - newer
> -
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/0ca5254c5d92aec675b76b4bfa72a6885cde6066]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - glib/gmacros.h     |  9 ++++++++-
> - glib/tests/cxx.cpp | 13 -------------
> - 2 files changed, 8 insertions(+), 14 deletions(-)
> -
> -diff --git a/glib/gmacros.h b/glib/gmacros.h
> -index 5302841105..9fe8270822 100644
> ---- a/glib/gmacros.h
> -+++ b/glib/gmacros.h
> -@@ -870,10 +870,17 @@
> -  */
> - #ifndef NULL
> - #  ifdef __cplusplus
> --#  define NULL        (0L)
> -+#    if __cplusplus >= 201103L
> -+#      define NULL (nullptr)
> -+#    else
> -+#      define NULL (0L)
> -+#    endif /* __cplusplus >= 201103L */
> - #  else /* !__cplusplus */
> - #  define NULL        ((void*) 0)
> - #  endif /* !__cplusplus */
> -+#elif defined (__cplusplus) && __cplusplus >= 201103L
> -+#  undef NULL
> -+#  define NULL (nullptr)
> - #endif
> - 
> - #ifndef	FALSE
> -diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
> -index 6ac60791c8..045457c6e2 100644
> ---- a/glib/tests/cxx.cpp
> -+++ b/glib/tests/cxx.cpp
> -@@ -34,21 +34,12 @@ test_typeof (void)
> -   MyObject *obj3 = g_atomic_pointer_get (&obj2);
> -   g_assert_true (obj3 == obj);
> - 
> --#if __cplusplus >= 201103L
> --  MyObject *obj4 = nullptr;
> --#else
> -   MyObject *obj4 = NULL;
> --#endif
> -   g_atomic_pointer_set (&obj4, obj3);
> -   g_assert_true (obj4 == obj);
> - 
> --#if __cplusplus >= 201103L
> --  MyObject *obj5 = nullptr;
> --  g_atomic_pointer_compare_and_exchange (&obj5, nullptr, obj4);
> --#else
> -   MyObject *obj5 = NULL;
> -   g_atomic_pointer_compare_and_exchange (&obj5, NULL, obj4);
> --#endif
> -   g_assert_true (obj5 == obj);
> - 
> -   MyObject *obj6 = g_steal_pointer (&obj5);
> -@@ -195,11 +186,7 @@ test_steal_pointer (void)
> - int
> - main (int argc, char *argv[])
> - {
> --#if __cplusplus >= 201103L
> --  g_test_init (&argc, &argv, nullptr);
> --#else
> -   g_test_init (&argc, &argv, NULL);
> --#endif
> - 
> -   g_test_add_func ("/C++/typeof", test_typeof);
> -   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
> --- 
> -GitLab
> -
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
> deleted file mode 100644
> index 763d5ce539..0000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 7dc19632f3115e3f517c6bc80436fe72c1dcdeb4 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
> -Date: Sat, 29 Oct 2022 04:16:00 +0200
> -Subject: [PATCH] glib/tests/cxx: Ensure NULL is always casted to a pointer
> - type
> -
> -Otherwise it may not be recognized as valid sentinel
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e3f517c6bc80436fe72c1dcdeb4]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - glib/tests/cxx.cpp | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
> -index 045457c6e2..aa5e0cb576 100644
> ---- a/glib/tests/cxx.cpp
> -+++ b/glib/tests/cxx.cpp
> -@@ -186,7 +186,11 @@ test_steal_pointer (void)
> - int
> - main (int argc, char *argv[])
> - {
> -+#if __cplusplus >= 201103L
> -   g_test_init (&argc, &argv, NULL);
> -+#else
> -+  g_test_init (&argc, &argv, static_cast<void *>(NULL));
> -+#endif
> - 
> -   g_test_add_func ("/C++/typeof", test_typeof);
> -   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
> --- 
> -GitLab
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> index ae6881b61e..4a2eb3b1a7 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> @@ -14,6 +14,9 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>  Port patch to 2.48
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  
> +Port patch to 2.75
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
>  ---
>   gio/giomodule.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> @@ -31,7 +34,7 @@ index f5dbb45..c926e77 100644
>   #endif
>   #include <glib/gstdio.h>
>   
> -@@ -1261,7 +1263,15 @@ get_gio_module_dir (void)
> +@@ -1270,7 +1272,15 @@
>                                        NULL);
>         g_free (install_dir);
>   #else
> @@ -45,6 +48,6 @@ index f5dbb45..c926e77 100644
>  +      } else {
>  +        module_dir = g_strdup (GIO_MODULE_DIR);
>  +      }
> - #endif
> -     }
> - 
> + #ifdef __APPLE__
> + #include "TargetConditionals.h"
> + #if TARGET_OS_OSX
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.1.bb
> similarity index 87%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.76.1.bb
> index 5b79ae481c..1238b57c70 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.1.bb
> @@ -14,14 +14,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
>             file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
>             file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
> -           file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch \
> -           file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch \
> -           file://cpp-null.patch \
> -           file://cpp-null2.patch \
>             "
>  SRC_URI:append:class-native = " file://relocate-modules.patch"
>  
> -SRC_URI[sha256sum] = "069cf7e51cd261eb163aaf06c8d1754c6835f31252180aff5814e5afc7757fbc"
> +SRC_URI[sha256sum] = "43dc0f6a126958f5b454136c4398eab420249c16171a769784486e25f2fda19f"
>  
>  # Find any meson cross files in FILESPATH that are relevant for the current
>  # build (using siteinfo) and add them to EXTRA_OEMESON.
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179224): https://lists.openembedded.org/g/openembedded-core/message/179224
> Mute This Topic: https://lists.openembedded.org/mt/97902087/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

