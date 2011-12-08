Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RYmri-0006sF-QZ
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 23:54:59 +0100
Received: by pbcc11 with SMTP id c11so169260pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 14:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=SaBNXJMKkjLRxGjLqjWhBXzk+EoLbZV5jFhtovs9z9Q=;
	b=BaU+igeRPWoZFPohxNlkE7MIBaBpVtLHuy2oxuq9xZgRH9EQBhFsXGgNJg33r91Tiy
	di9kp7s7x7RMhdXDKO/89FfV63MRQtAvpf4ln/JvweHAxt0YiI9aG35xO/gKkI4fP+8b
	41A5tZsWX5UhRCjgPDt2+QnzC0SfoOdUsJ08s=
MIME-Version: 1.0
Received: by 10.68.211.5 with SMTP id my5mr777241pbc.17.1323384486624; Thu, 08
	Dec 2011 14:48:06 -0800 (PST)
Received: by 10.143.164.4 with HTTP; Thu, 8 Dec 2011 14:48:06 -0800 (PST)
In-Reply-To: <4EE13D86.6020203@emagii.com>
References: <cover.1323212403.git.andrea.adami@gmail.com>
	<68e1fafa3ed455dd26cfbfe2a76b3cbdb5b7bfc2.1323212403.git.andrea.adami@gmail.com>
	<CA+M6bXmdt7UE+-HkLva9snnv=AJhhh0sxKSKCJhQOb58bNKGJQ@mail.gmail.com>
	<20111208151026.GC3761@jama.jama.net>
	<CAAQYJAuHVLo6A_cGXBVoq+3Tj863LRH+hu-6GtZeqo3_aJWYQA@mail.gmail.com>
	<4EE13D86.6020203@emagii.com>
Date: Thu, 8 Dec 2011 23:48:06 +0100
Message-ID: <CAAQYJAtRf4t6v5cKVgMzJFq6kHkz-+xno_HW=O9Rjey1FTPB7w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 08 Dec 2011 22:54:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2011 at 11:43 PM, Ulf Samuelsson
<openembedded-core@emagii.com> wrote:
> On 2011-12-08 22:30, Andrea Adami wrote:
>>
>> On Thu, Dec 8, 2011 at 4:10 PM, Martin Jansa<martin.jansa@gmail.com>
>> =A0wrote:
>>>
>>> On Thu, Dec 08, 2011 at 07:57:52AM -0700, Tom Rini wrote:
>>>>
>>>> On Tue, Dec 6, 2011 at 4:23 PM, Andrea Adami<andrea.adami@gmail.com>
>>>> =A0wrote:
>>>>>
>>>>> * Building the jffs2 filesystem to include summary information speeds
>>>>> up
>>>>> * the mount process considerably at the cost of increased size.
>>>>> * The rate of speedup is generally higher on NAND chips and on the
>>>>> chips
>>>>> * where the erase block size is large.
>>>>>
>>>>> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
>>>
>>> I'll repeat my comment from yesterday, but IMHO it would be easier to
>>> see the difference between those 2 images if the IMAGE_CMD_jffs2 output
>>> is
>>> renamed to .jffs2.nosummary and IMAGE_CMD_sum.jffs2 (or renamed
>>> IMAGE_CMD_jffs2.summary)
>>> produces .jffs2.summary (or even just .jffs2 if we can agree that
>>> .summary is
>>> what enduser wants by default)
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
>>
> Not sure exactly what sumtools does,
> but as I understood it, it does things which
> the targets need to be doing at first startup otherwise.

No, this operation cannot be done runtime.

http://www.embedded-linux.co.uk/tutorial/jffs2-summary

"
The tools that does that, mkfs.jffs2, does not do anything about
summary nodes, or to put it another way, by default you will end up
with an image that takes a long time to mount. The secret is that you
have to use a second tool from mtdutils: sumtool.
"

Regards

Andrea

>
> Does that not mean that the target rootfs will grow
> from 44 MB to 57 MB during that process?
>
> If it does, you never want to have the non-sumtool version.
> (I guess if you downloaded the file over a 20 bps channel to
> a nuclear submarine, you would disagree)
>
> BR
> Ulf
>
>
>
>
>
>> Cheers
>>
>> Andrea
>>
>>> But other than that it looks fine and will make my IMAGE_DEPENDS_jffs2 =
a
>>> bit shorter.
>>>
>>> Regards,
>>>
>>>> Acked-by: Tom Rini<tom.rini@gmail.com>
>>>>
>>>>> ---
>>>>> =A0meta/classes/image_types.bbclass | =A0 =A05 ++++-
>>>>> =A01 files changed, 4 insertions(+), 1 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/image_types.bbclass
>>>>> b/meta/classes/image_types.bbclass
>>>>> index 29b6380..bd4b7bc 100644
>>>>> --- a/meta/classes/image_types.bbclass
>>>>> +++ b/meta/classes/image_types.bbclass
>>>>> @@ -35,6 +35,8 @@ XZ_COMPRESSION_LEVEL ?=3D "-e -9"
>>>>> =A0XZ_INTEGRITY_CHECK ?=3D "crc32"
>>>>>
>>>>> =A0IMAGE_CMD_jffs2 =3D "mkfs.jffs2 --root=3D${IMAGE_ROOTFS} --faketim=
e
>>>>> --output=3D${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMA=
GECMD}"
>>>>> +IMAGE_CMD_sum.jffs2 =3D "${IMAGE_CMD_jffs2}&& =A0sumtool -i
>>>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
>>>>> + =A0 =A0 =A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2
>>>>> ${EXTRA_IMAGECMD}"
>>>>>
>>>>> =A0IMAGE_CMD_cramfs =3D "mkcramfs ${IMAGE_ROOTFS}
>>>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>>>>>
>>>>> @@ -138,6 +140,7 @@ EXTRA_IMAGECMD_btrfs ?=3D ""
>>>>>
>>>>> =A0IMAGE_DEPENDS =3D ""
>>>>> =A0IMAGE_DEPENDS_jffs2 =3D "mtd-utils-native"
>>>>> +IMAGE_DEPENDS_sum.jffs2 =3D "mtd-utils-native"
>>>>> =A0IMAGE_DEPENDS_cramfs =3D "cramfs-native"
>>>>> =A0IMAGE_DEPENDS_ext2 =3D "genext2fs-native"
>>>>> =A0IMAGE_DEPENDS_ext2.gz =3D "genext2fs-native"
>>>>> @@ -157,4 +160,4 @@ IMAGE_DEPENDS_ubi =3D "mtd-utils-native"
>>>>> =A0IMAGE_DEPENDS_ubifs =3D "mtd-utils-native"
>>>>>
>>>>> =A0# This variable is available to request which values are suitable =
for
>>>>> IMAGE_FSTYPES
>>>>> -IMAGE_TYPES =3D "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz
>>>>> ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz c=
pio
>>>>> cpio.gz cpio.xz cpio.lzma"
>>>>> +IMAGE_TYPES =3D "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3
>>>>> ext3.gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 =
tar.xz
>>>>> cpio cpio.gz cpio.xz cpio.lzma"
>>>>> --
>>>>> 1.7.3.4
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>>
>>>> --
>>>> Tom
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>> --
>>> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> Best Regards
> Ulf Samuelsson
> eMagii
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


