Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TF11C-0006Oj-Ed
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 13:03:34 +0200
Received: by wgbdq11 with SMTP id dq11so2210349wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qb4Indhi1n/VQy+LS24EQjq/8bYx+7rpL9dgNUqdaHU=;
	b=jhRr6UyA/V4CKHNSep11S71KbZ44TQ2Ksem5w4AZOiaHDOdoa49AGLqoahxYkGqMTf
	4K+0H85EBML1SHPxQaoWiymvhKmEE2RdbidHwitZTHouN0WR72fzZV1AW0KBdQw3MrKl
	YEN7+tp0jN6G8Ti0JtswtCj34FpuuaYLw/cs5EMstvvWiEHuYXL3c9qZLjW04XzBkj7q
	HD4HGNPqstx3GvT/VMCbSe5Qm9ruJZe2YTmSwCi7wlutznHF3h83K5HpWlZVUNH03bSb
	IwMHUTDzcTkxsxsBGkiwHZr/Fx2l9Bk+XkUVjuSbC5Jn+Qcaec3Mx9XOv3f8i585nt+q
	Nqfg==
Received: by 10.180.105.130 with SMTP id gm2mr3772205wib.6.1348224650525;
	Fri, 21 Sep 2012 03:50:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ct3sm37264775wib.5.2012.09.21.03.50.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 03:50:49 -0700 (PDT)
Date: Fri, 21 Sep 2012 12:50:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20120921105046.GD10268@jama.jama.net>
References: <cover.1347976732.git.liezhi.yang@windriver.com>
	<0ffb700ac0f8ae5e2d0f03ab3f30ae52e5973779.1347976732.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <0ffb700ac0f8ae5e2d0f03ab3f30ae52e5973779.1347976732.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] opkg svn: respect to the arch priority
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 11:03:34 -0000
X-Groupsio-MsgNum: 29628
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline

--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 11:25:10PM +0800, Robert Yang wrote:
> This is for fixing the problem:
> 1) bitbake core-image-sato-sdk with MACHINE=3Dqemux86
> 2) bitbake core-image-sato with with MACHINE=3Dcrownbay
>=20
> The qemux86's PACKAGE_ARCH is i586, the crownbay's is core2, but several
> i586 packages will be installed into crownbay's rootfs though there are
> core2 packages. For example, there are:
>=20
> xserver-xorg*_1.11.2-r7_i586.ipk
> xserver-xorg*_1.9.3-r1_core2.ipk
>=20
> The crownbay.conf says:
> PREFERRED_VERSION_xserver-xorg ?=3D "1.9.3"
>=20
> What the crownbay's image needs is xserver-xorg*_1.9.3-r1_core2.ipk, but
> the xserver-xorg*_1.11.2-r7_i586.ipk will be installed, this is
> incorrect.
>=20
> This is caused by opkg's selecting mechanism: when more than one
> candidate is found, it will use the higher version one and ignore the
> arch priority.
>=20
> we have several conf files which set the PREFERRED_VERSION_pkg =3D "..." ,
> but there is no such a mechanism which can let us tell the opkg to
> install the preferred version. When the preferred version is higher,
> this is OK, but if the preferred version is lower, there would be
> problems:
>=20
> 1) Most of the packages are core2 in the image, but several of them are
>    i586, though we have built the core2 ones, this seems strange.
>=20
> 2) What's worse is that the image may not work since the preferred
>    version pkg is not installed.
>=20
> We have set the arch priority clearly in the opkg.conf, I think that
> respect to the arch priority is reasonable during the image generation.
>=20
> Add the "--select-higher-version" option to let the user have another
> choice, the default is no.

Can you send this upstream to see what they think about this issue?

Thanks

Cheers,

