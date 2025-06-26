Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF3AC77B7F
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 07:11:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.2723.1750921894224529651
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 00:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NV6O2/Gt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453634d8609so4189045e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750921892; x=1751526692; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YAPyk9K0EQbly1Y5DbQJxGn1odwCHCpXeRSqUHWpJeQ=;
        b=NV6O2/GtWRDcoC5LFdNJv7BOAa/yRTW3SJMIP5XTf5b+/7JcnVZeBB03hOMPXaBl09
         h82QCDqPSJkZcE74lwFsPKdr+OxagbKeSiHnJgbBS2DgnhPK4nG2AF6mjluJDMSkl/tN
         ol/j6fDp++t8cNPOylGqrK/UzjzB3NrjUPGgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750921892; x=1751526692;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YAPyk9K0EQbly1Y5DbQJxGn1odwCHCpXeRSqUHWpJeQ=;
        b=gwkDH0y7XVEqYOOvEU3etyowKLRPrSfqNqagfFtYETe4p3zEX+Hn7qO0jb60dB8YOR
         I81/sIgxLYlGAMTKPm8izmnpR5PbWmzV0wfuOF+MZm9kWOXuVdyzAurH/WRlpEf/tXdS
         Un77GlYye4/fOwzVEtmzZGXwrQgoL9v8gvgovQh80BtIlzfBitMvPOJ3YzTtmoXQGhEC
         PpIIfSQ2xp0EaTcmC25JI9webx2hLd5OCbSWAvf9Ex99eznKHTT9engomIFp5JxJqXi4
         TOCjcZ52XNA/jA5ECC/siuTbJqzB0/UaNidXanBYunpR1DmHXAyqnGFeUFEtlSxBQ4ST
         vUog==
X-Gm-Message-State: AOJu0Yyly0ZHWAa0TSVSiUKv0o2XT2RjsonVwmqMACcjLdcYIxI+B+iK
	A8KYkaZZUq/HS7w1Sffdfe0tPEFXG1cqGjHRWNptxlbc1pnLOSoBaenb2H//N3OA4Kc=
X-Gm-Gg: ASbGnctdUHYuv3GvjO0UQ4q9b7wAGZPAWKDKB0V+pBwucF4Fd9MPvEz+5C6WHz1W2bU
	9j6WL3/7phUGWbmjHWHK4VD/pyjop5W2pUfNgVn6kez15JRYGUlXL6oPTo68wheJxq4BVVj9iuc
	8kIj/UEfDM93SVbuWCN0O1YhHMo5J9Ih7ptkqbKa477bXz4JAKtegemB9UT6vWhG3xTcbGXjCwU
	AEPynzxGAyzlFcg35pLJZU6HJMK8MSuuP+R+f7S86Pf2ZAK1maiJIqAJgO8nRGUVING7NXKhnkR
	O2d9NccKgGS6V46Edr6hO4dEKOcnyj1aicVd2OCuNtjVi7H3XH6WYCR8oHMwe0vQWdP93BiDX7S
	MhelKX6IkwdvQFe9vbhPMQ49i+RFn/Wyykz+Pi837LwaoaeDIabA=
X-Google-Smtp-Source: AGHT+IFmb448ZUDmDhP3UCSeX8zYN4RN2fbDnGSs/2myruWt2tD9D0FOwv8nmRmwkGbxHNQtH/QXJw==
X-Received: by 2002:a05:600c:35c9:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-453886d53d9mr25595485e9.2.1750921892590;
        Thu, 26 Jun 2025 00:11:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3006:882d:8520:75c1? ([2001:8b0:aba:5f3c:3006:882d:8520:75c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm40003995e9.11.2025.06.26.00.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 00:11:31 -0700 (PDT)
Message-ID: <cf97cef36e9f78904b09bc88599ec2d21456bcb5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ninja: upgrade 1.12.1 -> 1.13.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jun 2025 08:11:30 +0100
In-Reply-To: <CANNYZj_YaUGy9ZXN+MpH-X2v0ZORT2eonYAnDVxxpkKmbyUGXA@mail.gmail.com>
References: <20250626002130.791664-1-Randy.MacLeod@windriver.com>
	 <CANNYZj_YaUGy9ZXN+MpH-X2v0ZORT2eonYAnDVxxpkKmbyUGXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 07:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219339

On Thu, 2025-06-26 at 07:13 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> On Thu, 26 Jun 2025 at 02:21, Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> > -SRCREV =3D "2daa09ba270b0a43e1929d29b073348aa985dfaa"
> > +SRCREV =3D "b4d51f6ed5bed09dd2b70324df0d9cb4ecad2638"
> >=20
> > =C2=A0SRC_URI =3D "git://github.com/ninja-
> > build/ninja.git;branch=3Drelease;protocol=3Dhttps"
>=20
> tag=3D... should be added here at the same time.

FWIW after the patch on the bitbake list, we could just go through and
update the exiting urls too...

Cheers,

Richard

