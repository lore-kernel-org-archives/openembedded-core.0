Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6952D6D181
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 21:38:25 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so1707795lbj.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 14:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BvDFhR0jEFNsK+2Gqi7uARgGqAPifXHmF2kBUJvTmYA=;
	b=UYF1H/+zd70vvA/d/vldXOpn+PHEYMwR+3IDq8i/+yHMaFfIzzp4FAHfm3boo3u5jX
	6oDq0kpNo2T19BzBUIwNZ3UTfXhPCZNmrTdKNClVxb5gLTKcvn+mQHCTIitNgAr9hItW
	oHzwlFw/fb7fKVhzQ8FC0Fqi17odm2O6H99UMnK7OZBOgz3fdJIWPyCt+FAcAKARu3YM
	1XYBiw6BlttgUZb228c2UfNvuONJ6gnvUcgPr1SwfUBgs2n6k0goO+LBiXWJEvtyLoma
	uQfG8lStMbZY4GvOyQp1N4jluzYJh69+ZXReTJxW/6yqMsHb6/qy8JAjFlcOIANqB04p
	s9hQ==
MIME-Version: 1.0
X-Received: by 10.152.26.72 with SMTP id j8mr4572926lag.19.1383169106406; Wed,
	30 Oct 2013 14:38:26 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Wed, 30 Oct 2013 14:38:26 -0700 (PDT)
In-Reply-To: <1383060808.25877.12.camel@ted>
References: <cover.1382307169.git.andrea.adami@gmail.com>
	<5739f47649bfb50369107ca603b747b4201c70b0.1382307169.git.andrea.adami@gmail.com>
	<1383044469.17867.8.camel@ted>
	<CAAQYJAtEhOD4KCxuS17hRhdnb49NeKmXLzRL0ah2Sfv59LpsOw@mail.gmail.com>
	<1383047127.25877.4.camel@ted>
	<CAAQYJAs91R1qH8nvTGG_rSUg_JYcZq-sZgX23tHteyqWfBF4iQ@mail.gmail.com>
	<1383060808.25877.12.camel@ted>
