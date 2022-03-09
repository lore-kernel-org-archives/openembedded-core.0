Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82670C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:37:47 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.18.1646843866360071805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EJUGvOx0;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id im7so2421657qvb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oIHLfrMqDvf6WVoV4Af+y29ty9deVoOw4AcU7V0uyl4=;
        b=EJUGvOx0rBTJ1AhXhXy1TmpEpogK8Ye95MiNQ0tJabTnLhHi5oOymubiQUWXxs4cqk
         XCgwUIg2TvKCvi+WzxxhSjeVQIwzTGMI6uMtDgmMo2V4fKNURVFm3jebEU5C4vNgPqA8
         mLhd7Lw2M1d3gG88MssCv74bwxPzm8BS5Od5/bumH/m3nWvwbq+SgfNC24dwAaKqRi2/
         XjbEMv5FPeApgwlNq6WKs8YxBEdaRQ2kO9MjtDszXL51teZ8/pccXAnAomQ7G1BPcE2o
         Zon7Jp7vNu1kvbltR+63VbJRTCICaVwI3PePkBSivceFxgEiEmCqVAeb/57ehrNTi7O9
         chBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oIHLfrMqDvf6WVoV4Af+y29ty9deVoOw4AcU7V0uyl4=;
        b=R6YRZgtj9BynTagzwMLHEkOzx/Zo5whtP82UQNece7Xanwbfg4in20uMaVwGBUKQQk
         M5BwrTKn630Ja9US2kIw8suYwAaYCNLKnAbeLj7QFYU93+aTPVClj6TJPGa5qaUMr5+i
         /cEZtZ9P6uzjs4X0N2v++uW7O4nWK9ekzEuMLhomnrUJsUIeLUnMr0XgSWX/q0v5Gfw8
         fAJ/yCoKP4iJXoeC1W7uhXenzRf0OZXp9fDcAWtM9qXd4e4VtkO3284K5S6GnRWvqkZu
         p7yJ49ozGc1Zepiv8EVkY2S8ios83Ft+/UiX20dvj6r2sDhq46WmHwJXdi4EATxVJmIb
         ziag==
X-Gm-Message-State: AOAM533+3qLhe8NoAeOS/ni9CeG6qAtDiOb889qxSk/7FNM5cFL+i2zq
	YrOHK7a7V0DfCLMNvZthy0mtFQ7Qjn/Vo50qeJs=
X-Google-Smtp-Source: 
 ABdhPJzJWdxsObirgpe7AX/8Ya6dsNC/P2PORYk0hzNCAx7dGKltJtQZfRVtQO3mYqg2xzR78cYFHNHllrD6OBTVbJg=
X-Received: by 2002:a05:6214:2a83:b0:435:3075:e990 with SMTP id
 jr3-20020a0562142a8300b004353075e990mr347578qvb.110.1646843865433; Wed, 09
 Mar 2022 08:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20220309011830.3130440-1-raj.khem@gmail.com>
 <CANNYZj85JcW7xaLcuPC_+oap4a2hseFEWucnCLX4hFY=KT5Apg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj85JcW7xaLcuPC_+oap4a2hseFEWucnCLX4hFY=KT5Apg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2022 08:37:19 -0800
Message-ID: 
 <CAMKF1spaCR+0DmrQz22=pgSLhUPN6GFBdK4_068ecw5yKg_1ZQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 16:37:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162972

On Tue, Mar 8, 2022 at 10:11 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Why is this issue not seen on autobuilder=E2=80=99s no-x11 job?
>

perhaps AB's no-x11 job is still using mesa and not an alternative
stack like mali or sgx ddk
if so then here is why

https://git.openembedded.org/openembedded-core/tree/meta/recipes-graphics/m=
esa/mesa.inc#n30


> Alex
>
> On Wed 9. Mar 2022 at 2.18, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/qemu/qemu_6.2.0.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-dev=
tools/qemu/qemu_6.2.0.bb
>> index 062ed32b015..c7eef0a9d5e 100644
>> --- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
>> @@ -6,6 +6,8 @@ DEPENDS =3D "glib-2.0 zlib pixman bison-native ninja-nat=
ive meson-native"
>>
>>  DEPENDS:append:libc-musl =3D " libucontext"
>>
>> +CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_=
NO_X11=3D1', d)}"
>> +
>>  RDEPENDS:${PN}:class-target +=3D "bash"
>>
>>  EXTRA_OECONF:append:class-target =3D " --target-list=3D${@get_qemu_targ=
et_list(d)}"
>> --
>> 2.35.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#162946): https://lists.openembedded.org/g/openembedd=
ed-core/message/162946
>> Mute This Topic: https://lists.openembedded.org/mt/89652908/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

