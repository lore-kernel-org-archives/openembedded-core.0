Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RZrrc-0003AO-6t
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:27:20 +0100
Received: by dake40 with SMTP id e40so3969000dak.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2011 14:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lNihSUMyGsANXr43ZSTgMrQy6g/j1WVw9ZU506mzdm4=;
	b=dCfPuN6TjConU3bYoyzMATB1fGFl3gB2Z3r/W5j1PBuu/KkHD3kWONgl+Nn3p/JFYe
	QiqfJSplx5RfKmjXUOGPBPJAgxM/mVLl93cbUg6XsrIsNizZhYKRn5vrfK1GuKxIeROZ
	QI+u1llMPCr5pCjQ/6CP2x0klh3CZenRwkU5g=
MIME-Version: 1.0
Received: by 10.68.211.5 with SMTP id my5mr29087561pbc.17.1323642025354; Sun,
	11 Dec 2011 14:20:25 -0800 (PST)
Received: by 10.142.128.8 with HTTP; Sun, 11 Dec 2011 14:20:25 -0800 (PST)
In-Reply-To: <20111211100325.GE3986@jama.jama.net>
References: <cover.1323212403.git.andrea.adami@gmail.com>
	<68e1fafa3ed455dd26cfbfe2a76b3cbdb5b7bfc2.1323212403.git.andrea.adami@gmail.com>
	<CA+M6bXmdt7UE+-HkLva9snnv=AJhhh0sxKSKCJhQOb58bNKGJQ@mail.gmail.com>
	<20111208151026.GC3761@jama.jama.net>
	<CAAQYJAuHVLo6A_cGXBVoq+3Tj863LRH+hu-6GtZeqo3_aJWYQA@mail.gmail.com>
	<20111211100325.GE3986@jama.jama.net>
Date: Sun, 11 Dec 2011 23:20:25 +0100
Message-ID: <CAAQYJAu=xB8PeC6CotACCzvEjwYT+UiiAza3LfoaWM13pf8PEg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] image_types.bbclass: implement jffs2 summary images (sum.jffs2)
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
X-List-Received-Date: Sun, 11 Dec 2011 22:27:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 11, 2011 at 11:03 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Thu, Dec 08, 2011 at 10:30:27PM +0100, Andrea Adami wrote:
>> On Thu, Dec 8, 2011 at 4:10 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> > On Thu, Dec 08, 2011 at 07:57:52AM -0700, Tom Rini wrote:
>> >> On Tue, Dec 6, 2011 at 4:23 PM, Andrea Adami <andrea.adami@gmail.com>=
 wrote:
>> >> > * Building the jffs2 filesystem to include summary information spee=
ds up
>> >> > * the mount process considerably at the cost of increased size.
>> >> > * The rate of speedup is generally higher on NAND chips and on the =
chips
>> >> > * where the erase block size is large.
>> >> >
>> >> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> >
>> > I'll repeat my comment from yesterday, but IMHO it would be easier to
>> > see the difference between those 2 images if the IMAGE_CMD_jffs2 outpu=
t is
>> > renamed to .jffs2.nosummary and IMAGE_CMD_sum.jffs2 (or renamed IMAGE_=
CMD_jffs2.summary)
>> > produces .jffs2.summary (or even just .jffs2 if we can agree that .sum=
mary is
>> > what enduser wants by default)
>>
>> I tried to keep the patch not too invasive and did not introduce a
>> special EXTRA string for sumtool.
>> The most widely used options (-p -l -e) are common, though.
>>
>> Unfortunately summary means we have a bigger image:
>> 44M Dec =A08 16:14 core-image-sato-c7x0-20111208151047.rootfs.jffs2
>> 57M Dec =A08 16:14 core-image-sato-c7x0-20111208151047.rootfs.sum.jffs2
>>
>> Being some devices have strict size requirements I think it is better
>> to build both kind of images.
>
> Today I've noticed that it doesn't work for me:
>
> I have changed EXTRA_IMAGECMD_jffs2 to use new sum.jffs2:
> http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dblobdiff;f=3D=
meta-openmoko/conf/machine/om-gta02.conf;h=3Dad71d3db386b7d7df6ab484ea9ad80=
260da30373;hp=3D7cfb1b2a07b09ac3a35a27d209015ea8533ff632;hb=3D26d60e47358ab=
e66d7d0fdbe6d5adea8f46bdbe2;hpb=3D043b5ac84794946e88e880b722fed445d3d985c5
>

