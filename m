Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0326057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 19:21:42 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so30907421pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 11:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=0OGk8NHSBje2RyTeVUsPn6rp25o06Qa/F+wrVf8ckeE=;
	b=Xn5R35NXxcSgSNcbLJQW75A3wFzgKhfT98WxYZRBGMT5Zmpli5XfZok3elWGA8Ief6
	S/54MSTxyRdIaGDSVk66CuZlrI0j5PtzoHVGVuLtVl/goKkalqcGjMINzOQwak7MMW6L
	4FvCq/gd4/pWrWnxFBTpEmqQYQ5RE4y6eXxiE2cYwQ5qOl4OyADoDwPbY+Fec7KqMtwD
	+2prcaxl8IkSApmFtes4AevAmjsdIJ5BAAb9qZdw3Y7lihgwuTCGn3XE9DB3lLmezSqE
	1LzTXIQuJjoOlH8RCJO6qQyGqmRkufIwHyUa/pv670omqXkyCKEx1vLI1GQcL9IDiJHf
	oRdg==
X-Received: by 10.98.87.16 with SMTP id l16mr25158214pfb.80.1448392902983;
	Tue, 24 Nov 2015 11:21:42 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:a5bf:33d6:2cda:cd5?
	([2601:646:8802:5d5c:a5bf:33d6:2cda:cd5])
	by smtp.gmail.com with ESMTPSA id
	ud10sm16442990pab.27.2015.11.24.11.21.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Nov 2015 11:21:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56549E8B.9070401@ni.com>
Date: Tue, 24 Nov 2015 11:21:37 -0800
Message-Id: <631C7511-2BF3-4C32-AC35-E34599C84E98@gmail.com>
References: <565498D8.4050103@ni.com> <56549E8B.9070401@ni.com>
To: Jonathan David <jonathan.david@ni.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] glibc kernel version
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
X-List-Received-Date: Tue, 24 Nov 2015 19:21:42 -0000
X-Groupsio-MsgNum: 73912
Content-Type: multipart/signed;
	boundary="Apple-Mail=_02DACE3A-E2AA-45DD-B434-2D9B566D3F7A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_02DACE3A-E2AA-45DD-B434-2D9B566D3F7A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 24, 2015, at 9:29 AM, Jonathan David <jonathan.david@ni.com> =
wrote:
>=20
> The change below only replaces the kernel version checked by the shar
> file, so that machines running on the 2.6 kernel can unpack an SDK
> archive; however, the SDK will be unusable if the bundled glibc =
requires a later kernel than what is installed. glibc's minimal kernel =
version is determined by OLDEST_KERNEL, which from testing does not =
appear to be influenced by SDK_OLDEST_KERNEL.
>=20
> For example, setting OLDEST_KERNEL=3D3.14 and SDK_OLDEST_KERNEL=3D2.6 =
still results in an unusable SDK on systems running [2.6, 3.14) kernels.
>=20
> Is this a problem that many can expect to encounter, or is bumping the =
version of glibc beyond 2.6 uncommon?

We need to compile nativesdk components as well as nativesdk-glibc using =
this defined to 2.6.32 as well. otherwise it will have wrong assumptions =
about
system calls available to it during build ( 3.14 ) vs at runtime ( =
2.6.32 ) and many nativesdk programs could fail to run properly. Please =
note that 2.22 needs 2.6.32
can=E2=80=99t go below that.

>=20
>=20
> commit: 522ba4c51fff53566678b2689d0d63c393e417b3
> populate_sdk_base: Fix aarch64 OLDEST_KERNEL sdk issues
>=20
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -81,6 +81,11 @@ python write_host_sdk_manifest () {
> POPULATE_SDK_POST_TARGET_COMMAND_append =3D " =
write_target_sdk_manifest ; "
> POPULATE_SDK_POST_HOST_COMMAND_append =3D " write_host_sdk_manifest; "
>=20
> +# Some archs override this, we need the nativesdk version
> +# turns out this is hard to get from the datastore due to
> TRANSLATED_TARGET_ARCH
> +# manipulation.
> +SDK_OLDEST_KERNEL =3D "2.6.32"
> +
> fakeroot python do_populate_sdk() {
> from oe.sdk import populate_sdk
> from oe.manifest import create_manifest, Manifest
> @@ -156,7 +161,7 @@ EOF
> sed -i -e 's#@SDK_ARCH@#${SDK_ARCH}#g' \
> -e 's#@SDKPATH@#${SDKPATH}#g' \
> -e 's#@SDKEXTPATH@#${SDKEXTPATH}#g' \
> - -e 's#@OLDEST_KERNEL@#${OLDEST_KERNEL}#g' \
> + -e 's#@OLDEST_KERNEL@#${SDK_OLDEST_KERNEL}#g' \
> -e 's#@REAL_MULTIMACH_TARGET_SYS@#${REAL_MULTIMACH_TARGET_SYS}#g' \
> -e 's#@SDK_TITLE@#${SDK_TITLE}#g' \
> -e 's#@SDK_VERSION@#${SDK_VERSION}#g' \
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_02DACE3A-E2AA-45DD-B434-2D9B566D3F7A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZUuMUACgkQuwUzVZGdMxTpwwCeLZzmxEZ5cOX/joF4wltg3vtH
IyIAn2mYS/Y30ISN0lh5ox1nmlqfBKk6
=4ZWl
-----END PGP SIGNATURE-----

--Apple-Mail=_02DACE3A-E2AA-45DD-B434-2D9B566D3F7A--
