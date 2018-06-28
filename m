Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76D03605BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 15:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 360021847A;
	Thu, 28 Jun 2018 17:18:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id CwiNKzrnghax; Thu, 28 Jun 2018 17:18:32 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4414E18468;
	Thu, 28 Jun 2018 17:18:32 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F91D1E070;
	Thu, 28 Jun 2018 17:18:32 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 225461E06E;
	Thu, 28 Jun 2018 17:18:32 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 28 Jun 2018 17:18:32 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 15AF31E5E;
	Thu, 28 Jun 2018 17:18:32 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 28 Jun 2018 17:18:32 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 28 Jun 2018 17:18:31 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Thu, 28 Jun 2018 17:18:31 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alex Kiernan <alex.kiernan@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [OE-Core][PATCH 1/2] image: Set COREBASE as the git
	directory for timestamp
Thread-Index: AQHUDUaLwQVSfWr4OkOm6EflYr/SJKR1yoCA
Date: Thu, 28 Jun 2018 15:18:31 +0000
Message-ID: <4ef21051d1ee4c72a7fe24722ec2b31a@XBOX02.axis.com>
References: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/2] image: Set COREBASE as the git	directory for timestamp
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
X-List-Received-Date: Thu, 28 Jun 2018 15:18:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There is no guarantee that ${COREBASE} refers to a path that is under=20
Git control. E.g., in our case it refers to a directory that is under=20
repo control. "${COREBASE}/meta" is probably a better option.

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Alex Kiernan
> Sent: den 26 juni 2018 14:09
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [OE-Core][PATCH 1/2] image: Set COREBASE as the git
> directory for timestamp
>=20
> When REPRODUCIBLE_TIMESTAMP_ROOTFS is unset and we want to parse one
> from git, use COREBASE as the base for the git command so we have a
> known repository which we're using. Without this the build may fail
> if the current directory is not part of a git repository.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 8ef06c0..2e88024 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -651,7 +651,7 @@ POPULATE_SDK_PRE_TARGET_COMMAND +=3D
> "${@bb.utils.contains('DISTRO_FEATURES', 'usr
>  reproducible_final_image_task () {
>      if [ "${BUILD_REPRODUCIBLE_BINARIES}" =3D "1" ]; then
>          if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" =3D "" ]; then
> -            REPRODUCIBLE_TIMESTAMP_ROOTFS=3D`git log -1 --pretty=3D%ct`
> +            REPRODUCIBLE_TIMESTAMP_ROOTFS=3D`git -C "${COREBASE}" log -1
> --pretty=3D%ct`
>          fi
>          # Set mtime of all files to a reproducible value
>          bbnote "reproducible_final_image_task: mtime set to
> $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

