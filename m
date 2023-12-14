Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C77C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 14:27:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.23511.1702564067470541317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 06:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fb+xq8/V;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33644eeb305so776309f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702564066; x=1703168866; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6kFXy2bPm1qU03bofgwsnKKiFsyN+T4ZhKhWfxIAWE=;
        b=fb+xq8/V/AM+NCuBgGhD73JPH7hP67DW7z929RUz6JPFv54StbjpuMKxgI1TV6yaEH
         F6FzIVibzaRbaiNZYdMPhaGjF/g3wQWT+hcyKIJAeL85Grl/ajWufIr22/0mD2d/Z/Aj
         8xqtsT6lTnaPmBKyQ1xCIz+gf56BBap4/MV8bNccY+QLfJGtMIEqWFVr4dMEAIt/jEA4
         k84K+bSm6K0KakqjuvExtQLz9/39z7vr28xqm8pde5NvsscsZwMFkB0YZtgd73tkLShm
         hMoSSQ76O3HJTclJn/6qTXkwtdsuDfYGONqvY0hBCxKwC6vKjKjOKX1+VemimbG8iL50
         QsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702564066; x=1703168866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6kFXy2bPm1qU03bofgwsnKKiFsyN+T4ZhKhWfxIAWE=;
        b=XhxO5wEnYQ+jVDgm5arpQNmb4AgFWt9/nh6uWfLnl1uv8oDvfCJbh8irKrBSz2ZGsI
         IBwjtUa7SFvR4KFFhqeI7f5GY8XjnFduaVxHzqPiUeptAkh4jI49daIDZZVvhoHHiAlM
         Rtt5kJ/HhY8ZyL+5czQ72HNv/jBIgpC/3oR0PoEQZOLteLLqC99kWHU9WqpSmPe1royF
         fdkVjJnzy/R6/VJCSwp6l7CBXFgT7HbXgc2FUK/z6QLRvNLioarLZ8egebTWsKBwyGs8
         zQFn1VQJTD03Kc/GEAcQPJjxoq6VxSG/LRcHYoGnyUH0bV7tPXSeIJLWNzgVSh/4wXgM
         1gJA==
X-Gm-Message-State: AOJu0YwZjJDQcXJIPlgqUy7uMefFpK6l4rqVEG1SkAC/ndq6ycEcf85Y
	M9kNSB/a102tKpoNMXX8GPT4mZNZf2BYvUtg5bA=
X-Google-Smtp-Source: AGHT+IHoeFUnkXMcp0zgIoMv/GFbKDu4Ol3jzoF9mFx2Zq3ohsHmR4DRwFK8WPE1ydsHZbTNDpqz+V02+81rrVSBCAI=
X-Received: by 2002:a5d:6042:0:b0:333:40b5:fa07 with SMTP id
 j2-20020a5d6042000000b0033340b5fa07mr4539446wrt.137.1702564065486; Thu, 14
 Dec 2023 06:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20231205063249.3433-1-victor.kamensky7@gmail.com>
 <CA+chaQeUbSV49rXVnbfbQ3f_5z8b2iizZxh1_YVogWWpwL255g@mail.gmail.com>
 <CAHSqoWuSCbwhKKpBCnMxp4TxH4Yi0gyujPYXZpW6FFB-UtDywg@mail.gmail.com> <17A0859025DAC108.11381@lists.openembedded.org>
In-Reply-To: <17A0859025DAC108.11381@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Dec 2023 15:27:33 +0100
Message-ID: <CA+chaQez7yu1qJKjLRKAqT+JRZhfyYr+TnW6Xr7FVj6Rhk06ZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemtap: upgrade 4.9 -> 5.0
To: martin.jansa@gmail.com
Cc: Victor Kamensky <victor.kamensky7@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000054ae8d060c791635"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192383

--00000000000054ae8d060c791635
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

PACKAGECONFIG:remove:pn-elfutils =3D "debuginfod"
PACKAGECONFIG:remove:pn-elfutils =3D "libdebuginfod"
PACKAGECONFIG:remove:pn-binutils =3D "debuginfod"

in local.conf is the easiest way to reproduce it.

The one for binutils isn't strictly needed (but target binutils will fail
as well when debuginfod is disabled in elfutils and enabled in binutils).

