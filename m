Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F7ED29FB1
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:56:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51635.1764874601254553087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=DtJEEBBr;
 spf=pass (domain: snapchat.com, ip: 209.85.218.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7277324054so193674266b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1764874600; x=1765479400; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GVbbgXi2vN4EFVvrYYsu5cMFnQwWWtpj10cbvz+t09Y=;
        b=DtJEEBBrt1jSeQmsz1DRCESHrYqDm9UgOmSz0jx9SDu664M+Fb/qylUuahnN+7jTY4
         WXQzMxgVbIPZcdYnFQPpx6zg43yIHbx6haqZO0lZlj00+xTp7AZPIu7nmo8tOGSBXfsk
         Omo7HhbxuTN7uSzi4/wVo2I2rvWID+pLhUud0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764874600; x=1765479400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVbbgXi2vN4EFVvrYYsu5cMFnQwWWtpj10cbvz+t09Y=;
        b=CgaYuVbNtRfo044i+VrjZcVz/f/2cARcBPFQGI9ROr8VYFm4kkeYa5PTltQy4TNN7X
         GO3GHYVVc1WncOfyvndAMF8qEmxZwCyhUzzMYruazMRHSVCIPOYTZKvRUvQQ53uTiDqY
         KeZMXO5bkvM5FQxhu4y6hzQfJFUIzcjwJLIC3H0mOjZq2AQVi3/776dZ0Etf4V7oWj3c
         ED/H3E3aAHa0abkHiVMYTmQ/r69Vxu1BFfEXPzRUwEoPDQVqw0jMRqMSkyxxkkrF2XA7
         2/vNHu/zfNUJZqhqx9ZFBV1d4Tuu/qRCxNKSeQTUoAduyCOt9Eb81jygR+S4O4QRr+JT
         Nj6g==
X-Forwarded-Encrypted: i=1; AJvYcCUks8VfJNRoL1CRQ9pCW9IWwLCcu/9ft6CxbHaOhGAcScB5UbRfntCiFIvu5yRUUWwHpC61XIeU6fGbRjE45HgcgA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwxzQQNJ1u9dIMnnOjc9UFbCUY/xzY+iAkP0dl2AkYmeOxQuN4y
	I8lcvT5BMHQN7qO+rLFch4EYwLOGaZ4MXTQ8YiG08tbq7stUdZdyjXqjKWf8AMcD2N9B+uQtTYj
	eqhD/slfzWNY4GVQY6Jz28Of0PPiEpATzJdVpNRNE8w==
X-Gm-Gg: ASbGncvWzsttpKE3nMLEWHmW47E2XIjLJBRtsSaI1uRXXZSMWxy6hHqgM82Nuqp4FG8
	Tmxp7X63DvdJ8itEmcCYT5IAQjupRX+VP4i/Lhu+8I8TUeyi8RGW5LoeOSfD2ErPGmd1GWdaIhG
	qvm2MWyc7CFAcZeQO9z0cC671e6KStE/tbSm3y6vYLbGMGzk8xw4jrO1PzffwOCCoVj5miYFylT
	JTDFVI6DPTP4FxRim/AUmYhjunyAR1dV5xMzXZ8k6jKGmKH/nuQNF8qh/N1CGCK5o5ln3br7mJ/
	N4zSLxW9sV+cxTIdydTN3acFEX+K
X-Google-Smtp-Source: AGHT+IGYrTfVOT8p0bwtpIr/lDH785L3VyIKEmuTxwXCkRpQIOtrofWeZSK3NDaqA7Dcc8I6fcq+Ji9dRlko24I+J80=
X-Received: by 2002:a17:906:7312:b0:b73:8b79:a322 with SMTP id
 a640c23a62f3a-b79dbe5a6dbmr647556166b.11.1764874599394; Thu, 04 Dec 2025
 10:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20251023134656.2059483-1-ecordonnier@snap.com>
 <20251023134656.2059483-2-ecordonnier@snap.com> <2da2af64-1607-49f3-a438-43525b4b8b02@gmail.com>
 <CAHUKmYbfri0mDeJJ6FH1YVtNe9R_YTdC8iFQxOx7zLRqizvhKA@mail.gmail.com>
 <CAMKF1sqn_G1QjZB0SJhvWXKS8e5amjs5e2swZUZNsakivNs+Eg@mail.gmail.com> <CAMKF1so01+JEg5PD7A0e1dg9NQfz=DOC-JbKw22usNZNUgO02g@mail.gmail.com>
In-Reply-To: <CAMKF1so01+JEg5PD7A0e1dg9NQfz=DOC-JbKw22usNZNUgO02g@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 4 Dec 2025 19:56:27 +0100
X-Gm-Features: AWmQ_bl6EzFzg6iLm3pFDag6YnmbHxR7VNiHXHN5FvpkQReISa8kmY8t6lbWsHc
Message-ID: <CAHUKmYYLi9TOibJGYvHN66ZGwoCaDTmrKGBAVZ4atrG13XyD_w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 2/2] opkg: upgrade 0.8.0 -> 0.9.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000092078e064524e35e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227324

