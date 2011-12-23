Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Re8Nf-0005Pn-39
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:54:03 +0100
Received: by wgbdt12 with SMTP id dt12so15101660wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 08:46:55 -0800 (PST)
Received: by 10.180.19.74 with SMTP id c10mr33911175wie.8.1324658815151;
	Fri, 23 Dec 2011 08:46:55 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id di5sm33103827wib.3.2011.12.23.08.46.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 08:46:54 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 23 Dec 2011 17:46:52 +0100
In-Reply-To: <f4d948b417c0d1c7d7d7098ccd7a81278cea5328.1324657801.git.shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <b3dad82177ad19a44f06edc4b857cb9697fa3950.1324657801.git.shane.wang@intel.com>
	<f4d948b417c0d1c7d7d7098ccd7a81278cea5328.1324657801.git.shane.wang@intel.com>
Message-Id: <72958AC8-1096-4668-8255-A1CE75DF4BDD@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 10/14] valgrind: upgrade to 3.7.0
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
X-List-Received-Date: Fri, 23 Dec 2011 16:54:03 -0000
X-Groupsio-MsgNum: 14762
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FDA12804-E097-4615-98E9-4AA57C1B202A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FDA12804-E097-4615-98E9-4AA57C1B202A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 dec. 2011, om 17:35 heeft Shane Wang het volgende geschreven:

> Signed-off-by: Shane Wang <shane.wang@intel.com>
> ---
> .../valgrind/valgrind-3.7.0/configure-fix.patch    |   23 =
++++++++++++++++++++
> .../fix_issue_caused_by_ccache.patch               |    0
> .../fix_unsupporting_kernel_3.patch                |    0
> .../fixed-perl-path.patch                          |    0
> .../{valgrind_3.6.1.bb =3D> valgrind_3.7.0.bb}       |   13 =
++++++-----
> 5 files changed, 30 insertions(+), 6 deletions(-)
> create mode 100644 =
meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
> rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 =3D> =
valgrind-3.7.0}/fix_issue_caused_by_ccache.patch (100%)
> rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 =3D> =
valgrind-3.7.0}/fix_unsupporting_kernel_3.patch (100%)
> rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 =3D> =
valgrind-3.7.0}/fixed-perl-path.patch (100%)
> rename meta/recipes-devtools/valgrind/{valgrind_3.6.1.bb =3D> =
valgrind_3.7.0.bb} (71%)
>=20
> diff --git =
a/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch =
b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
> new file mode 100644
> index 0000000..f57897c
> --- /dev/null
> +++ =
b/meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
> @@ -0,0 +1,23 @@
> +To recognize gcc version from poky in configure.in
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Shane Wang <shane.wang@intel.com>
> +
> +diff -r 91a8df96084a configure.in
> +--- a/configure.in	Fri Dec 23 20:57:01 2011 +0800
> ++++ b/configure.in	Fri Dec 23 20:59:21 2011 +0800
> +@@ -104,11 +104,13 @@
> + #=20
> + # i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) =
(dot 3)
> + # i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. =
build 5658) (LLVM build 2335.15.00)
> ++# i586-poky-linux-gcc (GCC) 4.6.3 (prerelease) Copyright
> + #
> + [gcc_version=3D`${CC} --version \
> +              | head -n 1 \
> +              | $SED 's/i686-apple-darwin10//' \
> +              | $SED 's/i686-apple-darwin11//' \
> ++             | $SED 's/.*poky[^0-9]*//' \

Either change this to work with every TARGET_VENDOR or put it in the =
poky layer as bbappend.=

--Apple-Mail=_FDA12804-E097-4615-98E9-4AA57C1B202A
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk70sHwACgkQMkyGM64RGpH7OwCeLbDJaVUE1n0F6n6TV38CzOTt
y/QAn1Gl+4RMzjJkXrsdacT9MkRm1rgq
=8P/L
-----END PGP SIGNATURE-----

--Apple-Mail=_FDA12804-E097-4615-98E9-4AA57C1B202A--
