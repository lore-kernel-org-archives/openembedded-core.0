Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1492560169
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 14:01:06 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id ty20so4584754lab.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 07:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hIi9h+6ajJZmgrpJ5CUwA1okR0mXDqk/M2vpndSxNwA=;
	b=lBMTy7Gp+/SSwrMSdmRHmE7Vy3th+MeFW92hypywwytr9CwMs2IWE4phn6R69OjFJC
	BB4VFHcfXdxma7ank4NduuMgO+WDU1vdG0V/QdrIwjZgb/Jm7xSzCccxf0eTtJ3dDibB
	6BMD3YQvSK1ofLzZdv5Or8xY3jjIZhYf7I9C/kGqnJZaWvCHlRkxfL9ciTzetGM4neWY
	j1HmyLIen6Www6X+B8+5V9DesKe8VmNwuRMteTPuhXSUM/YMa/826USsgFRdVUj9DuP1
	zBDO4C3HA2/nyQ9OG5VU3XIC5Oq/p1Wf7e7xhP4vgnwJTPUJ8bSESX3HxGopJNMOA3TO
	AdaQ==
X-Received: by 10.152.207.36 with SMTP id lt4mr29990868lac.72.1408370467090;
	Mon, 18 Aug 2014 07:01:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	9sm10601846las.14.2014.08.18.07.01.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Aug 2014 07:01:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Aug 2014 16:01:06 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140818140106.GM3660@jama>
References: <1408366010.1669.11.camel@ted> <20140818131443.GL3660@jama>
	<53F202DA.5070104@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53F202DA.5070104@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Allarch and packagegroup improvement proposal
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
X-List-Received-Date: Mon, 18 Aug 2014 14:01:09 -0000
X-Groupsio-MsgNum: 56692
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WU3I8Do+sziGY3UL"
Content-Disposition: inline

