Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 47DDB76FD7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 12:46:52 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so112854326wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 05:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m8bE+ki6HfEllOXmbXOiqoao54igKYPYP35o24k7xNM=;
	b=ENNgVokdtaSMtuOSn+ly3v0KIUfCFJzb/pN/wugROenoKqiZYh0X9ksDLRzwvvuj2l
	fJCxjEYyvurd/aydjxO/iX9DehvGmzKpTQfLd2m+WoAW+ZKm8UxE8AolPLHHWVNPJeO8
	t2uoMWKl9sZTjzfYy+IdSLu8x8kxDqzZxvsKeZue7MjMiDTwzROpU/CQc2vGr2qkO2mR
	ARoTjYda+kpexgvmxQHmmZsZqz5sEIplzBDJKbKX5vptFScigjx9Y0vB17yZo7uhlQzc
	XBZ6N2T+S1fnWHVsnvXpT6cz4y1g6ENo5qrNQAv6BCqNNSTLbsXPqb/2ro66rP39cAWP
	9WSw==
X-Received: by 10.194.184.166 with SMTP id ev6mr33155074wjc.125.1444049212475; 
	Mon, 05 Oct 2015 05:46:52 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	nf15sm14482663wic.22.2015.10.05.05.46.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Oct 2015 05:46:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 5 Oct 2015 14:46:56 +0200
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20151005124656.GA2388@jama>
References: <56124413.7020901@topic.nl>
	<1444040307.5118.13.camel@linuxfoundation.org>
	<561263C5.2050606@topic.nl>
MIME-Version: 1.0
In-Reply-To: <561263C5.2050606@topic.nl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to find out why my do_compile depends on $MACHINE
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
X-List-Received-Date: Mon, 05 Oct 2015 12:46:58 -0000
X-Groupsio-MsgNum: 71913
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2015 at 01:49:25PM +0200, Mike Looijmans wrote:
> =EF=BB=BFOn 05-10-15 12:18, Richard Purdie wrote:
> > On Mon, 2015-10-05 at 11:34 +0200, Mike Looijmans wrote:
> >> =EF=BB=BFI've been puzzling with this for many hours now, but I can't =
seem to figure
> >> this out.
> >>
> >> I have a recipe that doesn't mention MACHINE anywhere, but still the
> >> sstate-cache won't be re-used for other machines, because OE somehow i=
nsists
> >> the package does depend on $MACHINE.
> >>
> >> The workaround I could find is to put something like this in the recip=
e:
> >>
> >> MACHINE[vardepvalue] =3D "any"
> >>
> >> (Similar stupid hacks like "vardepsexclude" will probably work too, bu=
t I'm
> >> not interested in forcing this particular recipe, but I'm trying to fi=
gure out
> >> what makes bitbake think it matters)
> >>
> >> Since it builds for an FPGA type, the package has
> >> PACKAGE_ARCH=3D"${FPGA_FAMILY}" set, and FGPA_FAMILY is set in local.c=
onf.
> >>
> >>
> >> When switching machines, "bitbake -S printdiff fpga-image-dyplo-test" =
reports
> >> that MACHINE changed and that is what caused sstate not beign reused. =
But the
> >> recipe does not use anything related to $MACHINE at all.
> >>
> >> Is there a way to make it tell me WHY it thinks that MACHINE is import=
ant to
> >> the recipe?
> >
> > Very briefly (sorry travelling), find the task that you want to know
> > more around and find the sigdata file in the stamps directory for it.
> > Run "bitbake-diffsigs <sigdatafile>" and it will show you how the
> > dependencies are calculated. You can compare two sigdata files using the
> > same command, "bitbake-diffsigs <sigdatafile1> <sigdatafile2>".
>=20
> Thanks, that reveiled the issue.
>=20
> I was smart in local.conf and calculated the FPGA name from the MACHINE n=
ame.=20
> That yields the same word, but somehow the dependency on the MACHINE vari=
able=20
> is kept.
>=20
> A simple fix is then to just use a ":=3D" assignment for FPGA_FAMILY so t=
hat the=20
> link to MACHINE is lost, but that then results in another rebuild:
>=20
>    List of dependencies for variable FPGA_FAMILY changed from=20
> 'set(['MACHINE'])' to 'set([])'
>    Dependency on Variable MACHINE was removed
>=20
>=20
> The FPGA packages take long to build (4 hours for just one is no exceptio=
n, on=20
> an i7 machine) so preventing them to be rebuilt is really important here.
>=20
> But having found the issue, I guess after a round of rebuilds, it'll go a=
way now.
>=20
>=20
> For the bigger picture:
>=20
> If I have a recipe that says:
>=20
> X =3D "x"
>=20
> And I refactor it a bit to read:
>=20
> Y =3D "x"
> X =3D "${Y}"
>=20
> What is the logic behind having to rebuild the package now? Why does the=
=20
> 'source' of the contents matter to the hash? It won't generate different=
=20
> output, regardless whether X is 'calculated' or just 'constant'.

You can set vardepvalue flag like this:
X[vardepvalue] =3D "${X}"
if all you care is the value of X not the expression used to construct
it. This can help with your FGPA_FAMILY and is more readable (at least
to me) then immediate assignment.

This cannot be applied by default, because in some cases you have e.g.
TOPDIR variable used in value and then it's better to exclude just
TOPDIR from the variable dependencies and keep the rest of variables
tracked (using just the value would cause different signatures for 2
builds with different TOPDIR).

> In particular, I've noticed this happening when switching between AUTOREV=
 and=20
> a fixed revision in a recipe.
>=20
>=20
> Kind regards,
>=20
> Mike Looijmans
> System Expert
>=20
> TOPIC Embedded Products
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> Telefax: +31 (0) 499 33 69 70
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>=20
> Please consider the environment before printing this e-mail
>=20
>=20
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYScT8ACgkQN1Ujt2V2gByq+wCePB2F6AT7q/LX3ifxdcz5ZnJx
GzcAn1AQF0QTaAkjeOoEwBeZW46F4Pzs
=4DZQ
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
