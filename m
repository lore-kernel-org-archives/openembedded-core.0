Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB6BE6F08E
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 12:45:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.100006.1766493906508402938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 04:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fV+rkKkr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so36248075e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 04:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1766493905; x=1767098705; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NjQIG+9JWLXM/EbMYBBPhc051AIpTRs6z7KrLxMvx1o=;
        b=fV+rkKkr+EM8pIheZ8869mfDeErh5cYEg76BBq9fQCWoOtjFtuTSHetxnmVI7IFTda
         DaZJpAmTrPzjn4DkqBiuWKfg+jQVkHmufm3tIDCE4ZDBdOBnanyR+vTAQRQ8VNhgTG9J
         Gxk5ba+WEgejzYZLoQlsgCrIJIlBBpLD5T0sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493905; x=1767098705;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjQIG+9JWLXM/EbMYBBPhc051AIpTRs6z7KrLxMvx1o=;
        b=Xnw35itOzwf3ksesrdmV0olC+4Krb3BxJOObknHUb+I13KTrO5774vgh/JaiYiBo2y
         7u+n1GbgMJS2Ew1CuiQLEg8dnSIPmpT3zbxwaSuYEiTLys1XDYbPTcmfsIZ8vvVTKVGM
         GxHD2mBk7I6rUPrNLClBbyN+OjBWJZ6IymlrluVFaDgAH10jA+rXxPNZn1eYW1NOBXht
         U6JNqgLkKuNlPsMmcd1zrF4gslFkSZRfHpRVlfY0o5pkVAQnHuaDdhmIlqcy6kiULWBL
         h1/DjfWLHF0cgMyXuYJ6eRelmEOhRfox9EbHEcEhBOuSttvLfn+d/ezqFWRx7VCLxP1c
         HB7w==
X-Gm-Message-State: AOJu0Yxt4MF1GVJuzUPpp8SqC5u8legKIeYBgAdSvcrdPYTgfYpLAxrs
	fCfRpwGKLXDQxCp6WNxkAyffBxHqOMx0KV0CfOP02aSb75weIPnY/ZJ5OauYhtIU60Y=
X-Gm-Gg: AY/fxX4AvyAVgd+ykzPXg8slRYdThW5InHDajwBQxXZKtN7tdb+kO/7TZ7JV9C6BmsP
	NA5mPZJN9OrWRauCthZ2e2DtD7YvISwvQ8qUfKWW4lSzAIzQYA7amBmQcQT25SreZbZTf93P0tw
	nA6PMlOAaWf6e5rrx96pthh4X8ASj3TtZvhrIPx+sYROSwgiSIk9lubHE7KqlzJoPneeyEA/ctC
	+ehnzGlsLZyhx1e2yAQBW8foDJ6343NzHGOnZKxj46KC0B52Ohh4EtA2yXSVAQKuE82TiKbgyfe
	VzWMdzhJmBVCFCgw+BgQjGPVWy93ptPW9EkCWcD62pi2JDTigfioBIMZ7JYlzGdrUCg8bhIQUbG
	S47l68GOOBsyaLcb5WG3wHpZhJOO3HdZjz+40OWmZKn7kQHbNVCZivxpx5JQWicBfm5PbhfNbuJ
	VouOjQUpRMw0nntHGjkgjp+rkeyct1m9AsTIKbY4bISanO+IHtIwLTa+3CifxsjS4S0LD5b/hSM
	B8=
