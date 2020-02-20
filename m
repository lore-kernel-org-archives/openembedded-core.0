Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCB2611E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=2705; q=dns/txt; s=axis-central1;
	t=1582230005; x=1613766005;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=4AYJPE5K3hqAhw45fpI12uLieF+0Sqof6y5hxhRZerY=;
	b=eIzmA6R85fnZmsGEE/60o7BFkt3itSJ/M2pphA/MUjtvkjHEuxW3Ba40
	kBYf9QTylTSTm8KzIKV4uSwrfP+Covc77n0zm/i7tHdhIpMu/EZWed0vS
	1uiPa3kENyLfuw4vSUkG+KwpCxIO4aIDTw3S8kwNrR9pIxgvly8bVLAYE
	Tnr5awKtpG0d9WVPf7evaoeX62En4czIeqqZlle/IQ8OGvMy7z6x9KeHp
	Tgnmph99dTtfPsLlZsiHjbF0vF+2VHQj5IRbK5i6i7SpJvTLacmKSTop9
	GcC99QTA/NCFcBF/kMKCfy+zeEydL0bVTxae4ikFjLJF4FmI4Su56Tt07 w==;
IronPort-SDR: fj8oajYK7i0NADYm0StvDN8b9vUNI3+5KeNuB3oAJuj90Mp7/MByFVwUYc6Z1RCCi+iiPKJ0Wj
	A7pylQUP2T3WY9lNDIamqSWoBC+NENFkwGq8Fj+6BolHKO5RgXhh4tDtySuaKJ2IV1CwG1WVgN
	kj+Q0IK6HaBlO1EjdvzlvtCZcajPT6oooTdOffm5r1w2J+V+dwczMmfeoa0VmB34rOfhQciYmC
	PrbLt+xUDgIvDaLByGeV6NZKTWxSEUTc5mu34KM3Gv4ocicPi4rjOWygUyYhlgVAravxlIAkQr
	2eg=
X-IronPort-AV: E=Sophos;i="5.70,465,1574118000"; 
   d="scan'208";a="5500861"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Revert "rootfs: Make BUILDNAME a weak default
	in	reproducible_build_simple"
Thread-Index: AQHV3w8rwJJZVSur60iAVi4Du6zOXKgkl/LQ
Date: Thu, 20 Feb 2020 20:19:58 +0000
Message-ID: <484d72b91f934887b89efbc1d087024d@XBOX03.axis.com>
References: <20200209060658.800-1-pkj@axis.com>
In-Reply-To: <20200209060658.800-1-pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "rootfs: Make BUILDNAME a weak default in	reproducible_build_simple"
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
X-List-Received-Date: Thu, 20 Feb 2020 20:20:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 9 februari 2020 07:07
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] Revert "rootfs: Make BUILDNAME a weak default
> in reproducible_build_simple"
>=20
> This reverts commit 8380df6566db49ef184b837432558750f77f592f.
>=20
> Giving BUILDNAME a static default in reproducible_build_simple.bbclass
> to have /etc/version be generated with that name lead to other users
> of BUILDNAME no longer working as expected. E.g., buildstats.bcclass
> would now write its information in a single directory, overwriting the
> statistics for each build.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/reproducible_build_simple.bbclass | 1 -
>  meta/classes/rootfs-postcommands.bbclass       | 5 +++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/reproducible_build_simple.bbclass
> b/meta/classes/reproducible_build_simple.bbclass
> index 3e5fd82432..393372993d 100644
> --- a/meta/classes/reproducible_build_simple.bbclass
> +++ b/meta/classes/reproducible_build_simple.bbclass
> @@ -7,4 +7,3 @@ export PERL_HASH_SEED =3D "0"
>  export SOURCE_DATE_EPOCH ??=3D "1520598896"
>=20
>  REPRODUCIBLE_TIMESTAMP_ROOTFS ??=3D "1520598896"
> -BUILDNAME ??=3D "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index e40097444d..2f171836fa 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -356,6 +356,11 @@ python rootfs_log_check_recommends() {
>  # Perform any additional adjustments needed to make rootf binary
> reproducible
>  rootfs_reproducible () {
>  	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" !=3D "" ]; then
> +		# Convert UTC into %4Y%2m%2d%2H%2M%2S
> +		sformatted=3D`date -u -d
> @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
> +		echo $sformatted > ${IMAGE_ROOTFS}/etc/version
> +		bbnote "rootfs_reproducible: set /etc/version to
> $sformatted"
> +
>  		if [ -d ${IMAGE_ROOTFS}${sysconfdir}/gconf ]; then
>  			find ${IMAGE_ROOTFS}${sysconfdir}/gconf -
> name '%gconf.xml' -print0 | xargs -0r \
>  			sed -i -e 's@\bmtime=3D"[0-9][0-
> 9]*"@mtime=3D"'${REPRODUCIBLE_TIMESTAMP_ROOTFS}'"@g'
> --
> 2.21.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

