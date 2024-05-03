Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A92C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 10:49:37 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.9608.1714733371206531045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 03:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MML/NxZ/;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2db13ca0363so143847871fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714733369; x=1715338169; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBwo471EtPP3T+ECIcQtFsy9lzx6/pq3ps8QcM17cMo=;
        b=MML/NxZ/+L7o4pUmxQtVcrAwLEC8HHiZB0a2Zn7j6g0eXPK91rBLuhu0toFP/wKR9O
         ffk4vHhxkEsNMLRZ1L41SU223absDET0cDBiQ5oMX+2uHG4YIe+w1GCBpZWOVe004E+I
         VqZgVjFTrQLk2nzi+f5xhayYrF8ukxUwPyNY5OvxCoAMg0gugwp9LhM0QAbKlDyqBnS7
         Joh+KflaBjyzMubowyF1G2QVNTgLxtKNWS0oISu9uaVhe6LJ9LeKItOOoOT4O8ylEjwG
         fiBQPgKVEEQrYrOJW29tVlJYg3CkyB9lcjFtKmSgLyqmkxszZHvb7BjuKLHyKxMh5jdU
         qZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714733369; x=1715338169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBwo471EtPP3T+ECIcQtFsy9lzx6/pq3ps8QcM17cMo=;
        b=tLnd1k9Pe8JRrvq5kIZsGbRaNATdYB4K9T9Mqz1EsZGTKYC9+yzgHrbDi5Z1dLrOBW
         hpH2nBg4n34exUAJjZmHZsWaqWPkz8Vl4/5dqHTNoN0wPiTMg1rayZuiLRuWpS7yzmxK
         +jqyBKnmsYTUifaoAypCDGd1egAOTAa40t/TTSdudTUn1m87/bLtxEEHVdmHye71W5Nk
         +0zO97hPqGHCH8BoVKhFmiCqONNuKdxsHLPQj/DlgJmneIoociOokMACfZZLBLsWfkAE
         zKB782ZRN1BdvxeEOZtVVsRzjqALrDvTOYFIMO76fSWyiMmDCRyMtdqLy4DkiEIVdm9X
         QsHA==
X-Forwarded-Encrypted: i=1; AJvYcCWUgOWQih0dLVP0EzZbWUR/24ZyjwrTG77Sprk6bafzbPL1RH534EjifEn5t50kHbLQQbNSnIaYoKYxEnv8vRUUIpYg+OJYcxWHIFh/6+AKC3yMLI3JgdQg
X-Gm-Message-State: AOJu0YzU+Va2VufRwu0tetUP1Y5br6ZbmgQD5KQXBef3RROwXTszVRt/
	CUGER5r5qcrJTsWzOhqcpJWAxAprPNsz6fXD5unEU2JGm/KBdjvAReNrBT4oCbIp/YJqk8yLaS0
	7+0GBAoqVMysFGrt1MtX6cfJvZsg=
X-Google-Smtp-Source: AGHT+IFOh5qxph/divJvY0SoBXU01o841uluJhVlVGLCYXCA+ZBQm7bHsz/A2/dQr67DB/wytDbZ+MCss9hv5GbS5U0=
X-Received: by 2002:a2e:9bd6:0:b0:2d4:5370:5e8a with SMTP id
 w22-20020a2e9bd6000000b002d453705e8amr1937553ljj.22.1714733369253; Fri, 03
 May 2024 03:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240503102624.594443-1-mikko.rapeli@linaro.org>
 <CANNYZj8RStk4X-HkTp01THZdrtZ+AF3pLoDm6v04TsFKumSVDA@mail.gmail.com>
 <ZjS-QQ1wDTt-lXsc@nuoska> <CA+chaQeXOqrc_UKyYUt=JCiJfJyxDNGSFwn3f9q7mi6NiGA1pw@mail.gmail.com>
 <ZjTAgqXvKuet2hvc@nuoska>
In-Reply-To: <ZjTAgqXvKuet2hvc@nuoska>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 3 May 2024 12:49:17 +0200
Message-ID: <CA+chaQc_i1EAxdY3AiE_6oKFh37SDzyscVqSQxWDUMcPD=k3ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: fix pkg-config file libdir from /usr
 back to /usr/lib
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198975

On Fri, May 3, 2024 at 12:46=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Fri, May 03, 2024 at 12:43:29PM +0200, Martin Jansa wrote:
> > On Fri, May 3, 2024 at 12:37=E2=80=AFPM Mikko Rapeli via
> > lists.openembedded.org
> > <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, May 03, 2024 at 12:32:42PM +0200, Alexander Kanavin wrote:
> > > > I=E2=80=99m sorry, this doesn=E2=80=99t look right. Shouldn=E2=80=
=99t we rather ensure $(LIBDIR) is
> > > > correctly set? Besides, hardcoding to lib is certainly incorrect as=
 it will
> > > > break multilib. We constantly have to fix upstreams in the opposite
> > > > direction.
> > >
> > > Yes, you and Ross on #yocto are right. This is not right. I tried als=
o setting
> > > LIBDIR=3D${BASELIB} in do_install() and do_configure but those did no=
t work
> > > either. openssl builds scripts are quite hard to work with...
> >
> > Isn't it easier to fix tpm2-openssl then?
> >
> > I had similar issue in chip which was using "pkg-config
> > --variable=3Dprefix openssl" and didn't expect it to be empty in "if
> > prefix[-4] =3D=3D '/usr'" and rather patched chip than changing openssl=
.
>
> To me this is a bug/regression in openssl pkg-config since libdir changed
> from /usr/lib to /usr which doesn't work for same use cases anymore.

OK, then it would be appropriate to report and resolve with openssl
upstream, right? Not with Inappropriate .patch :).