--00000000000092078e064524e35e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,
I haven't had the time to debug yet, but I've seen your message.

=C3=89tienne

On Wed, Dec 3, 2025 at 10:35=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> It can be reproduced with direct invocation
>
> kraj@apollo
> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-imag=
e/1.0
> =E2=9D=AF recipe-sysroot-native/usr/bin/opkg \
>   --volatile-cache \
>   -f opkg.conf \
>   -t temp/ipktemp/ \
>   -o rootfs \
>   --force-postinstall \
>   --prefer-arch-to-version \
>   --force-depends \
>   remove glibc-binary-localedata-en-gb glibc-binary-localedata-c
> glibc-binary-localedata-en-us
>
> [1]    346156 segmentation fault (core dumped)
>  recipe-sysroot-native/usr/bin/opkg --volatile-cache -f opkg.conf -t  -o
> roots
>
> I have a workaround by setting
>
> IMAGE_LINGUAS =3D "en-us"
>
> in local.conf which avoids the need for opkg remove operation which is
> crashing.
>
> On Wed, Dec 3, 2025 at 1:04=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>> I am starting to see the following crash in opkg when building image.
>> Anyone seeing something like this?
>>
>> (No debugging symbols found in
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/recipe-sysroot-native/usr/bin/opkg)
>> [New LWP 34493]
>> [Thread debugging using libthread_db enabled]
>> Using host libthread_db library "/usr/lib/libthread_db.so.1".
>> Core was generated by
>> `/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-im=
age/1.0/recipe-sysroot-native/usr/bin/opkg
>> --volatile-cache -f
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/opkg.conf
>> -t
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/temp/ipktemp/
>> -o
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/rootfs
>> --force-postinstall --prefer-arch-to-version --force-depends remove
>> glibc-binary-localedata-en-gb glibc-binary-localedata-c
>> glibc-binary-localedata-en-us'.
>> Program terminated with signal SIGSEGV, Segmentation fault.
>> #0  0x00007f50a8190d20 in stringpool_strn2id () from
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1
>> (gdb) bt
>> #0  0x00007f50a8190d20 in stringpool_strn2id () from
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1
>> #1  0x00007f50a818a3dc in pool_str2id () from
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1
>> #2  0x00007f50a84fe4ad in ?? () from
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
>> #3  0x00007f50a84ff4df in opkg_solver_remove () from
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
>> #4  0x00007f50a84e9bfb in ?? () from
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
>> #5  0x00007f50a84eadb2 in opkg_cmd_exec () from
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-ima=
ge/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
>> #6  0x00005557220b6a9d in ?? ()
>> #7  0x00007f50a8311f68 in __libc_start_call_main () from
>> /mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.=
6
>> #8  0x00007f50a831201b in __libc_start_main () from
>> /mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.=
6
>> #9  0x00005557220b6bf1 in ?? ()
>>
>> On Thu, Nov 27, 2025 at 10:11=E2=80=AFAM Etienne Cordonnier via
>> lists.openembedded.org
>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedde=
d.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUf=
u0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3D7Hhr9df0PBRkpiFWBooOX6tv5kZhGeHxO5S6vVa=
Niw8&e=3D>
>> <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
>>
>>> Hi Gyorgy,
>>> I have sent a patch to opkg upstream which disables the ACL option by
>>> default again (it is https://lists.yoctoproject.org/g/opkg/message/175
>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproj=
ect.org_g_opkg_message_175&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkIC=
C2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigb=
zfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3D4U1D3q2TfA7jjhTo68=
DgNSOLopG_6Nlj6Ta9OG8TN_g&e=3D>
>>> , however the web-view doesn't seem to work at the moment. I only see
>>> "Forbidden").
>>>
>>> =C3=89tienne
>>>
>>>
>>>
>>> On Thu, Nov 27, 2025 at 6:08=E2=80=AFPM Gyorgy Sarvari <skandigraun@gma=
il.com>
>>> wrote:
>>>
>>>> I just tried this, but it seems that the ACL switch was toggled during
>>>> the CMake transition. With Autotools ACL was disabled by default, but
>>>> with CMake it seems to be enabled - and it complains that it can't fin=
d
>>>> libacl on my machine.
>>>>
>>>> On 10/23/25 15:46, Etienne Cordonnier via lists.openembedded.org
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembed=
ded.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkb=
NonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2D=
Ufu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3D7Hhr9df0PBRkpiFWBooOX6tv5kZhGeHxO5S6v=
VaNiw8&e=3D>
>>>> wrote:
>>>> > From: Etienne Cordonnier <ecordonnier@snap.com>
>>>> >
>>>> > See release notes at
>>>> > -
>>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctop=
roject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&d=3DDwICaQ&c=3DncDTmp=
hkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKU=
kSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf=
9Kx5&s=3Dqvmy1QT46Bl7mVt_XDbuHiic2IjU6z7Zku_Gid-CVYc&e=3D
>>>> >
>>>> > [0.9.0] - 2025-06-27
>>>> >
>>>> > Semiannual opkg release.
>>>> > Bumping the minor version as a result of the project build tooling
>>>> changing from autotools to cmake.
>>>> >
>>>> > - Added a Dockerfile container definition (`:docker/`) for a valid
>>>> developer build environment for opkg.
>>>> >   - It's recommended that project contributors use this container to
>>>> build and test their changes.
>>>> > - The AutoTools-based build framework has [been replaced](
>>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoprojec=
t.org_opkg_commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&d=3DDwIC=
aQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y=
_QGHVaD7rHvEf9Kx5&s=3DGgRxioBjt-ii5JWUrYQ0I-FmXvKxVxKNH3Nj22i_jiM&e=3D
>>>> ) with a more modern, CMake framework.
>>>> >   - Refer to the `docs/CONTRIBUTING.md` documentation for updated
>>>> build instructions.
>>>> >
>>>> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>>>> > ---
>>>> >  .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27
>>>> +++++++++++++++++++
>>>> >  meta/recipes-devtools/opkg/opkg/run-ptest     |  2 +-
>>>> >  .../opkg/{opkg_0.8.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&=
e=3D>
>>>> =3D> opkg_0.9.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&=
e=3D>}
>>>>    | 22 ++++++++-------
>>>> >  3 files changed, 41 insertions(+), 10 deletions(-)
>>>> >  create mode 100644
>>>> meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>>>> >  rename meta/recipes-devtools/opkg/{opkg_0.8.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&=
e=3D>
>>>> =3D> opkg_0.9.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&=
e=3D>}
>>>> (76%)
>>>> >
>>>> > diff --git
>>>> a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>>>> b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>>>> > new file mode 100644
>>>> > index 00000000000..626bbd01b68
>>>> > --- /dev/null
>>>> > +++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patc=
h
>>>> > @@ -0,0 +1,27 @@
>>>> > +From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00
>>>> 2001
>>>> > +From: Etienne Cordonnier <ecordonnier@snap.com>
>>>> > +Date: Mon, 20 Oct 2025 18:57:56 +0200
>>>> > +Subject: [PATCH] config.h.in
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>:
>>>> fix typo
>>>> > +
>>>> > +Upstream-Status: Backport [
>>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoprojec=
t.org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&d=3DDwIC=
aQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y=
_QGHVaD7rHvEf9Kx5&s=3D5scf6nlpBtSePSuPjyopoX7FmlAyiSwI03Ry11w4tl8&e=3D
>>>> ]
>>>> > +Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>>>> > +---
>>>> > + config.h.in
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>> | 2 +-
>>>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>> > +
>>>> > +diff --git a/config.h.in
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>> b/config.h.in
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>> > +index 4fa9842..877b8c7 100644
>>>> > +--- a/config.h.in
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>> > ++++ b/config.h.in
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>> > +@@ -2,7 +2,7 @@
>>>> > + #cmakedefine01 WITH_XZ
>>>> > + #cmakedefine01 WITH_BZIP2
>>>> > + #cmakedefine01 WITH_LZ4
>>>> > +-#cmakedefine01 WITH_LZSTD
>>>> > ++#cmakedefine01 WITH_ZSTD
>>>> > + #cmakedefine01 WITH_CURL
>>>> > + #cmakedefine01 WITH_SSLCURL
>>>> > + #cmakedefine01 WITH_ACL
>>>> > +--
>>>> > +2.43.0
>>>> > +
>>>> > diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest
>>>> b/meta/recipes-devtools/opkg/opkg/run-ptest
>>>> > index 5fb7077eec9..d485a4aace5 100644
>>>> > --- a/meta/recipes-devtools/opkg/opkg/run-ptest
>>>> > +++ b/meta/recipes-devtools/opkg/opkg/run-ptest
>>>> > @@ -2,4 +2,4 @@
>>>> >
>>>> >  OPKG_PATH=3D$(which opkg)
>>>> >
>>>> > -make OPKG_PATH=3D$OPKG_PATH run-tests
>>>> > +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var
>>>> OPKG_PATH=3D$OPKG_PATH
>>>> > diff --git a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&=
e=3D>
>>>> b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&=
e=3D>
>>>> > similarity index 76%
>>>> > rename from meta/recipes-devtools/opkg/opkg_0.8.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&=
e=3D>
>>>> > rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&=
e=3D>
>>>> > index 12e2edf7e3f..ed2f36d636b 100644
>>>> > --- a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&=
e=3D>
>>>> > +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb=
&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMI=
GRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0=
bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&=
e=3D>
>>>> > @@ -15,34 +15,35 @@ PE =3D "1"
>>>> >  SRC_URI =3D "
>>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctop=
roject.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2D-24-257BPV-257D.tar=
.gz&d=3DDwICaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj=
24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&s=3DmKc8LzZ_Q2orQLqa_38Jr7E7tfyD4-rcsgI-wPkx_=
Zg&e=3D
>>>> \
>>>> >             file://opkg.conf \
>>>> >
>>>>  file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patc=
h \
>>>> > +           file://0002-config.h.in-fix-typo.patch \
>>>> >             file://run-ptest \
>>>> >             "
>>>> >
>>>> > -SRC_URI[sha256sum] =3D
>>>> "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
>>>> > +SRC_URI[sha256sum] =3D
>>>> "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
>>>> >
>>>> >  # This needs to be before ptest inherit, otherwise all ptest files
>>>> end packaged
>>>> >  # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
>>>> >  # PTEST_PATH ?=3D "${libdir}/${BPN}/ptest"
>>>> >  PACKAGES =3D+ "libopkg"
>>>> >
>>>> > -inherit autotools pkgconfig ptest
>>>> > +inherit cmake pkgconfig ptest
>>>> >
>>>> >  target_localstatedir :=3D "${localstatedir}"
>>>> >  OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>>>> >
>>>> >  PACKAGECONFIG ??=3D "libsolv"
>>>> >
>>>> > -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
>>>> > +PACKAGECONFIG[gpg] =3D "-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\
>>>> >      gnupg gpgme libgpg-error,\
>>>> >      ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
>>>> >      "
>>>> > -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
>>>> > -PACKAGECONFIG[ssl-curl] =3D "--enable-ssl-curl,--disable-ssl-curl,c=
url
>>>> openssl"
>>>> > -PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
>>>> > -PACKAGECONFIG[libsolv] =3D "--with-libsolv,--without-libsolv,libsol=
v"
>>>> > +PACKAGECONFIG[curl] =3D "-DWITH_CURL=3DON,-DWITH_CURL=3DOFF,curl"
>>>> > +PACKAGECONFIG[ssl-curl] =3D "-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DO=
FF,curl
>>>> openssl"
>>>> > +PACKAGECONFIG[sha256] =3D "-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF"
>>>> > +PACKAGECONFIG[libsolv] =3D
>>>> "-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LIBSOLV=3DOFF,libsolv"
>>>> >
>>>> > -EXTRA_OECONF =3D "--enable-zstd"
>>>> > -EXTRA_OECONF:append:class-native =3D "
>>>> --localstatedir=3D/${@os.path.relpath('${localstatedir}',
>>>> '${STAGING_DIR_NATIVE}')} --sysconfdir=3D/${@os.path.relpath('${syscon=
fdir}',
>>>> '${STAGING_DIR_NATIVE}')}"
>>>> > +EXTRA_OECMAKE =3D "-DWITH_ZSTD=3DON"
>>>> > +EXTRA_OECMAKE:append:class-native =3D "
>>>> -DVARDIR=3D/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATI=
VE}')}
>>>> -DSYSCONFDIR=3D/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NAT=
IVE}')}"
>>>> >
>>>> >  do_install:append () {
>>>> >       install -d ${D}${sysconfdir}/opkg
>>>> > @@ -56,6 +57,9 @@ do_install:append () {
>>>> >  }
>>>> >
>>>> >  do_install_ptest () {
>>>> > +     # the ptest class uses a Makefile for installation, but cmake
>>>> uses Ninja per default so we need to install ptests manually:
>>>> > +     cp -r ${S}/tests ${D}${PTEST_PATH}
>>>> > +
>>>> >       sed -i -e '/@echo $^/d' ${D}${PTEST_PATH}/tests/Makefile
>>>> >       sed -i -e '/@PYTHONPATH=3D. $(PYTHON) $^/a\\t@if [ "$$?" !=3D =
"0"
>>>> ];then echo "FAIL:"$^;else echo "PASS:"$^;fi'
>>>> ${D}${PTEST_PATH}/tests/Makefile
>>>> >  }
>>>> >
>>>> >
>>>> >
>>>>
>>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#226864):
>>> https://lists.openembedded.org/g/openembedded-core/message/226864
>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembed=
ded.org_g_openembedded-2Dcore_message_226864&d=3DDwMFaQ&c=3DncDTmphkJTvjIDP=
h0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67=
E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3D=
RM3vVpXB68pNmt1v3I8UHhC8fbIHFusxWhHViuMiKjI&e=3D>
>>> Mute This Topic: https://lists.openembedded.org/mt/115910660/1997914
>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembed=
ded.org_mt_115910660_1997914&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGk=
ICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXi=
gbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DTfGnmOyEtO9VQXe3=
p4174fbjQnzAW_wgb7-9bBzLre4&e=3D>
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembed=
ded.org_g_openembedded-2Dcore_unsub&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dq=
wyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DHrgmZCbtN=
YqyFd-8EM0T4MpJVrJzIQuEEgQV1qr3Mkg&e=3D>
>>> [raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>

--00000000000092078e064524e35e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Khem,<br>I haven&#39;t had the time to debug yet, but I=
&#39;ve seen your message.<br><br>=C3=89tienne</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Dec 3, 2025 at 10:35=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr">It can be reproduced with direc=
t invocation<div><br></div><div>kraj@apollo /mnt/b/yoe/master/build/tmp/wor=
k/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0<br>=E2=9D=AF recipe-sysroot=
-native/usr/bin/opkg \<br>=C2=A0 --volatile-cache \<br>=C2=A0 -f opkg.conf =
\<br>=C2=A0 -t temp/ipktemp/ \<br>=C2=A0 -o rootfs \<br>=C2=A0 --force-post=
install \<br>=C2=A0 --prefer-arch-to-version \<br>=C2=A0 --force-depends \<=
br>=C2=A0 remove glibc-binary-localedata-en-gb glibc-binary-localedata-c gl=
ibc-binary-localedata-en-us<br><br>[1] =C2=A0 =C2=A0346156 segmentation fau=
lt (core dumped) =C2=A0recipe-sysroot-native/usr/bin/opkg --volatile-cache =
-f opkg.conf -t =C2=A0-o roots</div><div><br></div><div>I have a workaround=
 by setting</div><div><br></div><div>IMAGE_LINGUAS =3D &quot;en-us&quot;<br=
></div><div><br></div><div>in local.conf which avoids the need for=C2=A0opk=
g remove operation which is crashing.</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 3, 2025 at 1:04=E2=
=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">I am starting to see the following cr=
ash in opkg when building image. Anyone seeing something=C2=A0like this?<di=
v><br></div><div>(No debugging symbols found in /mnt/b/yoe/master/build/tmp=
/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/u=
sr/bin/opkg)<br>[New LWP 34493]<br>[Thread debugging using libthread_db ena=
bled]<br>Using host libthread_db library &quot;/usr/lib/libthread_db.so.1&q=
uot;.<br>Core was generated by `/mnt/b/yoe/master/build/tmp/work/raspberryp=
i4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/opkg --vo=
latile-cache -f /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/=
yoe-kiosk-image/1.0/opkg.conf -t /mnt/b/yoe/master/build/tmp/work/raspberry=
pi4_64-yoe-linux/yoe-kiosk-image/1.0/temp/ipktemp/ -o /mnt/b/yoe/master/bui=
ld/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/rootfs --force-po=
stinstall --prefer-arch-to-version --force-depends remove glibc-binary-loca=
ledata-en-gb glibc-binary-localedata-c glibc-binary-localedata-en-us&#39;.<=
br>Program terminated with signal SIGSEGV, Segmentation fault.<br>#0 =C2=A0=
0x00007f50a8190d20 in stringpool_strn2id () from /mnt/b/yoe/master/build/tm=
p/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/=
usr/bin/../lib/./libsolv.so.1<br>(gdb) bt<br>#0 =C2=A00x00007f50a8190d20 in=
 stringpool_strn2id () from /mnt/b/yoe/master/build/tmp/work/raspberrypi4_6=
