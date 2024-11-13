Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91885D42BBF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 13:29:01 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.11323.1731504536713704209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 05:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CIY9sVoV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f8490856so8004399e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731504535; x=1732109335; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgNokSRUtMI+UX88/cEla2ICY0S5u5ZWHlgn0PKGaG8=;
        b=CIY9sVoVn+z5MtPqo9mByVQrJd6dUQuzaNcMP9ZngUAh/SgIFvXygVfirqiLaukvmq
         Aq5plIeJBlgeUxBtG4AahUSpZMWM+qYUHKpqNHGhECEjoyHwM7iuB6QzY/dBzL81LqU2
         JTvBqMvrc+sFGybk7VY/cuflmX9EPS3J7wsjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504535; x=1732109335;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TgNokSRUtMI+UX88/cEla2ICY0S5u5ZWHlgn0PKGaG8=;
        b=kJgHTrkx8YI9rTfwXVYr3Ky1GhEga8AMBaVq1wAYjQHVLbbbqb0u4/i9nNHWBUjHsG
         MpGn68PUtBGfw8Ai4QnDLZXqVdsBelMa05g0IwYCq3sjbm3IYZcqqgZrpvRCFf+xjVLR
         s6CvJ5lFPPSuOdTktXjC09JIHpoe9QGii6PQPR7jNha6IytCzTdBvhSO44h7R2ycxDqH
         2g32MGoz42Sv8JQ8Y4gl21wo+U3gLGba8o/0qR4L/PrMDSZGCXgCUwZqjCwAQHjjyRJ2
         JUri7peMB4YY5RGzO/g+ZH4NPIfGJPXg8j+fUMM09mLnW8EpH2cXVpS8NTld2KFPalDf
         mscQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk5BF1OpATHG0cBcmNbKPww5lNMGNQLYeMxbT5kfM5Q1s3kug/EBpnT/P8m4gfQf1xuCykkbbU1mncZuCF/wQQnw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwfRooygA3mG3ovxMLdq/BUUHr6zvu52R+WhEQqdC5dFNi9R5T
	xFLChacMW/Tj9yrkWUghWYM2FcQmYtAkxC6oNlnxnLbH3QZdjdZJJdl9vAndsck=
X-Google-Smtp-Source: AGHT+IGZ5AM1769yW8+b+pBfeQ078ccZhSLVaVSOC6nEsNWcMdbKG/FhrDLRBPrtMWJRV9in9c6ksg==
X-Received: by 2002:a05:6512:3d19:b0:539:896e:46c9 with SMTP id 2adb3069b0e04-53d9fedddf4mr1500818e87.45.1731504534641;
        Wed, 13 Nov 2024 05:28:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ab73:49b3:d413:b355? ([2001:8b0:aba:5f3c:ab73:49b3:d413:b355])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5505191sm24768955e9.21.2024.11.13.05.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 05:28:54 -0800 (PST)
Message-ID: <41a56a5b45abc5211b1d96fa236d59aa558bb489.camel@linuxfoundation.org>
Subject: Re: [OE-core] PREMIRRORS ordering seem wrong?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2024 13:28:53 +0000
In-Reply-To: <32aa4b12e3bafb565ddd362f1abbb67b6767d59a.camel@infinera.com>
References: <5e358010917ca8fd59bd2d31bdcc12adac6ed478.camel@infinera.com>
		 <d2d018af97eb31eccef77e18c991cc4e689e4549.camel@linuxfoundation.org>
	 <32aa4b12e3bafb565ddd362f1abbb67b6767d59a.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 13:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207103

On Wed, 2024-11-13 at 13:22 +0000, Joakim Tjernlund wrote:
> On Wed, 2024-11-13 at 12:49 +0000, Richard Purdie wrote:
> > On Wed, 2024-11-13 at 10:30 +0000, Joakim Tjernlund via
> > lists.openembedded.org wrote:
> > > I have set:
> > > INHERIT +=3D "own-mirrors"
> > > PREMIRRORS:prepend =3D "my git pre mirror expr."
> > >=20
> > > looking at:
> > > =C2=A0bitbake -e my-image | grep PREMIRRORS=3D
> > > I see that "my git pre mirror expr." is last in PREMIRRORS
> > > variable,
> > > that seems wrong?
> > >=20
> > > To me "my git pre mirror expr." should be before the entries
> > > added by
> > > own-mirrors
> >=20
> > INHERIT in conf files is deferred and not immediately processed.
> > =C2=A0
>=20
> OK, that seems to support my findings as own-mirrors also does
> PREMIRRORS:prepend and that
> puts my own PREMIRRORS:prepend =3D "my git pre mirror expr." last in
> PREMIRRORS
>=20
> It that how it should be?

INHERIT has always been handled at the end of "conf file" parsing so
that isn't a bug.

The fact own-mirrors uses prepend is also as it has been for a long
time. Things are behaving as expected, the only question would be if
own-mirrors should do something differently but that could break other
users :/

Cheers,

Richard

