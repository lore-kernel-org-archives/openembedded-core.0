Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rxh0O-00033h-A7
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Feb 2012 16:42:52 +0100
Received: by eaal10 with SMTP id l10so331048eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 07:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jk8VHX88AthbZnJVoxCk7HD4VCJw8IAzZ8nhV/oVbZA=;
	b=h/O9PDQcFEKCF4YOwqROKKkQDIpb10T19ItYl10BBXVg+LX1Dsz68H7QgHOZKgNC2/
	Nn6P9fIZwr8CGbdwBmBJt3zO0zMTG6wusy82Lx9C2BGAXtpuU7QTN16+YLMb214djBdP
	fR11pFIJgS+14u7PIa2QWcY4Ho5jQ2NO5bxbo=
Received: by 10.14.194.134 with SMTP id m6mr8676810een.4.1329320080561;
	Wed, 15 Feb 2012 07:34:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n58sm12160525een.10.2012.02.15.07.34.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 07:34:39 -0800 (PST)
Date: Wed, 15 Feb 2012 16:34:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Message-ID: <20120215153436.GA32230@jama.jama.net>
References: <CAEsOVNe2iXiaG+=je65zNAY10Bf4PqrbJfLuJtMhzwcGttUQXA@mail.gmail.com>
	<20120214175804.GB23843@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120214175804.GB23843@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [yocto] Trying to re-use sstate.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2012 15:42:52 -0000
X-Groupsio-MsgNum: 17524
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2012 at 06:58:05PM +0100, Martin Jansa wrote:
> On Tue, Feb 07, 2012 at 02:59:54PM +0000, McClintock Matthew-B29882 wrote:
> > The paths issue your are speculating on was fixed by myself and Richard=
 last November.
> >=20
> > I would suggest running bitbake-diffsig to determine the actual sstate =
differences.
> >=20
>=20
> Usually I'm complaining that sstate cache is not used enough, but today
> I got pretty decent percentage of reuse while building from scratch 2
> similar machines (nokia900 and om-gta04) but also few wrong sysroot
> references which slipped in (I thought those were fixed).
>=20
> First I've built my image for nokia900, then for om-gta04 (with rm_work
> disabled to reuse sstate).
>=20
> OE @ ~/shr-core/tmp-eglibc/sysroots/om-gta04 $ grep -R nokia900 . 2>/dev/=
null >nokia900.log
>=20
> $ wc -l nokia900.log
> 1673 nokia900.log
>=20
> now lot's of binaries have some reference to nokia900 sysroot, grep
> shows e.g. "Binary file ./lib/ld-2.15.so matches"
> $ grep "^Binary file " nokia900.log | wc -l
> 1637
>=20
> which is maybe fine..
>=20
> An then there is few crossscripts and headers some are already in=20
> SSTATE_SCAN_FILES some are missing I guess:
>=20
> $ grep -v "^Binary file " nokia900.log | wc -l
> 36
> $ grep -v "^Binary file " nokia900.log | sed 's/:.*//g' | sort -u
> ./usr/bin/crossscripts/arm-oe-linux-gnueabi-libtool
> ./usr/bin/crossscripts/curl-config
> ./usr/bin/crossscripts/libgcrypt-config
> ./usr/bin/crossscripts/libtoolize
> ./usr/include/gmp.h
> ./usr/lib/gcc/arm-oe-linux-gnueabi/4.6.3/plugin/include/configargs.h
> ./usr/lib/python2.7/config/Makefile

and there is more

=2E/usr/bin/crossscripts/apu-1-config:INCLUDES=3D"-I/OE/shr-core/tmp-eglibc=
/sysroots/nokia900/usr/include"
=2E/usr/bin/crossscripts/apu-1-config:LDFLAGS=3D"-L/OE/shr-core/tmp-eglibc/=
sysroots/nokia900/usr/lib"

=2E/usr/bin/crossscripts/gdlib-config:    echo  -L/OE/shr-core/tmp-eglibc/s=
ysroots/nokia900/usr/lib  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -L=
/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/../lib
=2E/usr/bin/crossscripts/gdlib-config:    echo "ldflags:     -L/OE/shr-core=
/tmp-eglibc/sysroots/nokia900/usr/lib  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,-=
-as-needed -L/OE/shr-core/tmp-eglibc/sysroots/nokia900/usr/lib/../lib"

=2E/usr/bin/crossscripts/apr-1-config:CC=3D"arm-oe-linux-gnueabi-gcc  -marc=
h=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp=
 -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroo=
ts/nokia900"
=2E/usr/bin/crossscripts/apr-1-config:CPP=3D"arm-oe-linux-gnueabi-gcc -E --=
sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900  -march=3Darmv7-a -fno-=
tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mt=
une=3Dcortex-a8"

=2E/usr/lib/postgresql/pgxs/src/Makefile.global:CPP =3D arm-oe-linux-gnueab=
i-gcc -E --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900  -march=3Dar=
mv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8
=2E/usr/lib/postgresql/pgxs/src/Makefile.global:CC =3D arm-oe-linux-gnueabi=
-gcc  -march=3Darmv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-a=
bi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eg=
libc/sysroots/nokia900
=2E/usr/lib/postgresql/pgxs/src/Makefile.global:LD =3D arm-oe-linux-gnueabi=
-ld --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nokia900

=2E/usr/share/apr/apr_rules.mk:CC=3Darm-oe-linux-gnueabi-gcc  -march=3Darmv=
7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=
=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/nok=
ia900

=2E/usr/share/build-1/apr_rules.mk:CC=3Darm-oe-linux-gnueabi-gcc  -march=3D=
armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=3Dsoftfp -mf=
pu=3Dneon -mtune=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/n=
okia900

Cheers,

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk870IwACgkQN1Ujt2V2gBwfIACgkvk6mEgva3FiRgvVDGv9YNCW
mi4AoKtCVJQgd/PlkUuiAXzjYnVMzjl3
=lRx2
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
