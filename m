Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2F260B07
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 16:27:18 +0000 (UTC)
IronPort-SDR: YzRHa2OVqdnNecfZBTrl7iyg6s1FPr+i99lhogDk5h/jCuE6B11PajCivuZSp2FS2vYetU9re8
	cN6lhLkrWT0L/drh2bDprkPMRHdrI+7qCVf5/jJNqb2U6h5Tmc6gKKqcLSyNN6XfBkyyMsowr/
	YXcZja+Fi3VZTXkpAawMi7sHjAYUYsmveRpCxgT63NiCrBsRFKsPA6uI40wZSFLf8hz4SQJOe6
	H7qPvO8D9wrq/qnQ5H/ofhDyspC4VGJCEUwCeZq0mNkeb4yTUusNDNUnivyoAqIDQRHeWzm/U7
	1Qs=
X-IronPort-AV: E=Sophos;i="5.70,414,1574118000"; 
   d="scan'208";a="5053087"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alex Kiernan <alex.kiernan@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [OE-Core][PATCH] rootfs: Make BUILDNAME a weak default
	in	reproducible_build_simple
Thread-Index: AQHVzcH43KT99JzQmkmdUsh/lS9Bh6gQCF6w
Date: Fri, 7 Feb 2020 16:27:18 +0000
Message-ID: <9242b01969234918b10a8d1c2f494590@XBOX03.axis.com>
References: <20200118054107.101203-1-alex.kiernan@gmail.com>
In-Reply-To: <20200118054107.101203-1-alex.kiernan@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH] rootfs: Make BUILDNAME a weak default in	reproducible_build_simple
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
X-List-Received-Date: Fri, 07 Feb 2020 16:27:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Alex Kiernan
> Sent: den 18 januari 2020 06:41
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [OE-Core][PATCH] rootfs: Make BUILDNAME a weak default
> in reproducible_build_simple
>=20
> 11e45082ad00 ("rootfs-postcommands.bbclass: improve binary
> reproducibility") fixed binary reproducibility of /etc/version, but with
> the move to reproducibilty in all builds, setting /etc/version to
> anything other than the default fixed timestamp is tricky because
> rootfs_reproducible() runs very late.
>=20
> rootfs.py uses BUILDNAME if set for /etc/version, so introduce a weak
> default for BUILDNAME of "REPRODUCIBLE_TIMESTAMP_ROOTFS", when enabling
> reproducible builds hence allowing BUILDNAME to be overridden elsewhere.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
>  meta/classes/reproducible_build_simple.bbclass | 1 +
>  meta/classes/rootfs-postcommands.bbclass       | 5 -----
>  2 files changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classe=
s/reproducible_build_simple.bbclass
> index d0842f0f902a..153a07607219 100644
> --- a/meta/classes/reproducible_build_simple.bbclass
> +++ b/meta/classes/reproducible_build_simple.bbclass
> @@ -7,5 +7,6 @@ export PERL_HASH_SEED =3D "0"
>  export SOURCE_DATE_EPOCH ??=3D "1520598896"
>=20
>  REPRODUCIBLE_TIMESTAMP_ROOTFS ??=3D "1520598896"
> +BUILDNAME ??=3D "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"

Can we please revert this change?  This breaks (all?) other usages=20
of ${BUILDNAME}. E.g., the information in tmp/buildstats is totally=20
useless now since all builds end up in the same directory=20
"tmp/buildstats/1520598896", overwriting each other...

>=20
>  inherit podfix
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/root=
fs-postcommands.bbclass
> index fdc63bb64d55..ebf96be7e85f 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -356,11 +356,6 @@ python rootfs_log_check_recommends() {
>  # Perform any additional adjustments needed to make rootf binary reprodu=
cible
>  rootfs_reproducible () {
>  	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
> -		# Convert UTC into %4Y%2m%2d%2H%2M%2S
> -		sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%=
2H%2M%2S`
> -		echo $sformatted > ${IMAGE_ROOTFS}/etc/version
> -		bbnote "rootfs_reproducible: set /etc/version to $sformatted"
> -
>  		if [ -d ${IMAGE_ROOTFS}${sysconfdir}/gconf ]; then
>  			find ${IMAGE_ROOTFS}${sysconfdir}/gconf -name '%gconf.xml' -print0 | =
xargs -0r \
>  			sed -i -e 's@\bmtime=3D"[0-9][0-9]*"@mtime=3D"'${REPRODUCIBLE_TIMESTA=
MP_ROOTFS}'"@g'
> --
> 2.17.1

//Peter


