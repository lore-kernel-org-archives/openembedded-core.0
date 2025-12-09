Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE54D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:07:32 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7291.1765285649788390911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eQbp/sTD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7633027cb2so884753066b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765285648; x=1765890448; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LYCxmzS+epT7neJHPKytwmAaIa+iSy1dx1YsWnuwyUE=;
        b=eQbp/sTDfmvs9s3Jb42LKX/AkFkjtdoDs+UQ5e90R0qEYgAo8Lr64sb1D50bYK+m8C
         hZ7Hv0bEkHpJW5nP7Y7o4VTUj+C+q4zhR6VkTKEm+gM+5Oaf8RQ8ZW5xVyXg26z2RXWD
         NrNLD08TbLjV9/cMErbm+1H3Bbtt5F7uKVyRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765285648; x=1765890448;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYCxmzS+epT7neJHPKytwmAaIa+iSy1dx1YsWnuwyUE=;
        b=pC7kCNZGQ62E+Wdwo7DUWShP7oUiaf8AVE+qiWxNZaITs9hjIB45L4CRXyOpTbuVe9
         1x9xY+r4jA6jtKFvIejBaKXQKKQB/r0N+DpKJGlBnSFq8MD37E4T+BAIiO99gcz/qNeh
         QjIfw9HWbO7gF+KgPcR1t/1vuDHIFI7hgwRhgTf37WNuNOaW9b8cHfJ6gSY50sUsuwtx
         B1fzl6a561HL3EnvfOymb6rXStxnDkPx9Z6N/n3oHKIDJOwDwzfBm4IBZFXQV0hwhkES
         w8WGU7ivERj7C5/uNKJ3UjKfagar+ozl8dezf5wBnXQlRbWpsbDDxunEmDZ5cfm1Al/p
         gxZw==
X-Forwarded-Encrypted: i=1; AJvYcCX7FwvLF058orD68irnLR5SdE1iRX8pC6Wc0FEkwZBaUqKIFmc+/z1Z5M6w2kTF3o/Or73XD/1N49lI0+eNWVJs2w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoCZM0z9ghyf3pNlsyht1N2i0j27PucNU5SR0hCRs0S/QUx5xT
	mrM84D6ATyY6aq0CDlTV2V0d0QoKJlP9n6A8CnjU/JcaFAOymohUlOQJ2rvmQdNe/UA=
X-Gm-Gg: ASbGncsv3Ee6u7SXhQGubiYe/xlrUQOrzBtjyrvI7hlF9R+WeA6cLZKoGnIdgcmDTuh
	Gi5Ybn3u1yPRBVJWLmWyaEVRXS7vQDHyQhBMZdLu8ZxOU4IA/2K7LtuIPZD7gSuv0uuQY4xopFc
	awkiu1oOsq+7e6qV5AufkE8r7zS9D8eE6Y0VuGLO4k11RnEowsaf7srCBASVadw6NMjIlEz0WLr
	mGIh6ix5jkYqds0TT87EmwFyDdoEMzRIeSR/jGAZlr2MVOATqC9mSvRKt6R2msCZqohGA9dl1NU
	mgwjRhFlF0+8TzR+uaPtLNqXcOIZysvGZmyfzGH8Qvmw/QuU4B+4hcp2fxZ4mi+GkAkZHk05A6i
	SiwfuI2OxCLYL7r30rWbikucqbRpuKFScpyA+iuTfwQkKU48wIjKk1IgDIsPeDubbpqRhN+fZID
	X0SMRmp4O5QqCV5AdNTzI12llat9UNg1Gwhu1yZaipz66d898x/ByDU6TeuYaei88dopv7ibpzR
	nQ=
X-Google-Smtp-Source: AGHT+IHrXh0i69zq7eWeXOFW70y2NVCJ0MUvQcE0Ui+No6kkwWG44+yPua4i/ZTdoq8gIctGxXAoIA==
X-Received: by 2002:a17:907:98a:b0:b79:e99d:913b with SMTP id a640c23a62f3a-b7a247f96acmr1273467466b.54.1765285648028;
        Tue, 09 Dec 2025 05:07:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:31fe:6f5a:7771:4340? ([2001:8b0:aba:5f3c:31fe:6f5a:7771:4340])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7a01a33379sm1219383866b.62.2025.12.09.05.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 05:07:27 -0800 (PST)
Message-ID: <a65db7a8c4cca0cd162e74f57302a038e5935887.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cpio_2.15.bb: delete superfluous ptest
 RDEPENDS on "ptest-runner"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Dec 2025 13:07:26 +0000
In-Reply-To: <CANNYZj9+ms2uySPOy96hgMgy07rF2eUTLMNfKyQaB=zyXOwzSw@mail.gmail.com>
References: <f5199a88-ed0b-0423-3aae-61f882f8e6ca@crashcourse.ca>
	 <e6e064db5ac30f5e711d45b657dfa89f1ad9e2b3.camel@linuxfoundation.org>
	 <CANNYZj9+ms2uySPOy96hgMgy07rF2eUTLMNfKyQaB=zyXOwzSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227435

On Tue, 2025-12-09 at 13:19 +0100, Alexander Kanavin wrote:
> On Tue, 9 Dec 2025 at 13:06, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > =C2=A0DEPENDS:append:class-target =3D "
> > > ${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest-runner', '',
> > > d)}"
> > > =C2=A0PACKAGE_WRITE_DEPS:append:class-target =3D "
> > > ${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest-runner', '',
> > > d)}"
> > >=20
> > > -RDEPENDS:${PN}-ptest +=3D "ptest-runner coreutils"
> > > +RDEPENDS:${PN}-ptest +=3D "coreutils"
> > The reason is this package requires the user from that dependency,
> > it
> > doesn't work without out. That is an RDEPENDS, not a RRECOMMENDS.
> >=20
> > So whilst it isn't too obvious, I'd say the recipe is in fact
> > correct?
>=20
> ptest-runner dependency is set in three different ways as seen above.
> Are all three really necessary for ensuring the ptest user
> requirement
> is fulfilled?

user group dependencies between recipes are tricky to get right and
each of the above pieces does appear to fulfil a specific need. I have
a suspicion that yes, the bits are all needed.

I don't like that 'design' but right now, it is probably where we end
up.

Cheers,

Richard


