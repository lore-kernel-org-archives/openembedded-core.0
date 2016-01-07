Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2E48B60232
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 12:54:38 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so96620963wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 04:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q2YIseRmtD+8OzjAYg9ILbuhf1C7m2UuP4XwyyBZSWE=;
	b=Z7oib+A0UVHi76w2f8Gfz6cQvK6+kAOCcPUBhRtXgTtCYT7C2gXMHi1Mt+hS9XaYah
	pDanehPRAxSxXXKjL1FP0052FeisDmw6HZVp8aBexGuNOpRbNfF76V0qD7if4LlYPFYQ
	Akg7jdbpNFVnuLukjTtaUOtL1UzAbQYhzaqyQGzGT2o+DuJ9ElcEZDzY/j39Hy/+v2aq
	WEmRr/NaVgyEtoGHNwO3wuiogMefM/ODoilkOCaTXcjCMMqMQxT5r+RX7kYc61gJDn6c
	ef6npuqWJGzt5HTEhdfBRkb4JYQVIBdoj4azUUdk62zpEFZI3GI37zsxNIbXyO4IKofN
	SbzQ==
X-Received: by 10.194.235.137 with SMTP id um9mr52248135wjc.146.1452171278427; 
	Thu, 07 Jan 2016 04:54:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w23sm13552496wmd.1.2016.01.07.04.54.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 04:54:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jan 2016 13:55:02 +0100
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20160107125502.GD2512@jama>
References: <cover.1452152689.git.liezhi.yang@windriver.com>
	<228ce5dac7d96467f7165add45a39cfcd12c7bfc.1452152689.git.liezhi.yang@windriver.com>
	<1452169004.3116.29.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1452169004.3116.29.camel@pbcl.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] liberation-fonts: can't be allarch
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
X-List-Received-Date: Thu, 07 Jan 2016 12:54:39 -0000
X-Groupsio-MsgNum: 75562
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RYJh/3oyKhIjGcML"
Content-Disposition: inline

--RYJh/3oyKhIjGcML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 12:16:44PM +0000, Phil Blundell wrote:
> On Wed, 2016-01-06 at 23:45 -0800, Robert Yang wrote:
> > liberation-fonts inherit fontcache which would depend on fontconfig,=20
> > and fontconfig is not allarch, so that liberation-fonts can't be
> > allarch.
>=20
> This doesn't make any sense.  I don't think allarch is, or ever has
> been, contagious in that way.  There is no good reason I can think of
> to require that all the dependencies of an allarch package should
> themselves be allarch.  Indeed, if we did require this then it would
> probably mean that virtually no packages could legitimately be allarch.

Current implementation requires that, because if there is dependency on
TUNE_PKGARCH or MACHINE_ARCH recipe, then this "allarch" recipe will be
rebuilt (or at least different archive is unpacked from sstate) every
single time you switch MACHINE.

That's why there is SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS and
SIGGEN_EXCLUDERECIPES_ABISAFE for sstate code to skip some dependencies
like this - but that doesn't remove the dependency only says that the
allarch recipe doesn't need to be rebuilt when the dependency signature
was modified.

Marking recipe as allarch incorrectly is worse than leaving it
TUNE_PKGARCH, because as TUNE_PKGARCH it's rebuilt once per architecture
and the stamps are valid until next metadata change, with incorrect
allarch it's also rebuilt once per architecture (or MACHINE), but also
unpacked from sstate every time you change the MACHINE (even when the
resulting packages end in the same directory with the same filename -
except when PRservice changes the last number in EXTENDPRAUTO with each
MACHINE change).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RYJh/3oyKhIjGcML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaOYCYACgkQN1Ujt2V2gBzmKgCfUT/41p20Wrey1bs0Bey6JNI6
ZB4An1SWQgjc61gxZJTjJJ45G4ylkJ+5
=pS+Y
-----END PGP SIGNATURE-----

--RYJh/3oyKhIjGcML--
