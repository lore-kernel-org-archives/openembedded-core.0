Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 163726CC53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 11:16:59 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id hp15so6198011lab.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 04:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zHvJbl8WmT86HoFhU0FbeOa7g5jVhuDJBe7Vjs8RSgM=;
	b=q+R20alUygbaAykJTw7xYWKQX2mJ2EPoBiXVfJxV9aDeTxl0bF0xo/zxrQvFoBY5Kt
	kIGPhRk94ZG6bHFisBTySDspxGnoDAORRR0zFzjS8max82rQgiyISH5R7zUYcrlcw+D9
	JtMNx0+E6+Vl/G2j6KshVPtFmOqChzqdVeBJ+RrMWf/97WBfIaEpFVWA2u49UYj+yJok
	B9a8PONRTFrmW6fbwK6mh8hGGOFzWhDv9s822sB3kpNFaGyzXbOBAam6pK1UOzBPpuXD
	4xwE0hFeelKvwnCzf16JlHYo5BC6xzqsGfvqXz0KAK86Y0am/vpg3ByHVTZJxCBPztgt
	RpJw==
MIME-Version: 1.0
X-Received: by 10.152.4.38 with SMTP id h6mr18430844lah.12.1383045420992; Tue,
	29 Oct 2013 04:17:00 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Tue, 29 Oct 2013 04:17:00 -0700 (PDT)
In-Reply-To: <1383044469.17867.8.camel@ted>
References: <cover.1382307169.git.andrea.adami@gmail.com>
	<5739f47649bfb50369107ca603b747b4201c70b0.1382307169.git.andrea.adami@gmail.com>
	<1383044469.17867.8.camel@ted>
Date: Tue, 29 Oct 2013 12:17:00 +0100
Message-ID: <CAAQYJAtEhOD4KCxuS17hRhdnb49NeKmXLzRL0ah2Sfv59LpsOw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] image_types.bbclass: fix EXTRA_IMAGECMD_sum.jffs2
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
X-List-Received-Date: Tue, 29 Oct 2013 11:17:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 29, 2013 at 12:01 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-10-21 at 00:34 +0200, Andrea Adami wrote:
>> When overriding EXTRA_IMAGE_CMD_jffs2 = "--pad=foo ..."
>> we are passing a malformed option to sumtool:
>>
>> sumtool: option '--pad' doesn't allow an argument
>>
>> Fix this by declaring a separate variable for the purpose.
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>>  meta/classes/image_types.bbclass | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index b8779e0..21391e8 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -141,8 +141,8 @@ XZ_INTEGRITY_CHECK ?= "crc32"
>>  XZ_THREADS ?= "-T 0"
>>
>>  IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
>> -IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
>> -     -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
>> +IMAGE_CMD_sum.jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD_jffs2} \
>> +     && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
>>
>>  IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>>
>> @@ -212,6 +212,7 @@ inherit siteinfo
>>  JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
>>  JFFS2_ERASEBLOCK ?= "0x40000"
>>  EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
>> +EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
>>
>>  # Change these if you want default mkfs behavior (i.e. create minimal inode number)
>>  EXTRA_IMAGECMD_ext2 ?= "-i 8192"
>
> This patch is very confused. You say sumtool doesn't take a --pad
> option, yet "EXTRA_IMAGECMD_sum.jffs" which is presumably used with
> sumtool does have the option.
>

After the commits you've done the creation of sum.jffs2 images is
broken on collie.
The error message is described clearly in the patch:

sumtool: option '--pad' doesn't allow an argument

Why that? Because collie needs to customize the padding.
EXTRA_IMAGECMD_jffs2 = "--pad=14680064 -l -e ${JFFS2_ERASEBLOCK}"

This --pad=14680064 is then passed to IMAGE_CMD_sum.jffs2 and we get
build error.

That's why we need to redefine both IMAGE_CMD_sum.jffs2 and
EXTRA_IMAGECMD_sum.jffs2 so to pass --pad=XY only to mkfs.jffs2 and
not to the sumtool part of IMAGE_CMD_sum.jffs2.

---
By the way this sum.jffs2 imagetype is used only in meta-handheld afaik.
It would be also ok if you'd remove IMAGE_CMD_sum.jffs2 so we can
append the whole stuff in a customized EXTRA_IMAGECMD_jffs2.

Interestingly the sum.jffs2 ican not be padded to a desired size and
that could cause some issues flashing over older jffs partitions
(happened on collie flashing on top of previous jffs format).

In the case of modern devices with NAND there is a clear benefit.

Regards

Andrea

> We need to make this clearer and I don't think this patch does that, I'm
> not even sure it works...
>
> Cheers,
>
> Richard
>

