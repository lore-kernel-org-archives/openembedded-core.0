Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899C510775E8
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:55:15 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19237.1773852905155177326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 09:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ayrBkU5C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486b9675d36so641855e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773852903; x=1774457703; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnpGhbzY+Z69aoOJ+HysXyhc3t4xLvZ8rc4K+2ybFKk=;
        b=ayrBkU5CVDY/WlqXoDxZXBq81wYuGRxzUfyTnAAPjVDno0dZy676MxN/ItRTNZNoqP
         6CmauWaS7U4iekn9A37NrAKGVNhOqips4oPcBzGJzEXn4artNp3wSsGLqoaKez6pSBiC
         RKxn4J3IQEndGvaTOPHKiQwbls/j4f9nh0a7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773852903; x=1774457703;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnpGhbzY+Z69aoOJ+HysXyhc3t4xLvZ8rc4K+2ybFKk=;
        b=Qb0bYwFA7DvYOk8INb1ytXuJMYw4aVtv7yAD0KlrM13yGa4s1I4qnInPdBHdgJlawU
         FCleHmUSrofJ8uFvVblhyXTbq8Elaxskn3Q7PmkS2CJXfVcW4DTuNo3i/iv0Mae46kHv
         j7LZYEqqilLY0IcH3SRkxBUwtyDric/pQ3cCB/S3qYlW9w/TJ+HEGoHFmcog9vGBI4B1
         gyZnY6OIqC8HRivxjzUKyOL6LGX3ueJJiWUJyDri735Hftw8RnVuYNHzLmLwoetSxb8j
         Et9zL0SdPr/j+MdfLKMJEtuSNCxCaFBeTYI3q/7k5qlrcCJuPLIu81v5d04Q8KvIziF6
         TdRw==
X-Forwarded-Encrypted: i=1; AJvYcCXqq0oO74f49Osn6jr+D/INPR8Sv4/7xwWzoWTX8LddNND4lzIytAfzCiCo45T4b1+QTc+QgiL7JqTZYKPistZtIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1XkNF9Dh6PookI10LG7LQVmnGa6Pffx1M9tpUqN2H+k0AH+2f
	9wRd/fLEVt8X5tq/IHZPZmQBfK5b9SZioyQG3jN6kx6LxgsbvQqHXVoZTX7oR7UjoXw=
X-Gm-Gg: ATEYQzymuoKgnv8TPHtBAyhPamfvnlEFX4p5RuzkK1XcWJBP4NZRxWLuZutJKxBVIOQ
	zqYpWBegeImaLIVLkUFcpffCpnnXrXq/jSGRDXccHrvaX6Y5ntch80ncbArIkVfjDgHqg7+aOz6
	8te54YjheJ9Zjqz18ecrACoc7no2NSYqsxxqaZiXJyAK3xLogJrM2o51y32pd1P3gHWglwcK9o0
	XhUE6hVfMzEx816kqQ3PhCmWU0QIwXzSRvBhJrjiMJXu7KTnJGZm6sWwXJALXPNuLqzsQWs5dzT
	cF6nvUFKEUGhQFhXxuc/DKph6Ea4beT8y0qP9Fp1ek8FH5J0VGwTUod3cV0dG/c+cBNJDQbhXiB
	mm2wccYKeTxln+74kIidw9XduGs/2bEoe4P2jJtcSqe9TtYQxHsK9yitmhFRAgXUKmHxYcR4HE0
	vGYn/Ad2+/8MoXfOXXN7l7eaCZCcfQtlbvHKSwvBLV9bM2ifGFSs5VLh00AkINyuQAKD++Yz6G4
	8AJTfOWoSm6EojJBZjnPzaQWg==
X-Received: by 2002:a05:600c:4e46:b0:485:3c8f:e4c5 with SMTP id 5b1f17b1804b1-486f44485b3mr64345825e9.17.1773852903368;
        Wed, 18 Mar 2026 09:55:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c5d8:efeb:ae8c:c686? ([2001:8b0:aba:5f3c:c5d8:efeb:ae8c:c686])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0bc58sm7402875e9.3.2026.03.18.09.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:55:02 -0700 (PDT)
Message-ID: <d17f26cf2f1ee24072c836c84b6ab8cc4e7dd79d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [openembedded-core][scarthgap][PATCH] tcp-wrappers:
 extend recipe for native/nativesdk builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yoann.congal@smile.fr, deeratho@cisco.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2026 16:55:01 +0000
In-Reply-To: <DH62AM0LD7ST.12CQ28MWFWBFR@smile.fr>
References: <20260309145640.3432992-1-deeratho@cisco.com>
	 <DH62AM0LD7ST.12CQ28MWFWBFR@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 16:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233416

On Wed, 2026-03-18 at 17:51 +0100, Yoann Congal via lists.openembedded.org =
wrote:
> On Mon Mar 9, 2026 at 3:56 PM CET, Deepak Rathore via lists.openembedded.=
org wrote:
> > From: Deepak Rathore <deeratho@cisco.com>
> >=20
> > Some SDK dependency chains require tcp-wrappers to be available
> > as host/SDK artifacts. The current metadata only partially provides thi=
s,
> > which can lead to dependency resolution failures when this recipe is pu=
lled
> > into SDK-oriented builds.
> >=20
> > This change does not alter target package behavior; it only enables req=
uired
> > native/nativesdk variants for build and SDK integration paths.
> >=20
> > Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> >=20
> > diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/m=
eta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> > index bcd1d6f792..26eaeab1ac 100644
> > --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> > +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> > @@ -132,3 +132,4 @@ do_install () {
> > =C2=A0}
> > =C2=A0
> > =C2=A0FILES:${PN} +=3D "${sysconfdir}/hosts.allow ${sysconfdir}/hosts.d=
eny"
> > +BBCLASSEXTEND =3D "native nativesdk"
>=20
> That effectively create 2 new recipes tcp-wrappers-native and
> nativesdk-tcp-wrappers. That is not a trivial change that I can take
> without a clear and strong justification.
>=20
> What "dependency resolution failures" did you see?
>=20
> Also, can you check that tcp-wrapper-native builds on Fedora 41? This is
> the scarthgap supported distro with the most recent GCC : gcc-14 (and it
> usually trigger build failures on old/unmaintained packages)
>=20
> Finally, OE-Core master did remove the recipe for it being really
> unmaintained[0]. This is not a good sign :/

The other question that needs to be asked is why would you even need
tcp-wrappers-native? Why are you creating TCP services using the native
tools in a build? It doesn't make any sense.

We've had a flood of these "extend for native/nativesdk" patches and
I'm afraid I'm leaning toward saying no to all of them until we better
understand the actual use cases and make sure this isn't just a random
dependency explosion as people haven't actually thought about the
dependencies.

Cheers,

Richard

