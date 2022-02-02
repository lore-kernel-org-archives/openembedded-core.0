Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDCFC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.64036.1643809379927156352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=L4zE69wk;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AD0C9838BD;
	Wed,  2 Feb 2022 14:42:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809372;
	bh=GIGwDz46jux5UbHJRReDLVDYq8rw/p7P6zrwDpk486s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4zE69wk958aLM06rR7/OT5h9snDtm+c4BySlvNYocDGl3ysgB1TV9urBZmzghKtm
	 nLuHR/hm2IZkNTxkpZ8Nbd6z2rLnWLVLOlW/eZqdD569zrWcPhl2CGccyVncK+wWBX
	 kQon8Dqi43kVrug64Ln4qQHjpQog7zkyZI1svm2ZN68N0T4O5gkgtoOJOv/wzuR/eP
	 dqy5RA3n4WO4QREsEGdB2hHSggAOAHYMnxJGvQdwaj6P/nT21KX6dVz1bcXGXFJCKd
	 h0u+Ew7l5VeCSry1hBozZkpoa9p5Mbl00x+/KPHy/GLfPWVSoaf7pwwbjh8PAeEcCz
	 J2EHRTeD3BMcA==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 01/12] gstreamer1.0: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:22 +0100
Message-Id: <20220202134233.2091916-2-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202134233.2091916-1-ch@denx.de>
References: <20220202134233.2091916-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161197

Backported patches where removed, others updated to their current
version.

This also adds a patch to remove the
gstbin:test_watch_for_state_change testcase, since it seems flaky:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...der.c-when-env-var-is-set-do-not-fal.patch |  69 -----------
 ...pect-the-idententaion-used-in-meson.patch} |   7 +-
 ...002-Remove-unused-valgrind-detection.patch | 112 ------------------
 ...s-add-support-for-install-the-tests.patch} |  48 ++++----
 ...-use-too-strict-timeout-for-validati.patch |  32 -----
 ...-use-a-dictionaries-for-environment.patch} |  24 ++--
 ...er-script-to-run-the-installed_tests.patch |  72 +++++++++++
 ...bin-test_watch_for_state_change-test.patch | 107 +++++++++++++++++
 ...-the-environment-for-installed_tests.patch |  58 ---------
 ...r1.0_1.18.5.bb =3D> gstreamer1.0_1.19.90.bb} |  18 ++-
 10 files changed, 225 insertions(+), 322 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-g=
