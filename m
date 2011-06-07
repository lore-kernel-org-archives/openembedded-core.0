Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QTpp6-00034s-AG
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 08:31:32 +0200
Received: by bwz5 with SMTP id 5so4610488bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2011 23:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=YVT8S8Kp3x4sGOgtf+p768ASrQGdoLZdAw8/RGfM1y0=;
	b=ar1d2CMQtLtMTwztGRDJmsDcAYQkr780k4PoN/g5Mpe/lPb6dyqU4wQDRVQoqihi9H
	rCGuFJ3opNN3WQjDXNlAM0nUeWncdQKsQA8TxByfB1vATZiMwDhrKCFoi35TShu1ahLm
	9mArM3/3FLvEal+DapCpfu66Ub1rciA0xTNvc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=kG08wulkIHoLn6dDMbd/2jdZApgOth7Ah39rDo6aePmwfi/IvdhZpCd3+NnvoKkzs3
	PBZ0Rq6C2Wqjzx918/KU9v1b47FO5SCenL/wI2ZhcnrSIw3mTpsajpYiwNOYnSFiH5yy
	hIZCCGfGeS6TLPEcRS+TnG3pyrxKGJ1+3RXsg=
Received: by 10.204.81.210 with SMTP id y18mr5471816bkk.175.1307428094991;
	Mon, 06 Jun 2011 23:28:14 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id af13sm3869422bkc.19.2011.06.06.23.28.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Jun 2011 23:28:14 -0700 (PDT)
Date: Tue, 7 Jun 2011 08:28:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110607062807.GU3281@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: pkg-config sometimes return unexpanded variables
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
X-List-Received-Date: Tue, 07 Jun 2011 06:31:32 -0000
X-Groupsio-MsgNum: 3692
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="63tCqOYFH7xKgZE5"
Content-Disposition: inline

--63tCqOYFH7xKgZE5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

My webkit-efl build fails with:

-- checking for module 'cairo'
--   found cairo, version 1.10.0
CMake Error at
/OE/shr-core/tmp/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/FindPkgC=
onfig.cmake:104
(set):
  Syntax error in cmake code at

    =EF=BF=BD:104

  when parsing string

    ;/OE/shr-core/tmp/sysroots/nokia900\{libdir\}

  Invalid escape sequence \{

and it's because pkg-config itself returns unexpanded variable
found it only with --libs-only-L and --static params

$ pkg-config --libs-only-L --static cairo
-L/OE/shr-core/tmp/sysroots/nokia900\{libdir\}
$ pkg-config --version
0.25

I'm not sure if it's pkg-config fault worth reporting upstream or
something wrong in our sysroot, but .pc looks sane (and it's the same as
with oe.dev):
prefix=3D/usr
exec_prefix=3D/usr
libdir=3D/usr/lib
includedir=3D/usr/include

Name: cairo
Description: Multi-platform 2D graphics library
Version: 1.10.0

Requires.private:   gobject-2.0 glib-2.0    pixman-1 >=3D 0.18.4
fontconfig >=3D 2.2.95 freetype2 >=3D 9.7.3  libpng xrender >=3D 0.6 x11
Libs: -L${libdir} -lcairo
Libs.private:         -lz -lz
Cflags: -I${includedir}/cairo

I haven't seen this with pkg-config-0.23 from oe.dev and there is 0.26=20
relase available upstream, but looking on changelog it doesn't look like=20
resolved there.

Have anyone seen this too?

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--63tCqOYFH7xKgZE5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3txPcACgkQN1Ujt2V2gByn1gCeOvGc4f44muRslwwZD5F3t8x3
nEoAoJEJvTnpxw63ILN2ptPZnVvLsLUQ
=JoU1
-----END PGP SIGNATURE-----

--63tCqOYFH7xKgZE5--
