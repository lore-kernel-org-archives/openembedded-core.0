Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBQIM-0003KO-So
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 15:14:26 +0200
Received: by eaad12 with SMTP id d12so230791eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 06:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=Nzmn6f3w8eD6F8Hq2qhCnhLKcp5RJhSUnI1ZSOA4QkQ=;
	b=srFJzxi1HPrbizt8f14VI4vboD1TSEOfABfvI/j6sX21MJcakGaXIa9pKWnNlDMAQm
	vydParKeRznX/V5n6u9+pgfsH81O3MADmTsFPJEPJ+VqS8lMnaDG/VmdmD3gBD7kKHlW
	NnIHIN75JfkozR06gjVt30Gdr/NEF3BOcG6LQx5F6tDXX3eIWD+mJYbOP+uPzvCr8Kzd
	hsaSRXg7/fhm6Q4IB3Ae756Zx+qdPz5e+Ym57f9pDG9C4mpvRvbebddk7uHu0U1rOcdd
	srHbzmHBSUm6ayelLlXUpSF+CgKcmW49Oaqe3SuS+lg53m9YiZ6XzF3ReFC7j6FNa84F
	BS9g==
Received: by 10.204.9.194 with SMTP id m2mr4619416bkm.132.1347368515788;
	Tue, 11 Sep 2012 06:01:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm9530662bkv.11.2012.09.11.06.01.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 06:01:54 -0700 (PDT)
Date: Tue, 11 Sep 2012 15:01:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120911130155.GC14077@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 13:14:27 -0000
X-Groupsio-MsgNum: 29030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline

--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

when building spitz and qemuarm (both produces packages in armv5te feed)
resulting packages are tuned with -mtune=3Dxscale (when built for spitz)=20
or -mtune=3Darm926ej-s (when built for qemuarm).

=46rom
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c5
Firstly, if you go changing the tune parameters in a given machine, you are=
 expected to use a different PACKAGE_ARCH. If you do that, you will get a d=
ifferent package feed for the different binaries, different WORKDIR and so =
on. This was always the way the package architectures was intended to work =
and nothing has changed there. Yes, you as the user changing various variab=
les can create inconsistent package feeds. There are 101 ways you can do th=
at, the simple answer is just don't. We're therefore unlikely to add MACHIN=
E to DEPLOY_DIR or remove PACKAGE_ARCH, please just use it as its intended.

Does qemuarm use oe-core as it's intended?

Shouldn't spitz produce something like armv5te-xscale and qemuarm armv5te-a=
rm926ejs?
It would cause all recipes to build again (cannot share armv5te feed anymor=
e),
but at least it would build it and user will really get it on target, right=
 now
opkg upgrade can download some packages with xscale some with arm926ej-s.

$ ~/bitbake/bin/bitbake-diffsigs
  stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3=
-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
  stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4=
=2E3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
  basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2ff8613d0aa=
fe60bef1a1e9469a1
  Variable TUNE_CCARGS value changed from
  ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPKGSFX=
_THUMB}${ARMPKGSFX_DSP}", "", d)}
  ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPKGSFX=
_THUMB}", "", d)}
  ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", =
d)}
  ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-i=
nterwork", "-mthumb-interwork", d)}
  ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEAT=
URES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp",=
 d), "" ,d)}
  ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dxscale", "", d)}
  to
  ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPKGSFX=
_THUMB}${ARMPKGSFX_DSP}", "", d)}
  ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPKGSFX=
_THUMB}", "", d)}
  ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", =
d)}
  ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-i=
nterwork", "-mthumb-interwork", d)}
  ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEAT=
URES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp",=
 d), "" ,d)}
  ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3Darm926ej-s",=
 "", d)}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPNkMACgkQN1Ujt2V2gBzq8ACgo/8/qRGSXjyXs6ZO0hO9fIcc
TqQAoIz4Y/bc1LXdXxsvOWbDd9/urr0a
=rDq+
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
