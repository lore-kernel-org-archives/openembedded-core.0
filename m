Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397F6C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 16:27:59 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.16865.1708705671495482473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 08:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2BjeltIk;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6087396e405so4649607b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 08:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708705670; x=1709310470; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUgmuazHbYmP/e1DgzmthoGYLTKG+p2gb+28t4ilBNQ=;
        b=2BjeltIkbkOcysefdewQZVS/2iqqXXdHAqEtaUooC24GmcAKzSyB6Yl3WwyA3SLF3s
         WZcHsHQ4FhAHn89yMVr2dVqJgALt9R6ty0AjTBIVfZ8OvGd6ZHeZkYwLUFVPSxubDpQk
         XPoznTtVRWSqj0b/P0MPmWggbkgwpTkxVk/VX84dXQ6SzXyCse9Adz/zsJT3Fe7KPXlQ
         3CTXL3ZkN18JHcfxZ3SdN6FLeptEwQ2dNHewIvp3+4zDCpMqpV9WzgWFCK0T1lsIjZLQ
         zrGKu64bPCSauZFhh0Q1OGAvgtzr/up106TjjTfUhuC5Hw2wFTBbPxBG3OwS4ERQEAD9
         63jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708705670; x=1709310470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUgmuazHbYmP/e1DgzmthoGYLTKG+p2gb+28t4ilBNQ=;
        b=myxuKpqRxT/oApnLPYsINosYbuCi3uKbdaQ0+5uj0DaPIYU33JL2ywIUrpmrnVptiw
         V5MLllwemMvEBzujY2FiX/giAj4miiKjhaqVass5x87LST6JSpu4CtWgiY1O/KWUmla5
         F58hxvgZ0x7w9hXoDdqJnqglbQUyppkhxqlIM/ARzImmMyBCjVfdzh93P1J9cN7v02g0
         ZrSJ9uDWA8Xxe+bOHRPSNOULhiV4GPYNE6uhgLvEjK/1uset5MjTKfHfa8PIju07IDgX
         65IGF61pV0Lej3mRig4XWs1NAfr+1KYT3fDJZRcXoFi/ZvLf/enIwiEDW8PoXHEYMIO4
         Bj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkDDT7TS02s3EGsSwEWSlmGFZTPJITQJC9mBiTodSjfgs0f6lpd36tccS0GV0sYlSzJnQy5Msp5GdMoy4NEMlaC/SBHVmP7WFxO0U7A5/103I00G8xSqPX
X-Gm-Message-State: AOJu0YzLgAMPJU7Lv2lQibmFskjai2Je218xitgO4NbiwySLE1yhM9sK
	RnuUYKKp3I+sDWaEOoKwRBXSfvnyZsTOr6+XhW78z+Ne5Q1b3BoTNRygmF4bYkk5tUVhQ5ffz7T
	cjcFZKbD/t6KGAQWo9PIgaNHPFWUAgTPeodXNUA==
X-Google-Smtp-Source: AGHT+IEBrioKh8ERPrID/9WTdqFvC/w0genGTe9wG/mvPsiRYzeIFjRo+6gT5rva7FT7nNWUVWWSUJqnKJQuhnARKqs=
X-Received: by 2002:a25:c845:0:b0:dc6:de93:7929 with SMTP id
 y66-20020a25c845000000b00dc6de937929mr236124ybf.26.1708705669852; Fri, 23 Feb
 2024 08:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20240130071405.3675-1-mail2szahir@gmail.com> <CAOSpxdYqD2Tcm5dDheZVTv4E3dVYJ0=pZOe09=F=jLr41ktkww@mail.gmail.com>
 <MA0PR01MB10021441948EA4F3A7D0BB12A8C552@MA0PR01MB10021.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB10021441948EA4F3A7D0BB12A8C552@MA0PR01MB10021.INDPRD01.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 23 Feb 2024 06:27:38 -1000
Message-ID: <CAOSpxdYUqhBCLyvTLxcaNptqxJJUk-dCYrh1Kg=okWO=w6HsGw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH V2] nghttp2: fix CVE-2023-44487
To: Zahir Hussain Sikkendar Basha <Zahir.Basha@kpit.com>
Cc: aszh07 <mail2szahir@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 16:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196102

On Thu, Feb 22, 2024 at 7:41=E2=80=AFPM Zahir Hussain Sikkendar Basha
<Zahir.Basha@kpit.com> wrote:
>
> Hi Steve,
>
> Apologies for the late reply. Can you please recheck the patch again?
> Same patch works in our build without any Hunk failure issue, And also co=
nfirmed that the patch changes are available in the source code of nghttp2 =
V1.47.0.

It still fails for me:

(stable/kirkstone-nut) $ bitbake nghttp2
Loading cache: 100% |



                  | ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
########################################################|
Time: 0:00:07
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1644
targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "2.0.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "x86_64-poky-linux"
MACHINE              =3D "qemux86-64"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "4.0.16"
TUNE_FEATURES        =3D "m64 core2"
TARGET_FPU           =3D ""
meta
meta-poky
meta-yocto-bsp
workspace            =3D
"stable/kirkstone-nut:80bb7659e17fa1404f48c95da3a077563bb6806a"

Initialising tasks: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
#####################################################|
Time: 0:00:00
Sstate summary: Wanted 92 Local 85 Mirrors 0 Missed 7 Current 182 (92%
match, 97% complete)
Removing 6 stale sstate objects for arch core2-64: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
######################|
Time: 0:00:00
Removing 1 stale sstate objects for arch qemux86_64: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
####################|
Time: 0:00:00
NOTE: Executing Tasks
ERROR: nghttp2-1.47.0-r0 do_patch: Applying patch
'CVE-2023-44487.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-lin=
ux/nghttp2/1.47.0-r0/nghttp2-1.47.0'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/nghttp2/1.47.0-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2023-44487.patch
patching file CMakeLists.txt
Hunk #1 succeeded at 301 (offset 39 lines).
Hunk #2 succeeded at 342 (offset 39 lines).
patching file cmakeconfig.h.in
Hunk #1 succeeded at 31 (offset -3 lines).
Hunk #2 succeeded at 76 (offset -3 lines).
patching file configure.ac
Hunk #1 succeeded at 922 (offset 315 lines).
Hunk #2 succeeded at 997 (offset 315 lines).
Hunk #3 succeeded at 1023 (offset 315 lines).
patching file doc/Makefile.am
Hunk #1 FAILED at 69.
1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
patching file lib/CMakeLists.txt
patching file lib/Makefile.am
Hunk #1 FAILED at 49.
Hunk #2 FAILED at 65.
2 out of 2 hunks FAILED -- rejects in file lib/Makefile.am
patching file lib/includes/nghttp2/nghttp2.h
Hunk #1 succeeded at 2800 (offset 37 lines).
patching file lib/nghttp2_option.c
patching file lib/nghttp2_ratelim.c
patching file lib/nghttp2_ratelim.h
patching file lib/nghttp2_session.c
Hunk #4 succeeded at 4164 (offset 9 lines).
Hunk #5 succeeded at 4210 (offset 9 lines).
Hunk #6 succeeded at 6991 (offset -3 lines).
patching file lib/nghttp2_session.h
Hunk #4 succeeded at 234 (offset -3 lines).
patching file lib/nghttp2_time.c
patching file lib/nghttp2_time.h
patching file tests/nghttp2_ratelim_test.c
patching file tests/nghttp2_ratelim_test.h
patching file tests/nghttp2_session_test.c
Hunk #1 succeeded at 11089 (offset 276 lines).
patching file tests/nghttp2_session_test.h
Hunk #1 succeeded at 162 (offset 2 lines).
patching file tests/CMakeLists.txt
patching file tests/Makefile.am
Hunk #1 FAILED at 40.
1 out of 1 hunk FAILED -- rejects in file tests/Makefile.am
patching file lib/nghttp2_option.h
patching file tests/main.c
Hunk #2 succeeded at 330 (offset 6 lines).
Hunk #3 succeeded at 428 (offset 7 lines).
Patch CVE-2023-44487.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/nghttp2/1.47.0-r0/temp/log.do_patch.1234204
ERROR: Task (/home/steve/builds/poky-contrib-kirkstone/meta/recipes-support=
/nghttp2/nghttp2_1.47.0.bb:do_patch)
failed with exit code '1'

