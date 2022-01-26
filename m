Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283F2C63684
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.10914.1643192914396609213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=OLGnRxrk;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D99A2801CF;
	Wed, 26 Jan 2022 11:28:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192912;
	bh=v/6GKLY9Fzt/xxbET92lAgfFg0tygiPtmQEcggzgyoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OLGnRxrkpUQPm0GleQnJlsHmJzJ5GMYb8lvwQG6Z/3hWan/zJCo4k5uP3lBLvj7yK
	 ZpsbxSM3Xwf69O5baKlf6gIVERdDCRSl3oZ3telr0AwDpJetIwylw+3fsEcKn+Umrh
	 sOVPWeqCZK2/mxumAB5QFe1XFXB3yN8A/uSvTswCc6KGPbP02DwYHV7IgK722woBsv
	 gp2xRXWg4fuxoPRuVJLW+81dYifT9NGU1I/9LLylXfc0sdhCoz86rgClYZBB0XT/sH
	 gbwKEpRJviBjDQOOVAbZEeuQuB7E+uaC0tZ5gXs5nC01GmNkQS9tOhNE58H++yO3Rw
	 pJDp64WAmniHA==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 01/12] gstreamer1.0: 1.18.5 -> 1.20.0
Date: Wed, 26 Jan 2022 11:28:03 +0100
Message-Id: <20220126102814.4173943-2-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126102814.4173943-1-ch@denx.de>
References: <20220126102814.4173943-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160967

Gstreamer moved to a monorepo structure, this commit changed to use one
SRC_URI defined in gstreamer1.0-source.inc, which all recipes use and
set their own `S`ource path to their subproject path.

Backported patches where remove and the other, which still apply where
updated.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 .../gstreamer/gstreamer1.0-source.inc         |   5 +
 ...der.c-when-env-var-is-set-do-not-fal.patch |  69 -----------
 ...pect-the-idententaion-used-in-meson.patch} |  14 +--
 ...002-Remove-unused-valgrind-detection.patch | 112 ------------------
 ...s-add-support-for-install-the-tests.patch} |  67 +++++------
 ...-use-too-strict-timeout-for-validati.patch |  32 -----
 ...-use-a-dictionaries-for-environment.patch} |  28 ++---
 ...er-script-to-run-the-installed_tests.patch |  72 +++++++++++
 ...-the-environment-for-installed_tests.patch |  58 ---------
 ...er1.0_1.18.5.bb =3D> gstreamer1.0_1.20.0.bb} |  25 ++--
 10 files changed, 140 insertions(+), 342 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-source=
.inc
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-g=
st-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respec=
t-the-idententaion-used-in-meson.patch =3D> 0001-tests-respect-the-idente=
ntaion-used-in-meson.patch} (71%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-R=
emove-unused-valgrind-detection.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-su=
pport-for-install-the-tests.patch =3D> 0002-tests-add-support-for-install=
-the-tests.patch} (65%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-t=
ests-seek-Don-t-use-too-strict-timeout-for-validati.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-=
dictionaries-for-environment.patch =3D> 0003-tests-use-a-dictionaries-for=
-environment.patch} (61%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-t=
ests-add-helper-script-to-run-the-installed_tests.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-t=
ests-install-the-environment-for-installed_tests.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb =3D> gs=
treamer1.0_1.20.0.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-source.inc b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-source.inc
new file mode 100644
index 0000000000..ca38322576
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-source.inc
@@ -0,0 +1,5 @@
+REVISION =3D "4f7e881fcc2e6df3ce04584cf5edb07b2682891a"
+
+SRC_BASE =3D "${WORKDIR}/gstreamer-${REVISION}"
+SRC_URI =3D "https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archiv=
e/${REVISION}/gstreamer-${REVISION}.tar.gz"
+SRC_URI[sha256sum] =3D "bc9f6b9402d7575d8a7490f0aae347e6b524741cc459cb7a=
a25040fb55fcb606"
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
similarity index 71%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-res=
pect-the-idententaion-used-in-meson.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respe=
ct-the-idententaion-used-in-meson.patch
index 6f571a12d8..112968e15a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-t=
he-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-t=
he-idententaion-used-in-meson.patch
@@ -1,19 +1,17 @@
-From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17 00:00:00 2001
+From 16e2b48c97386ddc8330575bcfb56a5915385813 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH 1/4] tests: respect the idententaion used in meson
=20
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst=
reamer/-/merge_requests/789]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
- tests/check/meson.build | 10 +++++-----
+ subprojects/gstreamer/tests/check/meson.build | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
=20
-diff --git a/tests/check/meson.build b/tests/check/meson.build
-index a617cf159..b2636714b 100644
---- a/tests/check/meson.build
-+++ b/tests/check/meson.build
+diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects=
/gstreamer/tests/check/meson.build
+index 9c4228b6e4..506606684d 100644
+--- a/subprojects/gstreamer/tests/check/meson.build
++++ b/subprojects/gstreamer/tests/check/meson.build
 @@ -146,11 +146,11 @@ foreach t : core_tests
 =20
    if not skip_test
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
similarity index 65%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add=
-support-for-install-the-tests.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-s=
upport-for-install-the-tests.patch
index b77fb5797f..82b57df627 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-suppo=
rt-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-suppo=
rt-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17 00:00:00 2001
+From 6f3a4e2dc26c8a1ec145b9a364b0b0f61c9ffba2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH 2/4] tests: add support for install the tests
@@ -8,57 +8,45 @@ This will provide to run the tests using the gnome-desk=
top-testing [1]
 [1] https://wiki.gnome.org/Initiatives/GnomeGoals/InstalledTests
