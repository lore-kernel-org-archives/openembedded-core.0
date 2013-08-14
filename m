Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id F0F2261DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:55:18 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so4728052eek.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 23:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U7zQUylh4Ry7MeRbtiXgHi4FhsKQDiF5fstTrTgINlY=;
	b=zjfla7b8XosU9a6iAFcIOEGA1prxHAMVXiwN15H6y+u1xyFbHMjIjcmvf2aBPfMyGU
	yOaNbI1UfHAL7n681PgnnneUCkzGUSPWATfYA9yaz9Y8Bd3atZyXDkCm3d63Q+YCKSzM
	RfH2KY3yL/8lLa7qLk3CgtYe0Be3/vFQEyTT50yBuOwaHkJepxHW5viFWr9weG2iliLL
	A+eooLdNQQSgAYMOT/Z87HXj+OAIAX+vlljlEb0EeJ+dXXv0/r9Kf26ACni3GQ1WFxqs
	j1zGqSlt2u1X31mQtqOUBQQV/5Nkuc2pVer8/E0m6qIZHJcjGkfOo7is/IN3y84Na1C3
	aBdQ==
X-Received: by 10.14.198.73 with SMTP id u49mr12837394een.13.1376463319342;
	Tue, 13 Aug 2013 23:55:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm72542814eeb.11.2013.08.13.23.55.18 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 23:55:18 -0700 (PDT)
Date: Wed, 14 Aug 2013 08:56:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20130814065609.GQ17945@jama>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com> <520B1595.3060909@windriver.com>
MIME-Version: 1.0
In-Reply-To: <520B1595.3060909@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Wed, 14 Aug 2013 06:55:19 -0000
X-Groupsio-MsgNum: 43307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="glwmnIOgU1tcuP7N"
Content-Disposition: inline

--glwmnIOgU1tcuP7N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 01:28:53PM +0800, Rongqing Li wrote:
>=20
>=20
> On 08/14/2013 03:02 AM, Saul Wold wrote:
> > On 08/13/2013 01:20 AM, rongqing.li@windriver.com wrote:
> >> From: "Roy.Li" <rongqing.li@windriver.com>
> >>
> >> sstate_package creates hardlink from sysroot to SSTATE_BUILDDIR, then
> >> sstate_create_package will store SSTATE_BUILDDIR into a archive file by
> >> tar, but once other packages install the same file into sysroot, the
> >> creating the archive file will fail with below error:
> >>
> >>      DEBUG: Executing shell function sstate_create_package
> >>      tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file changed
> >> as we read it
> >>
> >> This kind of error is harmless, use --ignore-failed-read to ignore it.
> >>
> > I am not sure it's so harmless, what if the file is corrupted, then we
> > have a bad sstate tarball.  You have identified the part of the root
> > cause being the hardlink, but what if the file actually does change
> > (which would be a different bug potentially), then your packaging a
> > differet set of macros (in this case) with the sysroot.
> >
> >
> > Sau!
>=20
>=20
> The file is not corrupted, and the file content is not changed,  "tar"
> said xorg-macros.m4 file is changed, since the number of links of
> xorg-macros.m4 has changed when other packages is doing configuration
> and call autotools_copy_aclocal to make a hardlink to ${ACLOCALDIR}
>=20
> If this fix can be accepted, I will rework the commit header.

I think there is still some other issue.

I haven't seen this on ext4 filesystems, but with reiserfs I was able to
reproduce "cp: will not create hard link" issue, e.g.:

do_populate_lic_setscene task failing in sstate_install with=20
cp: will not create hard link `/OE/deploy/licenses/recipe' to directory `/O=
E/deploy/licenses/recipe' (same path)

or
ERROR: Error executing a python function in pn.bb:
CalledProcessError: Command 'cp -afl /OE/work/armv7a-vfp-neon-oe-linux-gnue=
abi/pn/1.0/pkgdata/* /OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi' returned=
 non-zero exit status 1 with output=20
cp: warning: source file `/OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/1.0/=
pkgdata/pn' specified more than once

cp: will not create hard link `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi=
/runtime' to directory `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/runtim=
e'
cp: will not create hard link `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi=
/runtime-reverse' to directory `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueab=
i/runtime-reverse'
cp: will not create hard link `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi=
/shlibs' to directory `/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi/shlibs'

Number of hardlinks is:
$ find pn/1.0/pkgdata -printf "%f/%n/%i\n"
pkgdata/5/190867045
runtime-reverse/2/190867046
pn-dbg/1/190867047
pn-dev/1/190867048
pn-doc/1/190867049
pn/1/190867067
pn-staticdev/1/190867051
pn-locale/1/190867078
runtime/2/190867053
pn-dbg.packaged/1/190867054
pn-dev.packaged/1/190867056
pn-dbg/1/190867057
pn-dev/1/190867058
pn-doc/1/190867059
pn/1/190867060
pn-staticdev/1/190867062
pn.packaged/1/190867063
pn-locale/1/190867064
pn/1/190867065
shlibs/2/190867069

find ~ -xdev -samefile pn/1.0/pkgdata 2>/dev/null
pn/1.0/pkgdata

I'm not sure where the other pkgdata hardlinks came from.

The problem is that I can reproduce it on 1-2 random recipes from few hundr=
eds
included in bigger image and even not in every build. After the error is sh=
own
it all looks sane, only way to manually reproduce the same error is to real=
ly
specify source dirs twice:

$ cp -afl \
/OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/1.0/pkgdata/* \
/OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/1.0/pkgdata/* \
/OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi

shows exactly the same 1 warning and 3 errors.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--glwmnIOgU1tcuP7N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlILKgkACgkQN1Ujt2V2gBw9oACgnti7qMYlthiNbVyhLIPcQVXJ
Q80An1mHReU7gn9WkyaWSY23u+Kh93ub
=0+pk
-----END PGP SIGNATURE-----

--glwmnIOgU1tcuP7N--
