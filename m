Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF6AC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 13:35:37 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.166308.1673876136811495279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 05:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NlZ29M3t;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id f34so42728228lfv.10
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 05:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exLL/MCRfsOYyDs/7+pZmFdcdRJaT8jHRxPyCynk1UQ=;
        b=NlZ29M3tw36ByvFf0YCVYkDjf6n+TZGDLZCtES9WLpzdzugIn9kS1B5c8YvNWr9V+o
         lumZWFDMBtTCGMGvtWgouKbCtB8FRvucb9jn4/PGaf46SYfzo8+MgJ1cQgW5TpRWyGPy
         OCDLjwIpqVhnAu8QlpqnNLNZlHJPl9/ope/IYTRsrhPwa5rlBoINuxt+w1SF0vF8BWTT
         zbTJwOuKdHGHM1jo4xTTVqIMaC1yduUYphGIzbkm9oayFnA5rqLo/+pMajABItHQbtto
         okrk1tJ+yMfaZqhDGdMY88dafeozpeaEIj5uvcuY4nuN2UO43EgSWrmEexzwDReEUQQZ
         uSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exLL/MCRfsOYyDs/7+pZmFdcdRJaT8jHRxPyCynk1UQ=;
        b=Ey0u9TPElRnmk+kmjNOJiYUwcrVOQUE/6ubxHra/Hi2cgH/YNA3teNwFZ9lGHsmlWd
         asmXXASQENna3cx44q8sxm/V4BaTfuXsf2YtXFqi041BcSJ1tJVDPugic5S9lTFlRN5o
         p3hZNKTwe8Ga3C3KaKiqspX6uHJZajKT8b4EeeGVx7fuaVTbFgSVgxESSQ/kvq1CHMZc
         lRyKjLD/aVq9CnRIkkJ/wkgepzEf+VeDudgDdrGWMoP8pyYGjl3L2ySHPl+1Y4sNxmAI
         IfD7ACm6mKxGeu3/8QMVAASyVZ34gI8tEDFaF3dCfFy8zmzyvc+8JsZ8iaeu/7OIYoaX
         CTLw==
X-Gm-Message-State: AFqh2kob5qG/jLDs9b/9WK04HwgwcCtm4h7d7RYksnrAs3IeahxO6gXq
	Tzy82jez7lc6CwpznSDzbH/RFdEkbi87QmRfyu0=
X-Google-Smtp-Source: AMrXdXtsoIn5vcns1Tw9nrm6lcw6pkaKA4I/j2+O72I88nKUrdge7OGh5aLT7hBQIAHCbZHKvRKxkcbgDLnwaXRXUaw=
X-Received: by 2002:ac2:4bc9:0:b0:4b5:4502:1323 with SMTP id
 o9-20020ac24bc9000000b004b545021323mr5376085lfq.345.1673876134595; Mon, 16
 Jan 2023 05:35:34 -0800 (PST)
MIME-Version: 1.0
References: <20230116084809.16470-1-Qi.Chen@windriver.com> <173AC3E18715B47D.23170@lists.openembedded.org>
 <729210c666036a1fe57866f8b10326a9768873a9.camel@linuxfoundation.org>
 <CO6PR11MB560236EA3C3AD9FAAB0B70CCEDC19@CO6PR11MB5602.namprd11.prod.outlook.com>
 <CA+chaQe8yUH0YzF1cDFXORmBUofpuXezwjK6rs9hfKSenK0KhA@mail.gmail.com>
In-Reply-To: <CA+chaQe8yUH0YzF1cDFXORmBUofpuXezwjK6rs9hfKSenK0KhA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 Jan 2023 14:35:22 +0100
Message-ID: <CANNYZj8DPfaMUDXE-4EkfU-SNdm0NNbXroEodKo9OZG8hQ7T9w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on nativesdk-file
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "Chen, Qi" <Qi.Chen@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 13:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175984

MAGIC=3D... was added in the first place to the native rpm 4.x wrapper
by me because rpm links with libmagic (which is a part of file
recipe/component), and libmagic would try to find it in file's
recipe-specific sysroot if not overridden from environment.

