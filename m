Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE036A88E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 19:19:47 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c50so1833990eek.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 12:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=jgb2nMVGmw4p+os5uupoRuAPxiqWeWFMUSuEmftFAwE=;
	b=CN0IANX6lVlg5XS37a3wuMsncJinFr/6ttheY4+7CAFxtWKoCoLzcXJmsseP5HlC+y
	DhYzf2qiKP2ZbazxRmNy1GV61QGSXk0rRLzs/lw+RmJiGZ0QswEmZ/QvoYwx3pdloilF
	uZJ9Vcvjw1/wZcmBhEbaLaroa/lQowclNVhIf3ueqiWmtMZO1iZGFLX9lLa+cU3XO4Ur
	1ixeY0KUbd+kKprw666qFtkbLL7Dnr9VUXlHEcgaI/yc3ePn4zM6KnCnKxvxdmE8Gm6T
	ZDskPOsKFPFkHOSo5HF2e4270f6Y/0PgDRCICXTbrSCrpf7hC/EZHGGnYNW1PueVCBHG
	HheA==
X-Received: by 10.14.5.5 with SMTP id 5mr181585eek.21.1370632788451;
	Fri, 07 Jun 2013 12:19:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id bk1sm308461eeb.5.2013.06.07.12.19.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 12:19:47 -0700 (PDT)
Date: Fri, 7 Jun 2013 21:20:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130607192007.GL22710@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: is sstate-cache really deterministic together with shlibs providers?
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
X-List-Received-Date: Fri, 07 Jun 2013 19:19:48 -0000
X-Groupsio-MsgNum: 40331
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o41d8xLWOaLD8vYh"
Content-Disposition: inline

--o41d8xLWOaLD8vYh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Imagine this process

foo.bb DEPENDS on libabc.bb to provide libabc.1.so

evil recipe bar.bb installs some binary crap in /opt/crap and because it's
picky about libabc version it bundles own compy of libabc.so.1 and
installs it to /opt/crap/lib/libabc.so.1

At the time of first build nobody notices libabc.1.so and foo, bar and
libabc are happily populated to sysroot.

foo.bb is rebuilt because of some unrelated change, but this times it
uses bar as shlibs provider for libabc.so.1

foo does not work in runtime, because it cannot find libabc.so.1 hidden
in /opt/crap/lib.

bar.bb is "fixed" by adding EXCLUDE_FROM_SHLIBS to prevent further
polluting of shlibs providers, but damage is already done.

foo doesn't have any dependency on bar (DEPENDS/RDEPENDS) because bar.bb
is just unrelated binary crap which just happens to bundle libabc.so.1
too (so foo checksum does not include bar checksum)

Now the tricky part:
1) fixing local build is easy
   bitbake -c cleansstate `grep ' bar' buildhistory/images/machine/eglibc/i=
mage-with-foo/depends.dot | sed 's/ -> .*//g' | xargs`

but sstate checksums are identical with bar or libabc in package
"Depends:" field, so how to cleanup SSTATE_MIRROR and sstate archives
already distributed to every local builder?

I could bump PR in libabc, but with PR bumps and PRINC going away I
really need to know how to solve such issues in future. Should we fix
do_package to filter shlibs providers to include only recipes which=20
are in (R)DEPENDS/RRECOMMENDS/RSUGGESTS?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--o41d8xLWOaLD8vYh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGyMmcACgkQN1Ujt2V2gBy+AQCfVYZfIH78y5vNvibMZq94p1RY
Ej8AoI1AXCKC4Pxk4pMfQcj49zSo88k1
=r+/D
-----END PGP SIGNATURE-----

--o41d8xLWOaLD8vYh--
