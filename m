Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 868D270194
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 15:22:02 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so2874131wgh.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+3cqe0GFwy2mYxJyLAV/oTdDo9Uut+jqdgfNATq5VlM=;
	b=v7Z+WekG8GI0pdhU5KPaCdymXwylQaolgkE0QOiNBS6nx4IsgGbqIYqgoCUvzHAEub
	f2x2P3iAMeUiIzthDwDq7c9BgoPm1BOhsGV+sgpvMJq2JhE6AoXHWAu4t7OF+mSz+QZM
	N6zRihL9J+IiQTn5CILEDwhRc36w5Nn30pqmFwNQ+tseUR5i95ZvByEf41xUSlxJ2RHI
	YX/6QGCWdo7thoRGweU1LGDYL65onwgCwKl3znm5AJSKuu1PkE4IAe+K9FHzMlDMkyvS
	/70kn2YCZsH8iyxP3rLena2uDgWTMdOip/ijQQakTYeuGZpgqDrhs16ReCjlC4yRrEcd
	afYg==
X-Received: by 10.180.11.135 with SMTP id q7mr13910944wib.67.1406215323179;
	Thu, 24 Jul 2014 08:22:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	10sm16697253wjx.26.2014.07.24.08.22.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 08:22:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Jul 2014 17:22:18 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140724152218.GM2492@jama>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
	<1406209379-1662-2-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0La2AZo=nxBJGnkQrC+=jB9hoO+tsYyuCMbfAT0vwwd-qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La2AZo=nxBJGnkQrC+=jB9hoO+tsYyuCMbfAT0vwwd-qg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 24 Jul 2014 15:22:07 -0000
X-Groupsio-MsgNum: 55511
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c2gYorpyS4gG0T74"
Content-Disposition: inline

--c2gYorpyS4gG0T74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 02:52:45PM +0100, Burton, Ross wrote:
> On 24 July 2014 14:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> > +REQUIRED_DISTRO_FEATURES =3D "x11"
>=20
> Now I'm wondering why this is the solution.
>=20
> If you attempt to build e.g. gnome-desktop explicitly without the x11
> distro feature you understandably get an error message, because
> gnome-desktop depends on libx11 which sanity checks the distro
> features.  This seems correct.
>=20
> Presumably you're problem is that you're running world builds and
> they're producing errors on gnome-desktop because they can't satisfy a
> dependency on libx11.  It seems that bubbling up the
> REQUIRED_DISTRO_FEATURES tests isn't the right thing to do here - why
> can't SkipPackage be handled specially, so if you do bitbake -k world
> and libx11 emits SkipPackage, anything that has unsatisfiable
> dependencies because of this is also skipped?

We discussed this many months ago and IIRC the conclusion was that user
should explicitly say that he wants to skip the recipes which depend on
something skipped (so that he is aware of what he is missing).

At that time there wasn't REQUIRED_DISTRO_FEATURES support, so I've
created huge list of PNBLACKLISTs to blacklist everything not available
in our setup - so I can do world builds without ERRORs at the beginning.

REQUIRED_DISTRO_FEATURES seems to me like reasonable compromise, that's
why I've sent this patchset to replace small part of my huge blacklist.

This is the list:
https://github.com/openwebos/meta-webos/blob/master/conf/distro/include/web=
os-recipe-blacklist-world.inc

If someone has time to improve SkipPackage and we really want to skip
all depending packages, I would be glad to test such patch (because it
allows to easily drop all those blacklists for "depends-on-broken"
components)

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c2gYorpyS4gG0T74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPRJKoACgkQN1Ujt2V2gBw1LACffhDhYCpw4O2TC4B6SCiFgsnd
RZQAnjMNG0FgiqQrDCDtR+T5NjJgTqhb
=iM6P
-----END PGP SIGNATURE-----

--c2gYorpyS4gG0T74--
