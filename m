Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SFpt8-0007BS-40
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 18:50:22 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Apr 2012 09:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85737917"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 09:41:09 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 5 Apr 2012 09:41:08 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Fri, 6 Apr 2012 00:41:07 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] self-hosted-image: decrease reserved
	space to	0.5%
Thread-Index: AQHNEp6o1Wg26VKjVECWO9BQaYDJk5aMbs4A
Date: Thu, 5 Apr 2012 16:41:05 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFCE89@SHSMSX102.ccr.corp.intel.com>
References: <cover.1333569870.git.paul.eggleton@linux.intel.com>
	<f7de5b50bca5996190ca0c1c10e2b56f20f11e8d.1333569870.git.paul.eggleton@linux.intel.com>
In-Reply-To: <f7de5b50bca5996190ca0c1c10e2b56f20f11e8d.1333569870.git.paul.eggleton@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] self-hosted-image: decrease reserved space to	0.5%
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Apr 2012 16:50:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,
This reminds me of something slightly similar:
Can we enable the -z option of genext2fs in IMAGE_CMD_ext3()?
For a 40G image, this would save the building host many giga bytes, and mak=
e the conversion "from .ext3 to .hdddirect" faster.

Thanks,
-- Dexuan

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Paul Eggleton
> Sent: Thursday, April 05, 2012 4:08 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] self-hosted-image: decrease reserved space=
 to
> 0.5%
>=20
> The default amount of reserved space for ext2/3 is 5% - this amounts to
> about 2GB of a 40GB filesystem that the builder user can't make use of.
> We don't need this much reserved so peg it back to 0.5% which should be
> more than enough.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-core/images/self-hosted-image.bb |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/images/self-hosted-image.bb
> b/meta/recipes-core/images/self-hosted-image.bb
> index d2faa66..84c5faf 100644
> --- a/meta/recipes-core/images/self-hosted-image.bb
> +++ b/meta/recipes-core/images/self-hosted-image.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
>=20
> file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de
> 20420"
>=20
> -PR =3D "r9"
> +PR =3D "r10"
>=20
>  CORE_IMAGE_EXTRA_INSTALL =3D "\
>      task-self-hosted \
> @@ -25,6 +25,11 @@ inherit core-image
>  SRCREV =3D "8691a588267472eb5a32b978a0eb9ddfd0c91733"
>  SRC_URI =3D "git://git.yoctoproject.org/poky;protocol=3Dgit"
>=20
> +IMAGE_CMD_ext3_append () {
> +	# We don't need to reserve much space for root, 0.5% is more than
> enough
> +	tune2fs -m 0.5 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
> +}
> +
>  fakeroot do_populate_poky_src () {
>  	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git rep=
o
>  	# will become invalid in the target.
> --
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


