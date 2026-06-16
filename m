Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62695CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 11:23:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151759.1781608991800713423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 04:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0jN/+AJQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2555197f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 04:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781608990; cv=none;
        d=google.com; s=arc-20240605;
        b=WdKfpw+0a6NhSdRoWD3ooloO6WBYmEyhmbYVFxOLpfCwcGpIk6Mouta23e6D0rm2JL
         QS0tXnRub2mmRI2exW867pk5GqozV+72xmLbr01c+nMIBke+iEmLl/SL68rzeACwdDTm
         vPvxBJXIdJhhFCdFpZ0v6COgF//gAIAepwzVd6ZOZlE0vELgqJIpymqNNpvhRekJTBCG
         sC8WoWhOhYERQugXk6z2RyvcxBZL8nhsbK9RZMB9JeIRf3DcHG2SDviOsoTCi/8b5Usi
         MuKky3vJO43OHDRmnl9Gs1Yvn2Orf8eqJ+ZQKgMRtpLfAxmKtdSAaBbnSRYI5nb4w8H0
         lj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QZKIttvOTtQ99YJWgB6dcpqY8s/YkLAGj+9U/gcBsbk=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=KLIXqlkZoFbfkrYpzTgffuJS8GDUIMRvDt8AbqHKSOWnEC0+NYhByd+5n+I1SqIKrg
         cOWK10AUqFX0v1abo62xbveVUtpIxreGKkPYANzIs2rFXzHUpCP87OJzAFTZHEC0TZOM
         YkYvuozeRN7rg4fYV2uvcP82mlxuWKZ5+g7Xtt8JM9Cb6ergMjO/FrIAaUe4MwVdNXjv
         FXD8uqhidSPfcKWSzO/BgdO55l725h/59VnBXJAUjeny4+e5Pb/JRRGg4bMbwBgtWmTg
         CGfSGV8+NMiilU7HCD5Rg/b+yI1ItTuaN0DdiqR2/xtzkFjriHN8+8Y+iwgYQMyevqJm
         zL8w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781608990; x=1782213790; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QZKIttvOTtQ99YJWgB6dcpqY8s/YkLAGj+9U/gcBsbk=;
        b=0jN/+AJQHRlnIU/62Mpobvhz5oUR8fRE3TmjZu/MTuQbIQO0+yjYnt3UqFcpCnK7lz
         DUiLlpuxtRgLfu7mOK+I4MZVPmZ29pT+SWEW8vL/3PJEJneF3UkOcsEtGyxE61+nktLs
         hWLYBp/zXRIWfeodmU14YqV9RPDaj7kj6dQ38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608990; x=1782213790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZKIttvOTtQ99YJWgB6dcpqY8s/YkLAGj+9U/gcBsbk=;
        b=gel0A6N+NFH6W3rzRnsm4b7jTUGvMgYa0m1qdX5EvMualcYpD1T8kFM1RfSPYdy89f
         i96kZGJ1TNQKHOu1IFq1AjVrmdtwUTLDVKhAia7oGRqQVJI7bF6eIcEIMdBZCZ3J1v69
         /VrytyJd1BQqMqFG0GeA8BlbIjIQn7KFl8OcbfME2k2Av4NE1IBrcAWOhixyoP18M0VW
         glc3ajdD51EErShEF+fHb5Q0QvmM1OYrIcgesF9Zv8NcE1YT5BueerZf8SQWge9LxHUj
         oG+ODBbMMw1PKD4gWvmKEWHD6OSOCgaE+Qi73NZPGHWaalFj6SJmQNrNSY3PqBIJIBT4
         g0Cw==
X-Gm-Message-State: AOJu0YwqSF0yGMNhhm4WZjgrIZbjbCvBmWnV94HCKUPIrY2hRJHlbKeL
	G0ppMaYENDiX4klABItAv4eGyf9uTt0+5pmSHUK/I4Hi1nlBCWgkmNzBJPs9kqa9pargnhwvo4A
	GuKm3Raq49Pyewg6H7u0+h0q4i68tsuAd35DEW8yfsw==
X-Gm-Gg: Acq92OF0dfQgqGC8KXw6fQh4DvFQF4m94HqGIlpXFR11ePdtAMWqVfJXLJ/vdQ2hals
	GqFnrtM7pXPmSvrUfqyiwAvkSRBRaw6NIWcX+q5+cOLAeZvKlSSx0LlVtXH8zT+NGLiSbgrhh7I
	sgC/AaYnquLKDRNhRMftmd24NuEvmmfXxD/SIHfvfHTBl3IVCdZyhli0+WCdnGhrdPB01WAS4kL
	WsVLMN1IDKID/Knj/iQQNvfFahKOVm1oaOclQojyBiPILmI43B03PjzZxIJyJ8GrKK94WTYGXOm
	DZh3KHxQCoq9JPIxktNrBEpGQovVxgAikVxRhmKIQw==
X-Received: by 2002:a05:6000:41c5:b0:45e:f188:393d with SMTP id
 ffacd0b85a97d-46077f2bc02mr21144989f8f.29.1781608989658; Tue, 16 Jun 2026
 04:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260616111643.4091790-1-ross.burton@arm.com> <403067FE-DF56-41BD-90AE-C6646A94928B@arm.com>
In-Reply-To: <403067FE-DF56-41BD-90AE-C6646A94928B@arm.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 16 Jun 2026 13:22:43 +0200
X-Gm-Features: AVVi8Cchcxai4_kckqhXqzx1f5ZQopS1oUoz0Zc99SMOfsJB41wBZ93IsF5Qt8A
Message-ID: <CAMSfU+7Dox-KU-VCjKaa8fT+NzuoyXdQC8jDjCo4KedQdfwQNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libinput: upgrade 1.30.2 -> 1.30.4
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f5272a06545d2a5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 11:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238893

--000000000000f5272a06545d2a5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 16 juin 2026 =C3=A0 13:19, Ross Burton <Ross.Burton@arm.com> a =C3=
=A9crit :

> Note that I sent this as two upgrades because the 1.30.4 upgrade is a goo=
d
> candidate for the wrynose branch as the only commits since 1.30.4 are CVE
> fixes.
>

Thanks Ross,
I've noted to check that after the master merge.


