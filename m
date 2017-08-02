Return-Path: <prvs=380cec95a=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 987 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Aug 2017 07:57:18 UTC
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id A57A9719C8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1501660642; x=1533196642;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=O8ZAHlUTQtCGtde1gQP4AgRyQLj+aDfd9j/aYTT4x9k=;
	b=EV3pqSRpbApQZRiVIEQLEYwgOOX4VnSKL7JUags4m42ewWOEz+4NuIeU
	Yh4jCeuuRIRkPl2fFA+T2Vb/hxEDFhzPsrouqE4V+uuigkU+qkvSvzMFf
	3HlvNrN+Z1TD2mcePbVlZMC+J1vEqAJ83BBQ++d9cpJhnu3A3xK2uiiYi c=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 02 Aug 2017 09:38:51 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
	02 Aug 2017 09:38:51 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb2.muc with ESMTP/TLS; 02 Aug 2017 09:38:51 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Wed, 2 Aug 2017 09:38:51 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1263.000;
	Wed, 2 Aug 2017 09:38:51 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 01/23] buildhistory.bbclass: add LICENSE and CVE_PRODUCT
	to recipe and package data
Thread-Index: AQHTAVtg4WkZRSflBUqHg2onzBDQvaJwoIUA
Date: Wed, 2 Aug 2017 07:38:50 +0000
Message-ID: <20170802073850.xhuf6dchb2vciu5e@hiutale>
References: <1500556991-11471-1-git-send-email-mikko.rapeli@bmw.de>
	<1500556991-11471-2-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1500556991-11471-2-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Subject: Re: [PATCH 01/23] buildhistory.bbclass: add LICENSE and CVE_PRODUCT to recipe and package data
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
X-List-Received-Date: Wed, 02 Aug 2017 07:57:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <817B849960C35648BFC702104E372118@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 04:22:49PM +0300, Mikko Rapeli wrote:
> LICENSE can be used in various checks after builds. Reading license data
> from buildhistory is better than trying to parse recipes in a source tree=
.
>=20
> CVE_PRODUCT can be used by scripts to e.g. check if it matches to the
> CVE product names in CVE/NVD database.
>=20
> It the two are combined, a CVE product name check can for example ignore
> recipes with CLOSED license.
>=20
> Note about sstate caching: recipe and package buildhistory data is
> regenarated only when the recipe is rebuild from sources. New fields
> like LICENSE and CVE_PRODUCT in buildhistory will be deployed only after
> the recipes are recompiled.
>=20
> Example:
>=20
> $ bitbake -c cleanall busybox && bitbake busybox
> $ egrep "LICENSE|CVE_PRODUCT" buildhistory/packages/i586-poky-linux/busyb=
ox/busybox/latest
> LICENSE =3D GPLv2 & bzip2
> CVE_PRODUCT =3D busybox

Are there some problems with this approach? Is CVE_PRODUCT too much?

I find this much better than trying to parse recipes for the data, and I li=
ke
that history data of these variables across builds/releases is available.

-Mikko

> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/classes/buildhistory.bbclass | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index 81784ee..cc3b144 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -92,6 +92,8 @@ python buildhistory_emit_pkghistory() {
>              self.packages =3D ""
>              self.srcrev =3D ""
>              self.layer =3D ""
> +            self.license =3D ""
> +            self.cve_product =3D ""
> =20
> =20
>      class PackageInfo:
> @@ -105,6 +107,8 @@ python buildhistory_emit_pkghistory() {
>              self.pkge =3D ""
>              self.pkgv =3D ""
>              self.pkgr =3D ""
> +            self.license =3D ""
> +            self.cve_product =3D ""
>              self.size =3D 0
>              self.depends =3D ""
>              self.rprovides =3D ""
> @@ -141,6 +145,10 @@ python buildhistory_emit_pkghistory() {
>                      pkginfo.pkgv =3D value
>                  elif name =3D=3D "PKGR":
>                      pkginfo.pkgr =3D value
> +                elif name =3D=3D "LICENSE":
> +                    pkginfo.license =3D value
> +                elif name =3D=3D "CVE_PRODUCT":
> +                    pkginfo.cve_product =3D value
>                  elif name =3D=3D "RPROVIDES":
>                      pkginfo.rprovides =3D value
>                  elif name =3D=3D "RDEPENDS":
> @@ -193,6 +201,9 @@ python buildhistory_emit_pkghistory() {
>      pv =3D d.getVar('PV')
>      pr =3D d.getVar('PR')
>      layer =3D bb.utils.get_file_layer(d.getVar('FILE', True), d)
> +    license =3D d.getVar('LICENSE') or ''
> +    # If recipe does not define CVE_PRODUCT, the default is pn
> +    cve_product =3D d.getVar('CVE_PRODUCT') or pn
> =20
>      pkgdata_dir =3D d.getVar('PKGDATA_DIR')
>      packages =3D ""
> @@ -233,6 +244,8 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar('DEPENDS=
') or ""))
>      rcpinfo.packages =3D packages
>      rcpinfo.layer =3D layer
> +    rcpinfo.license =3D license
> +    rcpinfo.cve_product =3D cve_product
>      write_recipehistory(rcpinfo, d)
> =20
>      pkgdest =3D d.getVar('PKGDEST')
> @@ -249,6 +262,8 @@ python buildhistory_emit_pkghistory() {
>          pkge =3D pkgdata.get('PKGE', '0')
>          pkgv =3D pkgdata['PKGV']
>          pkgr =3D pkgdata['PKGR']
> +        pkg_license =3D d.getVar('LICENSE_%s' % (pkg,), True) or license
> +        pkg_cve_product =3D d.getVar('CVE_PRODUCT_%s' % (pkg,), True) or=
 cve_product
>          #
>          # Find out what the last version was
>          # Make sure the version did not decrease
> @@ -272,6 +287,8 @@ python buildhistory_emit_pkghistory() {
>          pkginfo.pkge =3D pkge
>          pkginfo.pkgv =3D pkgv
>          pkginfo.pkgr =3D pkgr
> +        pkginfo.license =3D pkg_license
> +        pkginfo.cve_product =3D pkg_cve_product
>          pkginfo.rprovides =3D sortpkglist(oe.utils.squashspaces(pkgdata.=
get('RPROVIDES', "")))
>          pkginfo.rdepends =3D sortpkglist(oe.utils.squashspaces(pkgdata.g=
et('RDEPENDS', "")))
>          pkginfo.rrecommends =3D sortpkglist(oe.utils.squashspaces(pkgdat=
a.get('RRECOMMENDS', "")))
> @@ -347,6 +364,8 @@ def write_recipehistory(rcpinfo, d):
>          f.write(u"DEPENDS =3D %s\n" %  rcpinfo.depends)
>          f.write(u"PACKAGES =3D %s\n" %  rcpinfo.packages)
>          f.write(u"LAYER =3D %s\n" %  rcpinfo.layer)
> +        f.write(u"LICENSE =3D %s\n" % rcpinfo.license)
> +        f.write(u"CVE_PRODUCT =3D %s\n" % rcpinfo.cve_product)
> =20
>      write_latest_srcrev(d, pkghistdir)
> =20
> @@ -374,6 +393,8 @@ def write_pkghistory(pkginfo, d):
>              f.write(u"PKGV =3D %s\n" % pkginfo.pkgv)
>          if pkginfo.pkgr !=3D pkginfo.pr:
>              f.write(u"PKGR =3D %s\n" % pkginfo.pkgr)
> +        f.write(u"LICENSE =3D %s\n" % pkginfo.license)
> +        f.write(u"CVE_PRODUCT =3D %s\n" % pkginfo.cve_product)
>          f.write(u"RPROVIDES =3D %s\n" %  pkginfo.rprovides)
>          f.write(u"RDEPENDS =3D %s\n" %  pkginfo.rdepends)
>          f.write(u"RRECOMMENDS =3D %s\n" %  pkginfo.rrecommends)
> --=20
> 1.9.1=