st-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respec=
t-the-idententaion-used-in-meson.patch =3D> 0001-tests-respect-the-idente=
ntaion-used-in-meson.patch} (87%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-R=
emove-unused-valgrind-detection.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-su=
pport-for-install-the-tests.patch =3D> 0002-tests-add-support-for-install=
-the-tests.patch} (79%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-t=
ests-seek-Don-t-use-too-strict-timeout-for-validati.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-=
dictionaries-for-environment.patch =3D> 0003-tests-use-a-dictionaries-for=
-environment.patch} (70%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-t=
ests-add-helper-script-to-run-the-installed_tests.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-t=
ests-remove-gstbin-test_watch_for_state_change-test.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-t=
ests-install-the-environment-for-installed_tests.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb =3D> gs=
treamer1.0_1.19.90.bb} (77%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstp=
luginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multime=
dia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set=
-do-not-fal.patch
deleted file mode 100644
index 23ebd5c600..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginlo=
ader.c-when-env-var-is-set-do-not-fal.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From fd8f49dba8c09d47425da80f5faab3bfa4a7c962 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sat, 10 Oct 2020 19:09:03 +0000
-Subject: [PATCH 1/3] gstpluginloader: when env var is set do not fall th=
rough
- to system plugin scanner
-
-If we set a custom GST_PLUGIN_SCANNER env var, then we probably want to =
use that and only that.
-
-Falling through to the one installed on the system is problamatic in cro=
ss-compilation
-environemnts, regardless of whether one pointed to by the env var succee=
ded or failed.
-
-taken from:
-http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multi=
media/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-s=
et-do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/669>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- gst/gstpluginloader.c | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
-index d1e404d98..c626bf263 100644
---- a/gst/gstpluginloader.c
-+++ b/gst/gstpluginloader.c
-@@ -464,20 +464,19 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
-   if (loader->child_running)
-     return TRUE;
-=20
--  /* Find the gst-plugin-scanner: first try the env-var if it is set,
--   * otherwise use the installed version */
-+  /* Find the gst-plugin-scanner */
-   env =3D g_getenv ("GST_PLUGIN_SCANNER_1_0");
-   if (env =3D=3D NULL)
-     env =3D g_getenv ("GST_PLUGIN_SCANNER");
-=20
-   if (env !=3D NULL && *env !=3D '\0') {
-+    /* use the env-var if it is set */
-     GST_LOG ("Trying GST_PLUGIN_SCANNER env var: %s", env);
-     helper_bin =3D g_strdup (env);
-     res =3D gst_plugin_loader_try_helper (loader, helper_bin);
-     g_free (helper_bin);
--  }
--
--  if (!res) {
-+  } else {
-+    /* use the installed version */
-     GST_LOG ("Trying installed plugin scanner");
-=20
- #ifdef G_OS_WIN32
-@@ -497,10 +496,10 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
- #endif
-     res =3D gst_plugin_loader_try_helper (loader, helper_bin);
-     g_free (helper_bin);
-+  }
-=20
--    if (!res) {
--      GST_INFO ("No gst-plugin-scanner available, or not working");
--    }
-+  if (!res) {
-+    GST_INFO ("No gst-plugin-scanner available, or not working");
-   }
-=20
-   return loader->child_running;
---=20
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-re=
spect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstr=
eamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patc=
h
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-res=
pect-the-idententaion-used-in-meson.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respe=
ct-the-idententaion-used-in-meson.patch
index 6f571a12d8..57a0c868f8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-t=
he-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-t=
he-idententaion-used-in-meson.patch
@@ -1,17 +1,16 @@
-From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17 00:00:00 2001
+From 1eb77a4ea5a3967c688d8f1192f99c605badc7e2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH 1/4] tests: respect the idententaion used in meson
=20
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst=
reamer/-/merge_requests/789]
=20
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
  tests/check/meson.build | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
=20
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index a617cf159..b2636714b 100644
+index 9c4228b6e4..506606684d 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
 @@ -146,11 +146,11 @@ foreach t : core_tests
@@ -32,5 +31,5 @@ index a617cf159..b2636714b 100644
 =20
      env =3D environment()
 --=20