>=20
> [YOCTO #2575]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../opkg/opkg/select_higher_version.patch          |  102 ++++++++++++++=
++++++
>  meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
>  2 files changed, 104 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/select_higher_version=
=2Epatch
>=20
> diff --git a/meta/recipes-devtools/opkg/opkg/select_higher_version.patch =
b/meta/recipes-devtools/opkg/opkg/select_higher_version.patch
> new file mode 100644
> index 0000000..46d11b0
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/select_higher_version.patch
> @@ -0,0 +1,102 @@
> +Add the --select-higher-version option
> +
> +If there were more than one candidate which had the same pkg name in the
> +candidate list, for example, the same pkg with different versions, then
> +it would use the last one which was the highest version one in the past,
> +but it will use the higher arch priority one now.
> +
> +Add the "--select-higher-version" option to let it use the higher
> +version package when enabled. the default is no.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + libopkg/opkg_conf.h |    1 +
> + libopkg/pkg_hash.c  |   18 +++++++++++++++---
> + src/opkg-cl.c       |    9 +++++++++
> + 3 files changed, 25 insertions(+), 3 deletions(-)
> +
> +diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
> +--- a/libopkg/opkg_conf.h
> ++++ b/libopkg/opkg_conf.h
> +@@ -77,6 +77,7 @@ struct opkg_conf
> +      int force_removal_of_essential_packages;
> +      int force_postinstall;
> +      int force_remove;
> ++     int select_higher_version;
> +      int check_signature;
> +      int nodeps; /* do not follow dependencies */
> +      char *offline_root;
> +diff --git a/libopkg/pkg_hash.c b/libopkg/pkg_hash.c
> +--- a/libopkg/pkg_hash.c
> ++++ b/libopkg/pkg_hash.c
> +@@ -376,10 +376,22 @@ pkg_hash_fetch_best_installation_candidate(abstrac=
t_pkg_t *apkg,
> +           if (constraint_fcn(matching, cdata)) {
> +              opkg_msg(DEBUG, "Candidate: %s %s.\n",
> + 			     matching->name, matching->version) ;
> +-             good_pkg_by_name =3D matching;
> + 	     /* It has been provided by hand, so it is what user want */
> +-             if (matching->provided_by_hand =3D=3D 1)
> +-                break;
> ++             if (matching->provided_by_hand =3D=3D 1) {
> ++                 good_pkg_by_name =3D matching;
> ++                 break;
> ++             }
> ++             /* Respect to the arch priorities when given alternatives =
*/
> ++             if (good_pkg_by_name && !conf->select_higher_version) {
> ++                 if (matching->arch_priority >=3D good_pkg_by_name->arc=
h_priority) {
> ++                     good_pkg_by_name =3D matching;
> ++                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
> ++                         matching->name, matching->version) ;
> ++                 } else
> ++                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
> ++                         good_pkg_by_name->name, good_pkg_by_name->vers=
ion) ;
> ++             } else
> ++                 good_pkg_by_name =3D matching;
> +           }
> +      }
> +=20
> +diff --git a/src/opkg-cl.c b/src/opkg-cl.c
> +--- a/src/opkg-cl.c
> ++++ b/src/opkg-cl.c
> +@@ -42,6 +42,7 @@ enum {
> + 	ARGS_OPT_FORCE_SPACE,
> + 	ARGS_OPT_FORCE_POSTINSTALL,
> + 	ARGS_OPT_FORCE_REMOVE,
> ++	ARGS_OPT_SELECT_HIGHER_VERSION,
> + 	ARGS_OPT_ADD_ARCH,
> + 	ARGS_OPT_ADD_DEST,
> + 	ARGS_OPT_NOACTION,
> +@@ -83,6 +84,8 @@ static struct option long_options[] =3D {
> + 	{"force_postinstall", 0, 0, ARGS_OPT_FORCE_POSTINSTALL},
> + 	{"force-remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
> + 	{"force_remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
> ++	{"select-higher-version", 0, 0, ARGS_OPT_SELECT_HIGHER_VERSION},
> ++	{"select_higher_version", 0, 0, ARGS_OPT_SELECT_HIGHER_VERSION},
> + 	{"noaction", 0, 0, ARGS_OPT_NOACTION},
> + 	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
> + 	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
> +@@ -173,6 +176,9 @@ args_parse(int argc, char *argv[])
> + 		case ARGS_OPT_FORCE_REMOVE:
> + 			conf->force_remove =3D 1;
> + 			break;
> ++		case ARGS_OPT_SELECT_HIGHER_VERSION:
> ++			conf->select_higher_version =3D 1;
> ++			break;
> + 		case ARGS_OPT_NODEPS:
> + 			conf->nodeps =3D 1;
> + 			break;
> +@@ -271,6 +277,9 @@ usage()
> + 	printf("\t--offline-root <dir>	offline installation of packages.\n");
> + 	printf("\t--add-arch <arch>:<prio>	Register architecture with given pr=
iority\n");
> + 	printf("\t--add-dest <name>:<path>	Register destination with given pat=
h\n");
> ++	printf("\t--select-higher-version\t 	Use the higher version package ra=
ther\n");
> ++	printf("\t				than the higher arch priority one if more\n");
> ++	printf("\t				than one candidate is found.\n");
> +=20
> + 	printf("\nForce Options:\n");
> + 	printf("\t--force-depends		Install/remove despite failed dependencies\=
n");
> +--=20
> +1.7.1
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtoo=
ls/opkg/opkg_svn.bb
> index 4146b7e..e21bcd5 100644
> --- a/meta/recipes-devtools/opkg/opkg_svn.bb
> +++ b/meta/recipes-devtools/opkg/opkg_svn.bb
> @@ -7,6 +7,7 @@ SRC_URI =3D "svn://opkg.googlecode.com/svn;module=3Dtrunk=
;protocol=3Dhttp \
>             file://offline_postinstall.patch\
>             file://track_parents.patch \
>             file://conf_override.patch \
> +           file://select_higher_version.patch \
>  "
> =20
>  S =3D "${WORKDIR}/trunk"
> @@ -14,4 +15,4 @@ S =3D "${WORKDIR}/trunk"
>  SRCREV =3D "633"
>  PV =3D "0.1.8+svnr${SRCPV}"
> =20
> -PR =3D "${INC_PR}.2"
> +PR =3D "${INC_PR}.3"
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBcRoYACgkQN1Ujt2V2gBzwmACeJZVPH/A3cryMEW6AumRpguBs
B4EAnA0unJM1saHQ8jYZeZUmV7IQXhsc
=0ISi
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
