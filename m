Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0A99376294
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 09:05:25 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so61467475wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 01:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=E8zmnW79aFUUEXIwKU2sr0DD45NJyZUaU1hnb0Rj7Z4=;
	b=dIj0ldt/FXGUpwYGOBetQfmE3PRjxtCUc8uOWlz+ubDAdHMeJEIiEPixLtv7qAYMdC
	No6vHfz340JmObayXw40X6X2TRWdLFVSbRuMi4M2nHiUhrTjcctCj9TfoYb6EE3y4wIg
	yv1862OYoXOCMIeg/IhCFbh3bydj7nUakPMHRIKerefAN8yXw8+TbjVcguhg72HX0tGg
	MDMiC3Y2GvwuGptGWq7zRyyRjQqtge0IDVBcXdOpcfD3kh+h6RebwePqUMPZuiMDlqqW
	V8zUBjxDAjUdgKps9fcWK6iVl5TnOEgP7vuyF0v6gAz0ZvG1IyX5iVCBIFqrG/3wvCRJ
	i1Kg==
X-Received: by 10.28.146.146 with SMTP id u140mr29904815wmd.85.1447146325483; 
	Tue, 10 Nov 2015 01:05:25 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	d66sm18610708wma.21.2015.11.10.01.05.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 01:05:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Nov 2015 10:05:27 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20151110090527.GA2561@jama>
References: <1447145891-13916-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447145891-13916-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][master][jethro][fido][dizzy] image.bbclass: don't add BUILDNAME to do_rootfs vardeps
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
X-List-Received-Date: Tue, 10 Nov 2015 09:05:28 -0000
X-Groupsio-MsgNum: 73145
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline

--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 09:58:11AM +0100, Martin Jansa wrote:
> * it was explicitly excluded in rootfs_*.bbclass which doesn't use this
>   variable anymore, so we can drop it there, but I don't understand why
>   it was added explicitly in image.bbclass, we don't want image to
>   rebuild just because timestamp is different.
> * causes following ERROR when bitbake -S is used:
>   NOTE: Reparsing files to collect dependency data
>   Writing locked sigs to locked-sigs.inc
>   ERROR: Bitbake's cached basehash does not match the one we just generat=
ed (some-image.bb.do_rootfs)!
>   ERROR: The mismatched hashes were 508d48864b14ce94ca69ea6062f9e5f8 and =
f81487a10e995426d493a4a50b088721
>   $ bitbake-diffsigs BUILD/sstate-diff/c*/foo/bar/some-image/*do_rootfs.s=
ig*
>   basehash changed from f81487a10e995426d493a4a50b088721 to 263d1d44d6fda=
0101c89de3b2a489af9
>   Variable BUILDNAME value changed from '201511100025' to '201511100037'

I'm sorry, only the rootfs_*.bbclass part does apply to all 4 branches
and it's just cleanup, so it doesn't need to be backported.

For image.bbclass in dizzy we need to backport eb6305d03723527830976c3a4ce2=
342a0e09eefc (included in fido).
Armin: can you take care of ^?

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/image.bbclass      | 2 +-
>  meta/classes/rootfs_deb.bbclass | 1 -
>  meta/classes/rootfs_ipk.bbclass | 1 -
>  meta/classes/rootfs_rpm.bbclass | 1 -
>  4 files changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 1c0fda7..c0f9775 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -94,7 +94,7 @@ def rootfs_variables(d):
>                   'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','=
IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_IN=
STALL_COMPLEMENTARY','IMAGE_LINGUAS','SDK_OS',
>                   'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DI=
R','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_O=
UTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
>                   'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS',=
'ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATION=
S','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
> -                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARG=
ET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI=
','INTERCEPT_DIR','BUILDNAME','USE_DEVFS',
> +                 'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARG=
ET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI=
','INTERCEPT_DIR','USE_DEVFS',
>                   'STAGING_KERNEL_DIR','COMPRESSIONTYPES']
>      variables.extend(command_variables(d))
>      variables.extend(variable_depends(d))
> diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bb=
class
> index d51b458..f79fca6 100644
> --- a/meta/classes/rootfs_deb.bbclass
> +++ b/meta/classes/rootfs_deb.bbclass
> @@ -8,7 +8,6 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  =3D "run-postinsts"
>  do_rootfs[depends] +=3D "dpkg-native:do_populate_sysroot apt-native:do_p=
opulate_sysroot"
>  do_populate_sdk[depends] +=3D "dpkg-native:do_populate_sysroot apt-nativ=
e:do_populate_sysroot bzip2-native:do_populate_sysroot"
>  do_rootfs[recrdeptask] +=3D "do_package_write_deb"
> -rootfs_deb_do_rootfs[vardepsexclude] +=3D "BUILDNAME"
>  do_rootfs[vardeps] +=3D "PACKAGE_FEED_URIS"
> =20
>  do_rootfs[lockfiles] +=3D "${DEPLOY_DIR_DEB}/deb.lock"
> diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bb=
class
> index 6139cc7..bb6f777 100644
> --- a/meta/classes/rootfs_ipk.bbclass
> +++ b/meta/classes/rootfs_ipk.bbclass
> @@ -13,7 +13,6 @@ do_rootfs[depends] +=3D "opkg-native:do_populate_sysroo=
t opkg-utils-native:do_popu
>  do_populate_sdk[depends] +=3D "opkg-native:do_populate_sysroot opkg-util=
s-native:do_populate_sysroot"
>  do_rootfs[recrdeptask] +=3D "do_package_write_ipk"
>  do_rootfs[vardeps] +=3D "PACKAGE_FEED_URIS"
> -rootfs_ipk_do_rootfs[vardepsexclude] +=3D "BUILDNAME"
> =20
>  do_rootfs[lockfiles] +=3D "${WORKDIR}/ipk.lock"
>  do_populate_sdk[lockfiles] +=3D "${WORKDIR}/ipk.lock"
> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bb=
class
> index d85d001..b4cd55b 100644
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -22,7 +22,6 @@ do_rootfs[depends] +=3D "${RPMROOTFSDEPENDS}"
>  do_populate_sdk[depends] +=3D "${RPMROOTFSDEPENDS}"
> =20
>  do_rootfs[recrdeptask] +=3D "do_package_write_rpm"
> -rootfs_rpm_do_rootfs[vardepsexclude] +=3D "BUILDNAME"
>  do_rootfs[vardeps] +=3D "PACKAGE_FEED_URIS"
> =20
>  # RPM doesn't work with multiple rootfs generation at once due to collis=
ions in the use of files=20
> --=20
> 2.6.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZBsv4ACgkQN1Ujt2V2gBxVPACggs7vuqN3EvOTIxpt3EOaRb7x
WpYAnA1B1JEEJp7xb5Yt0Xxe2poIzti5
=OJg8
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
