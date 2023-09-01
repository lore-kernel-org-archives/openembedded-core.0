Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFCEDCA0FF6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 21:22:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.6930.1693603327791818861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 14:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DqrT++wV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so2068846f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 14:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693603326; x=1694208126; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ObVA5ncy1sRUL28jvfZAuaqMdZrRzQZOUHLKlS5nAA=;
        b=DqrT++wVsr+Rxe2kY6RyqLVNJpbRYqwM3b2p7p3+KaNCDwL8R0h7I8EB0sVAnthsWG
         nPMUT8otkl1xb9zhQLCb4r+CAOidGP87irXrf7aB1r6kAd/15y0b/YX5NgfYlpKfkB7S
         wR4HNCsJm8eMWWOvVeTJolUKr1wMixr8O7OsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693603326; x=1694208126;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ObVA5ncy1sRUL28jvfZAuaqMdZrRzQZOUHLKlS5nAA=;
        b=Gs0dE+v0I01IBf5zYvpY0YN9fqg+LFEQt1X//VLaZHuZ4AGmBklZ8sBe74Zk51A3CO
         MIILVtclM55iuRdez8j2EoDIryNTxbgB4PA4ZgF0ZYie4xRaM2nRW9kjGCmeEkMmVFTM
         069vf2BRrAXKPHYcXAjklLT3F3dGBHdoRNBmcc+r3xLg3AMtbDxIfMHg7qBfHefwvYOc
         jgiU7FMJu1JUdvm4IaKWwNx0lUVYJteWfh28BLco+ME5HSwkOz00kUhTuDZxZKw2QvcW
         IHiskdRcgnmLPJ99Q9p3N8T0efuxSnBcPUsm81J75Cc1UuKCbVl172sLYLHdvktWQqjx
         47Vw==
X-Gm-Message-State: AOJu0YzHkAHHPS4yvkLaQPrSqMMy5XBtReYMEwHTwpO0OH/6R9j9tIW7
	dJS8pe/CTGB7LQWSiPxWR8Fe+g==
X-Google-Smtp-Source: AGHT+IEWRIuxa5w6AcT5henklq+cBpfTkg6gUkKJ9Jkx8R4M+NjTu2gKZ+ZW/6oJGWAaGO809aYFdw==
X-Received: by 2002:adf:e5c7:0:b0:315:adf3:67db with SMTP id a7-20020adfe5c7000000b00315adf367dbmr3202139wrn.59.1693603326101;
        Fri, 01 Sep 2023 14:22:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bb30:48fe:2031:d024? ([2001:8b0:aba:5f3c:bb30:48fe:2031:d024])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4588000000b003143add4396sm6384651wrq.22.2023.09.01.14.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 14:22:05 -0700 (PDT)
Message-ID: <5c1df1490ce569e7644d33b33b2a44cd42dfc270.camel@linuxfoundation.org>
Subject: Re: [OE-core] rust: why is it built in do_install()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: enrico.scholz@sigma-chemnitz.de, openembedded-core@lists.openembedded.org
Date: Fri, 01 Sep 2023 22:22:04 +0100
In-Reply-To: <lyjzt9g8e8.fsf@ensc-pc.intern.sigma-chemnitz.de>
References: <lyjzt9g8e8.fsf@ensc-pc.intern.sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 21:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187016

On Fri, 2023-09-01 at 18:34 +0200, Enrico Scholz via
lists.openembedded.org wrote:
> Hello,
>=20
> rust recipe does
>=20
> > do_compile () {
> > }
> > =20
> > rust_do_install() {
> >     rust_runx install
> > }
> >=20
> > rust_do_install:class-nativesdk() {
> >     export PSEUDO_UNLOAD=3D1
> >     rust_runx install
> >     rust_runx install clippy
> >     rust_runx install rustfmt
>=20
>=20
> What is the reason to run the expensive "rust_runx" in do_install() and
> not in do_compile().

The reason was probably that was what was found to work in the original
recipe and nobody has had the time/need to improve it.

> This:
>=20
> - is unexpected... do_install is usually expected to run fast
>=20
> - might interfere with different ${PARALLEL_MAKE} and ${PARALLEL_MAKEINST=
}
>   setup
>=20
> - might slow down the build process because the 'class-native' variant
>   seems to run with active 'pseudo'
>=20
>=20
> I guess it is done in this way because of
>=20
> >    config.set("install", "prefix",  e(d.getVar("D") + d.getVar("prefix"=
)))
>=20
> where '${D}' is cleared by do_install.

That would seem likely to be at least one reason.

> Wouldn't it be better to replace this by
>=20
> >    config.set("install", "prefix",  e(d.getVar("B") + '/_install' + d.g=
etVar("prefix")))
>=20
>=20
> > do_compile () {
> >     rust_runx install
> >     rust_runx install clippy
> >     rust_runx install rustfmt
> > }
> >=20
> > rust_do_install() {
> >     cp -a ${B}/_install ${D}
>=20
> ?
>=20
>=20
> [adding 'rustfmt' to 'class-native' would be nice because e.g. 'bindgen'
>  users might expect it]

One potential downside is that "install" would then run outside pseudo
context which may cause problems with permissions. I don't really know
whether that would be an issue or not though in reality.

I'd be happy to see more people working on the rust recipes. The
challenge is the long testing cycles needed. Fancy working on some
patches?

Cheers,

Richard






