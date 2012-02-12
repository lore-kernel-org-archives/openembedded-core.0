Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Rwf5t-0007lu-Jz for openembedded-core@lists.openembedded.org;
	Sun, 12 Feb 2012 20:28:17 +0100
Received: from g225080050.adsl.alicedsl.de ([92.225.80.50]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RweyH-0006Kk-KK; Sun, 12 Feb 2012 19:20:26 +0000
Message-ID: <1329074394.3359.29.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Feb 2012 20:19:54 +0100
In-Reply-To: <1329072178-18881-1-git-send-email-andrei@gherzan.ro>
References: <1329072178-18881-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] nspr: Compile nspr with tests 1. Compile package tests suite 2. Add patch for removing rpath from binaries 3. Add tests to -dev rpm as it needs dev libraries
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
X-List-Received-Date: Sun, 12 Feb 2012 19:28:17 -0000
X-Groupsio-MsgNum: 17455
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-YfDdSFTFu51G/H0qAUZw"

--=-YfDdSFTFu51G/H0qAUZw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andrei,


Am Sonntag, den 12.02.2012, 20:42 +0200 schrieb Andrei Gherzan:

Thank you for your patch. Unfortunately all the commit message went in
the subject line so there seem to be some line breaks missing.

Additionally I think 2. is unrelated and could be a separate patch?

> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---

If you send updated patches please add that to the tag PATCH like for
example [PATCH v3] [1].

Also please add what changed to the previous iterations.

>  .../nspr/files/remove-rpath-from-tests.patch       |   21 +++
>  meta/recipes-support/nspr/nspr_4.8.9.bb            |  134 ++++++++++++++=
+++++-
>  2 files changed, 151 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-support/nspr/files/remove-rpath-from-tes=
ts.patch
>=20
> diff --git a/meta/recipes-support/nspr/files/remove-rpath-from-tests.patc=
h b/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
> new file mode 100644
> index 0000000..819c784
> --- /dev/null
> +++ b/meta/recipes-support/nspr/files/remove-rpath-from-tests.patch
> @@ -0,0 +1,21 @@
> +Author: Andrei Gherzan <andrei@gherzan.ro>
> +Date:   Thu Feb 9 00:03:38 2012 +0200
> +
> +Avoid QA warnings by removing hardcoded rpath from binaries.

Could you paste that warning here please.

> +
> +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> +Upstream-Status: Pending
> +
> +Index: nspr-4.8.9/mozilla/nsprpub/pr/tests/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- nsprpub.orig/pr/tests/Makefile.in	2012-02-11 00:01:10.476220505 +020=
0
> ++++ nsprpub/pr/tests/Makefile.in	2012-02-10 23:57:40.000000000 +0200
> +@@ -379,7 +379,7 @@
> + endif
> +=20
> + ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
> +-    LDOPTS +=3D -Xlinker -rpath $(ABSOLUTE_LIB_DIR)
> ++    LDOPTS +=3D -Xlinker
> +     ifeq ($(USE_PTHREADS),1)
> +         EXTRA_LIBS =3D -lpthread
> +     endif
> diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-suppo=
rt/nspr/nspr_4.8.9.bb
> index da324fc..c68599c 100644
> --- a/meta/recipes-support/nspr/nspr_4.8.9.bb
> +++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
> @@ -5,17 +5,135 @@ LIC_FILES_CHKSUM =3D "file://configure.in;beginline=3D=
3;endline=3D40;md5=3D99d4d7d68bbc4
>                      file://Makefile.in;beginline=3D4;endline=3D38;md5=3D=
c2b512182a334e1bfa1edc4d1c84a298 "
>  SECTION =3D "libs/network"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
> -SRC_URI =3D "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/=
src/nspr-${PV}.tar.gz"
> +SRC_URI =3D "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/=
src/nspr-${PV}.tar.gz \
> +           file://remove-rpath-from-tests.patch"

Could you please change that to the following to make future diffs
smaller.

SRC_URI =3D "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src=
/nspr-${PV}.tar.gz \
           file://remove-rpath-from-tests.patch \
          "

