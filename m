Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3883AE6917C
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:28:57 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.28771.1732292928189081733
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NcWA/Pxr;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ff3232ee75so27053021fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732292926; x=1732897726; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RM22tMPXFhD83hHzvOkMGlIK00s2HSqLuzsyBXlA/I=;
        b=NcWA/PxrPIBUo3urV/c1i/XAw8ii94MREjwqbAQNtdzRbkkyiN2lRMr805DfpjDn9w
         J3B6exoRBOW61lTUv3kLT0fpdSVhN7cJ1ikxHY5vpYF2EoUFnBW82ThZMLGybAHcRldd
         mHIB2PNOPI8j17OYVbs7EMzfLRhnhumqqaNG6mOFXOw73ATZ+PDzoFCpuBXFOBbpWyM8
         eyL/TVUW8fetvYRwX18ybPb4/puThYfBk6DFjvUd8b7fm+YWeFyEp/lJKJCRtHW7Xs9m
         vpvYeUlAJOa0n4mACc5SaJ603XtOm2cknJFoTnrec/CDL/LMQqQbBukAjONVLvdnNJJP
         aLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292926; x=1732897726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RM22tMPXFhD83hHzvOkMGlIK00s2HSqLuzsyBXlA/I=;
        b=OxpA1dLLPAJyp3IspYxdfNH6GItZ/MnNpdC5HssP76bXrycn0SP1dFOiZtK1qplaAj
         LyQIuYonq+vGnGJQEqSh12wfoYS8HZw9h7QpzQh8sKbFtvVUnXpgCfco5aESwq49Ccuv
         o/6LHG5tl7cttdpATuKMABIVAasJmIiAj93GHN92EjSfpScyjqM0ihlXSh/GIKQlVXX8
         gGPdEC0rqUTVymZFy4lIuTQCWbsSM3g8Gt12+nihDg9OZVHzNEFp1WltofdnsLviQZKN
         OaFOD/Z09ro7OVuSxMutavTtk5S7Rx2QoMj1Z5sNAGhm3xMV+7ClBk4vicvVi7gmenb1
         b2dQ==
X-Gm-Message-State: AOJu0YxBVY+hC9PJx8wuCC7tGeixd66H+J3DUvHBr3lpwhg3t8rZ+WLz
	oGXvoe8jPkVwsOAeEUYr7gR6ACEqk7QLogIPEpF1xWt/CpmpjrTzL38ipIsAPn3VkbKuKUz1j4f
	HMLCLQGaykxKDunQnwnyZA1ih+7E=
X-Gm-Gg: ASbGncuHls2onnxYSlmdijsnl3VK5AC49WxLAF4xJx4eIE94PLGNllYtm+ELipVGClT
	AqpCwrcam3N7CHieflEepvvc5GsPCQWGerw==
X-Google-Smtp-Source: AGHT+IGhSTyO1O6KeH0F+Iqt9vNIC4DKcDY9tAk+/Z1I5s853fyD+L0N4WzbWPhm+sQ2rBpQB5ZIFuadWil1Kjg9gXY=
X-Received: by 2002:a2e:b8cf:0:b0:2fb:62ad:89fe with SMTP id
 38308e7fff4ca-2ffa711aa28mr21224731fa.16.1732292926039; Fri, 22 Nov 2024
 08:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20241122133140.1627-1-karem.ibrahim46@gmail.com>
 <20241122133140.1627-2-karem.ibrahim46@gmail.com> <CA+chaQe5wbdQjO=KWzCEOadxexo6ke_RRaoesk1GET-Jy5V4GA@mail.gmail.com>
 <CANsOX5xj8+-F9CxChnOZWjWO7+to5dv_jPTyxqAJNpETQL=kUw@mail.gmail.com>
In-Reply-To: <CANsOX5xj8+-F9CxChnOZWjWO7+to5dv_jPTyxqAJNpETQL=kUw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 22 Nov 2024 17:28:35 +0100
Message-ID: <CA+chaQeLGgkGVoGSGiUpK0m3gCfVJ+JCUF0L40jBfvFw=Vqneg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] Added a new cargo-online bbclass for
 recipes requiring remote crates
To: Karim Ibrahim <karem.ibrahim46@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207639

I'm sorry you took it personally, I just wanted to help you. Next time I wo=
n't.

On Fri, Nov 22, 2024 at 4:18=E2=80=AFPM Karim Ibrahim <karem.ibrahim46@gmai=
l.com> wrote:
>
> Okay, nobody forced you to reply. Your review was terrible. If it is not =
ok you could simply say that for a reason, but there were thousands of bett=
er way to say that.
>
> On Fri, 22 Nov 2024, 15:40 Martin Jansa, <martin.jansa@gmail.com> wrote:
>>
>> This isn't a fix, it's just very bad work around, see:
>> https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/=
cargo-update-recipe-crates.bbclass
>> which you can use to avoid needing the network access during do_compile.
>>
>> On Fri, Nov 22, 2024 at 2:32=E2=80=AFPM Kareem Ibrahim via
>> lists.openembedded.org
>> <karem.ibrahim46=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > - This change was intended to abstract user from having to set compile=
 network flag to get remote crates
>> > - as network access was disabled by default in kirkstone version
>> > - I faced an do_compile error with bitbaking Qualcomm qcrosvm under yo=
cto kirkstone with message "Could not resolve host: github.com"
>> > - And after some hours of debugging I noticed that cargo inherited by =
recipe needs remote crates during do_compile of the cargo.bbclass
>> > - It was fixed by adding line do_compile[network] =3D "1" to the recip=
e
>> > - So I found it more convenient, since cargo build usually need networ=
k access, to abstract users from these details of cargo.bbclass do_compile
>> >
>> > Signed-off-by: Kareem Ibrahim <karem.ibrahim46@gmail.com>
>> > ---
>> >  meta/classes/cargo-online.bbclass | 7 +++++++
>> >  1 file changed, 7 insertions(+)
>> >  create mode 100644 meta/classes/cargo-online.bbclass
>> >
>> > diff --git a/meta/classes/cargo-online.bbclass b/meta/classes/cargo-on=
line.bbclass
>> > new file mode 100644
>> > index 0000000000..175c94e09d
>> > --- /dev/null
>> > +++ b/meta/classes/cargo-online.bbclass
>> > @@ -0,0 +1,7 @@
>> > +# This bbclass is added to abstract recipes writers from
>> > +# having to set do_compile network flag to 1
>> > +# if his cargo package need external remote crates
>> > +# as network access was disabled by default since kirkstone version
>> > +
>> > +inherit cargo
>> > +do_compile[network] =3D "1"
>> > \ No newline at end of file
>> > --
>> > 2.25.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#207615): https://lists.openembedded.org/g/openembe=
dded-core/message/207615
>> > Mute This Topic: https://lists.openembedded.org/mt/109721978/3617156
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[martin.jansa@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

