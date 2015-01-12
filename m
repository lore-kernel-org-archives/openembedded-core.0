Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 386B960670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 15:53:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 12 Jan 2015 07:50:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,744,1413270000"; d="scan'208";a="660541129"
Received: from fcrouzet-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.81])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2015 07:53:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Petter =?ISO-8859-1?Q?Mab=E4cker?= <petter@technux.se>,
	Christopher Larson <kergoth@gmail.com>
Date: Mon, 12 Jan 2015 15:53:56 +0000
Message-ID: <2635313.PoP8bKsGIp@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <ecf58c259c3b0bf8589a630617a0e284d647ea97.1420899992.git.petter@technux.se>
References: <cover.1420899992.git.petter@technux.se>
	<ecf58c259c3b0bf8589a630617a0e284d647ea97.1420899992.git.petter@technux.se>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/5] base.bbclass: detect when S has been set incorrectly
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
X-List-Received-Date: Mon, 12 Jan 2015 15:54:05 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Petter,

On Saturday 10 January 2015 15:40:10 Petter Mab=E4cker wrote:
> Currently base.bbclass is creating S if it's not created by unpacking=

> an archive or fetching a repository. If we avoid creating S we can de=
tect
> when S hasn't been set correctly, since it will not exist. Then we ca=
n tell
> the user that they should set S to a proper value, instead of just fa=
iling
> with odd errors in later tasks.
>=20
> Besides removing the auto-creation of S this change will introduce a =
warning
> if S is set incorrectly. The reason for not display an error and retu=
rn is
> due to all external layers that might have recipes that will fail oth=
erwise
> and that might be a bit to hard to start with. So use a warning until=

> people have had a chance to cleanup affected recipes.
>=20
> [YOCTO #5627]
>=20
> Signed-off-by: Petter Mab=E4cker <petter@technux.se>
> ---
>  meta/classes/base.bbclass | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index de50be1..789af3b 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -113,7 +113,6 @@ python base_do_fetch() {
>=20
>  addtask unpack after do_fetch
>  do_unpack[dirs] =3D "${WORKDIR}"
> -do_unpack[cleandirs] =3D "${S}/patches"
>  python base_do_unpack() {
>      src_uri =3D (d.getVar('SRC_URI', True) or "").split()
>      if len(src_uri) =3D=3D 0:
> @@ -121,11 +120,21 @@ python base_do_unpack() {
>=20
>      rootdir =3D d.getVar('WORKDIR', True)
>=20
> +    # Ensure that we cleanup ${S}/patches
> +    # TODO: Investigate if we can remove
> +    # the entire ${S} in this case.
> +    s_dir =3D d.getVar('S', True)
> +    p_dir =3D os.path.join(s_dir, 'patches')
> +    bb.utils.remove(p_dir, True)
> +
>      try:
>          fetcher =3D bb.fetch2.Fetch(src_uri, d)
>          fetcher.unpack(rootdir)
>      except bb.fetch2.BBFetchException as e:
>          raise bb.build.FuncFailed(e)
> +
> +    if not os.path.exists(s_dir):
> +        bb.warn("%s ('S') don't exist, you must set 'S' to a proper =
value"
> % s_dir) }
>=20
>  def pkgarch_mapping(d):
> @@ -220,7 +229,7 @@ CONFIGURESTAMPFILE =3D "${WORKDIR}/configure.ssta=
te"
>  CLEANBROKEN =3D "0"
>=20
>  addtask configure after do_patch
> -do_configure[dirs] =3D "${S} ${B}"
> +do_configure[dirs] =3D "${B}"
>  do_configure[deptask] =3D "do_populate_sysroot"
>  base_do_configure() {
>  =09if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; =
then
> @@ -238,7 +247,7 @@ base_do_configure() {
>  }
>=20
>  addtask compile after do_configure
> -do_compile[dirs] =3D "${S} ${B}"
> +do_compile[dirs] =3D "${B}"
>  base_do_compile() {
>  =09if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
>  =09=09oe_runmake || die "make failed"
> @@ -248,7 +257,7 @@ base_do_compile() {
>  }
>=20
>  addtask install after do_compile
> -do_install[dirs] =3D "${D} ${S} ${B}"
> +do_install[dirs] =3D "${D} ${B}"
>  # Remove and re-create ${D} so that is it guaranteed to be empty
>  do_install[cleandirs] =3D "${D}"

This looks reasonable to me; however I'm sure I recall Chris talking ab=
out=20
some kind of complication with this issue a year or so ago - Chris do y=
ou=20
remember what that was about?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

