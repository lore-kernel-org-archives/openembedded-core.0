Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B31C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:01:00 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.182193.1698742852872153743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 02:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XhVoOB4Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c5b7764016so59319741fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698742851; x=1699347651; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rCERGgOv2leRqn9TFXyOMaFNVR4tIWyO9ttOnw0sA0=;
        b=XhVoOB4Y36JNFjidtwbwNKHE7xsboqDx7PGywIvJyHg3PKTkN3oW+14+O+IpUqM5yW
         7G0rR4QVekuOnyEy6C4FG5gSgXfk+RWcoO1byhNJZmTC2+n/k9qBh29DuDZ+ml/V+uTq
         sDA9VER6oHfUQEWzwOxmzs49SdwswUj8va4+SfdyaK6eATINJSeQkKwWXMj/x+adk5/r
         2FxbxDxLr/yvn3pIw/7azQyzq9IusWb/8LZCTU3WSCHCUkDoRNc6qC3gZ84Y1XBTCi6m
         HXxO9oHkEVYbZZyKumaTt7Z8oyVfNOUwEFHswN9EnADmfaXYKzzdzk+82HNjJhYO4APQ
         yoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698742851; x=1699347651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rCERGgOv2leRqn9TFXyOMaFNVR4tIWyO9ttOnw0sA0=;
        b=NdTmzcehzyggo/zOCRiLJyfvFm1z4QTAv/QKxsWtPzqiwb/WJmjqxDloMor72X8UR3
         /uR9j09vXOGUg+dEWIsLAhY73SnY/cnzdCn/Jo0cjJY6Q4G3niuqEDK3vLPSa5NqpJcV
         bVKrHdXAiHoSFEgHFAT1IwpmADKlE1ehbOjF97+f+cJZZFxpLbC5o9DppRwFROEzYd7/
         m4OYLiRLGtu6b4Kr1yiejGZkhaHEXtAdqR2lCKgyhXT7nrLzawllIzOguDdFNZUbvE6R
         CJeFmjVZ3CfSrtiUMBJqL3lpJkuTjrXXNDLGP8TTys4/a6GZtxygtnv8nqEZSS5BhkTY
         TCyA==
X-Gm-Message-State: AOJu0YwDFmZTl+GAdC9wDM+nt7aHXslmOKprKq7tldTQWbNq01OaUu5y
	icV9BQFizTOdncK0lKlI95HHS2ceH2Vbr1w8Bwc=
X-Google-Smtp-Source: AGHT+IENRbF0uSacSqSmU60Dum655Z0eKiG+Ex8vo5+9EYxwac2o39GRH01unUlra7R56XIQEDmrP8zdj14UjOBj1Ds=
X-Received: by 2002:a2e:8643:0:b0:2c5:1553:9129 with SMTP id
 i3-20020a2e8643000000b002c515539129mr9477558ljj.35.1698742850815; Tue, 31 Oct
 2023 02:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9rnOQ8BugHMLMzEGqFdHtHL+SkFmDjLvgNo8adO4VHVw@mail.gmail.com>
 <6763.1698120765303220209@lists.openembedded.org> <CANNYZj_sBnowv-v7XJed+irmv_hfw+QiipycWdaxmY4ZR1MYZg@mail.gmail.com>
 <OS3PR01MB9515FAF1056124430B410EFABAA0A@OS3PR01MB9515.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB9515FAF1056124430B410EFABAA0A@OS3PR01MB9515.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Oct 2023 10:00:39 +0100
Message-ID: <CANNYZj-xuMf4c_fzMBp3_V0RUFUMh+2=fQTpkhatYT6-_4WByQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] kbd:Add ptest support
To: "Tingting Qiu (Fujitsu)" <qiutt@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 09:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189834

Hello Qiu,

I think the easiest is to adjust the code so that it first obtains the
datadir from some environment variable, and if that is not set, falls
back to the hardcoded default. Then run-ptest can set the variable.
Such a patch can even be proposed upstream.

Alex

On Tue, 31 Oct 2023 at 09:27, Tingting Qiu (Fujitsu) <qiutt@fujitsu.com> wr=
ote:
>
> Hi, Alex
>
> I'm afraid DATADIR should be an absolute path.
> Tried to make a ptest.patch with relative path, but failed.
> As we know the ptest directory is not a fixed path, so making a patch may=
 be not suitable.
> For no 'make clean', we can modify the Makefile.am in do_patch().
> Any ideas=EF=BC=9F
>
> Best Regards,
> Qiu Tingting
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Tuesday, October 24, 2023 4:51 PM
> > To: Qiu, Tingting/=E4=BB=87 =E5=A9=B7=E5=A9=B7 <qiutt@fujitsu.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH V5] kbd:Add ptest support
> >
> > On Tue, 24 Oct 2023 at 06:12, qiutt@fujitsu.com <qiutt@fujitsu.com> wro=
te:
> > >
> > > Hi=EF=BC=8CAlex
> > >
> > > As you said, it is not-that-elegant bit of code.
> > > But DATADIR is used as a part of CPPFLAGS for compiling c files in
> > > tests, such as libkeymap/libkeymap-test01.c, libkbdfile/libkbdfile-te=
st13.c
> > and others.
> > > sample:
> > >
> > > libkeymap/libkeymap-test01.c: f =3D fopen(DATADIR
> > "/data/libkeymap/charset-keymap0.map", "r");
> > libkeymap/libkeymap-test09.c:   setenv("LOADKEYS_INCLUDE_PATH",
> > DATADIR "/data/libkeymap", 1);
> >
> > I see, thanks. I would suggest that Makefile.am is patched with a dedic=
ated
> > patch that sets DATADIR to ptest directory on target (you can mark it
> > Inappropriate), so that the change is robust (sed expressions are prone=
 to
> > silent regressions, and), and happens before actual build, so no 'make =
clean' is
> > needed.
> >
> > Alex

