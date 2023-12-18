Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E1AC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 06:16:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.37654.1702880178637345889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 22:16:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OqztQhSN;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-28ba18740d6so12083a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 22:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702880178; x=1703484978; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWYyNPsjR3KDOi1c+SeDXzxqO+7PF0Vrz/rCT9vlJHE=;
        b=OqztQhSNO/TWMPMOaUEoVbIRfZiKWQc/eMGcwjV7K+hWUrBkH7wkJQgNtPcavn+DWs
         6eIz5QYzSfygj8AgrVnbON0EoEjzs95PQd+u6Gomy09ECd2GzRsLMqs/e2TLXsMH104M
         oJmiRuX1azpLO8spkM5OaywdjuZOmGi94a4ZGGi/9NSKDk3cmfO8xHe7E2QHBu7bXQY5
         vLocQedsCL8nDJFOlhKUSP+b7zOpKOptsrNaJoaUuo+Wwlg0198XFWXkBxFsDwojrwbT
         z61qGWUHWO+u80WHY/MeUb76kCflBMo9fhutxjHJ3/5+weK8v4+3HyItsRsqE888Wh2K
         zA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702880178; x=1703484978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWYyNPsjR3KDOi1c+SeDXzxqO+7PF0Vrz/rCT9vlJHE=;
        b=Uok6y9pAV6Gh0xK3eeDCpNxXl6oKSdiMS5OoLIjzrvnfFb/zo27PM1Cbf0dSv818iP
         2VCuCeuYc3CTk0+loQG8zpBYGXljaxYhB+QLeO6m1Y09q4qXpMncrRl54XiM10UTug0O
         9vJ8/25zw/VlRGdRDv5XSZhYtFe4UDNA8SBYbNfSJsigPodQiy4UuOk6vzd/VrXaDRu1
         dkmLHgtzvlPmtV0bgtZpoOdHWdcTuWffNd01uh2zExWm0ofx+xeM5qreFqHUodFav5VU
         mX0/aV0cuwNymjOLDQ1GCJfZAwM+VTUA1b5fdttDf/8j6zWticvwy1dIB7IAyHfv4T4X
         3kkw==
X-Gm-Message-State: AOJu0Yyg2+QgpvO8LbTbTFw5m6MiudmlrSnLHiPi3XKMaHywhucfdt8f
	saHHaWU4o9NaTDox5ET3SnSO6Xa8s+1/77wi22w=
X-Google-Smtp-Source: AGHT+IG/hfHzv4DQ4+OPhJQnQKouyYY60XhfTz8pcceSLAKVWH99JEEVx06XOtDL1KsMVM517u4XO7lh/+f0BUBCJXM=
X-Received: by 2002:a17:90a:98c:b0:28b:7c9e:27d0 with SMTP id
 12-20020a17090a098c00b0028b7c9e27d0mr486546pjo.89.1702880177834; Sun, 17 Dec
 2023 22:16:17 -0800 (PST)
MIME-Version: 1.0
References: <20231205063249.3433-1-victor.kamensky7@gmail.com>
 <CA+chaQeUbSV49rXVnbfbQ3f_5z8b2iizZxh1_YVogWWpwL255g@mail.gmail.com>
 <CAHSqoWuSCbwhKKpBCnMxp4TxH4Yi0gyujPYXZpW6FFB-UtDywg@mail.gmail.com>
 <17A0859025DAC108.11381@lists.openembedded.org> <CA+chaQez7yu1qJKjLRKAqT+JRZhfyYr+TnW6Xr7FVj6Rhk06ZA@mail.gmail.com>
In-Reply-To: <CA+chaQez7yu1qJKjLRKAqT+JRZhfyYr+TnW6Xr7FVj6Rhk06ZA@mail.gmail.com>
From: Victor Kamensky <victor.kamensky7@gmail.com>
Date: Sun, 17 Dec 2023 22:16:06 -0800
Message-ID: <CAHSqoWufTcSYG1wGDDU-NPPGN+sgOA43fxc6UM94tRRjLtExgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] systemtap: upgrade 4.9 -> 5.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192603

On Thu, Dec 14, 2023 at 6:27=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> PACKAGECONFIG:remove:pn-elfutils =3D "debuginfod"
> PACKAGECONFIG:remove:pn-elfutils =3D "libdebuginfod"
> PACKAGECONFIG:remove:pn-binutils =3D "debuginfod"
>
> in local.conf is the easiest way to reproduce it.
>
> The one for binutils isn't strictly needed (but target binutils will fail=
 as well when debuginfod is disabled in elfutils and enabled in binutils).

Thanks, Martin. I was able to reproduce it with removing debuginfod
from DISTRO_FEATURES_DEFAULT