4-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/../lib/./libs=
olv.so.1<br>#1 =C2=A00x00007f50a818a3dc in pool_str2id () from /mnt/b/yoe/m=
aster/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-s=
ysroot-native/usr/bin/../lib/./libsolv.so.1<br>#2 =C2=A00x00007f50a84fe4ad =
in ?? () from /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yo=
e-kiosk-image/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1<br>#3 =
=C2=A00x00007f50a84ff4df in opkg_solver_remove () from /mnt/b/yoe/master/bu=
ild/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-n=
ative/usr/bin/../lib/libopkg.so.1<br>#4 =C2=A00x00007f50a84e9bfb in ?? () f=
rom /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-im=
age/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1<br>#5 =C2=A00x000=
07f50a84eadb2 in opkg_cmd_exec () from /mnt/b/yoe/master/build/tmp/work/ras=
pberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/..=
/lib/libopkg.so.1<br>#6 =C2=A00x00005557220b6a9d in ?? ()<br>#7 =C2=A00x000=
07f50a8311f68 in __libc_start_call_main () from /mnt/b/yoe/master/build/tmp=
/sysroots-uninative/x86_64-linux/lib/libc.so.6<br>#8 =C2=A00x00007f50a83120=
1b in __libc_start_main () from /mnt/b/yoe/master/build/tmp/sysroots-uninat=
ive/x86_64-linux/lib/libc.so.6<br>#9 =C2=A00x00005557220b6bf1 in ?? ()</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Nov 27, 2025 at 10:11=E2=80=AFAM Etienne Cordonnier via <a href=3D=
"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.o=
rg&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2=
CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3D7Hhr9df0PBRkpiFWBooOX6=
tv5kZhGeHxO5S6vVaNiw8&amp;e=3D" target=3D"_blank">lists.openembedded.org</a=
> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org" targ=
et=3D"_blank">snap.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Gyorgy,<br=
>I have sent a patch to opkg upstream which disables the ACL option by defa=
ult again (it is <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.yoctoproject.org_g_opkg_message_175&amp;d=3DDwMFaQ&amp;c=3Dnc=
DTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih=
1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13N=
h-HmRl8UbCQaTnb5&amp;s=3D4U1D3q2TfA7jjhTo68DgNSOLopG_6Nlj6Ta9OG8TN_g&amp;e=
=3D" target=3D"_blank">https://lists.yoctoproject.org/g/opkg/message/175</a=
> , however the web-view doesn&#39;t seem to work at the moment. I only see=
 &quot;Forbidden&quot;).<br><br>=C3=89tienne<br><br><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 27, 202=
