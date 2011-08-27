Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QxD1u-0005jy-Eb
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 09:10:10 +0200
Received: by wwe32 with SMTP id 32so3344528wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:05:21 -0700 (PDT)
Received: by 10.216.18.146 with SMTP id l18mr2628563wel.38.1314428720582;
	Sat, 27 Aug 2011 00:05:20 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b14sm1482551wed.4.2011.08.27.00.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 27 Aug 2011 00:05:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314388460-9781-1-git-send-email-joelagnel@ti.com>
Date: Sat, 27 Aug 2011 09:05:17 +0200
Message-Id: <D5854658-846C-4E90-B34F-6B328D6C8790@dominion.thruhere.net>
References: <1314388460-9781-1-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Jason Kridner <jdk@ti.com>
Subject: Re: [RFC] IMAGE_CMD_sdimg first cut
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
X-List-Received-Date: Sat, 27 Aug 2011 07:10:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 26 aug. 2011, om 21:54 heeft Joel A Fernandes het volgende =
geschreven:

> Here's an initial version of the SDCard image build functionality. Its =
not a direct copy paste from Narcissus

Be careful when doing that, narcissus is GPLv2, OE-core is MIT

> , I had to replace paths and am copying files from IMAGE_ROOTFS =
instead of how Narcissus untars into a mount point.
>=20
> Not build tested.
>=20
> @Koen and all, here are some questions:
> 1. Where in openembedded-core do we store the "img.gz" template files =
so that they are available to image.bbclass?

We don't, we can generate is everytime now that we aren't running as =
www-data

>   I'm thinking in the images/ directory where the =
beagleboard-gnome-image bb recipe is itself stored? What's a clean way?/
> 2. I've hardcoded loop device names just like Narcissus, what's a =
cleaner way?
> 3. Same as 2. but for temporary mount point names?
> 4. For copying ubifs, how do we ensure IMAGE_CMD_ubifs runs first =
before IMAGE_CMD_sdimg does?
>=20
> Thanks, if you get a chance to work on it, that'll be cool. I will =
continue to work on it after my class.
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> Cc: Koen Kooi <k-kooi@ti.com>
> Cc: Jason Kridner <jdk@ti.com>
> ---
> meta/classes/image_types.bbclass |   99 =
++++++++++++++++++++++++++++++++++++++
> 1 files changed, 99 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/image_types.bbclass =
b/meta/classes/image_types.bbclass
> index cd901c1..39e7984 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -88,6 +88,105 @@ IMAGE_CMD_ubi () {
> }
> IMAGE_CMD_ubifs =3D "mkfs.ubifs -r ${IMAGE_ROOTFS} -o =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img ${MKUBIFS_ARGS}"
>=20
> +IMAGE_CMD_sdimg () {
> +        MD5SUM_SD=3D"$(md5sum ${IMAGE_ROOTFS}/boot/uImage | awk =
'{print $1}')"=20
> +        for sdsize in $(ls ${WORKDIR}/conf/sd/sd-master* | sed -e =
s:${WORKDIR}/conf/sd/sd-master-::g -e 's:.img.gz::g' | xargs echo) ; do
> +        echo "SD size: $sdsize"
> +
> +        if true ; then
> +                echo "No cached SD image found, generating new one"
> +                zcat ${WORKDIR}/conf/sd/sd-master-$sdsize.img.gz > =
${WORKDIR}/sd.img
> +                /sbin/fdisk -l -u ${WORKDIR}/sd.img
> +
> +                # Output looks like:
> +                # Disk sd-master-1GiB.img: 0 MB, 0 bytes
> +                # 255 heads, 63 sectors/track, 0 cylinders, total 0 =
sectors
> +                # Units =3D sectors of 1 * 512 =3D 512 bytes
> +                # Sector size (logical/physical): 512 bytes / 512 =
bytes
> +                # I/O size (minimum/optimal): 512 bytes / 512 bytes
> +                # Disk identifier: 0x00000000
> +                #=20
> +                #             Device Boot      Start         End      =
Blocks   Id  System
> +                # sd-master-1GiB.img1   *          63      144584     =
  72261    c  W95 FAT32 (LBA)
> +                # sd-master-1GiB.img2          144585     1959929     =
 907672+  83  Linux