-2.31.1
+2.33.1
=20
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-u=
nused-valgrind-detection.patch b/meta/recipes-multimedia/gstreamer/gstrea=
mer1.0/0002-Remove-unused-valgrind-detection.patch
deleted file mode 100644
index 5121044734..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-v=
algrind-detection.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From e275ba2bd854ac15a4b65a8f07d9f042021950da Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <tim@centricular.c=
om>
-Date: Fri, 14 Aug 2020 16:38:26 +0100
-Subject: [PATCH 2/3] Remove unused valgrind detection
-
-Having this just to log a debug message in case we're
-running inside valgrind doesn't seem very useful, and
-the code that used to use this no longer exists it seems.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/595>
-
-Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef455972245]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- gst/gst_private.h |  2 --
- gst/gstinfo.c     | 39 ---------------------------------------
- meson.build       |  1 -
- 3 files changed, 42 deletions(-)
-
-diff --git a/gst/gst_private.h b/gst/gst_private.h
-index eefd044..8252ede 100644
---- a/gst/gst_private.h
-+++ b/gst/gst_private.h
-@@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean _priv_plugin_deps_env_vars=
_changed (GstPlugin * plugin
-=20
- G_GNUC_INTERNAL  gboolean _priv_plugin_deps_files_changed (GstPlugin * =
plugin);
-=20
--G_GNUC_INTERNAL  gboolean _priv_gst_in_valgrind (void);
--
- /* init functions called from gst_init(). */
- G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
- G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize (void);
-diff --git a/gst/gstinfo.c b/gst/gstinfo.c
-index eea1a21..d3035d6 100644
---- a/gst/gstinfo.c
-+++ b/gst/gstinfo.c
-@@ -305,36 +305,6 @@ static gboolean pretty_tags =3D PRETTY_TAGS_DEFAULT=
;
- static gint G_GNUC_MAY_ALIAS __default_level =3D GST_LEVEL_DEFAULT;
- static gint G_GNUC_MAY_ALIAS __use_color =3D GST_DEBUG_COLOR_MODE_ON;
-=20
--/* FIXME: export this? */
--gboolean
--_priv_gst_in_valgrind (void)
--{
--  static enum
--  {
--    GST_VG_UNCHECKED,
--    GST_VG_NO_VALGRIND,
--    GST_VG_INSIDE
--  }
--  in_valgrind =3D GST_VG_UNCHECKED;
--
--  if (in_valgrind =3D=3D GST_VG_UNCHECKED) {
--#ifdef HAVE_VALGRIND_VALGRIND_H
--    if (RUNNING_ON_VALGRIND) {
--      GST_CAT_INFO (GST_CAT_GST_INIT, "we're running inside valgrind");
--      in_valgrind =3D GST_VG_INSIDE;
--    } else {
--      GST_CAT_LOG (GST_CAT_GST_INIT, "not doing extra valgrind stuff");
--      in_valgrind =3D GST_VG_NO_VALGRIND;
--    }
--#else
--    in_valgrind =3D GST_VG_NO_VALGRIND;
--#endif
--    g_assert (in_valgrind =3D=3D GST_VG_NO_VALGRIND ||
--        in_valgrind =3D=3D GST_VG_INSIDE);
--  }
--  return (in_valgrind =3D=3D GST_VG_INSIDE);
--}
--
- static gchar *
- _replace_pattern_in_gst_debug_file_name (gchar * name, const char *toke=
n,
-     guint val)
-@@ -463,9 +433,6 @@ _priv_gst_debug_init (void)
-   _priv_GST_CAT_PROTECTION =3D
-       _gst_debug_category_new ("GST_PROTECTION", 0, "protection");
-=20
--  /* print out the valgrind message if we're in valgrind */
--  _priv_gst_in_valgrind ();
--
-   env =3D g_getenv ("GST_DEBUG_OPTIONS");
-   if (env !=3D NULL) {
-     if (strstr (env, "full_tags") || strstr (env, "full-tags"))
-@@ -2505,12 +2472,6 @@ gst_debug_construct_win_color (guint colorinfo)
-   return 0;
- }
-=20
--gboolean
--_priv_gst_in_valgrind (void)
--{
--  return FALSE;
--}
--
- void
- _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,
-     const gchar * func, gint line, GObject * obj, const gchar * msg,
-diff --git a/meson.build b/meson.build
-index 82a1728..42ae617 100644
---- a/meson.build
-+++ b/meson.build
-@@ -200,7 +200,6 @@ check_headers =3D [
-   'sys/wait.h',
-   'ucontext.h',
-   'unistd.h',
--  'valgrind/valgrind.h',
-   'sys/resource.h',
-   'sys/uio.h',
- ]
---=20
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-ad=
d-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer=
/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
similarity index 79%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add=
-support-for-install-the-tests.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-s=
upport-for-install-the-tests.patch
index b77fb5797f..c298c639ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-suppo=
rt-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-suppo=
rt-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17 00:00:00 2001
+From 62f5bb7bfc2498219df7280e73480d8ed2378ce5 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH 2/4] tests: add support for install the tests
@@ -9,54 +9,43 @@ This will provide to run the tests using the gnome-desk=
top-testing [1]
=20
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst=
reamer/-/merge_requests/789]
=20
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
- meson.build             |  5 +++++
+ meson.build             |  4 ++++
  meson_options.txt       |  1 +
- template.test.in        |  3 +++
- tests/check/meson.build | 22 +++++++++++++++++++++-
- 4 files changed, 30 insertions(+), 1 deletion(-)
- create mode 100644 template.test.in
+ tests/check/meson.build | 22 ++++++++++++++++++-
+ .../gstreamer/tests/check/template.test.in    |  3 +++
+ 4 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 tests/check/template.test.in
=20
 diff --git a/meson.build b/meson.build