On Wed, Dec 13, 2023 at 11:45=E2=80=AFPM Martin Jansa via lists.openembedde=
d.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Hi Victor,
>
> no problem, at least it forced me to enable debuginfod in our builds as
> well (where it wasn't intentionally disabled). Just didn't get enabled wh=
en
> it was added to default DISTRO_FEATUREs as we define our own and it wasn'=
t
> using BACKFILL mechanism to enable it in such setups.
>
> Removing debuginfod from DISTRO_FEATURES should be enough to reproduce th=
e
> issue (as it will disable both *debuginfod PACKAGECONFIG options from
> elfutils as well).
>
> I haven't tried, but removing the PACKAGECONFIG just from elfutils will
> probably reproduce it as well (with possibly fewer recipes needing to
> rebuilt). There are 2 PACKAGECONFIGs for this, not sure which one is
> needed, but you can just disable both.
>
> Cheers,
>
> On Wed, Dec 13, 2023 at 10:27=E2=80=AFPM Victor Kamensky <
> victor.kamensky7@gmail.com> wrote:
>
>> Hi Martin,
>>
>> Sorry about that. I am looking at it now.
>>
>> Do I understand it correctly to reproduce the issue: I need to remove
>> debuginfod (as it is currently on
>> by default) from DISTO_FEATURES and remove debuginfod from elfutils
>> PACKAGECONFIG defaults?
>>
>> Thanks,
>> Victor
>>
>> On Sun, Dec 10, 2023 at 3:16=E2=80=AFAM Martin Jansa <martin.jansa@gmail=
.com>
>> wrote:
>> >
>> > This seems to be causing:
>> > ../git/util.cxx:51:10: fatal error: elfutils/debuginfod.h: No such fil=
e
>> or directory
>> >    51 | #include <elfutils/debuginfod.h>
>> >       |          ^~~~~~~~~~~~~~~~~~~~~~~
>> > compilation terminated.
>> > make[2]: *** [Makefile:1389: stap-util.o] Error 1
>> >
>> > on some systems.
>> >
>> > Looks like with
>> https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcommit;h=3D2e67b053e37=
96ee7cf29a39f9698729b52078406
>> it now enables debuginfod ("AC_MSG_RESULT([yes])" _after_ the
>> PKG_CHECK_MODULES now seems wrong).
>> >
>> > log.do_configure:
>> > checking whether to use debuginfod... checking for debuginfod... no
>> > yes
>> > checking for debuginfod_find_metadata in -ldebuginfod... no
>> >
>> > build $ grep DEBUGINFO config.h
>> > #define HAVE_LIBDEBUGINFOD 1
>> >
>> > config.log (see the strange result yes):
>> > configure:12213: checking whether to use debuginfod
>> > configure:12228: checking for debuginfod
>> > configure:12235: $PKG_CONFIG --exists --print-errors "libdebuginfod >=
=3D
>> 0.179"
>> > Package libdebuginfod was not found in the pkg-config search path.
>> > Perhaps you should add the directory containing `libdebuginfod.pc'
>> > to the PKG_CONFIG_PATH environment variable
>> > No package 'libdebuginfod' found
>> > configure:12238: $? =3D 1
>> > configure:12252: $PKG_CONFIG --exists --print-errors "libdebuginfod >=
=3D
>> 0.179"
>> > Package libdebuginfod was not found in the pkg-config search path.
>> > Perhaps you should add the directory containing `libdebuginfod.pc'
>> > to the PKG_CONFIG_PATH environment variable
>> > No package 'libdebuginfod' found
>> > configure:12255: $? =3D 1
>> > configure:12269: result: no
>> > No package 'libdebuginfod' found
>> > configure:12304: result: yes
>> > configure:12315: checking for debuginfod_find_metadata in -ldebuginfod
>> > configure:12344: ccache aarch64-webos-linux-gcc  -mcpu=3Dcortex-a72
>> -march=3Darmv8-a+crc -mbranch-protection=3Dstandard -fstack-protector-st=
rong
>> -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity
>> -Werror=3Dreturn-type
>> --sysroot=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-web=
os-linux/systemtap/5.0/recipe-sysroot
>> -o conftest  -O2 -pipe -g -feliminate-unused-debug-types
>> -fcanon-prefix-map
>> -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0
>> -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0
>> -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0
>> -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0
>> -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/recipe-sysroot=3D
>> -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/recipe-sysroot=3D
>> -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/recipe-sysroot-native=3D
>>   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
>> -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0
>> -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0
>> -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0
>> -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0
>> -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/recipe-sysroot=3D
>> -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/recipe-sysroot=3D
>> -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberryp=
i4_64-webos-linux/systemtap/5.0/recipe-sysroot-native=3D
>> -Wl,-z,relro,-z,now  conftest.c -ldebuginfod   >&5
>> >
>> /OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/sys=
temtap/5.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux/../../libexec/=
aarch64-webos-linux/gcc/aarch64-webos-linux/13.2.0/ld:
>> cannot find -ldebuginfod: No such file or directory
>> > collect2: error: ld returned 1 exit status
>> >
>> > With debuginfod in DISTRO_FEATURES (which is included by default) and
>> *debuginfod PACKAGECONFIG enabled in elfutils (also by default based on
>> DISTRO_FEAUTRES) this builds OK.
>> >
>> > Regards,
>> >
>> >
>> > On Tue, Dec 5, 2023 at 7:33=E2=80=AFAM Victor Kamensky <
>> victor.kamensky7@gmail.com> wrote:
>> >>
>> >> Similar to 4.9 release, in 5.0 release release-5.0 tag is off any
>> branch,
>> >> release-5.0a tag e72dc118e563c645d93a1a2d771e8d90e8fec1ae is on the
>> master
>> >> branch. Use this value for SRCREV and add catch up patch,
>> >> 0001-prerelease-datestamp-fixes.patch, to bring source up to
>> release-5.0 tag
>> >> level. Remove 0001-prerelease-datestamp-fixes.patch in next upgrade.
>> >>
>> >> Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
>> >> ---
>> >>  .../0001-prerelease-datestamp-fixes.patch     | 23 ++++++++++++
>> >>  .../systemtap/0001-release-date-fix.patch     | 37 -----------------=
--
>> >>  .../systemtap/systemtap_git.inc               |  6 +--
>> >>  3 files changed, 26 insertions(+), 40 deletions(-)
>> >>  create mode 100644
>> meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixes.=
patch
>> >>  delete mode 100644
>> meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
>> >>
>> >> diff --git
>> a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixe=
s.patch
>> b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixe=
s.patch
>> >> new file mode 100644
>> >> index 0000000000..afdc10a3fe
>> >> --- /dev/null
>> >> +++
>> b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datestamp-fixe=
s.patch
>> >> @@ -0,0 +1,23 @@
>> >> +From cfc2c1d53924face11e3fab78ded61c359778eb9 Mon Sep 17 00:00:00 20=
01
>> >> +From: "Frank Ch. Eigler" <fche@redhat.com>
>> >> +Date: Sat, 4 Nov 2023 12:19:59 -0400
>> >> +Subject: [PATCH] prerelease datestamp fixes
>> >> +
>> >> +Upstream-Status: Backport
>> >> +---
>> >> + NEWS | 2 +-
>> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> >> +
>> >> +diff --git a/NEWS b/NEWS
>> >> +index c7f31e8b7..f0f9056c4 100644
>> >> +--- a/NEWS
>> >> ++++ b/NEWS
>> >> +@@ -1,4 +1,4 @@
>> >> +-* What's new in version 5.0, 2023-11-03
>> >> ++* What's new in version 5.0, 2023-11-04
>> >> +
>> >> + - Performance improvements in uprobe registration and module startu=
p.
>> >> +
>> >> +--
>> >> +2.31.1
>> >> +
>> >> diff --git
>> a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
>> b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
>> >> deleted file mode 100644
>> >> index 3dcb369ec3..0000000000
>> >> ---
>> a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
>> >> +++ /dev/null
>> >> @@ -1,37 +0,0 @@
>> >> -From ebb424eee5599fcc131901c0d82d0bfc0d2f57ab Mon Sep 17 00:00:00 20=
01
>> >> -From: "Frank Ch. Eigler" <fche@redhat.com>
>> >> -Date: Fri, 28 Apr 2023 13:51:27 -0400
>> >> -Subject: [PATCH] release date fix
>> >> -
>> >> -Upstream-Status: Backport
>> >> ----
>> >> - NEWS           | 2 +-
>> >> - systemtap.spec | 2 +-
>> >> - 2 files changed, 2 insertions(+), 2 deletions(-)
>> >> -
>> >> -diff --git a/NEWS b/NEWS
>> >> -index 695bc990c..46859e304 100644
>> >> ---- a/NEWS
>> >> -+++ b/NEWS
>> >> -@@ -1,4 +1,4 @@
>> >> --* What's new in version 4.9, 2023-04-27
>> >> -+* What's new in version 4.9, 2023-04-28
>> >> -
>> >> - - ISystemtap: the new interactive systemtap jupyter kernel. This
>> provides
>> >> -   a simple GUI for writing/running Systemtap scripts in an easy,
>> incremental
>> >> -diff --git a/systemtap.spec b/systemtap.spec
>> >> -index 59814f112..fd8023264 100644
>> >> ---- a/systemtap.spec
>> >> -+++ b/systemtap.spec
>> >> -@@ -1307,7 +1307,7 @@ exit 0
>> >> -
>> >> - # PRERELEASE
>> >> - %changelog
>> >> --* Thu Apr 27 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
>> >> -+* Fri Apr 28 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
>> >> - - Upstream release, see wiki page below for detailed notes.
>> >> -   https://sourceware.org/systemtap/wiki/SystemTapReleases
>> >> -
>> >> ---
>> >> -2.40.1
>> >> -
>> >> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc
>> b/meta/recipes-kernel/systemtap/systemtap_git.inc
>> >> index de3750ff04..bc2a9ff434 100644
>> >> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
>> >> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
>> >> @@ -1,13 +1,13 @@
>> >>  LICENSE =3D "GPL-2.0-only"
>> >>  LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>> >> -SRCREV =3D "418f0a45ca4473491385b5c7eef777607bbdb3b7"
>> >> -PV =3D "4.9"
>> >> +SRCREV =3D "e72dc118e563c645d93a1a2d771e8d90e8fec1ae"
>> >> +PV =3D "5.0"
>> >>
>> >>  SRC_URI =3D "git://
>> sourceware.org/git/systemtap.git;branch=3Dmaster;protocol=3Dhttps \
>> >>
>>  file://0001-Do-not-let-configure-write-a-python-location-into-th.patch =
\
>> >>
>>  file://0001-Install-python-modules-to-correct-library-dir.patch \
>> >>
>>  file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
>> >> -           file://0001-release-date-fix.patch \
>> >> +           file://0001-prerelease-datestamp-fixes.patch \
>> >>             "
>> >>
>> >>  COMPATIBLE_HOST =3D
>> '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips|riscv64).*-linux'
>> >> --
>> >> 2.31.1
>> >>
>> >>
>> >>
>> >>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192332):
> https://lists.openembedded.org/g/openembedded-core/message/192332
> Mute This Topic: https://lists.openembedded.org/mt/102987514/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000054ae8d060c791635
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">PACKAGECONFIG:remove:pn-elfutils =3D &quot;debuginfod&quot=
;<br>PACKAGECONFIG:remove:pn-elfutils =3D &quot;libdebuginfod&quot;<br>PACK=
AGECONFIG:remove:pn-binutils =3D &quot;debuginfod&quot;<br><div><br></div><=
div>in local.conf is the easiest way to reproduce it.</div><div><br></div><=
div>The one for binutils isn&#39;t strictly needed (but target binutils wil=
l fail as well when debuginfod is disabled in elfutils and enabled in binut=
ils).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Dec 13, 2023 at 11:45=E2=80=AFPM Martin Jansa via <a hre=
f=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;martin.j=
ansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr">Hi Victor,<div><br></div><div>no problem, =
at least it forced me to enable debuginfod in our builds as well (where it =
wasn&#39;t intentionally disabled). Just didn&#39;t get enabled when it was=
 added to default DISTRO_FEATUREs as we define our own and it wasn&#39;t us=
ing BACKFILL mechanism to enable it in such setups.</div><div><br></div><di=
v>Removing debuginfod from DISTRO_FEATURES should be enough to reproduce th=
e issue (as it will disable both *debuginfod PACKAGECONFIG options from elf=
utils as well).</div><div><br></div><div>I haven&#39;t tried, but removing =
the PACKAGECONFIG just from elfutils will probably reproduce it as well (wi=
th possibly fewer recipes needing to rebuilt). There are 2 PACKAGECONFIGs f=
or this, not sure which one is needed, but you can just disable both.</div>=
<div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 13, 2023 at 10:27=E2=80=AFPM V=
ictor Kamensky &lt;<a href=3D"mailto:victor.kamensky7@gmail.com" target=3D"=
_blank">victor.kamensky7@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi Martin,<br>
<br>
Sorry about that. I am looking at it now.<br>
<br>
Do I understand it correctly to reproduce the issue: I need to remove<br>
debuginfod (as it is currently on<br>
by default) from DISTO_FEATURES and remove debuginfod from elfutils<br>
PACKAGECONFIG defaults?<br>
<br>
Thanks,<br>
Victor<br>
<br>
On Sun, Dec 10, 2023 at 3:16=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; This seems to be causing:<br>
&gt; ../git/util.cxx:51:10: fatal error: elfutils/debuginfod.h: No such fil=
e or directory<br>
&gt;=C2=A0 =C2=A0 51 | #include &lt;elfutils/debuginfod.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~=
~~~~~~~~~~~~~~~<br>
&gt; compilation terminated.<br>
&gt; make[2]: *** [Makefile:1389: stap-util.o] Error 1<br>
&gt;<br>
&gt; on some systems.<br>
&gt;<br>
&gt; Looks like with <a href=3D"https://sourceware.org/git/?p=3Dsystemtap.g=
it;a=3Dcommit;h=3D2e67b053e3796ee7cf29a39f9698729b52078406" rel=3D"noreferr=
er" target=3D"_blank">https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcom=
mit;h=3D2e67b053e3796ee7cf29a39f9698729b52078406</a> it now enables debugin=
fod (&quot;AC_MSG_RESULT([yes])&quot; _after_ the PKG_CHECK_MODULES now see=
ms wrong).<br>
&gt;<br>
&gt; log.do_configure:<br>
&gt; checking whether to use debuginfod... checking for debuginfod... no<br=
>
&gt; yes<br>
&gt; checking for debuginfod_find_metadata in -ldebuginfod... no<br>
&gt;<br>
&gt; build $ grep DEBUGINFO config.h<br>
&gt; #define HAVE_LIBDEBUGINFOD 1<br>
&gt;<br>
&gt; config.log (see the strange result yes):<br>
&gt; configure:12213: checking whether to use debuginfod<br>
&gt; configure:12228: checking for debuginfod<br>
&gt; configure:12235: $PKG_CONFIG --exists --print-errors &quot;libdebuginf=
od &gt;=3D 0.179&quot;<br>
&gt; Package libdebuginfod was not found in the pkg-config search path.<br>
&gt; Perhaps you should add the directory containing `libdebuginfod.pc&#39;=
<br>
&gt; to the PKG_CONFIG_PATH environment variable<br>
&gt; No package &#39;libdebuginfod&#39; found<br>
&gt; configure:12238: $? =3D 1<br>
&gt; configure:12252: $PKG_CONFIG --exists --print-errors &quot;libdebuginf=
od &gt;=3D 0.179&quot;<br>
&gt; Package libdebuginfod was not found in the pkg-config search path.<br>
&gt; Perhaps you should add the directory containing `libdebuginfod.pc&#39;=
<br>
&gt; to the PKG_CONFIG_PATH environment variable<br>
&gt; No package &#39;libdebuginfod&#39; found<br>
&gt; configure:12255: $? =3D 1<br>
&gt; configure:12269: result: no<br>
&gt; No package &#39;libdebuginfod&#39; found<br>
&gt; configure:12304: result: yes<br>
&gt; configure:12315: checking for debuginfod_find_metadata in -ldebuginfod=
<br>
&gt; configure:12344: ccache aarch64-webos-linux-gcc=C2=A0 -mcpu=3Dcortex-a=
72 -march=3Darmv8-a+crc -mbranch-protection=3Dstandard -fstack-protector-st=
rong=C2=A0 -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security -Werror=3Dreturn-type --sysroot=3D/OE/lge/build/webos/scarth=
gap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot -o =
conftest=C2=A0 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-m=
ap=C2=A0 -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/rasp=
berrypi4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0=C2=
=A0 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberry=
pi4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0=C2=A0 -=
fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_6=
4-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0=C2=A0 -fde=
bug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-w=
ebos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0=C2=A0 -fdebug=
-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webo=
s-linux/systemtap/5.0/recipe-sysroot=3D=C2=A0 -fmacro-prefix-map=3D/OE/lge/=
build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/=
recipe-sysroot=3D=C2=A0 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/=
BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot-native=
=3D=C2=A0 =C2=A0 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-pre=
fix-map=C2=A0 -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work=
/raspberrypi4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5=
.0=C2=A0 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/rasp=
berrypi4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0=C2=
=A0 -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberry=
pi4_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0=C2=A0=
 -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4=
_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0=C2=A0 -f=
debug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64=
-webos-linux/systemtap/5.0/recipe-sysroot=3D=C2=A0 -fmacro-prefix-map=3D/OE=
/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap=
/5.0/recipe-sysroot=3D=C2=A0 -fdebug-prefix-map=3D/OE/lge/build/webos/scart=
hgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot-na=
tive=3D=C2=A0 -Wl,-z,relro,-z,now=C2=A0 conftest.c -ldebuginfod=C2=A0 =C2=
=A0&gt;&amp;5<br>
&gt; /OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/s=
ystemtap/5.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux/../../libexe=
c/aarch64-webos-linux/gcc/aarch64-webos-linux/13.2.0/ld: cannot find -ldebu=
ginfod: No such file or directory<br>
&gt; collect2: error: ld returned 1 exit status<br>
&gt;<br>
&gt; With debuginfod in DISTRO_FEATURES (which is included by default) and =
*debuginfod PACKAGECONFIG enabled in elfutils (also by default based on DIS=
TRO_FEAUTRES) this builds OK.<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Dec 5, 2023 at 7:33=E2=80=AFAM Victor Kamensky &lt;<a href=3D"=
mailto:victor.kamensky7@gmail.com" target=3D"_blank">victor.kamensky7@gmail=
.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Similar to 4.9 release, in 5.0 release release-5.0 tag is off any =
branch,<br>
&gt;&gt; release-5.0a tag e72dc118e563c645d93a1a2d771e8d90e8fec1ae is on th=
e master<br>
&gt;&gt; branch. Use this value for SRCREV and add catch up patch,<br>
&gt;&gt; 0001-prerelease-datestamp-fixes.patch, to bring source up to relea=
se-5.0 tag<br>
&gt;&gt; level. Remove 0001-prerelease-datestamp-fixes.patch in next upgrad=
e.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Victor Kamensky &lt;<a href=3D"mailto:victor.kamens=
ky7@gmail.com" target=3D"_blank">victor.kamensky7@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../0001-prerelease-datestamp-fixes.patch=C2=A0 =C2=A0 =C2=
=A0| 23 ++++++++++++<br>
&gt;&gt;=C2=A0 .../systemtap/0001-release-date-fix.patch=C2=A0 =C2=A0 =C2=
=A0| 37 -------------------<br>
&gt;&gt;=C2=A0 .../systemtap/systemtap_git.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +--<br>
&gt;&gt;=C2=A0 3 files changed, 26 insertions(+), 40 deletions(-)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0=
001-prerelease-datestamp-fixes.patch<br>
&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0=
001-release-date-fix.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-prerelea=
se-datestamp-fixes.patch b/meta/recipes-kernel/systemtap/systemtap/0001-pre=
release-datestamp-fixes.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..afdc10a3fe<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-date=
stamp-fixes.patch<br>
&gt;&gt; @@ -0,0 +1,23 @@<br>
&gt;&gt; +From cfc2c1d53924face11e3fab78ded61c359778eb9 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: &quot;Frank Ch. Eigler&quot; &lt;<a href=3D"mailto:fche@red=
hat.com" target=3D"_blank">fche@redhat.com</a>&gt;<br>
&gt;&gt; +Date: Sat, 4 Nov 2023 12:19:59 -0400<br>
&gt;&gt; +Subject: [PATCH] prerelease datestamp fixes<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport<br>
&gt;&gt; +---<br>
&gt;&gt; + NEWS | 2 +-<br>
&gt;&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/NEWS b/NEWS<br>
&gt;&gt; +index c7f31e8b7..f0f9056c4 100644<br>
&gt;&gt; +--- a/NEWS<br>
&gt;&gt; ++++ b/NEWS<br>
&gt;&gt; +@@ -1,4 +1,4 @@<br>
&gt;&gt; +-* What&#39;s new in version 5.0, 2023-11-03<br>
&gt;&gt; ++* What&#39;s new in version 5.0, 2023-11-04<br>
&gt;&gt; +<br>
&gt;&gt; + - Performance improvements in uprobe registration and module sta=
rtup.<br>
&gt;&gt; +<br>
&gt;&gt; +--<br>
&gt;&gt; +2.31.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-release-=
date-fix.patch b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-=
fix.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 3dcb369ec3..0000000000<br>
&gt;&gt; --- a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fi=
x.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,37 +0,0 @@<br>
&gt;&gt; -From ebb424eee5599fcc131901c0d82d0bfc0d2f57ab Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; -From: &quot;Frank Ch. Eigler&quot; &lt;<a href=3D"mailto:fche@red=
hat.com" target=3D"_blank">fche@redhat.com</a>&gt;<br>
&gt;&gt; -Date: Fri, 28 Apr 2023 13:51:27 -0400<br>
&gt;&gt; -Subject: [PATCH] release date fix<br>
&gt;&gt; -<br>
&gt;&gt; -Upstream-Status: Backport<br>
&gt;&gt; ----<br>
&gt;&gt; - NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt; - systemtap.spec | 2 +-<br>
&gt;&gt; - 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt; -<br>
&gt;&gt; -diff --git a/NEWS b/NEWS<br>
&gt;&gt; -index 695bc990c..46859e304 100644<br>
&gt;&gt; ---- a/NEWS<br>
&gt;&gt; -+++ b/NEWS<br>
&gt;&gt; -@@ -1,4 +1,4 @@<br>
&gt;&gt; --* What&#39;s new in version 4.9, 2023-04-27<br>
&gt;&gt; -+* What&#39;s new in version 4.9, 2023-04-28<br>
&gt;&gt; -<br>
&gt;&gt; - - ISystemtap: the new interactive systemtap jupyter kernel. This=
 provides<br>
&gt;&gt; -=C2=A0 =C2=A0a simple GUI for writing/running Systemtap scripts i=
n an easy, incremental<br>
&gt;&gt; -diff --git a/systemtap.spec b/systemtap.spec<br>
&gt;&gt; -index 59814f112..fd8023264 100644<br>
&gt;&gt; ---- a/systemtap.spec<br>
&gt;&gt; -+++ b/systemtap.spec<br>
&gt;&gt; -@@ -1307,7 +1307,7 @@ exit 0<br>
&gt;&gt; -<br>
&gt;&gt; - # PRERELEASE<br>
&gt;&gt; - %changelog<br>
&gt;&gt; --* Thu Apr 27 2023 Frank Ch. Eigler &lt;<a href=3D"mailto:fche@re=
dhat.com" target=3D"_blank">fche@redhat.com</a>&gt; - 4.9-1<br>
&gt;&gt; -+* Fri Apr 28 2023 Frank Ch. Eigler &lt;<a href=3D"mailto:fche@re=
dhat.com" target=3D"_blank">fche@redhat.com</a>&gt; - 4.9-1<br>
&gt;&gt; - - Upstream release, see wiki page below for detailed notes.<br>
&gt;&gt; -=C2=A0 =C2=A0<a href=3D"https://sourceware.org/systemtap/wiki/Sys=
temTapReleases" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org=
/systemtap/wiki/SystemTapReleases</a><br>
&gt;&gt; -<br>
&gt;&gt; ---<br>
&gt;&gt; -2.40.1<br>
&gt;&gt; -<br>
&gt;&gt; diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/met=
a/recipes-kernel/systemtap/systemtap_git.inc<br>
&gt;&gt; index de3750ff04..bc2a9ff434 100644<br>
&gt;&gt; --- a/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
&gt;&gt; +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc<br>
&gt;&gt; @@ -1,13 +1,13 @@<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263&quot;<br>
&gt;&gt; -SRCREV =3D &quot;418f0a45ca4473491385b5c7eef777607bbdb3b7&quot;<b=
r>
&gt;&gt; -PV =3D &quot;4.9&quot;<br>
&gt;&gt; +SRCREV =3D &quot;e72dc118e563c645d93a1a2d771e8d90e8fec1ae&quot;<b=
r>
&gt;&gt; +PV =3D &quot;5.0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/git=
/systemtap.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">sourceware.org/git/systemtap.git;branch=3Dmaster;protocol=3Dhtt=
ps</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Do-not-=
let-configure-write-a-python-location-into-th.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Install=
-python-modules-to-correct-library-dir.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-staprun=
-stapbpf-don-t-support-installing-a-non-root.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-release-date=
-fix.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-prerelease-d=
atestamp-fixes.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 COMPATIBLE_HOST =3D &#39;(x86_64|i.86|powerpc|arm|aarch64|mi=
croblazeel|mips|riscv64).*-linux&#39;<br>
&gt;&gt; --<br>
&gt;&gt; 2.31.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192332): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192332" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192332</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102987514/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102987514/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000054ae8d060c791635--

