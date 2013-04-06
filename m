Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UOSkF-0007b1-FO
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 15:01:24 +0200
Received: by mail-pa0-f42.google.com with SMTP id kq13so2464328pab.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 05:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=VoGIKKg/gsRiIvzv30BK4+I/Y8Ie/+ahwjg77xoiSgQ=;
	b=atyxVSufnCf0+DdP9+jMv6FBhhCCpfxs8DuMczpaW7J8yMpcX3gWjz24PWSzSn9dJE
	/J2NW+xswi9vxXHRZMXnV+/tvJB2lWUtc2FtOQbVadyfa9C5xVLGMWpVlzo1/L5BafA2
	CIEh90qTLwKwf0Po+HsCMkjSPTYwbFmyLtzooRxOzaBTXgWFAMALbq2LPBUAWoGZ8VvN
	3LDFq6Ip58MJgeimj0sC/TXVblP/sGDlkXxdJvkv58lCMAZqTZ+XtFEBRVjShAe1f2zP
	KXBi16Mg7suEVbRiA4/OcmvThnxfwprAx+ZstK+2IfUuMcemj9OlY5jfYOnk2GCRhdTt
	jQdw==
X-Received: by 10.68.33.193 with SMTP id t1mr19533469pbi.43.1365252246807;
	Sat, 06 Apr 2013 05:44:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id in5sm18361446pbc.20.2013.04.06.05.44.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 05:44:05 -0700 (PDT)
Date: Sat, 6 Apr 2013 14:43:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20130406124357.GC3196@jama>
References: <515E976C.8060302@linaro.org> <20130405212038.GG3191@jama>
	<CABcZANnvkcKCA14uuOjFcK6tRdNhy27m-+bPAjQbd=W2FK+HJw@mail.gmail.com>
	<CA+chaQdLwM_iLaCA=aq19q941CEKKAhbJb9L8Oe=TVd4sDU9wA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdLwM_iLaCA=aq19q941CEKKAhbJb9L8Oe=TVd4sDU9wA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does support for external toolchains working in current OE?
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
X-List-Received-Date: Sat, 06 Apr 2013 13:01:25 -0000
X-Groupsio-MsgNum: 37521
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline

--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 06, 2013 at 12:10:01AM +0200, Martin Jansa wrote:
> I've already tried that, systemd's configure does not respect that.

I've patch for systemd which "fixes" this:

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/s=
ystemd/systemd_199.bb
index e574548..2bb9566 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -76,6 +76,15 @@ EXTRA_OECONF_append_libc-uclibc =3D " --disable-myhostna=
me "
 do_configure_prepend() {
        export CPP=3D"${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH=
}"
=20
+       # Allow to override them from shell variables with right prefix
+       # in some cases (external toolchain) HOST_PREFIX is not the same as=
 HOST_SYS
+       sed -i "s#AC_PATH_TOOL(OBJCOPY,#AC_CHECK_TOOL(OBJCOPY,#g; \
+               s#AC_PATH_TOOL(STRINGS,#AC_CHECK_TOOL(STRINGS,#g; \
+               s#AC_PATH_TOOL(GPERF,#AC_CHECK_TOOL(GPERF,#g" ${S}/configur=
e.ac
+       # OBJCOPY is already exported by default
+       export STRINGS=3D"${HOST_PREFIX}strings"
+       export GPERF=3D"${HOST_PREFIX}gperf"
+
        sed -i -e 's:=3D/root:=3D${ROOT_HOME}:g' units/*.service*
 }
=20
But I'm still looking for some more global solution, what can go wrong when
external toolchain overwrites HOST_SYS to match overwritten TARGET_PREFIX?

e.g.
tcmode-external-sourcery.inc:TARGET_PREFIX =3D "${CSL_TARGET_SYS}-"

bitbake.conf:
HOST_ARCH =3D "${TARGET_ARCH}"
HOST_OS =3D "${TARGET_OS}"
HOST_VENDOR =3D "${TARGET_VENDOR}"
HOST_SYS =3D "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
HOST_PREFIX =3D "${TARGET_PREFIX}"

TARGET_ARCH =3D "${TUNE_ARCH}"
TARGET_OS =3D "linux${LIBCEXTENSION}${ABIEXTENSION}"
TARGET_VENDOR =3D "-oe"
TARGET_SYS =3D "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS=
', True), ''][d.getVar('TARGET_OS', True) =3D=3D ('' or 'custom')]}"
TARGET_PREFIX =3D "${TARGET_SYS}-"

So when external-tc changes TARGET_PREFIX, it modifies HOST_PREFIX and=20
both are inconsistent with TARGET_SYS/HOST_SYS which is used by autoconf=20
for AC_PATH_TOOL.

> On Sat, Apr 6, 2013 at 12:08 AM, Chris Larson <clarson@kergoth.com> wrote:
>=20
> >
> > On Fri, Apr 5, 2013 at 2:20 PM, Martin Jansa <martin.jansa@gmail.com>wr=
ote:
> >
> >> On Fri, Apr 05, 2013 at 11:20:44AM +0200, Marcin Juszkiewicz wrote:
> >> > For last few months I am working on fixing Linaro binary cross
> >> > toolchains and their support in OpenEmbedded. Got to point when they
> >> > work (both AArch64 and ARMv7a ones) for single packages but problem
> >> > starts when I want to create image...
> >>
> >> Today I got different king of issue with external toolchain.
> >>
> >> systemd is using AC_PATH_TOOL(OBJCOPY, objcopy)
> >> but host prefix in OE is not the same as in binary toolchain (different
> >> TARGET_VENDOR)
> >> so it looks for configure:14545: checking for
> >> arm-foo-linux-gnueabi-objcopy
> >> while binary toolchain has only
> >> arm-bar-linux-gnueabi-objcopy
> >>
> >> and because arm-foo-linux-gnueabi-objcopy wasn't found it continues:
> >> configure:14588: checking for objcopy
> >> configure:14606: found /usr/bin/objcopy
> >> and bam a lot later when it tries objcopy from host on some arm lib
> >>
> >> Interesting that systemd is first recipe in our image where I've notic=
ed
> >> issues like this
> >>
> >> Any idea how to easily resolve this without checking every configure.ac
> >> how it's looking for e.g. objcopy?
> >
> >
> > export OBJCOPY in the environment to the one based on TARGET_PREFIX rat=
her
> > than TARGET_SYS, and it'll use that.
> > --
> > Christopher Larson
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFgGI0ACgkQN1Ujt2V2gBx9hACdGzm73qSmmXewM8dLOxU9kW0o
5HgAoJXtvplac+LlJhE1vOsWwc1GAv0X
=nwxP
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
