Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D31C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 09:24:36 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.25564.1704187474808400086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 01:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hn/BMyjW;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e78f1f41fso6052143e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 01:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704187473; x=1704792273; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKozbUuJY1/HVlBpAfnj5DKTWobn1GSRroWU9TmlHdI=;
        b=Hn/BMyjWlUypjZxz35+Wy1Q/n/ZAahLNQm6PaLmY/gb1sMWYB8hOD0ez5SQ1SCcv5j
         3G0xkRr99M0PKa9gKiUXNGYs8QsGRdKA/Y4VWWDaudhphof7N2qJf3Kb/nV0hanniW+G
         UYE/NU7YIQOD3ussLujVaFYRK6vIuJqL2bW/LK1k5EabXMPslwqd0389zs2uxUa3iMrw
         mBe0vTUr/JDRzFWKqa7JhCjQOdHnwvkI8Z+rf+hW6Kq94DoYDOLuPKdMIobOlyPgseDV
         TQwhHTjvLLRJ9E372w9R4LWwi6dOLTCbjsBUyWZ2HsYgFLwzHIHx5SAvC/00b7GfHJVV
         JntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704187473; x=1704792273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKozbUuJY1/HVlBpAfnj5DKTWobn1GSRroWU9TmlHdI=;
        b=gULHz1F2fFI+rcsGL5/EKuDxOtqm9UHe54fYT6UynIPB7XHfsAl36oJZ/u1QEZHo5u
         U93m42YnXNNNVQQlQCTaX88ghE+eqU7m56Zwp1oUm0Cxym4enE3tgaMqmkxH8eelHPKt
         EQVE9/tmbXDr/aSBxQYyVHIQE4e8aZnqWmudLHgA5ncLrrO2RvRJaAj24i4peFiiiYSH
         ahXaIPCMNgwAINEIuCO93nHXUm/d5IKglYF8+9W3epap0cBsw9UqIWjAKU3SVOaquI7N
         8ob0A8ZVJiqbBXs6N9N3zeiELcS79DpWofZzIreeEV/Oq2ZRA9S0h4yLLTKAkUyiJGSE
         UuXA==
X-Gm-Message-State: AOJu0YwfxccB2C8gi37q5jomfaTUUIofinVi/3CUkjccuxyWCuQGaUQT
	j31mubQUJX55ziAMYks/ocU/GjmDdmicfaifg3I=
X-Google-Smtp-Source: AGHT+IFe1X1yaB/ULsNlc2AbVL5VYMaF77wbH/Sr86ro0QsruqzX2GiUpFyzdzVvIJWdjEanWkH/L89IFuxvx15j8Z4=
X-Received: by 2002:a05:6512:23a8:b0:50e:9c17:24c8 with SMTP id
 c40-20020a05651223a800b0050e9c1724c8mr967942lfv.7.1704187472699; Tue, 02 Jan
 2024 01:24:32 -0800 (PST)
MIME-Version: 1.0
References: <20231230154953.8135-1-alex.kiernan@gmail.com> <20231230154953.8135-4-alex.kiernan@gmail.com>
 <0b857242f53a4350e85029306d308f570641fca8.camel@linuxfoundation.org> <17A5F1406166801F.18542@lists.openembedded.org>
In-Reply-To: <17A5F1406166801F.18542@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 2 Jan 2024 09:24:20 +0000
Message-ID: <CAO5Uq5TfNcuKkYX2krym5uN5t+ThbQ29Y8gfhq9kmLwYyHXfjQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 4/4] rust: Upgrade 1.74.1 -> 1.75.0
To: alex.kiernan@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 09:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193224

On Sun, Dec 31, 2023 at 2:34=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Sun, Dec 31, 2023 at 2:23=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sat, 2023-12-30 at 15:49 +0000, Alex Kiernan wrote:
> > > Drop backported musl fixes. Set `change-id` rather than `changelog-se=
en`
> > > to fix build warning. Add fixes for 85c0ce24cc74 ("remap cargo
> > > dependencies to /rust/deps") which otherwise cause build failures:
> > >
> > > > thread 'main' panicked at src/core/builder.rs:1795:26:
> > > > std::fs::read_dir(registry_src) failed with No such file or directo=
ry (os error 2)
> > >
> > > https://blog.rust-lang.org/2023/12/28/Rust-1.75.0.html
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >
> > Unfortunately there were rust reproducibility failures too:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4170=
/steps/12/logs/stdio
> >
>
> Thanks, that's useful.
>
> Not sure why I didn't see that locally as on the face of it, it's
> (mostly?) the build path embedded in one of the output files

Closing this off - for whatever reason the buildpaths check wasn't
getting run when I was testing stuff, so what I thought was a fix,
wasn't.

--=20
Alex Kiernan

