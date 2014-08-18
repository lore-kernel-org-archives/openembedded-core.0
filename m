Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id AAE6560169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 10:36:16 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id s18so4391923lam.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qIEhjNvhODheGdqguJoryZnWjulk39eabUjIN2+Z0co=;
	b=yH8FfV+9n/l8K5BRqoHv+/kMKVnyQUj//kBhAcazqhop5hNgG6C2RlWzDQXhh95c0e
	4Y1Ps9lZ862vLFkYbPIyxn8sn6w6BWfU+CEu5oSRGDTXunKt7WEHoVeMo3VtVTGh/EIq
	m8hXTXOMNK6tQ/xhAlcl+XGhj3/pntTBg8VR7yAB7AGLbehNipg/1XIQFVxBuNV3uNRi
	akN12vzOfatXjaquVEWwc0LQfvN1TPo/ShNqcpLVS4aCbIxXlkJN9+GrZmxVQ15ZXkA3
	BUc7aRhLdnCpYdfMLTZeD0l9KxmkgyBKC9yFh7VRTUCE9R7gfg47bSLoERLB2qqD1zwC
	rt2A==
X-Received: by 10.152.164.229 with SMTP id yt5mr28671397lab.19.1408358176294; 
	Mon, 18 Aug 2014 03:36:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	tl7sm9514678lbb.9.2014.08.18.03.36.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Aug 2014 03:36:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Aug 2014 12:36:13 +0200
To: "Lewis, Nick" <nick.lewis@usa.g4s.com>
Message-ID: <20140818103613.GK3660@jama>
References: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45E56@GBTWK10E001.Technology.local>
MIME-Version: 1.0
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB927320633FFF45E56@GBTWK10E001.Technology.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: image build with python fails due to missing berkeley db 5.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Aug 2014 10:36:24 -0000
X-Groupsio-MsgNum: 56687
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vJI8q/aziP9idhqk"
Content-Disposition: inline

--vJI8q/aziP9idhqk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2014 at 11:14:08AM +0100, Lewis, Nick wrote:
> My image build on yocto master fails reporting that python-bsddb cannot b=
e installed as no package provides libdb-5.3.so. On examination it is evide=
nt that the "bitbake db" command builds BerkeleyDB 6.0 instead of 5.3
>=20
> As an experiment I temporarily renamed the "recipe-support/db_6.0.30.bb" =
recipe in order to force the "recipe-support/db_5.3.28.bb" recipe to run (I=
 guess there is a proper way to do this with preferred provider but I canno=
t remember how). The db_5.3.28.bb recipe ran but failed on missing include =
"#include <iostream.h>" in tmp/work/cortexa9hf-neon-poky-linux-gnueabi/db/5=
=2E3.28-r0/db-5.3.28/build_unix/db_cxx.h

PREFERRED_VERSION_db =3D "5.3.28"

> As an experiment I added "#define HAVE_CXX_STDHEADERS" to the top of this=
 file (I guess I should have made a patch or passed it from the recipe). Th=
e db_5.3.28.bb recipe then built okay and the image build stopped complaini=
ng about missing libdb-5.3 when installing python-bsddb

I had similar issue with db-4.8* and zeroc-ice, HAVE_CXX_STDHEADERS is
defined by default, when db recipes passes --enable-cxx, then <iostream>
is included instead of iostream.h and zeroc-ice builds ok.

> Does anyone else have this issue? Should python-bsddb be using BerkeleyDB=
 6.0 now?
>=20
> Best Regards
> Nick
>=20
> Nick Lewis
> nick.lewis@usa.g4s.com<mailto:nick.lewis@usa.g4s.com>
> +44 1684 277137<tel:+441684277137>
> www.g4stechnology.com<http://www.g4stechnology.com/>
> New Challenge House, International Drive, Tewkesbury, Gloucestershire, GL=
20 8UQ, UK
>=20
> P Please consider the environment before printing this email
>=20
>=20
> ________________________________
> The details of this company are as follows:
> G4S Technology Limited, Registered Office: Challenge House, International=
 Drive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 238=
2338.
>=20
> This communication may contain information which is confidential, persona=
l and/or privileged.
>=20
> It is for the exclusive use of the intended recipient(s).
> If you are not the intended recipient(s), please note that any distributi=
on, forwarding, copying or use of this communication or the information in =
it is strictly prohibited.
>=20
> Any personal views expressed in this e-mail are those of the individual s=
ender and the company does not endorse or accept responsibility for them.
>=20
> Prior to taking any action based upon this e-mail message, you should see=
k appropriate confirmation of its authenticity.
>=20
> This e-mail has been scanned for all viruses by MessageLabs.

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vJI8q/aziP9idhqk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPx1x0ACgkQN1Ujt2V2gBy1hwCeKJ0QgZlFh4JizoUEUM+jFUuw
lmsAn39MWFlI7gzL2XiPbR0N9QmHbeqs
=uNx/
-----END PGP SIGNATURE-----

--vJI8q/aziP9idhqk--