>
> Ross
>
> > On 16 Jun 2026, at 12:16, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > libinput 1.30.3:
> >
> > This release contains just the CVE patches that we backported.
> >
> > libinput 1.30.4:
> >
> > This release contains a fix for todays security advisory: CVE-2026-5026=
5.
> > libinput-device-group now sanitizes the PHYS value which prevents local
> > privilege escalation through udev property injection. As said in the
> advisory
> > this is only a security issue if you have a udev rule in place that
> allows
> > users to create uinput devices.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> > .../wayland/libinput/CVE-2026-35093.patch     | 124 ------------
> > .../wayland/libinput/CVE-2026-35094.patch     | 191 ------------------
> > ...{libinput_1.30.2.bb =3D> libinput_1.30.4.bb} |   4 +-
> > 3 files changed, 1 insertion(+), 318 deletions(-)
> > delete mode 100644
> meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch
> > delete mode 100644
> meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch
> > rename meta/recipes-graphics/wayland/{libinput_1.30.2.bb =3D>
> libinput_1.30.4.bb} (93%)
> >
> > diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patc=
h
> b/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch
> > deleted file mode 100644
> > index e0119caaca1..00000000000
> > --- a/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch
> > +++ /dev/null
> > @@ -1,124 +0,0 @@
> > -From 356c498fd4ba25ec99f6866fc96847ec3d1f16bf Mon Sep 17 00:00:00 2001
> > -From: Peter Hutterer <peter.hutterer@who-t.net>
> > -Date: Mon, 30 Mar 2026 11:35:35 +1000
> > -Subject: [PATCH] lua: force text mode for loading plugins
> > -
> > -luaL_loadfile() by default allows for both text files and precompiled
> > -lua files. Precompiled files are not verified on load allowing for a
> > -sandbox escape.
> > -
> > -CVE-2026-35093
> > -
> > -Fixes: #1271
> > -
> > -Found-by: Koen Tange <koen@monokles.eu>
> > -Part-of: <
> https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1459>
> > -
> > -CVE: CVE-2025-35093
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ----
> > - src/libinput-plugin-lua.c |  2 +-
> > - test/test-plugins-lua.c   | 69 ++++++++++++++++++++++++++++++++++++++=
+
> > - 2 files changed, 70 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/src/libinput-plugin-lua.c b/src/libinput-plugin-lua.c
> > -index c6f99a5f..2a09a64a 100644
> > ---- a/src/libinput-plugin-lua.c
> > -+++ b/src/libinput-plugin-lua.c
> > -@@ -1362,7 +1362,7 @@ libinput_lua_plugin_new_from_path(struct libinpu=
t
> *libinput, const char *path)
> > - return NULL;
> > - }
> > -
> > -- int ret =3D luaL_loadfile(L, path);
> > -+ int ret =3D luaL_loadfilex(L, path, "t");
> > - if (ret =3D=3D LUA_OK) {
> > - plugin->L =3D steal(&L);
> > -
> > -diff --git a/test/test-plugins-lua.c b/test/test-plugins-lua.c
> > -index aba8f6c6..e61806d3 100644
> > ---- a/test/test-plugins-lua.c
> > -+++ b/test/test-plugins-lua.c
> > -@@ -1204,10 +1204,79 @@ START_TEST(lua_remove_plugin_on_timeout)
> > - }
> > - END_TEST
> > -
> > -+/* Pre-compiled Lua 5.4 bytecode for the following source:
> > -+ *
> > -+ *   libinput:register({1})
> > -+ *   libinput:connect("new-evdev-device", function(device)
> > -+ *       libinput:log_info("loaded from binary lua file")
> > -+ *   end)
> > -+ *
> > -+ * To regenerate:
> > -+ *   luac5.4 -o /dev/stdout /tmp/plugin.lua | xxd -i
> > -+ */
> > -+static const unsigned char binary_lua_plugin[] =3D {
> > -+ 0x1b, 0x4c, 0x75, 0x61, 0x54, 0x00, 0x19, 0x93, 0x0d, 0x0a, 0x1a,
> 0x0a, 0x04,
> > -+ 0x08, 0x08, 0x78, 0x56, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> 0x00, 0x00,
> > -+ 0x00, 0x00, 0x28, 0x77, 0x40, 0x01, 0x9b, 0x40, 0x74, 0x65, 0x73,
> 0x74, 0x2f,
> > -+ 0x31, 0x30, 0x2d, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x79, 0x2d, 0x70,
> 0x6c, 0x75,
> > -+ 0x67, 0x69, 0x6e, 0x2e, 0x6c, 0x75, 0x61, 0x80, 0x80, 0x00, 0x01,
> 0x04, 0x8e,
> > -+ 0x51, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x14, 0x80, 0x00,
> 0x01, 0x13,
> > -+ 0x01, 0x00, 0x01, 0x52, 0x00, 0x00, 0x00, 0x81, 0x01, 0x00, 0x80,
> 0x4e, 0x01,
> > -+ 0x01, 0x00, 0x44, 0x00, 0x03, 0x01, 0x0b, 0x00, 0x00, 0x00, 0x14,
> 0x80, 0x00,
> > -+ 0x02, 0x03, 0x81, 0x01, 0x00, 0xcf, 0x01, 0x00, 0x00, 0x44, 0x00,
> 0x04, 0x01,
> > -+ 0x46, 0x00, 0x01, 0x01, 0x84, 0x04, 0x89, 0x6c, 0x69, 0x62, 0x69,
> 0x6e, 0x70,
> > -+ 0x75, 0x74, 0x04, 0x89, 0x72, 0x65, 0x67, 0x69, 0x73, 0x74, 0x65,
> 0x72, 0x04,
> > -+ 0x88, 0x63, 0x6f, 0x6e, 0x6e, 0x65, 0x63, 0x74, 0x04, 0x91, 0x6e,
> 0x65, 0x77,
> > -+ 0x2d, 0x65, 0x76, 0x64, 0x65, 0x76, 0x2d, 0x64, 0x65, 0x76, 0x69,
> 0x63, 0x65,
> > -+ 0x81, 0x01, 0x00, 0x00, 0x81, 0x80, 0x8d, 0x8f, 0x01, 0x00, 0x04,
> 0x85, 0x8b,
> > -+ 0x00, 0x00, 0x00, 0x94, 0x80, 0x01, 0x01, 0x83, 0x01, 0x01, 0x00,
> 0xc4, 0x00,
> > -+ 0x03, 0x01, 0xc7, 0x00, 0x01, 0x00, 0x83, 0x04, 0x89, 0x6c, 0x69,
> 0x62, 0x69,
> > -+ 0x6e, 0x70, 0x75, 0x74, 0x04, 0x89, 0x6c, 0x6f, 0x67, 0x5f, 0x69,
> 0x6e, 0x66,
> > -+ 0x6f, 0x04, 0x9c, 0x6c, 0x6f, 0x61, 0x64, 0x65, 0x64, 0x20, 0x66,
> 0x72, 0x6f,
> > -+ 0x6d, 0x20, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x79, 0x20, 0x6c, 0x75,
> 0x61, 0x20,
> > -+ 0x66, 0x69, 0x6c, 0x65, 0x81, 0x00, 0x00, 0x00, 0x80, 0x85, 0x01,
> 0x00, 0x00,
> > -+ 0x00, 0x01, 0x80, 0x81, 0x87, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65,
> 0x80, 0x85,
> > -+ 0x81, 0x85, 0x5f, 0x45, 0x4e, 0x56, 0x8e, 0x01, 0x0b, 0x00, 0x00,
> 0x00, 0x00,
> > -+ 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0xfe, 0x02, 0x80, 0x80, 0x81,
> 0x85, 0x5f,
> > -+ 0x45, 0x4e, 0x56,
> > -+};
> > -+
> > -+START_TEST(lua_reject_precompiled_files)
> > -+{
> > -+ _destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);
> > -+
> > -+ /* Write the binary bytecode to a .lua file in the tmpdir.
> > -+ * Binary (pre-compiled) Lua files must be rejected by the
> > -+ * plugin loader for security reasons. */
> > -+ _autofree_ char *path =3D strdup_printf("%s/10-binary-plugin.lua",
> tmpdir->path);
> > -+ _autoclose_ int fd =3D open(path, O_WRONLY | O_CREAT, 0644);
> > -+ litest_assert_errno_success(fd);
> > -+
> > -+ ssize_t written =3D write(fd, binary_lua_plugin,
> sizeof(binary_lua_plugin));
> > -+ litest_assert_int_eq((int)written, (int)sizeof(binary_lua_plugin));
> > -+ fsync(fd);
> > -+
> > -+ _litest_context_destroy_ struct libinput *li =3D
> > -+ litest_create_context_with_plugindir(tmpdir->path);
> > -+
> > -+ litest_with_logcapture(li, capture) {
> > -+ libinput_plugin_system_load_plugins(li,
> > -+    LIBINPUT_PLUGIN_SYSTEM_FLAG_NONE);
> > -+ litest_drain_events(li);
> > -+
> > -+ size_t index =3D 0;
> > -+ litest_assert(
> > -+ strv_find_substring(capture->errors, "Failed to load", &index));
> > -+ litest_assert_str_in(path, capture->errors[index]);
> > -+ }
> > -+}
> > -+END_TEST
> > -+
> > - TEST_COLLECTION(lua)
> > - {
> > - /* clang-format off */
> > - litest_add_no_device(lua_load_failure);
> > -+ litest_add_no_device(lua_reject_precompiled_files);
> > - litest_with_parameters(params,
> > -       "content", 'I', 6,
> > - litest_named_i32(EMPTY),
> > ---
> > -GitLab
> > -
> > diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patc=
h
> b/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch
> > deleted file mode 100644
> > index 405a262b03e..00000000000
> > --- a/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch
> > +++ /dev/null
> > @@ -1,191 +0,0 @@
> > -From 45dfd0f0301af855f068df27b2e40cc9f5713acd Mon Sep 17 00:00:00 2001
> > -From: Peter Hutterer <peter.hutterer@who-t.net>
> > -Date: Mon, 30 Mar 2026 09:41:08 +1000
> > -Subject: [PATCH] lua: separate the API from the metatables
> > -
> > -Previously we had one vtable for the libinputplugin and EvdevDevice
> > -objects. This allowed plugins to call __gc(), a decidedly internal
> > -method.
> > -
> > -This fixes a use-after-free: A plugin that called EvdevDevice::__gc()
> > -frees the plugin's copy of device->name but leaves the pointer in-plac=
e,
> > -a subsequent call will thus cause a UAF read.
> > -
> > -Fix this by separating what is the object's metatable from the public
> > -methods that are accessible to a plugin.
> > -
> > -CVE-2026-35094
> > -
> > -Fixes: #1272
> > -
> > -Found-by: Koen Tange <koen@monokles.eu>
> > -Part-of: <
> https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1459>
> > -
> > -CVE: CVE-2025-35094
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > ----
> > - src/libinput-plugin-lua.c | 54 +++++++++++++++++++++++++++++---------=
-
> > - test/test-plugins-lua.c   | 33 ++++++++++++++++++++++++
> > - 2 files changed, 73 insertions(+), 14 deletions(-)
> > -
> > -diff --git a/src/libinput-plugin-lua.c b/src/libinput-plugin-lua.c
> > -index ac828f7f..c6f99a5f 100644
> > ---- a/src/libinput-plugin-lua.c
> > -+++ b/src/libinput-plugin-lua.c
> > -@@ -562,6 +562,12 @@ libinputplugin_unregister(lua_State *L)
> > - return luaL_error(L, "@@unregistering@@");
> > - }
> > -
> > -+static int
> > -+readonly_newindex(lua_State *L)
> > -+{
> > -+ return luaL_error(L, "attempt to modify a read-only table");
> > -+}
> > -+
> > - static int
> > - libinputplugin_gc(lua_State *L)
> > - {
> > -@@ -673,7 +679,28 @@ libinputplugin_log_error(lua_State *L)
> > - return libinputplugin_log(L, LIBINPUT_LOG_PRIORITY_ERROR);
> > - }
> > -
> > --static const struct luaL_Reg libinputplugin_vtable[] =3D {
> > -+static void
> > -+setup_vfuncs(lua_State *L,
> > -+     const char *metatable_name,
> > -+     const struct luaL_Reg *vfuncs,
> > -+     const struct luaL_Reg *public_methods)
> > -+{
> > -+ luaL_newmetatable(L, metatable_name);
> > -+ luaL_setfuncs(L, vfuncs, 0);
> > -+
> > -+ lua_newtable(L);
> > -+ luaL_setfuncs(L, public_methods, 0);
> > -+ lua_setfield(L, -2, "__index");
> > -+
> > -+ /* set metatable.__metatable =3D false to prevent a script from
> getmetatable(),
> > -+   which is blocked anyway but safe and sorry and whatnot */
> > -+ lua_pushboolean(L, 0);
> > -+ lua_setfield(L, -2, "__metatable");
> > -+
> > -+ lua_pop(L, 1);
> > -+}
> > -+
> > -+static const struct luaL_Reg libinputplugin_methods[] =3D {
> > - { "now", libinputplugin_now },
> > - { "version", libinputplugin_version },
> > - { "connect", libinputplugin_connect },
> > -@@ -685,18 +712,18 @@ static const struct luaL_Reg
> libinputplugin_vtable[] =3D {
> > - { "log_debug", libinputplugin_log_debug },
> > - { "log_info", libinputplugin_log_info },
> > - { "log_error", libinputplugin_log_error },
> > -- { "__gc", libinputplugin_gc },
> > - { NULL, NULL }
> > - };
> > -
> > -+static const struct luaL_Reg libinputplugin_meta[] =3D { { "__gc",
> libinputplugin_gc },
> > -+       { "__newindex",
> > -+ readonly_newindex },
> > -+       { NULL, NULL } };
> > -+
> > - static void
> > - libinputplugin_init(lua_State *L)
> > - {
> > -- luaL_newmetatable(L, PLUGIN_METATABLE);
> > -- lua_pushstring(L, "__index");
> > -- lua_pushvalue(L, -2); /* push metatable */
> > -- lua_settable(L, -3);  /* metatable.__index =3D metatable */
> > -- luaL_setfuncs(L, libinputplugin_vtable, 0);
> > -+ setup_vfuncs(L, PLUGIN_METATABLE, libinputplugin_meta,
> libinputplugin_methods);
> > - }
> > -
> > - static int
> > -@@ -1073,7 +1100,7 @@ evdevdevice_gc(lua_State *L)
> > - return 0;
> > - }
> > -
> > --static const struct luaL_Reg evdevdevice_vtable[] =3D {
> > -+static const struct luaL_Reg evdevdevice_methods[] =3D {
> > - { "info", evdevdevice_info },
> > - { "name", evdevdevice_name },
> > - { "usages", evdevdevice_usages },
> > -@@ -1087,18 +1114,17 @@ static const struct luaL_Reg
> evdevdevice_vtable[] =3D {
> > - { "prepend_frame", evdevdevice_prepend_frame },
> > - { "append_frame", evdevdevice_append_frame },
> > - { "disable_feature", evdevdevice_disable_feature },
> > -- { "__gc", evdevdevice_gc },
> > - { NULL, NULL }
> > - };
> > -
> > -+static const struct luaL_Reg evdevdevice_meta[] =3D { { "__gc",
> evdevdevice_gc },
> > -+    { "__newindex", readonly_newindex },
> > -+    { NULL, NULL } };
> > -+
> > - static void
> > - evdevdevice_init(lua_State *L)
> > - {
> > -- luaL_newmetatable(L, EVDEV_DEVICE_METATABLE);
> > -- lua_pushstring(L, "__index");
> > -- lua_pushvalue(L, -2); /* push metatable */
> > -- lua_settable(L, -3);  /* metatable.__index =3D metatable */
> > -- luaL_setfuncs(L, evdevdevice_vtable, 0);
> > -+ setup_vfuncs(L, EVDEV_DEVICE_METATABLE, evdevdevice_meta,
> evdevdevice_methods);
> > - }
> > -
> > - static void
> > -diff --git a/test/test-plugins-lua.c b/test/test-plugins-lua.c
> > -index 4d687203..aba8f6c6 100644
> > ---- a/test/test-plugins-lua.c
> > -+++ b/test/test-plugins-lua.c
> > -@@ -526,6 +526,38 @@ START_TEST(lua_disallowed_functions)
> > - }
> > - END_TEST
> > -
> > -+START_TEST(lua_gc_not_accessible)
> > -+{
> > -+ _destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);
> > -+ const char *lua =3D
> > -+ "libinput:register({1})\n"
> > -+ "assert(libinput.__gc =3D=3D nil)\n"
> > -+ "function check_device_gc(device)\n"
> > -+ "  assert(device.__gc =3D=3D nil)\n"
> > -+ "  libinput:log_info(\"gc_not_accessible: ok\")\n"
> > -+ "end\n"
> > -+ "libinput:connect(\"new-evdev-device\", check_device_gc)\n";
> > -+
> > -+ _autofree_ char *path =3D litest_write_plugin(tmpdir->path, lua);
> > -+ _litest_context_destroy_ struct libinput *li =3D
> > -+ litest_create_context_with_plugindir(tmpdir->path);
> > -+ if (libinput_log_get_priority(li) > LIBINPUT_LOG_PRIORITY_INFO)
> > -+ libinput_log_set_priority(li, LIBINPUT_LOG_PRIORITY_INFO);
> > -+
> > -+ litest_with_logcapture(li, capture) {
> > -+ libinput_plugin_system_load_plugins(li,
> > -+    LIBINPUT_PLUGIN_SYSTEM_FLAG_NONE);
> > -+ litest_drain_events(li);
> > -+
> > -+ _destroy_(litest_device) *device =3D litest_add_device(li,
> LITEST_MOUSE);
> > -+ litest_drain_events(li);
> > -+
> > -+ litest_assert_logcapture_no_errors(capture);
> > -+ litest_assert_strv_substring(capture->infos, "gc_not_accessible: ok"=
);
> > -+ }
> > -+}
> > -+END_TEST
> > -+
> > - START_TEST(lua_frame_handler)
> > - {
> > - _destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);
> > -@@ -1219,6 +1251,7 @@ TEST_COLLECTION(lua)
> > - litest_add_no_device(lua_register_multiversions);
> > - litest_add_no_device(lua_allowed_functions);
> > - litest_add_no_device(lua_disallowed_functions);
> > -+ litest_add_no_device(lua_gc_not_accessible);
> > -
> > - litest_add_no_device(lua_frame_handler);
> > - litest_add_no_device(lua_device_info);
> > ---
> > -GitLab
> > -
> > diff --git a/meta/recipes-graphics/wayland/libinput_1.30.2.bb
> b/meta/recipes-graphics/wayland/libinput_1.30.4.bb
> > similarity index 93%
> > rename from meta/recipes-graphics/wayland/libinput_1.30.2.bb
> > rename to meta/recipes-graphics/wayland/libinput_1.30.4.bb
> > index efd51809d8e..8ce3d0d62cf 100644
> > --- a/meta/recipes-graphics/wayland/libinput_1.30.2.bb
> > +++ b/meta/recipes-graphics/wayland/libinput_1.30.4.bb
> > @@ -13,11 +13,9 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dbab4ac7dc1c10bc0fb037dc76c46ef8a"
> > DEPENDS =3D "libevdev udev"
> >
> > SRC_URI =3D "git://
> gitlab.freedesktop.org/libinput/libinput.git;protocol=3Dhttps;branch=3D1.=
30-branch;tag=3D${PV}
> <http://gitlab.freedesktop.org/libinput/libinput.git;protocol=3Dhttps;bra=
nch=3D1.30-branch;tag=3D$%7BPV%7D>
> \
> > -           file://CVE-2026-35093.patch \
> > -           file://CVE-2026-35094.patch \
> >            file://run-ptest \
> >            "
> > -SRCREV =3D "042c5e6fd9cc910307027a1522453794b29f2c72"
> > +SRCREV =3D "7ad8b37ffcc71aceb8eb4d079d22490e87168f49"
> >
> > UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> >
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#238890):
> https://lists.openembedded.org/g/openembedded-core/message/238890
> > Mute This Topic: https://lists.openembedded.org/mt/119831384/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
Yoann Congal
Smile ECS

--000000000000f5272a06545d2a5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 16=
 juin 2026 =C3=A0=C2=A013:19, Ross Burton &lt;<a href=3D"mailto:Ross.Burton=
@arm.com">Ross.Burton@arm.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Note that I sent this as two upgr=
ades because the 1.30.4 upgrade is a good candidate for the wrynose branch =
as the only commits since 1.30.4 are CVE fixes.<br></blockquote><div><br></=
div><div>Thanks Ross,</div><div>I&#39;ve noted to check that after the mast=
er merge.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Ross<br>
<br>
&gt; On 16 Jun 2026, at 12:16, Ross Burton via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" targ=
et=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; libinput 1.30.3:<br>
&gt; <br>
&gt; This release contains just the CVE patches that we backported.<br>
&gt; <br>
&gt; libinput 1.30.4:<br>
&gt; <br>
&gt; This release contains a fix for todays security advisory: CVE-2026-502=
65.<br>
&gt; libinput-device-group now sanitizes the PHYS value which prevents loca=
l<br>
&gt; privilege escalation through udev property injection. As said in the a=
dvisory<br>
&gt; this is only a security issue if you have a udev rule in place that al=
lows<br>
&gt; users to create uinput devices.<br>
&gt; <br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt; .../wayland/libinput/CVE-2026-35093.patch=C2=A0 =C2=A0 =C2=A0| 124 ---=
---------<br>
&gt; .../wayland/libinput/CVE-2026-35094.patch=C2=A0 =C2=A0 =C2=A0| 191 ---=
---------------<br>
&gt; ...{<a href=3D"http://libinput_1.30.2.bb" rel=3D"noreferrer" target=3D=
"_blank">libinput_1.30.2.bb</a> =3D&gt; <a href=3D"http://libinput_1.30.4.b=
b" rel=3D"noreferrer" target=3D"_blank">libinput_1.30.4.bb</a>} |=C2=A0 =C2=
=A04 +-<br>
&gt; 3 files changed, 1 insertion(+), 318 deletions(-)<br>
&gt; delete mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-350=
93.patch<br>
&gt; delete mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-350=
94.patch<br>
&gt; rename meta/recipes-graphics/wayland/{<a href=3D"http://libinput_1.30.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.30.2.bb</a> =3D&gt; <=
a href=3D"http://libinput_1.30.4.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibinput_1.30.4.bb</a>} (93%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.pat=
ch b/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch<br>
&gt; deleted file mode 100644<br>
&gt; index e0119caaca1..00000000000<br>
&gt; --- a/meta/recipes-graphics/wayland/libinput/CVE-2026-35093.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,124 +0,0 @@<br>
&gt; -From 356c498fd4ba25ec99f6866fc96847ec3d1f16bf Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; -Date: Mon, 30 Mar 2026 11:35:35 +1000<br>
&gt; -Subject: [PATCH] lua: force text mode for loading plugins<br>
&gt; -<br>
&gt; -luaL_loadfile() by default allows for both text files and precompiled=
<br>
&gt; -lua files. Precompiled files are not verified on load allowing for a<=
br>
&gt; -sandbox escape.<br>
&gt; -<br>
&gt; -CVE-2026-35093<br>
&gt; -<br>
&gt; -Fixes: #1271<br>
&gt; -<br>
&gt; -Found-by: Koen Tange &lt;<a href=3D"mailto:koen@monokles.eu" target=
=3D"_blank">koen@monokles.eu</a>&gt;<br>
&gt; -Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/libinput/libin=
put/-/merge_requests/1459" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.freedesktop.org/libinput/libinput/-/merge_requests/1459</a>&gt;<br>
&gt; -<br>
&gt; -CVE: CVE-2025-35093<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/libinput-plugin-lua.c |=C2=A0 2 +-<br>
&gt; - test/test-plugins-lua.c=C2=A0 =C2=A0| 69 +++++++++++++++++++++++++++=
++++++++++++<br>
&gt; - 2 files changed, 70 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/libinput-plugin-lua.c b/src/libinput-plugin-lua.c<br=
>
&gt; -index c6f99a5f..2a09a64a 100644<br>
&gt; ---- a/src/libinput-plugin-lua.c<br>
&gt; -+++ b/src/libinput-plugin-lua.c<br>
&gt; -@@ -1362,7 +1362,7 @@ libinput_lua_plugin_new_from_path(struct libinp=
ut *libinput, const char *path)<br>
&gt; - return NULL;<br>
&gt; - }<br>
&gt; - <br>
&gt; -- int ret =3D luaL_loadfile(L, path);<br>
&gt; -+ int ret =3D luaL_loadfilex(L, path, &quot;t&quot;);<br>
&gt; - if (ret =3D=3D LUA_OK) {<br>
&gt; - plugin-&gt;L =3D steal(&amp;L);<br>
&gt; - <br>
&gt; -diff --git a/test/test-plugins-lua.c b/test/test-plugins-lua.c<br>
&gt; -index aba8f6c6..e61806d3 100644<br>
&gt; ---- a/test/test-plugins-lua.c<br>
&gt; -+++ b/test/test-plugins-lua.c<br>
&gt; -@@ -1204,10 +1204,79 @@ START_TEST(lua_remove_plugin_on_timeout)<br>
&gt; - }<br>
&gt; - END_TEST<br>
&gt; - <br>
&gt; -+/* Pre-compiled Lua 5.4 bytecode for the following source:<br>
&gt; -+ *<br>
&gt; -+ *=C2=A0 =C2=A0libinput:register({1})<br>
&gt; -+ *=C2=A0 =C2=A0libinput:connect(&quot;new-evdev-device&quot;, functi=
on(device)<br>
&gt; -+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0libinput:log_info(&quot;loaded from bin=
ary lua file&quot;)<br>
&gt; -+ *=C2=A0 =C2=A0end)<br>
&gt; -+ *<br>
&gt; -+ * To regenerate:<br>
&gt; -+ *=C2=A0 =C2=A0luac5.4 -o /dev/stdout /tmp/plugin.lua | xxd -i<br>
&gt; -+ */<br>
&gt; -+static const unsigned char binary_lua_plugin[] =3D {<br>
&gt; -+ 0x1b, 0x4c, 0x75, 0x61, 0x54, 0x00, 0x19, 0x93, 0x0d, 0x0a, 0x1a, 0=
x0a, 0x04,<br>
&gt; -+ 0x08, 0x08, 0x78, 0x56, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00, 0x00,<br>
&gt; -+ 0x00, 0x00, 0x28, 0x77, 0x40, 0x01, 0x9b, 0x40, 0x74, 0x65, 0x73, 0=
x74, 0x2f,<br>
&gt; -+ 0x31, 0x30, 0x2d, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x79, 0x2d, 0x70, 0=
x6c, 0x75,<br>
&gt; -+ 0x67, 0x69, 0x6e, 0x2e, 0x6c, 0x75, 0x61, 0x80, 0x80, 0x00, 0x01, 0=
x04, 0x8e,<br>
&gt; -+ 0x51, 0x00, 0x00, 0x00, 0x0b, 0x00, 0x00, 0x00, 0x14, 0x80, 0x00, 0=
x01, 0x13,<br>
&gt; -+ 0x01, 0x00, 0x01, 0x52, 0x00, 0x00, 0x00, 0x81, 0x01, 0x00, 0x80, 0=
x4e, 0x01,<br>
&gt; -+ 0x01, 0x00, 0x44, 0x00, 0x03, 0x01, 0x0b, 0x00, 0x00, 0x00, 0x14, 0=
x80, 0x00,<br>
&gt; -+ 0x02, 0x03, 0x81, 0x01, 0x00, 0xcf, 0x01, 0x00, 0x00, 0x44, 0x00, 0=
x04, 0x01,<br>
&gt; -+ 0x46, 0x00, 0x01, 0x01, 0x84, 0x04, 0x89, 0x6c, 0x69, 0x62, 0x69, 0=
x6e, 0x70,<br>
&gt; -+ 0x75, 0x74, 0x04, 0x89, 0x72, 0x65, 0x67, 0x69, 0x73, 0x74, 0x65, 0=
x72, 0x04,<br>
&gt; -+ 0x88, 0x63, 0x6f, 0x6e, 0x6e, 0x65, 0x63, 0x74, 0x04, 0x91, 0x6e, 0=
x65, 0x77,<br>
&gt; -+ 0x2d, 0x65, 0x76, 0x64, 0x65, 0x76, 0x2d, 0x64, 0x65, 0x76, 0x69, 0=
x63, 0x65,<br>
&gt; -+ 0x81, 0x01, 0x00, 0x00, 0x81, 0x80, 0x8d, 0x8f, 0x01, 0x00, 0x04, 0=
x85, 0x8b,<br>
&gt; -+ 0x00, 0x00, 0x00, 0x94, 0x80, 0x01, 0x01, 0x83, 0x01, 0x01, 0x00, 0=
xc4, 0x00,<br>
&gt; -+ 0x03, 0x01, 0xc7, 0x00, 0x01, 0x00, 0x83, 0x04, 0x89, 0x6c, 0x69, 0=
x62, 0x69,<br>
&gt; -+ 0x6e, 0x70, 0x75, 0x74, 0x04, 0x89, 0x6c, 0x6f, 0x67, 0x5f, 0x69, 0=
x6e, 0x66,<br>
&gt; -+ 0x6f, 0x04, 0x9c, 0x6c, 0x6f, 0x61, 0x64, 0x65, 0x64, 0x20, 0x66, 0=
x72, 0x6f,<br>
&gt; -+ 0x6d, 0x20, 0x62, 0x69, 0x6e, 0x61, 0x72, 0x79, 0x20, 0x6c, 0x75, 0=
x61, 0x20,<br>
&gt; -+ 0x66, 0x69, 0x6c, 0x65, 0x81, 0x00, 0x00, 0x00, 0x80, 0x85, 0x01, 0=
x00, 0x00,<br>
&gt; -+ 0x00, 0x01, 0x80, 0x81, 0x87, 0x64, 0x65, 0x76, 0x69, 0x63, 0x65, 0=
x80, 0x85,<br>
&gt; -+ 0x81, 0x85, 0x5f, 0x45, 0x4e, 0x56, 0x8e, 0x01, 0x0b, 0x00, 0x00, 0=
x00, 0x00,<br>
&gt; -+ 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0xfe, 0x02, 0x80, 0x80, 0x81, 0=
x85, 0x5f,<br>
&gt; -+ 0x45, 0x4e, 0x56,<br>
&gt; -+};<br>
&gt; -+<br>
&gt; -+START_TEST(lua_reject_precompiled_files)<br>
&gt; -+{<br>
&gt; -+ _destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);<br>
&gt; -+<br>
&gt; -+ /* Write the binary bytecode to a .lua file in the tmpdir.<br>
&gt; -+ * Binary (pre-compiled) Lua files must be rejected by the<br>
&gt; -+ * plugin loader for security reasons. */<br>
&gt; -+ _autofree_ char *path =3D strdup_printf(&quot;%s/10-binary-plugin.l=
ua&quot;, tmpdir-&gt;path);<br>
&gt; -+ _autoclose_ int fd =3D open(path, O_WRONLY | O_CREAT, 0644);<br>
&gt; -+ litest_assert_errno_success(fd);<br>
&gt; -+<br>
&gt; -+ ssize_t written =3D write(fd, binary_lua_plugin, sizeof(binary_lua_=
plugin));<br>
&gt; -+ litest_assert_int_eq((int)written, (int)sizeof(binary_lua_plugin));=
<br>
&gt; -+ fsync(fd);<br>
&gt; -+<br>
&gt; -+ _litest_context_destroy_ struct libinput *li =3D<br>
&gt; -+ litest_create_context_with_plugindir(tmpdir-&gt;path);<br>
&gt; -+<br>
&gt; -+ litest_with_logcapture(li, capture) {<br>
&gt; -+ libinput_plugin_system_load_plugins(li,<br>
&gt; -+=C2=A0 =C2=A0 LIBINPUT_PLUGIN_SYSTEM_FLAG_NONE);<br>
&gt; -+ litest_drain_events(li);<br>
&gt; -+<br>
&gt; -+ size_t index =3D 0;<br>
&gt; -+ litest_assert(<br>
&gt; -+ strv_find_substring(capture-&gt;errors, &quot;Failed to load&quot;,=
 &amp;index));<br>
&gt; -+ litest_assert_str_in(path, capture-&gt;errors[index]);<br>
&gt; -+ }<br>
&gt; -+}<br>
&gt; -+END_TEST<br>
&gt; -+<br>
&gt; - TEST_COLLECTION(lua)<br>
&gt; - {<br>
&gt; - /* clang-format off */<br>
&gt; - litest_add_no_device(lua_load_failure);<br>
&gt; -+ litest_add_no_device(lua_reject_precompiled_files);<br>
&gt; - litest_with_parameters(params,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;content&quot;, &#39;I&#39;, 6,<br>
&gt; - litest_named_i32(EMPTY),<br>
&gt; --- <br>
&gt; -GitLab<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.pat=
ch b/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 405a262b03e..00000000000<br>
&gt; --- a/meta/recipes-graphics/wayland/libinput/CVE-2026-35094.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,191 +0,0 @@<br>
&gt; -From 45dfd0f0301af855f068df27b2e40cc9f5713acd Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Peter Hutterer &lt;<a href=3D"mailto:peter.hutterer@who-t.net" =
target=3D"_blank">peter.hutterer@who-t.net</a>&gt;<br>
&gt; -Date: Mon, 30 Mar 2026 09:41:08 +1000<br>
&gt; -Subject: [PATCH] lua: separate the API from the metatables<br>
&gt; -<br>
&gt; -Previously we had one vtable for the libinputplugin and EvdevDevice<b=
r>
&gt; -objects. This allowed plugins to call __gc(), a decidedly internal<br=
>
&gt; -method.<br>
&gt; -<br>
&gt; -This fixes a use-after-free: A plugin that called EvdevDevice::__gc()=
<br>
&gt; -frees the plugin&#39;s copy of device-&gt;name but leaves the pointer=
 in-place,<br>
&gt; -a subsequent call will thus cause a UAF read.<br>
&gt; -<br>
&gt; -Fix this by separating what is the object&#39;s metatable from the pu=
blic<br>
&gt; -methods that are accessible to a plugin.<br>
&gt; -<br>
&gt; -CVE-2026-35094<br>
&gt; -<br>
&gt; -Fixes: #1272<br>
&gt; -<br>
&gt; -Found-by: Koen Tange &lt;<a href=3D"mailto:koen@monokles.eu" target=
=3D"_blank">koen@monokles.eu</a>&gt;<br>
&gt; -Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/libinput/libin=
put/-/merge_requests/1459" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.freedesktop.org/libinput/libinput/-/merge_requests/1459</a>&gt;<br>
&gt; -<br>
&gt; -CVE: CVE-2025-35094<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - src/libinput-plugin-lua.c | 54 +++++++++++++++++++++++++++++--------=
--<br>
&gt; - test/test-plugins-lua.c=C2=A0 =C2=A0| 33 ++++++++++++++++++++++++<br=
>
&gt; - 2 files changed, 73 insertions(+), 14 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/src/libinput-plugin-lua.c b/src/libinput-plugin-lua.c<br=
>
&gt; -index ac828f7f..c6f99a5f 100644<br>
&gt; ---- a/src/libinput-plugin-lua.c<br>
&gt; -+++ b/src/libinput-plugin-lua.c<br>
&gt; -@@ -562,6 +562,12 @@ libinputplugin_unregister(lua_State *L)<br>
&gt; - return luaL_error(L, &quot;@@unregistering@@&quot;);<br>
&gt; - }<br>
&gt; - <br>
&gt; -+static int<br>
&gt; -+readonly_newindex(lua_State *L)<br>
&gt; -+{<br>
&gt; -+ return luaL_error(L, &quot;attempt to modify a read-only table&quot=
;);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; - static int<br>
&gt; - libinputplugin_gc(lua_State *L)<br>
&gt; - {<br>
&gt; -@@ -673,7 +679,28 @@ libinputplugin_log_error(lua_State *L)<br>
&gt; - return libinputplugin_log(L, LIBINPUT_LOG_PRIORITY_ERROR);<br>
&gt; - }<br>
&gt; - <br>
&gt; --static const struct luaL_Reg libinputplugin_vtable[] =3D {<br>
&gt; -+static void<br>
&gt; -+setup_vfuncs(lua_State *L,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0const char *metatable_name,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0const struct luaL_Reg *vfuncs,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0const struct luaL_Reg *public_methods)<br>
&gt; -+{<br>
&gt; -+ luaL_newmetatable(L, metatable_name);<br>
&gt; -+ luaL_setfuncs(L, vfuncs, 0);<br>
&gt; -+<br>
&gt; -+ lua_newtable(L);<br>
&gt; -+ luaL_setfuncs(L, public_methods, 0);<br>
&gt; -+ lua_setfield(L, -2, &quot;__index&quot;);<br>
&gt; -+<br>
&gt; -+ /* set metatable.__metatable =3D false to prevent a script from get=
metatable(),<br>
&gt; -+=C2=A0 =C2=A0which is blocked anyway but safe and sorry and whatnot =
*/<br>
&gt; -+ lua_pushboolean(L, 0);<br>
&gt; -+ lua_setfield(L, -2, &quot;__metatable&quot;);<br>
&gt; -+<br>
&gt; -+ lua_pop(L, 1);<br>
&gt; -+}<br>
&gt; -+<br>
&gt; -+static const struct luaL_Reg libinputplugin_methods[] =3D {<br>
&gt; - { &quot;now&quot;, libinputplugin_now },<br>
&gt; - { &quot;version&quot;, libinputplugin_version },<br>
&gt; - { &quot;connect&quot;, libinputplugin_connect },<br>
&gt; -@@ -685,18 +712,18 @@ static const struct luaL_Reg libinputplugin_vta=
ble[] =3D {<br>
&gt; - { &quot;log_debug&quot;, libinputplugin_log_debug },<br>
&gt; - { &quot;log_info&quot;, libinputplugin_log_info },<br>
&gt; - { &quot;log_error&quot;, libinputplugin_log_error },<br>
&gt; -- { &quot;__gc&quot;, libinputplugin_gc },<br>
&gt; - { NULL, NULL }<br>
&gt; - };<br>
&gt; - <br>
&gt; -+static const struct luaL_Reg libinputplugin_meta[] =3D { { &quot;__g=
c&quot;, libinputplugin_gc },<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;__newindex&quot;,<br>
&gt; -+ readonly_newindex },<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ NULL, NULL } };<br>
&gt; -+<br>
&gt; - static void<br>
&gt; - libinputplugin_init(lua_State *L)<br>
&gt; - {<br>
&gt; -- luaL_newmetatable(L, PLUGIN_METATABLE);<br>
&gt; -- lua_pushstring(L, &quot;__index&quot;);<br>
&gt; -- lua_pushvalue(L, -2); /* push metatable */<br>
&gt; -- lua_settable(L, -3);=C2=A0 /* metatable.__index =3D metatable */<br=
>
&gt; -- luaL_setfuncs(L, libinputplugin_vtable, 0);<br>
&gt; -+ setup_vfuncs(L, PLUGIN_METATABLE, libinputplugin_meta, libinputplug=
in_methods);<br>
&gt; - }<br>
&gt; - <br>
&gt; - static int<br>
&gt; -@@ -1073,7 +1100,7 @@ evdevdevice_gc(lua_State *L)<br>
&gt; - return 0;<br>
&gt; - }<br>
&gt; - <br>
&gt; --static const struct luaL_Reg evdevdevice_vtable[] =3D {<br>
&gt; -+static const struct luaL_Reg evdevdevice_methods[] =3D {<br>
&gt; - { &quot;info&quot;, evdevdevice_info },<br>
&gt; - { &quot;name&quot;, evdevdevice_name },<br>
&gt; - { &quot;usages&quot;, evdevdevice_usages },<br>
&gt; -@@ -1087,18 +1114,17 @@ static const struct luaL_Reg evdevdevice_vtab=
le[] =3D {<br>
&gt; - { &quot;prepend_frame&quot;, evdevdevice_prepend_frame },<br>
&gt; - { &quot;append_frame&quot;, evdevdevice_append_frame },<br>
&gt; - { &quot;disable_feature&quot;, evdevdevice_disable_feature },<br>
&gt; -- { &quot;__gc&quot;, evdevdevice_gc },<br>
&gt; - { NULL, NULL }<br>
&gt; - };<br>
&gt; - <br>
&gt; -+static const struct luaL_Reg evdevdevice_meta[] =3D { { &quot;__gc&q=
uot;, evdevdevice_gc },<br>
&gt; -+=C2=A0 =C2=A0 { &quot;__newindex&quot;, readonly_newindex },<br>
&gt; -+=C2=A0 =C2=A0 { NULL, NULL } };<br>
&gt; -+<br>
&gt; - static void<br>
&gt; - evdevdevice_init(lua_State *L)<br>
&gt; - {<br>
&gt; -- luaL_newmetatable(L, EVDEV_DEVICE_METATABLE);<br>
&gt; -- lua_pushstring(L, &quot;__index&quot;);<br>
&gt; -- lua_pushvalue(L, -2); /* push metatable */<br>
&gt; -- lua_settable(L, -3);=C2=A0 /* metatable.__index =3D metatable */<br=
>
&gt; -- luaL_setfuncs(L, evdevdevice_vtable, 0);<br>
&gt; -+ setup_vfuncs(L, EVDEV_DEVICE_METATABLE, evdevdevice_meta, evdevdevi=
ce_methods);<br>
&gt; - }<br>
&gt; - <br>
&gt; - static void<br>
&gt; -diff --git a/test/test-plugins-lua.c b/test/test-plugins-lua.c<br>
&gt; -index 4d687203..aba8f6c6 100644<br>
&gt; ---- a/test/test-plugins-lua.c<br>
&gt; -+++ b/test/test-plugins-lua.c<br>
&gt; -@@ -526,6 +526,38 @@ START_TEST(lua_disallowed_functions)<br>
&gt; - }<br>
&gt; - END_TEST<br>
&gt; - <br>
&gt; -+START_TEST(lua_gc_not_accessible)<br>
&gt; -+{<br>
&gt; -+ _destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);<br>
&gt; -+ const char *lua =3D<br>
&gt; -+ &quot;libinput:register({1})\n&quot;<br>
&gt; -+ &quot;assert(libinput.__gc =3D=3D nil)\n&quot;<br>
&gt; -+ &quot;function check_device_gc(device)\n&quot;<br>
&gt; -+ &quot;=C2=A0 assert(device.__gc =3D=3D nil)\n&quot;<br>
&gt; -+ &quot;=C2=A0 libinput:log_info(\&quot;gc_not_accessible: ok\&quot;)=
\n&quot;<br>
&gt; -+ &quot;end\n&quot;<br>
&gt; -+ &quot;libinput:connect(\&quot;new-evdev-device\&quot;, check_device=
_gc)\n&quot;;<br>
&gt; -+<br>
&gt; -+ _autofree_ char *path =3D litest_write_plugin(tmpdir-&gt;path, lua)=
;<br>
&gt; -+ _litest_context_destroy_ struct libinput *li =3D<br>
&gt; -+ litest_create_context_with_plugindir(tmpdir-&gt;path);<br>
&gt; -+ if (libinput_log_get_priority(li) &gt; LIBINPUT_LOG_PRIORITY_INFO)<=
br>
&gt; -+ libinput_log_set_priority(li, LIBINPUT_LOG_PRIORITY_INFO);<br>
&gt; -+<br>
&gt; -+ litest_with_logcapture(li, capture) {<br>
&gt; -+ libinput_plugin_system_load_plugins(li,<br>
&gt; -+=C2=A0 =C2=A0 LIBINPUT_PLUGIN_SYSTEM_FLAG_NONE);<br>
&gt; -+ litest_drain_events(li);<br>
&gt; -+<br>
&gt; -+ _destroy_(litest_device) *device =3D litest_add_device(li, LITEST_M=
OUSE);<br>
&gt; -+ litest_drain_events(li);<br>
&gt; -+<br>
&gt; -+ litest_assert_logcapture_no_errors(capture);<br>
&gt; -+ litest_assert_strv_substring(capture-&gt;infos, &quot;gc_not_access=
ible: ok&quot;);<br>
&gt; -+ }<br>
&gt; -+}<br>
&gt; -+END_TEST<br>
&gt; -+<br>
&gt; - START_TEST(lua_frame_handler)<br>
&gt; - {<br>
&gt; - _destroy_(tmpdir) *tmpdir =3D tmpdir_create(NULL);<br>
&gt; -@@ -1219,6 +1251,7 @@ TEST_COLLECTION(lua)<br>
&gt; - litest_add_no_device(lua_register_multiversions);<br>
&gt; - litest_add_no_device(lua_allowed_functions);<br>
&gt; - litest_add_no_device(lua_disallowed_functions);<br>
&gt; -+ litest_add_no_device(lua_gc_not_accessible);<br>
&gt; - <br>
&gt; - litest_add_no_device(lua_frame_handler);<br>
&gt; - litest_add_no_device(lua_device_info);<br>
&gt; --- <br>
&gt; -GitLab<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://libinput_=
1.30.2.bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.30.2.bb</a> b/me=
ta/recipes-graphics/wayland/<a href=3D"http://libinput_1.30.4.bb" rel=3D"no=
referrer" target=3D"_blank">libinput_1.30.4.bb</a><br>
&gt; similarity index 93%<br>
&gt; rename from meta/recipes-graphics/wayland/<a href=3D"http://libinput_1=
.30.2.bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.30.2.bb</a><br>
&gt; rename to meta/recipes-graphics/wayland/<a href=3D"http://libinput_1.3=
0.4.bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.30.4.bb</a><br>
&gt; index efd51809d8e..8ce3d0d62cf 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/<a href=3D"http://libinput_1.30.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.30.2.bb</a><br>
&gt; +++ b/meta/recipes-graphics/wayland/<a href=3D"http://libinput_1.30.4.=
bb" rel=3D"noreferrer" target=3D"_blank">libinput_1.30.4.bb</a><br>
&gt; @@ -13,11 +13,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbab=
4ac7dc1c10bc0fb037dc76c46ef8a&quot;<br>
&gt; DEPENDS =3D &quot;libevdev udev&quot;<br>
&gt; <br>
&gt; SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/libin=
put/libinput.git;protocol=3Dhttps;branch=3D1.30-branch;tag=3D$%7BPV%7D" rel=
=3D"noreferrer" target=3D"_blank">gitlab.freedesktop.org/libinput/libinput.=
git;protocol=3Dhttps;branch=3D1.30-branch;tag=3D${PV}</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-35093.patch =
\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-35094.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; -SRCREV =3D &quot;042c5e6fd9cc910307027a1522453794b29f2c72&quot;<br>
&gt; +SRCREV =3D &quot;7ad8b37ffcc71aceb8eb4d079d22490e87168f49&quot;<br>
&gt; <br>
&gt; UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+\.\d+\.(?!9\d+)=
\d+)&quot;<br>
&gt; <br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#238890): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/238890" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/238890</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11983138=
4/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/119831384/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000f5272a06545d2a5c--

