Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA961C83F17
	for <webhook@archiver.kernel.org>; Sat, 26 Jul 2025 18:55:54 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.46959.1753556150929711050
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Jul 2025 11:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AMkDkbVk;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-719f2f092bcso7303207b3.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Jul 2025 11:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753556150; x=1754160950; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfx0jxw9/KrSmrPloarS3ymJ7Xr4RCnJE+PrtS9+q2w=;
        b=AMkDkbVk13se6+3DP2N2SeueND1gyZEwrwt3Q9FYm2DSFgWCXVCjj6H0aYg6ttGDhg
         Xk6Wg3v80s3+lA3Tfgk2peqtd6nnZa2dMDiMw79Kf6XM0nyI8Rm2xkgMMq/MgImQ222A
         JskJcTMP3MqBxybzwuSd0796x02gJ5QH09/1G50Ln5EjhgG7rUVftrxZIaC4jztN22GG
         rqGxaQTGRIoeICatlsSr0/gm+GQVcUyFtEciy0pKCzQ60Adh5dhcJvmuUXn3z+chhslo
         JBDNfnHjAnEPaStWDpXHFVXoD+fIQH9he9ZMiEPPTxk8I00opQO9q3x8qBbPbVieRcrs
         whaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753556150; x=1754160950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfx0jxw9/KrSmrPloarS3ymJ7Xr4RCnJE+PrtS9+q2w=;
        b=wgj83/JMgXGSuVEq4DxEi4phG/DJKJl2At0yisuoUKb+HlwF+FfCmtj5wkiM2i/unQ
         Y2donHHGTpytbb1Br5GivBEuhp963v1cf0gEmVoi3xJBo8Z28cdbXKr6MTydpDYrw+zF
         eXdKpnaSC+QrEYgbaw6prRCfDYSefuVTOfYCcGLn9e0vBXaoH0geQfToGaql35zljOGF
         jAsOcRd6/eQV8+Xc1L0ORUhNYmvJyJnJgINxOJmfotr0Fm6QG71xy9/8KPqvd31ygnrK
         udod7oFyXp0LZx65wXZB9dbyDl1MB+VtU7FHA4E0e1AAklD7kM8Z/usBt+G+A2VVrORz
         iHhA==
X-Forwarded-Encrypted: i=1; AJvYcCXyUDd7C9tBkNqBpkCIu6OMU4uSabspncFA5AtKzxjSOXZfQDOVxdlzTgIy3mvr39Qo7TezyEseEqGagf54uWAAaw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEp8lwXtOiRM5zNSnuiDEcIyvSvIfJNwsKYaWVBQvJD75i92AP
	+it/Sy8V6F3a56U4RUh7XJcQLMxZcb9+L7ncAL9ykENBQ4NHBmB962YSoskNH2IMXu/tK+HUdK/
	pXdEhhDqk4R4oyuIwyT6t/0cVFI72jHU=
X-Gm-Gg: ASbGnctW0KB3wRlVR4/KW8kv5hayxt12rXC1ljO2RWx1VhBzwiYuqpBCwlJdoqrp3bT
	l0nWaJol7G30ieigMjVw2SCY/JiI3lwBCimT4PIBSyTC3DgqA6bdNEpH2PBq4yEs9vYVtXK5fqJ
	k3nD8BMpQccVjNb5qfmGYccq8ucZQDDt+D2zwWLXZaz3ZqArWtc80P3HJlHQkvIH7/taBGPiZGX
	+jJjWF8XJmWcUXmNULszSyiwOmYiNIswxwJgvH7JiCgJuPXZ4o=
X-Google-Smtp-Source: AGHT+IEZ4A6cn11Pg2DbjA5RR54rdH/T80hz00sU9cDWCD0+3AF806BvcOdyrLmqpM5djx9abyVrEcaOy9LO7Ny05K4=
X-Received: by 2002:a05:690c:7243:b0:718:4095:89bc with SMTP id
 00721157ae682-719e3853507mr75044217b3.22.1753556149895; Sat, 26 Jul 2025
 11:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250725123811.1718097-1-lamine.rehahlia@smile.fr>
 <CADkTA4NwXU0TCYRCPj1BgT=y5Q6z5_Vn_i1+D8SAQNH7vWV=XA@mail.gmail.com>
 <CAMSfU+7E8J_qXX+3a690V9z9hxHZMQyUVn50B5SY1Aj3Mjf0Bw@mail.gmail.com> <CADkTA4MahNU--4zAz-DVku429HwuJ6j1CeAXTwp662v3=HSpwQ@mail.gmail.com>
