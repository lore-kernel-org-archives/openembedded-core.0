Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BBCC277D2F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 21:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id AD2B72E24E;
	Wed, 12 Apr 2017 23:17:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 7FLLZk4XHF2c; Wed, 12 Apr 2017 23:17:49 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 13E122E23D;
	Wed, 12 Apr 2017 23:17:49 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E41921E086;
	Wed, 12 Apr 2017 23:17:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF57C1E07F;
	Wed, 12 Apr 2017 23:17:48 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 12 Apr 2017 23:17:48 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id C2CEA312C;
	Wed, 12 Apr 2017 23:17:48 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 12 Apr 2017 23:17:48 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 12 Apr 2017 23:17:48 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Wed, 12 Apr 2017 23:17:48 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] base-passwd/useradd: Various improvements to
	useradd with RSS
Thread-Index: AQHSs7tnSXRSGl6QR0m6EXfMPInqEqHCM/ow
Date: Wed, 12 Apr 2017 21:17:48 +0000
Message-ID: <951b3efcb5bd40ebb14b1286a1b2e6f6@XBOX02.axis.com>
References: <1492022024-30940-1-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1492022024-30940-1-git-send-email-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] base-passwd/useradd: Various improvements to	useradd with RSS
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
X-List-Received-Date: Wed, 12 Apr 2017 21:17:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This looks great. It is very close to how I had envisioned how this needed =
to be=20
solved. I will put it to the test tomorrow.

Some comments below.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 12 april 2017 20:34
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] base-passwd/useradd: Various improvements to
> useradd with RSS
>=20
> Currently there are multiple issues with useradd:
>=20
> * If base-passwd rebuilds, it wipes out recipe specific user/group additi=
ons
>   to sysroots and causes errors
> * If recipe A adds a user and recipe B depends on A, it can't see any of =
the
>   users/groups A adds.
>=20
> This patch changes base-passwd so it always works as a postinst script
> within the sysroot and copies in the master files, then runs any
> postinst-useradd-* scripts afterwards to add additional user/groups.
>=20
> The postinst-useradd-* scripts are tweaked so that if /etc/passwd doesn't=
 exist
> they just exit, knowning they'll be executed later.
>=20
> There is a problem where if recipe A adds a user an recipe B depends on A=
 but
                                                   ^^
Change "an" to "and".

> doesn't care about users, it may not have a dependency on the useradd/gro=
upadd
> tools which would therefore not be available in B's sysroot. We therefore=
 also
> tweak postinst-useradd-* scripts so that if the tools aren't present we s=
imply
> don't add users. If you need the users, you add a dependency on the tools=
 in the
> recipe and they'll be added.
>=20
> We add postinst-* to SSTATE_SCAN_FILES since almost any postinst script o=
f this
> kind is going to need relocation help.
>=20
> We also ensure that the postinst-useradd script is written into the sstat=
e
> object as the current script was only being added in a recipe local way.
>=20
> Thanks to Peter Kjellerstedt <pkj@axis.com> for some pieces of this patch=
.

Add:

