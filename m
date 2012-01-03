Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Ri5uY-0002Da-PX
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 16:04:23 +0100
Received: by pbcc11 with SMTP id c11so8653992pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2012 06:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=GfH7KhJJQV3QozV8U5WEdJLakTsJMpL41HxPmNB0fWs=;
	b=l9o/W8sVyqIi7GdiCvjKUTiwLQjZpLsquWwGOf6LV0rClQXS0dAkmJt9/zVd/lHVOx
	S8zALE80YpR7x3EK7+ju81OqyrolokHWKbOINjr3k7gZPF80VbtK7rhta3wQ191QGcQQ
	qhdKc+oEWR0KTjInccocoF9mNizUV9SOF0vyo=
MIME-Version: 1.0
Received: by 10.68.213.228 with SMTP id nv4mr65200811pbc.52.1325602621420;
	Tue, 03 Jan 2012 06:57:01 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Tue, 3 Jan 2012 06:57:01 -0800 (PST)
In-Reply-To: <4EFE46DD.5090002@linux.intel.com>
References: <fbed4e9f94ed9bd1bb5a9c8fa37113e325f89371.1325115602.git.dvhart@linux.intel.com>
	<4EFBAC18.3040909@intel.com>
	<CAAQYJAuj6x3qt+w5TXSesgAaz8i1sqXbWMSTZJOGbQEAqsuFjQ@mail.gmail.com>
	<4EFE46DD.5090002@linux.intel.com>
Date: Tue, 3 Jan 2012 15:57:01 +0100
Message-ID: <CAAQYJAsOjJaXEbNOZsC8gK0LS2iinnt+3FtSR3ta9yDc93GCXw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Ensure /init exists for cpio rootfs archives
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
X-List-Received-Date: Tue, 03 Jan 2012 15:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 31, 2011 at 12:18 AM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
>
>
> On 12/30/2011 12:25 AM, Andrea Adami wrote:
>> On Thu, Dec 29, 2011 at 12:54 AM, Darren Hart <darren.hart@intel.com> wr=
ote:
>>> <I sent this to the yocto list by mistake, forwarding here for comment>
>>>
>>> In order for the kernel to accept an initramfs as a rootfs,
>>> it must have /init - even if it is an empty file. Touch /init
>>> to ensure it exists for cpio and cpio.gz image types.
>>
>> Why didn't you add the init to cpio.xz and cpio.lzma?
>> Any special reason?
>
> No reason, just missed them I guess. I can resent with them included if
> we agree this is a reasonable approach.

Darren,

I'm not sure this is the best approach.
Thinking about *bootables* cpio, I can imagine two types:

- barebone, whithout shell, libc,  no init
- generic: with shell and some utils

The first case is usually a custom-purpose rootfs (think about
kexecboot cpio's) and the recipe takes care of creating the init
symlink

e.g.

pkg_postinst_${PN} () {
        ln -sf ${bindir}/kexecboot $D/init
}

The second case, with bigger images, implies we are populating the
rootfs with glibc, eglibc, uclibc or klibc:  I'd say it's up to those
recipes to provide a valid init.

FWIW we can imagine to pile up multiple initramfs and surely we have
to specify the init only for the first, the one in the in-kernel
embedded initramfs.

Just my thoughts

Regards

Andrea


>
> --
> Darren
>
>>
>>>
>>> When used with initrd and rootfs=3D/dev/ram0, this allows the
>>> cpio and cpio.gz images to be used as the rootfs.
>>
>> Sure, and "...If all else fails, rdinit=3D/bin/sh "
>>
>>>
>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>> ---
>>> =A0meta/classes/image_types.bbclass | =A0 10 ++++++++--
>>> =A01 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_type=
s.bbclass
>>> index 6893e38..ebff0ba 100644
>>> --- a/meta/classes/image_types.bbclass
>>> +++ b/meta/classes/image_types.bbclass
>>> @@ -110,8 +110,14 @@ IMAGE_CMD_tar =3D "cd ${IMAGE_ROOTFS} && tar -cvf =
${DEPLOY_DIR_IMAGE}/${IMAGE_NAME
>>> =A0IMAGE_CMD_tar.gz =3D "cd ${IMAGE_ROOTFS} && tar -zcvf ${DEPLOY_DIR_I=
MAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
>>> =A0IMAGE_CMD_tar.bz2 =3D "cd ${IMAGE_ROOTFS} && tar -jcvf ${DEPLOY_DIR_=
IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
>>> =A0IMAGE_CMD_tar.xz =3D "cd ${IMAGE_ROOTFS} && tar --xz -cvf ${DEPLOY_D=
IR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
>>> -IMAGE_CMD_cpio =3D "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >$=
{DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)"
>>> -IMAGE_CMD_cpio.gz =3D "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc=
 | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)"
>>> +IMAGE_CMD_cpio () {
>>> + =A0 =A0 =A0 touch ${IMAGE_ROOTFS}/init
>>> + =A0 =A0 =A0 cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc >${DEPLOY=
_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>>> +}
>>> +IMAGE_CMD_cpio.gz () {
>>> + =A0 =A0 =A0 touch ${IMAGE_ROOTFS}/init
>>> + =A0 =A0 =A0 cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c=
 -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
>>> +}
>>> =A0IMAGE_CMD_cpio.xz =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} && (=
find . | cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL} --check=3D${XZ_INT=
EGRITY_CHECK} > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_I=
MAGECMD}"
>>> =A0IMAGE_CMD_cpio.lzma =3D "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&=
 (find . | cpio -o -H newc | xz --format=3Dlzma -c ${XZ_COMPRESSION_LEVEL} =
--check=3D${XZ_INTEGRITY_CHECK} >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.c=
pio.lzma) ${EXTRA_IMAGECMD}"
>>>
>>> --
>>> 1.7.6.4
>>>
>>> _______________________________________________
>>> yocto mailing list
>>> yocto@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/yocto
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> Regards
>>
>> Andrea Adami
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel


