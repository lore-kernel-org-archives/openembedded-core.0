Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6F4C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 08:27:15 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.4964.1645086434951216582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 00:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BGfTuooK;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id c36so2274350uae.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 00:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rhD31s/O4fjLtsX0UE9uOn22KzGjwtMX4lmJFYEmJ+E=;
        b=BGfTuooKVguWFhN2SJYdsHT5D0z0umw79xuK7f+r9v+8z9/fkn0BVOFTSpD5jY+YpG
         8BsDKb8lGB7GJE9nkn8Zv/5ERZLfveOhSW9TBqvSYiYn3HbQlWbEvqQFX3oaM8i4DqGQ
         0RF7PwIVbGLcn7IwzigFy8qVWXLzV1VIpAH2er1ZpbzRSARcyrW3bW7q7PlDTvB4Uu+L
         UnDuYZ+W8i7wdW87tMgo7Bf7jYsklVQf5JREW3y4eLXtGQSZKAPNV8WrTCom/LJ/f/dC
         oQmLotIcc9O0QiQU+6VFPepD0jn1/RgSqCdqoObPjhnDMrMDxQGnRKHSjwYsol8026+r
         i6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rhD31s/O4fjLtsX0UE9uOn22KzGjwtMX4lmJFYEmJ+E=;
        b=0Ll+wTiL2GRFkqhvImNDUpSTsSt94w0epmFtK9eNi0GQ6A0KzPQz50FY2EB1vhVocG
         wlg9MuRoPSlF3PV6hEoBLgF8cHMdu8KC72LCg/mT9KTJ2J/SK8hNf9XD9iAzwyI7iaLm
         /XvBaGb6igjm+m/tDhaj000j9lpy8xpsgyXfdpcwUZtZ9v6G96qWufl6Cl8GXlH7UiAF
         8mnNJNWrkWkGQZIhlmHRyKEAPbNl3Rh+P3muXOOzv9pCYN+b+rxZMQyo/2+y2dAPkDVn
         UtsWpavqgCoDLOxVeaUdNn9TYcY+/uA/DLFIH39oYW410kH1/QyJxWGn6OHRRtA7KmAD
         SgTw==
X-Gm-Message-State: AOAM530gEJ8Uz573KS6dBef9BoT0NxeGzo39oTZx4SHCI8KYPCI2leSb
	r6vo18fQ+PsZCcv8Wz9fY0ZlNu9nLRyAH1tKD+o=
X-Google-Smtp-Source: 
 ABdhPJxvxVbHe/x5VdLNrkt7B+MjLQClWPDGet0052tvY0V4TgKi2v3zDH2JEBGLICuxZtWZJeurwaOZ1DjjQCdftFQ=
X-Received: by 2002:ab0:6919:0:b0:33d:da7:8bc1 with SMTP id
 b25-20020ab06919000000b0033d0da78bc1mr646830uas.89.1645086433797; Thu, 17 Feb
 2022 00:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
 <20220207010823.143664-7-quaresma.jose@gmail.com>
 <CANNYZj8SNr_MA86N9kL7jQw27QV8gDtwH_hSD_a9tfTVL8xd+Q@mail.gmail.com>
 <CANPvuRkJpThUEjiKfzvg4m+Dz_-ChDRu8Yy1LsSnTmK8FdgoDg@mail.gmail.com>
 <720ba17c-525a-3ad0-9c61-f2bc8db82468@denx.de>
 <CANNYZj91L_QUcx-x8YSdSBo6gOqgzY0Cogh7r0ZphW_k4tf-gQ@mail.gmail.com>
 <CANPvuRnZ8PLFsEp=-jQsFWUGoMz2FX=u58yC7pbKr7pof-g5FQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRnZ8PLFsEp=-jQsFWUGoMz2FX=u58yC7pbKr7pof-g5FQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Feb 2022 09:27:01 +0100
Message-ID: 
 <CANNYZj9ZM7jQU7PU5Np7L6KocegYA7Qb9B9OfVgWm11VuWy3Nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Claudius Heine <ch@denx.de>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 08:27:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161793

Simply send the patch, make sure the commit message explains what it's
for, and we'll figure it out. RP regularly has such test-only patches
in master-next, or I can run dedicated ptest builds with it.

Alex

On Thu, 17 Feb 2022 at 00:41, Jose Quaresma <quaresma.jose@gmail.com> wrote=
:
>
>
>
> Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quarta, 9/02/2=
022 =C3=A0(s) 10:34:
>>
>> Yes, it seems to be sporadic. Here's a sample fail:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3083
>> https://autobuilder.yocto.io/pub/non-release/20220208-14/testresults/qem=
ux86-64-ptest/gstreamer1.0.log
>
>
>
> I ask for help upstream but I will try to replicate this with GST_DEBUG e=
nabled.
> Which is the best option to send a patch not for merge but only to run on=
 the autobuilder to generate some logs?
>
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778
>
>>
>>
>> Alex
>>
>> On Wed, 9 Feb 2022 at 10:30, Claudius Heine <ch@denx.de> wrote:
>> >
>> > Hi Jose
>> >
>> > On 2022-02-09 10:15, Jose Quaresma wrote:
>> > > Hi Alexander,
>> > >
>> > > Can you please clarify in what target arch is this happening and I c=
an
>> > > try to replicate it with qemu?
>> >
>> > I think we are hitting:
>> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778
>> >
>> > This testcase seems to be flaky and IIUC upstream marked it as such in
>> > their test infrastructure.
>> >
>> > In my patchset, I added a patch to disable that testcase.
>> >
>> > regards,
>> > Claudius
>> >
>> > >
>> > > It works on my side on qemux86-64.
>> > >
>> > > root@qemux86-64:~# /usr/libexec/installed-tests/gstreamer/gst_gstbin=
.sh
>> > > + CK_DEFAULT_TIMEOUT=3D20
>> > > + GST_PLUGIN_LOADING_WHITELIST=3Dgstreamer
>> > > + GST_REGISTRY=3D/home/root/.cache/gstreamer-1.0/gst_gstbin.registry
>> > > + GST_STATE_IGNORE_ELEMENTS=3D
>> > > + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
>> > > Running suite(s): GstBin
>> > > 100%: Checks: 26, Failures: 0, Errors: 0
>> > > Check suite gst_bin ran in 6.239s (tests failed: 0)
>> > >
>> > >
>> > > Alexander Kanavin <alex.kanavin@gmail.com
>> > > <mailto:alex.kanavin@gmail.com>> escreveu no dia ter=C3=A7a, 8/02/20=
22 =C3=A0(s)
>> > > 22:01:
>> > >
>> > >     Unfortunately this patchset (which is now in master) does not ad=
dress
>> > >     the ptest fail. Please resolve this as soon as possible.
>> > >
>> > >     + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
>> > >     Running suite(s): GstBin
>> > >     Executing: gstreamer/gst_gstbin.test
>> > >     Executing: gstreamer/gst_gstbin.test
>> > >     ....
>> > >     Executing: gstreamer/gst_gstbin.test
>> > >     Executing: gstreamer/gst_gstbin.test
>> > >     Test timed out after 300 seconds
>> > >     FAIL: gstreamer/gst_gstbin.test (Child process killed by signal =
9)
>> > >
>> > >     Alex
>> > >
>> > >     On Mon, 7 Feb 2022 at 02:08, Jose Quaresma <quaresma.jose@gmail.=
com
>> > >     <mailto:quaresma.jose@gmail.com>> wrote:
>> > >      >
>> > >      > - License update:
>> > >      >   The code actually is LGPLv2.1 but the COPYING file is wrong=
.
>> > >      >
>> > >     https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157=
b23fb0ce175b167611a4cb019599d9017042
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d15=
7b23fb0ce175b167611a4cb019599d9017042>
>> > >      >
>> > >      > - Drop backported patches
>> > >      >   0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.p=
atch
>> > >      >   0002-Remove-unused-valgrind-detection.patch
>> > >      >   0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.p=
atch
>> > >      >
>> > >      > - Update submitted patches
>> > >      >   0001-tests-respect-the-idententaion-used-in-meson.patch
>> > >      >   0002-tests-add-support-for-install-the-tests.patch
>> > >      >   0003-tests-use-a-dictionaries-for-environment.patch
>> > >      >   0004-tests-add-helper-script-to-run-the-installed_tests.pat=
ch
>> > >      >
>> > >      > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      > ---
>> > >      >  ...der.c-when-env-var-is-set-do-not-fal.patch |  69 --------=
---
>> > >      >  ...pect-the-idententaion-used-in-meson.patch} |  14 +--
>> > >      >  ...002-Remove-unused-valgrind-detection.patch | 112
>> > >     ------------------
>> > >      >  ...s-add-support-for-install-the-tests.patch} |  67 ++++++--=
---
>> > >      >  ...-use-too-strict-timeout-for-validati.patch |  32 -----
>> > >      >  ...-use-a-dictionaries-for-environment.patch} |  28 +++--
>> > >      >  ...er-script-to-run-the-installed_tests.patch |  74 ++++++++=
++++
>> > >      >  ...-the-environment-for-installed_tests.patch |  58 --------=
-
>> > >      >  ...er1.0_1.18.5.bb <http://er1.0_1.18.5.bb> =3D>
>> > >     gstreamer1.0_1.20.0.bb <http://gstreamer1.0_1.20.0.bb>} |  17 ++=
-
>> > >      >  9 files changed, 136 insertions(+), 335 deletions(-)
>> > >      >  delete mode 100644
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstplugi=
nloader.c-when-env-var-is-set-do-not-fal.patch
>> > >      >  rename
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respe=
ct-the-idententaion-used-in-meson.patch
>> > >     =3D> 0001-tests-respect-the-idententaion-used-in-meson.patch} (7=
1%)
>> > >      >  delete mode 100644
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unuse=
d-valgrind-detection.patch
>> > >      >  rename
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-s=
upport-for-install-the-tests.patch
>> > >     =3D> 0002-tests-add-support-for-install-the-tests.patch} (65%)
>> > >      >  delete mode 100644
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-D=
on-t-use-too-strict-timeout-for-validati.patch
>> > >      >  rename
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a=
-dictionaries-for-environment.patch
>> > >     =3D> 0003-tests-use-a-dictionaries-for-environment.patch} (61%)
>> > >      >  create mode 100644
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-he=
lper-script-to-run-the-installed_tests.patch
>> > >      >  delete mode 100644
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-instal=
l-the-environment-for-installed_tests.patch
>> > >      >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.=
5.bb
>> > >     <http://gstreamer1.0_1.18.5.bb> =3D> gstreamer1.0_1.20.0.bb
>> > >     <http://gstreamer1.0_1.20.0.bb>} (76%)
>> > >      >
>> > >      > diff --git
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstplu=
ginloader.c-when-env-var-is-set-do-not-fal.patch
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstplu=
ginloader.c-when-env-var-is-set-do-not-fal.patch
>> > >      > deleted file mode 100644
>> > >      > index 23ebd5c600..0000000000
>> > >      > ---
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstplu=
ginloader.c-when-env-var-is-set-do-not-fal.patch
>> > >      > +++ /dev/null
>> > >      > @@ -1,69 +0,0 @@
>> > >      > -From fd8f49dba8c09d47425da80f5faab3bfa4a7c962 Mon Sep 17
>> > >     00:00:00 2001
>> > >      > -From: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      > -Date: Sat, 10 Oct 2020 19:09:03 +0000
>> > >      > -Subject: [PATCH 1/3] gstpluginloader: when env var is set do=
 not
