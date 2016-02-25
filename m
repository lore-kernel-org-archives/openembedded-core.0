Return-Path: <prvs=8563a89e7=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 654 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Feb 2016 12:25:31 UTC
Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com
	[68.232.139.124])
	by mail.openembedded.org (Postfix) with ESMTP id 49E8877295
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:25:31 +0000 (UTC)
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 Feb 2016 13:14:29 +0100
Received: from unknown (HELO esabb5.muc) ([160.50.100.47]) by esagw1.muc with
	ESMTP/TLS; 25 Feb 2016 13:14:29 +0100
Received: from smuch56b.muc (HELO SMUCH56B.europe.bmw.corp) ([160.46.137.110])
	by esabb5.muc with ESMTP/TLS; 25 Feb 2016 13:14:22 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH56B.europe.bmw.corp ([160.46.137.110]) with mapi id 14.03.0248.002;
	Thu, 25 Feb 2016 13:14:22 +0100
From: <Mikko.Rapeli@bmw.de>
To: <mariano.lopez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/3] Add initial capability to check CVEs for
	recipes
Thread-Index: AQHRb8YPTPKRB7zS1kqsvPG9SjQg2A==
Date: Thu, 25 Feb 2016 12:14:21 +0000
Message-ID: <20160225121421.GB6210@loska>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1456327117.git.mariano.lopez@linux.intel.com>
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
X-List-Received-Date: Thu, 25 Feb 2016 12:25:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D7B9D9D74C18724886BBA1C463CADFC9@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 03:27:05PM +0000, mariano.lopez@linux.intel.com wro=
te:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>=20
> This series add the cve-check-tool recipe, a tool used to identify
> potentially vulnerable software through version matching. It will
> check if a vulnerability has been addressed by a patch.
>=20
> Also add the new cve-check class that will add a task for all recipes
> to check for CVEs using cve-check-tool. This tool can be used by recipe,
> image (will generate an image report in deploy dir), and with "world"
> and "universe"
>=20
> To run it just inherit the class and enter:
>=20
> bitbake -c cve_check <recipe>

I tried these on yocto/dizzy but:

ERROR: Task do_cve_check in /home/builder/src/base/poky/meta/recipes-core/b=
usybox/busybox_1.22.1.bb depends upon non-existent task do_populate_cve_db =
in virtual:native:/home/builder/src/base/poky/meta/recipes-devtools/cve-che=
ck-tool/cve-check-tool_5.6.bb

Is there some simple way to make this work there too?

For testing purposes I tried this only with busybox:

$ cat busybox_%.bbappend=20
inherit cve-check

The cve-check-tool itself needed a few native backports/fixes:

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.=
bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
index 9df81cb..b98d991 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.13.bb
@@ -21,3 +21,5 @@ FILES_${PN} +=3D "${datadir}/icons"
 do_install_append () {
 	install -m 0644 ${WORKDIR}/index.theme ${D}/${datadir}/icons/hicolor
 }
+
+BBCLASSEXTEND =3D "native"
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.0.0.bb b/meta/recipes=
-gnome/json-glib/json-glib_1.0.0.bb
index ce00709..26f8f7f 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.0.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.0.0.bb
@@ -18,3 +18,5 @@ SRC_URI[archive.sha256sum] =3D "dbf558d2da989ab84a27e4e13=
daa51ceaa97eb959c2c2f8097
 inherit gnome gettext lib_package
=20
 EXTRA_OECONF =3D "--disable-introspection"
+
+BBCLASSEXTEND =3D "native"

-Mikko=

