Return-Path: <prvs=8563a89e7=Mikko.Rapeli@bmw.de>
Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com
	[68.232.133.109])
	by mail.openembedded.org (Postfix) with ESMTP id A660D772A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 13:27:51 +0000 (UTC)
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
	esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 Feb 2016 14:27:51 +0100
Received: from unknown (HELO esabb3.muc) ([160.50.100.30]) by esagw2.muc with
	ESMTP/TLS; 25 Feb 2016 14:27:51 +0100
Received: from smuch56b.muc (HELO SMUCH56B.europe.bmw.corp) ([160.46.137.110])
	by esabb3.muc with ESMTP/TLS; 25 Feb 2016 14:27:51 +0100
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH56B.europe.bmw.corp ([160.46.137.110]) with mapi id 14.03.0248.002;
	Thu, 25 Feb 2016 14:27:50 +0100
From: <Mikko.Rapeli@bmw.de>
To: <mariano.lopez@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 0/3] Add initial capability to check CVEs for
	recipes
Thread-Index: AQHRb8YPTPKRB7zS1kqsvPG9SjQg2J88n/SAgAAQYIA=
Date: Thu, 25 Feb 2016 13:27:48 +0000
Message-ID: <20160225132748.GD6210@loska>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska> <20160225122912.GC6210@loska>
In-Reply-To: <20160225122912.GC6210@loska>
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
X-List-Received-Date: Thu, 25 Feb 2016 13:27:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E30F72B474C77C4CBD98D566A7CF9A89@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2016 at 01:29:13PM +0100, Mikko Rapeli wrote:
> On Thu, Feb 25, 2016 at 01:14:21PM +0100, Mikko Rapeli wrote:
> > On Wed, Feb 24, 2016 at 03:27:05PM +0000, mariano.lopez@linux.intel.com=
 wrote:
> > > From: Mariano Lopez <mariano.lopez@linux.intel.com>
> > >=20
> > > This series add the cve-check-tool recipe, a tool used to identify
> > > potentially vulnerable software through version matching. It will
> > > check if a vulnerability has been addressed by a patch.
> > >=20
> > > Also add the new cve-check class that will add a task for all recipes
> > > to check for CVEs using cve-check-tool. This tool can be used by reci=
pe,
> > > image (will generate an image report in deploy dir), and with "world"
> > > and "universe"
> > >=20
> > > To run it just inherit the class and enter:
> > >=20
> > > bitbake -c cve_check <recipe>
> >=20
> > I tried these on yocto/dizzy but:

Full changes needed in dizzy are:

diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index 670e592..f24a584 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -893,3 +893,21 @@ def multiprocessingpool(*args, **kwargs):
=20
     return multiprocessing.Pool(*args, **kwargs)
=20
+# export common proxies variables from datastore to environment
+def export_proxies(d):
+    import os
+
+    variables =3D ['http_proxy', 'HTTP_PROXY', 'https_proxy', 'HTTPS_PROXY=
',
+                    'ftp_proxy', 'FTP_PROXY', 'no_proxy', 'NO_PROXY']
+    exported =3D False
+
+    for v in variables:
+        if v in os.environ.keys():
+            exported =3D True
+        else:
+            v_proxy =3D d.getVar(v, True)
+            if v_proxy is not None:
+                os.environ[v] =3D v_proxy
+                exported =3D True
+
+    return exported
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

And with this I get nice reports with "bitbake -c cve_check openssl" to
tmp/deploy/cve/openssl.

I'll try with a full image build next, but I really, really like this stuff=
.

Thanks!

-Mikko=