Martin,

the idea of the patch was to keep things simple.

After all most machines only specify endianness, eraseblocksize and padding=
.
The few which are using summary jffs2 in meta-handhels appear to be
Zaurus and hx4700 (I'll send a patch to fix ipaq's too) and fwiw
beagleboard used '-npl' so I think we cover the most common case when
people are setting

EXTRA_IMAGECMD_jffs2 =3D "-p -l --eraseblock=3D${ERASEBLOCKSIZE}"

and for the rare case they add  IMAGE_FSTYPES +=3D "tar.gz jffs2 sum.jffs2"=
:
EXTRA_IMAGECMD_sum.jffs2 =3D "${EXTRA_IMAGECMD_jffs2}"

This happens to work just as intended, without adding another var for
sumtool args.

        mkfs.jffs2
--root=3D/oe/oe-core/build/tmp-eglibc/work/c7x0-oe-linux-gnueabi/core-image=
-sato-1.0-r0/rootfs
--faketime --output=3D/oe/oe-core/build/tmp-eglibc/deploy/images/core-image=
-sato-c7x0-20111210181230.rootfs.jffs2
-n -p -l --eraseblock=3D0x4000
        cd /oe/oe-core/build/tmp-eglibc/deploy/images/
        rm -f /oe/oe-core/build/tmp-eglibc/deploy/images/core-image-sato-c7=
x0.jffs2
        ln -s core-image-sato-c7x0-20111210181230.rootfs.jffs2
/oe/oe-core/build/tmp-eglibc/deploy/images/core-image-sato-c7x0.jffs2
        # Image generation code for image type sum.jffs2
        ROOTFS_SIZE=3D`du -ks
/oe/oe-core/build/tmp-eglibc/work/c7x0-oe-linux-gnueabi/core-image-sato-1.0=
-r0/rootfs|awk
'{size =3D $1 * 1.3 + 0; OFMT =3D "%.0f" ; print (size > 65536 ? size :
65536) }'`
        mkfs.jffs2
--root=3D/oe/oe-core/build/tmp-eglibc/work/c7x0-oe-linux-gnueabi/core-image=
-sato-1.0-r0/rootfs
--faketime --output=3D/oe/oe-core/build/tmp-eglibc/deploy/images/core-image=
-sato-c7x0-20111210181230.rootfs.jffs2
-n -p -l --eraseblock=3D0x4000 && sumtool -i /oe/
oe-core/build/tmp-eglibc/deploy/images/core-image-sato-c7x0-20111210181230.=
rootfs.jffs2
        -o /oe/oe-core/build/tmp-eglibc/deploy/images/core-image-sato-c7x0-=
20111210181230.rootfs.sum.jffs2
-n -p -l --eraseblock=3D0x4000
        cd /oe/oe-core/build/tmp-eglibc/deploy/images/
        rm -f /oe/oe-core/build/tmp-eglibc/deploy/images/core-image-sato-c7=
x0.sum.jffs2
        ln -s core-image-sato-c7x0-20111210181230.rootfs.sum.jffs2
/oe/oe-core/build/tmp-eglibc/deploy/images/core-image-sato-c7x0.sum.jffs2



Being that IMAGE_CMD_sum.jffs2 cannot be overriden I adapted the
EXTRA_IMAGECMD_jffs2 and simplified it in the way the string can be
used by sumtool.
To have full customization you'd need a weak assignment in image_types.bbcl=
ass.