-index c4e8774f5..1abf4eb26 100644
+index d20fe0040f..b595d8f990 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -562,6 +562,11 @@ if bashcomp_dep.found()
+@@ -562,6 +562,10 @@ if bashcomp_dep.found()
    endif
  endif
 =20
++installed_tests_enabled =3D get_option('installed_tests')
 +installed_tests_metadir =3D join_paths(datadir, 'installed-tests', meso=
n.project_name())
 +installed_tests_execdir =3D join_paths(libexecdir, 'installed-tests', m=
eson.project_name())
-+installed_tests_enabled =3D get_option('installed-tests')
-+installed_tests_template =3D files('template.test.in')
 +
  plugins_install_dir =3D join_paths(get_option('libdir'), 'gstreamer-1.0=
')
 =20
  pkgconfig =3D import('pkgconfig')
 diff --git a/meson_options.txt b/meson_options.txt
-index c8cee3762..b5da40eaa 100644
+index 7363bdb7a1..a34ba37dad 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', value : false, d=
escription : 'Enable poiso
  option('memory-alignment', type: 'combo',
         choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '=
512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
         value: 'malloc')
-+option('installed-tests', type : 'boolean', value : false, description =
: 'Enable installed tests')
++option('installed_tests', type : 'boolean', value : false, description =
: 'Enable installed tests')
 =20
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build =
unit test libraries')
-diff --git a/template.test.in b/template.test.in
-new file mode 100644
-index 000000000..f701627f8
---- /dev/null
-+++ b/template.test.in
-@@ -0,0 +1,3 @@
-+[Test]
-+Type=3Dsession
-+Exec=3D@installed_tests_dir@/@program@
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index b2636714b..a697a7b06 100644
+index 506606684d..00a138a568 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
 @@ -124,10 +124,16 @@ test_defines =3D [
@@ -95,7 +84,7 @@ index b2636714b..a697a7b06 100644
 +      test_conf.set('installed_tests_dir', join_paths(prefix, installed=
_tests_execdir))
 +      test_conf.set('program', test_name)
 +      configure_file(
-+        input: installed_tests_template,
++        input: 'template.test.in',
 +        output: test_name + '.test',
 +        install_dir: installed_tests_metadir,
 +        configuration: test_conf
@@ -105,6 +94,15 @@ index b2636714b..a697a7b06 100644
      test(test_name, exe, env: env, timeout : 3 * 60)
    endif
  endforeach
+diff --git a/tests/check/template.test.in b/tests/check/template.test.in
+new file mode 100644
+index 0000000000..f701627f87
+--- /dev/null
++++ b/tests/check/template.test.in
+@@ -0,0 +1,3 @@
++[Test]
++Type=3Dsession
++Exec=3D@installed_tests_dir@/@program@
 --=20
-2.31.1
+2.33.1
=20
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-se=
ek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multime=
dia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-f=
or-validati.patch
deleted file mode 100644
index e0e64e2c7a..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-=
t-use-too-strict-timeout-for-validati.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17 00:00:00 2001
-From: Seungha Yang <seungha@centricular.com>
-Date: Tue, 15 Sep 2020 00:54:58 +0900
-Subject: [PATCH] tests: seek: Don't use too strict timeout for validatio=
n
-
-Expected segment-done message might not be seen within expected
-time if system is not powerful enough.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/625>
-
-Upstream-Status: Backport [https://cgit.freedesktop.org/gstreamer/gstrea=
mer/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- tests/check/pipelines/seek.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/check/pipelines/seek.c b/tests/check/pipelines/seek.c
-index 28bb8846d..5f7447bc5 100644
---- a/tests/check/pipelines/seek.c
-+++ b/tests/check/pipelines/seek.c
-@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
-=20
-   GST_INFO ("wait for segment done message");
-=20
--  msg =3D gst_bus_timed_pop_filtered (bus, (GstClockTime) 2 * GST_SECON=
D,
-+  msg =3D gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE,
-       GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERROR);
-   fail_unless (msg, "no message within the timed window");
-   fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg), "segment-done=
");
---=20
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-us=
e-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreame=
r/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
similarity index 70%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use=
-a-dictionaries-for-environment.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a=
-dictionaries-for-environment.patch
index 46813cec3d..73e9de35d5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dic=
tionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dic=
tionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17 00:00:00 2001
+From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH 3/4] tests: use a dictionaries for environment
@@ -7,32 +7,32 @@ meson environment() can't be passed to configure_file a=
nd it is needed for insta
 use a dictionary as this is simplest solution to install the environment=
.
=20
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst=
reamer/-/merge_requests/789]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
- tests/check/meson.build | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
+ tests/check/meson.build | 21 ++++++++++++-------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
=20
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index a697a7b06..f64524904 100644
+index 00a138a568..48ec2532f8 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -161,14 +161,17 @@ foreach t : core_tests
+@@ -161,14 +161,19 @@ foreach t : core_tests
        install: installed_tests_enabled,
      )
 =20
 -    env =3D environment()