X-Google-Smtp-Source: AGHT+IGhORom+Iwe9m6fscegMwvXRiTNiCU/ua62oP2WNRKUeasnA4tL0lVT8igbP4Ixs0kLJIMUDA==
X-Received: by 2002:a05:600c:4fc4:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-47d1955b392mr150137035e9.5.1766493904799;
        Tue, 23 Dec 2025 04:45:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fbe8:fa2e:dc4c:3e42? ([2001:8b0:aba:5f3c:fbe8:fa2e:dc4c:3e42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm15141191f8f.21.2025.12.23.04.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:45:04 -0800 (PST)
Message-ID: <fe02c529dee3b548177d158746f2748eba74f071.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/21] linux-yocto: combined and consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Jon Mason <Jon.Mason@arm.com>,
  Ross Burton <ross.burton@arm.com>
Date: Tue, 23 Dec 2025 12:45:03 +0000
In-Reply-To: <CADkTA4OCyZUO5ASTEi+i7iyhYD9Zp8byzYOa+4UBLfGt2w+xnA@mail.gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
	 <5044d0ec483159af764bfd2b51baf08e6410ec8e.camel@linuxfoundation.org>
	 <CADkTA4OCyZUO5ASTEi+i7iyhYD9Zp8byzYOa+4UBLfGt2w+xnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 12:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228467

On Mon, 2025-12-22 at 22:34 -0500, Bruce Ashfield wrote:
> On Mon, Dec 22, 2025 at 9:13=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Hi Bruce,
> >=20
> > On Thu, 2025-12-18 at 15:22 -0500, bruce.ashfield@gmail.com=C2=A0wrote:
> > > As discussed in the weekly engineering call, I'm sending this as
> > > single series even though it crossed boundaries of the repositories.
> > >=20
> > > I don't have access to meta-yocto-contrib yet, so I haven't pushed
> > > the component parts to contrib branches yet, but will do that for
> > > future pull requests.
> > >=20
> > > I'm using this as a first run through some things I've cooked up
> > > to coordinate the patches across the repos. The formatting is my
> > > own, so apologies if it isn't clear .. and we'll see if it all
> > >=20
> > > Now to the series for OE-core:
> > >=20
> > > =C2=A0- We have stable updates to 6.12
> > > =C2=A0- A kern-tools fix
> > > =C2=A0- Updates to 6.17
> > > =C2=A0- Removal of 6.17
> > > =C2=A0- Introduction of 6.18
> > > =C2=A0- Bump to libc-headers to 6.18
> > >=20
> > > I've built and booted what I can locally, and I know that the
> > > major architectures work, and are functional with respect to
> > > core features.
> > >=20
> > > I have more libc-headers testing running against meta-oe and
> > > muslc, so there may be some breakage there and I'll help deal
> > > with that if it happens.
> > >=20
> > > The update and then removal of 6.17 is on purpose. In case any
> > > one was using it, they should get the latest tested before it
> > > starts to be removed.
> > >=20
> > > For meta-yocto:
> > >=20
> > > =C2=A0 - removal of any remaining 6.17 references
> > > =C2=A0 - introduction of 6.18
> > >=20
> > > The meta-yocto default changes are obviously REALLY RFC/RFT
> > > there will be issues, but I've provided them anyway to make it
> > > clear that we are going to 6.18 as the new default for all the
> > > variants.
> > >=20
> > > Once we get 6.18 fully green and the h/w references udpated,
> > > I'll remove 6.12 and 6.16 from master. That isn't in this series
> > > by design.
> >=20
> > I ran this through some testing and it isn't straight forward.
> >=20
>=20
> Back online after a 10 hour drive!
>=20
> > We need a newer strace with the newer kernel so I queued that patch
> > from Robert. That caused ptest failures so I disabled the failing bpf
> > strace ptests.
>=20
> ok. I'll ignore strace and assume that bump will handle it.
>=20
> >=20
> > ltp failed to compile so I backported a patch to fix that.
> >=20
>=20
> ack'd
>=20
> > We still have a cryptodev-module failure:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2922
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2897
> > (all world builds I think)
>=20
> I can handle this one, it'll be.a day or so, but I also haven't checked
> the=C2=A0 autoupdate list yet to see if this is in it. I'll check the lis=
ts before
> I start and see if anyone else has an update in flight.

I'd tried the srcrev change on master next and it worked. I've taked
your patch, thanks!

> > and an initramfs module space problem:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2931
>=20
> And a config warning (easy for me to fix).'
>=20
> For the space. Is it only genericarm64 that we do this test on ?=C2=A0 It
> could either e normal kernel size increases, or it could be all the work
> that has been done in genericarm64's config that has causes this.
>=20
> If it is normal kernel, then I can have a look for something obvious,
> and then we can increase the size. If it is only genericarm64, then
> we should get Mikko's opinion on what might be options we could
> tweak to reduce the size.

I don't want to break things too badly given it is the holidays but I
do want to keep patches moving. I've therefore taken most of your
series except the bits making the default 6.18.

This gets us on the new point releases, bumps the CVE info, drops 6.17
and adds 6.18 for testing along with switching to the 6.18 headers.

I included the cryptodev-module tweak, the ltp fix, the strace fixes
and a tweak to increase the initramfs size by 20MB.

The initramfs issue is genericarm64 specific and Mikko was in favour of
increasing the initramfs size. I am a bit worried about the size issues
there but that is a bigger issue to think about at a different time.

This does leave genericarm64 kernel config warnings:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/2902
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2933

meta-arm failures:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/2786

meta-virt failures:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/2761

as the issues we need to resolve before we change the default to 6.18.
Hopefully a sensible compromise for the holidays! :)

Cheers,

Richard





