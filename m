Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQH04-00011T-Uh
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 14:53:13 +0200
Received: by mail-pa0-f54.google.com with SMTP id fa11so881938pad.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 05:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=lKcftCRTXszpjrnYR3TRbx+MdTHNF88OpagJithMPuk=;
	b=dplxVC8IjY4Q5zKFY8dJkYCx9TgvDkXGSIkQq9exc2P8eygUnPRyYKOQyn0CRK7mLD
	3YZGyZWQ4EfNfQo7jto5kXGuqwEee8qunNV9oWq8mey2XSkc+S8YRdUXKTBw89JSaKw/
	gzbS39uVmqNAPpYDtyYfbb6hTL34fGAHR3NDwOViC4SJMojWkNJuwX/wWhm76gQ5rbZx
	sTrPVCDQ71ttuE6MfdMyK5zXvHloqkL41oyHPUdakd9nPwAWOOAh59KtqpdvTF0/aVxg
	bDp/daq3gaJBus3jCIIv2mpdj/1+WcPHtXzg8BQEB3BJjM0oFBy81CAulRohASnfdE8t
	KK1Q==
X-Received: by 10.68.200.162 with SMTP id jt2mr8669234pbc.138.1365683749378;
	Thu, 11 Apr 2013 05:35:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f8sm4051335pbj.45.2013.04.11.05.35.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 05:35:48 -0700 (PDT)
Date: Thu, 11 Apr 2013 14:35:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130411123541.GE2477@jama>
References: <1365662568-24980-1-git-send-email-laurentiu.palcu@intel.com>
	<1365678565-20714-1-git-send-email-laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1365678565-20714-1-git-send-email-laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] dpkg, opkg, rpm-postinst: fix overwriting the run-postinstall script
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
X-List-Received-Date: Thu, 11 Apr 2013 12:53:14 -0000
X-Groupsio-MsgNum: 37768
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vmttodhTwj0NAgWp"
Content-Disposition: inline