> OE om-gta02@shr ~/shr-core $ bitbake -e shr-lite-image | tee -a image.log
>
> OE om-gta02@shr ~/shr-core $ grep ^EXTRA_IMAGECMD image.log | grep jffs2
> EXTRA_IMAGECMD_sum.jffs2=3D"--eraseblock=3D0x20000 --no-cleanmarkers --li=
ttleendian --pad"
> EXTRA_IMAGECMD_jffs2=3D"--little-endian --eraseblock=3D0x20000 --pagesize=
=3D0x800 --no-cleanmarkers --pad; mv /OE/shr-core/tmp-eglibc/deploy/images/=
om-gta02/shr-lite-20111211-om-gta02.rootfs.jffs2 /OE/shr-core/tmp-eglibc/de=
ploy/images/om-gta02/shr-lite-20111211-om-gta02.rootfs.jffs2.nosummary;"
>
> This looks right (notice that sumtool is using different --little-endian/=
--littleendian).

Pls use -l  ;)

>
> OE om-gta02@shr ~/shr-core $ grep IMAGE_CMD image.log | grep jffs2
> # IMAGE_CMD_sum.jffs2=3D${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMA=
GE}/${IMAGE_NAME}.rootfs.jffs2 =A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.roo=
tfs.sum.jffs2 -n ${EXTRA_IMAGECMD}
> IMAGE_CMD_sum.jffs2=3D"mkfs.jffs2 --root=3D/OE/shr-core/tmp-eglibc/work/o=
m_gta02-oe-linux-gnueabi/shr-lite-image/2.0-r20/rootfs --faketime --output=
=3D/OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-lite-20111211-om-gta0=
2.rootfs.jffs2 -n =A0&& sumtool -i /OE/shr-core/tmp-eglibc/deploy/images/om=
-gta02/shr-lite-20111211-om-gta02.rootfs.jffs2 =A0 =A0 =A0-o /OE/shr-core/t=
mp-eglibc/deploy/images/om-gta02/shr-lite-20111211-om-gta02.rootfs.sum.jffs=
2 -n"
> # IMAGE_CMD_jffs2=3Dmkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime --outp=
ut=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}
> IMAGE_CMD_jffs2=3D"mkfs.jffs2 --root=3D/OE/shr-core/tmp-eglibc/work/om_gt=
a02-oe-linux-gnueabi/shr-lite-image/2.0-r20/rootfs --faketime --output=3D/O=
E/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-lite-20111211-om-gta02.roo=
tfs.jffs2 -n"
>
> Here we can see that bitbake -e didn't expand EXTRA_IMAGECMD right, but i=
t seems like do_rootfs have them not empty:
>
> shr-core/tmp/work/om_gta02-oe-linux-gnueabi/shr-image/2.0-r18/temp/run.do=
_rootfs.688:
> =A0 =A0 =A0 =A0# Image generation code for image type sum.jffs2
> =A0 =A0 =A0 =A0ROOTFS_SIZE=3D`du -ks /OE/shr-core/tmp/work/om_gta02-oe-li=
nux-gnueabi/shr-image/2.0-r18/rootfs|awk '{size =3D $1 * 1.3 + 0; OFMT =3D =
"%.0f" ; print (size > 65536 ? size : 65536) }'`
> =A0 =A0 =A0 =A0mkfs.jffs2 --root=3D/OE/shr-core/tmp/work/om_gta02-oe-linu=
x-gnueabi/shr-image/2.0-r18/rootfs --faketime --output=3D/OE/shr-core/tmp/d=
eploy/images/om-gta02/shr-full-20111210-om-gta02.rootfs.jffs2 -n --eraseblo=
ck=3D0x20000 --no-cleanmarkers --littleendian --pad =A0&& sumtool -i /OE/sh=
r-core/tmp/deploy/images/om-gta02/shr-full-20111210-om-gta02.rootfs.jffs2 =
=A0 =A0-o /OE/shr-core/tmp/deploy/images/om-gta02/shr-full-20111210-om-gta0=
2.rootfs.sum.jffs2 -n --eraseblock=3D0x20000 --no-cleanmarkers --littleendi=
an --pad
> =A0 =A0 =A0 =A0cd /OE/shr-core/tmp/deploy/images/om-gta02/
> =A0 =A0 =A0 =A0rm -f /OE/shr-core/tmp/deploy/images/om-gta02/full-om-gta0=
2.sum.jffs2
> =A0 =A0 =A0 =A0ln -s shr-full-20111210-om-gta02.rootfs.sum.jffs2 /OE/shr-=
core/tmp/deploy/images/om-gta02/full-om-gta02.sum.jffs2
>
> Notice that IMAGE_CMD_jffs2 is using EXTRA_IMAGECMD_sum.jffs2 (so params =
for sumtool not mkfs.jffs2) when it's expanded
> inside IMAGE_CMD_sum.jffs2 variable
>
> openembedded-core/meta/classes/image_types.bbclass:
> IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketime --out=
put=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
> IMAGE_CMD_sum.jffs2 =3D "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IM=
AGE}/${IMAGE_NAME}.rootfs.jffs2 \
> =A0 =A0 =A0 =A0-o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 -n $=
{EXTRA_IMAGECMD}"
>
> And causing
> mkfs.jffs2: unrecognized option '--littleendian'
> mkfs.jffs2: error!: Usage: mkfs.jffs2 [OPTIONS]
>
> And using EXTRA_IMAGECMD_jffs2 in IMAGE_CMD_jffs2 breaks parsing..
>
> ERROR: Unable to parse /OE/shr-core/openembedded-core/meta/recipes-core/i=
mages/core-image-minimal-initramfs.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ETA: =A0--:--:--
> Traceback (most recent call last):
> =A0File "/usr/lib64/python2.7/site-packages/bb/codeparser.py", line 268, =
in ShellParser.parse_shell(value=3D'\t#set -x\n\trm -rf /OE/shr-core/tmp-eg=
libc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/roo=
tfs\n\trm -rf /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-i=
mage-minimal-initramfs/1.0-r0/multilib\n\tmkdir -p /OE/shr-core/tmp-eglibc/=
work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs\n=
\tmkdir -p /OE/shr-core/tmp-eglibc/deploy/images/om-gta02\n\n\tcp /OE/shr-c=
ore/openembedded-core/meta/files/deploydir_readme.txt /OE/shr-core/tmp-egli=
bc/deploy/images/om-gta02/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.tx=
t\n\n\tif [ "0" !=3D "1" ]; then\n\t\tfor devtable in =A0/OE/shr-core/meta-=
handheld/files/device_table-minimal.txt; do\n\t\t\tmakedevs -r /OE/shr-core=
/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0=
-r0/rootfs -D $devtable\n\t\tdone\n\tfi\n\n\trootfs_ipk_do_rootfs\n\n\tinse=
rt_feed_uris\n\n\tif [ "xldconfig-native:do_populate_sysroot" !=3D "x" ]; t=
hen\n\t\t# Run ldconfig on the image to create a valid cache\n\t\t# (new fo=
rmat for cross arch compatibility)\n\t\techo executing: ldconfig -r /OE/shr=
-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramf=
s/1.0-r0/rootfs -c new -v\n\t\tldconfig -r /OE/shr-core/tmp-eglibc/work/om_=
gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs -c new -v=
\n\tfi\n\n\t# (re)create kernel modules dependencies\n\t# This part is done=
 by kernel-module-* postinstall scripts but if image do\n\t# not contains m=
