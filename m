Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.1])
	by mail.openembedded.org (Postfix) with ESMTP id D0D8B60290
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2016 08:05:25 +0000 (UTC)
Received: from nbhjo (111-82-100-69.EMOME-IP.hinet.net [111.82.100.69])
	by msfrf2614.sfr.fr (SMTP Server) with ESMTP id D75EC1C000406;
	Sun, 20 Nov 2016 09:05:26 +0100 (CET)
Received: from nbhjo (111-82-100-69.EMOME-IP.hinet.net [111.82.100.69])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2614.sfr.fr (SMTP Server) with ESMTPSA;
	Sun, 20 Nov 2016 09:05:24 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Khem Raj' <raj.khem@gmail.com>
References: <1479559833-128256-1-git-send-email-herve.jourdain@neuf.fr>
	<1479559833-128256-2-git-send-email-herve.jourdain@neuf.fr>
	<CAMKF1so0YG5cy49tG2Efm-arFfxDbEoZgrP_5JNM9+ch_pr=cg@mail.gmail.com>
In-Reply-To: <CAMKF1so0YG5cy49tG2Efm-arFfxDbEoZgrP_5JNM9+ch_pr=cg@mail.gmail.com>
Date: Sun, 20 Nov 2016 09:05:18 +0100
Message-ID: <003001d24304$d82c5580$88850080$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
thread-index: AQIZuPqIOKLcPxAJ7Pf8pqxZRGdymgH2EMaZAyrBD0+gKZA0wA==
X-sfr-mailing: LEGIT
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] Add a tune file for cortexa53, valid for 32 bits and 64 bits
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
X-List-Received-Date: Sun, 20 Nov 2016 08:05:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: fr

Hi Khem,

Unfortunately, it has a few issues in 32bits mode...
Basically, cortex-a53 is an armv8+crc...
I'm sending an updated version - v3 - soon.
But I'll run the tune checker first. At least, the new version I'm =
coming up with and plan to send soon seems to work fine now with 32bits =
- and I shouldn't have broken the 64bits support in the process, but I =
will also compile it.

Herve

-----Original Message-----
From: Khem Raj [mailto:raj.khem@gmail.com]=20
Sent: samedi 19 novembre 2016 18:51
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer =
<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [oe-core][PATCH v2 1/1] Add a tune file for =
cortexa53, valid for 32 bits and 64 bits

This seems fine to me. There is a tune checker that Martin has, it would =
be good to run that and see if this new tune is tested.

http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune=
2-test


On Sat, Nov 19, 2016 at 4:50 AM, Herve Jourdain <herve.jourdain@neuf.fr> =
wrote:
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/conf/machine/include/tune-cortexa53.inc | 22=20
> ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa53.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa53.inc=20
> b/meta/conf/machine/include/tune-cortexa53.inc
> new file mode 100644
> index 0000000..ff5edb6
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa53.inc
> @@ -0,0 +1,22 @@
> +DEFAULTTUNE ?=3D "cortexa53-32"
> +
> +require conf/machine/include/arm/arch-armv8.inc
> +
> +TUNEVALID[cortexa53] =3D "Enable Cortex-A53 specific processor =
optimizations"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa53', =
' -mcpu=3Dcortex-a53 ', '',d)}"
> +
> +# Extra tune selections
> +AVAILTUNES +=3D "cortexa53-32"
> +ARMPKGARCH_tune-cortexa53-32 ?=3D "cortexa53"
> +TUNE_FEATURES_tune-cortexa53-32 =3D =
"${TUNE_FEATURES_tune-armv7ve-neon-vfpv4} cortexa53"
> +BASE_LIB_tune-cortexa53-32 =3D "lib"
> +TUNE_PKGARCH_tune-cortexa53-32 =3D "cortexa53-32"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa53-32 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ve-neon-vfpv4} cortexa53-32 =
cortexa53-neon-vfpv4"
> +
> +AVAILTUNES +=3D "cortexa53-64"
> +ARMPKGARCH_tune-cortexa53-64 ?=3D "cortexa53"
> +TUNE_FEATURES_tune-cortexa53-64 =3D "${TUNE_FEATURES_tune-aarch64} =
cortexa53"
> +BASE_LIB_tune-cortexa53-64 =3D "lib64"
> +TUNE_PKGARCH_tune-cortexa53-64 =3D "cortexa53-64"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa53-64 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa53-64"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


