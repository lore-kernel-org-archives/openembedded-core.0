Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBBE65CA8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 14:21:12 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so7392052wgh.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hLG46gJ5oYPjUaqyQyKj3wKGhlj5bQs2PkT6nTIrpNc=;
	b=u+QBiRoi+WlJTvWv8nQcHi12AIdBwb0+8MdQbzR0Q0nfT3ZNqK+RLwRhqV9DWZvV5c
	y18TGn1HQliI6qFiRvZlxIlxvfa6bN9+j2k9uW7m8OQ/8oRvMFpHMKteRm5cpyOtiud2
	967Rvy70sd9QPzj33fgdOLttxoJeTmrblFo4tH5hev1ZcHSyBkXsIYGPKmR6NiSF7sZL
	EvjvffoKJ+LhTjj4Qqk0sV8vlY6BosKCVHjWOp5yFjngK6OqHIkD1yVFoV2GF3uUzJYf
	Xds+uBlIdcnqXM9XcDCKS7tqZzjZpWuPRy003STO9/zDYzb0mm5XVcSOwGsIUiDpMmT+
	PFGQ==
X-Received: by 10.180.101.65 with SMTP id fe1mr18110318wib.53.1407680473647;
	Sun, 10 Aug 2014 07:21:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h3sm32413954wjn.10.2014.08.10.07.21.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 07:21:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 10 Aug 2014 16:21:46 +0200
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20140810142146.GR14848@jama>
References: <cover.1407678222.git.hongxu.jia@windriver.com>
	<af818f3281c55ad5c06332310cf1e5940217c06c.1407678222.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <af818f3281c55ad5c06332310cf1e5940217c06c.1407678222.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] guile: workaround ice ssa corruption while DEBUG_BUILD
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
X-List-Received-Date: Sun, 10 Aug 2014 14:21:13 -0000
X-Groupsio-MsgNum: 56250
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrnY8GquOzEdxs9Q"
Content-Disposition: inline

