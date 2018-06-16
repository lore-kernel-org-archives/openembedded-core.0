Return-Path: <gael.portay@savoirfairelinux.com>
X-Greylist: delayed 438 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 16 Jun 2018 17:15:55 UTC
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id C45F675160
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 17:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id BF82B9C1B77;
	Sat, 16 Jun 2018 13:08:37 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id NK-4myetiO-g; Sat, 16 Jun 2018 13:08:37 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 486099C1C91;
	Sat, 16 Jun 2018 13:08:37 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id OXKsTp_ZnHNC; Sat, 16 Jun 2018 13:08:37 -0400 (EDT)
Received: from archlinux (unknown [172.16.15.10])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 14F299C1B77;
	Sat, 16 Jun 2018 13:08:37 -0400 (EDT)
Date: Sat, 16 Jun 2018 13:08:36 -0400
From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180616170836.r4vegll7ssoplc34@archlinux>
References: <20171105175236.26818-1-gael.portay@savoirfairelinux.com>
MIME-Version: 1.0
In-Reply-To: <20171105175236.26818-1-gael.portay@savoirfairelinux.com>
User-Agent: NeoMutt/20180512
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [RESEND PATCH] kernel: fitimage: deploy real fit-image
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
X-List-Received-Date: Sat, 16 Jun 2018 17:15:55 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, Nov 05, 2017 at 12:52:36PM -0500, Ga=EBl PORTAY wrote:
> Currently, do_deploy installs a standard kernel image as an ITB. This
> image is linux.bin and it is prepared by uboot_prep_kimage.
>=20
> The real kernel fit-image is build under arch/${ARCH}/boot/fitImage.
>=20
> This patch deploys the real fit-image instead of the one prepared by
> u-boot and which is included in the ITB.
>=20
> Note: this patch only concerns fit-images which are not signed by u-boo=
t
> or which do not contains initramfs. Only a kernel image with a
> device-tree.
>=20
> Reviewed-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Ga=EBl PORTAY <gael.portay@savoirfairelinux.com>
> ---
>=20
>  meta/classes/kernel-fitimage.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel=
-fitimage.bbclass
> index 179185b6b2..8b581b36e7 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -456,9 +456,9 @@ kernel_do_deploy_append() {
>  		its_base_name=3D"fitImage-its-${PV}-${PR}-${MACHINE}-${DATETIME}"
>  		its_symlink_name=3DfitImage-its-${MACHINE}
>  		install -m 0644 fit-image.its ${DEPLOYDIR}/${its_base_name}.its
> -		linux_bin_base_name=3D"fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${D=
ATETIME}"
> -		linux_bin_symlink_name=3DfitImage-linux.bin-${MACHINE}
> -		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
> +		itb_base_name=3D"fitImage-linux.bin-${PV}-${PR}-${MACHINE}-${DATETIM=
E}"
> +		itb_symlink_name=3DfitImage-linux.bin-${MACHINE}
> +		install -m 0644 arch/${ARCH}/boot/fitImage ${DEPLOYDIR}/${itb_base_n=
ame}.bin
> =20
>  		if [ -n "${INITRAMFS_IMAGE}" ]; then
>  			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
> @@ -472,7 +472,7 @@ kernel_do_deploy_append() {
> =20
>  		cd ${DEPLOYDIR}
>  		ln -sf ${its_base_name}.its ${its_symlink_name}.its
> -		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
> +		ln -sf ${itb_base_name}.bin ${itb_symlink_name}.bin
> =20
>  		if [ -n "${INITRAMFS_IMAGE}" ]; then
>  			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}=
.its
> --=20
> 2.14.2
>

Is there anything bad with that patch? I will resend an rebased version
of that patch.

Regards,
Gael

