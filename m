Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7A3CE7CE6
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 07:52:18 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.75925.1727769130087571582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 00:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/PWFQQ1;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8d0d0aea3cso796114166b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727769128; x=1728373928; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wKtmmqN1uYx+nNDCS+5uQEdQg9GfeHzqWsvSR0H/ImY=;
        b=Y/PWFQQ11YSTmiwaJ3+QNxizOSTcUXXob7g3l8HA+Gfv6n4JtUi3b5OZEbNqCuF8lO
         lsqUCyTDaUa8HxUYd9NJj1Ed1wTmN/hAppFnIO8OKMpPQQ0Lc7OoaxAWK2q0loe7g8KT
         PwC0M/B5bZIabS3jQiACW7NBQ1bu9db9geznnElc2h/NiSnGj2jCLpa3in5STzRxU7j2
         PD0vRe99VFCXTTL7rKf9cy9J8Gurlnez4QqKUH0XQbzgcefYkfjfHgvNjP3zNhn9QP5C
         sVEthll8Z+4cW7UUAl/xJUQtY4M9OpHPmIAmsjX8RXywEOScXcw+W4k2TvAISslRJVtz
         IyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727769128; x=1728373928;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKtmmqN1uYx+nNDCS+5uQEdQg9GfeHzqWsvSR0H/ImY=;
        b=VP7twqTUN3CQcUsi/p2+it41/AmkRtxgnIzGOWFjR/nYJMOqJnwiH7RM9Bw7r/uuTy
         PUhl2UVxqAVlIyIDi5spQxzTW/F7uG9rm5ZQQIDtQ5TvMOomZZsyqx2rMbSoq21zVe6n
         NNl6/c8wzG305yjLuhXy/lbSitJUvpDW0FUGdzpeFerdthX6C85R4TRSwxzVKYkYQZOH
         XA5CrCF1idalxiCGknrLzisOjSrL7g61i4EVAz1vckw/isMqmECgJZ05KlBS4Y1Di6Ls
         QpgwU6XoIp36OhDraimfwKUXhVm9Hm7I79XwEc7RmgixCwkk2n/f+y32l+osBMytK462
         BXOA==
X-Gm-Message-State: AOJu0YwBXr0D/kYSiM2UGpgkTEbItZQOlQNwlTiF+02LLiLN7eQU6Ik3
	um7l8TUfE70fLcy7jihdik/zpKA0TBRbcBq/nt4Q96btxtGPBNfb
X-Google-Smtp-Source: AGHT+IGheLBnxAcOzP02/f4rzV33PBYzVqx/HoN2YODrPz2uwnCqUvHFIHz9Np5zHuXnBkOigOyYdw==
X-Received: by 2002:a17:907:6d15:b0:a91:158c:8057 with SMTP id a640c23a62f3a-a93c4aeb8bbmr1602579466b.54.1727769128250;
        Tue, 01 Oct 2024 00:52:08 -0700 (PDT)
Received: from [10.9.136.49] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299ac60sm663547366b.221.2024.10.01.00.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:52:07 -0700 (PDT)
Message-ID: <e71402304dc8ca3e5e6fca4ad0e3a554b3a58438.camel@gmail.com>
Subject: Re: [OE-core] [master][scarthgap][PATCH v2] lib/oe/package-manager:
 return early in install_complementary with empty globs
From: claus.stovgaard@gmail.com
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Oct 2024 09:52:06 +0200
In-Reply-To: <409E410E-1DE7-4294-898A-AF1841D6C3A4@arm.com>
References: <20240926204001.2245184-1-claus.stovgaard@gmail.com>
	 <409E410E-1DE7-4294-898A-AF1841D6C3A4@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 07:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205133

On Mon, 2024-09-30 at 12:33 +0000, Ross Burton wrote:
> On 26 Sep 2024, at 21:40, Claus Stovgaard via lists.openembedded.org
> <claus.stovgaard=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> > Return early when globs is either None or an empty string. If globs
> > is
> > an empty string from the self.d.getVar, we should skip the reset of
> > install_complementary, as the result from processing with empty
> > glob in
> > oe-pkgdata-util will always be 0 packages to install.
>=20
> This isn=E2=80=99t right: if the globs are empty then we can skip the
> processing of the globs, but this function also contains the locale
> archive generation which is then skipped.
>=20

Oh yes - you are correct. I focused to much on the top part, and the
with loop, so somehow it slipped. Nicely catch.

I see 3 options.

1) drop this patch, and keep doing the extra work.

2) invert the condition and move the with loop in under this condition

3) split the archiving out in seperate method, and then call it after
install_complementary the places where install_complementary is called
from. This option is what I belive you refering to below.

What do you think is the best options?

/Claus


> Ideally this function is tidied up a little as locale archive
> generation isn=E2=80=99t really related to complementary installation.
>=20
> Ross


