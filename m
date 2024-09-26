Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EAFCDE00D
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:03:27 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.45850.1727363001959732988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 08:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=tF/CYpcp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.47, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5da6865312eso541478eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727363001; x=1727967801; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWSsd+981Nma1h3TzaYxiOd//m4Y/PKOW3/FnRGRDbA=;
        b=tF/CYpcpN43mbn6O/6i2DS45abQWf23N+aWNoTOpqRJuKAvHzh8j2gyCChyvv3LUxY
         hTWF+Zduu5CtSe4kR+kTzbCl9/KQZjAmzpftcVkt2kjCInWqyul4Uq4hzWsU2IsK+uyM
         ujBrliq7KJWeVeJV+6RI2Z1nk0vAzncu8th/C7Nf+izoiL88ADZSsNhT2FB84y2MJQTN
         ViZ5eMjJhro5PxAaUDuD375WYY+CP9zuSG2HRs6c671r+O4kl3IuRXep0ErbxujF9jVZ
         X27PbFb1QG3/65uBwSMnw8HVlURG5udrKCpiQq85J3ijzqiBVsQ80XjqYjJUa+AKyPOh
         MhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727363001; x=1727967801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWSsd+981Nma1h3TzaYxiOd//m4Y/PKOW3/FnRGRDbA=;
        b=YBtYXc/iUTJgncIBZRSAeWJAChFrXb2Eir1gBQWqxJmH69m9x9xyS+eW/VIUAF7iv/
         G7PjHTd9Cw4vQSczD5wc06jf4KAIJXtqqcCRNUqZJmKlJk8YGsg0Zxe3ZeOIgG2uiUVQ
         MWiPsZs5OppS48a6itZ9zkW6NiwR1iYTHCH3bVVXUOVEZRd+0nJJOpioBH1kOrpdSPkd
         dCpXgisIDMNLd9oQEwD2lSHw9iRpRwb0BGgNP1ADlSIwkHh250DLN9WXoV92ErIxNL2J
         dbqsCjcJjutsRo9aMfx9JCNYEMYNJjfNBy8lmdRJhPi1zTDTUS/GsfatodR0RoQvnln1
         1eOA==
X-Gm-Message-State: AOJu0Yz5EoJTutUAKdKjmhkqrwMvHe61shxSjl6RZv3nSlX72ofDsqfo
	jLJRCUZNp6jNzMMYikL7k23crz6WInOmTd1NPn1RdtvIv+7Fiv9b7hj4VoqfwSdAHeavEiE/WZN
	7yR32ciIrebtU/ikRSIIzIGL3E8BWWd/yJR8iuGim6CtoSG0=
X-Google-Smtp-Source: AGHT+IEuOwQwcXtpl9HQtI2QQ0JijYULTxbdc32EC7GYimAK8p5v3oozUMRI6n/3S7fzZ9LIJjWX0VGhBsljeROxOVo=
X-Received: by 2002:a05:6870:1b1a:b0:277:ecd2:7b7 with SMTP id
 586e51a60fabf-287109c9cdamr145903fac.7.1727363000845; Thu, 26 Sep 2024
 08:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240920184135.789227-1-jdmason@kudzu.us> <984F8D25-7B5A-4071-B020-FBF267575ACC@arm.com>
In-Reply-To: <984F8D25-7B5A-4071-B020-FBF267575ACC@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 26 Sep 2024 11:03:09 -0400
Message-ID: <CAPoiz9xNehHDeFnp0qaMYs6tJvsiONtvGTycybwrx2eRMrnZXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] default-distrovars: Have KERNEL_CONSOLE
 reference SERIAL_CONSOLES
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 15:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204990

On Tue, Sep 24, 2024 at 7:35=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
>
>
> > On 20 Sep 2024, at 19:41, Jon Mason via lists.openembedded.org <jdmason=
=3Dkudzu.us@lists.openembedded.org> wrote:
> >
> > --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
> > +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
> > @@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=3Dext4 --l=
abel platform --align 1024
> >
> > part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
> >
> > -bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 co=
nsole=3DttyS0,115200 console=3Dtty0"
> > +bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 co=
nsole=3D${KERNEL_CONSOLE} console=3Dtty0=E2=80=9D
>
> My understanding was the .wks files had to be .wks.in for variable expans=
ion to happen.  Can you confirm that this is actually just an idiom and the=
 expansions happen always?

Always?  No.  Can I confirm it works in my handful of tests?  Yes.

Thanks,
Jon

>
> Ross