--lrnY8GquOzEdxs9Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2014 at 09:47:12PM +0800, Hongxu Jia wrote:
> Add:
> MACHINE =3D "qemux86-64"
> DEBUG_BUILD =3D "1"
> to local.conf and there was a ssa corruption to build guile:
> ..
> Unable to coalesce ssa_names 48 and 3476 which are marked as MUST COALESC=
E.
> sp_48(ab) and  sp_3476(ab)
> guile-2.0.11/libguile/vm-engine.c: In function 'vm_debug_engine':
> guile-2.0.11/libguile/vm.c:673:19: internal compiler error: SSA corruption
>  #define VM_NAME   vm_debug_engine
>                    ^
> guile-2.0.11/libguile/vm-engine.c:39:1: note: in expansion of macro 'VM_N=
AME'
>  VM_NAME (SCM vm, SCM program, SCM *argv, int nargs)
>  ^
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> ...
>=20
> Tweak libguile/vm-i-system.c to add boundary value check to workaround it.
>=20
> Also fix qa issue while DEBUG_BUILD:
> ...
> WARNING: QA Issue: guile rdepends on ncurses-libncurses but its not a bui=
ld dependency? [build-deps]
> WARNING: QA Issue: guile rdepends on readline but its not a build depende=
ncy? [build-deps]
> ...
>=20
> [YOCTO #6411]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../files/workaround-ice-ssa-corruption.patch      | 52 ++++++++++++++++=
++++++
>  meta/recipes-devtools/guile/guile_2.0.11.bb        |  8 +++-
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/guile/files/workaround-ice-ssa-=
corruption.patch
>=20
> diff --git a/meta/recipes-devtools/guile/files/workaround-ice-ssa-corrupt=
ion.patch b/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption=
=2Epatch
> new file mode 100644
> index 0000000..1363d63
> --- /dev/null
> +++ b/meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.pat=
ch
> @@ -0,0 +1,52 @@
> +libguile/vm-i-system.c: workaround ice ssa corruption while compiling wi=
th option -g -O
> +
> +While compiling with option -g -O, there was a ssa corruption:
> +..
> +Unable to coalesce ssa_names 48 and 3476 which are marked as MUST COALES=
CE.
> +sp_48(ab) and  sp_3476(ab)
> +guile-2.0.11/libguile/vm-engine.c: In function 'vm_debug_engine':
> +guile-2.0.11/libguile/vm.c:673:19: internal compiler error: SSA corrupti=
on
> + #define VM_NAME   vm_debug_engine
> +                   ^
> +guile-2.0.11/libguile/vm-engine.c:39:1: note: in expansion of macro 'VM_=
NAME'
> + VM_NAME (SCM vm, SCM program, SCM *argv, int nargs)
> + ^
> +Please submit a full bug report,
> +with preprocessed source if appropriate.
> +See <http://gcc.gnu.org/bugs.html> for instructions.
> +...
> +
> +Tweak libguile/vm-i-system.c to add boundary value check to workaround i=
t.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + libguile/vm-i-system.c | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/libguile/vm-i-system.c b/libguile/vm-i-system.c
> +index 5057fb0..8d31214 100644
> +--- a/libguile/vm-i-system.c
> ++++ b/libguile/vm-i-system.c
> +@@ -625,10 +625,13 @@ VM_DEFINE_INSTRUCTION (47, bind_optionals_shuffle,=
 "bind-optionals/shuffle", 6,
> +   /* now shuffle up, from walk to ntotal */
> +   {
> +     scm_t_ptrdiff nshuf =3D sp - walk + 1, i;
> +-    sp =3D (fp - 1) + ntotal + nshuf;
> +-    CHECK_OVERFLOW ();
> +-    for (i =3D 0; i < nshuf; i++)
> +-      sp[-i] =3D walk[nshuf-i-1];
> ++    if (nshuf > 0)
> ++    {
> ++      sp =3D (fp - 1) + ntotal + nshuf;
> ++      CHECK_OVERFLOW ();
> ++      for (i =3D 0; i < nshuf; i++)
> ++        sp[-i] =3D walk[nshuf-i-1];
> ++    }
> +   }
> +   /* and fill optionals & keyword args with SCM_UNDEFINED */
> +   while (walk <=3D (fp - 1) + ntotal)
> +--=20
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-d=
evtools/guile/guile_2.0.11.bb
> index d19460a..e380bed 100644
> --- a/meta/recipes-devtools/guile/guile_2.0.11.bb
> +++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
> @@ -21,6 +21,9 @@ SRC_URI =3D "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
>             file://arm_endianness.patch \
>             "
> =20
> +SRC_URI_append_class-target =3D " \
> +           ${@base_conditional( "DEBUG_BUILD", "1", " file://workaround-=
ice-ssa-corruption.patch", "", d )} \
> +           "
>  #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.=
patch
>  #           file://opensuse/guile-turn-off-gc-test.patch=20
> =20
> @@ -35,7 +38,10 @@ DEPENDS =3D "libunistring bdwgc gmp libtool libffi"
>  # add guile-native only to the target recipe's DEPENDS
>  DEPENDS_append_class-target =3D " guile-native libatomics-ops"
> =20
> -RDEPENDS_${PN}_append_libc-glibc_class-target =3D "glibc-gconv-iso8859-1"
> +RDEPENDS_${PN}_append_class-target =3D " \
> +             ${@base_conditional( "DEBUG_BUILD", "1", " readline ncurses=
", "", d )} \
> +             "

This seems to be needed even withotu DEBUG_BUILD, see
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/09558=
5.html
and IMHO it's build time dependncy not runtime.

> +RDEPENDS_${PN}_append_libc-glibc_class-target =3D " glibc-gconv-iso8859-=
1"
> =20
>  EXTRA_OECONF +=3D "${@['--without-libltdl-prefix --without-libgmp-prefix=
 --without-libreadline-prefix', ''][bb.data.inherits_class('native',d)]}"
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrnY8GquOzEdxs9Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPnf/oACgkQN1Ujt2V2gBx+SACgmJkcPhc4hZ2DwLgcFzN35kj4
6mkAmgOct97tqUIWSf7OBeatcJIizwmq
=6z8g
-----END PGP SIGNATURE-----

--lrnY8GquOzEdxs9Q--