[Yocto #11124]

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> ---
>  meta/classes/sstate.bbclass                        |  2 +-
>  meta/classes/useradd.bbclass                       | 24 ++++++++++++++++=
+++
>  .../recipes-core/base-passwd/base-passwd_3.5.29.bb | 28 ++++++++++++++++=
+-----
>  3 files changed, 47 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index bc0ec54..4e30f3e 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -31,7 +31,7 @@ SSTATE_DUPWHITELIST +=3D "${STAGING_ETCDIR_NATIVE}/sgml=
 ${STAGING_DATADIR_NATIVE}/
>  # Archive the sources for many architectures in one deploy folder
>  SSTATE_DUPWHITELIST +=3D "${DEPLOY_DIR_SRC}"
>=20
> -SSTATE_SCAN_FILES ?=3D "*.la *-config *_config"
> +SSTATE_SCAN_FILES ?=3D "*.la *-config *_config postinst-*"
>  SSTATE_SCAN_CMD ??=3D 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name=
 \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
>  SSTATE_SCAN_CMD_NATIVE ??=3D 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE=
_SYSROOT_NATIVE} ${SSTATE_BUILDDIR}'
>=20
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 1f7afa4..3c9410a 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -106,6 +106,18 @@ useradd_sysroot () {
>  	# before do_prepare_recipe_sysroot
>  	D=3D${STAGING_DIR_TARGET}
>=20
> +	# base-passwd's postinst may not have run yet in which case we'll get c=
alled later, just exit
> +	if [ ! -f $D${sysconfdir}/passwd ]; then
> +		exit 0
> +	fi

Can be written as:

	[ -f $D${sysconfdir}/passwd ] || exit 0

> +
> +	# Its also possible we may be in a recipe which doesn't have useradd de=
pendencies and hence the
	  ^^^
Change "Its" to "It is".

> +	# useradd/groupadd tools are unavailable. If there is no dependency, we=
 assume we don't want to
> +	# create users in the sysroot
> +	if ! command -v useradd; then
> +		exit 0
> +	fi

Can be written as:

	command -v useradd || exit 0

> +
>  	# Add groups and users defined for all recipe packages
>  	GROUPADD_PARAM=3D"${@get_all_cmd_params(d, 'groupadd')}"
>  	USERADD_PARAM=3D"${@get_all_cmd_params(d, 'useradd')}"
> @@ -122,6 +134,7 @@ python useradd_sysroot_sstate () {
>      if task =3D=3D "package_setscene":
>          bb.build.exec_func("useradd_sysroot", d)
>      elif task =3D=3D "prepare_recipe_sysroot":
> +        # Used to update this recipe's own sysroot so the user/groups ar=
e available to do_install
>          scriptfile =3D d.expand("${RECIPE_SYSROOT}${bindir}/postinst-use=
radd-${PN}")
>          bb.utils.mkdirhier(os.path.dirname(scriptfile))
>          with open(scriptfile, 'w') as script:
> @@ -130,12 +143,23 @@ python useradd_sysroot_sstate () {
>              script.write("useradd_sysroot\n")
>          os.chmod(scriptfile, 0o755)
>          bb.build.exec_func("useradd_sysroot", d)
> +    elif task =3D=3D "populate_sysroot":
> +        # Used when installed in dependent task sysroots
> +        scriptfile =3D d.expand("${SYSROOT_DESTDIR}${bindir}/postinst-us=
eradd-${PN}")
> +        bb.utils.mkdirhier(os.path.dirname(scriptfile))
> +        with open(scriptfile, 'w') as script:
> +            script.write("#!/bin/sh\n")
> +            bb.data.emit_func("useradd_sysroot", script, d)
> +            script.write("useradd_sysroot\n")
> +        os.chmod(scriptfile, 0o755)
>  }
>=20
>  do_prepare_recipe_sysroot[postfuncs] +=3D "${SYSROOTFUNC}"
>  SYSROOTFUNC_class-target =3D "useradd_sysroot_sstate"
>  SYSROOTFUNC =3D ""
>=20
> +SYSROOT_PREPROCESS_FUNCS +=3D "${SYSROOTFUNC}"
> +
>  SSTATEPREINSTFUNCS_append_class-target =3D " useradd_sysroot_sstate"
>=20
>  do_package_setscene[depends] +=3D "${USERADDSETSCENEDEPS}"
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/r=
ecipes-core/base-passwd/base-passwd_3.5.29.bb
> index e43bc0a..c6be1c1 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> @@ -43,16 +43,32 @@ do_install () {
>  	install -p -m 644 ${S}/debian/copyright ${D}${docdir}/${BPN}/
>  }
>=20
> +basepasswd_sysroot_postinst() {
> +#!/bin/sh
> +
> +# Install passwd.master and group.master to sysconfdir
> +install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
> +for i in passwd group; do
> +	install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/\$i.maste=
r \
> +		${STAGING_DIR_TARGET}${sysconfdir}/\$i
> +done
> +
> +# Run any useradd postinsts
> +for script in ${STAGING_DIR_TARGET}${bindir}/postinst-useradd-*; do
> +	if [ -f \$script ]; then
> +		\$script
> +	fi

You may as well check that the script is executable:

	[ ! -x \$script ] || \$script

> +done
> +}
> +
>  SYSROOT_DIRS +=3D "${sysconfdir}"
>  SYSROOT_PREPROCESS_FUNCS +=3D "base_passwd_tweaksysroot"
>=20
>  base_passwd_tweaksysroot () {
> -	# Install passwd.master and group.master to sysconfdir
> -	install -d -m 755 ${SYSROOT_DESTDIR}${sysconfdir}
> -	for i in passwd group; do
> -		install -p -m 644 ${SYSROOT_DESTDIR}${datadir}/base-passwd/$i.master \
> -			${SYSROOT_DESTDIR}${sysconfdir}/$i
> -	done
> +	mkdir -p ${SYSROOT_DESTDIR}${bindir}
> +	dest=3D${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
> +	echo "${basepasswd_sysroot_postinst}" > $dest
> +	chmod 0755 $dest
>  }
>=20
>  python populate_packages_prepend() {
> --
> 2.7.4

//Peter


