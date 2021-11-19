Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C28C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:35:29 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.7646.1637321727716968646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:35:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EsyKa5MF;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id y12so41425046eda.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=waJpZa3b8dkjhnY77FCYPVIjY0EnSJqV0K8YfQLSoqc=;
        b=EsyKa5MFl6ip3/BLUFUiOYeuLTp1wX4Vw2Iq4/Git84CBS35mekimb/ODSsC/n+fWl
         ZFhCsja4pe7fHR3OckOePk7xO8TlOHcW7XzNIe+f2Bza8frJgWj8H/nYOnsLOdxZMRYU
         dIcH9v33QCYWtBJNTGX80xI8ed4TyseZmPCtaoreTV4HHGVKKzjIlyYPm5HFvfwIJDru
         RVQ3M/wiVXHmckHihWKmwRJUnEDIH+eLM09rmV7/DbMLh7ZGAfbLzaoW/MB1IyOlmfoR
         2ri4uNFHFO/PuLQVxk500UnrmEkMrKDtE6CwvTl7CcySbIb+g+iL8MdFF/XZ1z3pucfk
         XzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=waJpZa3b8dkjhnY77FCYPVIjY0EnSJqV0K8YfQLSoqc=;
        b=Puwyw3WjO3roe9cRCTTFFIU/Omrh1MRJ3bx5yycVKXgHXaQS9QNoavugsT8AHu9v7t
         4u4fWO7XRT4l6bVqs6QmcmA8GUzBoNhX+W8ztagLZiDvKP7I5UHn1x+NGx/W8xqlhbka
         0ycxW1/2Pxk+iUDwrT8rWImpaN7BP/R91Oy76O1314tJP+3wgY+Tc2dNMokdk5bfQ4I1
         VS56/adywe5USTZyeFld/cVxTe9IFM7psVHLUUnbjowRAw5ZtuHGStCfZ03uob6AdQIL
         cEe96V72ggV9KiMN0FObjnDPa+uaXG0/zVzPqrvrnAlco5zupm9DTHl1WGYkjmaEOXC3
         Id2g==
X-Gm-Message-State: AOAM5327+L4BsZcE8d+z9A3+J0HnzB8dAaD3q7RyvffoecnhoRpWVS31
	K3guYnsAJD8epcNfwhtXA2Q=
X-Google-Smtp-Source: 
 ABdhPJyxHCTP1OEHhcMYVqZYQc67AcBMFK5Zl/NpYjKeOYkGl6vYO8NnxRmk2TNxh4lFpdTWT5JV2Q==
X-Received: by 2002:a17:906:730b:: with SMTP id
 di11mr6948720ejc.97.1637321726260;
        Fri, 19 Nov 2021 03:35:26 -0800 (PST)
Received: from ?IPv6:2a01:4b00:f41a:3600:360b:9754:2e3a:c344?
 ([2a01:4b00:f41a:3600:360b:9754:2e3a:c344])
        by smtp.gmail.com with ESMTPSA id
 o12sm1306658edw.84.2021.11.19.03.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:35:25 -0800 (PST)
Message-ID: <65db8b104325c6f7186cdd85adf05f37b85bb3bb.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 1/8] systemd: skip chown when building for
 nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "paul.eggleton@microsoft.com" <paul.eggleton@microsoft.com>
Date: Fri, 19 Nov 2021 11:35:23 +0000
In-Reply-To: <af3e166f53ff47e4e3d007a06d8c26124dbc91f9.camel@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211117123201.111905-2-luca.boccassi@gmail.com>
	 <9151407a13a544628bf14e106277474d@axis.com>
	 <af3e166f53ff47e4e3d007a06d8c26124dbc91f9.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-gwlCuo7tSMu9lndTgpzs"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:35:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158514


--=-gwlCuo7tSMu9lndTgpzs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-11-17 at 18:32 +0000, Luca Boccassi wrote:
> On Wed, 2021-11-17 at 18:14 +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org
> > > <openembedded-core@lists.openembedded.org> On Behalf Of Luca
> > > Bocassi
> > > Sent: den 17 november 2021 13:32
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: paul.eggleton@microsoft.com
> > > Subject: [OE-core] [PATCH 1/8] systemd: skip chown when building
> > > for nativesdk
> > >=20
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >=20
> > > The useradd class is a no-op in the nativesdk case, so chown will
> > > fail.
> > > Skip them.
> > >=20
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > > =C2=A0meta/recipes-core/systemd/systemd_249.5.bb | 10 ++++++++--
> > > =C2=A01 file changed, 8 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-core/systemd/systemd_249.5.bb
> > > b/meta/recipes-core/systemd/systemd_249.5.bb
> > > index 8bdc0ca028..2f019a4b1f 100644
> > > --- a/meta/recipes-core/systemd/systemd_249.5.bb
> > > +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> > > @@ -275,7 +275,10 @@ do_install() {
> > > =C2=A0		# which is expected to be empty.
> > > =C2=A0		rm -rf ${D}${localstatedir}/log
> > > =C2=A0	else
> > > -		chown root:systemd-journal
> > > ${D}${localstatedir}/log/journal
> > > +		# The useradd class is a no-op in the nativesdk
> > > case, so chown will fail
> > > +		if [ "${PN}" !=3D "nativesdk-systemd" ]; then
> >=20
> > If you change that if statement here and below to:
> >=20
> > 		if [ "${PN}" =3D "${BPN}" ]; then
> >=20
> > then it will apply just as well if anyone introduces systemd-native.
>=20
> Thanks, will test that and send a v2 tomorrow if it is all green.

This works, thanks, applied in v2.

--=20
Kind regards,
Luca Boccassi

--=-gwlCuo7tSMu9lndTgpzs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmGXi/sACgkQKGv37813
JB7EXRAAy/yAgj9CEj6HQ6aZli6yV9jtlMxNzMUUGxjPUTzYMes3UIzr9MgR8mAX
HkXQANzkKgNyw2JzHUtti3ATEx1lR+7Sy602kLuRqnP2R36Eq1jJXP7EDTptS9G8
qrks8hKeWCzq1k1JbdAKN5tK3X0Qt41XCKYWZlD5DI5B2wknGud64cooUYWtPFhl
Dno/WalY8/0F8qzEn1NJioSOXxveh6PYYJ6bLzOqKWFwfehtw2Aqw5u6arlicqKr
qhWcp+XI1qScfLTpD2Hlv2D9VRmtjhDoSTHzM9hzobuDDm+q0DKnl78hKyZ+8Of9
n2UrX1UDE4f6DcYf2vrPnb/caNIXFb3kMtkJbGNQrLEcetv3Nfuzuj/ZLG2Rvd+T
Vb0klpSNDciK9SCdG38842R60bd6PJzQlnnnj5g58/CTing3rW6Vlt6r66lbqoxq
hhSjhq6giTXBZiYWdxjgX2Uy08FY2E9anhSGI28bIWw+OwUcecEdu1m9tPzJtwu1
FDUMFKjSqpG47DcR0Kj9TaFkud7+4KL2B/ToLaO0M7B8XfMpBbsDnWBch4/ouB3A
yeX2j492dlUiNYAKms5Uh+INUcP0lcv453jFAoNUBtudPRH9zkKFjv/NfjpxNCYR
at3okLpN1JOCo6g1RkUe4+KhcyS0QIevsbS9zvuFzaZ80Nj6F1E=
=l3Br
-----END PGP SIGNATURE-----

--=-gwlCuo7tSMu9lndTgpzs--


