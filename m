Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E75474813
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 11:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EEEDD1848E;
	Wed,  9 Jan 2019 12:20:43 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zpbhL8mYfXj6; Wed,  9 Jan 2019 12:20:41 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B0D4C1842B;
	Wed,  9 Jan 2019 12:20:41 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FB531A07E;
	Wed,  9 Jan 2019 12:20:41 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 937821A07C;
	Wed,  9 Jan 2019 12:20:41 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed,  9 Jan 2019 12:20:41 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 878A52E80;
	Wed,  9 Jan 2019 12:20:41 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 9 Jan 2019 12:20:41 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 9 Jan 2019 12:20:41 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC][PATCH 2/2] buildhistory: support generating
	md5sum	of files
Thread-Index: AQHUpevCCShu/9lR6kWT2Aj57NZoLKWmzZFA
Date: Wed, 9 Jan 2019 11:20:41 +0000
Message-ID: <14187e64d1ed43b392446fc2178e000f@XBOX04.axis.com>
References: <20190106181350.25386-1-jacob.kroon@gmail.com>
	<20190106181350.25386-2-jacob.kroon@gmail.com>
In-Reply-To: <20190106181350.25386-2-jacob.kroon@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [RFC][PATCH 2/2] buildhistory: support generating md5sum	of files
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
X-List-Received-Date: Wed, 09 Jan 2019 11:20:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Jacob Kroon
> Sent: den 6 januari 2019 19:14
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [RFC][PATCH 2/2] buildhistory: support generating
> md5sum of files
>=20
> Introduce 'md5' in BUILDHISTORY_FEATURES and enable it by default
> when doing reproducible builds.
>=20
> When enabled this will additionally create:
>=20
>   files-in-package-md5.txt
>   files-in-image-md5.txt
>   files-in-sdk-md5.txt
>=20
> containing the md5 checksums of regular files.
>=20
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 33eb1b00f6..00f0701dec 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -7,7 +7,8 @@
>  # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
>  #
>=20
> -BUILDHISTORY_FEATURES ?=3D "image package sdk"
> +BUILDHISTORY_FEATURES ?=3D "image package sdk \
> +  ${@ "md5" if bb.utils.to_boolean(d.getVar('BUILD_REPRODUCIBLE_BINARIES=
')) else ""}"

May I suggest using ' instead of " within the Python block to=20
lessen confusion when quotes are used within another set of quotes.=20
(Even if bitbake handles it fine, not all editor coloring modes do.)

>  BUILDHISTORY_DIR ?=3D "${TOPDIR}/buildhistory"
>  BUILDHISTORY_DIR_IMAGE =3D "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/$=
{TCLIBC}/${IMAGE_BASENAME}"
>  BUILDHISTORY_DIR_PACKAGE =3D "${BUILDHISTORY_DIR}/packages/${MULTIMACH_T=
ARGET_SYS}/${PN}"
> @@ -526,7 +527,12 @@ buildhistory_list_files() {
>  		eval ${FAKEROOTENV} ${FAKEROOTCMD} $find_cmd
>  	else
>  		eval $find_cmd
> -	fi | sort -k5 | sed 's/ * -> $//' > $2 )
> +	fi | sort -k5 | sed 's/ * -> $//' > $2
> +	if [ "${@bb.utils.contains('BUILDHISTORY_FEATURES', 'md5', '1', '0', d)=
}" =3D "1" ] ; then
> +		md5filename=3D$(echo $2 | sed 's/\.txt$/-md5.txt/')
> +		find -type f | xargs -I{} -n1 md5sum {} | sort -k2 > $md5filename
> +		[ -s $md5filename ] || rm $md5filename # remove result if empty
> +	fi )
>  }
>=20
>  buildhistory_list_pkg_files() {
> --
> 2.11.0

Don't forget to update the documentation for BUILDHISTORY_FEATURES=20
if this is added.

//Peter


