Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2F84060034;
	Sat, 21 Mar 2015 14:54:53 +0000 (UTC)
Received: by wetk59 with SMTP id k59so103333577wet.3;
	Sat, 21 Mar 2015 07:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ruq2Q1Je1XXSSdALaYaBIn2AvDotVBqVfatxyYN0/ik=;
	b=QWlWcd/xj7/Vutl2QxTX7Og9lAOzFLswwZcKQDUtgLQRRLh8ROZNnujvYRssWrWkuT
	JhNsyxE8q7ecikZd4aVlX/k3jUDgE6tDQnRY3b/xCwDMMXYPRM9MMCFA566eWHbv2V13
	ro7bZMgQd8jbET/03cuq1SvY8GA36VmTcjMVQFGVNFz/+Be6KoQH29GEmlqMY8uAW+n8
	mDnUyUJqZEKMxZ8p8B7BYd/j/aPbTwMsP17FV/FVV5uU+sXqmQiOoLRQD6EUjo/lhoCq
	83oSvvFpwvmuKBEO+rUux7kw4PlXg55Otk6pAwsAt9ILlnPoKuyuCPnkobVBHOqy9+qx
	1TCg==
X-Received: by 10.181.27.201 with SMTP id ji9mr4880875wid.20.1426949694666;
	Sat, 21 Mar 2015 07:54:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l10sm10925752wje.15.2015.03.21.07.54.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Mar 2015 07:54:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Mar 2015 15:55:04 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150321145504.GG4738@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1426930147.29168.104.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Sat, 21 Mar 2015 14:54:54 -0000
X-Groupsio-MsgNum: 63591
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vSsTm1kUtxIHoa7M"
Content-Disposition: inline

--vSsTm1kUtxIHoa7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2015 at 09:29:07AM +0000, Richard Purdie wrote:
> On Sat, 2015-03-21 at 03:11 +0100, Martin Jansa wrote:
> > On Mon, Mar 16, 2015 at 05:42:36PM +0000, git@git.openembedded.org wrot=
e:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: f0e3db4eaacc32423934ce09b91bc619dc5dbd21
> > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3Df0e3db4eaacc32423934ce09b91bc619dc5dbd21
> > >=20
> > > Author: Jonathan Liu <net147@gmail.com>
> > > Date:   Mon Mar  9 12:13:56 2015 +1100
> > >=20
> > > fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
> > >=20
> > > Appending to PACKAGEFUNCS results in the font packages missing the
> > > postinst/postrm scripts and the fontconfig cache not being generated
> > > in /var/cache/fontconfig when creating images or installing font
> > > packages. This is because the package data has already been emitted
> > > by emit_pkgdata in PACKAGEFUNCS. Prepend to PACKAGEFUNCS to ensure
> > > add_fontcache_postinsts is executed before emit_pkgdata.
> >=20
> > It's not caused by this change, but fixing this issue revealed that
> > fc-cache doesn't really work here.
> >=20
> > Every time the intercept_scripts/update_font_cache executes qemu it gets
> > "stuck" eating a lot of cpu and memory until it dies. Is anyone alse
> > seeing this behavior?
> >=20
> > WARNING: The postinstall intercept hook 'update_font_cache' failed (exi=
t code: 137)! See log for details!
> > WARNING: The postinstalls for the following packages will be postponed =
for first boot: liberation-fonts
> > ERROR: The following packages could not be configured offline and rootf=
s is read-only: ['liberation-fonts']
> > ERROR: Function failed: do_rootfs
> >=20
> > bitbake  32618 98.8 67.1 11031512 10983420 pts/3 R+ 03:00   4:53
> > qemu-i386 -r 2.6.32 -L /OE/rootfs -E uD_LIBRARY_PATH=3D/OE/rootfs//usr/=
lib:/OE/rootfs//lib /OE/rootfs/usr/bin/fc-cache --sysroot=3D/OE/rootfs
>=20
> There are a couple of bugs in the bugzilla around this. One seemed to be
> related to circular symlinks in udev's ptest package which was
> supposedly fixed. The other claims to have been resolved by upgrading
> fontconfig to a version which doesn't have issues with circular paths.
>=20
> There is general confusion about how to reproduce the issue and what the
> real problem is though.
>=20
> Does your system have any recursive directory structures?

I've tried to build a bit smaller image after sending the report and in
that do_rootfs it finished successfully. I'll try to re-execute this to
see if I get consistent results.

The bigger image has only few more packages in it, so if this is the
case and smaller always works while bigger always fails I should be able
to quickly find out which package/file is causing this.

I'll check the circular symlinks, I know there are some ptest packages
in the bigger one.

Thanks

> I'd like to get to the bottom of the issue and fix it once and for all
> but we likely need more info.
>=20
> Cheers,
>=20
> Richard
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vSsTm1kUtxIHoa7M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUNhkgACgkQN1Ujt2V2gBw5wACfavuq1rLXaaQiYFcu1y5dGzYW
rEcAnjvtdmSQTfsQIbdN0yxc1A/3waTI
=5493
-----END PGP SIGNATURE-----

--vSsTm1kUtxIHoa7M--
