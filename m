Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qjp5v-0003B1-Gn
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:58:59 +0200
Received: by wyg30 with SMTP id 30so773311wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 01:54:52 -0700 (PDT)
Received: by 10.216.234.209 with SMTP id s59mr3916weq.18.1311238492211;
	Thu, 21 Jul 2011 01:54:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id v11sm696517weq.9.2011.07.21.01.54.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 01:54:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6cd8526778ee4b4ccd54bbac16dfbd492baa06c3.1311234759.git.kai.kang@windriver.com>
Date: Thu, 21 Jul 2011 10:54:45 +0200
Message-Id: <0C075F39-31A1-4D44-ADCE-F564EC54EAF9@dominion.thruhere.net>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<6cd8526778ee4b4ccd54bbac16dfbd492baa06c3.1311234759.git.kai.kang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 02/10] dropbear: Support PAM
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
X-List-Received-Date: Thu, 21 Jul 2011 08:58:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jul. 2011, om 10:00 heeft Kang Kai het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> I make a patch and some changes in dropbear.inc for supporting pam.
> - Enable pam in configure
> - Modify file option.h to open pam supporting
>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> meta/recipes-core/dropbear/dropbear.inc            |    6 ++++-
> .../dropbear/dropbear/dropbear-enable-pam.patch    |   21 =
++++++++++++++++++++
> 2 files changed, 26 insertions(+), 1 deletions(-)
> create mode 100644 =
meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
>=20
> diff --git a/meta/recipes-core/dropbear/dropbear.inc =
b/meta/recipes-core/dropbear/dropbear.inc
> index 1b51e1a..48cefb6 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -9,13 +9,15 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D3a5b0c2f0d0c49dfde9558ae2036683c"
>=20
> DEPENDS =3D "zlib"
> RPROVIDES =3D "ssh sshd"
> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', =
'', d)}"
>=20
> SRC_URI =3D =
"http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
> 	         file://urandom-xauth-changes-to-options.h.patch \
> 	         file://configure.patch \
> 	         file://fix-2kb-keys.patch \
> 	         file://allow-nopw.patch;apply=3Dno \
> -	         file://init"
> +	         file://init \
> +		 file://dropbear-enable-pam.patch "
>=20
> inherit autotools update-rc.d
>=20
> @@ -28,6 +30,8 @@ LD =3D "${CC}"
> SBINCOMMANDS =3D "dropbear dropbearkey dropbearconvert"
> BINCOMMANDS =3D "dbclient ssh scp"
> EXTRA_OEMAKE =3D 'MULTI=3D1 SCPPROGRESS=3D1 PROGRAMS=3D"${SBINCOMMANDS} =
${BINCOMMANDS}"'
> +EXTRA_OECONF +=3D "\
> +	${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', =
'--disable-pam', d)}"
>=20
> DISTRO_TYPE =3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks", =
"debug", "",d)}"

That one is missing a PR bump=