Date: Wed, 30 Oct 2013 22:38:26 +0100
Message-ID: <CAAQYJAvGrkaOez=G9PpTnvzjGHEGMqZso=M0Y1fJf7EsxvcNtg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 30 Oct 2013 21:38:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 29, 2013 at 4:33 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-10-29 at 13:17 +0100, Andrea Adami wrote:
>> On Tue, Oct 29, 2013 at 12:45 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Tue, 2013-10-29 at 12:17 +0100, Andrea Adami wrote:
>> >> On Tue, Oct 29, 2013 at 12:01 PM, Richard Purdie
>> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> > On Mon, 2013-10-21 at 00:34 +0200, Andrea Adami wrote:
>> >> >> When overriding EXTRA_IMAGE_CMD_jffs2 = "--pad=foo ..."
>> >> >> we are passing a malformed option to sumtool:
>> >> >>
>> >> >> sumtool: option '--pad' doesn't allow an argument
>> >> >>
>> >> >> Fix this by declaring a separate variable for the purpose.
>> >> >>
>> >> >> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> >> >> ---
>> >> >>  meta/classes/image_types.bbclass | 5 +++--
>> >> >>  1 file changed, 3 insertions(+), 2 deletions(-)
>> >> >>
>> >> >> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> >> >> index b8779e0..21391e8 100644
>> >> >> --- a/meta/classes/image_types.bbclass
>> >> >> +++ b/meta/classes/image_types.bbclass
>> >> >> @@ -141,8 +141,8 @@ XZ_INTEGRITY_CHECK ?= "crc32"
>> >> >>  XZ_THREADS ?= "-T 0"
>> >> >>
>> >> >>  IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
>> >> >> -IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
>> >> >> -     -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
>> >> >> +IMAGE_CMD_sum.jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD_jffs2} \
>> >> >> +     && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
>> >> >>
>> >> >>  IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>> >> >>
>> >> >> @@ -212,6 +212,7 @@ inherit siteinfo
>> >> >>  JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
>> >> >>  JFFS2_ERASEBLOCK ?= "0x40000"
>> >> >>  EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
>> >> >> +EXTRA_IMAGECMD_sum.jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
>> >> >>
>> >> >>  # Change these if you want default mkfs behavior (i.e. create minimal inode number)
>> >> >>  EXTRA_IMAGECMD_ext2 ?= "-i 8192"
>> >> >
>> >> > This patch is very confused. You say sumtool doesn't take a --pad
>> >> > option, yet "EXTRA_IMAGECMD_sum.jffs" which is presumably used with
>> >> > sumtool does have the option.
>> >> >
>> >>
>> >> After the commits you've done the creation of sum.jffs2 images is
>> >> broken on collie.
>> >> The error message is described clearly in the patch:
>> >>
>> >> sumtool: option '--pad' doesn't allow an argument
>> >>
>> >> Why that? Because collie needs to customize the padding.
>> >> EXTRA_IMAGECMD_jffs2 = "--pad=14680064 -l -e ${JFFS2_ERASEBLOCK}"
>> >>
>> >> This --pad=14680064 is then passed to IMAGE_CMD_sum.jffs2 and we get
>> >> build error.
>> >>
>> >> That's why we need to redefine both IMAGE_CMD_sum.jffs2 and
>> >> EXTRA_IMAGECMD_sum.jffs2 so to pass --pad=XY only to mkfs.jffs2 and
>> >> not to the sumtool part of IMAGE_CMD_sum.jffs2.
>> >>
>> >> ---
>> >> By the way this sum.jffs2 imagetype is used only in meta-handheld afaik.
>> >> It would be also ok if you'd remove IMAGE_CMD_sum.jffs2 so we can
>> >> append the whole stuff in a customized EXTRA_IMAGECMD_jffs2.
>> >
>> > I understand your problem however:
>> >
>> > a) Copy and pasting the entire IMAGE_CMD_jffs2 command into the second
>> > one is rather ugly.
>> Yes, but using the IMAGE_CMD_jffs2 we incorporate the
>> EXTRA_IMAGECMD_jffs2 = "--pad=xyz.."
>>
>> > b) You still end up passing "--pad ${JFFS2_ENDIANNESS} --eraseblock=
>> > ${JFFS2_ERASEBLOCK} --no-cleanmarkers" as parameters to sumtool,
>> > including a --pad option with no argument. Why/how?
>>
>> Because this padding is limited to the last eraseblock.
>> " -p, --pad                 Pad the OUTPUT with 0xFF to the end of the
>> final eraseblock"
>>
>> >
>> > You call:
>> >
>> > sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}
>> >
>> > and EXTRA_IMAGECMD is set to EXTRA_IMAGECMD_sum.jffs2 due to the use of
>> > overrides in the image generation code.
>>
>> We cannot reuse IMAGE_CMD_jffs2 because in that case
>> EXTRA_IMAGECMD_jffs2 is already evaluated and this contains the
>> infamous --pad==xy.
>>
>> >
>> > So whilst collie is broken, I do not think this patch makes readable
>> > code and I think we need to find something better.
>> >
>> > The thing I'm confused on is whether there should be any --pad option to
>> > sumtool or not.
>> >
>>
>> Yes, but without <size> argument
>>
>> http://git.infradead.org/mtd-utils.git/blob/HEAD:/sumtool.c
>
> Ok, we need to make this clearer in the commit message. Looking and
> thinking about this further, how about we add some dependency ordering
> into this code, something like the patch below. This moves the jffs2
> call into its own true namespace. You should then just be able to
> explicitly set EXTRA_IMGAGECMD_sum.jffs2 to the value you need (yet
> still have EXTRA_IMGAGECMD_jffs2 able to take a different value).
>
> See if you can build something on top of the patch below...
>
> Cheers,
>
> Richard
>
>
>
>
> From 4ff883824221ce5f1b993239249b1ce1e3ab9b32 Mon Sep 17 00:00:00 2001
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date: Tue, 29 Oct 2013 15:26:54 +0000
> Subject: image_types: Improve dependency handling between types (and use for sum.jffs2)
>
> We're seeing a pattern of one image type needing to depend on another
> type. A good example is jffs2 and sum.jffs2. This patch makes sum.jffs2
> depend on jffs2 which will then allow a EXTRA_IMGAGECMD to be set for
> sum.jffs2 individually without changing the jffs2 command. This allows the
> -pad option to be configured differently.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index b8779e0..5ce1ddb 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -7,14 +7,20 @@ def get_imagecmds(d):
>      ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>      cimages = {}
>
> +    # Image type b depends on a having been generated first
> +    def addtypedepends(a, b):
> +        if a in alltypes:
> +            alltypes.remove(a):
> +            if b not in alltypes:
> +                alltypes.append(b)
> +            alltypes.append(a)
> +
>      # The elf image depends on the cpio.gz image already having
>      # been created, so we add that explicit ordering here.
> +    addtypedepends("elf", "cpio.gz")
>
> -    if "elf" in alltypes:
> -        alltypes.remove("elf")
> -        if "cpio.gz" not in alltypes:
> -                alltypes.append("cpio.gz")
> -        alltypes.append("elf")
> +    # jffs2 sumtool'd images need jffs2
> +    addtypedepends("sum.jffs2", "jffs2")
>
>      # Filter out all the compressed images from alltypes
>      for type in alltypes:
> @@ -141,8 +147,7 @@ XZ_INTEGRITY_CHECK ?= "crc32"
>  XZ_THREADS ?= "-T 0"
>
>  IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
> -IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
> -       -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
> +IMAGE_CMD_sum.jffs2 = "sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
>
>  IMAGE_CMD_cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>
>
>
>

Richard,

your proposed solution does work as expected and I'm able to set in
the specific case (collie.conf):

EXTRA_IMAGECMD_jffs2 = "--pad=14680064 -l -e ${JFFS2_ERASEBLOCK}"
EXTRA_IMAGECMD_sum.jffs2 = "-p -l -e ${JFFS2_ERASEBLOCK}"

The run.do_rootfs shows the correct commands are used:

mkfs.jffs2 --root=/oe/oe-core/build/tmp-eglibc/work/collie-oe-linux-gnueabi/core-image-base/1.0-r0/rootfs
--faketime --output=/oe/oe-core/build/tmp-eglibc/deploy/images/collie/core-image-base-collie-20131030212928.rootfs.jffs2
--pad=14680064 -l -e 0x20000

sumtool -i /oe/oe-core/build/tmp-eglibc/deploy/images/collie/core-image-base-collie-20131030212928.rootfs.jffs2
-o /oe/oe-core/build/tmp-eglibc/deploy/images/collie/core-image-base-collie-20131030212928.rootfs.sum.jffs2
-p -l -e 0x20000

Thanks

Andrea

Acked-by: Andrea Adami <andrea.adami@gmail.com>

