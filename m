Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBABBC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:47:16 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.170.1646844435898187084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q05YD9ZX;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id z66so2187124qke.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q/gzqCIg5S86pzTJBLlWpDVoCHAz41nBP2/GjQrJ3KM=;
        b=Q05YD9ZXn644xmo2z+xloblh5toc+Bm+Q+o2ZxfPriEuoqtMktSjjdbs/LsxwZJnBw
         ZUUCSTJQCm4tTCksfbwb2IgGypIoICP/ewbAUxvX77IAiECY3Bz1g6UuXNkLn24SDFNz
         cfqwuMQH/nGW9mVD5omQlIZOdfirB14Xb/iI1SlqbRxz0hsVVHyEb66rp6nd0iWLDYBF
         d4ktTrSuWKt+0Nk9zqCzyx+PLiF01qV/a0TIUeVbluLdpRssMwLCmX9+YnygMUsw0P4z
         por0lz9/0sYgSTBB1ShC4pjmYyryvZjZ2c+B8zntyi2AVZ0NcwOjZ3nD+i0HEmsWpSyQ
         uAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q/gzqCIg5S86pzTJBLlWpDVoCHAz41nBP2/GjQrJ3KM=;
        b=uoYBjYb2NgRNIlyXL2e8n4pGEK/o+Z/jZi77Iz/BzonHJDkxK5gGCfLE3dNf1+QbXY
         uREEJ9jNSTWYPJRGaxW751g0KpW3GyozI+hJ1cfFJ34D12vI7XuGX07CeHDqUggDY/yq
         jYgw1SOB9b1zGJoTye1GG1Z3Sh9jeilI+FUuMNiDjygqU6PQnCgIk7Vaji876XdxScoV
         8I1LzSTFfCLNblKmTkdMqz74gMu2NMcz11RugE0CLmLW8FM4RkGFf29W61zxd50gHCEW
         bUWHQOcPY1+PSi31F2bTlMoExfyFqDot+ZBjTAvKkvsVvIe0e3NjDi5FzTR6XfGSNntE
         kGQA==
X-Gm-Message-State: AOAM530X/KHycY7SqYAfaWEY8FGh33e0kDY37qq/WSdE6xER+i5Ss7rK
	mU1ME3n57XsAXG+/CsFRe6sFkAJ7gbkP62pQltE=
X-Google-Smtp-Source: 
 ABdhPJxvIt62qW82uc7h4QDDNV6pEYSTHAS2Poehx+R2CYG+oiNLAQy8jv8kmhDf+jRSSPikVsnxcI7eR6WZx5ELSmg=
X-Received: by 2002:a05:620a:372c:b0:67a:de08:875e with SMTP id
 de44-20020a05620a372c00b0067ade08875emr322283qkb.149.1646844434864; Wed, 09
 Mar 2022 08:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20220309011830.3130440-1-raj.khem@gmail.com>
 <16DAA19DB5E87A22.14238@lists.openembedded.org>
 <CANNYZj-=3wf4HUAP6yTUQBg+qo07XwjxkbN9k=Dqgu9MiCuZTg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-=3wf4HUAP6yTUQBg+qo07XwjxkbN9k=Dqgu9MiCuZTg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2022 08:46:48 -0800
Message-ID: 
 <CAMKF1spQTOqd2pH3pdgvXVBaQ1jvQKLBDey3EE1HCumwOLym5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Fix build when x11 is not in distro
 features
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 16:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162974

On Tue, Mar 8, 2022 at 10:38 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Also, what error specifically are you seeing? How is your build set up?
>

There is use of MESA_EGL_NO_X11_HEADERS which is now renamed in newer heade=
rs to
EGL_NO_X11 from mesa/khronos headers, however this define is
relatively new and 3D stacks do not have this adopted but apps
like qemu and bunch of others depend on it, I guess they assume mesa.
One can argue that its better to fix the 3D stacks to behave
like mesa but this means every BSP using these stacks will need to
carry such a fix.

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/include/EGL/eglplatfor=
m.h

> Alex
>
> On Wed 9. Mar 2022 at 7.11, Alexander Kanavin via lists.openembedded.org =
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Why is this issue not seen on autobuilder=E2=80=99s no-x11 job?
>>
>> Alex
>>
>> On Wed 9. Mar 2022 at 2.18, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/recipes-devtools/qemu/qemu_6.2.0.bb | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-de=
vtools/qemu/qemu_6.2.0.bb
>>> index 062ed32b015..c7eef0a9d5e 100644
>>> --- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
>>> +++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
>>> @@ -6,6 +6,8 @@ DEPENDS =3D "glib-2.0 zlib pixman bison-native ninja-na=
tive meson-native"
>>>
>>>  DEPENDS:append:libc-musl =3D " libucontext"
>>>
>>> +CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL=
_NO_X11=3D1', d)}"
>>> +
>>>  RDEPENDS:${PN}:class-target +=3D "bash"
>>>
>>>  EXTRA_OECONF:append:class-target =3D " --target-list=3D${@get_qemu_tar=
get_list(d)}"
>>> --
>>> 2.35.1
>>>
>>>
>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#162947): https://lists.openembedded.org/g/openembedd=
ed-core/message/162947
>> Mute This Topic: https://lists.openembedded.org/mt/89652908/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