=20
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst=
reamer/-/merge_requests/789]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
- meson.build             |  5 +++++
- meson_options.txt       |  1 +
- template.test.in        |  3 +++
- tests/check/meson.build | 22 +++++++++++++++++++++-
- 4 files changed, 30 insertions(+), 1 deletion(-)
- create mode 100644 template.test.in
+ subprojects/gstreamer/meson.build             |  4 ++++
+ subprojects/gstreamer/meson_options.txt       |  1 +
+ subprojects/gstreamer/tests/check/meson.build | 22 ++++++++++++++++++-
+ .../gstreamer/tests/check/template.test.in    |  3 +++
+ 4 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 subprojects/gstreamer/tests/check/template.test.in
=20
-diff --git a/meson.build b/meson.build
-index c4e8774f5..1abf4eb26 100644
---- a/meson.build
-+++ b/meson.build
-@@ -562,6 +562,11 @@ if bashcomp_dep.found()
+diff --git a/subprojects/gstreamer/meson.build b/subprojects/gstreamer/m=
eson.build
+index 5bb5ccb3e6..f031a1c33f 100644
+--- a/subprojects/gstreamer/meson.build
++++ b/subprojects/gstreamer/meson.build
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
-diff --git a/meson_options.txt b/meson_options.txt
-index c8cee3762..b5da40eaa 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
+diff --git a/subprojects/gstreamer/meson_options.txt b/subprojects/gstre=
amer/meson_options.txt
+index 7363bdb7a1..a34ba37dad 100644
+--- a/subprojects/gstreamer/meson_options.txt
++++ b/subprojects/gstreamer/meson_options.txt
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
-diff --git a/tests/check/meson.build b/tests/check/meson.build
-index b2636714b..a697a7b06 100644
---- a/tests/check/meson.build
-+++ b/tests/check/meson.build
+diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects=
/gstreamer/tests/check/meson.build
+index 506606684d..00a138a568 100644
+--- a/subprojects/gstreamer/tests/check/meson.build
++++ b/subprojects/gstreamer/tests/check/meson.build
 @@ -124,10 +124,16 @@ test_defines =3D [
    '-UG_DISABLE_ASSERT',
    '-UG_DISABLE_CAST_CHECKS',
@@ -95,7 +83,7 @@ index b2636714b..a697a7b06 100644
 +      test_conf.set('installed_tests_dir', join_paths(prefix, installed=
_tests_execdir))
 +      test_conf.set('program', test_name)
 +      configure_file(
-+        input: installed_tests_template,
++        input: 'template.test.in',
 +        output: test_name + '.test',
 +        install_dir: installed_tests_metadir,
 +        configuration: test_conf
@@ -105,6 +93,15 @@ index b2636714b..a697a7b06 100644
      test(test_name, exe, env: env, timeout : 3 * 60)
    endif
  endforeach
+diff --git a/subprojects/gstreamer/tests/check/template.test.in b/subpro=
jects/gstreamer/tests/check/template.test.in
+new file mode 100644
+index 0000000000..f701627f87
+--- /dev/null
++++ b/subprojects/gstreamer/tests/check/template.test.in
+@@ -0,0 +1,3 @@
++[Test]
++Type=3Dsession
++Exec=3D@installed_tests_dir@/@program@
 --=20
 2.31.1
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
similarity index 61%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use=
-a-dictionaries-for-environment.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a=
-dictionaries-for-environment.patch
index 46813cec3d..0931f3165a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dic=
tionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dic=
tionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17 00:00:00 2001
+From da6b9ee334de4cce37b1e83ec380e1a28d8ab797 Mon Sep 17 00:00:00 2001
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
+ subprojects/gstreamer/tests/check/meson.build | 21 ++++++++++++-------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
=20
-diff --git a/tests/check/meson.build b/tests/check/meson.build
-index a697a7b06..f64524904 100644
---- a/tests/check/meson.build
-+++ b/tests/check/meson.build
-@@ -161,14 +161,17 @@ foreach t : core_tests
+diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects=
/gstreamer/tests/check/meson.build
+index 00a138a568..48ec2532f8 100644
+--- a/subprojects/gstreamer/tests/check/meson.build
++++ b/subprojects/gstreamer/tests/check/meson.build
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-ad=
d-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedi=
a/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installe=
d_tests.patch
new file mode 100644
index 0000000000..3dc5cb9686
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helpe=
r-script-to-run-the-installed_tests.patch
@@ -0,0 +1,72 @@
+From 0dbd1a6fee745baab4d08d1f97d9eb858c8f6781 Mon Sep 17 00:00:00 2001
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
+ subprojects/gstreamer/tests/check/meson.build   | 17 +++++++++++++++++
+ .../gstreamer/tests/check/template.sh.in        |  9 +++++++++
+ .../gstreamer/tests/check/template.test.in      |  2 +-
+ 3 files changed, 27 insertions(+), 1 deletion(-)
+ create mode 100755 subprojects/gstreamer/tests/check/template.sh.in
+
+diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects=
/gstreamer/tests/check/meson.build
+index 48ec2532f8..7dc4990d4e 100644
+--- a/subprojects/gstreamer/tests/check/meson.build
++++ b/subprojects/gstreamer/tests/check/meson.build
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
+diff --git a/subprojects/gstreamer/tests/check/template.sh.in b/subproje=
cts/gstreamer/tests/check/template.sh.in
+new file mode 100755
+index 0000000000..cf7d31b0ea
+--- /dev/null
++++ b/subprojects/gstreamer/tests/check/template.sh.in
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
+diff --git a/subprojects/gstreamer/tests/check/template.test.in b/subpro=
jects/gstreamer/tests/check/template.test.in
+index f701627f87..b74ef6ad73 100644
+--- a/subprojects/gstreamer/tests/check/template.test.in
++++ b/subprojects/gstreamer/tests/check/template.test.in
+@@ -1,3 +1,3 @@
+ [Test]
+ Type=3Dsession
+-Exec=3D@installed_tests_dir@/@program@
++Exec=3D@installed_tests_dir@/@program@.sh
+--=20
+2.31.1
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
eta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
index 0d82dd338c..7458b158b1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
@@ -10,22 +10,19 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 bison-n=
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
-S =3D "${WORKDIR}/gstreamer-${PV}"
+require gstreamer1.0-source.inc
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$=
{PV}.tar.xz \
-           file://run-ptest \
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
-           "
-SRC_URI[sha256sum] =3D "55862232a63459bbf56abebde3085ca9aec211b478e891da=
cea4d6df8cafe80a"
+S =3D "${SRC_BASE}/subprojects/gstreamer"
+
+SRC_URI +=3D "file://run-ptest \
+            file://0001-tests-respect-the-idententaion-used-in-meson.pat=
ch;patchdir=3D${SRC_BASE} \
+            file://0002-tests-add-support-for-install-the-tests.patch;pa=
tchdir=3D${SRC_BASE} \
+            file://0003-tests-use-a-dictionaries-for-environment.patch;p=
atchdir=3D${SRC_BASE} \
+            file://0004-tests-add-helper-script-to-run-the-installed_tes=
ts.patch;patchdir=3D${SRC_BASE} \
+            "
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)} \
                    check \
@@ -36,7 +33,7 @@ PACKAGECONFIG[debug] =3D "-Dgst_debug=3Dtrue,-Dgst_debu=
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