--    env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
+-    env.set('GST_PLUGIN_PATH_1_0', meson.project_build_root())
 -    env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
 -    env.set('GST_STATE_IGNORE_ELEMENTS', '')
 -    env.set('CK_DEFAULT_TIMEOUT', '20')
 -    env.set('GST_REGISTRY', '@0@/@1@.registry'.format(meson.current_bui=
ld_dir(), test_name))
 -    env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin-sc=
anner')
 -    env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
-+    # environment() can't be passed to configure_file and it is needed =
for installed_tests
-+    # use a dictionary as this is simplest solution to install the envi=
ronment
++    # meson environment object can't be passed to configure_file and
++    # installed tests uses configure_file to install the environment.
++    # use a dictionary as this is the simplest solution
++    # to install the environment.
 +    env =3D {
-+      'GST_PLUGIN_PATH_1_0': meson.build_root(),
++      'GST_PLUGIN_PATH_1_0': meson.project_build_root(),
 +      'GST_PLUGIN_SYSTEM_PATH_1_0': '',
 +      'GST_STATE_IGNORE_ELEMENTS': '',
 +      'CK_DEFAULT_TIMEOUT': '20',
@@ -44,5 +44,5 @@ index a697a7b06..f64524904 100644
      if installed_tests_enabled
        test_conf =3D configuration_data()
 --=20
-2.31.1
+2.33.1
=20
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-ad=
d-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedi=
a/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installe=
d_tests.patch
new file mode 100644
index 0000000000..cf096e1fb6
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helpe=
r-script-to-run-the-installed_tests.patch
@@ -0,0 +1,72 @@
+From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sun, 2 May 2021 01:58:01 +0100
+Subject: [PATCH 4/4] tests: add helper script to run the installed_tests
+
+- this is a bash script that will run the installed_tests
+with some of the environment variables used in the meson
+testing framework.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst=
reamer/-/merge_requests/789]
+---
+ tests/check/meson.build   | 17 +++++++++++++++++
+ .../gstreamer/tests/check/template.sh.in        |  9 +++++++++
+ .../gstreamer/tests/check/template.test.in      |  2 +-
+ 3 files changed, 27 insertions(+), 1 deletion(-)
+ create mode 100755 tests/check/template.sh.in
+
+diff --git a/tests/check/meson.build b/tests/check/meson.build
+index 48ec2532f8..7dc4990d4e 100644
+--- a/tests/check/meson.build
++++ b/tests/check/meson.build
+@@ -185,6 +185,23 @@ foreach t : core_tests
+         install_dir: installed_tests_metadir,
+         configuration: test_conf
+       )
++
++      # All the tests will be deployed on the target machine and
++      # we use the home folder ~ for the registry which will then expan=
d at runtime.
++      # Using the /tmp/gstreamer-1.0/@0@.registry can be problematic as=
 it mostly