Submitted patches to systemtap mailing list:
https://sourceware.org/pipermail/systemtap/2023q4/027914.html
https://sourceware.org/pipermail/systemtap/2023q4/027915.html

And to oe-core:
https://lists.openembedded.org/g/openembedded-core/message/192600?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2CVictor+Kamensky%2C20%2C2%2C0%2C103238=
308
https://lists.openembedded.org/g/openembedded-core/message/192601?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2CVictor+Kamensky%2C20%2C2%2C0%2C103238=
309

Appreciate reporting the issue!

Thanks,
Victor

> On Wed, Dec 13, 2023 at 11:45=E2=80=AFPM Martin Jansa via lists.openembed=
ded.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Hi Victor,
>>
>> no problem, at least it forced me to enable debuginfod in our builds as =
well (where it wasn't intentionally disabled). Just didn't get enabled when=
 it was added to default DISTRO_FEATUREs as we define our own and it wasn't=
 using BACKFILL mechanism to enable it in such setups.
>>
>> Removing debuginfod from DISTRO_FEATURES should be enough to reproduce t=
he issue (as it will disable both *debuginfod PACKAGECONFIG options from el=
futils as well).
>>
>> I haven't tried, but removing the PACKAGECONFIG just from elfutils will =
probably reproduce it as well (with possibly fewer recipes needing to rebui=
lt). There are 2 PACKAGECONFIGs for this, not sure which one is needed, but=
 you can just disable both.
>>
>> Cheers,
>>
>> On Wed, Dec 13, 2023 at 10:27=E2=80=AFPM Victor Kamensky <victor.kamensk=
y7@gmail.com> wrote:
>>>
>>> Hi Martin,
>>>
>>> Sorry about that. I am looking at it now.
>>>
>>> Do I understand it correctly to reproduce the issue: I need to remove
>>> debuginfod (as it is currently on
>>> by default) from DISTO_FEATURES and remove debuginfod from elfutils
>>> PACKAGECONFIG defaults?
>>>
>>> Thanks,
>>> Victor
>>>
>>> On Sun, Dec 10, 2023 at 3:16=E2=80=AFAM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
>>> >
>>> > This seems to be causing:
>>> > ../git/util.cxx:51:10: fatal error: elfutils/debuginfod.h: No such fi=
le or directory
>>> >    51 | #include <elfutils/debuginfod.h>
>>> >       |          ^~~~~~~~~~~~~~~~~~~~~~~
>>> > compilation terminated.
>>> > make[2]: *** [Makefile:1389: stap-util.o] Error 1
>>> >
>>> > on some systems.
>>> >
>>> > Looks like with https://sourceware.org/git/?p=3Dsystemtap.git;a=3Dcom=
mit;h=3D2e67b053e3796ee7cf29a39f9698729b52078406 it now enables debuginfod =
("AC_MSG_RESULT([yes])" _after_ the PKG_CHECK_MODULES now seems wrong).
>>> >
>>> > log.do_configure:
>>> > checking whether to use debuginfod... checking for debuginfod... no
>>> > yes
>>> > checking for debuginfod_find_metadata in -ldebuginfod... no
>>> >
>>> > build $ grep DEBUGINFO config.h
>>> > #define HAVE_LIBDEBUGINFOD 1
>>> >
>>> > config.log (see the strange result yes):
>>> > configure:12213: checking whether to use debuginfod
>>> > configure:12228: checking for debuginfod
>>> > configure:12235: $PKG_CONFIG --exists --print-errors "libdebuginfod >=
=3D 0.179"
>>> > Package libdebuginfod was not found in the pkg-config search path.
>>> > Perhaps you should add the directory containing `libdebuginfod.pc'
>>> > to the PKG_CONFIG_PATH environment variable
>>> > No package 'libdebuginfod' found
>>> > configure:12238: $? =3D 1
>>> > configure:12252: $PKG_CONFIG --exists --print-errors "libdebuginfod >=
=3D 0.179"
>>> > Package libdebuginfod was not found in the pkg-config search path.
>>> > Perhaps you should add the directory containing `libdebuginfod.pc'
>>> > to the PKG_CONFIG_PATH environment variable
>>> > No package 'libdebuginfod' found
>>> > configure:12255: $? =3D 1
>>> > configure:12269: result: no
>>> > No package 'libdebuginfod' found
>>> > configure:12304: result: yes
>>> > configure:12315: checking for debuginfod_find_metadata in -ldebuginfo=
d
>>> > configure:12344: ccache aarch64-webos-linux-gcc  -mcpu=3Dcortex-a72 -=
march=3Darmv8-a+crc -mbranch-protection=3Dstandard -fstack-protector-strong=
  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity -Werror=3Dreturn-type --sysroot=3D/OE/lge/build/webos/scarthgap/BUILD=
/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot -o conftest =
 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-pr=
efix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-l=
inux/systemtap/5.0/git=3D/usr/src/debug/systemtap/5.0  -fdebug-prefix-map=
=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/sys=
temtap/5.0/git=3D/usr/src/debug/systemtap/5.0  -fmacro-prefix-map=3D/OE/lge=
/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0=
/build=3D/usr/src/debug/systemtap/5.0  -fdebug-prefix-map=3D/OE/lge/build/w=
ebos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/build=
=3D/usr/src/debug/systemtap/5.0  -fdebug-prefix-map=3D/OE/lge/build/webos/s=
carthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroo=
t=3D  -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspber=
rypi4_64-webos-linux/systemtap/5.0/recipe-sysroot=3D  -fdebug-prefix-map=3D=
/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/system=
tap/5.0/recipe-sysroot-native=3D    -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as=
-needed -fcanon-prefix-map  -fmacro-prefix-map=3D/OE/lge/build/webos/scarth=
gap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/git=3D/usr/src/deb=
ug/systemtap/5.0  -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/=
work/raspberrypi4_64-webos-linux/systemtap/5.0/git=3D/usr/src/debug/systemt=
ap/5.0  -fmacro-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspb=
errypi4_64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0  =
-fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_=
64-webos-linux/systemtap/5.0/build=3D/usr/src/debug/systemtap/5.0  -fdebug-=
prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos=
-linux/systemtap/5.0/recipe-sysroot=3D  -fmacro-prefix-map=3D/OE/lge/build/=
webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/systemtap/5.0/recipe=
-sysroot=3D  -fdebug-prefix-map=3D/OE/lge/build/webos/scarthgap/BUILD/work/=
raspberrypi4_64-webos-linux/systemtap/5.0/recipe-sysroot-native=3D  -Wl,-z,=
relro,-z,now  conftest.c -ldebuginfod   >&5
>>> > /OE/lge/build/webos/scarthgap/BUILD/work/raspberrypi4_64-webos-linux/=
systemtap/5.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux/../../libex=
ec/aarch64-webos-linux/gcc/aarch64-webos-linux/13.2.0/ld: cannot find -ldeb=
uginfod: No such file or directory
>>> > collect2: error: ld returned 1 exit status
>>> >
>>> > With debuginfod in DISTRO_FEATURES (which is included by default) and=
 *debuginfod PACKAGECONFIG enabled in elfutils (also by default based on DI=
STRO_FEAUTRES) this builds OK.
>>> >
>>> > Regards,
>>> >
>>> >
>>> > On Tue, Dec 5, 2023 at 7:33=E2=80=AFAM Victor Kamensky <victor.kamens=
ky7@gmail.com> wrote:
>>> >>
>>> >> Similar to 4.9 release, in 5.0 release release-5.0 tag is off any br=
anch,
>>> >> release-5.0a tag e72dc118e563c645d93a1a2d771e8d90e8fec1ae is on the =
master
>>> >> branch. Use this value for SRCREV and add catch up patch,
>>> >> 0001-prerelease-datestamp-fixes.patch, to bring source up to release=
-5.0 tag
>>> >> level. Remove 0001-prerelease-datestamp-fixes.patch in next upgrade.
>>> >>
>>> >> Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
>>> >> ---
>>> >>  .../0001-prerelease-datestamp-fixes.patch     | 23 ++++++++++++
>>> >>  .../systemtap/0001-release-date-fix.patch     | 37 ----------------=
---
>>> >>  .../systemtap/systemtap_git.inc               |  6 +--
>>> >>  3 files changed, 26 insertions(+), 40 deletions(-)
>>> >>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-pre=
release-datestamp-fixes.patch
>>> >>  delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-rel=
ease-date-fix.patch
>>> >>
>>> >> diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-prerelease=
-datestamp-fixes.patch b/meta/recipes-kernel/systemtap/systemtap/0001-prere=
lease-datestamp-fixes.patch
>>> >> new file mode 100644
>>> >> index 0000000000..afdc10a3fe
>>> >> --- /dev/null
>>> >> +++ b/meta/recipes-kernel/systemtap/systemtap/0001-prerelease-datest=
amp-fixes.patch
>>> >> @@ -0,0 +1,23 @@
>>> >> +From cfc2c1d53924face11e3fab78ded61c359778eb9 Mon Sep 17 00:00:00 2=
001
>>> >> +From: "Frank Ch. Eigler" <fche@redhat.com>
>>> >> +Date: Sat, 4 Nov 2023 12:19:59 -0400
>>> >> +Subject: [PATCH] prerelease datestamp fixes
>>> >> +
>>> >> +Upstream-Status: Backport
>>> >> +---
>>> >> + NEWS | 2 +-
>>> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> >> +
>>> >> +diff --git a/NEWS b/NEWS
>>> >> +index c7f31e8b7..f0f9056c4 100644
>>> >> +--- a/NEWS
>>> >> ++++ b/NEWS
>>> >> +@@ -1,4 +1,4 @@
>>> >> +-* What's new in version 5.0, 2023-11-03
>>> >> ++* What's new in version 5.0, 2023-11-04
>>> >> +
>>> >> + - Performance improvements in uprobe registration and module start=
up.
>>> >> +
>>> >> +--
>>> >> +2.31.1
>>> >> +
>>> >> diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-release-da=
te-fix.patch b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fi=
x.patch
>>> >> deleted file mode 100644
>>> >> index 3dcb369ec3..0000000000
>>> >> --- a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.=
patch
>>> >> +++ /dev/null
>>> >> @@ -1,37 +0,0 @@
>>> >> -From ebb424eee5599fcc131901c0d82d0bfc0d2f57ab Mon Sep 17 00:00:00 2=
001
>>> >> -From: "Frank Ch. Eigler" <fche@redhat.com>
>>> >> -Date: Fri, 28 Apr 2023 13:51:27 -0400
>>> >> -Subject: [PATCH] release date fix
>>> >> -
>>> >> -Upstream-Status: Backport
>>> >> ----
>>> >> - NEWS           | 2 +-
>>> >> - systemtap.spec | 2 +-
>>> >> - 2 files changed, 2 insertions(+), 2 deletions(-)
>>> >> -
>>> >> -diff --git a/NEWS b/NEWS
>>> >> -index 695bc990c..46859e304 100644
>>> >> ---- a/NEWS
>>> >> -+++ b/NEWS
>>> >> -@@ -1,4 +1,4 @@
>>> >> --* What's new in version 4.9, 2023-04-27
>>> >> -+* What's new in version 4.9, 2023-04-28
>>> >> -
>>> >> - - ISystemtap: the new interactive systemtap jupyter kernel. This p=
rovides
>>> >> -   a simple GUI for writing/running Systemtap scripts in an easy, i=
ncremental
>>> >> -diff --git a/systemtap.spec b/systemtap.spec
>>> >> -index 59814f112..fd8023264 100644
>>> >> ---- a/systemtap.spec
>>> >> -+++ b/systemtap.spec
>>> >> -@@ -1307,7 +1307,7 @@ exit 0
>>> >> -
>>> >> - # PRERELEASE
>>> >> - %changelog
>>> >> --* Thu Apr 27 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
>>> >> -+* Fri Apr 28 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
>>> >> - - Upstream release, see wiki page below for detailed notes.
>>> >> -   https://sourceware.org/systemtap/wiki/SystemTapReleases
>>> >> -
>>> >> ---
>>> >> -2.40.1
>>> >> -
>>> >> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/=
recipes-kernel/systemtap/systemtap_git.inc
>>> >> index de3750ff04..bc2a9ff434 100644
>>> >> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
>>> >> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
>>> >> @@ -1,13 +1,13 @@
>>> >>  LICENSE =3D "GPL-2.0-only"
>>> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fd=
af4a4263"
>>> >> -SRCREV =3D "418f0a45ca4473491385b5c7eef777607bbdb3b7"
>>> >> -PV =3D "4.9"
>>> >> +SRCREV =3D "e72dc118e563c645d93a1a2d771e8d90e8fec1ae"
>>> >> +PV =3D "5.0"
>>> >>
>>> >>  SRC_URI =3D "git://sourceware.org/git/systemtap.git;branch=3Dmaster=
;protocol=3Dhttps \
>>> >>             file://0001-Do-not-let-configure-write-a-python-location=
-into-th.patch \
>>> >>             file://0001-Install-python-modules-to-correct-library-di=
r.patch \
>>> >>             file://0001-staprun-stapbpf-don-t-support-installing-a-n=
on-root.patch \
>>> >> -           file://0001-release-date-fix.patch \
>>> >> +           file://0001-prerelease-datestamp-fixes.patch \
>>> >>             "
>>> >>
>>> >>  COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|=
mips|riscv64).*-linux'
>>> >> --
>>> >> 2.31.1
>>> >>
>>> >>
>>> >>
>>> >>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#192332): https://lists.openembedded.org/g/openembedd=
ed-core/message/192332
>> Mute This Topic: https://lists.openembedded.org/mt/102987514/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [m=
artin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