> =20
> -SRC_URI +=3D "file://nspr.pc.in "
> +SRC_URI +=3D "file://nspr.pc.in"
> =20
>  SRC_URI[md5sum] =3D "60770d45dc08c0f181b22cdfce5be3e8"
>  SRC_URI[sha256sum] =3D "ff43c7c819e72f03bb908e7652c5d5f59a5d31ee86c333e6=
92650207103d1cce"
> =20
>  S =3D "${WORKDIR}/nspr-${PV}/mozilla/nsprpub"
> =20
> +TESTS =3D "runtests.pl \
> +    runtests.sh \
> +    accept \
> +    acceptread \
> +    acceptreademu \
> +    affinity \
> +    alarm \
> +    anonfm \
> +    atomic \
> +    attach \
> +    bigfile \
> +    cleanup \
> +    cltsrv  \
> +    concur \
> +    cvar \
> +    cvar2 \
> +    dlltest \
> +    dtoa \
> +    errcodes \
> +    exit \
> +    fdcach \
> +    fileio \
> +    foreign \
> +    formattm \
> +    fsync \
> +    gethost \
> +    getproto \
> +    i2l \
> +    initclk \
> +    inrval \
> +    instrumt \
> +    intrio \
> +    intrupt \
> +    io_timeout \
> +    ioconthr \
> +    join \
> +    joinkk \
> +    joinku \
> +    joinuk \
> +    joinuu \
> +    layer \
> +    lazyinit \
> +    libfilename \
> +    lltest \
> +    lock \
> +    lockfile \
> +    logfile \
> +    logger \
> +    many_cv \
> +    multiwait \
> +    nameshm1 \
> +    nblayer \
> +    nonblock \
> +    ntioto \
> +    ntoh \
> +    op_2long \
> +    op_excl \
> +    op_filnf \
> +    op_filok \
> +    op_nofil \
> +    parent \
> +    parsetm \
> +    peek \
> +    perf \
> +    pipeping \
> +    pipeping2 \
> +    pipeself \
> +    poll_nm \
> +    poll_to \
> +    pollable \
> +    prftest \
> +    primblok \
> +    provider \
> +    prpollml \
> +    ranfile \
> +    randseed \
> +    reinit \
> +    rwlocktest \
> +    sel_spd \
> +    selct_er \
> +    selct_nm \
> +    selct_to \
> +    selintr \
> +    sema \
> +    semaerr \
> +    semaping \
> +    sendzlf \
> +    server_test \
> +    servr_kk \
> +    servr_uk \
> +    servr_ku \
> +    servr_uu \
> +    short_thread \
> +    sigpipe \
> +    socket \
> +    sockopt \
> +    sockping \
> +    sprintf \
> +    stack \
> +    stdio \
> +    str2addr \
> +    strod \
> +    switch \
> +    system \
> +    testbit \
> +    testfile \
> +    threads \
> +    timemac \
> +    timetest \
> +    tpd \
> +    udpsrv \
> +    vercheck \
> +    version \
> +    writev \
> +    xnotify \
> +    zerolen"
> +
>  inherit autotools
> =20
>  do_configure() {
> @@ -26,12 +144,20 @@ do_compile_prepend() {
>  	oe_runmake CROSS_COMPILE=3D1 CFLAGS=3D"-DXP_UNIX" LDFLAGS=3D"" CC=3Dgcc=
 -C config export
>  }
> =20
> +do_compile_append() {
> +	oe_runmake -C pr/tests
> +}
> +
>  do_install_append() {
>      install -D ${WORKDIR}/nspr.pc.in ${D}${libdir}/pkgconfig/nspr.pc
>      sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nspr.pc
>      sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nspr.pc
>      sed -i s:OEINCDIR:${includedir}:g ${D}${libdir}/pkgconfig/nspr.pc
>      sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nspr.=
pc
> +    cd ${S}/pr/tests
> +    mkdir -p ${D}/opt/nspr_tests
> +    install -m 0755 ${TESTS} ${D}/opt/nspr_tests
>  }

I am not sure if `/opt` is a good choice.

> =20
> -
> +FILES_${PN}-dev +=3D "/opt/nspr_tests/*"
> +FILES_${PN}-dbg +=3D "/opt/nspr_tests/.debug/*"


Thanks,

Paul


[1] http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#=
Create_and_Commit_your_patch

--=-YfDdSFTFu51G/H0qAUZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk84ENsACgkQPX1aK2wOHVj/QgCfWTU34T2otepLIRF2tYC+nemk
eJoAn1XefamQNkUao4x06asa/VblMr0Y
=6JsF
-----END PGP SIGNATURE-----

--=-YfDdSFTFu51G/H0qAUZw--
