Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S21bZ-0002mH-NU
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 15:31:10 +0100
Received: by pbbrp12 with SMTP id rp12so2813525pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 06:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.213.232 as permitted sender) client-ip=10.68.213.232; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.213.232 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.213.232])
	by 10.68.213.232 with SMTP id nv8mr40266175pbc.155.1330352562902
	(num_hops = 1); Mon, 27 Feb 2012 06:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=v+44dy6NG5O2+u0/KiCV3WTiEP6v/2QAj9RfoUr1sQ4=;
	b=BQiop3zbSbYGY+2vW/iqW5UlHdlq8TdN3JlyYYd8dvOZXz12iMG0XoI4DrfAkcd9RF
	qVfJ6H+53iqWu+H/eEUesdfGCzRIIrCuFdjeq7CTw3qLemeEa85A1/CTtw8tkJQwNwIj
	XCnW55m9GSXqxAmgQZL8BOhMy9TVRt7OuixlM=
MIME-Version: 1.0
Received: by 10.68.213.232 with SMTP id nv8mr34311322pbc.155.1330352562807;
	Mon, 27 Feb 2012 06:22:42 -0800 (PST)
Received: by 10.143.67.8 with HTTP; Mon, 27 Feb 2012 06:22:42 -0800 (PST)
In-Reply-To: <CAAQYJAthWjH=8N3AW_+h0YrKD_kcEy-3WCa3isuHMnpVHv2n4w@mail.gmail.com>
References: <1330346629.4593.20.camel@ted>
	<CAAQYJAthWjH=8N3AW_+h0YrKD_kcEy-3WCa3isuHMnpVHv2n4w@mail.gmail.com>