odules at all there are few moments in boot sequence with\n\t# "unable to o=
pen modules.dep" message.\n\tif [ -e /OE/shr-core/tmp-eglibc/sysroots/om-gt=
a02/kernel/kernel-abiversion ]; then\n\t\tKERNEL_VERSION=3D`cat /OE/shr-cor=
e/tmp-eglibc/sysroots/om-gta02/kernel/kernel-abiversion`\n\n\t\tmkdir -p /O=
E/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-ini=
tramfs/1.0-r0/rootfs/lib/modules/$KERNEL_VERSION\n\t\tarm-oe-linux-gnueabi-=
depmod -a -b /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-im=
age-minimal-initramfs/1.0-r0/rootfs -F /OE/shr-core/tmp-eglibc/sysroots/om-=
gta02/kernel/System.map-$KERNEL_VERSION $KERNEL_VERSION\n\tfi\n\n\t${IMAGE_=
PREPROCESS_COMMAND}\n\n\t\n\t# Image generation code for image type cpio.gz=
\n\tROOTFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gn=
ueabi/core-image-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1 * 1.3 +=
 0; OFMT =3D "%.0f" ; print (size > 8192 ? size : 8192) }\'`\n\tcd /OE/shr-=
core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs=
/1.0-r0/rootfs && (find . | cpio -o -H newc | gzip -c -9 >/OE/shr-core/tmp-=
eglibc/deploy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-=
gta02.rootfs.cpio.gz)\n\tcd /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/=
\n\trm -f /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-minimal=
-initramfs-om-gta02.cpio.gz\n\tln -s shr-core-image-minimal-initramfs-20111=
211-om-gta02.rootfs.cpio.gz /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/=
core-image-minimal-initramfs-om-gta02.cpio.gz\n\t# Image generation code fo=
r image type tar.gz\n\tROOTFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/o=
m_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs|awk \'{=
size =3D $1 * 1.3 + 0; OFMT =3D "%.0f" ; print (size > 8192 ? size : 8192) =
}\'`\n\tcd /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-imag=
e-minimal-initramfs/1.0-r0/rootfs && tar -zcvf /OE/shr-core/tmp-eglibc/depl=
oy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootf=
s.tar.gz .\n\tcd /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/\n\trm -f /=
OE/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-minimal-initramfs-=
om-gta02.tar.gz\n\tln -s shr-core-image-minimal-initramfs-20111211-om-gta02=
.rootfs.tar.gz /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-mi=
nimal-initramfs-om-gta02.tar.gz\n\t# Image generation code for image type s=
um.jffs2\n\tROOTFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-=
linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1=
 * 1.3 + 0; OFMT =3D "%.0f" ; print (size > 8192 ? size : 8192) }\'`\n\tmkf=
