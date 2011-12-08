Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded-core@emagii.com>) id 1RYmnr-0006mN-NR
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 23:50:59 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 4BABCE564
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 23:44:09 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AnIcAOQ84U5T4zgTPGdsb2JhbAAMN6sCAQEBATeCJAEBAQECAQEBATU2CgYLCxgJFg8JAwIBAgEPBgEbFAYNBgIBAYgDCLdYizsEkkeCJIkWgVOHPg
X-IronPort-AV: E=Sophos;i="4.71,322,1320620400"; d="scan'208";a="233686046"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.56.19])
	by ipb1.telenor.se with ESMTP; 08 Dec 2011 23:43:19 +0100
Message-ID: <4EE13D86.6020203@emagii.com>
Date: Thu, 08 Dec 2011 23:43:18 +0100
From: Ulf Samuelsson <openembedded-core@emagii.com>
Organization: eMagii
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323212403.git.andrea.adami@gmail.com>	<68e1fafa3ed455dd26cfbfe2a76b3cbdb5b7bfc2.1323212403.git.andrea.adami@gmail.com>	<CA+M6bXmdt7UE+-HkLva9snnv=AJhhh0sxKSKCJhQOb58bNKGJQ@mail.gmail.com>	<20111208151026.GC3761@jama.jama.net>
	<CAAQYJAuHVLo6A_cGXBVoq+3Tj863LRH+hu-6GtZeqo3_aJWYQA@mail.gmail.com>
In-Reply-To: <CAAQYJAuHVLo6A_cGXBVoq+3Tj863LRH+hu-6GtZeqo3_aJWYQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] image_types.bbclass: implement jffs2 summary images (sum.jffs2)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ulf@emagii.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 08 Dec 2011 22:50:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-12-08 22:30, Andrea Adami wrote:
> On Thu, Dec 8, 2011 at 4:10 PM, Martin Jansa<martin.jansa@gmail.com>  wrote:
>> On Thu, Dec 08, 2011 at 07:57:52AM -0700, Tom Rini wrote:
>>> On Tue, Dec 6, 2011 at 4:23 PM, Andrea Adami<andrea.adami@gmail.com>  wrote:
>>>> * Building the jffs2 filesystem to include summary information speeds up
>>>> * the mount process considerably at the cost of increased size.
>>>> * The rate of speedup is generally higher on NAND chips and on the chips
>>>> * where the erase block size is large.
>>>>
>>>> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
>> I'll repeat my comment from yesterday, but IMHO it would be easier to
>> see the difference between those 2 images if the IMAGE_CMD_jffs2 output is
>> renamed to .jffs2.nosummary and IMAGE_CMD_sum.jffs2 (or renamed IMAGE_CMD_jffs2.summary)
>> produces .jffs2.summary (or even just .jffs2 if we can agree that .summary is
>> what enduser wants by default)
> I tried to keep the patch not too invasive and did not introduce a
> special EXTRA string for sumtool.
> The most widely used options (-p -l -e) are common, though.
>
> Unfortunately summary means we have a bigger image:
> 44M Dec  8 16:14 core-image-sato-c7x0-20111208151047.rootfs.jffs2
> 57M Dec  8 16:14 core-image-sato-c7x0-20111208151047.rootfs.sum.jffs2
>
> Being some devices have strict size requirements I think it is better
> to build both kind of images.
>
Not sure exactly what sumtools does,
but as I understood it, it does things which
the targets need to be doing at first startup otherwise.

Does that not mean that the target rootfs will grow
from 44 MB to 57 MB during that process?

If it does, you never want to have the non-sumtool version.
(I guess if you downloaded the file over a 20 bps channel to
a nuclear submarine, you would disagree)

BR
Ulf




> Cheers
>
> Andrea
>
>> But other than that it looks fine and will make my IMAGE_DEPENDS_jffs2 a
>> bit shorter.
>>
>> Regards,
>>
>>> Acked-by: Tom Rini<tom.rini@gmail.com>
>>>
>>>> ---
>>>>   meta/classes/image_types.bbclass |    5 ++++-
>>>>   1 files changed, 4 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>>>> index 29b6380..bd4b7bc 100644
>>>> --- a/meta/classes/image_types.bbclass
>>>> +++ b/meta/classes/image_types.bbclass
>>>> @@ -35,6 +35,8 @@ XZ_COMPRESSION_LEVEL ?= "-e -9"
>>>>   XZ_INTEGRITY_CHECK ?= "crc32"
>>>>
>>>>   IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 ${EXTRA_IMAGECMD}"
>>>> +IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2}&&  sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
>>>> +       -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.sum.jffs2 ${EXTRA_IMAGECMD}"
>>>>
>>>>   IMAGE_CMD_cramfs = "mkcramfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cramfs ${EXTRA_IMAGECMD}"
>>>>
>>>> @@ -138,6 +140,7 @@ EXTRA_IMAGECMD_btrfs ?= ""
>>>>
>>>>   IMAGE_DEPENDS = ""
>>>>   IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
>>>> +IMAGE_DEPENDS_sum.jffs2 = "mtd-utils-native"
>>>>   IMAGE_DEPENDS_cramfs = "cramfs-native"
>>>>   IMAGE_DEPENDS_ext2 = "genext2fs-native"
>>>>   IMAGE_DEPENDS_ext2.gz = "genext2fs-native"
>>>> @@ -157,4 +160,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
>>>>   IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>>>>
>>>>   # This variable is available to request which values are suitable for IMAGE_FSTYPES
>>>> -IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
>>>> +IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma live squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
>>>> --
>>>> 1.7.3.4
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
>>> --
>>> Tom
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Best Regards
Ulf Samuelsson
eMagii