Date: Mon, 27 Feb 2012 15:22:42 +0100
Message-ID: <CAAQYJAtxqHU_uwHZQwUfPfnNp9ty2O0y=gQg4YG6ytwurXrGOw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Refactor compression code into a generic compression solution
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
X-List-Received-Date: Mon, 27 Feb 2012 14:31:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 3:20 PM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> On Mon, Feb 27, 2012 at 1:43 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> The current approach of adding each different compressed image type does=
n't
>> scale. This patch changes the code so compressed images for each form ar=
e
>> automatically available using the form <type>.<compression type> in
>> IMAGE_FSTYPES. This doesn't change any existing externally visible behav=
iour
>> and the image generation process becomes more efficient as a result too.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 54ab157..4db55ff 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -75,9 +75,7 @@ inherit image-${IMAGE_TYPE}
>>
>> =A0python () {
>> =A0 =A0 deps =3D d.getVarFlag('do_rootfs', 'depends') or ""
>> - =A0 =A0for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
>> - =A0 =A0 =A0 =A0for dep in ((d.getVar('IMAGE_DEPENDS_%s' % type) or "")=
.split() or []):
>> - =A0 =A0 =A0 =A0 =A0 =A0deps +=3D " %s:do_populate_sysroot" % dep
>> + =A0 =A0deps +=3D imagetypes_getdepends(d)
>> =A0 =A0 for dep in (d.getVar('EXTRA_IMAGEDEPENDS', True) or "").split():
>> =A0 =A0 =A0 =A0 deps +=3D " %s:do_populate_sysroot" % dep
>> =A0 =A0 d.setVarFlag('do_rootfs', 'depends', deps)
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types=
.bbclass
>> index 3b26162..0fb68e7 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -2,7 +2,21 @@ def get_imagecmds(d):
>> =A0 =A0 cmds =3D "\n"
>> =A0 =A0 old_overrides =3D d.getVar('OVERRIDES', 0)
>>
>> + =A0 =A0alltypes =3D d.getVar('IMAGE_FSTYPES', True).split()
>> =A0 =A0 types =3D d.getVar('IMAGE_FSTYPES', True).split()
>> + =A0 =A0ctypes =3D d.getVar('COMPRESSIONTYPES', True).split()
>> + =A0 =A0cimages =3D {}
>> +
>> + =A0 =A0# Filter out all the compressed images from types
>> + =A0 =A0for type in types:
>> + =A0 =A0 =A0 =A0for ctype in ctypes:
>> + =A0 =A0 =A0 =A0 =A0 =A0if type.endswith("." + ctype):
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0basetype =3D type.rsplit(".", 1)[0]
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0types[types.index(type)] =3D basetype
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if type not in cimages:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cimages[basetype] =3D []
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cimages[basetype].append(ctype)
>> +
>> =A0 =A0 # Live images will be processed via inheriting bbclass and
>> =A0 =A0 # does not get processed here.
>> =A0 =A0 # live images also depend on ext3 so ensure its present
>> @@ -11,11 +25,24 @@ def get_imagecmds(d):
>> =A0 =A0 =A0 =A0 =A0 =A0 types.append("ext3")
>> =A0 =A0 =A0 =A0 types.remove("live")
>>
>> + =A0 =A0cmds +=3D " =A0rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
>> =A0 =A0 for type in types:
>> + =A0 =A0 =A0 =A0ccmd =3D []
>> + =A0 =A0 =A0 =A0subimages =3D []
>> =A0 =A0 =A0 =A0 localdata =3D bb.data.createCopy(d)
>> =A0 =A0 =A0 =A0 localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overr=
ides))
>> =A0 =A0 =A0 =A0 bb.data.update_data(localdata)
>> =A0 =A0 =A0 =A0 localdata.setVar('type', type)
>> + =A0 =A0 =A0 =A0if type in cimages:
>> + =A0 =A0 =A0 =A0 =A0 =A0for ctype in cimages[type]:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ccmd.append("\t" + localdata.getVar("CO=
MPRESS_CMD_" + ctype, True))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0subimages.append(type + "." + ctype)
>> + =A0 =A0 =A0 =A0if type not in alltypes:
>> + =A0 =A0 =A0 =A0 =A0 =A0ccmd.append(localdata.expand("\trm ${IMAGE_NAME=
}.rootfs.${type}"))
>> + =A0 =A0 =A0 =A0else:
>> + =A0 =A0 =A0 =A0 =A0 =A0subimages.append(type)
>> + =A0 =A0 =A0 =A0localdata.setVar('ccmd', "\n".join(ccmd))
>> + =A0 =A0 =A0 =A0localdata.setVar('subimages', " ".join(subimages))
>> =A0 =A0 =A0 =A0 cmd =3D localdata.getVar("IMAGE_CMD", True)
>> =A0 =A0 =A0 =A0 localdata.setVar('cmd', cmd)
>> =A0 =A0 =A0 =A0 cmds +=3D localdata.getVar("runimagecmd", True)
>> @@ -25,10 +52,36 @@ runimagecmd () {
>> =A0 =A0 =A0 =A0# Image generation code for image type ${type}
>> =A0 =A0 =A0 =A0ROOTFS_SIZE=3D`du -ks ${IMAGE_ROOTFS}|awk '{base_size =3D=
 ($1 * ${IMAGE_OVERHEAD_FACTOR}); =A0OFMT =3D "%.0f" ; print ((base_size > =
${IMAGE_ROOTFS_SIZE} ? base_size : ${IMAGE_ROOTFS_SIZE}) + ${IMAGE_ROOTFS_E=
XTRA_SPACE}) }'`
>> =A0 =A0 =A0 =A0${cmd}
>> + =A0 =A0 =A0 # Now create the needed compressed versions
>> =A0 =A0 =A0 =A0cd ${DEPLOY_DIR_IMAGE}/
>> - =A0 =A0 =A0 rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
>> - =A0 =A0 =A0 ln -s ${IMAGE_NAME}.rootfs.${type} ${DEPLOY_DIR_IMAGE}/${I=
MAGE_LINK_NAME}.${type}
>> -}
>> + =A0 =A0 =A0 =A0${ccmd}
>> + =A0 =A0 =A0 # And create the symlinks
>> + =A0 =A0 =A0 =A0for type in ${subimages}; do
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -s ${IMAGE_NAME}.rootfs.$type ${DEPLOY_=
DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
>> + =A0 =A0 =A0 done
>> +}
>> +
>> +def imagetypes_getdepends(d):
>> + =A0 =A0def adddep(depstr, deps):
>> + =A0 =A0 =A0 =A0for i in (depstr or "").split():
>> + =A0 =A0 =A0 =A0 =A0 =A0if i not in deps:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0deps.append(i)
>> +
>> + =A0 =A0deps =3D []
>> + =A0 =A0ctypes =3D d.getVar('COMPRESSIONTYPES', True).split()
>> + =A0 =A0for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
>> + =A0 =A0 =A0 =A0basetype =3D type
>> + =A0 =A0 =A0 =A0for ctype in ctypes:
>> + =A0 =A0 =A0 =A0 =A0 =A0if type.endswith("." + ctype):
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0basetype =3D type.rsplit(".", 1)[0]
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0adddep(d.getVar("COMPRESS_DEPENDS_%s" %=
 ctype, True), deps)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break
>> + =A0 =A0 =A0 =A0adddep(d.getVar('IMAGE_DEPENDS_%s' % basetype, True) , =
deps)
>> +
>> + =A0 =A0depstr =3D ""
>> + =A0 =A0for dep in deps:
>> + =A0 =A0 =A0 =A0depstr +=3D " " + dep + ":do_populate_sysroot"
>> + =A0 =A0return depstr
>>
>>
>> =A0XZ_COMPRESSION_LEVEL ?=3D "-e -9"
>> @@ -46,40 +99,11 @@ IMAGE_CMD_ext2 () {
>> =A0 =A0 =A0 =A0mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.=
ext2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2
>> =A0 =A0 =A0 =A0rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
>> =A0}
>> -IMAGE_CMD_ext2.gz () {
>> - =A0 =A0 =A0 rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN} && mkdir ${DEPLOY_=
DIR_IMAGE}/tmp.gz-${PN}
>> - =A0 =A0 =A0 genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXT=
RA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext2
>> - =A0 =A0 =A0 gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.=
rootfs.ext2
>> - =A0 =A0 =A0 mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.e=
xt2.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.gz
>> - =A0 =A0 =A0 rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
>> -}
>> -IMAGE_CMD_ext2.bz2 () {
>> - =A0 =A0 =A0 rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IM=
AGE}/tmp.gz
>> - =A0 =A0 =A0 genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXT=
RA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
>> - =A0 =A0 =A0 bzip2 -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootf=
s.ext2
>> - =A0 =A0 =A0 mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.bz=
2 ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.bz2
>> - =A0 =A0 =A0 rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
>> -}
>> -IMAGE_CMD_ext2.lzma () {
>> - =A0 =A0 =A0 rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz && mkdir ${DEPLOY_DIR_IM=
AGE}/tmp.gz
>> - =A0 =A0 =A0 genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXT=
RA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2
>> - =A0 =A0 =A0 lzma -f -7 ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs=
.ext2
>> - =A0 =A0 =A0 mv ${DEPLOY_DIR_IMAGE}/tmp.gz/${IMAGE_NAME}.rootfs.ext2.lz=
ma ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext2.lzma
>> - =A0 =A0 =A0 rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz
>> -}
>>
>> =A0IMAGE_CMD_ext3 () {
>> =A0 =A0 =A0 =A0genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EX=
TRA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
>> =A0 =A0 =A0 =A0tune2fs -j ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3
>> =A0}
>> -IMAGE_CMD_ext3.gz () {
>> - =A0 =A0 =A0 rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN} && mkdir ${DEPLOY_=
DIR_IMAGE}/tmp.gz-${PN}
>> - =A0 =A0 =A0 genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EXT=
RA_IMAGECMD} ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.ext3
>> - =A0 =A0 =A0 tune2fs -j ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.=
rootfs.ext3
>> - =A0 =A0 =A0 gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.=
rootfs.ext3
>> - =A0 =A0 =A0 mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.e=
xt3.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3.gz
>> - =A0 =A0 =A0 rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
>> -}
>>
>> =A0oe_mkext4fs () {
>> =A0 =A0 =A0 =A0genext2fs -b $ROOTFS_SIZE -i 4096 -d ${IMAGE_ROOTFS} ${EX=
TRA_IMAGECMD} $1
>> @@ -97,13 +121,6 @@ oe_mkext4fs () {
>> =A0IMAGE_CMD_ext4 () {
>> =A0 =A0 =A0 =A0oe_mkext4fs ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4
>> =A0}
>> -IMAGE_CMD_ext4.gz () {
>> - =A0 =A0 =A0 rm -rf ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN} && mkdir ${DEPLOY_=
DIR_IMAGE}/tmp.gz-${PN}
>> - =A0 =A0 =A0 oe_mkext4fs ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}=
.rootfs.ext4
>> - =A0 =A0 =A0 gzip -f -9 ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.=
rootfs.ext4
>> - =A0 =A0 =A0 mv ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}/${IMAGE_NAME}.rootfs.e=
xt4.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.gz
>> - =A0 =A0 =A0 rmdir ${DEPLOY_DIR_IMAGE}/tmp.gz-${PN}
>> -}
>>
>> =A0IMAGE_CMD_btrfs () {
>> =A0 =A0 =A0 =A0mkfs.btrfs -b `expr ${ROOTFS_SIZE} \* 1024` ${EXTRA_IMAGE=
CMD} -r ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.btrfs
>> @@ -112,9 +129,6 @@ IMAGE_CMD_btrfs () {
>> =A0IMAGE_CMD_squashfs =3D "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE=
}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
>> =A0IMAGE_CMD_squashfs-lzma =3D "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY=
_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"
>> =A0IMAGE_CMD_tar =3D "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}=
/${IMAGE_NAME}.rootfs.tar ."
>> -IMAGE_CMD_tar.gz =3D "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_IMAG=
E}/${IMAGE_NAME}.rootfs.tar.gz ."
>> -IMAGE_CMD_tar.bz2 =3D "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_IMA=
GE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
>> -IMAGE_CMD_tar.xz =3D "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_DIR_=
IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
>>
>> =A0CPIO_TOUCH_INIT () {
>> =A0 =A0 =A0 =A0if [ ! -L ${IMAGE_ROOTFS}/init ]
>> @@ -126,18 +140,6 @@ IMAGE_CMD_cpio () {
>> =A0 =A0 =A0 =A0${CPIO_TOUCH_INIT}
>> =A0 =A0 =A0 =A0cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY=
_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>> =A0}
>> -IMAGE_CMD_cpio.gz () {
>> - =A0 =A0 =A0 ${CPIO_TOUCH_INIT}
>> - =A0 =A0 =A0 cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c =
-9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
>> -}
>> -IMAGE_CMD_cpio.xz () {
>> - =A0 =A0 =A0 ${CPIO_TOUCH_INIT}
>> - =A0 =A0 =A0 cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz -c ${=
XZ_COMPRESSION_LEVEL} --check=3D${XZ_INTEGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}=
/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}
>> -}
>> -IMAGE_CMD_cpio.lzma () {
>> - =A0 =A0 =A0 ${CPIO_TOUCH_INIT}
>> - =A0 =A0 =A0 cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | xz --for=
mat=3Dlzma -c ${XZ_COMPRESSION_LEVEL} --check=3D${XZ_INTEGRITY_CHECK} >${DE=
PLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma) ${EXTRA_IMAGECMD}
>> -}
>>
>> =A0UBI_VOLNAME ?=3D "${MACHINE}-rootfs"
>>
>> @@ -159,9 +161,7 @@ EXTRA_IMAGECMD =3D ""
>> =A0EXTRA_IMAGECMD_jffs2 ?=3D "--pad --little-endian --eraseblock=3D0x400=
00"
>> =A0# Change these if you want default genext2fs behavior (i.e. create mi=
nimal inode number)
>> =A0EXTRA_IMAGECMD_ext2 ?=3D "-i 8192"
>> -EXTRA_IMAGECMD_ext2.gz ?=3D "-i 8192"
>> =A0EXTRA_IMAGECMD_ext3 ?=3D "-i 8192"
>> -EXTRA_IMAGECMD_ext3.gz ?=3D "-i 8192"
>> =A0EXTRA_IMAGECMD_btrfs ?=3D ""
>>
>> =A0IMAGE_DEPENDS =3D ""
>> @@ -169,22 +169,25 @@ IMAGE_DEPENDS_jffs2 =3D "mtd-utils-native"
>> =A0IMAGE_DEPENDS_sum.jffs2 =3D "mtd-utils-native"
>> =A0IMAGE_DEPENDS_cramfs =3D "cramfs-native"
>> =A0IMAGE_DEPENDS_ext2 =3D "genext2fs-native"
>> -IMAGE_DEPENDS_ext2.gz =3D "genext2fs-native"
>> -IMAGE_DEPENDS_ext2.bz2 =3D "genext2fs-native"
>> -IMAGE_DEPENDS_ext2.lzma =3D "genext2fs-native xz-native"
>> =A0IMAGE_DEPENDS_ext3 =3D "genext2fs-native e2fsprogs-native"
>> -IMAGE_DEPENDS_ext3.gz =3D "genext2fs-native e2fsprogs-native"
>> =A0IMAGE_DEPENDS_ext4 =3D "genext2fs-native e2fsprogs-native"
>> -IMAGE_DEPENDS_ext4.gz =3D "genext2fs-native e2fsprogs-native"
>> =A0IMAGE_DEPENDS_btrfs =3D "btrfs-tools-native"
>> =A0IMAGE_DEPENDS_squashfs =3D "squashfs-tools-native"
>> =A0IMAGE_DEPENDS_squashfs-lzma =3D "squashfs-lzma-tools-native"
>> -IMAGE_DEPENDS_tar.xz =3D "tar-native xz-native"
>> -IMAGE_DEPENDS_cpio.lzma =3D "xz-native"
>> -IMAGE_DEPENDS_cpio.xz =3D "xz-native"
>> =A0IMAGE_DEPENDS_ubi =3D "mtd-utils-native"
>> =A0IMAGE_DEPENDS_ubifs =3D "mtd-utils-native"
>> =A0IMAGE_DEPENDS_vmdk =3D "qemu-native"
>>
>> =A0# This variable is available to request which values are suitable for=
 IMAGE_FSTYPES