s.jffs2 --root=3D/OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/cor=
e-image-minimal-initramfs/1.0-r0/rootfs --faketime --output=3D/OE/shr-core/=
tmp-eglibc/deploy/images/om-gta02/shr-core-image-minimal-initramfs-20111211=
-om-gta02.rootfs.jffs2 -n --little-endian --eraseblock=3D0x20000 --pagesize=
=3D0x800 --no-cleanmarkers --pad; mv /OE/shr-core/tmp-eglibc/deploy/images/=
om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.jffs2 /O=
E/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-core-image-minimal-initram=
fs-20111211-om-gta02.rootfs.jffs2.nosummary; && sumtool -i /OE/shr-core/tmp=
-eglibc/deploy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om=
-gta02.rootfs.jffs2 \t-o /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr=
-core-image-minimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2 -n --erase=
block=3D0x20000 --no-cleanmarkers --littleendian --pad \n\tcd /OE/shr-core/=
tmp-eglibc/deploy/images/om-gta02/\n\trm -f /OE/shr-core/tmp-eglibc/deploy/=
images/om-gta02/core-image-minimal-initramfs-om-gta02.sum.jffs2\n\tln -s sh=
r-core-image-minimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2 /OE/shr-c=
ore/tmp-eglibc/deploy/images/om-gta02/core-image-minimal-initramfs-om-gta02=
.sum.jffs2\n\n\n\t =A0 do_testlab ;\n\n\t\n'):
> =A0 =A0 =A0 =A0 =A0 =A0 try:
> =A0 =A0> =A0 =A0 =A0 =A0 =A0 =A0tokens, _ =3D pyshyacc.parse(value, eof=
=3DTrue, debug=3DFalse)
> =A0 =A0 =A0 =A0 =A0 =A0 except pyshlex.NeedMore:
> =A0File "/usr/lib64/python2.7/site-packages/bb/pysh/pyshyacc.py", line 67=
3, in parse(input=3D'\t#set -x\n\trm -rf /OE/shr-core/tmp-eglibc/work/om_gt=
a02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs\n\trm -rf /=
OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-in=
itramfs/1.0-r0/multilib\n\tmkdir -p /OE/shr-core/tmp-eglibc/work/om_gta02-o=
e-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs\n\tmkdir -p /OE/=
shr-core/tmp-eglibc/deploy/images/om-gta02\n\n\tcp /OE/shr-core/openembedde=
d-core/meta/files/deploydir_readme.txt /OE/shr-core/tmp-eglibc/deploy/image=
s/om-gta02/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt\n\n\tif [ "0"=
 !=3D "1" ]; then\n\t\tfor devtable in =A0/OE/shr-core/meta-handheld/files/=
device_table-minimal.txt; do\n\t\t\tmakedevs -r /OE/shr-core/tmp-eglibc/wor=
k/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs -D $=
devtable\n\t\tdone\n\tfi\n\n\trootfs_ipk_do_rootfs\n\n\tinsert_feed_uris\n\=
n\tif [ "xldconfig-native:do_populate_sysroot" !=3D "x" ]; then\n\t\t# Run =
ldconfig on the image to create a valid cache\n\t\t# (new format for cross =
arch compatibility)\n\t\techo executing: ldconfig -r /OE/shr-core/tmp-eglib=
c/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs=
 -c new -v\n\t\tldconfig -r /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-=
gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs -c new -v\n\tfi\n\n\t# (=
re)create kernel modules dependencies\n\t# This part is done by kernel-modu=
le-* postinstall scripts but if image do\n\t# not contains modules at all t=
here are few moments in boot sequence with\n\t# "unable to open modules.dep=
" message.\n\tif [ -e /OE/shr-core/tmp-eglibc/sysroots/om-gta02/kernel/kern=
el-abiversion ]; then\n\t\tKERNEL_VERSION=3D`cat /OE/shr-core/tmp-eglibc/sy=
sroots/om-gta02/kernel/kernel-abiversion`\n\n\t\tmkdir -p /OE/shr-core/tmp-=
eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/r=
ootfs/lib/modules/$KERNEL_VERSION\n\t\tarm-oe-linux-gnueabi-depmod -a -b /O=
E/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-ini=
tramfs/1.0-r0/rootfs -F /OE/shr-core/tmp-eglibc/sysroots/om-gta02/kernel/Sy=
stem.map-$KERNEL_VERSION $KERNEL_VERSION\n\tfi\n\n\t${IMAGE_PREPROCESS_COMM=
AND}\n\n\t\n\t# Image generation code for image type cpio.gz\n\tROOTFS_SIZE=
=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-imag=
e-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1 * 1.3 + 0; OFMT =3D "%=
.0f" ; print (size > 8192 ? size : 8192) }\'`\n\tcd /OE/shr-core/tmp-eglibc=
/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs =
&& (find . | cpio -o -H newc | gzip -c -9 >/OE/shr-core/tmp-eglibc/deploy/i=
mages/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.cp=
io.gz)\n\tcd /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/\n\trm -f /OE/s=
hr-core/tmp-eglibc/deploy/images/om-gta02/core-image-minimal-initramfs-om-g=
ta02.cpio.gz\n\tln -s shr-core-image-minimal-initramfs-20111211-om-gta02.ro=
otfs.cpio.gz /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-mini=
mal-initramfs-om-gta02.cpio.gz\n\t# Image generation code for image type ta=
r.gz\n\tROOTFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linu=
x-gnueabi/core-image-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1 * 1=
.3 + 0; OFMT =3D "%.0f" ; print (size > 8192 ? size : 8192) }\'`\n\tcd /OE/=
shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minimal-initr=
amfs/1.0-r0/rootfs && tar -zcvf /OE/shr-core/tmp-eglibc/deploy/images/om-gt=
a02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.tar.gz .\n\tc=
d /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/\n\trm -f /OE/shr-core/tmp=
-eglibc/deploy/images/om-gta02/core-image-minimal-initramfs-om-gta02.tar.gz=
\n\tln -s shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.tar.gz =
/OE/shr-core/tmp-eglibc/deploy/images/om-gta02/core-image-minimal-initramfs=
-om-gta02.tar.gz\n\t# Image generation code for image type sum.jffs2\n\tROO=
TFS_SIZE=3D`du -ks /OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/c=
ore-image-minimal-initramfs/1.0-r0/rootfs|awk \'{size =3D $1 * 1.3 + 0; OFM=
T =3D "%.0f" ; print (size > 8192 ? size : 8192) }\'`\n\tmkfs.jffs2 --root=
=3D/OE/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/core-image-minima=
l-initramfs/1.0-r0/rootfs --faketime --output=3D/OE/shr-core/tmp-eglibc/dep=
loy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.root=
fs.jffs2 -n --little-endian --eraseblock=3D0x20000 --pagesize=3D0x800 --no-=
cleanmarkers --pad; mv /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-c=
ore-image-minimal-initramfs-20111211-om-gta02.rootfs.jffs2 /OE/shr-core/tmp=
-eglibc/deploy/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om=
-gta02.rootfs.jffs2.nosummary; && sumtool -i /OE/shr-core/tmp-eglibc/deploy=
/images/om-gta02/shr-core-image-minimal-initramfs-20111211-om-gta02.rootfs.=
jffs2 \t-o /OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-core-image-mi=
nimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2 -n --eraseblock=3D0x2000=
0 --no-cleanmarkers --littleendian --pad \n\tcd /OE/shr-core/tmp-eglibc/dep=
loy/images/om-gta02/\n\trm -f /OE/shr-core/tmp-eglibc/deploy/images/om-gta0=
2/core-image-minimal-initramfs-om-gta02.sum.jffs2\n\tln -s shr-core-image-m=
inimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2 /OE/shr-core/tmp-eglibc=
/deploy/images/om-gta02/core-image-minimal-initramfs-om-gta02.sum.jffs2\n\n=
\n\t =A0 do_testlab ;\n\n\t\n', eof=3DTrue, debug=3DFalse):
> =A0 =A0 =A0 =A0 =A0 =A0 debug =3D 2
> =A0 =A0> =A0 =A0return yacc.parse(lexer=3Dlexer, debug=3Ddebug), remainin=
g
>
> =A0File "/usr/lib64/python2.7/site-packages/ply/yacc.py", line 265, in LR=
Parser.parse(input=3DNone, lexer=3D<bb.pysh.pyshlex.PLYLexer instance at 0x=
9638248>, debug=3DFalse, tracking=3D0, tokenfunc=3DNone):
> =A0 =A0 =A0 =A0 =A0 =A0 else:
> =A0 =A0> =A0 =A0 =A0 =A0 =A0 =A0return self.parseopt_notrack(input,lexer,=
debug,tracking,tokenfunc)
>
> =A0File "/usr/lib64/python2.7/site-packages/ply/yacc.py", line 1047, in L=
RParser.parseopt_notrack(input=3DNone, lexer=3D<bb.pysh.pyshlex.PLYLexer in=
stance at 0x9638248>, debug=3DFalse, tracking=3D0, tokenfunc=3DNone):
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 errtoken.=
lexer =3D lexer
> =A0 =A0> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tok =3D self.erro=
rfunc(errtoken)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 del errok, token,=
 restart =A0 # Delete special functions