--vmttodhTwj0NAgWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2013 at 02:09:25PM +0300, Laurentiu Palcu wrote:
> If multiple package managers are installed in the image, they will
> overwrite each other's run-postinsts script, resulting in postinstalls
> not beeing run at all at first boot.
>=20
> What this patch does:
>  * checks whether opkg/dpks/rpm is actually used to install
>    the packages and, only after, creates the run-postinsts script;
>  * brings dpkg recipe in sync with opkg: moves the script creation from
>    do_install to postinstall;
>  * move creation of run-postinsts script (rpm-postinsts recipe) to the
>    postinstall scriptlet in order to better control the creation of the
>    script according to the package manager used;
>=20
> [YOCTO #4231]
> [YOCTO #4179]
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
> Changes in v2:
>  * addressed Richard's comment and, instead of using ${IMAGE_PKGTYPE}, ch=
eck for the
>    existence of 'status' file for opkg/dpkg and 'Packages' file, for rpm;
>=20
> I did tests with all backends as default package managers and another one=
 installed
> with CORE_IMAGE_EXTRA_INSTALL. I saw no issues. The default's PM run-post=
insts script
> is not overwritten.
>=20
> Thanks,
> Laurentiu
>=20
>  meta/recipes-devtools/dpkg/dpkg.inc        |   23 ++++++++++++++---------
>  meta/recipes-devtools/opkg/opkg.inc        |    3 ++-
>  meta/recipes-devtools/rpm/rpm-postinsts.bb |   19 ++++++++++++-------
>  3 files changed, 28 insertions(+), 17 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/=
dpkg/dpkg.inc
> index 6bb1e16..5554920 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -39,15 +39,6 @@ POSTLOG ?=3D "/var/log/postinstall.log"
>  REDIRECT_CMD =3D "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>$=
{POSTLOG} 2>&1', '', d)}"
> =20
>  DPKG_INIT_POSITION ?=3D "98"
> -do_install_prepend () {
> -	install -d ${D}/${sysconfdir}/rcS.d
> -	# this happens at S98 where our good 'ole packages script used to run
> -	echo "#!/bin/sh
> -dpkg --configure -a ${REDIRECT_CMD}
> -rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
> -" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
> -	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
> -}
> =20
>  do_install_append () {
>  	if [ "${PN}" =3D "dpkg-native" ]; then
> @@ -67,6 +58,20 @@ do_install_append_class-native () {
>  	done
>  }
> =20
> +pkg_postinst_${PN} () {
> +#!/bin/sh
> +if [ "x$D" !=3D "x" ] && [ -f $D/var/lib/dpkg/status ]; then
> +	install -d ${D}/${sysconfdir}/rcS.d
> +
> +	# this happens at S98 where our good 'ole packages script used to run
> +	echo "#!/bin/sh
> +dpkg --configure -a ${REDIRECT_CMD}
> +rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
> +" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
> +	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
> +fi
> +}
> +
>  PROV =3D "virtual/update-alternatives"
>  PROV_class-native =3D ""
> =20
> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/=
opkg/opkg.inc
> index f9c1202..ff26b04 100644
> --- a/meta/recipes-devtools/opkg/opkg.inc
> +++ b/meta/recipes-devtools/opkg/opkg.inc
> @@ -62,8 +62,9 @@ REDIRECT_CMD =3D "${@base_contains('IMAGE_FEATURES', 'd=
ebug-tweaks', '>${POSTLOG}
> =20
>  pkg_postinst_${PN} () {
>  #!/bin/sh
> -if [ "x$D" !=3D "x" ]; then
> +if [ "x$D" !=3D "x" ] && [ -f $D/var/lib/opkg/status ]; then

Don't hardcode '/var/lib/opkg' we have variable for that.
http://git.openembedded.org/openembedded-core/commit/?id=3Dcf0aa9c4fdae8855=
803e96b1922d54a2431795d3

>  	install -d $D${sysconfdir}/rcS.d
> +
>  	# this happens at S98 where our good 'ole packages script used to run
>  	echo "#!/bin/sh
>  opkg-cl configure ${REDIRECT_CMD}
> diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-de=
vtools/rpm/rpm-postinsts.bb
> index fb05ad6..b551c8d 100644
> --- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
> +++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
> @@ -27,15 +27,17 @@ do_compile() {
>  }
> =20
>  do_install() {
> -	install -d ${D}/${sysconfdir}/rcS.d
> -	# Stop $i getting expanded below...
> -	i=3D\$i
> -	cat > ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts=
 << EOF
> -#!/bin/sh
> +	:
> +}
> =20
> +pkg_postinst_${PN} () {
> +if [ "x$D" !=3D "x" ] && [ -f $D/var/lib/rpm/Packages ]; then
> +	install -d $D/${sysconfdir}/rcS.d
> +	cat > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts <=
< "EOF"
> +#!/bin/sh
>  . /etc/default/rcS
> =20
> -[ -d /etc/rpm-postinsts ] && for i in \`ls /etc/rpm-postinsts/ \`; do
> +[ -d /etc/rpm-postinsts ] && for i in `ls /etc/rpm-postinsts/`; do
>  	i=3D/etc/rpm-postinsts/$i
>  	echo "Running postinst $i..."
>  	if [ -f $i ] && $i ${REDIRECT_CMD}; then
> @@ -46,5 +48,8 @@ do_install() {
>  done
>  rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts 2>/d=
ev/null
>  EOF
> -	chmod 0755 ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-post=
insts
> +	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postin=
sts
> +fi
>  }
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vmttodhTwj0NAgWp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFmrh0ACgkQN1Ujt2V2gBzTPACfburl6/IBNz8YJe50TmgicIn5
qMUAnR9CAMR0lUiXW9vNR9V+y8dwr+S0
=caN/
-----END PGP SIGNATURE-----

--vmttodhTwj0NAgWp--
