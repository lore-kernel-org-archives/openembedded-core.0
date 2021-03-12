Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.2166.1615588914367267057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 14:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4CE2D40BEA;
	Fri, 12 Mar 2021 22:41:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVliNPjPdSWa; Fri, 12 Mar 2021 22:41:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2400A407DA;
	Fri, 12 Mar 2021 22:41:51 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6FC8117453F; Fri, 12 Mar 2021 17:41:50 -0500 (EST)
Date: Fri, 12 Mar 2021 17:41:50 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC][PATCH] sstatesig.py: show an error instead of warning when sstate manifest isn't found
Message-ID: <20210312224150.GB4892@denix.org>
References: <166663E8BC670D0D.6890@lists.openembedded.org>
 <20210223135101.gcailiou4lhceoa7@jama>
 <27cd8d13140defc517650f2a1ef76c1d58d9928a.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <27cd8d13140defc517650f2a1ef76c1d58d9928a.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 03:53:38PM +0000, Richard Purdie wrote:
> On Tue, 2021-02-23 at 14:51 +0100, Martin Jansa wrote:
> > On Tue, Feb 23, 2021 at 02:35:53PM +0100, Martin Jansa via lists.open=
embedded.org wrote:
> > > * not sure if there are some valid use-cases for missing manifest, =
but
> > > =A0=A0recently I'm seeing increasing number of build failures where=
 something
> > > =A0=A0from native recipe is missing (seen it with pseudo, autoconf,=
 nodejs
> > > =A0=A0recently) and the only indication that something is wrong (be=
fore showing
> > > =A0=A0sometimes misleading error like:
> > > =A0=A0recipe-sysroot-native/usr/bin/node: No such file or directory
> > > =A0=A0is this warning:
> > > =A0=A0NOTE: Running task 7844 of 12431 (/meta-oe/meta-oe/recipes-de=
vtools/nodejs/nodejs_12.20.2.bb:do_prepare_recipe_sysroot)
> > > =A0=A0NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroo=
t: Started
> > > =A0=A0WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifes=
t /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.popula=
te_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
> > > =A0=A0NOTE: Running task 7845 of 12431 (/meta-oe/meta-oe/recipes-de=
vtools/nodejs/nodejs_12.20.2.bb:do_unpack)
> > > =A0=A0NOTE: recipe nodejs-12.20.2-r0: task do_unpack: Started
> > > =A0=A0WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifes=
t /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.popula=
te_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
> > > =A0=A0NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroo=
t: Succeeded
> > >=20
> > > =A0=A0if I rebuild that native dependency, then it gets fixed and I=
 don't
> > > =A0=A0see these failures in clean builds (as without sstate and wit=
h empty
> > > =A0=A0TMPDIR), only in incremental builds
> > >=20
> > > * but if there isn't valid reason for missing manifest file, then I=
 think
> > > =A0=A0it would be better to error early (or even bb.fatal())
> >=20
> > Looks like this warning was first introduced in 2014:
> > https://git.openembedded.org/openembedded-core/commit/?id=3D79ea036de=
331bde65a88fb777647dc099ef05acf
> > then extended and updated for RSS in:
> > https://git.openembedded.org/openembedded-core/commit/?id=3D809746f56=
df4b91af014bf6a3f28997d6698ac78
> > then added for package management in:
> > https://git.openembedded.org/openembedded-core/commit/?id=3D85e72e129=
362db896b0d368077033e4a2e373cf9
> > and then unified last 2 to common function in:
> > https://git.openembedded.org/openembedded-core/commit/?id=3D68150bac7=
444f089f19c789e9f6602d59f605d7a
>=20
> I merged this. There were cases where the warning showed in cases where
> there wasn't a problem but I think we've fixed all those now.

Richard, Martin,

Can you please point me to the right way of fixing this? I've been seeing=
=20
this warning before and since it is now an error and backported to Dunfel=
l,=20
it breaks builds one in a while.

--=20
Denys
