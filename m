Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id E66207702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 20:39:15 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so22363369pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=i+WArmJy6+a1KCSVsXumOlscowBbjpJxVhnABmqHJ98=;
	b=MRMVJ3vVw5U8F3BLa6qxaXa92jExqJl9gO/8BmltT5Vh02Bft6fT+pC8rTUcPAtb2N
	niDkBF8a4h985yRYhnsyA0SRbwqn1O54PxmO1+y58Z7Nyn+8/wVDG5vBlJqzIhcAHBP4
	U8QinkFUgGnBKBYFha56JBooMD/TLWkssPSrqLQXVa7/SynZnrym4z6kx08z9Sp3PeM8
	w7xgkyqwuKwr4TXBaAGg9b2IGs3t0R2+bnDraDRyMCKxPqFfH4KVaMnPdan3spCP2Ae8
	6X+IxgvzDjQDJo7CRpyi/IYHCJPilWo/x9b9Sq8Nv79pD1zBnhFmZJ3D/E4Dn4/ak6Tg
	fD9Q==
X-Received: by 10.66.131.10 with SMTP id oi10mr59523936pab.87.1441226355511;
	Wed, 02 Sep 2015 13:39:15 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:c55b:2384:bc60:6bed?
	([2601:647:4c02:370d:c55b:2384:bc60:6bed])
	by smtp.gmail.com with ESMTPSA id
	mw3sm22678581pdb.76.2015.09.02.13.39.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 02 Sep 2015 13:39:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1435755468-33642-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Date: Wed, 2 Sep 2015 13:39:08 -0700
Message-Id: <48DC0BFB-A42F-4815-A967-95BD644E0D5A@gmail.com>
References: <1435755468-33642-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-target.inc: Remove non-related gcc headers from include_fixed folder
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
X-List-Received-Date: Wed, 02 Sep 2015 20:39:16 -0000
X-Groupsio-MsgNum: 70531
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F30577F0-DC10-4FDF-B3A5-206768C174EA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F30577F0-DC10-4FDF-B3A5-206768C174EA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 1, 2015, at 5:57 AM, leonardo.sandoval.gonzalez@linux.intel.com =
wrote:
>=20
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>=20
> Without this patch, the D's include_fixed folder may change after =
building it
> (due to the gcc's fixinc.sh script, executed on the do_compile task) =
and changes
> depend on the current sysroot headers, making the gcc's builds =
non-deterministic.
>=20
> [YOCTO #7882]

I am good with this patch.

>=20
> Signed-off-by: Leonardo Sandoval =
<leonardo.sandoval.gonzalez@linux.intel.com>
> ---
> meta/recipes-devtools/gcc/gcc-target.inc | 31 =
+++++++++++++++++++++++++++++++
> 1 file changed, 31 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc =
b/meta/recipes-devtools/gcc/gcc-target.inc
> index 5d31446..1f91107 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -168,6 +168,37 @@ do_install () {
> 	chown -R root:root ${D}
> }
>=20
> +do_install_append () {
> +        #
> +        # Thefixinc.sh script, run on the gcc's compile phase, looks =
into sysroot header
> +        # files and places the modified files into
> +        # {D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed =
folder. This makes the
> +        # build not deterministic. The following code prunes all =
those headers
> +        # except those under include-fixed/linux, *limits.h and =
README, yielding
> +        # the same include-fixed folders no matter what sysroot
> +
> +        =
include_fixed=3D"${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed"
> +        for f in $(find ${include_fixed} -type f); do
> +                case $f in
> +                */include-fixed/linux/*)
> +                    continue
> +                    ;;
> +                */include-fixed/*limits.h)
> +                    continue
> +                    ;;
> +                */include-fixed/README)
> +                    continue
> +                    ;;
> +                *)
> +                    # remove file and directory if empty
> +                    bbdebug 2 "Pruning $f"
> +                    rm $f
> +                    find $(dirname $f) -maxdepth 0 -empty -exec rmdir =
{} \;
> +                    ;;
> +                esac
> +        done
> +}
> +
> # Installing /usr/lib/gcc/* means we'd have two copies, one from =
gcc-cross
> # and one from here. These can confuse gcc cross where includes use =
#include_next
> # and builds track file dependencies (e.g. perl and its makedepends =
code).
> --
> 1.8.4.5
>=20


--Apple-Mail=_F30577F0-DC10-4FDF-B3A5-206768C174EA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXnXnEACgkQuwUzVZGdMxSNEACfWwydL3FPlldyYrWwcFBRPUAR
LscAn13NJWJfoCcHbH94hcwU1tbp/dUA
=ddGs
-----END PGP SIGNATURE-----

--Apple-Mail=_F30577F0-DC10-4FDF-B3A5-206768C174EA--
