Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgX3N-00088i-Uh
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:06:45 +0200
Received: by wyg30 with SMTP id 30so3510246wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:02:49 -0700 (PDT)
Received: by 10.227.152.16 with SMTP id e16mr5011030wbw.112.1310454169175;
	Tue, 12 Jul 2011 00:02:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	gg16sm10620220wbb.17.2011.07.12.00.02.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 00:02:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <b7b22ed31de766af73e19834937744280273bdd5.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 09:02:46 +0200
Message-Id: <C5BF2776-78DA-4812-9A5D-318D397FB6A0@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<b7b22ed31de766af73e19834937744280273bdd5.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 05/26] wireless-tools: Updated for staticdev packaging
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
X-List-Received-Date: Tue, 12 Jul 2011 07:06:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> .../wireless-tools/wireless-tools_29.bb            |   12 +++++++-----
> 1 files changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git =
a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb =
b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> index cc51dec..a9de242 100644
> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
> 			=
file://sample_enc.c;beginline=3D1;endline=3D4;md5=3D838372be07874260b566ba=
e2f6ed33b6"
> SECTION =3D "base"
> PE =3D "1"
> -PR =3D "r2"
> +PR =3D "r3"
>=20
> SRC_URI =3D =
"http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.ta=
r.gz \
>            file://man.patch;apply=3Dyes \
> @@ -41,13 +41,15 @@ do_install() {
> }
>=20
> PACKAGES =3D "libiw-dbg ifrename-dbg ${PN}-dbg \
> -libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc"
> +libiw libiw-dev libiw-doc libiw-staticdev ifrename-doc ifrename ${PN} =
${PN}-doc"

Overriding PACKAGES is a bug, so:

PACKAGES =3D+ "libiw libiw-dev libiw-doc libiw-staticdev ifrename-doc =
ifrename"

>=20
> -FILES_libiw-dbg =3D "${libdir}/.debug/*.so.*"
> +FILES_libiw-dbg =3D "${libdir}/.debug/*${SOLIBS}"
> FILES_ifrename-dbg =3D "${sbindir}/.debug/ifrename"
> -FILES_libiw =3D "${libdir}/*.so.*"
> -FILES_libiw-dev =3D "${libdir}/*.a ${libdir}/*.so ${includedir}"
> +FILES_libiw =3D "${libdir}/*${SOLIBS}"
> +FILES_libiw-dev =3D "${libdir}/${SOLIBSDEV} ${includedir}"
> FILES_libiw-doc =3D "${mandir}/man7"
> +FILES_libiw-staticdev =3D "${libdir}/*.a"
> +RDEPENDS_libiw-staticdev =3D "libiw-dev (=3D ${EXTENDPKGV})"
> FILES_ifrename =3D "${sbindir}/ifrename"
> FILES_ifrename-doc =3D "${mandir}/man8/ifrename.8 =
${mandir}/man5/iftab.5"
> FILES_${PN} =3D "${bindir} ${sbindir}/iw* ${base_sbindir} =
${base_bindir} ${sysconfdir}/network"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



