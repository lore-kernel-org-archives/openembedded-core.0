Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D1FC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 09:30:25 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.24518.1644399022994768371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 01:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=DnwECmXK;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-201-114-143.002.201.pools.vodafone-ip.de [2.201.114.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A016A83A41;
	Wed,  9 Feb 2022 10:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1644399020;
	bh=Z+Gs1/Hud+LgpgcNZf85HZ4WlZsDBT1Lxs4h1BkK5EI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DnwECmXKnx2H1gmm+Ek6itEGb876OSYHlVsZ2zni5zWvpWddNrATjUNLnQGFSea1G
	 SHE9W+8VfyoeDkF5zwkjQrgdhFq4fjqnL0eDQZ+y7ceM9+hgeA2PxK2f42vIy6491h
	 uLMmYY3ap4L9lIsOS355JXkxpYnAj9dDvhAV0l8OrqI7o+XcA08/oBcTUJyzwR4XAQ
	 XiRTI9kyZ+EgQU8CkAIm0wNU3QukLjo0eobekUxcc8Uz6ncSXVfX7kULagYB6HmDw3
	 yMG7DSvgCKhJFUb/coFdD4BBWkxKVOFZ4pO9NYxGTX2pCRtEDsE3gamL46Qy1p4m8D
	 mxlC/pc9hxh4Q==
Message-ID: <720ba17c-525a-3ad0-9c61-f2bc8db82468@denx.de>
Date: Wed, 9 Feb 2022 10:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
 <20220207010823.143664-7-quaresma.jose@gmail.com>
 <CANNYZj8SNr_MA86N9kL7jQw27QV8gDtwH_hSD_a9tfTVL8xd+Q@mail.gmail.com>
 <CANPvuRkJpThUEjiKfzvg4m+Dz_-ChDRu8Yy1LsSnTmK8FdgoDg@mail.gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <CANPvuRkJpThUEjiKfzvg4m+Dz_-ChDRu8Yy1LsSnTmK8FdgoDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 09:30:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161546

Hi Jose

On 2022-02-09 10:15, Jose Quaresma wrote:
> Hi Alexander,
>=20
> Can=C2=A0you please clarify in what target arch is this happening and I=
 can=20
> try to replicate it with qemu?

I think we are hitting:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778

This testcase seems to be flaky and IIUC upstream marked it as such in=20
their test infrastructure.

In my patchset, I added a patch to disable that testcase.

regards,
Claudius

>=20
> It works on my side on=C2=A0qemux86-64.
>=20
> root@qemux86-64:~# /usr/libexec/installed-tests/gstreamer/gst_gstbin.sh
> + CK_DEFAULT_TIMEOUT=3D20
> + GST_PLUGIN_LOADING_WHITELIST=3Dgstreamer
> + GST_REGISTRY=3D/home/root/.cache/gstreamer-1.0/gst_gstbin.registry
> + GST_STATE_IGNORE_ELEMENTS=3D
> + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
> Running suite(s): GstBin
> 100%: Checks: 26, Failures: 0, Errors: 0
> Check suite gst_bin ran in 6.239s (tests failed: 0)
>=20
>=20
> Alexander Kanavin <alex.kanavin@gmail.com=20
> <mailto:alex.kanavin@gmail.com>> escreveu no dia ter=C3=A7a, 8/02/2022 =
=C3=A0(s)=20
> 22:01:
>=20
>     Unfortunately this patchset (which is now in master) does not addre=
ss
>     the ptest fail. Please resolve this as soon as possible.
>=20
>     + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
>     Running suite(s): GstBin
>     Executing: gstreamer/gst_gstbin.test
>     Executing: gstreamer/gst_gstbin.test
>     ....
>     Executing: gstreamer/gst_gstbin.test
>     Executing: gstreamer/gst_gstbin.test
>     Test timed out after 300 seconds
>     FAIL: gstreamer/gst_gstbin.test (Child process killed by signal 9)
>=20
>     Alex
>=20
>     On Mon, 7 Feb 2022 at 02:08, Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>> wrote:
>      >
>      > - License update:
>      >=C2=A0 =C2=A0The code actually is LGPLv2.1 but the COPYING file i=
s wrong.
>      >
>     https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23=
fb0ce175b167611a4cb019599d9017042
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b2=
3fb0ce175b167611a4cb019599d9017042>
>      >
>      > - Drop backported patches
>      >=C2=A0 =C2=A00001-gst-gstpluginloader.c-when-env-var-is-set-do-no=
t-fal.patch
>      >=C2=A0 =C2=A00002-Remove-unused-valgrind-detection.patch
>      >=C2=A0 =C2=A00003-tests-seek-Don-t-use-too-strict-timeout-for-val=
idati.patch
>      >
>      > - Update submitted patches
>      >=C2=A0 =C2=A00001-tests-respect-the-idententaion-used-in-meson.pa=
tch
>      >=C2=A0 =C2=A00002-tests-add-support-for-install-the-tests.patch
>      >=C2=A0 =C2=A00003-tests-use-a-dictionaries-for-environment.patch
>      >=C2=A0 =C2=A00004-tests-add-helper-script-to-run-the-installed_te=
sts.patch
>      >
>      > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      > ---
>      >=C2=A0 ...der.c-when-env-var-is-set-do-not-fal.patch |=C2=A0 69 -=
----------
>      >=C2=A0 ...pect-the-idententaion-used-in-meson.patch} |=C2=A0 14 +=
--
>      >=C2=A0 ...002-Remove-unused-valgrind-detection.patch | 112
>     ------------------
>      >=C2=A0 ...s-add-support-for-install-the-tests.patch} |=C2=A0 67 +=
+++++-----
>      >=C2=A0 ...-use-too-strict-timeout-for-validati.patch |=C2=A0 32 -=
----
>      >=C2=A0 ...-use-a-dictionaries-for-environment.patch} |=C2=A0 28 +=
++--
>      >=C2=A0 ...er-script-to-run-the-installed_tests.patch |=C2=A0 74 +=
+++++++++++
>      >=C2=A0 ...-the-environment-for-installed_tests.patch |=C2=A0 58 -=
--------
>      >=C2=A0 ...er1.0_1.18.5.bb <http://er1.0_1.18.5.bb> =3D>
>     gstreamer1.0_1.20.0.bb <http://gstreamer1.0_1.20.0.bb>} |=C2=A0 17 =
++-
>      >=C2=A0 9 files changed, 136 insertions(+), 335 deletions(-)
>      >=C2=A0 delete mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginlo=
ader.c-when-env-var-is-set-do-not-fal.patch
>      >=C2=A0 rename
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respect-=
the-idententaion-used-in-meson.patch
>     =3D> 0001-tests-respect-the-idententaion-used-in-meson.patch} (71%)
>      >=C2=A0 delete mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-v=
algrind-detection.patch
>      >=C2=A0 rename
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-supp=
ort-for-install-the-tests.patch
>     =3D> 0002-tests-add-support-for-install-the-tests.patch} (65%)
>      >=C2=A0 delete mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-=
t-use-too-strict-timeout-for-validati.patch
>      >=C2=A0 rename
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-di=
ctionaries-for-environment.patch
>     =3D> 0003-tests-use-a-dictionaries-for-environment.patch} (61%)
>      >=C2=A0 create mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helpe=
r-script-to-run-the-installed_tests.patch
>      >=C2=A0 delete mode 100644
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-t=
he-environment-for-installed_tests.patch
>      >=C2=A0 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.1=
8.5.bb
>     <http://gstreamer1.0_1.18.5.bb> =3D> gstreamer1.0_1.20.0.bb
>     <http://gstreamer1.0_1.20.0.bb>} (76%)
>      >
>      > diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstplugin=
loader.c-when-env-var-is-set-do-not-fal.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstplugin=
loader.c-when-env-var-is-set-do-not-fal.patch
>      > deleted file mode 100644
>      > index 23ebd5c600..0000000000
>      > ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstplugin=
loader.c-when-env-var-is-set-do-not-fal.patch
>      > +++ /dev/null
>      > @@ -1,69 +0,0 @@
>      > -From fd8f49dba8c09d47425da80f5faab3bfa4a7c962 Mon Sep 17
>     00:00:00 2001
>      > -From: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      > -Date: Sat, 10 Oct 2020 19:09:03 +0000
>      > -Subject: [PATCH 1/3] gstpluginloader: when env var is set do no=
t
>     fall through
>      > - to system plugin scanner
>      > -
>      > -If we set a custom GST_PLUGIN_SCANNER env var, then we probably
>     want to use that and only that.
>      > -
>      > -Falling through to the one installed on the system is
>     problamatic in cross-compilation
>      > -environemnts, regardless of whether one pointed to by the env
>     var succeeded or failed.
>      > -
>      > -taken from:
>      >
>     -http://cgit.openembedded.org/openembedded-core/commit/meta/recipes=
-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-va=
r-is-set-do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b
>     <http://cgit.openembedded.org/openembedded-core/commit/meta/recipes=
-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-va=
r-is-set-do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b>
>      > -
>      > -Part-of:
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/669
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/669>>
>      > -
>      > -Upstream-Status: Backport
>     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f9580=
58697e6fbf5bde325228034572331d1a3a
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f9580=
58697e6fbf5bde325228034572331d1a3a>]
>      > -
>      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      > ----
>      > - gst/gstpluginloader.c | 15 +++++++--------
>      > - 1 file changed, 7 insertions(+), 8 deletions(-)
>      > -
>      > -diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
>      > -index d1e404d98..c626bf263 100644
>      > ---- a/gst/gstpluginloader.c
>      > -+++ b/gst/gstpluginloader.c
>      > -@@ -464,20 +464,19 @@ gst_plugin_loader_spawn (GstPluginLoader =
*
>     loader)
>      > -=C2=A0 =C2=A0if (loader->child_running)
>      > -=C2=A0 =C2=A0 =C2=A0return TRUE;
>      > -
>      > --=C2=A0 /* Find the gst-plugin-scanner: first try the env-var i=
f it
>     is set,
>      > --=C2=A0 =C2=A0* otherwise use the installed version */
>      > -+=C2=A0 /* Find the gst-plugin-scanner */
>      > -=C2=A0 =C2=A0env =3D g_getenv ("GST_PLUGIN_SCANNER_1_0");
>      > -=C2=A0 =C2=A0if (env =3D=3D NULL)
>      > -=C2=A0 =C2=A0 =C2=A0env =3D g_getenv ("GST_PLUGIN_SCANNER");
>      > -
>      > -=C2=A0 =C2=A0if (env !=3D NULL && *env !=3D '\0') {
>      > -+=C2=A0 =C2=A0 /* use the env-var if it is set */
>      > -=C2=A0 =C2=A0 =C2=A0GST_LOG ("Trying GST_PLUGIN_SCANNER env var=
: %s", env);
>      > -=C2=A0 =C2=A0 =C2=A0helper_bin =3D g_strdup (env);
>      > -=C2=A0 =C2=A0 =C2=A0res =3D gst_plugin_loader_try_helper (loade=
r, helper_bin);
>      > -=C2=A0 =C2=A0 =C2=A0g_free (helper_bin);
>      > --=C2=A0 }
>      > --
>      > --=C2=A0 if (!res) {
>      > -+=C2=A0 } else {
>      > -+=C2=A0 =C2=A0 /* use the installed version */
>      > -=C2=A0 =C2=A0 =C2=A0GST_LOG ("Trying installed plugin scanner")=
;
>      > -
>      > - #ifdef G_OS_WIN32
>      > -@@ -497,10 +496,10 @@ gst_plugin_loader_spawn (GstPluginLoader =
*
>     loader)
>      > - #endif
>      > -=C2=A0 =C2=A0 =C2=A0res =3D gst_plugin_loader_try_helper (loade=
r, helper_bin);
>      > -=C2=A0 =C2=A0 =C2=A0g_free (helper_bin);
>      > -+=C2=A0 }
>      > -
>      > --=C2=A0 =C2=A0 if (!res) {
>      > --=C2=A0 =C2=A0 =C2=A0 GST_INFO ("No gst-plugin-scanner availabl=
e, or not working");
>      > --=C2=A0 =C2=A0 }
>      > -+=C2=A0 if (!res) {
>      > -+=C2=A0 =C2=A0 GST_INFO ("No gst-plugin-scanner available, or n=
ot working");
>      > -=C2=A0 =C2=A0}
>      > -
>      > -=C2=A0 =C2=A0return loader->child_running;
>      > ---
>      > -2.29.2
>      > -
>      > diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect=
-the-idententaion-used-in-meson.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect=
-the-idententaion-used-in-meson.patch
>      > similarity index 71%
>      > rename from
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-t=
he-idententaion-used-in-meson.patch
>      > rename to
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-t=
he-idententaion-used-in-meson.patch
>      > index 6f571a12d8..312c04fbfd 100644
>      > ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect=
-the-idententaion-used-in-meson.patch
>      > +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect=
-the-idententaion-used-in-meson.patch
>      > @@ -1,4 +1,4 @@
>      > -From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17
>     00:00:00 2001
>      > +From 1eb77a4ea5a3967c688d8f1192f99c605badc7e2 Mon Sep 17
>     00:00:00 2001
>      >=C2=A0 From: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      >=C2=A0 Date: Sun, 11 Apr 2021 19:48:13 +0100
>      >=C2=A0 Subject: [PATCH 1/4] tests: respect the idententaion used =
in meson
>      > @@ -7,13 +7,13 @@ Upstream-Status: Submitted
>     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
>      >
>      >=C2=A0 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      >=C2=A0 ---
>      > - tests/check/meson.build | 10 +++++-----
>      > + subprojects/gstreamer/tests/check/meson.build | 10 +++++-----
>      >=C2=A0 =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>      >
>      > -diff --git a/tests/check/meson.build b/tests/check/meson.build
>      > -index a617cf159..b2636714b 100644
>      > ---- a/tests/check/meson.build
>      > -+++ b/tests/check/meson.build
>      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
>     b/subprojects/gstreamer/tests/check/meson.build
>      > +index 9c4228b6e4..506606684d 100644
>      > +--- a/subprojects/gstreamer/tests/check/meson.build
>      > ++++ b/subprojects/gstreamer/tests/check/meson.build
>      >=C2=A0 @@ -146,11 +146,11 @@ foreach t : core_tests
>      >
>      >=C2=A0 =C2=A0 =C2=A0if not skip_test
>      > @@ -32,5 +32,5 @@ index a617cf159..b2636714b 100644
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D environment()
>      >=C2=A0 --
>      > -2.31.1
>      > +2.33.1
>      >
>      > diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused=
-valgrind-detection.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused=
-valgrind-detection.patch
>      > deleted file mode 100644
>      > index 5121044734..0000000000
>      > ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused=
-valgrind-detection.patch
>      > +++ /dev/null
>      > @@ -1,112 +0,0 @@
>      > -From e275ba2bd854ac15a4b65a8f07d9f042021950da Mon Sep 17
>     00:00:00 2001
>      > -From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <tim@cent=
ricular.com
>     <mailto:tim@centricular.com>>
>      > -Date: Fri, 14 Aug 2020 16:38:26 +0100
>      > -Subject: [PATCH 2/3] Remove unused valgrind detection
>      > -
>      > -Having this just to log a debug message in case we're
>      > -running inside valgrind doesn't seem very useful, and
>      > -the code that used to use this no longer exists it seems.
>      > -
>      > -Part-of:
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/595
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/595>>
>      > -
>      > -Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef45597=
2245]
>      > -
>      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      > ----
>      > - gst/gst_private.h |=C2=A0 2 --
>      > - gst/gstinfo.c=C2=A0 =C2=A0 =C2=A0| 39 ------------------------=
---------------
>      > - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -
>      > - 3 files changed, 42 deletions(-)
>      > -
>      > -diff --git a/gst/gst_private.h b/gst/gst_private.h
>      > -index eefd044..8252ede 100644
>      > ---- a/gst/gst_private.h
>      > -+++ b/gst/gst_private.h
>      > -@@ -116,8 +116,6 @@ G_GNUC_INTERNAL=C2=A0 gboolean
>     _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
>      > -
>      > - G_GNUC_INTERNAL=C2=A0 gboolean _priv_plugin_deps_files_changed
>     (GstPlugin * plugin);
>      > -
>      > --G_GNUC_INTERNAL=C2=A0 gboolean _priv_gst_in_valgrind (void);
>      > --
>      > - /* init functions called from gst_init(). */
>      > - G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv_gst_quarks_initialize (=
void);
>      > - G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv_gst_mini_object_initial=
ize (void);
>      > -diff --git a/gst/gstinfo.c b/gst/gstinfo.c
>      > -index eea1a21..d3035d6 100644
>      > ---- a/gst/gstinfo.c
>      > -+++ b/gst/gstinfo.c
>      > -@@ -305,36 +305,6 @@ static gboolean pretty_tags =3D
>     PRETTY_TAGS_DEFAULT;
>      > - static gint G_GNUC_MAY_ALIAS __default_level =3D GST_LEVEL_DEF=
AULT;
>      > - static gint G_GNUC_MAY_ALIAS __use_color =3D GST_DEBUG_COLOR_M=
ODE_ON;
>      > -
>      > --/* FIXME: export this? */
>      > --gboolean
>      > --_priv_gst_in_valgrind (void)
>      > --{
>      > --=C2=A0 static enum
>      > --=C2=A0 {
>      > --=C2=A0 =C2=A0 GST_VG_UNCHECKED,
>      > --=C2=A0 =C2=A0 GST_VG_NO_VALGRIND,
>      > --=C2=A0 =C2=A0 GST_VG_INSIDE
>      > --=C2=A0 }
>      > --=C2=A0 in_valgrind =3D GST_VG_UNCHECKED;
>      > --
>      > --=C2=A0 if (in_valgrind =3D=3D GST_VG_UNCHECKED) {
>      > --#ifdef HAVE_VALGRIND_VALGRIND_H
>      > --=C2=A0 =C2=A0 if (RUNNING_ON_VALGRIND) {
>      > --=C2=A0 =C2=A0 =C2=A0 GST_CAT_INFO (GST_CAT_GST_INIT, "we're ru=
nning inside
>     valgrind");
>      > --=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D GST_VG_INSIDE;
>      > --=C2=A0 =C2=A0 } else {
>      > --=C2=A0 =C2=A0 =C2=A0 GST_CAT_LOG (GST_CAT_GST_INIT, "not doing=
 extra valgrind
>     stuff");
>      > --=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D GST_VG_NO_VALGRIND;
>      > --=C2=A0 =C2=A0 }
>      > --#else
>      > --=C2=A0 =C2=A0 in_valgrind =3D GST_VG_NO_VALGRIND;
>      > --#endif
>      > --=C2=A0 =C2=A0 g_assert (in_valgrind =3D=3D GST_VG_NO_VALGRIND =
||
>      > --=C2=A0 =C2=A0 =C2=A0 =C2=A0 in_valgrind =3D=3D GST_VG_INSIDE);
>      > --=C2=A0 }
>      > --=C2=A0 return (in_valgrind =3D=3D GST_VG_INSIDE);
>      > --}
>      > --
>      > - static gchar *
>      > - _replace_pattern_in_gst_debug_file_name (gchar * name, const
>     char *token,
>      > -=C2=A0 =C2=A0 =C2=A0guint val)
>      > -@@ -463,9 +433,6 @@ _priv_gst_debug_init (void)
>      > -=C2=A0 =C2=A0_priv_GST_CAT_PROTECTION =3D
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0_gst_debug_category_new ("GST_PROTEC=
TION", 0, "protection");
>      > -
>      > --=C2=A0 /* print out the valgrind message if we're in valgrind =
*/
>      > --=C2=A0 _priv_gst_in_valgrind ();
>      > --
>      > -=C2=A0 =C2=A0env =3D g_getenv ("GST_DEBUG_OPTIONS");
>      > -=C2=A0 =C2=A0if (env !=3D NULL) {
>      > -=C2=A0 =C2=A0 =C2=A0if (strstr (env, "full_tags") || strstr (en=
v, "full-tags"))
>      > -@@ -2505,12 +2472,6 @@ gst_debug_construct_win_color (guint
>     colorinfo)
>      > -=C2=A0 =C2=A0return 0;
>      > - }
>      > -
>      > --gboolean
>      > --_priv_gst_in_valgrind (void)
>      > --{
>      > --=C2=A0 return FALSE;
>      > --}
>      > --
>      > - void
>      > - _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * fil=
e,
>      > -=C2=A0 =C2=A0 =C2=A0const gchar * func, gint line, GObject * ob=
j, const gchar *
>     msg,
>      > -diff --git a/meson.build b/meson.build
>      > -index 82a1728..42ae617 100644
>      > ---- a/meson.build
>      > -+++ b/meson.build
>      > -@@ -200,7 +200,6 @@ check_headers =3D [
>      > -=C2=A0 =C2=A0'sys/wait.h',
>      > -=C2=A0 =C2=A0'ucontext.h',
>      > -=C2=A0 =C2=A0'unistd.h',
>      > --=C2=A0 'valgrind/valgrind.h',
>      > -=C2=A0 =C2=A0'sys/resource.h',
>      > -=C2=A0 =C2=A0'sys/uio.h',
>      > - ]
>      > ---
>      > -2.29.2
>      > -
>      > diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-sup=
port-for-install-the-tests.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-sup=
port-for-install-the-tests.patch
>      > similarity index 65%
>      > rename from
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-suppo=
rt-for-install-the-tests.patch
>      > rename to
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-suppo=
rt-for-install-the-tests.patch
>      > index b77fb5797f..d18c19c397 100644
>      > ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-sup=
port-for-install-the-tests.patch
>      > +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-sup=
port-for-install-the-tests.patch
>      > @@ -1,4 +1,4 @@
>      > -From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17
>     00:00:00 2001
>      > +From 62f5bb7bfc2498219df7280e73480d8ed2378ce5 Mon Sep 17
>     00:00:00 2001
>      >=C2=A0 From: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      >=C2=A0 Date: Sun, 11 Apr 2021 19:48:13 +0100
>      >=C2=A0 Subject: [PATCH 2/4] tests: add support for install the te=
sts
>      > @@ -11,54 +11,44 @@ Upstream-Status: Submitted
>     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
>      >
>      >=C2=A0 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      >=C2=A0 ---
>      > - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 +++++
>      > - meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +
>      > - template.test.in <http://template.test.in>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 3 +++
>      > - tests/check/meson.build | 22 +++++++++++++++++++++-
>      > - 4 files changed, 30 insertions(+), 1 deletion(-)
>      > - create mode 100644 template.test.in <http://template.test.in>
>      > + subprojects/gstreamer/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++
>      > + subprojects/gstreamer/meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +
>      > + subprojects/gstreamer/tests/check/meson.build | 22
>     ++++++++++++++++++-
>      > + .../gstreamer/tests/check/template.test.in
>     <http://template.test.in>=C2=A0 =C2=A0 |=C2=A0 3 +++
>      > + 4 files changed, 29 insertions(+), 1 deletion(-)
>      > + create mode 100644
>     subprojects/gstreamer/tests/check/template.test.in
>     <http://template.test.in>
>      >
>      > -diff --git a/meson.build b/meson.build
>      > -index c4e8774f5..1abf4eb26 100644
>      > ---- a/meson.build
>      > -+++ b/meson.build
>      > -@@ -562,6 +562,11 @@ if bashcomp_dep.found()
>      > +diff --git a/subprojects/gstreamer/meson.build
>     b/subprojects/gstreamer/meson.build
>      > +index d20fe0040f..b595d8f990 100644
>      > +--- a/subprojects/gstreamer/meson.build
>      > ++++ b/subprojects/gstreamer/meson.build
>      > +@@ -562,6 +562,10 @@ if bashcomp_dep.found()
>      >=C2=A0 =C2=A0 =C2=A0endif
>      >=C2=A0 =C2=A0endif
>      >
>      > ++installed_tests_enabled =3D get_option('installed_tests')
>      >=C2=A0 +installed_tests_metadir =3D join_paths(datadir,
>     'installed-tests', meson.project_name())
>      >=C2=A0 +installed_tests_execdir =3D join_paths(libexecdir,
>     'installed-tests', meson.project_name())
>      > -+installed_tests_enabled =3D get_option('installed-tests')
>      > -+installed_tests_template =3D files('template.test.in
>     <http://template.test.in>')
>      >=C2=A0 +
>      >=C2=A0 =C2=A0plugins_install_dir =3D join_paths(get_option('libdi=
r'),
>     'gstreamer-1.0')
>      >
>      >=C2=A0 =C2=A0pkgconfig =3D import('pkgconfig')
>      > -diff --git a/meson_options.txt b/meson_options.txt
>      > -index c8cee3762..b5da40eaa 100644
>      > ---- a/meson_options.txt
>      > -+++ b/meson_options.txt
>      > +diff --git a/subprojects/gstreamer/meson_options.txt
>     b/subprojects/gstreamer/meson_options.txt
>      > +index 7363bdb7a1..a34ba37dad 100644
>      > +--- a/subprojects/gstreamer/meson_options.txt
>      > ++++ b/subprojects/gstreamer/meson_options.txt
>      >=C2=A0 @@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', va=
lue :
>     false, description : 'Enable poiso
>      >=C2=A0 =C2=A0option('memory-alignment', type: 'combo',
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 choices : ['1', '2', '4', '8',=
 '16', '32', '64', '128',
>     '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize']=
,
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value: 'malloc')
>      > -+option('installed-tests', type : 'boolean', value : false,
>     description : 'Enable installed tests')
>      > ++option('installed_tests', type : 'boolean', value : false,
>     description : 'Enable installed tests')
>      >
>      >=C2=A0 =C2=A0# Feature options
>      >=C2=A0 =C2=A0option('check', type : 'feature', value : 'auto', de=
scription :
>     'Build unit test libraries')
>      > -diff --git a/template.test.in <http://template.test.in>
>     b/template.test.in <http://template.test.in>
>      > -new file mode 100644
>      > -index 000000000..f701627f8
>      > ---- /dev/null
>      > -+++ b/template.test.in <http://template.test.in>
>      > -@@ -0,0 +1,3 @@
>      > -+[Test]
>      > -+Type=3Dsession
>      > -+Exec=3D@installed_tests_dir@/@program@
>      > -diff --git a/tests/check/meson.build b/tests/check/meson.build
>      > -index b2636714b..a697a7b06 100644
>      > ---- a/tests/check/meson.build
>      > -+++ b/tests/check/meson.build
>      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
>     b/subprojects/gstreamer/tests/check/meson.build
>      > +index 506606684d..00a138a568 100644
>      > +--- a/subprojects/gstreamer/tests/check/meson.build
>      > ++++ b/subprojects/gstreamer/tests/check/meson.build
>      >=C2=A0 @@ -124,10 +124,16 @@ test_defines =3D [
>      >=C2=A0 =C2=A0 =C2=A0'-UG_DISABLE_ASSERT',
>      >=C2=A0 =C2=A0 =C2=A0'-UG_DISABLE_CAST_CHECKS',
>      > @@ -95,7 +85,7 @@ index b2636714b..a697a7b06 100644
>      >=C2=A0 +=C2=A0 =C2=A0 =C2=A0 test_conf.set('installed_tests_dir',=
 join_paths(prefix,
>     installed_tests_execdir))
>      >=C2=A0 +=C2=A0 =C2=A0 =C2=A0 test_conf.set('program', test_name)
>      >=C2=A0 +=C2=A0 =C2=A0 =C2=A0 configure_file(
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 input: installed_tests_template,
>      > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 input: 'template.test.in <http://t=
emplate.test.in>',
>      >=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: test_name + '.test',
>      >=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: installed_tests_=
metadir,
>      >=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration: test_conf
>      > @@ -105,6 +95,15 @@ index b2636714b..a697a7b06 100644
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0test(test_name, exe, env: env, timeout=
 : 3 * 60)
>      >=C2=A0 =C2=A0 =C2=A0endif
>      >=C2=A0 =C2=A0endforeach
>      > +diff --git a/subprojects/gstreamer/tests/check/template.test.in
>     <http://template.test.in>
>     b/subprojects/gstreamer/tests/check/template.test.in
>     <http://template.test.in>
>      > +new file mode 100644
>      > +index 0000000000..f701627f87
>      > +--- /dev/null
>      > ++++ b/subprojects/gstreamer/tests/check/template.test.in
>     <http://template.test.in>
>      > +@@ -0,0 +1,3 @@
>      > ++[Test]
>      > ++Type=3Dsession
>      > ++Exec=3D@installed_tests_dir@/@program@
>      >=C2=A0 --
>      > -2.31.1
>      > +2.33.1
>      >
>      > diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Do=
n-t-use-too-strict-timeout-for-validati.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Do=
n-t-use-too-strict-timeout-for-validati.patch
>      > deleted file mode 100644
>      > index e0e64e2c7a..0000000000
>      > ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Do=
n-t-use-too-strict-timeout-for-validati.patch
>      > +++ /dev/null
>      > @@ -1,32 +0,0 @@
>      > -From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17
>     00:00:00 2001
>      > -From: Seungha Yang <seungha@centricular.com
>     <mailto:seungha@centricular.com>>
>      > -Date: Tue, 15 Sep 2020 00:54:58 +0900
>      > -Subject: [PATCH] tests: seek: Don't use too strict timeout for
>     validation
>      > -
>      > -Expected segment-done message might not be seen within expected
>      > -time if system is not powerful enough.
>      > -
>      > -Part-of:
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/625
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/625>>
>      > -
>      > -Upstream-Status: Backport
>     [https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=3Df4431=
2ae5d831438fcf8041162079c65321c588c
>     <https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=3Df4431=
2ae5d831438fcf8041162079c65321c588c>]
>      > -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
>     <mailto:anuj.mittal@intel.com>>
>      > ----
>      > - tests/check/pipelines/seek.c | 2 +-
>      > - 1 file changed, 1 insertion(+), 1 deletion(-)
>      > -
>      > -diff --git a/tests/check/pipelines/seek.c
>     b/tests/check/pipelines/seek.c
>      > -index 28bb8846d..5f7447bc5 100644
>      > ---- a/tests/check/pipelines/seek.c
>      > -+++ b/tests/check/pipelines/seek.c
>      > -@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
>      > -
>      > -=C2=A0 =C2=A0GST_INFO ("wait for segment done message");
>      > -
>      > --=C2=A0 msg =3D gst_bus_timed_pop_filtered (bus, (GstClockTime)=
 2 *
>     GST_SECOND,
>      > -+=C2=A0 msg =3D gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME=
_NONE,
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0GST_MESSAGE_SEGMENT_DONE | GST_MESSA=
GE_ERROR);
>      > -=C2=A0 =C2=A0fail_unless (msg, "no message within the timed win=
dow");
>      > -=C2=A0 =C2=A0fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (=
msg),
>     "segment-done");
>      > ---
>      > -2.29.2
>      > -
>      > diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-d=
ictionaries-for-environment.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-d=
ictionaries-for-environment.patch
>      > similarity index 61%
>      > rename from
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dic=
tionaries-for-environment.patch
>      > rename to
>     meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dic=
tionaries-for-environment.patch
>      > index 46813cec3d..10a6dcc619 100644
>      > ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-d=
ictionaries-for-environment.patch
>      > +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-d=
ictionaries-for-environment.patch
>      > @@ -1,4 +1,4 @@
>      > -From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17
>     00:00:00 2001
>      > +From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17
>     00:00:00 2001
>      >=C2=A0 From: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      >=C2=A0 Date: Sat, 24 Apr 2021 10:34:47 +0100
>      >=C2=A0 Subject: [PATCH 3/4] tests: use a dictionaries for environ=
ment
>      > @@ -10,29 +10,31 @@ Upstream-Status: Submitted
>     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
>      >
>      >=C2=A0 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      >=C2=A0 ---
>      > - tests/check/meson.build | 19 +++++++++++--------
>      > - 1 file changed, 11 insertions(+), 8 deletions(-)
>      > + subprojects/gstreamer/tests/check/meson.build | 21
>     ++++++++++++-------
>      > + 1 file changed, 13 insertions(+), 8 deletions(-)
>      >
>      > -diff --git a/tests/check/meson.build b/tests/check/meson.build
>      > -index a697a7b06..f64524904 100644
>      > ---- a/tests/check/meson.build
>      > -+++ b/tests/check/meson.build
>      > -@@ -161,14 +161,17 @@ foreach t : core_tests
>      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
>     b/subprojects/gstreamer/tests/check/meson.build
>      > +index 00a138a568..48ec2532f8 100644
>      > +--- a/subprojects/gstreamer/tests/check/meson.build
>      > ++++ b/subprojects/gstreamer/tests/check/meson.build
>      > +@@ -161,14 +161,19 @@ foreach t : core_tests
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install: installed_tests_enable=
d,
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0)
>      >
>      >=C2=A0 -=C2=A0 =C2=A0 env =3D environment()
>      > --=C2=A0 =C2=A0 env.set('GST_PLUGIN_PATH_1_0', meson.build_root(=
))
>      > +-=C2=A0 =C2=A0 env.set('GST_PLUGIN_PATH_1_0', meson.project_bui=
ld_root())
>      >=C2=A0 -=C2=A0 =C2=A0 env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
>      >=C2=A0 -=C2=A0 =C2=A0 env.set('GST_STATE_IGNORE_ELEMENTS', '')
>      >=C2=A0 -=C2=A0 =C2=A0 env.set('CK_DEFAULT_TIMEOUT', '20')
>      >=C2=A0 -=C2=A0 =C2=A0 env.set('GST_REGISTRY',
>     '@0@/@1@.registry'.format(meson.current_build_dir(), test_name))
>      >=C2=A0 -=C2=A0 =C2=A0 env.set('GST_PLUGIN_SCANNER_1_0', gst_scann=
er_dir +
>     '/gst-plugin-scanner')
>      >=C2=A0 -=C2=A0 =C2=A0 env.set('GST_PLUGIN_LOADING_WHITELIST', 'gs=
treamer')
>      > -+=C2=A0 =C2=A0 # environment() can't be passed to configure_fil=
e and it is
>     needed for installed_tests
>      > -+=C2=A0 =C2=A0 # use a dictionary as this is simplest solution =
to install
>     the environment
>      > ++=C2=A0 =C2=A0 # meson environment object can't be passed to
>     configure_file and
>      > ++=C2=A0 =C2=A0 # installed tests uses configure_file to install=
 the
>     environment.
>      > ++=C2=A0 =C2=A0 # use a dictionary as this is the simplest solut=
ion
>      > ++=C2=A0 =C2=A0 # to install the environment.
>      >=C2=A0 +=C2=A0 =C2=A0 env =3D {
>      > -+=C2=A0 =C2=A0 =C2=A0 'GST_PLUGIN_PATH_1_0': meson.build_root()=
,
>      > ++=C2=A0 =C2=A0 =C2=A0 'GST_PLUGIN_PATH_1_0': meson.project_buil=
d_root(),
>      >=C2=A0 +=C2=A0 =C2=A0 =C2=A0 'GST_PLUGIN_SYSTEM_PATH_1_0': '',
>      >=C2=A0 +=C2=A0 =C2=A0 =C2=A0 'GST_STATE_IGNORE_ELEMENTS': '',
>      >=C2=A0 +=C2=A0 =C2=A0 =C2=A0 'CK_DEFAULT_TIMEOUT': '20',
>      > @@ -44,5 +46,5 @@ index a697a7b06..f64524904 100644
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0if installed_tests_enabled
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_conf =3D configuration_dat=
a()
>      >=C2=A0 --
>      > -2.31.1
>      > +2.33.1
>      >
>      > diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-hel=
per-script-to-run-the-installed_tests.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-hel=
per-script-to-run-the-installed_tests.patch
>      > new file mode 100644
>      > index 0000000000..efa004f8ce
>      > --- /dev/null
>      > +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-hel=
per-script-to-run-the-installed_tests.patch
>      > @@ -0,0 +1,74 @@
>      > +From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17
>     00:00:00 2001
>      > +From: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      > +Date: Sun, 2 May 2021 01:58:01 +0100
>      > +Subject: [PATCH 4/4] tests: add helper script to run the
>     installed_tests
>      > +
>      > +- this is a bash script that will run the installed_tests
>      > +with some of the environment variables used in the meson
>      > +testing framework.
>      > +
>      > +Upstream-Status: Submitted
>     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/789
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/789>]
>      > +
>      > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      > +---
>      > + subprojects/gstreamer/tests/check/meson.build=C2=A0 =C2=A0| 17
>     +++++++++++++++++
>      > + .../gstreamer/tests/check/template.sh.in
>     <http://template.sh.in>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++++=
+++
>      > + .../gstreamer/tests/check/template.test.in
>     <http://template.test.in>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-
>      > + 3 files changed, 27 insertions(+), 1 deletion(-)
>      > + create mode 100755
>     subprojects/gstreamer/tests/check/template.sh.in <http://template.s=
h.in>
>      > +
>      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
>     b/subprojects/gstreamer/tests/check/meson.build
>      > +index 48ec2532f8..7dc4990d4e 100644
>      > +--- a/subprojects/gstreamer/tests/check/meson.build
>      > ++++ b/subprojects/gstreamer/tests/check/meson.build
>      > +@@ -185,6 +185,23 @@ foreach t : core_tests
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_dir: installed_tests_=
metadir,
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration: test_conf
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0)
>      > ++
>      > ++=C2=A0 =C2=A0 =C2=A0 # All the tests will be deployed on the t=
arget machine and
>      > ++=C2=A0 =C2=A0 =C2=A0 # we use the home folder ~ for the regist=
ry which will
>     then expand at runtime.
>      > ++=C2=A0 =C2=A0 =C2=A0 # Using the /tmp/gstreamer-1.0/@0@.regist=
ry can be
>     problematic as it mostly
>      > ++=C2=A0 =C2=A0 =C2=A0 # is mounted using tmpfs and if the machi=
ne crash from
>     some reason we can lost the registry
>      > ++=C2=A0 =C2=A0 =C2=A0 # that is useful for debug propose of the=
 tests itself.
>      > ++=C2=A0 =C2=A0 =C2=A0 env +=3D {'GST_REGISTRY':
>     '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
>      > ++
>      > ++=C2=A0 =C2=A0 =C2=A0 # Set the full path for the test it self.
>      > ++=C2=A0 =C2=A0 =C2=A0 env +=3D {'TEST': '@0@/@1@'.format(join_p=
aths(prefix,
>     installed_tests_execdir), test_name)}
>      > ++
>      > ++=C2=A0 =C2=A0 =C2=A0 configure_file(
>      > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 input : 'template.sh.in <http://te=
mplate.sh.in>',
>      > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: test_name + '.sh',
>      > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: installed_tests_execd=
ir,
>      > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration : env,
>      > ++=C2=A0 =C2=A0 =C2=A0 )
>      > +=C2=A0 =C2=A0 =C2=A0endif
>      > +
>      > +=C2=A0 =C2=A0 =C2=A0test(test_name, exe, env: env, timeout : 3 =
* 60)
>      > +diff --git a/subprojects/gstreamer/tests/check/template.sh.in
>     <http://template.sh.in>
>     b/subprojects/gstreamer/tests/check/template.sh.in
>     <http://template.sh.in>
>      > +new file mode 100755
>      > +index 0000000000..cf7d31b0ea
>      > +--- /dev/null
>      > ++++ b/subprojects/gstreamer/tests/check/template.sh.in
>     <http://template.sh.in>
>      > +@@ -0,0 +1,9 @@
>      > ++#!/bin/sh
>      > ++
>      > ++set -ax
>      > ++
>      > ++CK_DEFAULT_TIMEOUT=3D"@CK_DEFAULT_TIMEOUT@"
>      > ++GST_PLUGIN_LOADING_WHITELIST=3D"@GST_PLUGIN_LOADING_WHITELIST@=
"
>      > ++GST_REGISTRY=3D@GST_REGISTRY@
>      > ++GST_STATE_IGNORE_ELEMENTS=3D"@GST_STATE_IGNORE_ELEMENTS@"
>      > ++exec @TEST@
>      > +diff --git a/subprojects/gstreamer/tests/check/template.test.in
>     <http://template.test.in>
>     b/subprojects/gstreamer/tests/check/template.test.in
>     <http://template.test.in>
>      > +index f701627f87..b74ef6ad73 100644
>      > +--- a/subprojects/gstreamer/tests/check/template.test.in
>     <http://template.test.in>
>      > ++++ b/subprojects/gstreamer/tests/check/template.test.in
>     <http://template.test.in>
>      > +@@ -1,3 +1,3 @@
>      > + [Test]
>      > + Type=3Dsession
>      > +-Exec=3D@installed_tests_dir@/@program@
>      > ++Exec=3D@installed_tests_dir@/@program@.sh
>      > +--
>      > +2.33.1
>      > +
>      > diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install=
-the-environment-for-installed_tests.patch
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install=
-the-environment-for-installed_tests.patch
>      > deleted file mode 100644
>      > index eabe7bcbe1..0000000000
>      > ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install=
-the-environment-for-installed_tests.patch
>      > +++ /dev/null
>      > @@ -1,58 +0,0 @@
>      > -From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17
>     00:00:00 2001
>      > -From: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      > -Date: Sun, 2 May 2021 01:58:01 +0100
>      > -Subject: [PATCH 4/4] tests: install the environment for
>     installed_tests
>      > -
>      > -- adapt the test environment for installed_tests
>      > -- install the test environment for installed_tests
>      > -- run the tests using the installed environment
>      > -
>      > -Upstream-Status: Submitted
>     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/789
>     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/789>]
>      > -
>      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>     <mailto:quaresma.jose@gmail.com>>
>      > ----
>      > - template.test.in <http://template.test.in>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-
>      > - tests/check/meson.build | 18 ++++++++++++++++++
>      > - 2 files changed, 19 insertions(+), 1 deletion(-)
>      > -
>      > -diff --git a/template.test.in <http://template.test.in>
>     b/template.test.in <http://template.test.in>
>      > -index f701627f8..9a3fbdd09 100644
>      > ---- a/template.test.in <http://template.test.in>
>      > -+++ b/template.test.in <http://template.test.in>
>      > -@@ -1,3 +1,3 @@
>      > - [Test]
>      > - Type=3Dsession
>      > --Exec=3D@installed_tests_dir@/@program@
>      > -+Exec=3Dsh -c 'set -aex && source
>     @installed_tests_dir@/@program@.env && exec
>     @installed_tests_dir@/@program@'
>      > -diff --git a/tests/check/meson.build b/tests/check/meson.build
>      > -index f64524904..a67e0f8dd 100644
>      > ---- a/tests/check/meson.build
>      > -+++ b/tests/check/meson.build
>      > -@@ -183,6 +183,24 @@ foreach t : core_tests
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_dir: installed_tests_=
metadir,
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration: test_conf
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0)
>      > -+
>      > -+=C2=A0 =C2=A0 =C2=A0 env +=3D {'GST_REGISTRY':
>     '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
>      > -+=C2=A0 =C2=A0 =C2=A0 configure_file(
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: test_name + '.env',
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: installed_tests_execd=
ir,
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration : env,
>      > -+=C2=A0 =C2=A0 =C2=A0 )
>      > -+=C2=A0 =C2=A0 =C2=A0 # helper to convert a meson environment d=
ictionay object
>     exported with configure_file
>      > -+=C2=A0 =C2=A0 =C2=A0 # this also remove not needed variables f=
or the installed
>     tests
>      > -+=C2=A0 =C2=A0 =C2=A0 meson.add_postconf_script('sed', '-i',
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 '-e', '/^#define/!d',
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 '-e', 's/^#define //g',
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 '-e', '/^GST_PLUGIN_PATH_1_0/d',
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 '-e', '/^GST_PLUGIN_SYSTEM_PATH_1_=
0/d',
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 '-e', '/^GST_PLUGIN_SCANNER_1_0/d'=
,
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 '-e', 's/ /=3D/',
>      > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 join_paths(meson.current_build_dir=
(), test_name + '.env')
>      > -+=C2=A0 =C2=A0 =C2=A0 )
>      > -=C2=A0 =C2=A0 =C2=A0endif
>      > -
>      > -=C2=A0 =C2=A0 =C2=A0test(test_name, exe, env: env, timeout : 3 =
* 60)
>      > ---
>      > -2.31.1
>      > -
>      > diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
>     <http://gstreamer1.0_1.18.5.bb>
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
>     <http://gstreamer1.0_1.20.0.bb>
>      > similarity index 76%
>      > rename from
>     meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
>     <http://gstreamer1.0_1.18.5.bb>
>      > rename to
>     meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
>     <http://gstreamer1.0_1.20.0.bb>
>      > index 0d82dd338c..243f99fee9 100644
>      > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
>     <http://gstreamer1.0_1.18.5.bb>
>      > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
>     <http://gstreamer1.0_1.20.0.bb>
>      > @@ -10,22 +10,19 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml=
2
>     bison-native flex-native"
>      >
>      >=C2=A0 inherit meson pkgconfig gettext upstream-version-is-even
>     gobject-introspection ptest-gnome
>      >
>      > -LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3D6762ed442b3822387a51c92d928ead0d \
>      > +LIC_FILES_CHKSUM =3D
>     "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a770 \
>      >                    =20
>     file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c=
6fc1c079c016d0d"
>      >
>      >=C2=A0 S =3D "${WORKDIR}/gstreamer-${PV}"
>      >
>      >=C2=A0 SRC_URI =3D
>     "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.ta=
r.xz
>     <https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BPV%7=
D.tar.xz>
>     \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest =
\
>      > -        =20
>      =C2=A0file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not=
-fal.patch \
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Remove-unu=
sed-valgrind-detection.patch \
>      > -        =20
>      =C2=A0file://0003-tests-seek-Don-t-use-too-strict-timeout-for-vali=
dati.patch \
>      > -        =20
>      =C2=A0file://0004-tests-respect-the-idententaion-used-in-meson.pat=
ch \
>      > -        =20
>      =C2=A0file://0005-tests-add-support-for-install-the-tests.patch \
>      > -        =20
>      =C2=A0file://0006-tests-use-a-dictionaries-for-environment.patch \
>      > -        =20
>      =C2=A0file://0007-tests-install-the-environment-for-installed_test=
s.patch \
>      > +        =20
>      =C2=A0file://0001-tests-respect-the-idententaion-used-in-meson.pat=
ch;striplevel=3D3 \
>      > +        =20
>      =C2=A0file://0002-tests-add-support-for-install-the-tests.patch;st=
riplevel=3D3 \
>      > +        =20
>      =C2=A0file://0003-tests-use-a-dictionaries-for-environment.patch;s=
triplevel=3D3 \
>      > +        =20
>      =C2=A0file://0004-tests-add-helper-script-to-run-the-installed_tes=
ts.patch;striplevel=3D3 \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>      > -SRC_URI[sha256sum] =3D
>     "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a"
>      > +SRC_URI[sha256sum] =3D
>     "edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7"
>      >
>      >=C2=A0 PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED',=
 '1',
>     'tests', '', d)} \
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0check \
>      > @@ -36,7 +33,7 @@ PACKAGECONFIG[debug] =3D
>     "-Dgst_debug=3Dtrue,-Dgst_debug=3Dfalse"
>      >=C2=A0 PACKAGECONFIG[tracer-hooks] =3D
>     "-Dtracer_hooks=3Dtrue,-Dtracer_hooks=3Dfalse"
>      >=C2=A0 PACKAGECONFIG[coretracers] =3D
>     "-Dcoretracers=3Denabled,-Dcoretracers=3Ddisabled"
>      >=C2=A0 PACKAGECONFIG[check] =3D "-Dcheck=3Denabled,-Dcheck=3Ddisa=
bled"
>      > -PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
>     -Dinstalled-tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled-tests=3Dfal=
se"
>      > +PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
>     -Dinstalled_tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled_tests=3Dfal=
se"
>      >=C2=A0 PACKAGECONFIG[unwind] =3D
>     "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,libunwind"
>      >=C2=A0 PACKAGECONFIG[dw] =3D "-Dlibdw=3Denabled,-Dlibdw=3Ddisable=
d,elfutils"
>      >=C2=A0 PACKAGECONFIG[bash-completion] =3D
>     "-Dbash-completion=3Denabled,-Dbash-completion=3Ddisabled,bash-comp=
letion"
>      > --
>      > 2.35.1
>      >
>      >
>      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      > Links: You receive all messages sent to this group.
>      > View/Reply Online (#161427):
>     https://lists.openembedded.org/g/openembedded-core/message/161427
>     <https://lists.openembedded.org/g/openembedded-core/message/161427>
>      > Mute This Topic:
>     https://lists.openembedded.org/mt/88962313/1686489
>     <https://lists.openembedded.org/mt/88962313/1686489>
>      > Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>      > Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>      >
>=20
>=20
>=20
> --=20
> Best regards,
>=20
> Jos=C3=A9 Quaresma

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de