++      # is mounted using tmpfs and if the machine crash from some reaso=
n we can lost the registry
++      # that is useful for debug propose of the tests itself.
++      env +=3D {'GST_REGISTRY': '~/.cache/gstreamer-1.0/@0@.registry'.f=
ormat(test_name)}
++
++      # Set the full path for the test it self.
++      env +=3D {'TEST': '@0@/@1@'.format(join_paths(prefix, installed_t=
ests_execdir), test_name)}
++
++      configure_file(
++        input : 'template.sh.in',
++        output: test_name + '.sh',
++        install_dir: installed_tests_execdir,
++        configuration : env,
++      )
+     endif
+=20
+     test(test_name, exe, env: env, timeout : 3 * 60)
+diff --git a/tests/check/template.sh.in b/tests/check/template.sh.in
+new file mode 100755
+index 0000000000..cf7d31b0ea
+--- /dev/null
++++ b/tests/check/template.sh.in
+@@ -0,0 +1,9 @@
++#!/bin/sh
++
++set -ax
++
++CK_DEFAULT_TIMEOUT=3D"@CK_DEFAULT_TIMEOUT@"
++GST_PLUGIN_LOADING_WHITELIST=3D"@GST_PLUGIN_LOADING_WHITELIST@"
++GST_REGISTRY=3D@GST_REGISTRY@
++GST_STATE_IGNORE_ELEMENTS=3D"@GST_STATE_IGNORE_ELEMENTS@"
++exec @TEST@
+diff --git a/tests/check/template.test.in b/tests/check/template.test.in
+index f701627f87..b74ef6ad73 100644
+--- a/tests/check/template.test.in
++++ b/tests/check/template.test.in
+@@ -1,3 +1,3 @@
+ [Test]
+ Type=3Dsession
+-Exec=3D@installed_tests_dir@/@program@
++Exec=3D@installed_tests_dir@/@program@.sh
+--=20
+2.33.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-re=
move-gstbin-test_watch_for_state_change-test.patch b/meta/recipes-multime=
dia/gstreamer/gstreamer1.0/0005-tests-remove-gstbin-test_watch_for_state_=
change-test.patch
new file mode 100644
index 0000000000..f51df6d20b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-remove-gs=
tbin-test_watch_for_state_change-test.patch
@@ -0,0 +1,107 @@
+From b935abba3d8fa3ea1ce384c08e650afd8c20b78a Mon Sep 17 00:00:00 2001
+From: Claudius Heine <ch@denx.de>
+Date: Wed, 2 Feb 2022 13:47:02 +0100
+Subject: [PATCH] tests: remove gstbin:test_watch_for_state_change testca=
se
+
+This testcase seems to be flaky, and upstream marked it as such:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778
+
+This patch removes the testcase to avoid it interfering with out ptest.
+
+Signed-off-by: Claudius Heine <ch@denx.de>
+
+Upstream-Status: Inappropriate [needs proper upstream fix]
+---
+ tests/check/gst/gstbin.c        | 69 -------------------
+ 1 file changed, 69 deletions(-)
+
+diff --git a/tests/check/gst/gstbin.c b/tests/check/gst/gstbin.c
+index e366d5fe20..ac29d81474 100644
+--- a/tests/check/gst/gstbin.c
++++ b/tests/check/gst/gstbin.c
+@@ -691,74 +691,6 @@ GST_START_TEST (test_message_state_changed_children=
)
+=20
+ GST_END_TEST;
+=20
+-GST_START_TEST (test_watch_for_state_change)
+-{
+-  GstElement *src, *sink, *bin;
+-  GstBus *bus;
+-  GstStateChangeReturn ret;
+-
+-  bin =3D gst_element_factory_make ("bin", NULL);
+-  fail_unless (bin !=3D NULL, "Could not create bin");
+-
+-  bus =3D g_object_new (gst_bus_get_type (), NULL);
+-  gst_object_ref_sink (bus);
+-  gst_element_set_bus (GST_ELEMENT_CAST (bin), bus);
+-
+-  src =3D gst_element_factory_make ("fakesrc", NULL);
+-  fail_if (src =3D=3D NULL, "Could not create fakesrc");
+-  sink =3D gst_element_factory_make ("fakesink", NULL);
+-  fail_if (sink =3D=3D NULL, "Could not create fakesink");
+-
+-  gst_bin_add (GST_BIN (bin), sink);
+-  gst_bin_add (GST_BIN (bin), src);
+-
+-  fail_unless (gst_element_link (src, sink), "could not link src and si=
nk");
+-
+-  /* change state, spawning two times three messages */
+-  ret =3D gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PAUSED);
+-  fail_unless (ret =3D=3D GST_STATE_CHANGE_ASYNC);
+-  ret =3D
+-      gst_element_get_state (GST_ELEMENT (bin), NULL, NULL,
+-      GST_CLOCK_TIME_NONE);
+-  fail_unless (ret =3D=3D GST_STATE_CHANGE_SUCCESS);
+-
+-  pop_state_changed (bus, 6);
+-  pop_async_done (bus);
+-  pop_latency (bus);
+-
+-  fail_unless (gst_bus_have_pending (bus) =3D=3D FALSE,
+-      "Unexpected messages on bus");
+-
+-  ret =3D gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PLAYING);
+-  fail_unless (ret =3D=3D GST_STATE_CHANGE_SUCCESS);
+-
+-  pop_state_changed (bus, 3);
+-
+-  /* this one might return either SUCCESS or ASYNC, likely SUCCESS */
+-  ret =3D gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PAUSED);
+-  gst_element_get_state (GST_ELEMENT (bin), NULL, NULL, GST_CLOCK_TIME_=
NONE);
+-
+-  pop_state_changed (bus, 3);
+-  if (ret =3D=3D GST_STATE_CHANGE_ASYNC) {
+-    pop_async_done (bus);
+-    pop_latency (bus);
+-  }
+-
+-  fail_unless (gst_bus_have_pending (bus) =3D=3D FALSE,
+-      "Unexpected messages on bus");
+-
+-  gst_bus_set_flushing (bus, TRUE);
+-
+-  ret =3D gst_element_set_state (GST_ELEMENT (bin), GST_STATE_NULL);
+-  fail_unless (ret =3D=3D GST_STATE_CHANGE_SUCCESS);
+-
+-  /* clean up */
+-  gst_object_unref (bus);
+-  gst_object_unref (bin);
+-}
+-
+-GST_END_TEST;
+-
+ GST_START_TEST (test_state_change_error_message)
+ {
+   GstElement *src, *sink, *bin;
+@@ -1956,7 +1888,6 @@ gst_bin_suite (void)
+   tcase_add_test (tc_chain, test_message_state_changed);
+   tcase_add_test (tc_chain, test_message_state_changed_child);
+   tcase_add_test (tc_chain, test_message_state_changed_children);
+-  tcase_add_test (tc_chain, test_watch_for_state_change);
+   tcase_add_test (tc_chain, test_state_change_error_message);
+   tcase_add_test (tc_chain, test_add_linked);
+   tcase_add_test (tc_chain, test_add_self);
+--=20
+2.33.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-in=
stall-the-environment-for-installed_tests.patch b/meta/recipes-multimedia=
/gstreamer/gstreamer1.0/0007-tests-install-the-environment-for-installed_=
tests.patch
deleted file mode 100644
index eabe7bcbe1..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-t=
he-environment-for-installed_tests.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sun, 2 May 2021 01:58:01 +0100
-Subject: [PATCH 4/4] tests: install the environment for installed_tests
-
-- adapt the test environment for installed_tests
-- install the test environment for installed_tests
-- run the tests using the installed environment
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst=
reamer/-/merge_requests/789]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- template.test.in        |  2 +-
- tests/check/meson.build | 18 ++++++++++++++++++
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/template.test.in b/template.test.in
-index f701627f8..9a3fbdd09 100644
---- a/template.test.in
-+++ b/template.test.in
-@@ -1,3 +1,3 @@
- [Test]
- Type=3Dsession
--Exec=3D@installed_tests_dir@/@program@
-+Exec=3Dsh -c 'set -aex && source @installed_tests_dir@/@program@.env &&=
 exec @installed_tests_dir@/@program@'
