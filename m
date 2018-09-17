Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 829A162133
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 10:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C695318347;
	Mon, 17 Sep 2018 12:54:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Q6zCMJTAzqgb; Mon, 17 Sep 2018 12:54:08 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B88A218338;
	Mon, 17 Sep 2018 12:54:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DAF61E07B;
	Mon, 17 Sep 2018 12:54:08 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6247F1E077;
	Mon, 17 Sep 2018 12:54:08 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 17 Sep 2018 12:54:08 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 564721918;
	Mon, 17 Sep 2018 12:54:08 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 17 Sep 2018 12:54:08 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 17 Sep 2018 12:54:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Trevor Woerner <trevor@toganlabs.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] image_types.bbclass: set parallelism for
	compression
Thread-Index: AQHUTQtYE7GiSMIX70e22NrfYwiAOaT0TjbQ
Date: Mon, 17 Sep 2018 10:54:08 +0000
Message-ID: <6a043e3fd1a547439fbccdd23570665e@XBOX02.axis.com>
References: <20180915154634.6468-1-trevor@toganlabs.com>
In-Reply-To: <20180915154634.6468-1-trevor@toganlabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] image_types.bbclass: set parallelism for	compression
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
X-List-Received-Date: Mon, 17 Sep 2018 10:54:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Trevor Woerner
> Sent: den 15 september 2018 17:47
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] image_types.bbclass: set parallelism for
> compression
>=20
> Make use of BB_NUMBER_THREADS when setting the parallelism for
> compression.

Shouldn't this rather use the number from PARALLEL_MAKE? If I have a=20
build that creates multiple images, bitbake may already have=20
BB_NUMBER_THREADS images building in parallel. I would then rather=20
expect the parallelism for ach bitbake thread to match PARALLEL_MAKE.

> Signed-off-by: Trevor Woerner <trevor@toganlabs.com>
> ---
>  meta/classes/image_types.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> index 00a00d318f..35ba775cca 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -281,8 +281,8 @@ COMPRESSIONTYPES ?=3D ""
>=20
>  CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha22=
4sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 ${COMPRESSION=
TYPES}"
>  CONVERSION_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}=
.${type}"
> -CONVERSION_CMD_gz =3D "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
> -CONVERSION_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type}"
> +CONVERSION_CMD_gz =3D "pigz -f -9 -n -c -p${BB_NUMBER_THREADS} ${IMAGE_N=
AME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
}.gz"
> +CONVERSION_CMD_bz2 =3D "pbzip2 -f -k -p${BB_NUMBER_THREADS} ${IMAGE_NAME=
}${IMAGE_NAME_SUFFIX}.${type}"
>  CONVERSION_CMD_xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS}=
 --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} =
> ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
>  CONVERSION_CMD_lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$=
{type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>  CONVERSION_CMD_lzo =3D "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type=
}"
> --
> 2.17.0.582.gccdcbd54c

//Peter


