Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id 24D3F601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 05:02:27 +0000 (UTC)
Received: from nbhjo (114-136-54-144.EMOME-IP.hinet.net [114.136.54.144])
	by msfrf2635.sfr.fr (SMTP Server) with ESMTP id C26771C01245E;
	Mon, 21 Nov 2016 06:02:25 +0100 (CET)
Received: from nbhjo (114-136-54-144.EMOME-IP.hinet.net
	[114.136.54.144])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2635.sfr.fr (SMTP Server) with ESMTPSA;
	Mon, 21 Nov 2016 06:02:23 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Khem Raj' <raj.khem@gmail.com>
References: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
	<1479643823-11675-3-git-send-email-herve.jourdain@neuf.fr>
	<CAMKF1sqhpWEsjXg-CSoYmrOvxXFHG7voCjAv78gbbV8_QG3v9Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqhpWEsjXg-CSoYmrOvxXFHG7voCjAv78gbbV8_QG3v9Q@mail.gmail.com>
Date: Mon, 21 Nov 2016 06:02:15 +0100
Message-ID: <000001d243b4$71402850$53c078f0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQI+VLVPZZ+ga1ONwoVoKiDd75YPOQJbnJWvAdE0XfKf6VYWkA==
X-sfr-mailing: LEGIT
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] arch-armv8.inc: add support for 32bits armv8 options
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
X-List-Received-Date: Mon, 21 Nov 2016 05:02:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hi Khem,

It does cover all the possibilities in armv8 (3 possible FPU and 2 =
possible options - crc and crypto).
So if we want to be exhaustive, we probably need something similar.
If we just want to support cortex-a53, then we can trim a bit.

I was not aware of the Axxia work, it could also be used in oe-core =
instead of my patch, actually.
But if you check what they did, they do define nearly as many - with the =
exception of the softfloat option, in their case aarch32 is always hf. =
That's a possibility that could be considered, but I initially tried to =
provide as much "features" for aarch32 as there was for armv7ve - =
including the option to do softfloat...

Please let me know what you'd like me to do, amend my patch to remove =
softfloat cases, or just get the axxia patches into oe-core, or =
something else?

Herve

-----Original Message-----
From: Khem Raj [mailto:raj.khem@gmail.com]=20
Sent: dimanche 20 novembre 2016 20:37
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer =
<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe-core][PATCH v3 2/3] arch-armv8.inc: add =
support for 32bits armv8 options

I dont think we need these many variats for v8, axxia has been carrying =
such patches locally.
see
https://github.com/axxia/meta-axxia/tree/master/conf/machine/include