-diff --git a/tests/check/meson.build b/tests/check/meson.build
-index f64524904..a67e0f8dd 100644
---- a/tests/check/meson.build
-+++ b/tests/check/meson.build
-@@ -183,6 +183,24 @@ foreach t : core_tests
-         install_dir: installed_tests_metadir,
-         configuration: test_conf
-       )
-+
-+      env +=3D {'GST_REGISTRY': '~/.cache/gstreamer-1.0/@0@.registry'.f=
ormat(test_name)}
-+      configure_file(
-+        output: test_name + '.env',
-+        install_dir: installed_tests_execdir,
-+        configuration : env,
-+      )
-+      # helper to convert a meson environment dictionay object exported=
 with configure_file
-+      # this also remove not needed variables for the installed tests
-+      meson.add_postconf_script('sed', '-i',
-+        '-e', '/^#define/!d',
-+        '-e', 's/^#define //g',
-+        '-e', '/^GST_PLUGIN_PATH_1_0/d',
-+        '-e', '/^GST_PLUGIN_SYSTEM_PATH_1_0/d',
-+        '-e', '/^GST_PLUGIN_SCANNER_1_0/d',
-+        '-e', 's/ /=3D/',
-+        join_paths(meson.current_build_dir(), test_name + '.env')
-+      )
-     endif
-=20
-     test(test_name, exe, env: env, timeout : 3 * 60)
---=20
-2.31.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb b/m=
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.19.90.bb
similarity index 77%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.19.90.bb
index 0d82dd338c..31674f565a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.19.90.bb
@@ -10,22 +10,20 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 bison-n=
ative flex-native"
=20
 inherit meson pkgconfig gettext upstream-version-is-even gobject-introsp=