> =A0File "/usr/lib64/python2.7/site-packages/bb/pysh/pyshyacc.py", line 64=
6, in p_error(p=3DLexToken(AND_IF,'&&',0,0)):
> =A0 =A0 =A0 =A0 =A0 =A0 w(' =A0%r\n' % n)
> =A0 =A0> =A0 =A0raise sherrors.ShellSyntaxError(''.join(msg))
>
> ShellSyntaxError: LexToken(AND_IF,'&&',0,0)
> followed by:
> =A0LexToken(TOKEN,'sumtool',0,0)
> =A0LexToken(TOKEN,'-i',0,0)
> =A0LexToken(TOKEN,'/OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-cor=
e-image-minimal-initramfs-20111211-om-gta02.rootfs.jffs2',0,0)
> =A0LexToken(TOKEN,'-o',0,0)
> =A0LexToken(TOKEN,'/OE/shr-core/tmp-eglibc/deploy/images/om-gta02/shr-cor=
e-image-minimal-initramfs-20111211-om-gta02.rootfs.sum.jffs2',0,0)
>
>
>
>>
>> Cheers
>>
>> Andrea
>>
>> >
>> > But other than that it looks fine and will make my IMAGE_DEPENDS_jffs2=
 a
>> > bit shorter.
>> >
>> > Regards,
>> >
>> >>
>> >> Acked-by: Tom Rini <tom.rini@gmail.com>
>> >>
>> >> > ---
>> >> > =A0meta/classes/image_types.bbclass | =A0 =A05 ++++-
>> >> > =A01 files changed, 4 insertions(+), 1 deletions(-)
>> >> >
>> >> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_=
types.bbclass
>> >> > index 29b6380..bd4b7bc 100644
>> >> > --- a/meta/classes/image_types.bbclass
>> >> > +++ b/meta/classes/image_types.bbclass
>> >> > @@ -35,6 +35,8 @@ XZ_COMPRESSION_LEVEL ?=3D "-e -9"
>> >> > =A0XZ_INTEGRITY_CHECK ?=3D "crc32"
>> >> >
>> >> > =A0IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faket=
ime --output=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGE=
CMD}"
>> >> > +IMAGE_CMD_sum.jffs2 =3D "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY=
_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
>> >> > + =A0 =A0 =A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2=
 ${EXTRA_IMAGECMD}"
>> >> >
>> >> > =A0IMAGE_CMD_cramfs =3D "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAG=
E}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>> >> >
>> >> > @@ -138,6 +140,7 @@ EXTRA_IMAGECMD_btrfs ?=3D ""
>> >> >
>> >> > =A0IMAGE_DEPENDS =3D ""
>> >> > =A0IMAGE_DEPENDS_jffs2 =3D "mtd-utils-native"
>> >> > +IMAGE_DEPENDS_sum.jffs2 =3D "mtd-utils-native"
>> >> > =A0IMAGE_DEPENDS_cramfs =3D "cramfs-native"
>> >> > =A0IMAGE_DEPENDS_ext2 =3D "genext2fs-native"
>> >> > =A0IMAGE_DEPENDS_ext2.gz =3D "genext2fs-native"
>> >> > @@ -157,4 +160,4 @@ IMAGE_DEPENDS_ubi =3D "mtd-utils-native"
>> >> > =A0IMAGE_DEPENDS_ubifs =3D "mtd-utils-native"
>> >> >
>> >> > =A0# This variable is available to request which values are suitabl=
e for IMAGE_FSTYPES
>> >> > -IMAGE_TYPES =3D "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz e=
xt2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpi=
o.gz cpio.xz cpio.lzma"
>> >> > +IMAGE_TYPES =3D "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3=
 ext3.gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.x=
z cpio cpio.gz cpio.xz cpio.lzma"
>> >> > --
>> >> > 1.7.3.4
>> >> >
>> >> >
>> >> > _______________________________________________
>> >> > Openembedded-core mailing list
>> >> > Openembedded-core@lists.openembedded.org
>> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
re
>> >>
>> >>
>> >>
>> >> --
>> >> Tom
>> >>
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>> > --
>> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


Regards
Andrea


