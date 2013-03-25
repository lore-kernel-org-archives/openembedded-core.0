Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UKANC-00056U-W0 for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 17:35:52 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PGS5Jr020838; Mon, 25 Mar 2013 16:28:08 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UuW3iFO0wTcr; Mon, 25 Mar 2013 16:28:07 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PGRuwd020807
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Mar 2013 16:28:04 GMT
Message-ID: <1364228284.3097.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Mon, 25 Mar 2013 16:18:04 +0000
In-Reply-To: <1364222065-62444-1-git-send-email-bjst@enea.com>
References: <20130322141213.GC46421@sestofb10.enea.se>
	<1364222065-62444-1-git-send-email-bjst@enea.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r2PGS5Jr020838
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] ptest bugfix: Make all ptest files go into -ptest package
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
X-List-Received-Date: Mon, 25 Mar 2013 16:35:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-03-25 at 15:34 +0100, Bj=C3=B6rn Stenberg wrote:
> Move ${PN}-ptest to start of PACKAGES to ensure all ptest files are
> packaged in the -ptest package.
>=20
> Add QA exclusions to insane.bbclass to ensure -ptest packages can conta=
in
> any files they need.
>=20
> Bugfix: Add subshells for 'type' command.
>=20
> This patch fixes bug #4069.
>=20
> Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
> ---
>  meta/classes/insane.bbclass |    6 +++---
>  meta/classes/ptest.bbclass  |   15 ++++-----------
>  2 files changed, 7 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 2f10688..5170580 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -216,7 +216,7 @@ def package_qa_check_dev(path, name, d, elf, messag=
es):
>      Check for ".so" library symlinks in non-dev packages
>      """
> =20
> -    if not name.endswith("-dev") and not name.endswith("-dbg") and not=
 name.startswith("nativesdk-") and path.endswith(".so") and os.path.islin=
k(path):
> +    if not name.endswith("-dev") and not name.endswith("-dbg") and not=
 name.endswith("-ptest") and not name.startswith("nativesdk-") and path.e=
ndswith(".so") and os.path.islink(path):
>          messages.append("non -dev/-dbg/-nativesdk package contains sym=
link .so: %s path '%s'" % \
>                   (name, package_qa_clean_path(path,d)))
> =20
> @@ -229,7 +229,7 @@ def package_qa_check_staticdev(path, name, d, elf, =
messages):
>      libgcc.a, libgcov.a will be skipped in their packages
>      """
> =20
> -    if not name.endswith("-pic") and not name.endswith("-staticdev") a=
nd path.endswith(".a") and not path.endswith("_nonshared.a"):
> +    if not name.endswith("-pic") and not name.endswith("-staticdev") a=
nd not name.endswith("-ptest") and path.endswith(".a") and not path.endsw=
ith("_nonshared.a"):
>          messages.append("non -staticdev package contains static .a lib=
rary: %s path '%s'" % \
>                   (name, package_qa_clean_path(path,d)))
> =20
> @@ -273,7 +273,7 @@ def package_qa_check_dbg(path, name, d, elf, messag=
es):
>      Check for ".debug" files or directories outside of the dbg package
>      """
> =20
> -    if not "-dbg" in name:
> +    if not "-dbg" in name and not "-ptest" in name:
>          if '.debug' in path.split(os.path.sep):
>              messages.append("non debug package contains .debug directo=
ry: %s path %s" % \
>                       (name, package_qa_clean_path(path,d)))
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index 6ab5ee4..c51c4e6 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -14,18 +14,11 @@ PTEST_ENABLED =3D "${@base_contains("DISTRO_FEATURE=
S", "ptest", "1", "0", d)}"
>  RDEPENDS_${PN}-ptest_virtclass-native =3D ""
>  RDEPENDS_${PN}-ptest_virtclass-nativesdk =3D ""
> =20
> -PACKAGES +=3D "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-pte=
st', '', d)}"
> -
> -FILES_${PN}-dbg +=3D "${PTEST_PATH}/.debug \
> -                    ${PTEST_PATH}/*/.debug \
> -                    ${PTEST_PATH}/*/*/.debug \
> -                    ${PTEST_PATH}/*/*/*/.debug \
> -                    ${PTEST_PATH}/*/*/*/*/.debug \
> -                   "

Why are we putting all the debug files into the -ptest package now? Does
that make sense?

Cheers,

Richard

> +PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-pte=
st', '', d)}"
> =20
>  do_configure_ptest_base() {
>      if [ ${PTEST_ENABLED} =3D 1 ]; then
> -        if [ type -t do_configure_ptest =3D function ]; then
> +        if [ $(type -t do_configure_ptest) =3D function ]; then
>              do_configure_ptest
>          fi
>      fi
> @@ -33,7 +26,7 @@ do_configure_ptest_base() {
> =20
>  do_compile_ptest_base() {
>      if [ ${PTEST_ENABLED} =3D 1 ]; then
> -        if [ type -t do_compile_ptest =3D function ]; then
> +        if [ $(type -t do_compile_ptest) =3D function ]; then
>              do_compile_ptest
>          fi
>      fi
> @@ -46,7 +39,7 @@ do_install_ptest_base() {
>              if grep -q install-ptest: Makefile; then
>                  oe_runmake DESTDIR=3D${D}${PTEST_PATH} install-ptest
>              fi
> -            if [ type -t do_install_ptest =3D function ]; then
> +            if [ $(type -t do_install_ptest) =3D function ]; then
>                  do_install_ptest
>              fi
>          fi




