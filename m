Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 816D37570D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 16:20:08 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so69785615wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 09:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=86A0Mdo6CsBQT7VcYrFuPSWm6YsyjUAWCIr+e6XSruk=;
	b=QRQVCNxlrBnEATXlvoGLh1OCJe0n/19WVExQAHRbyXwGnwmcoGsKJJiLIhr/XLN34h
	tTqg3z1oCLUTRkaoV34eK2tqNrs0R/wCGw+wHMcioAPTPf4+QXb/3P975Q1uHsLUUrQm
	K/N3/u+rPw2w0shNWlYvekyeM6VLaobWJCs6OnZsCnrXbWJE3l85y74Wh5xnsgBDThcC
	OLvZpMEJtVKptwgGZSkeO+bV0yal9ejmWvI76nqyMb5sYykuTLV0jDk2ZuVPeJHwUbMm
	SRyHfdgTCu3uNMPlyV8puuZpPwesf2b5ZVHaVvb/omEPOohaNvGXNW5XKxmE3T/0FJlK
	pD5Q==
X-Received: by 10.194.236.200 with SMTP id uw8mr5125211wjc.126.1443630008971; 
	Wed, 30 Sep 2015 09:20:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id ly4sm1480543wjb.4.2015.09.30.09.20.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Sep 2015 09:20:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Sep 2015 18:21:02 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150930162101.GE2405@jama>
References: <1443620963.5162.85.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1443620963.5162.85.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/sstatetests: Add test that MACHINE doesn't change target sigs
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
X-List-Received-Date: Wed, 30 Sep 2015 16:20:11 -0000
X-Groupsio-MsgNum: 71824
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YkJPYEFdoxh/AXLE"
Content-Disposition: inline

--YkJPYEFdoxh/AXLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 02:49:23PM +0100, Richard Purdie wrote:
> When we change between two machines with the same tune, we shouldn't see=
=20
> rebuilds of binaries. This adds a test for this using the qemux86copy=20
> machine. We also extend the test to cover multilibs.

2nd level of this test is to verify that all allarch recipes have the
same signatures even for 2 MACHINEs with different tunes.

Thanks for looking into this.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selfte=
st/sstatetests.py
> index 1940e66..af68e02 100644
> --- a/meta/lib/oeqa/selftest/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/sstatetests.py
> @@ -329,4 +329,49 @@ MACHINE =3D \"qemuarm\"
>          files2 =3D [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash=
") for x in files2]
>          self.maxDiff =3D None
>          self.assertItemsEqual(files1, files2)
> -       =20
> +
> +    def test_sstate_sametune_samesigs(self):
> +        """
> +        The sstate checksums of two identical machines (using the same t=
une) should be the=20
> +        same, apart from changes within the machine specific stamps dire=
ctory. We use the
> +        qemux86copy machine to test this. Also include multilibs in the =
test.
> +        """
> +
> +        topdir =3D get_bb_var('TOPDIR')
> +        targetos =3D get_bb_var('TARGET_OS')
> +        targetvendor =3D get_bb_var('TARGET_VENDOR')
> +        self.write_config("""
> +TMPDIR =3D \"${TOPDIR}/tmp-sstatesamehash\"
> +MACHINE =3D \"qemux86\"
> +require conf/multilib.conf
> +MULTILIBS =3D "multilib:lib32"
> +DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> +""")
> +        self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
> +        bitbake("world meta-toolchain -S none")
> +        self.write_config("""
> +TMPDIR =3D \"${TOPDIR}/tmp-sstatesamehash2\"
> +MACHINE =3D \"qemux86copy\"
> +require conf/multilib.conf
> +MULTILIBS =3D "multilib:lib32"
> +DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> +""")
> +        self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
> +        bitbake("world meta-toolchain -S none")
> +
> +        def get_files(d):
> +            f =3D []
> +            for root, dirs, files in os.walk(d):
> +                for name in files:
> +                    if "meta-environment" in root or "cross-canadian" in=
 root:
> +                        continue
> +                    if "qemux86copy-" in root or "qemux86-" in root:
> +                        continue
> +                    if "do_build" not in name and "do_populate_sdk" not =
in name:
> +                        f.append(os.path.join(root, name))
> +            return f
> +        files1 =3D get_files(topdir + "/tmp-sstatesamehash/stamps")
> +        files2 =3D get_files(topdir + "/tmp-sstatesamehash2/stamps")
> +        files2 =3D [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash=
") for x in files2]
> +        self.maxDiff =3D None
> +        self.assertItemsEqual(files1, files2)
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YkJPYEFdoxh/AXLE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYMC+0ACgkQN1Ujt2V2gBz7PQCgiETUTtmnu3ruv5MMpllk0bWA
rXgAn2CzHF+rUd5ifCjtd8qUtbA8WcbM
=mOUC
-----END PGP SIGNATURE-----

--YkJPYEFdoxh/AXLE--
