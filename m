Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 890726E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 07:11:15 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bedCV-0006Vl-Ao from Awais_Belal@mentor.com ;
	Tue, 30 Aug 2016 00:11:15 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.221]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Tue, 30 Aug 2016 08:11:14 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Saul Wold <saul.wold@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] init-install*: only pick root mmc devices
Thread-Index: AQHR8t87Oa4XRzfnJUes3JROPt+h8qBhCemAgAArXEE=
Date: Tue, 30 Aug 2016 07:11:13 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FD00CF7@EU-MBX-03.mgc.mentorg.com>
References: <1470816856-27919-1-git-send-email-awais_belal@mentor.com>,
	<1472535283.3508.60.camel@intel.com>
In-Reply-To: <1472535283.3508.60.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [PATCH] init-install*: only pick root mmc devices
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
X-List-Received-Date: Tue, 30 Aug 2016 07:11:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Saul,=0A=
=0A=
> Please review the bug and try to test with genericx86 likely without an=
=0A=
> MMC device.=0A=
=0A=
Alejandro came up with a quick fix https://patchwork.openembedded.org/patch=
/130547/.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Saul Wold [saul.wold@intel.com]=0A=
Sent: Tuesday, August 30, 2016 10:34 AM=0A=
To: Belal, Awais; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] init-install*: only pick root mmc devices=0A=
=0A=
On Wed, 2016-08-10 at 13:14 +0500, Awais Belal wrote:=0A=
> Some eMMC devices show special sub-devices such as mmcblk0boot0=0A=
> etc. The installation script currently pick all of them up and=0A=
> displays it to the user which makes some confusions because these=0A=
> sub-devices are pretty small and complete installation including=0A=
> rootfs won't be possible in most cases.=0A=
> We simply now drop these sub-devices and only present the user=0A=
> with the root of such mmc devices.=0A=
>=0A=
Hi Awais:=0A=
=0A=
We recently ran a full QA pass and found a problem with installing=0A=
genericx86* machines files as Bug #10189 [1].  It appears it might be=0A=
related to this or another of your init-install patches.=0A=
=0A=
Since we are approaching M3 closure today this would be a bad issue to=0A=
have following us into M3.=0A=
=0A=
Please review the bug and try to test with genericx86 likely without an=0A=
MMC device.=0A=
=0A=
Thanks=0A=
  Sau!=0A=
=0A=
[1]=A0https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10189=0A=
=0A=
> Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> ---=0A=
>  meta/recipes-core/initrdscripts/files/init-install-efi.sh | 8=0A=
> +++++++-=0A=
>  meta/recipes-core/initrdscripts/files/init-install.sh     | 8=0A=
> +++++++-=0A=
>  2 files changed, 14 insertions(+), 2 deletions(-)=0A=
>=0A=
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-=0A=
> efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
> index f564f4e..776dcbb 100644=0A=
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
> @@ -29,7 +29,13 @@ esac=0A=
>=0A=
>  echo "Searching for hard drives ..."=0A=
>=0A=
> -for device in `ls /sys/block/`; do=0A=
> +# Some eMMC devices have special sub devices such as mmcblk0boot0=0A=
> etc=0A=
> +# we're currently only interested in the root device so pick them=0A=
> wisely=0A=
> +devices=3D`ls /sys/block/ | grep -v mmcblk`=0A=
> +mmc_devices=3D`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"`=0A=
> +devices=3D"$devices $mmc_devices"=0A=
> +=0A=
> +for device in $devices; do=0A=
>      case $device in=0A=
>          loop*)=0A=
>              # skip loop device=0A=
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
> b/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
> index 72ce92b..9c4189b 100644=0A=
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
> @@ -28,7 +28,13 @@ esac=0A=
>=0A=
>  echo "Searching for hard drives ..."=0A=
>=0A=
> -for device in `ls /sys/block/`; do=0A=
> +# Some eMMC devices have special sub devices such as mmcblk0boot0=0A=
> etc=0A=
> +# we're currently only interested in the root device so pick them=0A=
> wisely=0A=
> +devices=3D`ls /sys/block/ | grep -v mmcblk`=0A=
> +mmc_devices=3D`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"`=0A=
> +devices=3D"$devices $mmc_devices"=0A=
> +=0A=
> +for device in $devices; do=0A=
>      case $device in=0A=
>          loop*)=0A=
>              # skip loop device=0A=
> --=0A=
> 1.9.1=0A=
>=0A=