> +
> +
> +                BYTES_PER_SECTOR=3D"$(/sbin/fdisk -l -u sd.img | grep =
Units | awk '{print $9}')"
> +                VFAT_SECTOR_OFFSET=3D"$(/sbin/fdisk -l -u sd.img | =
grep img1 | awk '{print $3}')"
> +                EXT3_SECTOR_OFFSET=3D"$(/sbin/fdisk -l -u sd.img | =
grep img2 | awk '{print $2}')"
> +
> +                LOOP_DEV=3D"/dev/loop1"
> +                LOOP_DEV_FS=3D"/dev/loop2"
> +                umount ${LOOP_DEV} || true
> +                umount ${LOOP_DEV_FS} || true
> +                /sbin/losetup -d ${LOOP_DEV} || true
> +                /sbin/losetup -d ${LOOP_DEV_FS} || true
> +
> +                echo ""
> +
> +                # VFAT
> +                echo "/sbin/losetup -v -o $(expr ${BYTES_PER_SECTOR} =
"*" ${VFAT_SECTOR_OFFSET}) ${LOOP_DEV} ${WORKDIR}/sd.img"
> +                /sbin/losetup -v -o $(expr ${BYTES_PER_SECTOR} "*" =
${VFAT_SECTOR_OFFSET}) ${LOOP_DEV} ${WORKDIR}/sd.img
> +
> +                # EXT3
> +                echo "/sbin/losetup -v -o $(expr ${BYTES_PER_SECTOR} =
"*" ${EXT3_SECTOR_OFFSET}) ${LOOP_DEV_FS} ${WORKDIR}/sd.img"
> +                /sbin/losetup -v -o $(expr ${BYTES_PER_SECTOR} "*" =
${EXT3_SECTOR_OFFSET}) ${LOOP_DEV_FS} ${WORKDIR}/sd.img
> +                echo "/sbin/mkfs.ext3 -L Narcissus-rootfs =
${LOOP_DEV_FS}"
> +                /sbin/mkfs.ext3 -L Narcissus-rootfs ${LOOP_DEV_FS}
> +
> +                echo ""
> +
> +                echo "mount ${LOOP_DEV}"
> +                mount ${LOOP_DEV}
> +
> +                echo "mount ${LOOP_DEV_FS}"
> +                mount ${LOOP_DEV_FS}
> +
> +                # report mount status to log
> +                mount | grep loop
> +
> +                if [ -e ${IMAGE_ROOTFS}/boot/MLO ] ; then
> +                	cp -v ${IMAGE_ROOTFS}/boot/MLO =
/mnt/narcissus/sd_image1/MLO
> +                fi
> +
> +                echo "Remounting ${LOOP_DEV}"
> +                umount ${LOOP_DEV}
> +                mount ${LOOP_DEV}
> +
> +                echo "Copying file system:"
> +		cp -r ${IMAGE_ROOTFS}/* /mnt/narcissus/sd_images2/ || =
true
> +
> +		echo "Copying bootloaders into the boot partition"
> +                cp -v /mnt/narcissus/sd_image2/boot/u-boot-*.bin =
/mnt/narcissus/sd_image1/u-boot.bin || true
> +                cp -v /mnt/narcissus/sd_image2/boot/uImage-2.6* =
/mnt/narcissus/sd_image1/uImage || true
> +                cp -v /mnt/narcissus/sd_image2/boot/user.txt =
/mnt/narcissus/sd_image1/ || true
> +                cp -v /mnt/narcissus/sd_image2/boot/uEnv.txt =
/mnt/narcissus/sd_image1/ || true
> +
> +                if [ ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubi ] ; then
> +                        echo "Copying UBIFS image to file system:"
> +                        cp ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubi =
/mnt/narcissus/sd_image2/boot/fs.ubi
> +                fi
> +
> +                touch  /mnt/narcissus/sd_image2/narcissus-was-here
> +                echo "Remounting ${LOOP_DEV_FS}"
> +                umount ${LOOP_DEV_FS}
> +                mount ${LOOP_DEV_FS}
> +
> +                echo "files in ext3 partition:" $(du -hs =
/mnt/narcissus/sd_image2/* | sed s:/mnt/narcissus/sd_image2/::g)
> +
> +                echo "umount ${LOOP_DEV}"      =20
> +                umount ${LOOP_DEV}
> +                echo "umount ${LOOP_DEV_FS}"
> +                umount ${LOOP_DEV_FS}
> +
> +                /sbin/losetup -d ${LOOP_DEV}
> +                /sbin/losetup -d ${LOOP_DEV_FS}
> +
> +                gzip -c sd.img > =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}-${MACHINE}-sd-$sdsize.img.gz
> +        fi
> +        done
> +}
> +
> EXTRA_IMAGECMD =3D ""
> EXTRA_IMAGECMD_jffs2 ?=3D "--pad --little-endian --eraseblock=3D0x40000"=

> # Change these if you want default genext2fs behavior (i.e. create =
minimal inode number)
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



