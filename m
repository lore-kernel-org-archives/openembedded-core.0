Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5100077035
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 17:09:49 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so11598868pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=+vBWouSYxcJMDi1ndb7jzuJkHu8eT2t8PQwHEdKkLfg=;
	b=HqUrjiHs1/YKg8Y/x9LQ8pozpsaW4PDxD/4rMHpxgqWe5KCXpyYmEWn2kOXcx0NhVJ
	4KW2LBS2VXPxoJBWhNMNcDI0556Vps/BijSuM/127xnWgG27p6M3SO4eSguqMm/BgTtO
	Lsq1HuycDCj1yeqIEWlLSYkZq5cEewNftcW6cWxupctCevsxsORyBARuk5aAfSCNdCw2
	c4IX16+uxR+ykSIFxCnV91ymCbnK0l4xtS/FUk+1nAIVfIMqqCwApmUzEWhCL9XD19No
	lOfDJieBouID0Fh4FIHx+ZDs9fAdLhOu92HVabnmVqpNKU2X43qiYoW/9Lh1ZwXmdyyb
	++Jg==
X-Received: by 10.68.135.136 with SMTP id ps8mr34122151pbb.123.1443546590422; 
	Tue, 29 Sep 2015 10:09:50 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f90b:6fa0:21f7:85bc?
	([2601:646:8601:4580:f90b:6fa0:21f7:85bc])
	by smtp.gmail.com with ESMTPSA id
	z6sm26603149pbt.51.2015.09.29.10.09.49
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Sep 2015 10:09:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443533265.5162.35.camel@linuxfoundation.org>
Date: Tue, 29 Sep 2015 10:09:48 -0700
Message-Id: <919610E7-93B7-41EF-ADC7-8C6A179C9950@gmail.com>
References: <1443533265.5162.35.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linuxloader/image-prelink/image-mklibs: Fix non-standard path prelinking
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
X-List-Received-Date: Tue, 29 Sep 2015 17:09:54 -0000
X-Groupsio-MsgNum: 71752
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E87AAA55-43C9-4C88-85B7-605BA01B2A61";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E87AAA55-43C9-4C88-85B7-605BA01B2A61
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 29, 2015, at 6:27 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> Prelinking on x86-64 wasn't working out the box as it uses /lib and
> not /lib64 for libs. Prelink was refusing to link as the dynamic =
loader
> didn't match its idea of the right path. Passing in the =
--dyanmic-linker
> option avoids this.
>=20
> We can share code from image-mklibs so abstract that into a new class,
> linuxloader.bbclass.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/image-mklibs.bbclass =
b/meta/classes/image-mklibs.bbclass
> index c455a8e..45a66fb 100644
> --- a/meta/classes/image-mklibs.bbclass
> +++ b/meta/classes/image-mklibs.bbclass
> @@ -2,6 +2,8 @@ do_rootfs[depends] +=3D =
"mklibs-native:do_populate_sysroot"
>=20
> IMAGE_PREPROCESS_COMMAND +=3D "mklibs_optimize_image; "
>=20
> +inherit linuxloader
> +
> mklibs_optimize_image_doit() {
> 	rm -rf ${WORKDIR}/mklibs
> 	mkdir -p ${WORKDIR}/mklibs/dest
> @@ -15,26 +17,8 @@ mklibs_optimize_image_doit() {
> 		| sed "s+^\./++" \
> 		> ${WORKDIR}/mklibs/executables.list
>=20
> -	case ${TARGET_ARCH} in
> -		powerpc | mips | mipsel | microblaze )
> -			dynamic_loader=3D"${base_libdir}/ld.so.1"
> -			;;
> -		powerpc64)
> -			dynamic_loader=3D"${base_libdir}/ld64.so.1"
> -			;;
> -		x86_64)
> -			=
dynamic_loader=3D"${base_libdir}/ld-linux-x86-64.so.2"
> -			;;
> -		i586 )
> -			dynamic_loader=3D"${base_libdir}/ld-linux.so.2"
> -			;;
> -		arm )
> -			dynamic_loader=3D"${base_libdir}/ld-linux.so.3"
> -			;;
> -		* )
> -			dynamic_loader=3D"/unknown_dynamic_linker"
> -			;;
> -	esac
> +	# Set $dynamic_loader
> +        linuxloader
>=20
> 	mklibs -v \
> 		--ldlib ${dynamic_loader} \
> diff --git a/meta/classes/image-prelink.bbclass =
b/meta/classes/image-prelink.bbclass
> index d4bb3ae..4bb090d 100644
> --- a/meta/classes/image-prelink.bbclass
> +++ b/meta/classes/image-prelink.bbclass
> @@ -2,6 +2,8 @@ do_rootfs[depends] +=3D =
"prelink-native:do_populate_sysroot"
>=20
> IMAGE_PREPROCESS_COMMAND +=3D "prelink_image; "
>=20
> +inherit linuxloader
> +
> prelink_image () {
> #	export PSEUDO_DEBUG=3D4
> #	/bin/env | /bin/grep PSEUDO
> @@ -20,8 +22,11 @@ prelink_image () {
> 		dummy_prelink_conf=3Dfalse;
> 	fi
>=20
> +	# Set $dynamic_loader
> +	linuxloader
> +
> 	# prelink!
> -	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root =
${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
> +	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root =
${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker =
$dynamic_loader
>=20
> 	# Remove the prelink.conf if we had to add it.
> 	if [ "$dummy_prelink_conf" =3D "true" ]; then
> diff --git a/meta/classes/linuxloader.bbclass =
b/meta/classes/linuxloader.bbclass
> new file mode 100644
> index 0000000..578df14
> --- /dev/null
> +++ b/meta/classes/linuxloader.bbclass
> @@ -0,0 +1,23 @@
> +
> +linuxloader () {
> +	case ${TARGET_ARCH} in
> +		powerpc | mips | mipsel | microblaze )
> +			dynamic_loader=3D"${base_libdir}/ld.so.1"
> +			;;
> +		powerpc64)
> +			dynamic_loader=3D"${base_libdir}/ld64.so.1"
> +			;;
> +		x86_64)
> +			=
dynamic_loader=3D"${base_libdir}/ld-linux-x86-64.so.2"
> +			;;
> +		i586 )
> +			dynamic_loader=3D"${base_libdir}/ld-linux.so.2"
> +			;;
> +		arm )
> +			dynamic_loader=3D"${base_libdir}/ld-linux.so.3"
> +			;;
> +		* )
> +			dynamic_loader=3D"/unknown_dynamic_linker"
> +			;;
> +	esac
> +}
>=20
>=20

For readability it would have been nice if it was returning the value =
from function so it could be used

myloader =3D call this function



> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_E87AAA55-43C9-4C88-85B7-605BA01B2A61
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYKxdwACgkQuwUzVZGdMxTb8wCfVzojl7R5ohIq7pstbMNLhkY9
aCgAnjXcOaewXuZmh5KFwzYCVTRRGaSZ
=nubI
-----END PGP SIGNATURE-----

--Apple-Mail=_E87AAA55-43C9-4C88-85B7-605BA01B2A61--
