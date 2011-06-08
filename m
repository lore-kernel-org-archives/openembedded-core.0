Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUDdY-0003cp-Lz
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 09:57:12 +0200
Received: by bwz5 with SMTP id 5so217877bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2011 00:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5VC02xUuCj8Ts4BlQid8WKm2aG/974kSTj1vx7XxE2Q=;
	b=GRTOiSdkVcz4/6j8TEn/iG2XB6Si19i08GJiaXHkYJ1+CS1KK3WJvDuDGwnvYEh5P3
	JDoEfbQJmuWdDVMahRyagHCfvX7vqCfDEofbZbWBv5mKqmfB8SEY57O8LLwpuGUlYwFS
	BjQzhj+tFx+D3+VvDg1mAN0u0Zq8kw9Iq+CGE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Zr8Ni4GZ/wukc5P7Nyu84C9zWwRfzOiCvs3KlOoEjK0/ku8iZL/OT/xp/yZErwNZng
	xQk7meX9+p25AOR0pzx7uiQOtzCVdui5Xb1r1TKjSj9Cz519Bbig/py4zKDqy5Jn/YzB
	dmDc5P09t2+IBhjYWSIXeEfXqpoCs4e1XNKL4=
Received: by 10.204.18.193 with SMTP id x1mr279898bka.79.1307519634049;
	Wed, 08 Jun 2011 00:53:54 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id x6sm285282bkv.12.2011.06.08.00.53.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2011 00:53:52 -0700 (PDT)
Date: Wed, 8 Jun 2011 09:53:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110608075351.GG23137@jama.jama.net>
References: <20110607062807.GU3281@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20110607062807.GU3281@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: pkg-config sometimes return unexpanded variables
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
X-List-Received-Date: Wed, 08 Jun 2011 07:57:12 -0000
X-Groupsio-MsgNum: 3754
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w2JjAQZceEVGylhD"
Content-Disposition: inline

--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2011 at 08:28:07AM +0200, Martin Jansa wrote:
> My webkit-efl build fails with:
>=20
> -- checking for module 'cairo'
> --   found cairo, version 1.10.0
> CMake Error at
> /OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/FindPk=
gConfig.cmake:104
> (set):
>   Syntax error in cmake code at
>=20
>     =EF=BF=BD:104
>=20
>   when parsing string
>=20
>     ;/OE/shr-core/tmp/sysroots/nokia900\{libdir\}
>=20
>   Invalid escape sequence \{
>=20
> and it's because pkg-config itself returns unexpanded variable
> found it only with --libs-only-L and --static params
>=20
> $ pkg-config --libs-only-L --static cairo
> -L/OE/shr-core/tmp/sysroots/nokia900\{libdir\}
> $ pkg-config --version
> 0.25
>=20
> I'm not sure if it's pkg-config fault worth reporting upstream or
> something wrong in our sysroot, but .pc looks sane (and it's the same as
> with oe.dev):
> prefix=3D/usr
> exec_prefix=3D/usr
> libdir=3D/usr/lib
> includedir=3D/usr/include
>=20
> Name: cairo
> Description: Multi-platform 2D graphics library
> Version: 1.10.0
>=20
> Requires.private:   gobject-2.0 glib-2.0    pixman-1 >=3D 0.18.4
> fontconfig >=3D 2.2.95 freetype2 >=3D 9.7.3  libpng xrender >=3D 0.6 x11
> Libs: -L${libdir} -lcairo
> Libs.private:         -lz -lz
> Cflags: -I${includedir}/cairo
>=20
> I haven't seen this with pkg-config-0.23 from oe.dev and there is 0.26=20
> relase available upstream, but looking on changelog it doesn't look like=
=20
> resolved there.
>=20
> Have anyone seen this too?
>=20
> Regards,

More info:

oe.dev has 0.23 with one extra patch
http://git.openembedded.org/cgit.cgi/openembedded/tree/recipes/pkgconfig/pk=
gconfig-0.23/sysrootfix.patch
and returns nothing
$ pkg-config --libs-only-L --static cairo

if I downgrade SRCREV used in oe-core pkgconfig_git to
http://cgit.freedesktop.org/pkg-config/commit/?id=3D515745885f68fcb121197e1=
d5e43c3ee77edce3f
which coresponds to 0.23 release I still get libdir but this time
without backslashes (and cmake doesn't fail -> webkit-efl builds fine)
$ pkg-config --libs-only-L --static cairo
-L/OE/shr-core/tmp/sysroots/nokia900{libdir}
if I add sysrootfix.patch from oe.dev it's still the same (not sure why
oe.dev returns nothing).

backslash to {libdir} is added by this commit
http://cgit.freedesktop.org/pkg-config/commit/?id=3D69a7eaa6763bb0920e2b539=
fffbad51348d94deb

and -L/OE/shr-core/tmp/sysroots/nokia900\{libdir\} is still returned by
latest upstream version 0.26

Upstream dropped support for legacy -config scripts and embedded glib
http://cgit.freedesktop.org/pkg-config/commit/?id=3D03bd4a55287cd9492c5fde6=
adb1ac81a37b75cce
http://cgit.freedesktop.org/pkg-config/commit/?id=3D99964eddb5935173fcedfc7=
93e762d7dc7d01bba

which makes pkgconfig_0.26.bb much smaller, but also causes dependency
loop (at least for glib-2.0_git - 2.29.3 from meta-oe)

pkg-config-native -> glib-2.0-native -> python-argparse-native ->
python-setuptools-native -> python-native -> openssl-native ->=20
pkg-config-native

So that's another issue we have to resolve somehow if it gets fixed
upstream and we would need to upgrade pkgconfig version. I'm not sure if
I'll find time to work on this in next few weeks, so feel free to take
it over..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w2JjAQZceEVGylhD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3vKo8ACgkQN1Ujt2V2gBxAuQCggYo5tthwdhYHiJ578bfHh6QQ
g9wAn0pueAmmSrbyK9nP3DnPJSsba/qT
=NmuF
-----END PGP SIGNATURE-----

--w2JjAQZceEVGylhD--