>> > >     fall through
>> > >      > - to system plugin scanner
>> > >      > -
>> > >      > -If we set a custom GST_PLUGIN_SCANNER env var, then we proba=
bly
>> > >     want to use that and only that.
>> > >      > -
>> > >      > -Falling through to the one installed on the system is
>> > >     problamatic in cross-compilation
>> > >      > -environemnts, regardless of whether one pointed to by the en=
v
>> > >     var succeeded or failed.
>> > >      > -
>> > >      > -taken from:
>> > >      >
>> > >     -http://cgit.openembedded.org/openembedded-core/commit/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-v=
ar-is-set-do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b
>> > >     <http://cgit.openembedded.org/openembedded-core/commit/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-v=
ar-is-set-do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b>
>> > >      > -
>> > >      > -Part-of:
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/669
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/669>>
>> > >      > -
>> > >      > -Upstream-Status: Backport
>> > >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f9=
58058697e6fbf5bde325228034572331d1a3a
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f9=
58058697e6fbf5bde325228034572331d1a3a>]
>> > >      > -
>> > >      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      > ----
>> > >      > - gst/gstpluginloader.c | 15 +++++++--------
>> > >      > - 1 file changed, 7 insertions(+), 8 deletions(-)
>> > >      > -
>> > >      > -diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
>> > >      > -index d1e404d98..c626bf263 100644
>> > >      > ---- a/gst/gstpluginloader.c
>> > >      > -+++ b/gst/gstpluginloader.c
>> > >      > -@@ -464,20 +464,19 @@ gst_plugin_loader_spawn (GstPluginLoad=
er *
>> > >     loader)
>> > >      > -   if (loader->child_running)
>> > >      > -     return TRUE;
>> > >      > -
>> > >      > --  /* Find the gst-plugin-scanner: first try the env-var if =
it
>> > >     is set,
>> > >      > --   * otherwise use the installed version */
>> > >      > -+  /* Find the gst-plugin-scanner */
>> > >      > -   env =3D g_getenv ("GST_PLUGIN_SCANNER_1_0");
>> > >      > -   if (env =3D=3D NULL)
>> > >      > -     env =3D g_getenv ("GST_PLUGIN_SCANNER");
>> > >      > -
>> > >      > -   if (env !=3D NULL && *env !=3D '\0') {
>> > >      > -+    /* use the env-var if it is set */
>> > >      > -     GST_LOG ("Trying GST_PLUGIN_SCANNER env var: %s", env);
>> > >      > -     helper_bin =3D g_strdup (env);
>> > >      > -     res =3D gst_plugin_loader_try_helper (loader, helper_bi=
n);
>> > >      > -     g_free (helper_bin);
>> > >      > --  }
>> > >      > --
>> > >      > --  if (!res) {
>> > >      > -+  } else {
>> > >      > -+    /* use the installed version */
>> > >      > -     GST_LOG ("Trying installed plugin scanner");
>> > >      > -
>> > >      > - #ifdef G_OS_WIN32
>> > >      > -@@ -497,10 +496,10 @@ gst_plugin_loader_spawn (GstPluginLoad=
er *
>> > >     loader)
>> > >      > - #endif
>> > >      > -     res =3D gst_plugin_loader_try_helper (loader, helper_bi=
n);
>> > >      > -     g_free (helper_bin);
>> > >      > -+  }
>> > >      > -
>> > >      > --    if (!res) {
>> > >      > --      GST_INFO ("No gst-plugin-scanner available, or not wo=
rking");
>> > >      > --    }
>> > >      > -+  if (!res) {
>> > >      > -+    GST_INFO ("No gst-plugin-scanner available, or not work=
ing");
>> > >      > -   }
>> > >      > -
>> > >      > -   return loader->child_running;
>> > >      > ---
>> > >      > -2.29.2
>> > >      > -
>> > >      > diff --git
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-resp=
ect-the-idententaion-used-in-meson.patch
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-resp=
ect-the-idententaion-used-in-meson.patch
>> > >      > similarity index 71%
>> > >      > rename from
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respec=
t-the-idententaion-used-in-meson.patch
>> > >      > rename to
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respec=
t-the-idententaion-used-in-meson.patch
>> > >      > index 6f571a12d8..312c04fbfd 100644
>> > >      > ---
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-resp=
ect-the-idententaion-used-in-meson.patch
>> > >      > +++
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-resp=
ect-the-idententaion-used-in-meson.patch
>> > >      > @@ -1,4 +1,4 @@
>> > >      > -From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17
>> > >     00:00:00 2001
>> > >      > +From 1eb77a4ea5a3967c688d8f1192f99c605badc7e2 Mon Sep 17
>> > >     00:00:00 2001
>> > >      >  From: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      >  Date: Sun, 11 Apr 2021 19:48:13 +0100
>> > >      >  Subject: [PATCH 1/4] tests: respect the idententaion used in=
 meson
>> > >      > @@ -7,13 +7,13 @@ Upstream-Status: Submitted
>> > >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
>> > >      >
>> > >      >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      >  ---
>> > >      > - tests/check/meson.build | 10 +++++-----
>> > >      > + subprojects/gstreamer/tests/check/meson.build | 10 +++++---=
--
>> > >      >   1 file changed, 5 insertions(+), 5 deletions(-)
>> > >      >
>> > >      > -diff --git a/tests/check/meson.build b/tests/check/meson.bui=
ld
>> > >      > -index a617cf159..b2636714b 100644
>> > >      > ---- a/tests/check/meson.build
>> > >      > -+++ b/tests/check/meson.build
>> > >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
>> > >     b/subprojects/gstreamer/tests/check/meson.build
>> > >      > +index 9c4228b6e4..506606684d 100644
>> > >      > +--- a/subprojects/gstreamer/tests/check/meson.build
>> > >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
>> > >      >  @@ -146,11 +146,11 @@ foreach t : core_tests
>> > >      >
>> > >      >     if not skip_test
>> > >      > @@ -32,5 +32,5 @@ index a617cf159..b2636714b 100644
>> > >      >
>> > >      >       env =3D environment()
>> > >      >  --
>> > >      > -2.31.1
>> > >      > +2.33.1
>> > >      >
>> > >      > diff --git
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unu=
sed-valgrind-detection.patch
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unu=
sed-valgrind-detection.patch
>> > >      > deleted file mode 100644
>> > >      > index 5121044734..0000000000
>> > >      > ---
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unu=
sed-valgrind-detection.patch
>> > >      > +++ /dev/null
>> > >      > @@ -1,112 +0,0 @@
>> > >      > -From e275ba2bd854ac15a4b65a8f07d9f042021950da Mon Sep 17
>> > >     00:00:00 2001
>> > >      > -From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <tim@c=
entricular.com
>> > >     <mailto:tim@centricular.com>>
>> > >      > -Date: Fri, 14 Aug 2020 16:38:26 +0100
>> > >      > -Subject: [PATCH 2/3] Remove unused valgrind detection
>> > >      > -
>> > >      > -Having this just to log a debug message in case we're
>> > >      > -running inside valgrind doesn't seem very useful, and
>> > >      > -the code that used to use this no longer exists it seems.
>> > >      > -
>> > >      > -Part-of:
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/595
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/595>>
>> > >      > -
>> > >      > -Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef45=
5972245]
>> > >      > -
>> > >      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      > ----
>> > >      > - gst/gst_private.h |  2 --
>> > >      > - gst/gstinfo.c     | 39 ------------------------------------=
---
>> > >      > - meson.build       |  1 -
>> > >      > - 3 files changed, 42 deletions(-)
>> > >      > -
>> > >      > -diff --git a/gst/gst_private.h b/gst/gst_private.h
>> > >      > -index eefd044..8252ede 100644
>> > >      > ---- a/gst/gst_private.h
>> > >      > -+++ b/gst/gst_private.h
>> > >      > -@@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean
>> > >     _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
>> > >      > -
>> > >      > - G_GNUC_INTERNAL  gboolean _priv_plugin_deps_files_changed
>> > >     (GstPlugin * plugin);
>> > >      > -
>> > >      > --G_GNUC_INTERNAL  gboolean _priv_gst_in_valgrind (void);
>> > >      > --
>> > >      > - /* init functions called from gst_init(). */
>> > >      > - G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
>> > >      > - G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize (vo=
id);
>> > >      > -diff --git a/gst/gstinfo.c b/gst/gstinfo.c
>> > >      > -index eea1a21..d3035d6 100644
>> > >      > ---- a/gst/gstinfo.c
>> > >      > -+++ b/gst/gstinfo.c
>> > >      > -@@ -305,36 +305,6 @@ static gboolean pretty_tags =3D
>> > >     PRETTY_TAGS_DEFAULT;
>> > >      > - static gint G_GNUC_MAY_ALIAS __default_level =3D GST_LEVEL_=
DEFAULT;
>> > >      > - static gint G_GNUC_MAY_ALIAS __use_color =3D GST_DEBUG_COLO=
R_MODE_ON;
>> > >      > -
>> > >      > --/* FIXME: export this? */
>> > >      > --gboolean
>> > >      > --_priv_gst_in_valgrind (void)
>> > >      > --{
>> > >      > --  static enum
>> > >      > --  {
>> > >      > --    GST_VG_UNCHECKED,
>> > >      > --    GST_VG_NO_VALGRIND,
>> > >      > --    GST_VG_INSIDE
>> > >      > --  }
>> > >      > --  in_valgrind =3D GST_VG_UNCHECKED;
>> > >      > --
>> > >      > --  if (in_valgrind =3D=3D GST_VG_UNCHECKED) {
>> > >      > --#ifdef HAVE_VALGRIND_VALGRIND_H
>> > >      > --    if (RUNNING_ON_VALGRIND) {
>> > >      > --      GST_CAT_INFO (GST_CAT_GST_INIT, "we're running inside
>> > >     valgrind");
>> > >      > --      in_valgrind =3D GST_VG_INSIDE;
>> > >      > --    } else {
>> > >      > --      GST_CAT_LOG (GST_CAT_GST_INIT, "not doing extra valgr=
ind
>> > >     stuff");
>> > >      > --      in_valgrind =3D GST_VG_NO_VALGRIND;
>> > >      > --    }
>> > >      > --#else
>> > >      > --    in_valgrind =3D GST_VG_NO_VALGRIND;
>> > >      > --#endif
>> > >      > --    g_assert (in_valgrind =3D=3D GST_VG_NO_VALGRIND ||
>> > >      > --        in_valgrind =3D=3D GST_VG_INSIDE);
>> > >      > --  }
>> > >      > --  return (in_valgrind =3D=3D GST_VG_INSIDE);
>> > >      > --}
>> > >      > --
>> > >      > - static gchar *
>> > >      > - _replace_pattern_in_gst_debug_file_name (gchar * name, cons=
t
>> > >     char *token,
>> > >      > -     guint val)
>> > >      > -@@ -463,9 +433,6 @@ _priv_gst_debug_init (void)
>> > >      > -   _priv_GST_CAT_PROTECTION =3D
>> > >      > -       _gst_debug_category_new ("GST_PROTECTION", 0, "protec=
tion");
>> > >      > -
>> > >      > --  /* print out the valgrind message if we're in valgrind */
>> > >      > --  _priv_gst_in_valgrind ();
>> > >      > --
>> > >      > -   env =3D g_getenv ("GST_DEBUG_OPTIONS");
>> > >      > -   if (env !=3D NULL) {
>> > >      > -     if (strstr (env, "full_tags") || strstr (env, "full-tag=
s"))
>> > >      > -@@ -2505,12 +2472,6 @@ gst_debug_construct_win_color (guint
>> > >     colorinfo)
>> > >      > -   return 0;
>> > >      > - }
>> > >      > -
>> > >      > --gboolean
>> > >      > --_priv_gst_in_valgrind (void)
>> > >      > --{
>> > >      > --  return FALSE;
>> > >      > --}
>> > >      > --
>> > >      > - void
>> > >      > - _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * =
file,
>> > >      > -     const gchar * func, gint line, GObject * obj, const gch=
ar *
>> > >     msg,
>> > >      > -diff --git a/meson.build b/meson.build
>> > >      > -index 82a1728..42ae617 100644
>> > >      > ---- a/meson.build
>> > >      > -+++ b/meson.build
>> > >      > -@@ -200,7 +200,6 @@ check_headers =3D [
>> > >      > -   'sys/wait.h',
>> > >      > -   'ucontext.h',
>> > >      > -   'unistd.h',
>> > >      > --  'valgrind/valgrind.h',
>> > >      > -   'sys/resource.h',
>> > >      > -   'sys/uio.h',
>> > >      > - ]
>> > >      > ---
>> > >      > -2.29.2
>> > >      > -
>> > >      > diff --git
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-=
support-for-install-the-tests.patch
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-=
support-for-install-the-tests.patch
>> > >      > similarity index 65%
>> > >      > rename from
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-su=
pport-for-install-the-tests.patch
>> > >      > rename to
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-su=
pport-for-install-the-tests.patch
>> > >      > index b77fb5797f..d18c19c397 100644
>> > >      > ---
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-=
support-for-install-the-tests.patch
>> > >      > +++
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-=
support-for-install-the-tests.patch
>> > >      > @@ -1,4 +1,4 @@
>> > >      > -From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17
>> > >     00:00:00 2001
>> > >      > +From 62f5bb7bfc2498219df7280e73480d8ed2378ce5 Mon Sep 17
>> > >     00:00:00 2001
>> > >      >  From: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      >  Date: Sun, 11 Apr 2021 19:48:13 +0100
>> > >      >  Subject: [PATCH 2/4] tests: add support for install the test=
s
>> > >      > @@ -11,54 +11,44 @@ Upstream-Status: Submitted
>> > >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
>> > >      >
>> > >      >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      >  ---
>> > >      > - meson.build             |  5 +++++
>> > >      > - meson_options.txt       |  1 +
>> > >      > - template.test.in <http://template.test.in>        |  3 +++
>> > >      > - tests/check/meson.build | 22 +++++++++++++++++++++-
>> > >      > - 4 files changed, 30 insertions(+), 1 deletion(-)
>> > >      > - create mode 100644 template.test.in <http://template.test.i=
n>
>> > >      > + subprojects/gstreamer/meson.build             |  4 ++++
>> > >      > + subprojects/gstreamer/meson_options.txt       |  1 +
>> > >      > + subprojects/gstreamer/tests/check/meson.build | 22
>> > >     ++++++++++++++++++-
>> > >      > + .../gstreamer/tests/check/template.test.in
>> > >     <http://template.test.in>    |  3 +++
>> > >      > + 4 files changed, 29 insertions(+), 1 deletion(-)
>> > >      > + create mode 100644
>> > >     subprojects/gstreamer/tests/check/template.test.in
>> > >     <http://template.test.in>
>> > >      >
>> > >      > -diff --git a/meson.build b/meson.build
>> > >      > -index c4e8774f5..1abf4eb26 100644
>> > >      > ---- a/meson.build
>> > >      > -+++ b/meson.build
>> > >      > -@@ -562,6 +562,11 @@ if bashcomp_dep.found()
>> > >      > +diff --git a/subprojects/gstreamer/meson.build
>> > >     b/subprojects/gstreamer/meson.build
>> > >      > +index d20fe0040f..b595d8f990 100644
>> > >      > +--- a/subprojects/gstreamer/meson.build
>> > >      > ++++ b/subprojects/gstreamer/meson.build
>> > >      > +@@ -562,6 +562,10 @@ if bashcomp_dep.found()
>> > >      >     endif
>> > >      >   endif
>> > >      >
>> > >      > ++installed_tests_enabled =3D get_option('installed_tests')
>> > >      >  +installed_tests_metadir =3D join_paths(datadir,
>> > >     'installed-tests', meson.project_name())
>> > >      >  +installed_tests_execdir =3D join_paths(libexecdir,
>> > >     'installed-tests', meson.project_name())
>> > >      > -+installed_tests_enabled =3D get_option('installed-tests')
>> > >      > -+installed_tests_template =3D files('template.test.in
>> > >     <http://template.test.in>')
>> > >      >  +
>> > >      >   plugins_install_dir =3D join_paths(get_option('libdir'),
>> > >     'gstreamer-1.0')
>> > >      >
>> > >      >   pkgconfig =3D import('pkgconfig')
>> > >      > -diff --git a/meson_options.txt b/meson_options.txt
>> > >      > -index c8cee3762..b5da40eaa 100644
>> > >      > ---- a/meson_options.txt
>> > >      > -+++ b/meson_options.txt
>> > >      > +diff --git a/subprojects/gstreamer/meson_options.txt
>> > >     b/subprojects/gstreamer/meson_options.txt
>> > >      > +index 7363bdb7a1..a34ba37dad 100644
>> > >      > +--- a/subprojects/gstreamer/meson_options.txt
>> > >      > ++++ b/subprojects/gstreamer/meson_options.txt
>> > >      >  @@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', valu=
e :
>> > >     false, description : 'Enable poiso
>> > >      >   option('memory-alignment', type: 'combo',
>> > >      >          choices : ['1', '2', '4', '8', '16', '32', '64', '12=
8',
>> > >     '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesiz=
e'],
>> > >      >          value: 'malloc')
>> > >      > -+option('installed-tests', type : 'boolean', value : false,
>> > >     description : 'Enable installed tests')
>> > >      > ++option('installed_tests', type : 'boolean', value : false,
>> > >     description : 'Enable installed tests')
>> > >      >
>> > >      >   # Feature options
>> > >      >   option('check', type : 'feature', value : 'auto', descripti=
on :
>> > >     'Build unit test libraries')
>> > >      > -diff --git a/template.test.in <http://template.test.in>
>> > >     b/template.test.in <http://template.test.in>
>> > >      > -new file mode 100644
>> > >      > -index 000000000..f701627f8
>> > >      > ---- /dev/null
>> > >      > -+++ b/template.test.in <http://template.test.in>
>> > >      > -@@ -0,0 +1,3 @@
>> > >      > -+[Test]
>> > >      > -+Type=3Dsession
>> > >      > -+Exec=3D@installed_tests_dir@/@program@
>> > >      > -diff --git a/tests/check/meson.build b/tests/check/meson.bui=
ld
>> > >      > -index b2636714b..a697a7b06 100644
>> > >      > ---- a/tests/check/meson.build
>> > >      > -+++ b/tests/check/meson.build
>> > >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
>> > >     b/subprojects/gstreamer/tests/check/meson.build
>> > >      > +index 506606684d..00a138a568 100644
>> > >      > +--- a/subprojects/gstreamer/tests/check/meson.build
>> > >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
>> > >      >  @@ -124,10 +124,16 @@ test_defines =3D [
>> > >      >     '-UG_DISABLE_ASSERT',
>> > >      >     '-UG_DISABLE_CAST_CHECKS',
>> > >      > @@ -95,7 +85,7 @@ index b2636714b..a697a7b06 100644
>> > >      >  +      test_conf.set('installed_tests_dir', join_paths(prefi=
x,
>> > >     installed_tests_execdir))
>> > >      >  +      test_conf.set('program', test_name)
>> > >      >  +      configure_file(
>> > >      > -+        input: installed_tests_template,
>> > >      > ++        input: 'template.test.in <http://template.test.in>'=
,
>> > >      >  +        output: test_name + '.test',
>> > >      >  +        install_dir: installed_tests_metadir,
>> > >      >  +        configuration: test_conf
>> > >      > @@ -105,6 +95,15 @@ index b2636714b..a697a7b06 100644
>> > >      >       test(test_name, exe, env: env, timeout : 3 * 60)
>> > >      >     endif
>> > >      >   endforeach
>> > >      > +diff --git a/subprojects/gstreamer/tests/check/template.test=
.in
>> > >     <http://template.test.in>
>> > >     b/subprojects/gstreamer/tests/check/template.test.in
>> > >     <http://template.test.in>
>> > >      > +new file mode 100644
>> > >      > +index 0000000000..f701627f87
>> > >      > +--- /dev/null
>> > >      > ++++ b/subprojects/gstreamer/tests/check/template.test.in
>> > >     <http://template.test.in>
>> > >      > +@@ -0,0 +1,3 @@
>> > >      > ++[Test]
>> > >      > ++Type=3Dsession
>> > >      > ++Exec=3D@installed_tests_dir@/@program@
>> > >      >  --
>> > >      > -2.31.1
>> > >      > +2.33.1
>> > >      >
>> > >      > diff --git
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek=
-Don-t-use-too-strict-timeout-for-validati.patch
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek=
-Don-t-use-too-strict-timeout-for-validati.patch
>> > >      > deleted file mode 100644
>> > >      > index e0e64e2c7a..0000000000
>> > >      > ---
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek=
-Don-t-use-too-strict-timeout-for-validati.patch
>> > >      > +++ /dev/null
>> > >      > @@ -1,32 +0,0 @@
>> > >      > -From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17
>> > >     00:00:00 2001
>> > >      > -From: Seungha Yang <seungha@centricular.com
>> > >     <mailto:seungha@centricular.com>>
>> > >      > -Date: Tue, 15 Sep 2020 00:54:58 +0900
>> > >      > -Subject: [PATCH] tests: seek: Don't use too strict timeout f=
or
>> > >     validation
>> > >      > -
>> > >      > -Expected segment-done message might not be seen within expec=
ted
>> > >      > -time if system is not powerful enough.
>> > >      > -
>> > >      > -Part-of:
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/625
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/625>>
>> > >      > -
>> > >      > -Upstream-Status: Backport
>> > >     [https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=3Df4=
4312ae5d831438fcf8041162079c65321c588c
>> > >     <https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=3Df4=
4312ae5d831438fcf8041162079c65321c588c>]
>> > >      > -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
>> > >     <mailto:anuj.mittal@intel.com>>
>> > >      > ----
>> > >      > - tests/check/pipelines/seek.c | 2 +-
>> > >      > - 1 file changed, 1 insertion(+), 1 deletion(-)
>> > >      > -
>> > >      > -diff --git a/tests/check/pipelines/seek.c
>> > >     b/tests/check/pipelines/seek.c
>> > >      > -index 28bb8846d..5f7447bc5 100644
>> > >      > ---- a/tests/check/pipelines/seek.c
>> > >      > -+++ b/tests/check/pipelines/seek.c
>> > >      > -@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
>> > >      > -
>> > >      > -   GST_INFO ("wait for segment done message");
>> > >      > -
>> > >      > --  msg =3D gst_bus_timed_pop_filtered (bus, (GstClockTime) 2=
 *
>> > >     GST_SECOND,
>> > >      > -+  msg =3D gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_N=
ONE,
>> > >      > -       GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERROR);
>> > >      > -   fail_unless (msg, "no message within the timed window");
>> > >      > -   fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg),
>> > >     "segment-done");
>> > >      > ---
>> > >      > -2.29.2
>> > >      > -
>> > >      > diff --git
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-=
a-dictionaries-for-environment.patch
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-=
a-dictionaries-for-environment.patch
>> > >      > similarity index 61%
>> > >      > rename from
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-=
dictionaries-for-environment.patch
>> > >      > rename to
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-=
dictionaries-for-environment.patch
>> > >      > index 46813cec3d..10a6dcc619 100644
>> > >      > ---
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-=
a-dictionaries-for-environment.patch
>> > >      > +++
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-=
a-dictionaries-for-environment.patch
>> > >      > @@ -1,4 +1,4 @@
>> > >      > -From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17
>> > >     00:00:00 2001
>> > >      > +From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17
>> > >     00:00:00 2001
>> > >      >  From: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      >  Date: Sat, 24 Apr 2021 10:34:47 +0100
>> > >      >  Subject: [PATCH 3/4] tests: use a dictionaries for environme=
nt
>> > >      > @@ -10,29 +10,31 @@ Upstream-Status: Submitted
>> > >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
>> > >      >
>> > >      >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      >  ---
>> > >      > - tests/check/meson.build | 19 +++++++++++--------
>> > >      > - 1 file changed, 11 insertions(+), 8 deletions(-)
>> > >      > + subprojects/gstreamer/tests/check/meson.build | 21
>> > >     ++++++++++++-------
>> > >      > + 1 file changed, 13 insertions(+), 8 deletions(-)
>> > >      >
>> > >      > -diff --git a/tests/check/meson.build b/tests/check/meson.bui=
ld
>> > >      > -index a697a7b06..f64524904 100644
>> > >      > ---- a/tests/check/meson.build
>> > >      > -+++ b/tests/check/meson.build
>> > >      > -@@ -161,14 +161,17 @@ foreach t : core_tests
>> > >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
>> > >     b/subprojects/gstreamer/tests/check/meson.build
>> > >      > +index 00a138a568..48ec2532f8 100644
>> > >      > +--- a/subprojects/gstreamer/tests/check/meson.build
>> > >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
>> > >      > +@@ -161,14 +161,19 @@ foreach t : core_tests
>> > >      >         install: installed_tests_enabled,
>> > >      >       )
>> > >      >
>> > >      >  -    env =3D environment()
>> > >      > --    env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
>> > >      > +-    env.set('GST_PLUGIN_PATH_1_0', meson.project_build_root=
())
>> > >      >  -    env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
>> > >      >  -    env.set('GST_STATE_IGNORE_ELEMENTS', '')
>> > >      >  -    env.set('CK_DEFAULT_TIMEOUT', '20')
>> > >      >  -    env.set('GST_REGISTRY',
>> > >     '@0@/@1@.registry'.format(meson.current_build_dir(), test_name))
>> > >      >  -    env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir +
>> > >     '/gst-plugin-scanner')
>> > >      >  -    env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
>> > >      > -+    # environment() can't be passed to configure_file and i=
t is
>> > >     needed for installed_tests
>> > >      > -+    # use a dictionary as this is simplest solution to inst=
all
>> > >     the environment
>> > >      > ++    # meson environment object can't be passed to
>> > >     configure_file and
>> > >      > ++    # installed tests uses configure_file to install the
>> > >     environment.
>> > >      > ++    # use a dictionary as this is the simplest solution
>> > >      > ++    # to install the environment.
>> > >      >  +    env =3D {
>> > >      > -+      'GST_PLUGIN_PATH_1_0': meson.build_root(),
>> > >      > ++      'GST_PLUGIN_PATH_1_0': meson.project_build_root(),
>> > >      >  +      'GST_PLUGIN_SYSTEM_PATH_1_0': '',
>> > >      >  +      'GST_STATE_IGNORE_ELEMENTS': '',
>> > >      >  +      'CK_DEFAULT_TIMEOUT': '20',
>> > >      > @@ -44,5 +46,5 @@ index a697a7b06..f64524904 100644
>> > >      >       if installed_tests_enabled
>> > >      >         test_conf =3D configuration_data()
>> > >      >  --
>> > >      > -2.31.1
>> > >      > +2.33.1
>> > >      >
>> > >      > diff --git
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-=
helper-script-to-run-the-installed_tests.patch
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-=
helper-script-to-run-the-installed_tests.patch
>> > >      > new file mode 100644
>> > >      > index 0000000000..efa004f8ce
>> > >      > --- /dev/null
>> > >      > +++
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-=
helper-script-to-run-the-installed_tests.patch
>> > >      > @@ -0,0 +1,74 @@
>> > >      > +From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17
>> > >     00:00:00 2001
>> > >      > +From: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      > +Date: Sun, 2 May 2021 01:58:01 +0100
>> > >      > +Subject: [PATCH 4/4] tests: add helper script to run the
>> > >     installed_tests
>> > >      > +
>> > >      > +- this is a bash script that will run the installed_tests
>> > >      > +with some of the environment variables used in the meson
>> > >      > +testing framework.
>> > >      > +
>> > >      > +Upstream-Status: Submitted
>> > >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/789
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/789>]
>> > >      > +
>> > >      > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      > +---
>> > >      > + subprojects/gstreamer/tests/check/meson.build   | 17
>> > >     +++++++++++++++++
>> > >      > + .../gstreamer/tests/check/template.sh.in
>> > >     <http://template.sh.in>        |  9 +++++++++
>> > >      > + .../gstreamer/tests/check/template.test.in
>> > >     <http://template.test.in>      |  2 +-
>> > >      > + 3 files changed, 27 insertions(+), 1 deletion(-)
>> > >      > + create mode 100755
>> > >     subprojects/gstreamer/tests/check/template.sh.in <http://templat=
e.sh.in>
>> > >      > +
>> > >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
>> > >     b/subprojects/gstreamer/tests/check/meson.build
>> > >      > +index 48ec2532f8..7dc4990d4e 100644
>> > >      > +--- a/subprojects/gstreamer/tests/check/meson.build
>> > >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
>> > >      > +@@ -185,6 +185,23 @@ foreach t : core_tests
>> > >      > +         install_dir: installed_tests_metadir,
>> > >      > +         configuration: test_conf
>> > >      > +       )
>> > >      > ++
>> > >      > ++      # All the tests will be deployed on the target machin=
e and
>> > >      > ++      # we use the home folder ~ for the registry which wil=
l
>> > >     then expand at runtime.
>> > >      > ++      # Using the /tmp/gstreamer-1.0/@0@.registry can be
>> > >     problematic as it mostly
>> > >      > ++      # is mounted using tmpfs and if the machine crash fro=
m
>> > >     some reason we can lost the registry
>> > >      > ++      # that is useful for debug propose of the tests itsel=
f.
>> > >      > ++      env +=3D {'GST_REGISTRY':
>> > >     '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
>> > >      > ++
>> > >      > ++      # Set the full path for the test it self.
>> > >      > ++      env +=3D {'TEST': '@0@/@1@'.format(join_paths(prefix,
>> > >     installed_tests_execdir), test_name)}
>> > >      > ++
>> > >      > ++      configure_file(
>> > >      > ++        input : 'template.sh.in <http://template.sh.in>',
>> > >      > ++        output: test_name + '.sh',
>> > >      > ++        install_dir: installed_tests_execdir,
>> > >      > ++        configuration : env,
>> > >      > ++      )
>> > >      > +     endif
>> > >      > +
>> > >      > +     test(test_name, exe, env: env, timeout : 3 * 60)
>> > >      > +diff --git a/subprojects/gstreamer/tests/check/template.sh.i=
n
>> > >     <http://template.sh.in>
>> > >     b/subprojects/gstreamer/tests/check/template.sh.in
>> > >     <http://template.sh.in>
>> > >      > +new file mode 100755
>> > >      > +index 0000000000..cf7d31b0ea
>> > >      > +--- /dev/null
>> > >      > ++++ b/subprojects/gstreamer/tests/check/template.sh.in
>> > >     <http://template.sh.in>
>> > >      > +@@ -0,0 +1,9 @@
>> > >      > ++#!/bin/sh
>> > >      > ++
>> > >      > ++set -ax
>> > >      > ++
>> > >      > ++CK_DEFAULT_TIMEOUT=3D"@CK_DEFAULT_TIMEOUT@"
>> > >      > ++GST_PLUGIN_LOADING_WHITELIST=3D"@GST_PLUGIN_LOADING_WHITELI=
ST@"
>> > >      > ++GST_REGISTRY=3D@GST_REGISTRY@
>> > >      > ++GST_STATE_IGNORE_ELEMENTS=3D"@GST_STATE_IGNORE_ELEMENTS@"
>> > >      > ++exec @TEST@
>> > >      > +diff --git a/subprojects/gstreamer/tests/check/template.test=
.in
>> > >     <http://template.test.in>
>> > >     b/subprojects/gstreamer/tests/check/template.test.in
>> > >     <http://template.test.in>
>> > >      > +index f701627f87..b74ef6ad73 100644
>> > >      > +--- a/subprojects/gstreamer/tests/check/template.test.in
>> > >     <http://template.test.in>
>> > >      > ++++ b/subprojects/gstreamer/tests/check/template.test.in
>> > >     <http://template.test.in>
>> > >      > +@@ -1,3 +1,3 @@
>> > >      > + [Test]
>> > >      > + Type=3Dsession
>> > >      > +-Exec=3D@installed_tests_dir@/@program@
>> > >      > ++Exec=3D@installed_tests_dir@/@program@.sh
>> > >      > +--
>> > >      > +2.33.1
>> > >      > +
>> > >      > diff --git
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-inst=
all-the-environment-for-installed_tests.patch
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-inst=
all-the-environment-for-installed_tests.patch
>> > >      > deleted file mode 100644
>> > >      > index eabe7bcbe1..0000000000
>> > >      > ---
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-inst=
all-the-environment-for-installed_tests.patch
>> > >      > +++ /dev/null
>> > >      > @@ -1,58 +0,0 @@
>> > >      > -From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17
>> > >     00:00:00 2001
>> > >      > -From: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      > -Date: Sun, 2 May 2021 01:58:01 +0100
>> > >      > -Subject: [PATCH 4/4] tests: install the environment for
>> > >     installed_tests
>> > >      > -
>> > >      > -- adapt the test environment for installed_tests
>> > >      > -- install the test environment for installed_tests
>> > >      > -- run the tests using the installed environment
>> > >      > -
>> > >      > -Upstream-Status: Submitted
>> > >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/789
>> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requ=
ests/789>]
>> > >      > -
>> > >      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
>> > >     <mailto:quaresma.jose@gmail.com>>
>> > >      > ----
>> > >      > - template.test.in <http://template.test.in>        |  2 +-
>> > >      > - tests/check/meson.build | 18 ++++++++++++++++++
>> > >      > - 2 files changed, 19 insertions(+), 1 deletion(-)
>> > >      > -
>> > >      > -diff --git a/template.test.in <http://template.test.in>
>> > >     b/template.test.in <http://template.test.in>
>> > >      > -index f701627f8..9a3fbdd09 100644
>> > >      > ---- a/template.test.in <http://template.test.in>
>> > >      > -+++ b/template.test.in <http://template.test.in>
>> > >      > -@@ -1,3 +1,3 @@
>> > >      > - [Test]
>> > >      > - Type=3Dsession
>> > >      > --Exec=3D@installed_tests_dir@/@program@
>> > >      > -+Exec=3Dsh -c 'set -aex && source
>> > >     @installed_tests_dir@/@program@.env && exec
>> > >     @installed_tests_dir@/@program@'
>> > >      > -diff --git a/tests/check/meson.build b/tests/check/meson.bui=
ld
>> > >      > -index f64524904..a67e0f8dd 100644
>> > >      > ---- a/tests/check/meson.build
>> > >      > -+++ b/tests/check/meson.build
>> > >      > -@@ -183,6 +183,24 @@ foreach t : core_tests
>> > >      > -         install_dir: installed_tests_metadir,
>> > >      > -         configuration: test_conf
>> > >      > -       )
>> > >      > -+
>> > >      > -+      env +=3D {'GST_REGISTRY':
>> > >     '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
>> > >      > -+      configure_file(
>> > >      > -+        output: test_name + '.env',
>> > >      > -+        install_dir: installed_tests_execdir,
>> > >      > -+        configuration : env,
>> > >      > -+      )
>> > >      > -+      # helper to convert a meson environment dictionay obj=
ect
>> > >     exported with configure_file
>> > >      > -+      # this also remove not needed variables for the insta=
lled
>> > >     tests
>> > >      > -+      meson.add_postconf_script('sed', '-i',
>> > >      > -+        '-e', '/^#define/!d',
>> > >      > -+        '-e', 's/^#define //g',
>> > >      > -+        '-e', '/^GST_PLUGIN_PATH_1_0/d',
>> > >      > -+        '-e', '/^GST_PLUGIN_SYSTEM_PATH_1_0/d',
>> > >      > -+        '-e', '/^GST_PLUGIN_SCANNER_1_0/d',
>> > >      > -+        '-e', 's/ /=3D/',
>> > >      > -+        join_paths(meson.current_build_dir(), test_name + '=
.env')
>> > >      > -+      )
>> > >      > -     endif
>> > >      > -
>> > >      > -     test(test_name, exe, env: env, timeout : 3 * 60)
>> > >      > ---
>> > >      > -2.31.1
>> > >      > -
>> > >      > diff --git
>> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
>> > >     <http://gstreamer1.0_1.18.5.bb>
>> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
>> > >     <http://gstreamer1.0_1.20.0.bb>
>> > >      > similarity index 76%
>> > >      > rename from
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
>> > >     <http://gstreamer1.0_1.18.5.bb>
>> > >      > rename to
>> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
>> > >     <http://gstreamer1.0_1.20.0.bb>
>> > >      > index 0d82dd338c..243f99fee9 100644
>> > >      > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.b=
b
>> > >     <http://gstreamer1.0_1.18.5.bb>
>> > >      > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.b=
b
>> > >     <http://gstreamer1.0_1.20.0.bb>
>> > >      > @@ -10,22 +10,19 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lib=
xml2
>> > >     bison-native flex-native"
>> > >      >
>> > >      >  inherit meson pkgconfig gettext upstream-version-is-even
>> > >     gobject-introspection ptest-gnome
>> > >      >
>> > >      > -LIC_FILES_CHKSUM =3D
>> > >     "file://COPYING;md5=3D6762ed442b3822387a51c92d928ead0d \
>> > >      > +LIC_FILES_CHKSUM =3D
>> > >     "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a770 \
>> > >      >
>> > >     file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205e=
e2c6fc1c079c016d0d"
>> > >      >
>> > >      >  S =3D "${WORKDIR}/gstreamer-${PV}"
>> > >      >
>> > >      >  SRC_URI =3D
>> > >     "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}=
.tar.xz
>> > >     <https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BP=
V%7D.tar.xz>
>> > >     \
>> > >      >             file://run-ptest \
>> > >      > -
>> > >       file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-f=
al.patch \
>> > >      > -           file://0002-Remove-unused-valgrind-detection.patc=
h \
>> > >      > -
>> > >       file://0003-tests-seek-Don-t-use-too-strict-timeout-for-valida=
ti.patch \
>> > >      > -
>> > >       file://0004-tests-respect-the-idententaion-used-in-meson.patch=
 \
>> > >      > -
>> > >       file://0005-tests-add-support-for-install-the-tests.patch \
>> > >      > -
>> > >       file://0006-tests-use-a-dictionaries-for-environment.patch \
>> > >      > -
>> > >       file://0007-tests-install-the-environment-for-installed_tests.=
patch \
>> > >      > +
>> > >       file://0001-tests-respect-the-idententaion-used-in-meson.patch=
;striplevel=3D3 \
>> > >      > +
>> > >       file://0002-tests-add-support-for-install-the-tests.patch;stri=
plevel=3D3 \
>> > >      > +
>> > >       file://0003-tests-use-a-dictionaries-for-environment.patch;str=
iplevel=3D3 \
>> > >      > +
>> > >       file://0004-tests-add-helper-script-to-run-the-installed_tests=
.patch;striplevel=3D3 \
>> > >      >             "
>> > >      > -SRC_URI[sha256sum] =3D
>> > >     "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80=
a"
>> > >      > +SRC_URI[sha256sum] =3D
>> > >     "edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db=
7"
>> > >      >
>> > >      >  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '=
1',
>> > >     'tests', '', d)} \
>> > >      >                     check \
>> > >      > @@ -36,7 +33,7 @@ PACKAGECONFIG[debug] =3D
>> > >     "-Dgst_debug=3Dtrue,-Dgst_debug=3Dfalse"
>> > >      >  PACKAGECONFIG[tracer-hooks] =3D
>> > >     "-Dtracer_hooks=3Dtrue,-Dtracer_hooks=3Dfalse"
>> > >      >  PACKAGECONFIG[coretracers] =3D
>> > >     "-Dcoretracers=3Denabled,-Dcoretracers=3Ddisabled"
>> > >      >  PACKAGECONFIG[check] =3D "-Dcheck=3Denabled,-Dcheck=3Ddisabl=
ed"
>> > >      > -PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
>> > >     -Dinstalled-tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled-tests=3D=
false"
>> > >      > +PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
>> > >     -Dinstalled_tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled_tests=3D=
false"
>> > >      >  PACKAGECONFIG[unwind] =3D
>> > >     "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,libunwind"
>> > >      >  PACKAGECONFIG[dw] =3D "-Dlibdw=3Denabled,-Dlibdw=3Ddisabled,=
elfutils"
>> > >      >  PACKAGECONFIG[bash-completion] =3D
>> > >     "-Dbash-completion=3Denabled,-Dbash-completion=3Ddisabled,bash-c=
ompletion"
>> > >      > --
>> > >      > 2.35.1
>> > >      >
>> > >      >
>> > >      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > >      > Links: You receive all messages sent to this group.
>> > >      > View/Reply Online (#161427):
>> > >     https://lists.openembedded.org/g/openembedded-core/message/16142=
7
>> > >     <https://lists.openembedded.org/g/openembedded-core/message/1614=
27>
>> > >      > Mute This Topic:
>> > >     https://lists.openembedded.org/mt/88962313/1686489
>> > >     <https://lists.openembedded.org/mt/88962313/1686489>
>> > >      > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>> > >      > Unsubscribe:
>> > >     https://lists.openembedded.org/g/openembedded-core/unsub
>> > >     <https://lists.openembedded.org/g/openembedded-core/unsub>
>> > >     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>> > >      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > >      >
>> > >
>> > >
>> > >
>> > > --
>> > > Best regards,
>> > >
>> > > Jos=C3=A9 Quaresma
>> >
>> > --
>> > DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
>> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
>> > Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

