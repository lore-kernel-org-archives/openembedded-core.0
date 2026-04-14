Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45126F9D0E4
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 16:15:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.551.1776183333033288126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 09:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GPCWyJZN;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7707445E
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 09:15:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 360143F641
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776183332; bh=GyfpuIxfUxaIjAd0zqvpBcTMvnl3iHr8VNPh2O5viJc=;
	h=From:To:Subject:Date:From;
	b=GPCWyJZNRn7+f3aLpN23cW+DjAZKBkdA4AR271Ovf1+mzjojhs6LMyzvVDVjxcDtv
	 M6x5jINLDZV7Efiz+4cnmMKhvosbN2l5aQWCipXdbwSusbGoYVk+7wma0g/fheX7vk
	 W2E0UOnXIU04iTgNipgba8WlJb8MqSsgy8cwgY0I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libinput: backport fixes for CVE-2026-35093 and CVE-2026-35094
Date: Tue, 14 Apr 2026 17:15:29 +0100
Message-ID: <20260414161530.1279308-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 16:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235168

Backport the patches from upstream for these CVEs in the Lua plugin.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../wayland/libinput/CVE-2026-35093.patch     | 124 ++++++++++++
 .../wayland/libinput/CVE-2026-35094.patch     | 191 ++++++++++++++++++
 .../wayland/libinput_1.30.2.bb                |   2 +
 3 files changed, 317 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-35093=
.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-35094=
.patch

diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch =
b/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch
new file mode 100644
index 00000000000..e0119caaca1
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch
@@ -0,0 +1,124 @@
+From 356c498fd4ba25ec99f6866fc96847ec3d1f16bf Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 30 Mar 2026 11:35:35 +1000
+Subject: [PATCH] lua: force text mode for loading plugins
+
+luaL_loadfile() by default allows for both text files and precompiled
+lua files. Precompiled files are not verified on load allowing for a
+sandbox escape.
+
+CVE-2026-35093
+
+Fixes: #1271
+
+Found-by: Koen Tange <koen@monokles.eu>
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_reque=
sts/1459>
+
+CVE: CVE-2025-35093
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/libinput-plugin-lua.c |  2 +-
+ test/test-plugins-lua.c   | 69 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 70 insertions(+), 1 deletion(-)
+
+diff --git a/src/libinput-plugin-lua.c b/src/libinput-plugin-lua.c
+index c6f99a5f..2a09a64a 100644
+--- a/src/libinput-plugin-lua.c
++++ b/src/libinput-plugin-lua.c
+@@ -1362,7 +1362,7 @@ libinput_lua_plugin_new_from_path(struct libinput =
*libinput, const char *path)
+ 		return NULL;
+ 	}
+=20
+-	int ret =3D luaL_loadfile(L, path);
++	int ret =3D luaL_loadfilex(L, path, "t");
+ 	if (ret =3D=3D LUA_OK) {
+ 		plugin->L =3D steal(&L);
+=20
+diff --git a/test/test-plugins-lua.c b/test/test-plugins-lua.c
+index aba8f6c6..e61806d3 100644
+--- a/test/test-plugins-lua.c
++++ b/test/test-plugins-lua.c
+@@ -1204,10 +1204,79 @@ START_TEST(lua_remove_plugin_on_timeout)
+ }
+ END_TEST
+=20
++/* Pre-compiled Lua 5.4 bytecode for the following source:
++ *
++ *   libinput:register({1})
++ *   libinput:connect("new-evdev-device", function(device)
++ *       libinput:log_info("loaded from binary lua file")
++ *   end)
++ *
++ * To regenerate:
++ *   luac5.4 -o /dev/stdout /tmp/plugin.lua | xxd -i
++ */
++static const unsigned char binary_lua_plugin[] =3D {
++	0x1b, 0x4c, 0x75, 0x61, 0x54, 0x00, 0x19, 0x93, 0x0d, 0x0a, 0x1a, 0x0a=
, 0x04,
++	0x08, 0x08, 0x78, 0x56, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00=
, 0x00,
++	0x00, 0x00, 0x28, 0x77, 0x40, 0x01, 0x9b, 0x40, 0x74, 0x65, 0x73, 0x74=
, 0x2f,
++	0x31, 0x30, 0x2d, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x79, 0x2d, 0x70, 0x6c=
, 0x75,
++	0x67, 0x69, 0x6e, 0x2e, 0x6c, 0x75, 0x61, 0x80, 0x80, 0x00, 0x01, 0x04=
, 0x8e,
++	0x51, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x14, 0x80, 0x00, 0x01=
, 0x13,
++	0x01, 0x00, 0x01, 0x52, 0x00, 0x00, 0x00, 0x81, 0x01, 0x00, 0x80, 0x4e=
, 0x01,
++	0x01, 0x00, 0x44, 0x00, 0x03, 0x01, 0x0b, 0x00, 0x00, 0x00, 0x14, 0x80=
, 0x00,
++	0x02, 0x03, 0x81, 0x01, 0x00, 0xcf, 0x01, 0x00, 0x00, 0x44, 0x00, 0x04=
, 0x01,
++	0x46, 0x00, 0x01, 0x01, 0x84, 0x04, 0x89, 0x6c, 0x69, 0x62, 0x69, 0x6e=
, 0x70,
++	0x75, 0x74, 0x04, 0x89, 0x72, 0x65, 0x67, 0x69, 0x73, 0x74, 0x65, 0x72=
, 0x04,
++	0x88, 0x63, 0x6f, 0x6e, 0x6e, 0x65, 0x63, 0x74, 0x04, 0x91, 0x6e, 0x65=
, 0x77,
++	0x2d, 0x65, 0x76, 0x64, 0x65, 0x76, 0x2d, 0x64, 0x65, 0x76, 0x69, 0x63=
, 0x65,
++	0x81, 0x01, 0x00, 0x00, 0x81, 0x80, 0x8d, 0x8f, 0x01, 0x00, 0x04, 0x85=
, 0x8b,
++	0x00, 0x00, 0x00, 0x94, 0x80, 0x01, 0x01, 0x83, 0x01, 0x01, 0x00, 0xc4=
, 0x00,
++	0x03, 0x01, 0xc7, 0x00, 0x01, 0x00, 0x83, 0x04, 0x89, 0x6c, 0x69, 0x62=
, 0x69,
++	0x6e, 0x70, 0x75, 0x74, 0x04, 0x89, 0x6c, 0x6f, 0x67, 0x5f, 0x69, 0x6e=
, 0x66,
++	0x6f, 0x04, 0x9c, 0x6c, 0x6f, 0x61, 0x64, 0x65, 0x64, 0x20, 0x66, 0x72=
, 0x6f,
++	0x6d, 0x20, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x79, 0x20, 0x6c, 0x75, 0x61=
, 0x20,
++	0x66, 0x69, 0x6c, 0x65, 0x81, 0x00, 0x00, 0x00, 0x80, 0x85, 0x01, 0x00=
, 0x00,
++	0x00, 0x01, 0x80, 0x81, 0x87, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0x80=
, 0x85,
++	0x81, 0x85, 0x5f, 0x45, 0x4e, 0x56, 0x8e, 0x01, 0x0b, 0x00, 0x00, 0x00=
, 0x00,
++	0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0xfe, 0x02, 0x80, 0x80, 0x81, 0x85=
, 0x5f,
++	0x45, 0x4e, 0x56,
++};
++
++START_TEST(lua_reject_precompiled_files)
++{
++	_destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);
++
++	/* Write the binary bytecode to a .lua file in the tmpdir.
++	 * Binary (pre-compiled) Lua files must be rejected by the
++	 * plugin loader for security reasons. */
++	_autofree_ char *path =3D strdup_printf("%s/10-binary-plugin.lua", tmp=
dir->path);
++	_autoclose_ int fd =3D open(path, O_WRONLY | O_CREAT, 0644);
++	litest_assert_errno_success(fd);
++
++	ssize_t written =3D write(fd, binary_lua_plugin, sizeof(binary_lua_plu=
gin));
++	litest_assert_int_eq((int)written, (int)sizeof(binary_lua_plugin));
++	fsync(fd);
++
++	_litest_context_destroy_ struct libinput *li =3D
++		litest_create_context_with_plugindir(tmpdir->path);
++
++	litest_with_logcapture(li, capture) {
++		libinput_plugin_system_load_plugins(li,
++						    LIBINPUT_PLUGIN_SYSTEM_FLAG_NONE);
++		litest_drain_events(li);
++
++		size_t index =3D 0;
++		litest_assert(
++			strv_find_substring(capture->errors, "Failed to load", &index));
++		litest_assert_str_in(path, capture->errors[index]);
++	}
++}
++END_TEST
++
+ TEST_COLLECTION(lua)
+ {
+ 	/* clang-format off */
+ 	litest_add_no_device(lua_load_failure);
++	litest_add_no_device(lua_reject_precompiled_files);
+ 	litest_with_parameters(params,
+ 			       "content", 'I', 6,
+ 					litest_named_i32(EMPTY),
+--=20
+GitLab
+
diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch =
b/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch
new file mode 100644
index 00000000000..405a262b03e
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch
@@ -0,0 +1,191 @@
+From 45dfd0f0301af855f068df27b2e40cc9f5713acd Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 30 Mar 2026 09:41:08 +1000
+Subject: [PATCH] lua: separate the API from the metatables
+
+Previously we had one vtable for the libinputplugin and EvdevDevice
+objects. This allowed plugins to call __gc(), a decidedly internal
+method.
+
+This fixes a use-after-free: A plugin that called EvdevDevice::__gc()
+frees the plugin's copy of device->name but leaves the pointer in-place,
+a subsequent call will thus cause a UAF read.
+
+Fix this by separating what is the object's metatable from the public
+methods that are accessible to a plugin.
+
+CVE-2026-35094
+
+Fixes: #1272
+
+Found-by: Koen Tange <koen@monokles.eu>
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_reque=
sts/1459>
+
+CVE: CVE-2025-35094
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ src/libinput-plugin-lua.c | 54 +++++++++++++++++++++++++++++----------
+ test/test-plugins-lua.c   | 33 ++++++++++++++++++++++++
+ 2 files changed, 73 insertions(+), 14 deletions(-)
+
+diff --git a/src/libinput-plugin-lua.c b/src/libinput-plugin-lua.c
+index ac828f7f..c6f99a5f 100644
+--- a/src/libinput-plugin-lua.c
++++ b/src/libinput-plugin-lua.c
+@@ -562,6 +562,12 @@ libinputplugin_unregister(lua_State *L)
+ 	return luaL_error(L, "@@unregistering@@");
+ }
+=20
++static int
++readonly_newindex(lua_State *L)
++{
++	return luaL_error(L, "attempt to modify a read-only table");
++}
++
+ static int
+ libinputplugin_gc(lua_State *L)
+ {
+@@ -673,7 +679,28 @@ libinputplugin_log_error(lua_State *L)
+ 	return libinputplugin_log(L, LIBINPUT_LOG_PRIORITY_ERROR);
+ }
+=20
+-static const struct luaL_Reg libinputplugin_vtable[] =3D {
++static void
++setup_vfuncs(lua_State *L,
++	     const char *metatable_name,
++	     const struct luaL_Reg *vfuncs,
++	     const struct luaL_Reg *public_methods)
++{
++	luaL_newmetatable(L, metatable_name);
++	luaL_setfuncs(L, vfuncs, 0);
++
++	lua_newtable(L);
++	luaL_setfuncs(L, public_methods, 0);
++	lua_setfield(L, -2, "__index");
++
++	/* set metatable.__metatable =3D false to prevent a script from getmet=
atable(),
++	   which is blocked anyway but safe and sorry and whatnot */
++	lua_pushboolean(L, 0);
++	lua_setfield(L, -2, "__metatable");
++
++	lua_pop(L, 1);
++}
++
++static const struct luaL_Reg libinputplugin_methods[] =3D {
+ 	{ "now", libinputplugin_now },
+ 	{ "version", libinputplugin_version },
+ 	{ "connect", libinputplugin_connect },
+@@ -685,18 +712,18 @@ static const struct luaL_Reg libinputplugin_vtable=
[] =3D {
+ 	{ "log_debug", libinputplugin_log_debug },
+ 	{ "log_info", libinputplugin_log_info },
+ 	{ "log_error", libinputplugin_log_error },
+-	{ "__gc", libinputplugin_gc },
+ 	{ NULL, NULL }
+ };
+=20
++static const struct luaL_Reg libinputplugin_meta[] =3D { { "__gc", libi=
nputplugin_gc },
++						       { "__newindex",
++							 readonly_newindex },
++						       { NULL, NULL } };
++
+ static void
+ libinputplugin_init(lua_State *L)
+ {
+-	luaL_newmetatable(L, PLUGIN_METATABLE);
+-	lua_pushstring(L, "__index");
+-	lua_pushvalue(L, -2); /* push metatable */
+-	lua_settable(L, -3);  /* metatable.__index =3D metatable */
+-	luaL_setfuncs(L, libinputplugin_vtable, 0);
++	setup_vfuncs(L, PLUGIN_METATABLE, libinputplugin_meta, libinputplugin_=
methods);
+ }
+=20
+ static int
+@@ -1073,7 +1100,7 @@ evdevdevice_gc(lua_State *L)
+ 	return 0;
+ }
+=20
+-static const struct luaL_Reg evdevdevice_vtable[] =3D {
++static const struct luaL_Reg evdevdevice_methods[] =3D {
+ 	{ "info", evdevdevice_info },
+ 	{ "name", evdevdevice_name },
+ 	{ "usages", evdevdevice_usages },
+@@ -1087,18 +1114,17 @@ static const struct luaL_Reg evdevdevice_vtable[=
] =3D {
+ 	{ "prepend_frame", evdevdevice_prepend_frame },
+ 	{ "append_frame", evdevdevice_append_frame },
+ 	{ "disable_feature", evdevdevice_disable_feature },
+-	{ "__gc", evdevdevice_gc },
+ 	{ NULL, NULL }
+ };
+=20
++static const struct luaL_Reg evdevdevice_meta[] =3D { { "__gc", evdevde=
vice_gc },
++						    { "__newindex", readonly_newindex },
++						    { NULL, NULL } };
++
+ static void
+ evdevdevice_init(lua_State *L)
+ {
+-	luaL_newmetatable(L, EVDEV_DEVICE_METATABLE);
+-	lua_pushstring(L, "__index");
+-	lua_pushvalue(L, -2); /* push metatable */
+-	lua_settable(L, -3);  /* metatable.__index =3D metatable */
+-	luaL_setfuncs(L, evdevdevice_vtable, 0);
++	setup_vfuncs(L, EVDEV_DEVICE_METATABLE, evdevdevice_meta, evdevdevice_=
methods);
+ }
+=20
+ static void
+diff --git a/test/test-plugins-lua.c b/test/test-plugins-lua.c
+index 4d687203..aba8f6c6 100644
+--- a/test/test-plugins-lua.c
++++ b/test/test-plugins-lua.c
+@@ -526,6 +526,38 @@ START_TEST(lua_disallowed_functions)
+ }
+ END_TEST
+=20
++START_TEST(lua_gc_not_accessible)
++{
++	_destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);
++	const char *lua =3D
++		"libinput:register({1})\n"
++		"assert(libinput.__gc =3D=3D nil)\n"
++		"function check_device_gc(device)\n"
++		"  assert(device.__gc =3D=3D nil)\n"
++		"  libinput:log_info(\"gc_not_accessible: ok\")\n"
++		"end\n"
++		"libinput:connect(\"new-evdev-device\", check_device_gc)\n";
++
++	_autofree_ char *path =3D litest_write_plugin(tmpdir->path, lua);
++	_litest_context_destroy_ struct libinput *li =3D
++		litest_create_context_with_plugindir(tmpdir->path);
++	if (libinput_log_get_priority(li) > LIBINPUT_LOG_PRIORITY_INFO)
++		libinput_log_set_priority(li, LIBINPUT_LOG_PRIORITY_INFO);
++
++	litest_with_logcapture(li, capture) {
++		libinput_plugin_system_load_plugins(li,
++						    LIBINPUT_PLUGIN_SYSTEM_FLAG_NONE);
++		litest_drain_events(li);
++
++		_destroy_(litest_device) *device =3D litest_add_device(li, LITEST_MOU=
SE);
++		litest_drain_events(li);
++
++		litest_assert_logcapture_no_errors(capture);
++		litest_assert_strv_substring(capture->infos, "gc_not_accessible: ok")=
;
++	}
++}
++END_TEST
++
+ START_TEST(lua_frame_handler)
+ {
+ 	_destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);
+@@ -1219,6 +1251,7 @@ TEST_COLLECTION(lua)
+ 	litest_add_no_device(lua_register_multiversions);
+ 	litest_add_no_device(lua_allowed_functions);
+ 	litest_add_no_device(lua_disallowed_functions);
++	litest_add_no_device(lua_gc_not_accessible);
+=20
+ 	litest_add_no_device(lua_frame_handler);
+ 	litest_add_no_device(lua_device_info);
+--=20
+GitLab
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.30.2.bb b/meta/reci=
pes-graphics/wayland/libinput_1.30.2.bb
index 5d9bfafaaa3..efd51809d8e 100644
--- a/meta/recipes-graphics/wayland/libinput_1.30.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.30.2.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbab4ac7dc1c1=
0bc0fb037dc76c46ef8a"
 DEPENDS =3D "libevdev udev"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=
=3Dhttps;branch=3D1.30-branch;tag=3D${PV} \
+           file://CVE-2026-35093.patch \
+           file://CVE-2026-35094.patch \
            file://run-ptest \
            "
 SRCREV =3D "042c5e6fd9cc910307027a1522453794b29f2c72"
--=20
2.43.0


