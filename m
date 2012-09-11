Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBR1D-0004yd-St
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 16:00:47 +0200
Received: by eekb57 with SMTP id b57so397732eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 06:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JC6u9r/0P7J3LaGG+KHu56wLcmh+veqJW2H1jSvyc1I=;
	b=FXS5gAQgD/LB9LPpTIcSnz+faK6K3JyTGa3BpZ8BzTYDkiAmUqNgzp1foCXjdgJBX+
	aiJ9V6rz/XuzRPtFJXoDq2O1LYJPo/PGfULDmcK6KdRFRBHe1rgIufdgY/hRZIBFbq6p
	kTrYsFLqzpO3TPcNA0BnVgVi4DOV2LM5tP8Y/O9iDYOd0t7murPs7RdkFomWPa9RfPii
	M12PCiTSZnU4HkL3VpHjVcNQIzImgZPdabY+DV1cEm09gTKRoPuSWxcyKrpXrqdK6n2e
	t0UpQfOxup72a56ZQk7e68CGfFtNfq7daqDEJiljNHWS97tPoF/jNSre4ChO58JMEiKh
	PEhA==
Received: by 10.204.148.12 with SMTP id n12mr4933900bkv.6.1347371296878;
	Tue, 11 Sep 2012 06:48:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm9687815bkc.5.2012.09.11.06.48.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 06:48:14 -0700 (PDT)
Date: Tue, 11 Sep 2012 15:48:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120911134814.GF14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120911130155.GC14077@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: paul.eggleton@linux.intel.com
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 14:00:48 -0000
X-Groupsio-MsgNum: 29036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XStn23h1fwudRqtG"
Content-Disposition: inline

--XStn23h1fwudRqtG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 03:01:55PM +0200, Martin Jansa wrote:
> Hi,
>=20
> when building spitz and qemuarm (both produces packages in armv5te feed)
> resulting packages are tuned with -mtune=3Dxscale (when built for spitz)=
=20
> or -mtune=3Darm926ej-s (when built for qemuarm).
>=20
> From
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c5
> Firstly, if you go changing the tune parameters in a given machine, you a=
re expected to use a different PACKAGE_ARCH. If you do that, you will get a=
 different package feed for the different binaries, different WORKDIR and s=
o on. This was always the way the package architectures was intended to wor=
k and nothing has changed there. Yes, you as the user changing various vari=
ables can create inconsistent package feeds. There are 101 ways you can do =
that, the simple answer is just don't. We're therefore unlikely to add MACH=
INE to DEPLOY_DIR or remove PACKAGE_ARCH, please just use it as its intende=
d.
>=20
> Does qemuarm use oe-core as it's intended?

CCing bluelightning because xscale is used in lot of meta-handheld machines:

Does this make sense?

OE @ ~/openembedded-core/meta/conf/machine/include $ diff -uNr tune-arm926*=
; diff -uNr tune-xscale.inc*
--- tune-arm926ejs.inc  2012-09-11 15:45:47.958202057 +0200
+++ tune-arm926ejs.inc.new      2012-09-11 15:45:40.579194777 +0200
@@ -8,4 +8,4 @@
 AVAILTUNES +=3D "arm926ejs"
 TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} arm926ejs"
 PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5te=
}"
-
+TUNE_PKGARCH_tune-arm926ejs =3D "armv5te-arm926ejs"
--- tune-xscale.inc     2012-08-28 11:01:04.899070433 +0200
+++ tune-xscale.inc.new 2012-09-11 15:43:24.560060591 +0200
@@ -8,10 +8,12 @@
 AVAILTUNES +=3D "xscale"
 TUNE_FEATURES_tune-xscale =3D "${TUNE_FEATURES_tune-armv5te} xscale"
 PACKAGE_EXTRA_ARCHS_tune-xscale =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5te}"
+TUNE_PKGARCH_tune-xscale =3D "armv5te-xscale"
=20
 AVAILTUNES +=3D "xscale-be"
 TUNE_FEATURES_tune-xscale-be =3D "${TUNE_FEATURES_tune-armv5teb} xscale bi=
gendian"
 PACKAGE_EXTRA_ARCHS_tune-xscale-be =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5te=
b}"
+TUNE_PKGARCH_tune-xscale-be =3D "armv5teb-xscale"
=20
 # webkit-gtk has alignment issues with double instructions on armv5 so
 # disable them here

>=20
> Shouldn't spitz produce something like armv5te-xscale and qemuarm armv5te=
-arm926ejs?
> It would cause all recipes to build again (cannot share armv5te feed anym=
ore),
> but at least it would build it and user will really get it on target, rig=
ht now
> opkg upgrade can download some packages with xscale some with arm926ej-s.
>=20
> $ ~/bitbake/bin/bitbake-diffsigs
>   stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4=
=2E3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
>   stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-headers-3=
=2E4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
>   basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2ff8613d0=
aafe60bef1a1e9469a1
>   Variable TUNE_CCARGS value changed from
>   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPKGS=
FX_THUMB}${ARMPKGSFX_DSP}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPKGS=
FX_THUMB}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", ""=
, d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb=
-interwork", "-mthumb-interwork", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FE=
ATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp=
", d), "" ,d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dxscale", "", =
d)}
>   to
>   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPKGS=
FX_THUMB}${ARMPKGSFX_DSP}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPKGS=
FX_THUMB}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", ""=
, d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb=
-interwork", "-mthumb-interwork", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FE=
ATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoftfp=
", d), "" ,d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3Darm926ej-s=
", "", d)}
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XStn23h1fwudRqtG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPQR4ACgkQN1Ujt2V2gBwIGQCgsjHKgpsvmRNE5KxrH9eIa3fN
3gIAoKJsZVCfKQ1LEh1QFUiqIX7xKjXN
=bvsF
-----END PGP SIGNATURE-----

--XStn23h1fwudRqtG--
