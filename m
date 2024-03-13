Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1869CC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:43:38 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.2326.1710351814755523800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IL5RQCaR;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-513cc23b93aso155060e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351813; x=1710956613; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sATYXpCp3oJbfrwuj8IwFPWZlbu/EXwJImbGrFEP+vA=;
        b=IL5RQCaRAsjU77PwLwbuLbUN27O1ZwsvZ9Lf54qaQBZJ3RzJDj2IIqTwEzJgoe9axV
         HhnnMJnY1/C1OOo7scsbp7Y5XZ11IC1mfsZg3gmnsYMyiV9UqJzwIj5EVA3MR0mYBGz+
         MoTS+CBymkWtZtQCOado/nGXAbWs0PC0YxmUA2MrtjhYHLWlLWMyF0fSs3fe6VQbJaO0
         LsiD7kjDblJoy3ABEI+jG30XcEqT0TBVJ88jMYozMcdLd1hHK558QoiDvThgpb0PQxfY
         8HRJGz38lEBrDqGVd9FQ0RRMq2+hVZbkN/R10rkNeX3LYZ6VTNqgBXIyn4wb7nZ833t7
         czZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351813; x=1710956613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sATYXpCp3oJbfrwuj8IwFPWZlbu/EXwJImbGrFEP+vA=;
        b=vnH09gzF9xxzAWNSL75fqBum3PJEd5PTlghKr+CTC4PgubYos/ROLEMtBf3XcAuHLr
         xzhy98pYmX2svqFGmMEl1vm+NCUj+ETy19PkxWuLf3BTiNEMMqfA1dC8t08ZsIgjMwkI
         3qleSWxdV92cRCnbYLkys886fXJRugyA0hdbr3IhxJSX+41vor2kqONoTyPNQWxyF1ys
         vQxKWH8cu5w5M2mP4YoGh6uKhgI3L65fv4tcJtzI6g/UyIZEh1vG6Qw82wdsLQKG2CPW
         GLeeho6WSotbXw0zHyi8ykDCghpGOVMJ91Pz2qa2VKTwu14ai12OA62eeQFdpwPBIekC
         BRfA==
X-Forwarded-Encrypted: i=1; AJvYcCWH+4kx4uShhilWB5LSMLqfyNK2qt+4qKUq0L05Rcmv6ACl85a7G9B4v4Zb1kRGr/zHEOtIv+WBDj14q/asMON4wxb+4V9ggADC6JkreLSH+nGMeAsqSvMk
X-Gm-Message-State: AOJu0Yx3ln1DFHuPXEDuM9kRWmlyXq05qnhLs8D6YVoqPP4XLBO37Jws
	b4CnIi3ye6DzHjqxmLVX6ahOmB1YBPSK1MFKwSHSIPTp6cwrJdwTVXs3bwD+T5N/01pPzWmSYTp
	I/xFDECI62vzvtSziqX0MIQnfFes=
X-Google-Smtp-Source: AGHT+IHlP6KGq1XZlwzgDlcinfi8mySuPs18ZQ17KQAgWqqVyoI6jW0Uu1OUx4QNFEtmj4YJ8JMy2zKJbs+ONO1SB9o=
X-Received: by 2002:a05:6512:20c7:b0:513:5133:bd76 with SMTP id
 u7-20020a05651220c700b005135133bd76mr2408491lfr.9.1710351812608; Wed, 13 Mar
 2024 10:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240306154151.3741709-1-alex@linutronix.de> <20240306154151.3741709-35-alex@linutronix.de>
 <CAFMvBt0onfsJ3BtzcEn87P4G3g+LQbrg2=f9eEexE80VO2TFPg@mail.gmail.com>
 <CANNYZj-jM1Uj4XW=58F9sbX3r5bST9iqT7L5hmvRs6XxOmELRw@mail.gmail.com> <CAFMvBt0xxWt6=q-8EDq=oMiQv95eCXy_PTARx_JQznOV8hKsUA@mail.gmail.com>
In-Reply-To: <CAFMvBt0xxWt6=q-8EDq=oMiQv95eCXy_PTARx_JQznOV8hKsUA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 13 Mar 2024 17:43:21 +0000
Message-ID: <CAO5Uq5TG2yfqkEJC=T1oeox-BvTvTQfSkfG9jyb7eb2AxxCtSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/47] python3-jsonschema: upgrade 4.17.3 ->
 4.21.1 and add new dependencies
To: "Theodore A. Roth" <troth@openavr.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197074

On Wed, Mar 13, 2024 at 2:45=E2=80=AFPM Theodore A. Roth <troth@openavr.org=
> wrote:
>
> On Wed, Mar 13, 2024 at 12:53=E2=80=AFAM Alexander Kanavin <alex.kanavin@=
gmail.com> wrote:
>>
>> On Tue, 12 Mar 2024 at 19:55, Theodore A. Roth <troth@openavr.org> wrote=
:
>>
>> > Any help or things to try would be appreciated. More than happy to pro=
vide more information if needed.
>>
>> Maturin support is fairly new, and rpds is the first real consumer in
>> oe-core, so issues like this can happen. You need to find out how it
>> forms the installation file name, and then find out how python forms
>> the filename it expects, and see where the mismatch is coming from.
>> Yes it's not simple and requires advanced, intuitive ability to read
>> large, unfamiliar code trees, something that everyone working with
>> yocto should possess. We already map architectures in various rust
>> pieces, e.g. rust-target-config class, so probably something like that
>> should be done in maturin builds too.
>>
>> Alex
>
>
> Making the following change (via a patch in a .bbappend) to the rpds Carg=
o.toml file fixed the import problem for me.
>
> Do not know if this problem is specific to our environment or not at this=
 point.
>
> Ted Roth
>
> diff --git a/Cargo.toml b/Cargo.toml
> index 78ac37f..c1f2ccd 100644
> --- a/Cargo.toml
> +++ b/Cargo.toml
> @@ -13,4 +13,4 @@ archery =3D "1.1.0"
>
>  [dependencies.pyo3]
>  version =3D "0.20.2"
> -features =3D ["extension-module"]
> +features =3D ["extension-module", "abi3-py37"]
>

It's not clear from the cargo docs, but I _think_ you might be able to
achieve this using:

CARGO_BUILD_FLAGS +=3D "--features pyo3/abi3-py37"

--=20
Alex Kiernan

