Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id A5F4D72B1E
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 20:42:27 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so41642426wgd.2
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ITyHs+XBBxPE9Z407nW0/YfmF2pI9Cnd5mV95coTVt4=;
	b=Guh9hEzwumbEhSTdkAOUbiavDxEyPJK0ds0ohXFROw3gMiymaOoMSx6LODyI+IxG/D
	ZSCYrFEW/VPwe6Xbf4uD0d7t3PIorDlZnZQPRVyysDnpTtTpQ0mt9sV6lH+O0mkyxADP
	IeoinuklSjahL4qCtA9G8zOI5pBwkdNSUFZMalpmeoCourbKGxfyqjtqlSFJXQx2PG6O
	XocHLJV9np6TDsHeAuEjs1gc1WEEfm0/0zNrRntuuAxDkyR/02i+4X092t92Biwp1eKy
	ZDZXn2W0hfkv3mPNvvw5fFcDHT+4YnCGVWc94v09wiEXcfKGttRJplrpezdxxHD/joju
	gYFQ==
X-Received: by 10.194.61.244 with SMTP id t20mr20561448wjr.83.1427316148894;
	Wed, 25 Mar 2015 13:42:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	md2sm22229679wic.19.2015.03.25.13.42.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 13:42:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Mar 2015 21:42:42 +0100
To: Janne Karhunen <janne.karhunen@gmail.com>
Message-ID: <20150325204242.GM3904@jama>
References: <CAE=NcrZ-ODzj8LYcrGO0-a0Wvzb3YcyAqS44-NOwMumU9NVuAw@mail.gmail.com>
	<20150325183052.GL3904@jama>
	<CAE=NcraiB0OH+4EPF=t7_P3B3p_rjbU97-F8MtnROg-48OeumA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE=NcraiB0OH+4EPF=t7_P3B3p_rjbU97-F8MtnROg-48OeumA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: pam related dependency processing bug?
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
X-List-Received-Date: Wed, 25 Mar 2015 20:42:29 -0000
X-Groupsio-MsgNum: 63717
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tv2SIFopg1r47n4a"
Content-Disposition: inline

--tv2SIFopg1r47n4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2015 at 01:31:31PM -0700, Janne Karhunen wrote:
> Hi,
>=20
> Thanks, inherited that file and missed that - and my RPM legacy was
> thinking that's about right.
>=20
> How do you guys test people don't leak dependencies with global
> DEPENDS? Even this must have been passing by accident quite a while :)

See
openembedded-core/scripts/test-dependencies.sh

but it can detect only dependencies which cause build to fail or
autodetected dependencies which result in extra library being linked
=66rom some binary in the tested package.

> On Wed, Mar 25, 2015 at 11:30 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Wed, Mar 25, 2015 at 10:39:34AM -0700, Janne Karhunen wrote:
> >> Hi,
> >>
> >> Wonder if you guys can share some insights on how to debug this case.
> >> I have a legacy PAM module recipe that says:
> >>
> >> DEPENDS_${PN} =3D "libpam"
> >>
> >> 'pam' is listed in DISTRO_FEATURES and is working fine. However, for
> >> that pam module libpam dependency is silently dropped during the
> >> build. If PAM happens to be compiled before that module, everything is
> >> fine, but if not, build fails on missing pam headers.
> >>
> >> To make this interesting, 'bitbake -g -u depexp <module>' shows the
> >> libpam dependency in place - yet it clearly is not there during the
> >> build. Results are the same for both dizzy and daisy and host OS
> >> doesn't seem to make a difference either.
> >
> > That's because
> > DEPENDS_${PN}
> > doesn't mean anything you should be using DEPENDS (only RDEPENDS,
> > RPROVIDES, RREPLACES, RCONFLICTS variables are package specific and end
> > with _<package-name> e.g. _${PN})
> >
> >>
> >>
> >> --
> >> Janne
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tv2SIFopg1r47n4a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUTHcIACgkQN1Ujt2V2gBxVsACdGqnNslftZg5LTEh+KyCYtx2b
0AwAnRKQgvh+fgGDWdvOLuOxSzYhP5d9
=lD+4
-----END PGP SIGNATURE-----

--tv2SIFopg1r47n4a--
