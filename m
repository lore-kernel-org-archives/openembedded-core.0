Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SaVHv-0008S0-L3
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 19:05:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Jun 2012 09:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106769031"
Received: from unknown (HELO helios.localnet) ([10.255.12.84])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Jun 2012 09:55:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Fri, 01 Jun 2012 17:54:59 +0100
Message-ID: <2064973.GX7QB0lz6B@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <1338462765-18412-2-git-send-email-schnitzeltony@googlemail.com>
References: <1338462765-18412-1-git-send-email-schnitzeltony@googlemail.com>
	<1338462765-18412-2-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V2 2/2] buildhistory.bbclass: add pkg_pre/postinst/rm contents
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
X-List-Received-Date: Fri, 01 Jun 2012 17:05:24 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 31 May 2012 13:12:45 Andreas M=FCller wrote:
> A use-case would have been [1].
>=20
> The following tests were performed:
> * image from scratch with old buildhistory contents
> * image from scratch with buildhistory contents from scratch
> * decrement a PR for a test recipe and check if the message
>   'ERROR: Package version for xy went backwards' is displayed.
>=20
> [1] http://patches.openembedded.org/patch/28841/
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta/classes/buildhistory.bbclass |   80
> +++++++++++++++++++++++-------------- 1 files changed, 50 insertions(=
+), 30
> deletions(-)
>=20
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index d2d19ff..9c49bab 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -57,6 +57,10 @@ python buildhistory_emit_pkghistory() {
>  =09=09=09self.rrecommends =3D ""
>  =09=09=09self.files =3D ""
>  =09=09=09self.filelist =3D ""
> +=09=09=09self.preinst =3D ""
> +=09=09=09self.postinst =3D ""
> +=09=09=09self.prerm =3D ""
> +=09=09=09self.postrm =3D ""
>=20
>  =09# Should check PACKAGES here to see if anything removed
>=20
> @@ -74,18 +78,19 @@ python buildhistory_emit_pkghistory() {
>  =09=09try:
>  =09=09=09for line in f:
>  =09=09=09=09lns =3D line.split('=3D')
> -=09=09=09=09name =3D lns[0].strip()
> -=09=09=09=09value =3D lns[1].strip(" \t\r\n").strip('"')
> -=09=09=09=09if name =3D=3D "PE":
> -=09=09=09=09=09rcpinfo.pe =3D value
> -=09=09=09=09elif name =3D=3D "PV":
> -=09=09=09=09=09rcpinfo.pv =3D value
> -=09=09=09=09elif name =3D=3D "PR":
> -=09=09=09=09=09rcpinfo.pr =3D value
> -=09=09=09=09elif name =3D=3D "DEPENDS":
> -=09=09=09=09=09rcpinfo.depends =3D value
> -=09=09=09=09elif name =3D=3D "PACKAGES":
> -=09=09=09=09=09rcpinfo.packages =3D value
> +=09=09=09=09if len(lns)=3D=3D2:
> +=09=09=09=09=09name =3D lns[0].strip()
> +=09=09=09=09=09value =3D lns[1].strip(" \t\r\n").strip('"')
> +=09=09=09=09=09if name =3D=3D "PE":
> +=09=09=09=09=09=09rcpinfo.pe =3D value
> +=09=09=09=09=09elif name =3D=3D "PV":
> +=09=09=09=09=09=09rcpinfo.pv =3D value
> +=09=09=09=09=09elif name =3D=3D "PR":
> +=09=09=09=09=09=09rcpinfo.pr =3D value
> +=09=09=09=09=09elif name =3D=3D "DEPENDS":
> +=09=09=09=09=09=09rcpinfo.depends =3D value
> +=09=09=09=09=09elif name =3D=3D "PACKAGES":
> +=09=09=09=09=09=09rcpinfo.packages =3D value
>  =09=09finally:
>  =09=09=09f.close()
>  =09=09return rcpinfo
> @@ -96,24 +101,25 @@ python buildhistory_emit_pkghistory() {
>  =09=09try:
>  =09=09=09for line in f:
>  =09=09=09=09lns =3D line.split('=3D')
> -=09=09=09=09name =3D lns[0].strip()
> -=09=09=09=09value =3D lns[1].strip(" \t\r\n").strip('"')
> -=09=09=09=09if name =3D=3D "PE":
> -=09=09=09=09=09pkginfo.pe =3D value
> -=09=09=09=09elif name =3D=3D "PV":
> -=09=09=09=09=09pkginfo.pv =3D value
> -=09=09=09=09elif name =3D=3D "PR":
> -=09=09=09=09=09pkginfo.pr =3D value
> -=09=09=09=09elif name =3D=3D "RDEPENDS":
> -=09=09=09=09=09pkginfo.rdepends =3D value
> -=09=09=09=09elif name =3D=3D "RRECOMMENDS":
> -=09=09=09=09=09pkginfo.rrecommends =3D value
> -=09=09=09=09elif name =3D=3D "PKGSIZE":
> -=09=09=09=09=09pkginfo.size =3D long(value)
> -=09=09=09=09elif name =3D=3D "FILES":
> -=09=09=09=09=09pkginfo.files =3D value
> -=09=09=09=09elif name =3D=3D "FILELIST":
> -=09=09=09=09=09pkginfo.filelist =3D value
> +=09=09=09=09if len(lns)=3D=3D2:
> +=09=09=09=09=09name =3D lns[0].strip()
> +=09=09=09=09=09value =3D lns[1].strip(" \t\r\n").strip('"')
> +=09=09=09=09=09if name =3D=3D "PE":
> +=09=09=09=09=09=09pkginfo.pe =3D value
> +=09=09=09=09=09elif name =3D=3D "PV":
> +=09=09=09=09=09=09pkginfo.pv =3D value
> +=09=09=09=09=09elif name =3D=3D "PR":
> +=09=09=09=09=09=09pkginfo.pr =3D value
> +=09=09=09=09=09elif name =3D=3D "RDEPENDS":
> +=09=09=09=09=09=09pkginfo.rdepends =3D value
> +=09=09=09=09=09elif name =3D=3D "RRECOMMENDS":
> +=09=09=09=09=09=09pkginfo.rrecommends =3D value
> +=09=09=09=09=09elif name =3D=3D "PKGSIZE":
> +=09=09=09=09=09=09pkginfo.size =3D long(value)
> +=09=09=09=09=09elif name =3D=3D "FILES":
> +=09=09=09=09=09=09pkginfo.files =3D value
> +=09=09=09=09=09elif name =3D=3D "FILELIST":
> +=09=09=09=09=09=09pkginfo.filelist =3D value
>  =09=09finally:
>  =09=09=09f.close()
>  =09=09return pkginfo
> @@ -198,6 +204,12 @@ python buildhistory_emit_pkghistory() {
>  =09=09filelist.sort()
>  =09=09pkginfo.filelist =3D " ".join(filelist)
>=20
> +=09=09# pre/postinst/rm
> +=09=09pkginfo.preinst =3D getpkgvar(pkg, 'pkg_preinst') or ""
> +=09=09pkginfo.postinst =3D getpkgvar(pkg, 'pkg_postinst') or ""
> +=09=09pkginfo.prerm =3D getpkgvar(pkg, 'pkg_prerm') or ""
> +=09=09pkginfo.postrm =3D getpkgvar(pkg, 'pkg_postrm') or ""
> +
>  =09=09write_pkghistory(pkginfo, d)
>=20
>  =09=09write_latestlink(pkg, pe, pv, pr, d)
> @@ -246,6 +258,14 @@ def write_pkghistory(pkginfo, d):
>  =09=09f.write("PKGSIZE =3D %d\n" %  pkginfo.size)
>  =09=09f.write("FILES =3D %s\n" %  pkginfo.files)
>  =09=09f.write("FILELIST =3D %s\n" %  pkginfo.filelist)
> +=09=09if pkginfo.preinst !=3D "":
> +=09=09=09f.write("\npkg_preinst=3D\n%s\n" %  pkginfo.preinst)
> +=09=09if pkginfo.postinst !=3D "":
> +=09=09=09f.write("\npkg_postinst=3D\n%s\n" %  pkginfo.postinst)
> +=09=09if pkginfo.prerm !=3D "":
> +=09=09=09f.write("\npkg_prerm=3D\n%s\n" %  pkginfo.prerm)
> +=09=09if pkginfo.postrm !=3D "":
> +=09=09=09f.write("\npkg_postrm=3D\n%s\n" %  pkginfo.postrm)
>  =09finally:
>  =09=09f.close()

I'd still like to rework this to use separate files. What if a line in =
the=20
postinst script includes an =3D (which is not unlikely)?

Note that I'm happy do the reworking myself, I just won't be able to do=
 it=20
until the week after next.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