5 at 6:08=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail=
.com" target=3D"_blank">skandigraun@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">I just tried this, but it seem=
s that the ACL switch was toggled during<br>
the CMake transition. With Autotools ACL was disabled by default, but<br>
with CMake it seems to be enabled - and it complains that it can&#39;t find=
<br>
libacl on my machine.<br>
<br>
On 10/23/25 15:46, Etienne Cordonnier via <a href=3D"https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwMFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_=
yW13Nh-HmRl8UbCQaTnb5&amp;s=3D7Hhr9df0PBRkpiFWBooOX6tv5kZhGeHxO5S6vVaNiw8&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;<br>
&gt; See release notes at<br>
&gt; - <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__dow=
nloads.yoctoproject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&amp;d=3D=
DwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWW=
RXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;s=3Dqvmy1QT46Bl7mVt_XDbuHiic2IjU6z7Zk=
u_Gid-CVYc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_op=
kg_opkg-2D0.9.0.release-2Dnotes&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&a=
mp;s=3Dqvmy1QT46Bl7mVt_XDbuHiic2IjU6z7Zku_Gid-CVYc&amp;e=3D</a> <br>
&gt;<br>
&gt; [0.9.0] - 2025-06-27<br>
&gt;<br>
&gt; Semiannual opkg release.<br>
&gt; Bumping the minor version as a result of the project build tooling cha=
nging from autotools to cmake.<br>
&gt;<br>
&gt; - Added a Dockerfile container definition (`:docker/`) for a valid dev=
eloper build environment for opkg.<br>
&gt;=C2=A0 =C2=A0- It&#39;s recommended that project contributors use this =
container to build and test their changes.<br>
&gt; - The AutoTools-based build framework has [been replaced](<a href=3D"h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_=
opkg_commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&amp;d=3DDwICaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24=
AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;s=3DGgRxioBjt-ii5JWUrYQ0I-FmXvKxVxKNH3Nj22i=
_jiM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D3f=
6040e321634471ec442fb0e80f140f1437e90b&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvE=
f9Kx5&amp;s=3DGgRxioBjt-ii5JWUrYQ0I-FmXvKxVxKNH3Nj22i_jiM&amp;e=3D</a> ) wi=
th a more modern, CMake framework.<br>
&gt;=C2=A0 =C2=A0- Refer to the `docs/CONTRIBUTING.md` documentation for up=
dated build instructions.<br>
&gt;<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-devtools/opkg/opkg/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 .../opkg/{<a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp=
;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=
=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;e=3D" rel=3D"noreferrer"=
 target=3D"_blank">opkg_0.8.0.bb</a> =3D&gt; <a href=3D"https://urldefense.=
proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRi=
h1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13=
Nh-HmRl8UbCQaTnb5&amp;s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=C2=A0 =C2=A0 =
=C2=A0| 22 ++++++++-------<br>
&gt;=C2=A0 3 files changed, 41 insertions(+), 10 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-config.h=
.in-fix-typo.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/opkg/{<a href=3D"https://urldefense=
.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW1=
3Nh-HmRl8UbCQaTnb5&amp;s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a> =3D&gt; <a hre=
f=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&=
amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEO=
ukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DPCgmYCv6lZBoj7mQyNmGExGta=
a-iO2KXWfMw-LSuRro&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.=
0.bb</a>} (76%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo=
.patch b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 00000000000..626bbd01b68<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch<=
br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" =
target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +Date: Mon, 20 Oct 2025 18:57:56 +0200<br>
&gt; +Subject: [PATCH] <a href=3D"https://urldefense.proofpoint.com/v2/url?=
u=3Dhttp-3A__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=
=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=
=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer"=
 target=3D"_blank">config.h.in</a>: fix typo<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://urldefense.proofpoint.c=
om/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3Dd723a90bfe=
6409c7ad983ed911225d4aefbfd09e&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_=
4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&am=
p;s=3D5scf6nlpBtSePSuPjyopoX7FmlAyiSwI03Ry11w4tl8&amp;e=3D" rel=3D"noreferr=
er" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__git.yoctoproject.org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4a=
efbfd09e&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw=
&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D1A1uWL9SVAUWAO=
RYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;s=3D5scf6nlpBtSePSuP=
jyopoX7FmlAyiSwI03Ry11w4tl8&amp;e=3D</a> ]<br>
&gt; +Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@s=
nap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__con=
fig.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw=
&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzf=
ameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DdOZFRTTcPycQ3CB3=
uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">=
config.h.in</a> | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3D=
http-3A__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGk=
ICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6d=
qwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DdOZF=
RTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">config.h.in</a> b/<a href=3D"https://urldefense.proofpoint.com/=
v2/url?u=3Dhttp-3A__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&a=
mp;s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"norefer=
rer" target=3D"_blank">config.h.in</a><br>
&gt; +index 4fa9842..877b8c7 100644<br>
&gt; +--- a/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A=
__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBX=
igbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DdOZFRTTcPyc=
Q3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">config.h.in</a><br>
&gt; ++++ b/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A=
__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBX=
igbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DdOZFRTTcPyc=
Q3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">config.h.in</a><br>
&gt; +@@ -2,7 +2,7 @@<br>
&gt; + #cmakedefine01 WITH_XZ<br>
&gt; + #cmakedefine01 WITH_BZIP2<br>
&gt; + #cmakedefine01 WITH_LZ4<br>
&gt; +-#cmakedefine01 WITH_LZSTD<br>
&gt; ++#cmakedefine01 WITH_ZSTD<br>
&gt; + #cmakedefine01 WITH_CURL<br>
&gt; + #cmakedefine01 WITH_SSLCURL<br>
&gt; + #cmakedefine01 WITH_ACL<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-=
devtools/opkg/opkg/run-ptest<br>
&gt; index 5fb7077eec9..d485a4aace5 100644<br>
&gt; --- a/meta/recipes-devtools/opkg/opkg/run-ptest<br>
&gt; +++ b/meta/recipes-devtools/opkg/opkg/run-ptest<br>
&gt; @@ -2,4 +2,4 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 OPKG_PATH=3D$(which opkg)<br>
&gt;=C2=A0 <br>
&gt; -make OPKG_PATH=3D$OPKG_PATH run-tests<br>
&gt; +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var OPKG_P=
ATH=3D$OPKG_PATH<br>
&gt; diff --git a/meta/recipes-devtools/opkg/<a href=3D"https://urldefense.=
proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRi=
h1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13=
Nh-HmRl8UbCQaTnb5&amp;s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a> b/meta/recipes-=
devtools/opkg/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-=
3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dq=
wyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DPCgmY=
Cv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">opkg_0.9.0.bb</a><br>
&gt; similarity index 76%<br>
&gt; rename from meta/recipes-devtools/opkg/<a href=3D"https://urldefense.p=
roofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3Dnc=
DTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih=
1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13N=
h-HmRl8UbCQaTnb5&amp;s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
&gt; rename to meta/recipes-devtools/opkg/<a href=3D"https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1D=
ULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-=
HmRl8UbCQaTnb5&amp;s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&amp;e=3D=
" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
&gt; index 12e2edf7e3f..ed2f36d636b 100644<br>
&gt; --- a/meta/recipes-devtools/opkg/<a href=3D"https://urldefense.proofpo=
int.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl=
8UbCQaTnb5&amp;s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;e=3D" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/opkg/<a href=3D"https://urldefense.proofpo=
int.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl=
8UbCQaTnb5&amp;s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&amp;e=3D" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
&gt; @@ -15,34 +15,35 @@ PE =3D &quot;1&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24=
-257BBPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvE=
f9Kx5&amp;s=3DmKc8LzZ_Q2orQLqa_38Jr7E7tfyD4-rcsgI-wPkx_Zg&amp;e=3D" rel=3D"=
noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3D=
http-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24-257BBPN-2=
57D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4v=
CHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&am=
p;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;=
s=3DmKc8LzZ_Q2orQLqa_38Jr7E7tfyD4-rcsgI-wPkx_Zg&amp;e=3D</a>=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://opkg.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-opkg_conf-c=
reate-opkg.lock-in-run-instead-of-var-run.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-config.h.in-fix-=
typo.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;582a4c9e220cce0b7d08a0915c95db9f24ae43ad=
372ed5d42d5ec5f6cd413f0c&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;440ef321862e01f83da4d02884a0cbb4d9d7b32f=
82faa81a6a85493f0c89d0f5&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # This needs to be before ptest inherit, otherwise all ptest fil=
es end packaged<br>
&gt;=C2=A0 # in libopkg package if OPKGLIBDIR =3D=3D libdir, because defaul=
t<br>
&gt;=C2=A0 # PTEST_PATH ?=3D &quot;${libdir}/${BPN}/ptest&quot;<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;libopkg&quot;<br>
&gt;=C2=A0 <br>
&gt; -inherit autotools pkgconfig ptest<br>
&gt; +inherit cmake pkgconfig ptest<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
&gt;=C2=A0 OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
&gt;=C2=A0 <br>
&gt; -PACKAGECONFIG[gpg] =3D &quot;--enable-gpg,--disable-gpg,\<br>
&gt; +PACKAGECONFIG[gpg] =3D &quot;-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 gnupg gpgme libgpg-error,\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@ &quot;gnupg&quot; if (&quot;native&quot; in d.=
getVar(&quot;PN&quot;)) else &quot;gnupg-gpg&quot;}\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; -PACKAGECONFIG[curl] =3D &quot;--enable-curl,--disable-curl,curl&quot;=
<br>
&gt; -PACKAGECONFIG[ssl-curl] =3D &quot;--enable-ssl-curl,--disable-ssl-cur=
l,curl openssl&quot;<br>
&gt; -PACKAGECONFIG[sha256] =3D &quot;--enable-sha256,--disable-sha256&quot=
;<br>
&gt; -PACKAGECONFIG[libsolv] =3D &quot;--with-libsolv,--without-libsolv,lib=
solv&quot;<br>
&gt; +PACKAGECONFIG[curl] =3D &quot;-DWITH_CURL=3DON,-DWITH_CURL=3DOFF,curl=
&quot;<br>
&gt; +PACKAGECONFIG[ssl-curl] =3D &quot;-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=
=3DOFF,curl openssl&quot;<br>
&gt; +PACKAGECONFIG[sha256] =3D &quot;-DWITH_SHA256=3DON,-DWITH_SHA256=3DOF=
F&quot;<br>
&gt; +PACKAGECONFIG[libsolv] =3D &quot;-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLV=
ER_LIBSOLV=3DOFF,libsolv&quot;<br>
&gt;=C2=A0 <br>
&gt; -EXTRA_OECONF =3D &quot;--enable-zstd&quot;<br>
&gt; -EXTRA_OECONF:append:class-native =3D &quot; --localstatedir=3D/${@os.=
path.relpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} =
--sysconfdir=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_=
DIR_NATIVE}&#39;)}&quot;<br>
&gt; +EXTRA_OECMAKE =3D &quot;-DWITH_ZSTD=3DON&quot;<br>
&gt; +EXTRA_OECMAKE:append:class-native =3D &quot; -DVARDIR=3D/${@os.path.r=
elpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} -DSYSC=
ONFDIR=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_NA=
TIVE}&#39;)}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/opkg<br>
&gt; @@ -56,6 +57,9 @@ do_install:append () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install_ptest () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# the ptest class uses a Makefile for installatio=
n, but cmake uses Ninja per default so we need to install ptests manually:<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp -r ${S}/tests ${D}${PTEST_PATH}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;/@echo $^/d&#39; ${D}${PTEST_=
PATH}/tests/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;/@PYTHONPATH=3D. $(PYTHON) $^=
/a\\t@if [ &quot;$$?&quot; !=3D &quot;0&quot; ];then echo &quot;FAIL:&quot;=
$^;else echo &quot;PASS:&quot;$^;fi&#39; ${D}${PTEST_PATH}/tests/Makefile<b=
r>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226864): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_22=
6864&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameB=
p2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DRM3vVpXB68pNmt1v3I8U=
HhC8fbIHFusxWhHViuMiKjI&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://lists.openembedded.org/g/openembedded-core/message/226864</a><br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_115910660_1997914&amp;d=3DDwMFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW1=
3Nh-HmRl8UbCQaTnb5&amp;s=3DTfGnmOyEtO9VQXe3p4174fbjQnzAW_wgb7-9bBzLre4&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115910660/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwMFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_=
yW13Nh-HmRl8UbCQaTnb5&amp;s=3DHrgmZCbtNYqyFd-8EM0T4MpJVrJzIQuEEgQV1qr3Mkg&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--00000000000092078e064524e35e--

