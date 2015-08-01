Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 08855765B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Aug 2015 12:14:02 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so54909078pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Aug 2015 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dVSngVZcgBnnO4h30BfWqEMpMoXkZ25mZ0MBUZRFi9U=;
	b=vP2BpMOBMY6r2bcFOHzyrSTO+k7QWOwZAzOy2IeGJw6LHMbyRCLysorw7Yljuz35ni
	93CT/jwM/OWk4IY2Y+pIUa1TgLF1ZfY3165c00VNQq6UMzMswUkRpuLfVzVSM9zZXNol
	ZO3dblp+Ysef/6kjlLig1dSue+e22cWO2EK9lIU+7mzKfP4FZ2tKFJ8vSm4cCwkCkrFH
	xeIS7NrVctYgrkiJpaJXZ8mT4nHhjFROV+TYbB2YbD+jtZkyBCkWjiy9oqxzNcxJCRy2
	q8nYkS4/AS7PUjomsFaRvAqq/qEweznmeMdoawrJ8DowSwcnaY2y5FNL5ka1asRaOkf3
	KUYw==
MIME-Version: 1.0
X-Received: by 10.70.91.14 with SMTP id ca14mr2865817pdb.150.1438431243061;
	Sat, 01 Aug 2015 05:14:03 -0700 (PDT)
Received: by 10.70.65.4 with HTTP; Sat, 1 Aug 2015 05:14:03 -0700 (PDT)
In-Reply-To: <1437553270-9514-1-git-send-email-schnitzeltony@googlemail.com>
References: <1437553270-9514-1-git-send-email-schnitzeltony@googlemail.com>
Date: Sat, 1 Aug 2015 14:14:03 +0200
Message-ID: <CALbNGRQJvy1GbYp2tBJ_5fk1-yD3cGKd_6DGd=Yubx-vAL6__g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: add python3 support
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
X-List-Received-Date: Sat, 01 Aug 2015 12:14:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2015 at 10:21 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * Both - python/python3 - libs are build by adding 'python' to PACKAGECON=
FIG
>   but are packed into separate packages
> * Indention was wrong in __anonymous()
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-support/boost/boost.inc | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
> index 27d489f..3288e84 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -24,8 +24,8 @@ BOOST_LIBS =3D "\
>
>  # optional boost-python library
>  PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[python] =3D ",,python"
> -BOOST_LIBS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python=
', '', d)}"
> +PACKAGECONFIG[python] =3D ",,python python3"
> +BOOST_LIBS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python=
 python3', '', d)}"
>  inherit python-dir
>  PYTHON_ROOT =3D "${STAGING_DIR_HOST}/${prefix}"
>
> @@ -35,9 +35,16 @@ python __anonymous () {
>      packages =3D []
>      extras =3D []
>      for lib in d.getVar('BOOST_LIBS', True).split( ):
> -            pkg =3D "boost-%s" % lib.replace("_", "-")
> +        # BJAM does not know '--with-python3' (only --with-python)
> +        if lib !=3D "python3":
>              extras.append("--with-%s" % lib)
> -            packages.append(pkg)
> +        pkg =3D "boost-%s" % lib.replace("_", "-")
> +        packages.append(pkg)
> +        if lib =3D=3D "python":
> +            # special: python*.so matches python3.so !!
> +            if not d.getVar("FILES_%s" % pkg, True):
> +                    d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s.so=
.*" % lib)
> +        else:
>              if not d.getVar("FILES_%s" % pkg, True):
>                      d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.s=
o.*" % lib)
>      d.setVar("BOOST_PACKAGES", " ".join(packages))
> @@ -101,7 +108,6 @@ BJAM_TOOLS   =3D "--ignore-site-config \
>                 '-sGCC_INCLUDE_DIRECTORY=3D${STAGING_INCDIR}' \
>                 '-sGCC_STDLIB_DIRECTORY=3D${STAGING_LIBDIR}' \
>                 '-sBUILD=3Drelease <optimization>space <threading>multi <=
inlining>on <debug-symbols>off' \
> -               '-sPYTHON_VERSION=3D${PYTHON_BASEVERSION}' \
>                 '-sPYTHON_ROOT=3D${PYTHON_ROOT}' \
>                 '--layout=3Dsystem' \
>                 "
> @@ -149,6 +155,7 @@ do_boostconfig() {
>         sed -i "/^using python : ${PYTHON_BASEVERSION}"/d ${S}/tools/buil=
d/example/user-config.jam
>         echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>=
"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${S}/tools/build/example/user-c=
onfig.jam
>         echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/=
python${PYTHON_BASEVERSION} ;" >> ${S}/tools/build/example/user-config.jam
> +       echo "using python : 3.4 : : ${STAGING_INCDIR}/python3.4m ;" >> $=
{S}/tools/build/example/user-config.jam
>
>         CC=3D"${BUILD_CC}" CFLAGS=3D"${BUILD_CFLAGS}" ./bootstrap.sh --wi=
th-bjam=3Dbjam --with-toolset=3Dgcc --with-python-root=3D${PYTHON_ROOT}
>         sed -i '/^using python/d' project-config.jam
> --
> 1.9.3
>
Why do I get the feeling that most non guru patches need ping? So ping

Andreas

