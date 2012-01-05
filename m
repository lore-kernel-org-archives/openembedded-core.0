Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RiawT-0004n3-CW
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 01:12:25 +0100
Received: by dake40 with SMTP id e40so10030464dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 16:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HYbn6COdBxjjeXUQMZSTdWK+352IfuN/GOCUCijGXHk=;
	b=eURFDNmsoAotM9kSC43oYTr0lbsIEcGJf6loqB333mll/RfQHMLUYAGNP1zVCQ9uWR
	X95PfqKGihd8RJlmL6hFyKwaj4zAMCE0j4xPxiMkv5nklnPcPr8w5tOm2nY1TU6lFeT8
	BM6lb9eCzCPiCuYQ+o0YUMM8q2ZQsv6qvOqHw=
MIME-Version: 1.0
Received: by 10.68.72.69 with SMTP id b5mr145149428pbv.120.1325721902518; Wed,
	04 Jan 2012 16:05:02 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Wed, 4 Jan 2012 16:05:02 -0800 (PST)
In-Reply-To: <CAAQYJAtWXeBqnf5OPWE4bpo87Uo454X8qDE7C_QEL7Pu3_k+_w@mail.gmail.com>
References: <fbed4e9f94ed9bd1bb5a9c8fa37113e325f89371.1325115602.git.dvhart@linux.intel.com>
	<4EFBAC18.3040909@intel.com> <4F03982D.1080601@linux.intel.com>
	<CAAQYJAtWXeBqnf5OPWE4bpo87Uo454X8qDE7C_QEL7Pu3_k+_w@mail.gmail.com>
Date: Thu, 5 Jan 2012 01:05:02 +0100
Message-ID: <CAAQYJAvu-n9eyXV8kj3=34_wzhdfec5Nit9uUy_ar=jFK1tFaQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 05 Jan 2012 00:12:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 12:49 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> On Wed, Jan 4, 2012 at 1:07 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 12/28/2011 03:54 PM, Darren Hart wrote:
>>>
>>> <I sent this to the yocto list by mistake, forwarding here for comment>
>>>
>>> In order for the kernel to accept an initramfs as a rootfs,
>>> it must have /init - even if it is an empty file. Touch /init
>>> to ensure it exists for cpio and cpio.gz image types.
>>>
>>> When used with initrd and rootfs=3D/dev/ram0, this allows the
>>> cpio and cpio.gz images to be used as the rootfs.
>>>
>>> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
>>> ---
>>> =A0meta/classes/image_types.bbclass | =A0 10 ++++++++--
>>> =A01 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/image_types.bbclass
>>> b/meta/classes/image_types.bbclass
>>> index 6893e38..ebff0ba 100644
>>> --- a/meta/classes/image_types.bbclass
>>> +++ b/meta/classes/image_types.bbclass
>>> @@ -110,8 +110,14 @@ IMAGE_CMD_tar =3D "cd ${IMAGE_ROOTFS}&& =A0tar -cv=
f
>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME
>>> =A0IMAGE_CMD_tar.gz =3D "cd ${IMAGE_ROOTFS}&& =A0tar -zcvf
>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.gz ."
>>> =A0IMAGE_CMD_tar.bz2 =3D "cd ${IMAGE_ROOTFS}&& =A0tar -jcvf
>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.bz2 ."
>>> =A0IMAGE_CMD_tar.xz =3D "cd ${IMAGE_ROOTFS}&& =A0tar --xz -cvf
>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar.xz ."
>>> -IMAGE_CMD_cpio =3D "cd ${IMAGE_ROOTFS}&& =A0(find . | cpio -o -H
>>> newc>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)"
>>> -IMAGE_CMD_cpio.gz =3D "cd ${IMAGE_ROOTFS}&& =A0(find . | cpio -o -H ne=
wc |
>>> gzip -c -9>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)"
>>> +IMAGE_CMD_cpio () {
>>> + =A0 =A0 =A0 touch ${IMAGE_ROOTFS}/init
>>> + =A0 =A0 =A0 cd ${IMAGE_ROOTFS}&& =A0(find . | cpio -o -H
>>> newc>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
>>> +}
>>> +IMAGE_CMD_cpio.gz () {
>>> + =A0 =A0 =A0 touch ${IMAGE_ROOTFS}/init
>>> + =A0 =A0 =A0 cd ${IMAGE_ROOTFS}&& =A0(find . | cpio -o -H newc | gzip =
-c
>>> -9>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz)
>>> +}
>>> =A0IMAGE_CMD_cpio.xz =3D "type cpio>/dev/null; cd ${IMAGE_ROOTFS}&& =A0=
(find . |
>>> cpio -o -H newc | xz -c ${XZ_COMPRESSION_LEVEL}
>>> --check=3D${XZ_INTEGRITY_CHECK}>
>>> =A0${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.xz) ${EXTRA_IMAGECMD}"
>>> =A0IMAGE_CMD_cpio.lzma =3D "type cpio>/dev/null; cd ${IMAGE_ROOTFS}&& =
=A0(find .
>>> | cpio -o -H newc | xz --format=3Dlzma -c ${XZ_COMPRESSION_LEVEL}
>>> --check=3D${XZ_INTEGRITY_CHECK}>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootf=
s.cpio.lzma)
>>> ${EXTRA_IMAGECMD}"
>>>
>>
>> This merged as is to OE-Core.
>>
>> Based on other emails, I will expect some update patch to address Andrea=
's
>> comments.
>>
>> Thanks
>> =A0 =A0 =A0 =A0Sau!
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> hm.. something is going wrong... permission denied
>
>
> touch: cannot touch
> `/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/initramfs-kexe=
cboot-klibc-image-1.0-r0/rootfs/init':
> Permission denied
>
> Andrea

I'd say we have to test for the in-existence of the file instead of
blindly touching it.
Smthg like

if [! -e ${IMAGE_ROOTFS}/init]; then
touch ${IMAGE_ROOTFS}/init
fi


Now, repeating that block for all 4 cpio images is a bit ugly... better ide=
as?


Regards

Andrea