I'd say the right fix would be to make libmagic (or whatever else
reads the file) find the needed file relative to its own installation
path.

Alex

On Mon, 16 Jan 2023 at 13:56, Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> The use case I was fixing in:
> https://git.openembedded.org/openembedded-core/commit/?id=3Df40a2658f5be6=
739c5dddab7f9f11e1f85a17102
> was just about rpmdeps not being able to find rpmrc due to wrong path in =
the wrapper.
>
> MAGIC was moved to environment-setup.d/rpm.sh just to set all variables (=
which used to be set in the wrappers) in the same place and to be able to r=
emove the wrappers completely in the next commit.
>
> It might be cleaner to set MAGIC variable in separate environment-setup.d=
/file.sh installed by nativesdk-file to make sure that it's set only togeth=
er when corresponding magic.mgc is installed in SDK (but we'll still need t=
o depend on file where needed). MAGIC variable was added in https://git.ope=
nembedded.org/openembedded-core/commit/?id=3D760103cdaed3e820888d8984ec0b76=
cfc831d534 but commit doesn't say why.
>
> Regards,
>
> On Mon, Jan 16, 2023 at 1:47 PM Chen, Qi <Qi.Chen@windriver.com> wrote:
>>
>> Richard, I'm going to check how rpm uses 'file' and will come up with a =
better solution.
>> Martin, could you please tell me your use case, if convenient? I will en=
sure I don't break it.
>>
>> Regards,
>> Qi
>>
>> -----Original Message-----
>> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Sent: Monday, January 16, 2023 7:14 PM
>> To: Chen, Qi <Qi.Chen@windriver.com>; openembedded-core@lists.openembedd=
ed.org
>> Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on natives=
dk-file
>>
>> On Mon, 2023-01-16 at 10:39 +0000, Richard Purdie via lists.openembedded=
.org wrote:
>> > On Mon, 2023-01-16 at 16:48 +0800, Chen Qi wrote:
>> > > For now, running `file' inside SDK errors out.
>> > >   file: could not find any valid magic files!
>> > >
>> > > This is because nativesdk-rpm exports MAGIC. So let's make
>> > > nativesdk-rpm depend on file for better user experiences.
>> > >
>> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> > > ---
>> > >  meta/recipes-devtools/rpm/rpm_4.18.0.bb | 1 +
>> > >  1 file changed, 1 insertion(+)
>> > >
>> > > diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
>> > > b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
>> > > index 8eb0ab207e..3b7d4d640a 100644
>> > > --- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
>> > > +++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
>> > > @@ -188,6 +188,7 @@ PROVIDES +=3D "python3-rpm"
>> > >  FILES:python3-rpm =3D "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
>> > >
>> > >  RDEPENDS:${PN}-build =3D "bash perl python3-core"
>> > > +RDEPENDS:nativesdk-rpm +=3D "nativesdk-file"
>> >
>> > Should we be adding file to ${PN}-build instead?  Which rpm command
>> > was this with? Does anywhere else in rpm have/need this dependency?
>>
>> To answer my question, the problem is that as well as the rpm wrappers, =
the code also sets MAGIC=3D from an environment setup file.
>>
>> At the very least, the RDEPENDS needs a class-nativesdk override in ther=
e as otherwise it is floating around unconditionally.
>>
>> I don't really like adding workarounds like this since we won't understa=
nd them at some future date.
>>
>> Other solutions might include:
>>
>> a) patching RPM to use RPM_FILEMAGIC instead of MAGIC so we can set it i=
n a more granular way
>> b) moving the environment setup piece for MAGIC to nativesdk-file so it =
is only used if file is installed in the SDK
>> c) fixing rpm (or file?) to dynamically relocate the paths it is using
>>
>> Can we see if there is a better solution we can switch to please?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175982): https://lists.openembedded.org/g/openembedde=
d-core/message/175982
> Mute This Topic: https://lists.openembedded.org/mt/96303256/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

