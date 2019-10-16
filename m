Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 446E260557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 12:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8ABF118351;
	Wed, 16 Oct 2019 14:45:22 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id m4kvj0t1Atl6; Wed, 16 Oct 2019 14:45:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B1E0C18095;
	Wed, 16 Oct 2019 14:45:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FAC21A08C;
	Wed, 16 Oct 2019 14:45:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7406C1A08B;
	Wed, 16 Oct 2019 14:45:21 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 16 Oct 2019 14:45:21 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 67D551911;
	Wed, 16 Oct 2019 14:45:21 +0200 (CEST)
Received: from XBOX03.axis.com (10.0.5.17) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Wed, 16 Oct 2019 14:45:21 +0200
Received: from XBOX03.axis.com ([fe80::e49e:4060:87cc:61a]) by XBOX03.axis.com
	([fe80::e49e:4060:87cc:61a%22]) with mapi id 15.00.1365.000;
	Wed, 16 Oct 2019 14:45:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] systemd.bbclass: enable all services specified
	in ${SYSTEMD_SERVICE}
Thread-Index: AdWEH4iAGHkhI334Qo6RNxPQJHLzog==
Date: Wed, 16 Oct 2019 12:45:20 +0000
Message-ID: <d98547503ca345b68753531ef83704b2@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] systemd.bbclass: enable all services specified in ${SYSTEMD_SERVICE}
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
X-List-Received-Date: Wed, 16 Oct 2019 12:45:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Mikko Rapeli
> Sent: den 16 oktober 2019 14:32
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] systemd.bbclass: enable all services
> specified in ${SYSTEMD_SERVICE}
>=20
> This has been the traditional way of enabling systemd services.
> It may conflict with presets feature, but other layers, image classes
> and recipes add services to be enabled using SYSTEMD_SERVICE
> variable also with read-only rootfs, e.g. IMAGE_FEATURES has
> stateless-rootfs and systemd_preset_all task is not executed.
>=20
> Fixes startup of custom services from our recipes using custom
> image classes with various BSP layers. In the worst case even
> serial console getty service wasn't starting due to dependency
> no not enabled services.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/classes/systemd.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/systemd.bbclass
> b/meta/classes/systemd.bbclass
> index 1dca099..ae03c6f 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -33,7 +33,7 @@ if type systemctl >/dev/null 2>/dev/null; then
>  	if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
>  		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
>  			case "${service}" in
> -			*@*)
> +			*)
>  				systemctl ${OPTS} enable "${service}"
>  				;;
>  			esac

Not much point in leaving the case statement if it only has a=20
capture all case. I.e., the above simplifies to:

	if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
			systemctl ${OPTS} enable "$service"

(also note the change of "${service}" to "$service" to avoid using=20
${...} for shell variables where not necessary as this causes them=20
to unnecessarily end up in the bitbake hash for the function.)

//Peter


