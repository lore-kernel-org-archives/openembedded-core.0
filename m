Return-Path: <prvs=8563a89e7=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 714 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Feb 2016 12:41:22 UTC
Received: from esa2.bmw.c3s2.iphmx.com (esa2.bmw.c3s2.iphmx.com
	[68.232.133.169])
	by mail.openembedded.org (Postfix) with ESMTP id 62A02772A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:41:22 +0000 (UTC)
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa2.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 Feb 2016 13:29:15 +0100
Received: from unknown (HELO esabb5.muc) ([160.50.100.47]) by esagw1.muc with
	ESMTP/TLS; 25 Feb 2016 13:29:14 +0100
Received: from smuch53a.muc (HELO SMUCH53A.europe.bmw.corp) ([160.46.137.113])
	by esabb5.muc with ESMTP/TLS; 25 Feb 2016 13:29:13 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH53A.europe.bmw.corp ([160.46.137.113]) with mapi id 14.03.0248.002;
	Thu, 25 Feb 2016 13:29:13 +0100
From: <Mikko.Rapeli@bmw.de>
To: <mariano.lopez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/3] Add initial capability to check CVEs for
	recipes
Thread-Index: AQHRb8YPTPKRB7zS1kqsvPG9SjQg2J88n/SA
Date: Thu, 25 Feb 2016 12:29:12 +0000
Message-ID: <20160225122912.GC6210@loska>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska>
In-Reply-To: <20160225121421.GB6210@loska>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.99]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add initial capability to check CVEs for recipes
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
X-List-Received-Date: Thu, 25 Feb 2016 12:41:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2DA62BFA2FC16D4CBDC15047F6C8883B@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2016 at 01:14:21PM +0100, Mikko Rapeli wrote:
> On Wed, Feb 24, 2016 at 03:27:05PM +0000, mariano.lopez@linux.intel.com w=
rote:
> > From: Mariano Lopez <mariano.lopez@linux.intel.com>
> >=20
> > This series add the cve-check-tool recipe, a tool used to identify
> > potentially vulnerable software through version matching. It will
> > check if a vulnerability has been addressed by a patch.
> >=20
> > Also add the new cve-check class that will add a task for all recipes
> > to check for CVEs using cve-check-tool. This tool can be used by recipe=
,
> > image (will generate an image report in deploy dir), and with "world"
> > and "universe"
> >=20
> > To run it just inherit the class and enter:
> >=20
> > bitbake -c cve_check <recipe>
>=20
> I tried these on yocto/dizzy but:
>=20
> ERROR: Task do_cve_check in /home/builder/src/base/poky/meta/recipes-core=
/busybox/busybox_1.22.1.bb depends upon non-existent task do_populate_cve_d=
b in virtual:native:/home/builder/src/base/poky/meta/recipes-devtools/cve-c=
heck-tool/cve-check-tool_5.6.bb
>=20
> Is there some simple way to make this work there too?
>=20
> For testing purposes I tried this only with busybox:
>=20
> $ cat busybox_%.bbappend=20
> inherit cve-check
>=20
> The cve-check-tool itself needed a few native backports/fixes:
>=20
> diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.1=
3.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
> index 9df81cb..b98d991 100644
> --- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
> +++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
> @@ -21,3 +21,5 @@ FILES_${PN} +=3D "${datadir}/icons"
>  do_install_append () {
>  	install -m 0644 ${WORKDIR}/index.theme ${D}/${datadir}/icons/hicolor
>  }
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-gnome/json-glib/json-glib_1.0.0.bb b/meta/recip=
es-gnome/json-glib/json-glib_1.0.0.bb
> index ce00709..26f8f7f 100644
> --- a/meta/recipes-gnome/json-glib/json-glib_1.0.0.bb
> +++ b/meta/recipes-gnome/json-glib/json-glib_1.0.0.bb
> @@ -18,3 +18,5 @@ SRC_URI[archive.sha256sum] =3D "dbf558d2da989ab84a27e4e=
13daa51ceaa97eb959c2c2f8097
>  inherit gnome gettext lib_package
> =20
>  EXTRA_OECONF =3D "--disable-introspection"
> +
> +BBCLASSEXTEND =3D "native"

Sorry, I guess this is needed to enable the class properly:

$ grep cve-check conf/local.conf
INHERIT +=3D "cve-check"

but there are some other backports needed in python modules...

-Mikko=

