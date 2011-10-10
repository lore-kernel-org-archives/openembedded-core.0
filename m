Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDFzh-0007ot-LC
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 15:34:13 +0200
Received: by yxj17 with SMTP id 17so5353789yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 06:28:30 -0700 (PDT)
Received: by 10.223.5.3 with SMTP id 3mr32368231fat.4.1318253309038;
	Mon, 10 Oct 2011 06:28:29 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c1sm31614073fab.15.2011.10.10.06.28.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 06:28:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318251309.23801.28.camel@ted>
Date: Mon, 10 Oct 2011 15:28:27 +0200
Message-Id: <F3F33339-BAD6-4175-AD3C-5F58D2B08660@dominion.thruhere.net>
References: <1318251309.23801.28.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: shared-mime-info: Fix a parallel make race
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
X-List-Received-Date: Mon, 10 Oct 2011 13:34:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 okt. 2011, om 14:54 heeft Richard Purdie het volgende geschreven:

>=20
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git =
a/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patc=
h =
b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patc=
h
> new file mode 100644
> index 0000000..9e86a71
> --- a/dev/null
> +++ =
b/meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patc=
h
> @@ -0,0 +1,32 @@
> +The Makefile used by shared-mime-info is one big race with the =
SUBDIRS=20
> +option and the dependency specifically calling make all combining to
> +create multiple make instances all of which may try and build targets
> +like update-mime-database.
> +
> +This patch removes those options meaning make can correctly identify
> +dependencies and stop itself racing itself.
> +
> +RP 10/10/2011
> +
> +Upstream-status: Pending
> +
> +Index: shared-mime-info-0.91/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- shared-mime-info-0.91.orig/Makefile.am	2011-10-10 =
21:47:19.834173921 +0100
> ++++ shared-mime-info-0.91/Makefile.am	2011-10-10 =
21:45:57.000000000 +0100
> +@@ -1,5 +1,3 @@
> +-SUBDIRS=3D. po
> +-
> + INCLUDES =3D $(ALL_CFLAGS)
> +=20
> + packagesdir =3D $(datadir)/mime/packages
> +@@ -70,8 +68,7 @@
> +=20
> + all: check create-pot
> +=20
> +-create-pot:
> +-	$(MAKE) -C po shared-mime-info.pot
> ++create-pot: po
> +=20
> + check: create-pot freedesktop.org.xml update-mime-database =
check-translations
> + 	if test -e $(top_builddir)/freedesktop.org.xml; then \
> diff --git =
a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb =
b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
> index 76d2756..ac2dde1 100644
> --- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
> +++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
> @@ -4,3 +4,4 @@ PR =3D "r0"
> SRC_URI[md5sum] =3D "982a211560ba4c47dc791ccff34e8fbc"
> SRC_URI[sha256sum] =3D =
"98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
>=20
> +SRC_URI =3D+ "file://parallelmake.patch"

Missing PR bump=


