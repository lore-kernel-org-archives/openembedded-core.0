Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UIE2U-0005Ii-1M
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 09:06:39 +0100
Received: by mail-ee0-f48.google.com with SMTP id t10so602656eei.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 00:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=E+WYXyUl8S5aKkMaMKFnHwYFK5yo59AFSpKb6SPkQss=;
	b=SvU6iSKL3qu2H24Rjyc/AnNT8IDqHNoJ/jPYMfG7NbBS86n2uyY+pTmBDgaoNTxRv9
	jF+msDY0HD5MVe+XaOROKCd7WAw+SkNr8XkSopdLjoDxLBDDTfbGzJG42HY6MLITd7pH
	MKvfWITzOxo+sbvly9AARs34BZFLPNPPRoutM17X/ySDBC4GOihW17bxDNgSEGxAkjH6
	EGlm5BYWXHsEFuPIvLsT1zrFrB1Hf5mHZ8yU8X4fO4G8SoDYchNjdxDNAlTzeFbQxRzl
	qauIlx8dpgJcYT09yLG/cOsS37RDIFhw9/IsoEnGaCacNtCga6g88sVODfKwRa7fIVCf
	o6xQ==
X-Received: by 10.15.22.197 with SMTP id f45mr68266071eeu.46.1363765775261;
	Wed, 20 Mar 2013 00:49:35 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id z45sm932252eeu.10.2013.03.20.00.49.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 00:49:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4937a2369946171db2f84833e997702f820d37bc.1363731212.git.dvhart@linux.intel.com>
Date: Wed, 20 Mar 2013 08:49:33 +0100
Message-Id: <719374A5-E704-46DB-8D1E-11A5387A72B2@dominion.thruhere.net>
References: <cover.1363731212.git.dvhart@linux.intel.com>
	<4937a2369946171db2f84833e997702f820d37bc.1363731212.git.dvhart@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlRUbXSP5utVgcTT7upw7IKT8SRCJcQwCg5xFpHLB8Dek7LbC0XHy6SbI0Qrr5C265C7EZs
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] mkefidisk: Use msdos partition tables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 08:06:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mrt. 2013, om 23:15 heeft Darren Hart <dvhart@linux.intel.com> het =
volgende geschreven:

> While GPT works fine when writing to actual media, it cannot be =
reliably
> used for distributing disk images as it requires the backup table to =
be
> on the last block on the device, which of course varies from device to
> device. Use MSDOS tables instead.
>=20
> Use mkfs to label the filesystems as msdos tables do not support
> partition labeling.

I was wondering if it's possible to run parted in fixup mode manually. I =
did that on the target itself to fix the off-by-one error, so running it =
on the host should work as well.

regards,

Koen


>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
> scripts/contrib/mkefidisk.sh | 16 +++++++---------
> 1 file changed, 7 insertions(+), 9 deletions(-)
>=20
> diff --git a/scripts/contrib/mkefidisk.sh =
b/scripts/contrib/mkefidisk.sh
> index 6ff12af..acadd49 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -156,20 +156,18 @@ echo "*****************"
> echo "Deleting partition table on $DEVICE ..."
> dd if=3D/dev/zero of=3D$DEVICE bs=3D512 count=3D2
>=20
> -echo "Creating new partition table (GPT) on $DEVICE ..."
> -parted $DEVICE mklabel gpt
> +# Use MSDOS by default as GPT cannot be reliably distributed in disk =
image form
> +# as it requires the backup table to be on the last block of the =
device, which
> +# of course varies from device to device.
> +echo "Creating new partition table (MSDOS) on $DEVICE ..."
> +parted $DEVICE mklabel msdos
>=20
> echo "Creating boot partition on $BOOTFS"
> parted $DEVICE mkpart primary 0% $BOOT_SIZE
>=20
> -# GPT doesn't have a real boot flag, parted will change the GUID to =
EFI System
> -# Partition, which is what we want
> echo "Enabling boot flag on $BOOTFS"
> parted $DEVICE set 1 boot on
>=20
> -echo "Labeling $BOOTFS as EFI System Partition"
> -parted $DEVICE name 1 "EFI System Partition"
> -
> echo "Creating ROOTFS partition on $ROOTFS"
> parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END
>=20
> @@ -184,10 +182,10 @@ parted $DEVICE print
> #
> echo ""
> echo "Formatting $BOOTFS as vfat..."
> -mkfs.vfat $BOOTFS
> +mkfs.vfat $BOOTFS -n "efi"
>=20
> echo "Formatting $ROOTFS as ext3..."
> -mkfs.ext3 $ROOTFS
> +mkfs.ext3 $ROOTFS -L "root"
>=20
> echo "Formatting swap partition...($SWAP)"
> mkswap $SWAP
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



