Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE39FC48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 18:10:50 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.3993.1708107042699154369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 10:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U21Q6n+s;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso2095546a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708107042; x=1708711842; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbVm2yssZYciW8W4qrOF9SRADAh9q/zvmCL5GDb0yoc=;
        b=U21Q6n+s/Or+5yfUVpw+c7WX3mSgTwSjByLv2ciFRkXGTpdCwNVxHVglr1t8hUziHK
         MvutJzZOj6lbgScGYBRyeVRZFdPjPyII1G1xoYm0WSX+E8POHGt7ad+7C2Vub15omZSW
         affacZaN8Uh7LGIIDd2IHtCrf+YGOr8UL4AAkAmbb+T6YMc2sxR9UIP9oJ5pvOLn/1ZU
         LiucD/mjfo/ZVHC1dNsOLIUVhvRnsRoEr92s+eEd7awql0nqZBxdtSAYccbQhMXKnh68
         eiLx9BD31jnCrAQyd2Vk8C0NFGPtqatnyJHMPgsdsbATrMXNre0+LssToW74EYy6BmoN
         wH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708107042; x=1708711842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbVm2yssZYciW8W4qrOF9SRADAh9q/zvmCL5GDb0yoc=;
        b=dfxIuNwoVWsACTyuu6ZAvVxsMjnAucch027CzyLOUGrkYnufaby3HZw0HTEl3Kijtf
         EcI0YknrMOp9wrAtLHGEY0wU6d4LydrEbHPBY8uceWbWry8lfXh70udwwpfIl6zYxp5L
         cGRySuwdg0xWxDe7kc5ODPHtoC62ZW56vBMWE4rghov2yLPkOHMrziDFpvqTi2AX+trE
         mC5+nYlxzp8UkK4vvEkWCNzhAMe/+n7FHYZFBmQe7h7xQLjZobBJAOCrUtSuwJk4UVpv
         63z7AJQ7pxJx69n1yTQbJa3QUr3RoZ48Z0WaihP98+E5u1g9tVmH/fby+XOLAus1FK9c
         ej0g==
X-Forwarded-Encrypted: i=1; AJvYcCXBOFjTL8RftrLmmDcG4AOr3l0seFXuDfz3AONmZ3ehpRn4VVkX4bLWXnyHQDaAX0mutJJat3zL75rBwk2u2mHHdax9xinEcOdOnfDqHFt7obacdpsWP8Fw
X-Gm-Message-State: AOJu0YwAkR5jBL/peisZBEkjnpGz8qiiuWlP1ELoCSzzKB7SMcTbjYhq
	uKHr7oM8D5ZC6SNR1BLJbZTtppQOyBap08tQMnb8z4l+qRmM04F2ZBP599/nx+E1cI5aTHRiKYB
	I7JUkbT1oqB0Pf7yJ9tSFMb1DkuA=
X-Google-Smtp-Source: AGHT+IEIZbrKo2j/y3UNC3nyDPIFd3SpHfSLG9wKykxIXaiiyZlJypKMyGtWlrQBdecxRKPlHQzXNOKZRo/Fs8F5Wqw=
X-Received: by 2002:a17:90b:20c:b0:299:3b7b:abac with SMTP id
 fy12-20020a17090b020c00b002993b7babacmr1582990pjb.7.1708107042070; Fri, 16
 Feb 2024 10:10:42 -0800 (PST)
MIME-Version: 1.0
References: <PAXPR10MB5541F7BBD51B807EF3A1634EA84C2@PAXPR10MB5541.EURPRD10.PROD.OUTLOOK.COM>
 <2dee65ad9c885772ddcfd2d7cb58a7b24bc97c07.camel@linuxfoundation.org>
In-Reply-To: <2dee65ad9c885772ddcfd2d7cb58a7b24bc97c07.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 16 Feb 2024 13:10:29 -0500
Message-ID: <CADkTA4NF5t=fc-JbMixgs36bj7+G_PO1sDoQhqbiC2RM0vN9iQ@mail.gmail.com>
Subject: Re: [OE-core] linux-yocto: Enable goldfish RTC for qemuriscv
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Konrad Weihmann <kweihmann@outlook.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <Khem_Raj@comcast.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 18:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195791

On Fri, Feb 16, 2024 at 1:07=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2024-02-16 at 18:29 +0100, Konrad Weihmann wrote:
> > I disagree with the proposed change, as this is unconditional, even
> > though the commit message claims otherwise.
> > It would be better to have it limited to qemuriscv as the commit
> > message
> > proposes.
> >
> > Fun fact: I can't find this message on the web interface of
> > https://lists.openembedded.org/g/openembedded-core
>
> The change was not posted as it isn't how we plan to finally fix this.
> It is just a patch that Khem/I are using to verify whether this fixes
> the issue or not. It is only in master-next and will not merge to
> master.
>
> Bruce (cc'd) has a patch for the proper kernel config fragment change
> from Khem which I'm hoping we can quickly waterfall in to address this
> properly.

Indeed yes.

I'm doing kernel merges and testing over the next few hours and will
send SRCREV bumps shortly there after.

Bruce

>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