>> =A0IMAGE_TYPES =3D "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ex=
t3.gz ext2.lzma btrfs live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 ta=
r.xz cpio cpio.gz cpio.xz cpio.lzma vmdk"
>> +
>> +COMPRESSIONTYPES =3D "gz bz2 lzma xy"
>> +COMPRESS_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>> +COMPRESS_CMD_gz =3D "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMA=
GE_NAME}.rootfs.${type}.gz"
>> +COMPRESS_CMD_bz2 =3D "bzip2 -k ${IMAGE_NAME}.rootfs.${type}"
>> +COMPRESS_CMD_xy =3D "xz -k -c ${XZ_COMPRESSION_LEVEL} --check=3D${XZ_IN=
TEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type}"
>> +COMPRESS_DEPENDS_lzma =3D "xz-native"
>> +COMPRESS_DEPENDS_gz =3D ""
>> +COMPRESS_DEPENDS_bz2 =3D ""
>> +COMPRESS_DEPENDS_xy =3D "xz-native"
>> +
>
> Nice patch,
> I've spotted a minor issue, just needing s/xy/xz/
>
>> +COMPRESS_CMD_xy =3D "xz -k -c ${XZ_COMPRESSION_LEVEL}
>> +COMPRESS_DEPENDS_xy =3D "xz-native"
>

..and one more:  +COMPRESSIONTYPES =3D "gz bz2 lzma xy"

> Cheers
>
> Andrea
>
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