Make sure you are using the current kirkstone head, and don't have a
bbappend for nghttp2 in another included layer.

Steve
______________________________
> From: Steve Sakoman <steve@sakoman.com>
> Sent: Tuesday, January 30, 2024 10:39 PM
> To: aszh07 <mail2szahir@gmail.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; Virendra Kumar Thakur <Virendra.Thakur@kpit.com>; Zahir Hus=
sain Sikkendar Basha <Zahir.Basha@kpit.com>
> Subject: Re: [OE-core][kirkstone][PATCH V2] nghttp2: fix CVE-2023-44487
>
> Caution: This email originated from outside of the KPIT. Do not click lin=
ks or open attachments unless you recognize the sender and know the content=
 is safe.
>
> This fails at build time:
>
> ERROR: nghttp2-1.47.0-r0 do_patch: Applying patch
> 'CVE-2023-44487.patch' on target directory
> '/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-l=
inux/nghttp2/1.47.0-r0/nghttp2-1.47.0'
> CmdError('quilt --quiltrc
> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/nghttp2/1.47.0-r0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2023-44487.patch
> patching file CMakeLists.txt
> Hunk #1 succeeded at 301 (offset 39 lines).
> Hunk #2 succeeded at 342 (offset 39 lines).
> patching file cmakeconfig.h.in
> Hunk #1 succeeded at 31 (offset -3 lines).
> Hunk #2 succeeded at 76 (offset -3 lines).
> patching file configure.ac
> Hunk #1 succeeded at 922 (offset 315 lines).
> Hunk #2 succeeded at 997 (offset 315 lines).
> Hunk #3 succeeded at 1023 (offset 315 lines).
> patching file doc/Makefile.am
> Hunk #1 FAILED at 69.
> 1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
> patching file lib/CMakeLists.txt
> patching file lib/Makefile.am
> Hunk #1 FAILED at 49.
> Hunk #2 FAILED at 65.
> 2 out of 2 hunks FAILED -- rejects in file lib/Makefile.am
> patching file lib/includes/nghttp2/nghttp2.h
> Hunk #1 succeeded at 2800 (offset 37 lines).
> patching file lib/nghttp2_option.c
> patching file lib/nghttp2_ratelim.c
> patching file lib/nghttp2_ratelim.h
> patching file lib/nghttp2_session.c
> Hunk #4 succeeded at 4164 (offset 9 lines).
> Hunk #5 succeeded at 4210 (offset 9 lines).
> Hunk #6 succeeded at 6991 (offset -3 lines).
> patching file lib/nghttp2_session.h
> Hunk #4 succeeded at 234 (offset -3 lines).
> patching file lib/nghttp2_time.c
> patching file lib/nghttp2_time.h
> patching file tests/nghttp2_ratelim_test.c
> patching file tests/nghttp2_ratelim_test.h
> patching file tests/nghttp2_session_test.c
> Hunk #1 succeeded at 11089 (offset 276 lines).
> patching file tests/nghttp2_session_test.h
> Hunk #1 succeeded at 162 (offset 2 lines).
> patching file tests/CMakeLists.txt
> patching file tests/Makefile.am
> Hunk #1 FAILED at 40.
> 1 out of 1 hunk FAILED -- rejects in file tests/Makefile.am
> patching file lib/nghttp2_option.h
> patching file tests/main.c
> Hunk #2 succeeded at 330 (offset 6 lines).
> Hunk #3 succeeded at 428 (offset 7 lines).
> Patch CVE-2023-44487.patch does not apply (enforce with -f)
>
> Steve
>
> On Mon, Jan 29, 2024 at 9:17=E2=80=AFPM aszh07 <mail2szahir@gmail.com> wr=
ote:
> >
> > From: Zahir Hussain <zahir.basha@kpit.com>
> >
> > The HTTP/2 protocol allows a denial of service (server resource consump=
tion)
> > because request cancellation can reset many streams quickly, as exploit=
ed in
> > the wild in August through October 2023.
> >
> > References:
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd=
.nist.gov%2Fvuln%2Fdetail%2FCVE-2023-44487&data=3D05%7C02%7Czahir.basha%40k=
pit.com%7Ce5eb9b3c40f742bf7ecf08dc21b65033%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C638422314179045832%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DpCq7em=
MjyZCqLQHlPRpJX%2Fhk7kgUe3YLRN4rQE2FB%2BQ%3D&reserved=3D0
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F72b4af6143681f528f1d237b21a9a7aee173=
8832&data=3D05%7C02%7Czahir.basha%40kpit.com%7Ce5eb9b3c40f742bf7ecf08dc21b6=
5033%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638422314179052912%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C0%7C%7C%7C&sdata=3DGONGty7xd57TIExm%2BoaI2oOQUfCW4h1%2BIMNO4vMB=
%2BDo%3D&reserved=3D0
> >
> > Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> > ---
> >  .../nghttp2/nghttp2/CVE-2023-44487.patch      | 926 ++++++++++++++++++
> >  .../recipes-support/nghttp2/nghttp2_1.47.0.bb |   1 +
> >  2 files changed, 927 insertions(+)
> >  create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487=
.patch
> >
> > diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patch =
b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patch
> > new file mode 100644
> > index 0000000000..48099683e6
> > --- /dev/null
> > +++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patch
> > @@ -0,0 +1,926 @@
> > +From 72b4af6143681f528f1d237b21a9a7aee1738832 Mon Sep 17 00:00:00 2001
> > +From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
> > +Date: Sun, 1 Oct 2023 00:05:01 +0900
> > +Subject: [PATCH] Rework session management
> > +
> > +CVE: CVE-2023-44487
> > +
> > +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F72b4af61=
43681f528f1d237b21a9a7aee1738832&data=3D05%7C02%7Czahir.basha%40kpit.com%7C=
e5eb9b3c40f742bf7ecf08dc21b65033%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0=
%7C638422314179056073%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D5oa7o9xWoMh9xmrq=
w2D%2BfGWfmvQdfj6gLrj2%2BbuSvtQ%3D&reserved=3D0]
> > +
> > +Signed-off-by: Zahir Hussain zahir.basha@kpit.com
> > +---
> > +CMakeLists.txt                 |   4 ++
> > +cmakeconfig.h.in               |   9 +++
> > +configure.ac                   |  21 +++++++
> > +doc/Makefile.am                |   1 +
> > +lib/CMakeLists.txt             |   2 +
> > +lib/Makefile.am                |   4 ++
> > +lib/includes/nghttp2/nghttp2.h |  17 ++++++
> > +lib/nghttp2_option.c           |   7 +++
> > +lib/nghttp2_ratelim.c          |  75 ++++++++++++++++++++++++
> > +lib/nghttp2_ratelim.h          |  57 ++++++++++++++++++
> > +lib/nghttp2_session.c          |  34 ++++++++++-
> > +lib/nghttp2_session.h          |  12 +++-
> > +lib/nghttp2_time.c             |  62 ++++++++++++++++++++
> > +lib/nghttp2_time.h             |  38 ++++++++++++
> > +tests/nghttp2_ratelim_test.c   | 101 ++++++++++++++++++++++++++++++++
> > +tests/nghttp2_ratelim_test.h   |  35 +++++++++++
> > +tests/nghttp2_session_test.c   | 103 +++++++++++++++++++++++++++++++++
> > +tests/nghttp2_session_test.h   |   1 +
> > +tests/CMakeLists.txt           |   1 +
> > +tests/Makefile.am              |   6 +-
> > +lib/nghttp2_option.h           |   6 ++
> > +tests/main.c                   |   7 ++-
> > +22 files changed, 598 insertions(+), 5 deletions(-)
> > +create mode 100644 lib/nghttp2_ratelim.c
> > +create mode 100644 lib/nghttp2_ratelim.h
> > +create mode 100644 lib/nghttp2_time.c
> > +create mode 100644 lib/nghttp2_time.h
> > +create mode 100644 tests/nghttp2_ratelim_test.c
> > +create mode 100644 tests/nghttp2_ratelim_test.h
> > +
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -262,6 +262,7 @@ check_include_file("netinet/in.h"   HAVE
> > + check_include_file("pwd.h"          HAVE_PWD_H)
> > + check_include_file("sys/socket.h"   HAVE_SYS_SOCKET_H)
> > + check_include_file("sys/time.h"     HAVE_SYS_TIME_H)
> > ++check_include_file("sysinfoapi.h"   HAVE_SYSINFOAPI_H)
> > + check_include_file("syslog.h"       HAVE_SYSLOG_H)
> > + check_include_file("time.h"         HAVE_TIME_H)
> > + check_include_file("unistd.h"       HAVE_UNISTD_H)
> > +@@ -302,8 +303,11 @@ check_type_size("time_t"  SIZEOF_TIME_T)
> > + include(CheckFunctionExists)
> > + check_function_exists(_Exit     HAVE__EXIT)
> > + check_function_exists(accept4   HAVE_ACCEPT4)
> > ++check_function_exists(clock_gettime HAVE_CLOCK_GETTIME)
> > + check_function_exists(mkostemp  HAVE_MKOSTEMP)
> > +
> > ++check_symbol_exists(GetTickCount64 sysinfoapi.h HAVE_GETTICKCOUNT64)
> > ++
> > + include(CheckSymbolExists)
> > + # XXX does this correctly detect initgroups (un)availability on cygwi=
n?
> > + check_symbol_exists(initgroups grp.h HAVE_DECL_INITGROUPS)
> > +--- a/cmakeconfig.h.in
> > ++++ b/cmakeconfig.h.in
> > +@@ -34,9 +34,15 @@
> > + /* Define to 1 if you have the `accept4` function. */
> > + #cmakedefine HAVE_ACCEPT4 1
> > +
> > ++/* Define to 1 if you have the `clock_gettime` function. */
> > ++#cmakedefine HAVE_CLOCK_GETTIME 1
> > ++
> > + /* Define to 1 if you have the `mkostemp` function. */
> > + #cmakedefine HAVE_MKOSTEMP 1
> > +
> > ++/* Define to 1 if you have the `GetTickCount64` function. */
> > ++#cmakedefine HAVE_GETTICKCOUNT64 1
> > ++
> > + /* Define to 1 if you have the `initgroups` function. */
> > + #cmakedefine01 HAVE_DECL_INITGROUPS
> > +
> > +@@ -73,6 +79,9 @@
> > + /* Define to 1 if you have the <sys/time.h> header file. */
> > + #cmakedefine HAVE_SYS_TIME_H 1
> > +
> > ++/* Define to 1 if you have the <sysinfoapi.h> header file. */
> > ++#cmakedefine HAVE_SYSINFOAPI_H 1
> > ++
> > + /* Define to 1 if you have the <syslog.h> header file. */
> > + #cmakedefine HAVE_SYSLOG_H 1
> > +
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -607,6 +607,7 @@ AC_CHECK_HEADERS([ \
> > +   string.h \
> > +   sys/socket.h \
> > +   sys/time.h \
> > ++  sysinfoapi.h \
> > +   syslog.h \
> > +   time.h \
> > +   unistd.h \
> > +@@ -681,6 +682,7 @@ AC_FUNC_STRNLEN
> > + AC_CHECK_FUNCS([ \
> > +   _Exit \
> > +   accept4 \
> > ++  clock_gettime \
> > +   dup2 \
> > +   getcwd \
> > +   getpwnam \
> > +@@ -706,6 +708,25 @@ AC_CHECK_FUNCS([ \
> > + AC_CHECK_FUNC([timerfd_create],
> > +               [have_timerfd_create=3Dyes], [have_timerfd_create=3Dno]=
)
> > +
> > ++AC_MSG_CHECKING([checking for GetTickCount64])
> > ++AC_LINK_IFELSE([AC_LANG_PROGRAM(
> > ++[[
> > ++#include <sysinfoapi.h>
> > ++]],
> > ++[[
> > ++GetTickCount64();
> > ++]])],
> > ++[have_gettickcount64=3Dyes],
> > ++[have_gettickcount64=3Dno])
> > ++
> > ++if test "x${have_gettickcount64}" =3D "xyes"; then
> > ++  AC_MSG_RESULT([yes])
> > ++  AC_DEFINE([HAVE_GETTICKCOUNT64], [1],
> > ++            [Define to 1 if you have `GetTickCount64` function.])
> > ++else
> > ++  AC_MSG_RESULT([no])
> > ++fi
> > ++
> > + # For cygwin: we can link initgroups, so AC_CHECK_FUNCS succeeds, but
> > + # cygwin disables initgroups due to feature test macro magic with our
> > + # configuration.  FreeBSD declares initgroups() in unistd.h.
> > +--- a/doc/Makefile.am
> > ++++ b/doc/Makefile.am
> > +@@ -69,6 +69,7 @@ APIDOCS=3D \
> > +        nghttp2_option_set_user_recv_extension_type.rst \
> > +        nghttp2_option_set_max_outbound_ack.rst \
> > +        nghttp2_option_set_max_settings.rst \
> > ++       nghttp2_option_set_stream_reset_rate_limit.rst \
> > +        nghttp2_pack_settings_payload.rst \
> > +        nghttp2_priority_spec_check_default.rst \
> > +        nghttp2_priority_spec_default_init.rst \
> > +--- a/lib/CMakeLists.txt
> > ++++ b/lib/CMakeLists.txt
> > +@@ -23,6 +23,8 @@ set(NGHTTP2_SOURCES
> > +   nghttp2_mem.c
> > +   nghttp2_http.c
> > +   nghttp2_rcbuf.c
> > ++  nghttp2_ratelim.c
> > ++  nghttp2_time.c
> > +   nghttp2_debug.c
> > + )
> > +
> > +--- a/lib/Makefile.am
> > ++++ b/lib/Makefile.am
> > +@@ -49,6 +49,8 @@ OBJECTS =3D nghttp2_pq.c nghttp2_map.c ngh
> > +        nghttp2_mem.c \
> > +        nghttp2_http.c \
> > +        nghttp2_rcbuf.c \
> > ++       nghttp2_ratelim.c \
> > ++       nghttp2_time.c \
> > +        nghttp2_debug.c
> > +
> > + HFILES =3D nghttp2_pq.h nghttp2_int.h nghttp2_map.h nghttp2_queue.h \
> > +@@ -65,6 +67,8 @@ HFILES =3D nghttp2_pq.h nghttp2_int.h nght
> > +        nghttp2_mem.h \
> > +        nghttp2_http.h \
> > +        nghttp2_rcbuf.h \
> > ++       nghttp2_ratelim.h \
> > ++       nghttp2_time.h \
> > +        nghttp2_debug.h
> > +
> > + libnghttp2_la_SOURCES =3D $(HFILES) $(OBJECTS)
> > +--- a/lib/includes/nghttp2/nghttp2.h
> > ++++ b/lib/includes/nghttp2/nghttp2.h
> > +@@ -2763,6 +2763,23 @@ nghttp2_session_client_new2(nghttp2_sess
> > + /**
> > +  * @function
> > +  *
> > ++ * This function sets the rate limit for the incoming stream reset
> > ++ * (RST_STREAM frame).  It is server use only.  It is a token-bucket
> > ++ * based rate limiter.  |burst| specifies the number of tokens that i=
s
> > ++ * initially available.  The maximum number of tokens is capped to
> > ++ * this value.  |rate| specifies the number of tokens that are
> > ++ * regenerated per second.  An incoming RST_STREAM consumes one token=
.
> > ++ * If there is no token available, GOAWAY is sent to tear down the
> > ++ * connection.  |burst| and |rate| default to 1000 and 33
> > ++ * respectively.
> > ++ */
> > ++NGHTTP2_EXTERN void
> > ++nghttp2_option_set_stream_reset_rate_limit(nghttp2_option *option,
> > ++                                           uint64_t burst, uint64_t r=
ate);
> > ++
> > ++/**
> > ++ * @function
> > ++ *
> > +  * Like `nghttp2_session_server_new()`, but with additional options
> > +  * specified in the |option|.
> > +  *
> > +--- a/lib/nghttp2_option.c
> > ++++ b/lib/nghttp2_option.c
> > +@@ -126,3 +126,10 @@ void nghttp2_option_set_max_settings(ngh
> > +   option->opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTINGS;
> > +   option->max_settings =3D val;
> > + }
> > ++
> > ++void nghttp2_option_set_stream_reset_rate_limit(nghttp2_option *optio=
n,
> > ++                                                uint64_t burst, uint6=
4_t rate) {
> > ++  option->opt_set_mask |=3D NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT;
> > ++  option->stream_reset_burst =3D burst;
> > ++  option->stream_reset_rate =3D rate;
> > ++}
> > +--- /dev/null
> > ++++ b/lib/nghttp2_ratelim.c
> > +@@ -0,0 +1,75 @@
> > ++/*
> > ++ * nghttp2 - HTTP/2 C Library
> > ++ *
> > ++ * Copyright (c) 2023 nghttp2 contributors
> > ++ *
> > ++ * Permission is hereby granted, free of charge, to any person obtain=
ing
> > ++ * a copy of this software and associated documentation files (the
> > ++ * "Software"), to deal in the Software without restriction, includin=
g
> > ++ * without limitation the rights to use, copy, modify, merge, publish=
,
> > ++ * distribute, sublicense, and/or sell copies of the Software, and to
> > ++ * permit persons to whom the Software is furnished to do so, subject=
 to
> > ++ * the following conditions:
> > ++ *
> > ++ * The above copyright notice and this permission notice shall be
> > ++ * included in all copies or substantial portions of the Software.
> > ++ *
> > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDER=
S BE
> > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN AC=
TION
> > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECT=
ION
> > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > ++ */
> > ++#include "nghttp2_ratelim.h"
> > ++#include "nghttp2_helper.h"
> > ++
> > ++void nghttp2_ratelim_init(nghttp2_ratelim *rl, uint64_t burst, uint64=
_t rate) {
> > ++  rl->val =3D rl->burst =3D burst;
> > ++  rl->rate =3D rate;
> > ++  rl->tstamp =3D 0;
> > ++}
> > ++
> > ++void nghttp2_ratelim_update(nghttp2_ratelim *rl, uint64_t tstamp) {
> > ++  uint64_t d, gain;
> > ++
> > ++  if (tstamp =3D=3D rl->tstamp) {
> > ++    return;
> > ++  }
> > ++
> > ++  if (tstamp > rl->tstamp) {
> > ++    d =3D tstamp - rl->tstamp;
> > ++  } else {
> > ++    d =3D 1;
> > ++  }
> > ++
> > ++  rl->tstamp =3D tstamp;
> > ++
> > ++  if (UINT64_MAX / d < rl->rate) {
> > ++    rl->val =3D rl->burst;
> > ++
> > ++    return;
> > ++  }
> > ++
> > ++  gain =3D rl->rate * d;
> > ++
> > ++  if (UINT64_MAX - gain < rl->val) {
> > ++    rl->val =3D rl->burst;
> > ++
> > ++    return;
> > ++  }
> > ++
> > ++  rl->val +=3D gain;
> > ++  rl->val =3D nghttp2_min(rl->val, rl->burst);
> > ++}
> > ++
> > ++int nghttp2_ratelim_drain(nghttp2_ratelim *rl, uint64_t n) {
> > ++  if (rl->val < n) {
> > ++    return -1;
> > ++  }
> > ++
> > ++  rl->val -=3D n;
> > ++
> > ++  return 0;
> > ++}
> > +--- /dev/null
> > ++++ b/lib/nghttp2_ratelim.h
> > +@@ -0,0 +1,57 @@
> > ++/*
> > ++ * nghttp2 - HTTP/2 C Library
> > ++ *
> > ++ * Copyright (c) 2023 nghttp2 contributors
> > ++ *
> > ++ * Permission is hereby granted, free of charge, to any person obtain=
ing
> > ++ * a copy of this software and associated documentation files (the
> > ++ * "Software"), to deal in the Software without restriction, includin=
g
> > ++ * without limitation the rights to use, copy, modify, merge, publish=
,
> > ++ * distribute, sublicense, and/or sell copies of the Software, and to
> > ++ * permit persons to whom the Software is furnished to do so, subject=
 to
> > ++ * the following conditions:
> > ++ *
> > ++ * The above copyright notice and this permission notice shall be
> > ++ * included in all copies or substantial portions of the Software.
> > ++ *
> > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDER=
S BE
> > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN AC=
TION
> > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECT=
ION
> > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > ++ */
> > ++#ifndef NGHTTP2_RATELIM_H
> > ++#define NGHTTP2_RATELIM_H
> > ++
> > ++#ifdef HAVE_CONFIG_H
> > ++#  include <config.h>
> > ++#endif /* HAVE_CONFIG_H */
> > ++
> > ++#include <nghttp2/nghttp2.h>
> > ++
> > ++typedef struct nghttp2_ratelim {
> > ++  /* burst is the maximum value of val. */
> > ++  uint64_t burst;
> > ++  /* rate is the amount of value that is regenerated per 1 tstamp. */
> > ++  uint64_t rate;
> > ++  /* val is the amount of value available to drain. */
> > ++  uint64_t val;
> > ++  /* tstamp is the last timestamp in second resolution that is known
> > ++     to this object. */
> > ++  uint64_t tstamp;
> > ++} nghttp2_ratelim;
> > ++
> > ++/* nghttp2_ratelim_init initializes |rl| with the given parameters. *=
/
> > ++void nghttp2_ratelim_init(nghttp2_ratelim *rl, uint64_t burst, uint64=
_t rate);
> > ++
> > ++/* nghttp2_ratelim_update updates rl->val with the current |tstamp|
> > ++   given in second resolution. */
> > ++void nghttp2_ratelim_update(nghttp2_ratelim *rl, uint64_t tstamp);
> > ++
> > ++/* nghttp2_ratelim_drain drains |n| from rl->val.  It returns 0 if it
> > ++   succeeds, or -1. */
> > ++int nghttp2_ratelim_drain(nghttp2_ratelim *rl, uint64_t n);
> > ++
> > ++#endif /* NGHTTP2_RATELIM_H */
> > +--- a/lib/nghttp2_session.c
> > ++++ b/lib/nghttp2_session.c
> > +@@ -36,6 +36,7 @@
> > + #include "nghttp2_option.h"
> > + #include "nghttp2_http.h"
> > + #include "nghttp2_pq.h"
> > ++#include "nghttp2_time.h"
> > + #include "nghttp2_debug.h"
> > +
> > + /*
> > +@@ -443,6 +444,10 @@ static int session_new(nghttp2_session *
> > +       NGHTTP2_DEFAULT_MAX_CONCURRENT_STREAMS;
> > +   (*session_ptr)->pending_enable_push =3D 1;
> > +
> > ++  nghttp2_ratelim_init(&(*session_ptr)->stream_reset_ratelim,
> > ++                       NGHTTP2_DEFAULT_STREAM_RESET_BURST,
> > ++                       NGHTTP2_DEFAULT_STREAM_RESET_RATE);
> > ++
> > +   if (server) {
> > +     (*session_ptr)->server =3D 1;
> > +   }
> > +@@ -527,6 +532,12 @@ static int session_new(nghttp2_session *
> > +         option->max_settings) {
> > +       (*session_ptr)->max_settings =3D option->max_settings;
> > +     }
> > ++
> > ++    if (option->opt_set_mask & NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT) {
> > ++      nghttp2_ratelim_init(&(*session_ptr)->stream_reset_ratelim,
> > ++                           option->stream_reset_burst,
> > ++                           option->stream_reset_rate);
> > ++    }
> > +   }
> > +
> > +   rv =3D nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
> > +@@ -4144,6 +4155,23 @@ static int session_process_priority_fram
> > +   return nghttp2_session_on_priority_received(session, frame);
> > + }
> > +
> > ++static int session_update_stream_reset_ratelim(nghttp2_session *sessi=
on) {
> > ++  if (!session->server || (session->goaway_flags & NGHTTP2_GOAWAY_SUB=
MITTED)) {
> > ++    return 0;
> > ++  }
> > ++
> > ++  nghttp2_ratelim_update(&session->stream_reset_ratelim,
> > ++                         nghttp2_time_now_sec());
> > ++
> > ++  if (nghttp2_ratelim_drain(&session->stream_reset_ratelim, 1) =3D=3D=
 0) {
> > ++    return 0;
> > ++  }
> > ++
> > ++  return nghttp2_session_add_goaway(session, session->last_recv_strea=
m_id,
> > ++                                    NGHTTP2_INTERNAL_ERROR, NULL, 0,
> > ++                                    NGHTTP2_GOAWAY_AUX_NONE);
> > ++}
> > ++
> > + int nghttp2_session_on_rst_stream_received(nghttp2_session *session,
> > +                                            nghttp2_frame *frame) {
> > +   int rv;
> > +@@ -4173,7 +4201,8 @@ int nghttp2_session_on_rst_stream_receiv
> > +   if (nghttp2_is_fatal(rv)) {
> > +     return rv;
> > +   }
> > +-  return 0;
> > ++
> > ++  return session_update_stream_reset_ratelim(session);
> > + }
> > +
> > + static int session_process_rst_stream_frame(nghttp2_session *session)=
 {
> > +@@ -6965,6 +6994,9 @@ int nghttp2_session_add_goaway(nghttp2_s
> > +     nghttp2_mem_free(mem, item);
> > +     return rv;
> > +   }
> > ++
> > ++  session->goaway_flags |=3D NGHTTP2_GOAWAY_SUBMITTED;
> > ++
> > +   return 0;
> > + }
> > +
> > +--- a/lib/nghttp2_session.h
> > ++++ b/lib/nghttp2_session.h
> > +@@ -39,6 +39,7 @@
> > + #include "nghttp2_buf.h"
> > + #include "nghttp2_callbacks.h"
> > + #include "nghttp2_mem.h"
> > ++#include "nghttp2_ratelim.h"
> > +
> > + /* The global variable for tests where we want to disable strict
> > +    preface handling. */
> > +@@ -102,6 +103,10 @@ typedef struct {
> > + /* The default value of maximum number of concurrent streams. */
> > + #define NGHTTP2_DEFAULT_MAX_CONCURRENT_STREAMS 0xffffffffu
> > +
> > ++/* The default values for stream reset rate limiter. */
> > ++#define NGHTTP2_DEFAULT_STREAM_RESET_BURST 1000
> > ++#define NGHTTP2_DEFAULT_STREAM_RESET_RATE 33
> > ++
> > + /* Internal state when receiving incoming frame */
> > + typedef enum {
> > +   /* Receiving frame header */
> > +@@ -176,7 +181,9 @@ typedef enum {
> > +   /* Flag means GOAWAY was sent */
> > +   NGHTTP2_GOAWAY_SENT =3D 0x4,
> > +   /* Flag means GOAWAY was received */
> > +-  NGHTTP2_GOAWAY_RECV =3D 0x8
> > ++  NGHTTP2_GOAWAY_RECV =3D 0x8,
> > ++  /* Flag means GOAWAY has been submitted at least once */
> > ++  NGHTTP2_GOAWAY_SUBMITTED =3D 0x10
> > + } nghttp2_goaway_flag;
> > +
> > + /* nghttp2_inflight_settings stores the SETTINGS entries which local
> > +@@ -230,6 +237,9 @@ struct nghttp2_session {
> > +   /* Queue of In-flight SETTINGS values.  SETTINGS bearing ACK is not
> > +      considered as in-flight. */
> > +   nghttp2_inflight_settings *inflight_settings_head;
> > ++  /* Stream reset rate limiter.  If receiving excessive amount of
> > ++     stream resets, GOAWAY will be sent. */
> > ++  nghttp2_ratelim stream_reset_ratelim;
> > +   /* The number of outgoing streams. This will be capped by
> > +      remote_settings.max_concurrent_streams. */
> > +   size_t num_outgoing_streams;
> > +--- /dev/null
> > ++++ b/lib/nghttp2_time.c
> > +@@ -0,0 +1,62 @@
> > ++/*
> > ++ * nghttp2 - HTTP/2 C Library
> > ++ *
> > ++ * Copyright (c) 2023 nghttp2 contributors
> > ++ *
> > ++ * Permission is hereby granted, free of charge, to any person obtain=
ing
> > ++ * a copy of this software and associated documentation files (the
> > ++ * "Software"), to deal in the Software without restriction, includin=
g
> > ++ * without limitation the rights to use, copy, modify, merge, publish=
,
> > ++ * distribute, sublicense, and/or sell copies of the Software, and to
> > ++ * permit persons to whom the Software is furnished to do so, subject=
 to
> > ++ * the following conditions:
> > ++ *
> > ++ * The above copyright notice and this permission notice shall be
> > ++ * included in all copies or substantial portions of the Software.
> > ++ *
> > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDER=
S BE
> > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN AC=
TION
> > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECT=
ION
> > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > ++ */
> > ++#include "nghttp2_time.h"
> > ++
> > ++#ifdef HAVE_TIME_H
> > ++#  include <time.h>
> > ++#endif /* HAVE_TIME_H */
> > ++
> > ++#ifdef HAVE_SYSINFOAPI_H
> > ++#  include <sysinfoapi.h>
> > ++#endif /* HAVE_SYSINFOAPI_H */
> > ++
> > ++#ifndef HAVE_GETTICKCOUNT64
> > ++static uint64_t time_now_sec(void) {
> > ++  time_t t =3D time(NULL);
> > ++
> > ++  if (t =3D=3D -1) {
> > ++    return 0;
> > ++  }
> > ++
> > ++  return (uint64_t)t;
> > ++}
> > ++#endif /* HAVE_GETTICKCOUNT64 */
> > ++
> > ++#ifdef HAVE_CLOCK_GETTIME
> > ++uint64_t nghttp2_time_now_sec(void) {
> > ++  struct timespec tp;
> > ++  int rv =3D clock_gettime(CLOCK_MONOTONIC, &tp);
> > ++
> > ++  if (rv =3D=3D -1) {
> > ++    return time_now_sec();
> > ++  }
> > ++
> > ++  return (uint64_t)tp.tv_sec;
> > ++}
> > ++#elif defined(HAVE_GETTICKCOUNT64)
> > ++uint64_t nghttp2_time_now_sec(void) { return GetTickCount64() / 1000;=
 }
> > ++#else  /* !HAVE_CLOCK_GETTIME && !HAVE_GETTICKCOUNT64 */
> > ++uint64_t nghttp2_time_now_sec(void) { return time_now_sec(); }
> > ++#endif /* !HAVE_CLOCK_GETTIME && !HAVE_GETTICKCOUNT64 */
> > +--- /dev/null
> > ++++ b/lib/nghttp2_time.h
> > +@@ -0,0 +1,38 @@
> > ++/*
> > ++ * nghttp2 - HTTP/2 C Library
> > ++ *
> > ++ * Copyright (c) 2023 nghttp2 contributors
> > ++ *
> > ++ * Permission is hereby granted, free of charge, to any person obtain=
ing
> > ++ * a copy of this software and associated documentation files (the
> > ++ * "Software"), to deal in the Software without restriction, includin=
g
> > ++ * without limitation the rights to use, copy, modify, merge, publish=
,
> > ++ * distribute, sublicense, and/or sell copies of the Software, and to
> > ++ * permit persons to whom the Software is furnished to do so, subject=
 to
> > ++ * the following conditions:
> > ++ *
> > ++ * The above copyright notice and this permission notice shall be
> > ++ * included in all copies or substantial portions of the Software.
> > ++ *
> > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDER=
S BE
> > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN AC=
TION
> > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECT=
ION
> > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > ++ */
> > ++#ifndef NGHTTP2_TIME_H
> > ++#define NGHTTP2_TIME_H
> > ++
> > ++#ifdef HAVE_CONFIG_H
> > ++#  include <config.h>
> > ++#endif /* HAVE_CONFIG_H */
> > ++
> > ++#include <nghttp2/nghttp2.h>
> > ++
> > ++/* nghttp2_time_now_sec returns seconds from implementation-specific
> > ++   timepoint.  If it is unable to get seconds, it returns 0. */
> > ++uint64_t nghttp2_time_now_sec(void);
> > ++
> > ++#endif /* NGHTTP2_TIME_H */
> > +--- /dev/null
> > ++++ b/tests/nghttp2_ratelim_test.c
> > +@@ -0,0 +1,101 @@
> > ++/*
> > ++ * nghttp2 - HTTP/2 C Library
> > ++ *
> > ++ * Copyright (c) 2023 nghttp2 contributors
> > ++ *
> > ++ * Permission is hereby granted, free of charge, to any person obtain=
ing
> > ++ * a copy of this software and associated documentation files (the
> > ++ * "Software"), to deal in the Software without restriction, includin=
g
> > ++ * without limitation the rights to use, copy, modify, merge, publish=
,
> > ++ * distribute, sublicense, and/or sell copies of the Software, and to
> > ++ * permit persons to whom the Software is furnished to do so, subject=
 to
> > ++ * the following conditions:
> > ++ *
> > ++ * The above copyright notice and this permission notice shall be
> > ++ * included in all copies or substantial portions of the Software.
> > ++ *
> > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDER=
S BE
> > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN AC=
TION
> > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECT=
ION
> > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > ++ */
> > ++#include "nghttp2_ratelim_test.h"
> > ++
> > ++#include <stdio.h>
> > ++
> > ++#include <CUnit/CUnit.h>
> > ++
> > ++#include "nghttp2_ratelim.h"
> > ++
> > ++void test_nghttp2_ratelim_update(void) {
> > ++  nghttp2_ratelim rl;
> > ++
> > ++  nghttp2_ratelim_init(&rl, 1000, 21);
> > ++
> > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > ++  CU_ASSERT(1000 =3D=3D rl.burst);
> > ++  CU_ASSERT(21 =3D=3D rl.rate);
> > ++  CU_ASSERT(0 =3D=3D rl.tstamp);
> > ++
> > ++  nghttp2_ratelim_update(&rl, 999);
> > ++
> > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > ++  CU_ASSERT(999 =3D=3D rl.tstamp);
> > ++
> > ++  nghttp2_ratelim_drain(&rl, 100);
> > ++
> > ++  CU_ASSERT(900 =3D=3D rl.val);
> > ++
> > ++  nghttp2_ratelim_update(&rl, 1000);
> > ++
> > ++  CU_ASSERT(921 =3D=3D rl.val);
> > ++
> > ++  nghttp2_ratelim_update(&rl, 1002);
> > ++
> > ++  CU_ASSERT(963 =3D=3D rl.val);
> > ++
> > ++  nghttp2_ratelim_update(&rl, 1004);
> > ++
> > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > ++  CU_ASSERT(1004 =3D=3D rl.tstamp);
> > ++
> > ++  /* timer skew */
> > ++  nghttp2_ratelim_init(&rl, 1000, 21);
> > ++  nghttp2_ratelim_update(&rl, 1);
> > ++
> > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > ++
> > ++  nghttp2_ratelim_update(&rl, 0);
> > ++
> > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > ++
> > ++  /* rate * duration overflow */
> > ++  nghttp2_ratelim_init(&rl, 1000, 100);
> > ++  nghttp2_ratelim_drain(&rl, 999);
> > ++
> > ++  CU_ASSERT(1 =3D=3D rl.val);
> > ++
> > ++  nghttp2_ratelim_update(&rl, UINT64_MAX);
> > ++
> > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > ++
> > ++  /* val + rate * duration overflow */
> > ++  nghttp2_ratelim_init(&rl, UINT64_MAX - 1, 2);
> > ++  nghttp2_ratelim_update(&rl, 1);
> > ++
> > ++  CU_ASSERT(UINT64_MAX - 1 =3D=3D rl.val);
> > ++}
> > ++
> > ++void test_nghttp2_ratelim_drain(void) {
> > ++  nghttp2_ratelim rl;
> > ++
> > ++  nghttp2_ratelim_init(&rl, 100, 7);
> > ++
> > ++  CU_ASSERT(-1 =3D=3D nghttp2_ratelim_drain(&rl, 101));
> > ++  CU_ASSERT(0 =3D=3D nghttp2_ratelim_drain(&rl, 51));
> > ++  CU_ASSERT(0 =3D=3D nghttp2_ratelim_drain(&rl, 49));
> > ++  CU_ASSERT(-1 =3D=3D nghttp2_ratelim_drain(&rl, 1));
> > ++}
> > +--- /dev/null
> > ++++ b/tests/nghttp2_ratelim_test.h
> > +@@ -0,0 +1,35 @@
> > ++/*
> > ++ * nghttp2 - HTTP/2 C Library
> > ++ *
> > ++ * Copyright (c) 2023 nghttp2 contributors
> > ++ *
> > ++ * Permission is hereby granted, free of charge, to any person obtain=
ing
> > ++ * a copy of this software and associated documentation files (the
> > ++ * "Software"), to deal in the Software without restriction, includin=
g
> > ++ * without limitation the rights to use, copy, modify, merge, publish=
,
> > ++ * distribute, sublicense, and/or sell copies of the Software, and to
> > ++ * permit persons to whom the Software is furnished to do so, subject=
 to
> > ++ * the following conditions:
> > ++ *
> > ++ * The above copyright notice and this permission notice shall be
> > ++ * included in all copies or substantial portions of the Software.
> > ++ *
> > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDER=
S BE
> > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN AC=
TION
> > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECT=
ION
> > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > ++ */
> > ++#ifndef NGHTTP2_RATELIM_TEST_H
> > ++#define NGHTTP2_RATELIM_TEST_H
> > ++
> > ++#ifdef HAVE_CONFIG_H
> > ++#  include <config.h>
> > ++#endif /* HAVE_CONFIG_H */
> > ++
> > ++void test_nghttp2_ratelim_update(void);
> > ++void test_nghttp2_ratelim_drain(void);
> > ++
> > ++#endif /* NGHTTP2_RATELIM_TEST_H */
> > +--- a/tests/nghttp2_session_test.c
> > ++++ b/tests/nghttp2_session_test.c
> > +@@ -10813,6 +10813,109 @@ void test_nghttp2_session_set_stream_use
> > +   nghttp2_session_del(session);
> > + }
> > +
> > ++void test_nghttp2_session_stream_reset_ratelim(void) {
> > ++  nghttp2_session *session;
> > ++  nghttp2_session_callbacks callbacks;
> > ++  nghttp2_frame frame;
> > ++  ssize_t rv;
> > ++  nghttp2_bufs bufs;
> > ++  nghttp2_buf *buf;
> > ++  nghttp2_mem *mem;
> > ++  size_t i;
> > ++  nghttp2_hd_deflater deflater;
> > ++  size_t nvlen;
> > ++  nghttp2_nv *nva;
> > ++  int32_t stream_id;
> > ++  nghttp2_outbound_item *item;
> > ++  nghttp2_option *option;
> > ++
> > ++  mem =3D nghttp2_mem_default();
> > ++  frame_pack_bufs_init(&bufs);
> > ++
> > ++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
> > ++  callbacks.send_callback =3D null_send_callback;
> > ++
> > ++  nghttp2_option_new(&option);
> > ++  nghttp2_option_set_stream_reset_rate_limit(
> > ++      option, NGHTTP2_DEFAULT_STREAM_RESET_BURST, 0);
> > ++
> > ++  nghttp2_session_server_new2(&session, &callbacks, NULL, option);
> > ++
> > ++  nghttp2_frame_settings_init(&frame.settings, NGHTTP2_FLAG_NONE, NUL=
L, 0);
> > ++  rv =3D nghttp2_frame_pack_settings(&bufs, &frame.settings);
> > ++
> > ++  CU_ASSERT(0 =3D=3D rv);
> > ++
> > ++  nghttp2_frame_settings_free(&frame.settings, mem);
> > ++
> > ++  buf =3D &bufs.head->buf;
> > ++  rv =3D nghttp2_session_mem_recv(session, buf->pos, nghttp2_buf_len(=
buf));
> > ++
> > ++  CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
> > ++
> > ++  /* Send SETTINGS ACK */
> > ++  rv =3D nghttp2_session_send(session);
> > ++
> > ++  CU_ASSERT(0 =3D=3D rv);
> > ++
> > ++  nghttp2_hd_deflate_init(&deflater, mem);
> > ++
> > ++  for (i =3D 0; i < NGHTTP2_DEFAULT_STREAM_RESET_BURST + 2; ++i) {
> > ++    stream_id =3D (int32_t)(i * 2 + 1);
> > ++
> > ++    nghttp2_bufs_reset(&bufs);
> > ++
> > ++    /* HEADERS */
> > ++    nvlen =3D ARRLEN(reqnv);
> > ++    nghttp2_nv_array_copy(&nva, reqnv, nvlen, mem);
> > ++    nghttp2_frame_headers_init(&frame.headers, NGHTTP2_FLAG_END_HEADE=
RS,
> > ++                               stream_id, NGHTTP2_HCAT_HEADERS, NULL,=
 nva,
> > ++                               nvlen);
> > ++    rv =3D nghttp2_frame_pack_headers(&bufs, &frame.headers, &deflate=
r);
> > ++
> > ++    CU_ASSERT(0 =3D=3D rv);
> > ++
> > ++    nghttp2_frame_headers_free(&frame.headers, mem);
> > ++
> > ++    buf =3D &bufs.head->buf;
> > ++    rv =3D nghttp2_session_mem_recv(session, buf->pos, nghttp2_buf_le=
n(buf));
> > ++
> > ++    CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
> > ++
> > ++    nghttp2_bufs_reset(&bufs);
> > ++
> > ++    /* RST_STREAM */
> > ++    nghttp2_frame_rst_stream_init(&frame.rst_stream, stream_id,
> > ++                                  NGHTTP2_NO_ERROR);
> > ++    nghttp2_frame_pack_rst_stream(&bufs, &frame.rst_stream);
> > ++    nghttp2_frame_rst_stream_free(&frame.rst_stream);
> > ++
> > ++    buf =3D &bufs.head->buf;
> > ++    rv =3D nghttp2_session_mem_recv(session, buf->pos, nghttp2_buf_le=
n(buf));
> > ++
> > ++    CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
> > ++
> > ++    if (i < NGHTTP2_DEFAULT_STREAM_RESET_BURST) {
> > ++      CU_ASSERT(0 =3D=3D nghttp2_outbound_queue_size(&session->ob_reg=
));
> > ++
> > ++      continue;
> > ++    }
> > ++
> > ++    CU_ASSERT(1 =3D=3D nghttp2_outbound_queue_size(&session->ob_reg))=
;
> > ++
> > ++    item =3D nghttp2_session_get_next_ob_item(session);
> > ++
> > ++    CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item->frame.hd.type);
> > ++    CU_ASSERT(NGHTTP2_DEFAULT_STREAM_RESET_BURST * 2 + 1 =3D=3D
> > ++              item->frame.goaway.last_stream_id);
> > ++  }
> > ++
> > ++  nghttp2_hd_deflate_free(&deflater);
> > ++  nghttp2_session_del(session);
> > ++  nghttp2_bufs_free(&bufs);
> > ++  nghttp2_option_del(option);
> > ++}
> > ++
> > + static void check_nghttp2_http_recv_headers_fail(
> > +     nghttp2_session *session, nghttp2_hd_deflater *deflater, int32_t =
stream_id,
> > +     int stream_state, const nghttp2_nv *nva, size_t nvlen) {
> > +--- a/tests/nghttp2_session_test.h
> > ++++ b/tests/nghttp2_session_test.h
> > +@@ -160,6 +160,7 @@ void test_nghttp2_session_removed_closed
> > + void test_nghttp2_session_pause_data(void);
> > + void test_nghttp2_session_no_closed_streams(void);
> > + void test_nghttp2_session_set_stream_user_data(void);
> > ++void test_nghttp2_session_stream_reset_ratelim(void);
> > + void test_nghttp2_http_mandatory_headers(void);
> > + void test_nghttp2_http_content_length(void);
> > + void test_nghttp2_http_content_length_mismatch(void);
> > +--- a/tests/CMakeLists.txt
> > ++++ b/tests/CMakeLists.txt
> > +@@ -21,6 +21,7 @@ if(HAVE_CUNIT)
> > +     nghttp2_npn_test.c
> > +     nghttp2_helper_test.c
> > +     nghttp2_buf_test.c
> > ++    nghttp2_ratelim_test.c
> > +   )
> > +
> > +   add_executable(main EXCLUDE_FROM_ALL
> > +--- a/tests/Makefile.am
> > ++++ b/tests/Makefile.am
> > +@@ -40,14 +40,16 @@ OBJECTS =3D main.c nghttp2_pq_test.c nghtt
> > +        nghttp2_hd_test.c \
> > +        nghttp2_npn_test.c \
> > +        nghttp2_helper_test.c \
> > +-       nghttp2_buf_test.c
> > ++       nghttp2_buf_test.c \
> > ++       nghttp2_ratelim_test.c
> > +
> > + HFILES =3D nghttp2_pq_test.h nghttp2_map_test.h nghttp2_queue_test.h =
\
> > +        nghttp2_session_test.h \
> > +        nghttp2_frame_test.h nghttp2_stream_test.h nghttp2_hd_test.h \
> > +        nghttp2_npn_test.h nghttp2_helper_test.h \
> > +        nghttp2_test_helper.h \
> > +-       nghttp2_buf_test.h
> > ++       nghttp2_buf_test.h \
> > ++       nghttp2_ratelim_test.h
> > +
> > + main_SOURCES =3D $(HFILES) $(OBJECTS)
> > +
> > +--- a/lib/nghttp2_option.h
> > ++++ b/lib/nghttp2_option.h
> > +@@ -68,6 +68,7 @@ typedef enum {
> > +   NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 << 10,
> > +   NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 << 11,
> > +   NGHTTP2_OPT_MAX_SETTINGS =3D 1 << 12,
> > ++  NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT =3D 1 << 15,
> > + } nghttp2_option_flag;
> > +
> > + /**
> > +@@ -75,6 +76,11 @@ typedef enum {
> > +  */
> > + struct nghttp2_option {
> > +   /**
> > ++   * NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT
> > ++   */
> > ++  uint64_t stream_reset_burst;
> > ++  uint64_t stream_reset_rate;
> > ++  /**
> > +    * NGHTTP2_OPT_MAX_SEND_HEADER_BLOCK_LENGTH
> > +    */
> > +   size_t max_send_header_block_length;
> > +--- a/tests/main.c
> > ++++ b/tests/main.c
> > +@@ -40,6 +40,7 @@
> > + #include "nghttp2_npn_test.h"
> > + #include "nghttp2_helper_test.h"
> > + #include "nghttp2_buf_test.h"
> > ++#include "nghttp2_ratelim_test.h"
> > +
> > + extern int nghttp2_enable_strict_preface;
> > +
> > +@@ -323,6 +324,8 @@ int main() {
> > +                    test_nghttp2_session_no_closed_streams) ||
> > +       !CU_add_test(pSuite, "session_set_stream_user_data",
> > +                    test_nghttp2_session_set_stream_user_data) ||
> > ++      !CU_add_test(pSuite, "session_stream_reset_ratelim",
> > ++                  test_nghttp2_session_stream_reset_ratelim) ||
> > +       !CU_add_test(pSuite, "http_mandatory_headers",
> > +                    test_nghttp2_http_mandatory_headers) ||
> > +       !CU_add_test(pSuite, "http_content_length",
> > +@@ -418,7 +421,9 @@ int main() {
> > +       !CU_add_test(pSuite, "bufs_advance", test_nghttp2_bufs_advance)=
 ||
> > +       !CU_add_test(pSuite, "bufs_next_present",
> > +                    test_nghttp2_bufs_next_present) ||
> > +-      !CU_add_test(pSuite, "bufs_realloc", test_nghttp2_bufs_realloc)=
) {
> > ++      !CU_add_test(pSuite, "bufs_realloc", test_nghttp2_bufs_realloc)=
 ||
> > ++      !CU_add_test(pSuite, "ratelim_update", test_nghttp2_ratelim_upd=
ate) ||
> > ++      !CU_add_test(pSuite, "ratelim_drain", test_nghttp2_ratelim_drai=
n)) {
> > +     CU_cleanup_registry();
> > +     return (int)CU_get_error();
> > +   }
> > diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/reci=
pes-support/nghttp2/nghttp2_1.47.0.bb
> > index 0b9091f7e8..b67313b5c2 100644
> > --- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> > +++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> > @@ -10,6 +10,7 @@ SRC_URI =3D "\
> >      https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgithub.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&data=3D05%7C0=
2%7Czahir.basha%40kpit.com%7Ce5eb9b3c40f742bf7ecf08dc21b65033%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C638422314179059417%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7=
C%7C&sdata=3Dwvk8DDbOQgdLtEQv5UYLzdGDkJro9ekK375jfH6hTZU%3D&reserved=3D0{PV=
}/nghttp2-${PV}.tar.xz \
> >      file://0001-fetch-ocsp-response-use-python3.patch \
> >      file://CVE-2023-35945.patch \
> > +    file://CVE-2023-44487.patch \
> >  "
> >  SRC_URI[sha256sum] =3D "68271951324554c34501b85190f22f2221056db69f493a=
fc3bbac8e7be21e7cc"
> >
> > --
> > 2.17.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194488): https://apc01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2F=
message%2F194488&data=3D05%7C02%7Czahir.basha%40kpit.com%7Ce5eb9b3c40f742bf=
7ecf08dc21b65033%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6384223141790=
62749%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DNhuEFM5Z0CQPJqQP1RrHHM0py7lckpH4=
QMkr2dHclPU%3D&reserved=3D0
> > Mute This Topic: https://apc01.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.openembedded.org%2Fmt%2F104049487%2F3620601&data=3D05%7=
C02%7Czahir.basha%40kpit.com%7Ce5eb9b3c40f742bf7ecf08dc21b65033%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C638422314179066603%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C=
%7C%7C&sdata=3DTJhJTQ20%2FstH83CBQIY5Tf0kEWKP1GctY2t6mCyCwl4%3D&reserved=3D=
0
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%=
7C02%7Czahir.basha%40kpit.com%7Ce5eb9b3c40f742bf7ecf08dc21b65033%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C638422314179069611%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7=
C%7C%7C&sdata=3DzYq2DNTBPZCW1Me3oDpHUwUanWQ95FDOXzQ97n0hgIs%3D&reserved=3D0=
 [steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