--WU3I8Do+sziGY3UL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2014 at 09:42:50PM +0800, Robert Yang wrote:
>=20
>=20
> On 08/18/2014 09:14 PM, Martin Jansa wrote:
> > On Mon, Aug 18, 2014 at 01:46:50PM +0100, Richard Purdie wrote:
> >> As some people are already painfully aware, the current way packagegro=
up
> >> and allarch interact with the sstate signatures is painful.
> >>
> >> Some example problem cases:
> >>
> >> * An allarch package of scripts with an interpretor dependency (e.g pe=
rl)
> >>
> >> * A packagegroup with dependencies on something which is debian renamed
> >>    e.g. build-essentials on libgmp
> >>
> >>
> >> Currently, packagegroups default to allarch and have their sstate
> >> dependencies truncated. This means that when something like gmp
> >> rebuilds, it can change package name thanks to debian renaming but the
> >> packagegroup referencing the old name remains, causing image creation
> >> failures.
> >>
> >> So the "obvious" fix is to stop truncating the dependencies? Well, that
> >> means that the allarch package is written out every time machine chang=
es
> >> to a different arch.
> >>
> >> So we need to make packagegroups PACKAGE_ARCH specific? Well, this sti=
ll
> >> doesn't solve the problem of allarch packages having ever greater
> >> problems with things like dependencies on perl.
> >
> > Well then maybe that allarch package with perl dependency shouldn't be
> > marked as allarch.
> >
> >> An alternative solution I'm wondering about to address both issues is:
> >>
> >> * the sstatesig packagegroup code for dependencies handling should only
> >> trigger for allarch
> >> * we add a sanity test that checks if renaming has happened for
> >> packagegroup dependencies and warn if it has.
> >>
> >> The trouble is the sstatesig code doesn't have the full data store, on=
ly
> >> a limited cross section so it can't check if PACKAGE_ARCH =3D=3D all, =
only
> >> if the class is inherited. We therefore probably need to change
> >> packagegroup to do conditional class inclusion (which is possible with
> >> the modern code base at least). The use of the class can be tested from
> >> the sstatesig code and hence indicate allarch.
> >>
> >>
> >> For the second part, we could add something like:
> >>
> >> +    if bb.data.inherits_class('packagegroup', d) and bb.data.inherits=
_class('allarch', d):
> >> +        if set(deps) !=3D set(new_depends):
> >> +            bb.warn("allarch packagegroup %s has renamed dependency %=
s" % (pkg, str(set(deps) ^ set(new_depends))))
> >>
> >> to runtime_mapping_rename in package.bbclass which tells us which
> >> packagegroups need to move to be PACKAGE_ARCH. Unfortunately, a quick
> >> run of OE-Core shows:
> >>
> >> WARNING: allarch packagegroup packagegroup-core-sdk has renamed depend=
ency set(['libgomp', 'libgomp1'])
> >> WARNING: allarch packagegroup packagegroup-core-x11-base has renamed d=
ependency set(['dbus-1', 'dbus'])
> >> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target =
has renamed dependency set(['libgcc1', 'libgcc-s-dev', 'libstdc++', 'libc6-=
dev', 'libgcc-dev', 'libgcc', 'libc6', 'eglibc-dbg', 'libc6-dbg', 'eglibc-d=
ev', 'eglibc-thread-db', 'eglibc', 'libthread-db1', 'libstdc++6'])
> >> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-=
dbg has renamed dependency set(['libgcc-s-dbg', 'eglibc-dbg', 'libc6-dbg', =
'libgcc-dbg'])
> >> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-=
dev has renamed dependency set(['libgcc-s-dev', 'libc6-dev', 'libgcc-dev', =
'eglibc-dev'])
> >> WARNING: allarch packagegroup packagegroup-core-x11-sato-base has rena=
med dependency set(['libsdl-1.2-0', 'libsdl'])
> >> WARNING: allarch packagegroup packagegroup-core-x11-sato-base-dbg has =
renamed dependency set(['libsdl-dbg', 'libsdl-1.2-dbg'])
> >> WARNING: allarch packagegroup packagegroup-core-x11-sato-base-dev has =
renamed dependency set(['libsdl-dev', 'libsdl-1.2-dev'])
> >> WARNING: allarch packagegroup packagegroup-core-sdk has renamed depend=
ency set(['libgomp', 'libgomp1'])
> >> WARNING: allarch packagegroup packagegroup-core-x11-base has renamed d=
ependency set(['dbus-1', 'dbus'])
> >> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target =
has renamed dependency set(['libgcc1', 'libgcc-s-dev', 'libstdc++', 'libc6-=
dev', 'libgcc-dev', 'libgcc', 'libc6', 'eglibc-dbg', 'libc6-dbg', 'eglibc-d=
ev', 'eglibc-thread-db', 'eglibc', 'libthread-db1', 'libstdc++6'])
> >> WARNING: allarch packagegroup packagegroup-core-x11-sato-base has rena=
med dependency set(['libsdl-1.2-0', 'libsdl'])
> >> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-=
dbg has renamed dependency set(['libgcc-s-dbg', 'eglibc-dbg', 'libc6-dbg', =
'libgcc-dbg'])
> >> WARNING: allarch packagegroup packagegroup-core-standalone-sdk-target-=
dev has renamed dependency set(['libgcc-s-dev', 'libc6-dev', 'libgcc-dev', =
'eglibc-dev'])
> >> WARNING: allarch packagegroup packagegroup-core-buildessential has ren=
amed dependency set(['libstdc++', 'libstdc++6'])
> >> WARNING: allarch packagegroup packagegroup-core-buildessential has ren=
amed dependency set(['libstdc++', 'libstdc++6'])
> >>
> >> so we do have the problem in a number of places.
> >>
> >> Does anyone have any thoughts?
> >
> > I'm in favor of removing default allarch and setting correct
> > PACKAGE_ARCH manually in the packagegroup recipes like we do elsewhere.
>=20
> I did a rough find and grep in oe-core, we have 27 packagegroup recipes:
> $ find meta -name 'packagegroup-*.bb' | wc -l
> 27
>=20
> And 7 ones which set the PACKAGE_ARCH:
> $ grep PACKAGE_ARCH meta -r | grep 'packagegroup-.*.bb:' | wc -l
> 7
>=20
> It seems that allarch still wins.
>=20
> I think that we really need such a WARNING not matter whether remove the
> default allarch or not. (if removed, we have to set the allarch for a few
> packagegroup recipes, then we still need such a check.)

FWIW: there is also scripts/sstate-diff-machines.sh which can easily
show when some packagegroup recipe has incorrect PACKAGE_ARCH

Example output:
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/09519=
5.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WU3I8Do+sziGY3UL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPyByIACgkQN1Ujt2V2gBxv6wCeK5mPXssQTHdpPYg/8gi0CwAV
NocAoJSkOou+GD/Eh0cfMWhsbb0no00K
=GwCS
-----END PGP SIGNATURE-----

--WU3I8Do+sziGY3UL--