In-Reply-To: <CADkTA4MahNU--4zAz-DVku429HwuJ6j1CeAXTwp662v3=HSpwQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Jul 2025 11:55:23 -0700
X-Gm-Features: Ac12FXywmIwMQ8Ya5zRTTirSL9BgwubPbBg0K-w2XGiNHRO4526wtA3FLX2ZCDs
Message-ID: <CAMKF1so5u2vvoMDKgue94476D3MyuUkuM6FrVcTmV_mw9BduAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] runqemu: Enable snapshot mode by default
To: bruce.ashfield@gmail.com
Cc: Yoann Congal <yoann.congal@smile.fr>, lamine.rehahlia@smile.fr, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Jul 2025 18:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220938

On Fri, Jul 25, 2025 at 6:10=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
>
>
> On Fri, Jul 25, 2025 at 8:56=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>>
>>
>>
>> Le ven. 25 juil. 2025 =C3=A0 14:43, Bruce Ashfield via lists.openembedde=
d.org <bruce.ashfield=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>>>
>>>
>>>
>>> On Fri, Jul 25, 2025 at 8:38=E2=80=AFAM lamine.rehahlia via lists.opene=
mbedded.org <lamine.rehahlia=3Dsmile.fr@lists.openembedded.org> wrote:
>>>>
>>>> From: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
>>>>
>>>> When snapshot mode is enabled, all disk images are treated as read-onl=
y.
>>>> Any sectors that are written during the QEMU session are redirected to=
 a
>>>> temporary file (usually in /tmp), and these changes are discarded when
>>>> QEMU exits.
>>>>
>>>> This mode is particularly useful to:
>>>> - Avoid corruption of the original image
>>>> - Ensure repeatable and clean test runs
>>>
>>>
>>> Except that qemu isn't only used for testing in that manner.
>>
>>
>> Hi Bruce!
>>
>> That we did not take into account.
>>
>>>
>>> My main use case is persistent qemu runs where data persists for days a=
nd even
>>> weeks at a time while I test the deep container stacks in meta-virtuali=
zation.
>>>
>>> So unless I'm misunderstanding the patch, I'd be strongly against this =
being
>>> the default. It has much more potential to surprise users than the chan=
ces of
>>> disk corruption causing problems.
>>>
>>> If the default did change (and I'm understanding this correctly that it=
 would
>>> impact all runqemu invocations), then there needs to be a large and obv=
ious\
>>> banner than any changes made during the run would be lost on exit.
>>
>>
>> Agreed.
>>
>> What about :
>> * stay in non-snapshot by default
>> * only allow using compressed image in snapshot mode (in the next patch)
>> ?
>>
>
> Since that is a new use case / feature that you are adding, then having a
> different mode associated with it would likely not be surprising to a use=
r.
>
> I did look at your 2nd patch as well, and if I'm understanding it correct=
ly
> the compressed image is decompressed to a location (currently the
> directory with the compressed image) and then executed.  With those
> extra steps, it seems to make sense that the data is not persistent and
> snapshot makes sense.
>
> In either case, it may be a good idea to expose the snapshot (or not)
> to the user via an environment variable or a command line option and
> that way whatever default is picked can always be changed.
>
> On that line of thought, it would also be good if that setting did appear
> in the runqemu summary of settings, so it would be more obvious to the
> user that it is in effect.

I agree with this, changing the default like this is perhaps less than idea=
l
. It would be better to make it an option that user can set and keep the
defaults as it is.

>
> Cheers,
>
> Bruce
>
>>
>> Looking back at the patch, it does not let a user return to the non-snap=
shot mode... which is wrong, so it must not be accepted like this.
>>
>> Thanks!
>>
>>>
>>>
>>> Cheers,
>>>
>>> Bruce
>>>
>>>
>>>>
>>>>
>>>> Signed-off-by: Lamine REHAHLIA <lamine.rehahlia@smile.fr>
>>>> ---
>>>>  scripts/runqemu | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/scripts/runqemu b/scripts/runqemu
>>>> index 3d77046972..6c263d6b2a 100755
>>>> --- a/scripts/runqemu
>>>> +++ b/scripts/runqemu
>>>> @@ -196,7 +196,7 @@ class BaseConfig(object):
>>>>          self.taplock_descriptor =3D None
>>>>          self.portlocks =3D {}
>>>>          self.bitbake_e =3D ''
>>>> -        self.snapshot =3D False
>>>> +        self.snapshot =3D True
>>>>          self.wictypes =3D ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi',=
 "wic.vhd", "wic.vhdx")
>>>>          self.fstypes =3D ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'bt=
rfs',
>>>>                          'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.g=
z',
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>>
>>>
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220913): https://lists.openembedded.org/g/openembedde=
d-core/message/220913
> Mute This Topic: https://lists.openembedded.org/mt/114336727/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

