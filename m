Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D63C54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 21:02:50 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.1344.1724792567025842146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 14:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i0UxFCrD;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5da6865312eso4840858eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724792566; x=1725397366; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyUAowlqBybDHvLgANzEnvNVVdnYkLAb8eg+B+//Brs=;
        b=i0UxFCrD0JGuhjDAMMPNAlv1fc1FUC0d6aTEQOrrc9x0qlYBLb1n+9fpHZOJFV03LS
         N0cqtBFdvb5l4LZ++D7s1z2sk5QQEZy+cuTOx60AKkwdcbQ1pGSAAf/ZDGQHBfWDCbZ0
         S2qgmfrxNC65SEjcfr2VQQ+dUEqsM0QRJAuLWYiAdi4/OCcNLqmbgu3saKCDOXNzgxLF
         6hTfx59aPZsPxOTIwthqPc56LOeeWagU6r5a0OdQADaprGBdh0hCt39wXDqfxIuVnDxX
         6KQK7jYdpMs/dn8xwgJqTgUsJM6Yqtb8q+nNu7mRXMIVkhXZzVnumtjcBIBy8M4LMi35
         zgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724792566; x=1725397366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyUAowlqBybDHvLgANzEnvNVVdnYkLAb8eg+B+//Brs=;
        b=hDybBHJSmqwQI/NztYp3YGfrXhYUZfcfGmgkYZ3PV11B/K8YLhp4z1yjT7TpZsRgUH
         Yrb+ZZz4cGOZFw0Rjth1l+WiF0kmma/RqGTsNuECyrqH/ljy40ea9tvEfhomn+qQ0Qeg
         OGNrGJW4aa1rOJ/wgW9nKlG9H6tYXBDV+EuKhxkNOPxk5yvO7h1CdPXVs++0YbygP2sa
         041wD9y4OeEGxPPH4LHdMJ+RrTr5dC3caIzdlrkWQ9RDzqTvmvCPkXMnSUwc3q4uRKSq
         wHXV5KQpbo0ezqxLLKcJnROoFDCmpcrUMKvHuMusHDKw/WDBPd+I1JHkH12ZKICKHE9f
         UBTw==
X-Forwarded-Encrypted: i=1; AJvYcCUoKpCDtQkXdKeor62HtaF/oP/t32cOp+W+DWdhjYCSzW2ROv9LLobaRRJIBjW78ZzyaMQVmPPaWCTPpaiQS0lG2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxjxkw3GprH3l+6mtP96RVjbwLhS1hEeVUn0r0epv4D9gGG/48V
	04B/Qlxx9WkN/Nu0smn1hkXoqXf21LtSAhU7NgP+WKY2MzPksqWB/6wfPPbsAUqbIxU1znIeomQ
	Wt5pzCWJUPI/kgnRc1vQ9gmpMUqA=
X-Google-Smtp-Source: AGHT+IFPH33jGNtNxb2sr9bLMgkff6HFaTFcfImv0Ag1TyG7fwjbKGkfVQ5SDb7orYIQz3SA/gscqYNUEcdzfoTXsrY=
X-Received: by 2002:a05:6820:605:b0:5df:837e:92ad with SMTP id
 006d021491bc7-5df837e9452mr870040eaf.5.1724792566176; Tue, 27 Aug 2024
 14:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
 <20240825170553.566798-2-Yash.Shinde@windriver.com> <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com> <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com> <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
 <17EFA275ACF95534.20373@lists.openembedded.org> <17EFA28FD32C2C48.20373@lists.openembedded.org>
 <CANNYZj_p+3JR8QtntEB+PktAhuuxOg7e-dbHv+1nFC=SzzVcSg@mail.gmail.com>
In-Reply-To: <CANNYZj_p+3JR8QtntEB+PktAhuuxOg7e-dbHv+1nFC=SzzVcSg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Aug 2024 14:02:19 -0700
Message-ID: <CAMKF1sqtFQr1cSfB_Pp8cszWX2LbjoPpi1pQzks_J-SJfx2+aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Yash.Shinde@windriver.com, 
	openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 21:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203864

On Tue, Aug 27, 2024 at 10:16=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Tue, 27 Aug 2024 at 18:25, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On Tue, 27 Aug 2024 at 18:23, Alexander Kanavin via
> > lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org=
>
> > wrote:
> > > I just reproduced this on autobuilder's alma9 in a private build
> > > without sstate. I don't have any immediate ideas on where to start
> > > looking into it, but I left the build in place, so if any of you can
> > > suggest experiments or things to look at, I'd be glad to help.
> >
> > Oh, and I immediately got an idea after hitting 'send' :)
> >
> > [akanavin@alma9-ty-2 build]$ gcc --version
> > gcc (GCC) 11.4.1 20231218 (Red Hat 11.4.1-3)
> >
> > I'm going to try again, with buildtools-tarball. It may be that red
> > hat compiler is 'too old' anymore for rust.
>
> ... and this worked. So the easiest way out is to update alma9 config
> to use buildtools.

OE/Poky compiler is built with --enable-default-pie and that will pass
-pie option implicitly whenever it is invoked. Perhaps
default system compiler on alma9 is not.
zlib crate seems to perhaps ignore the option or maybe its missing a
place to add -pie to its build options, whereas the
consumer of it is trying to build PIE executables. If we use
buildtools compiler then it will surely get that consistent but it
will also hide the issue at hand.

>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203858): https://lists.openembedded.org/g/openembedde=
d-core/message/203858
> Mute This Topic: https://lists.openembedded.org/mt/108090372/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