ection ptest-gnome
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ea=
d0d \
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a=
770 \
                     file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De0=
59138481205ee2c6fc1c079c016d0d"
=20
 S =3D "${WORKDIR}/gstreamer-${PV}"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$=
{PV}.tar.xz \
            file://run-ptest \
-           file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-=
fal.patch \
-           file://0002-Remove-unused-valgrind-detection.patch \
-           file://0003-tests-seek-Don-t-use-too-strict-timeout-for-valid=
ati.patch \
-           file://0004-tests-respect-the-idententaion-used-in-meson.patc=
h \
-           file://0005-tests-add-support-for-install-the-tests.patch \
-           file://0006-tests-use-a-dictionaries-for-environment.patch \
-           file://0007-tests-install-the-environment-for-installed_tests=
.patch \
+           file://0001-tests-respect-the-idententaion-used-in-meson.patc=
h \
+           file://0002-tests-add-support-for-install-the-tests.patch \
+           file://0003-tests-use-a-dictionaries-for-environment.patch \
+           file://0004-tests-add-helper-script-to-run-the-installed_test=
s.patch \
+           file://0005-tests-remove-gstbin-test_watch_for_state_change-t=
est.patch \
            "
-SRC_URI[sha256sum] =3D "55862232a63459bbf56abebde3085ca9aec211b478e891da=
cea4d6df8cafe80a"
+SRC_URI[sha256sum] =3D "4829bf60e40c13f37605638c28ce2855e84b58dc380e4331=
838ae13c02c8c2aa"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)} \
                    check \
@@ -36,7 +34,7 @@ PACKAGECONFIG[debug] =3D "-Dgst_debug=3Dtrue,-Dgst_debu=
g=3Dfalse"
 PACKAGECONFIG[tracer-hooks] =3D "-Dtracer_hooks=3Dtrue,-Dtracer_hooks=3D=
false"
 PACKAGECONFIG[coretracers] =3D "-Dcoretracers=3Denabled,-Dcoretracers=3D=
disabled"
 PACKAGECONFIG[check] =3D "-Dcheck=3Denabled,-Dcheck=3Ddisabled"
-PACKAGECONFIG[tests] =3D "-Dtests=3Denabled -Dinstalled-tests=3Dtrue,-Dt=
ests=3Ddisabled -Dinstalled-tests=3Dfalse"
+PACKAGECONFIG[tests] =3D "-Dtests=3Denabled -Dinstalled_tests=3Dtrue,-Dt=
ests=3Ddisabled -Dinstalled_tests=3Dfalse"
 PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,=
libunwind"
 PACKAGECONFIG[dw] =3D "-Dlibdw=3Denabled,-Dlibdw=3Ddisabled,elfutils"
 PACKAGECONFIG[bash-completion] =3D "-Dbash-completion=3Denabled,-Dbash-c=
ompletion=3Ddisabled,bash-completion"
--=20
2.34.1


