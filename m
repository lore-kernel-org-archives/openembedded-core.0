Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 24DDE60132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 08:35:57 +0000 (UTC)
Received: by wmww144 with SMTP id w144so48858258wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 00:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lUJfJkMOeYpRYsYqWjakBCoTSUlMNYkw91GPrOTe4Ls=;
	b=Bfi/z0m/dvdkTjp9t5SH+oNMNUSL2lB0cgRN9AL21l0774am/5k8HiauOKCi9QR0fe
	cukr8ikiEEDtbyoSUsK7J5fLMZXNOxL+k9hHNfhNHhvdATYYkhAkGnzL2mna5UabKug9
	jd64ZE8SHMkRoZBp+W2zxDKCkQqbKYZ13pjnjC9YEIIN6WYLj39ocLgk9HITZOY72M71
	GpImkuy9lDt8sTbxdb9SSgNBLyxp2qSv7H0bh416OEubJayEh3zOFJbDSs+QpP23Ru86
	p4hl9m0FV03EXWB9lLz1iQj3CRM+qU4MV2v2iYeyLH3lINKZ5tiH/zEVfOEjaZX/D6Td
	fRlg==
X-Received: by 10.194.188.6 with SMTP id fw6mr60490332wjc.95.1448613357864;
	Fri, 27 Nov 2015 00:35:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c13sm6305772wmd.14.2015.11.27.00.35.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 00:35:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Nov 2015 09:36:33 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20151127083633.GY17303@jama>
References: <cover.1448442869.git.patrick.ohly@intel.com>
	<3117759.OV2fKNkn7Z@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3117759.OV2fKNkn7Z@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: alexander.kanevskiy@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] extend buildhistory
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
X-List-Received-Date: Fri, 27 Nov 2015 08:35:59 -0000
X-Groupsio-MsgNum: 74068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MHoG8na4IvP3G3ze"
Content-Disposition: inline

--MHoG8na4IvP3G3ze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2015 at 01:34:27PM +1300, Paul Eggleton wrote:
> On Wednesday 25 November 2015 10:30:28 Patrick Ohly wrote:
> > The initial implementation of YOCTO #8138
> > ("buildhistory-extra.bbclass: store more information about a build")
> > had some issues ("kconfig" file not preserved) but more importantly,
> > additional changes are needed to support also gathering information
> > about native recipes.
> >=20
> > I am proposing to include only the "buildhistory.bbclass: support
> > extending the content of the build history" patch into OE-core.
> >=20
> > The original buildhistory-extra.bbclass and the modifications made to
> > it are included here merely to provide the context for that change and
> > to publish the modifications.
>=20
> For others' reference, buildhistory-extra.bbclass was previously attached=
 to=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8138 - I didn't and w=
ouldn't=20
> propose introducing it into OE-Core in its current form because it's kind=
 of=20
> turning buildhistory into something it wasn't designed for, though I don'=
t=20
> disagree that it's useful. Happy to hear opinions from others on this tho=
ugh.

I agree it's useful.

I wonder if we can abstract some of these functions to be able to run
some of them without the actual build - we want to generate BOM (Bill of
materials) before building the image and e.g. for verification builds we
generate them twice (for base metadata, then with verification changes
applied) and generate diff.

I've implemented this as separate task which traverse the dependency
tree from the image we're going to build and writes all interesting
metadata in JSON.

Regards,

> One aspect that will probably change in the future is how it picks up the=
=20
> kernel configuration - for=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5574 (which I hope to=
 get to=20
> for 2.1, but no promises) we will need to write the kernel configuration =
to the=20
> sysroot so that we have somewhere we can look for it; if that's the case=
=20
> there'll be no need to copy it specially in buildhistory-extra.bbclass.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MHoG8na4IvP3G3ze
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZYFhEACgkQN1Ujt2V2gBz6cACgqcSdNyDwwtau0HexczIIHjSB
lxwAnA+2LDR9iqQewGaiwGOUtU/GbgYL
=fmDT
-----END PGP SIGNATURE-----

--MHoG8na4IvP3G3ze--