On Sun, Nov 20, 2016 at 4:10 AM, Herve Jourdain <herve.jourdain@neuf.fr> =
wrote:
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/conf/machine/include/arm/arch-armv8.inc | 60=20
> ++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc=20
> b/meta/conf/machine/include/arm/arch-armv8.inc
> index 5e832fa..8c96efc 100644
> --- a/meta/conf/machine/include/arm/arch-armv8.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
> @@ -1 +1,61 @@
>  require conf/machine/include/arm/arch-arm64.inc
> +
> +TUNEVALID[armv8] =3D "Enable instructions for ARMv8"
> +TUNECONFLICTS[armv8] =3D "armv4 armv5 armv6 armv7 armv7a armv7ve"
> +
> +TUNE_CCARGS .=3D \
> +"${@' -march=3Darmv8-a+crypto+crc' if=20
> +bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'cryptov8', 'crcv8' ],=20
> +True, False, d) else\ ' -march=3Darmv8-a+crypto' if=20
> +bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'cryptov8' ], True, =
False, d) else\ ' -march=3Darmv8-a+crc' if =
bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'crcv8' ], True, False, d) =
else \ bb.utils.contains('TUNE_FEATURES', 'armv8', ' -march=3Darmv8-a', =
'', d)}"
> +
> +TUNE_CCARGS_MFPU .=3D \
> +"${@' crypto-neon-fp-armv8' if bb.utils.contains('TUNE_FEATURES', [=20
> +'armv8', 'neon', 'cryptov8' ], True, False, d) else \ '=20
> +neon-fp-armv8' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', =
'neon' ], True, False, d) else \ bb.utils.contains('TUNE_FEATURES', [ =
'armv8' ], ' fp-armv8', '', d)}"
> +
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8', =
'armv8:', '' ,d)}"
> +
> +AVAILTUNES +=3D "armv8 armv8-crypto armv8-crc armv8-crypto-crc"
> +TUNE_FEATURES_tune-armv8 =3D "armv8"
> +TUNE_FEATURES_tune-armv8-crypto =3D "${TUNE_FEATURES_tune-armv8} =
cryptov8"
> +TUNE_FEATURES_tune-armv8-crc =3D "${TUNE_FEATURES_tune-armv8} crcv8"
> +TUNE_FEATURES_tune-armv8-crypto-crc =3D "${TUNE_FEATURES_tune-armv8} =
cryptov8 crcv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8 =3D "armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-crypto =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-crc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-crypto-crc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-crypto-crc"
> +
> +AVAILTUNES +=3D "armv8-neon armv8-neon-crypto armv8-neon-crc =
armv8-neon-crypto-crc"
> +TUNE_FEATURES_tune-armv8-neon =3D "${TUNE_FEATURES_tune-armv8} neon"
> +TUNE_FEATURES_tune-armv8-neon-crypto =3D =
"${TUNE_FEATURES_tune-armv8-crypto} neon"
> +TUNE_FEATURES_tune-armv8-neon-crc =3D =
"${TUNE_FEATURES_tune-armv8-crc} neon"
> +TUNE_FEATURES_tune-armv8-neon-crypto-crc =3D =
"${TUNE_FEATURES_tune-armv8-crypto-crc} neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8} armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8-crypto} armv8-neon-crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8-crc} armv8-neon-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto-crc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8-crypto-crc} armv8-neon-crypto-crc"
> +
> +AVAILTUNES +=3D "armv8hf armv8hf-crypto armv8hf-crc =
armv8hf-crypto-crc"
> +TUNE_FEATURES_tune-armv8hf =3D "${TUNE_FEATURES_tune-armv8} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8hf-crypto =3D =
"${TUNE_FEATURES_tune-armv8-crypto} callconvention-hard"
> +TUNE_FEATURES_tune-armv8hf-crc =3D "${TUNE_FEATURES_tune-armv8-crc} =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8hf-crypto-crc =3D =
"${TUNE_FEATURES_tune-armv8-crypto-crc} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf =3D "armv8hf"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-crc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto-crc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-crypto-crc"
> +
> +AVAILTUNES +=3D "armv8hf-neon armv8hf-neon-crypto armv8hf-neon-crc =
armv8hf-neon-crypto-crc"
> +TUNE_FEATURES_tune-armv8hf-neon =3D "${TUNE_FEATURES_tune-armv8hf} =
neon"
> +TUNE_FEATURES_tune-armv8hf-neon-crypto =3D =
"${TUNE_FEATURES_tune-armv8hf-crypto} neon"
> +TUNE_FEATURES_tune-armv8hf-neon-crc =3D =
"${TUNE_FEATURES_tune-armv8hf-crc} neon"
> +TUNE_FEATURES_tune-armv8hf-neon-crypto-crc =3D =
"${TUNE_FEATURES_tune-armv8hf-crypto-crc} neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8hf} armv8hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto} armv8hf-neon-crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8hf-crc} armv8hf-neon-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto-crc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto-crc} armv8hf-neon-crypto-crc"
> +
> +TUNEVALID[cryptov8] =3D "Enable armv8 crypto extensions"
> +TUNEVALID[crcv8] =3D "Enable armv8 crc extensions"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


