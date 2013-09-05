Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A7924615B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 00:38:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2013 17:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,843,1371106800"; d="scan'208";a="398416030"
Received: from unknown (HELO [10.255.14.205]) ([10.255.14.205])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2013 17:38:27 -0700
Message-ID: <5227D283.6050606@linux.intel.com>
Date: Wed, 04 Sep 2013 17:38:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
References: <1378310230-20253-1-git-send-email-valentin.popa@intel.com>
	<52275B82.4040309@linux.intel.com>
In-Reply-To: <52275B82.4040309@linux.intel.com>
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH_V2] HOB: split live into iso and hddimg
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
X-List-Received-Date: Thu, 05 Sep 2013 00:38:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Also the patch summary does not conform to your style, it should be 
image*: split live into iso and hddimg for hob

tells us more that it's the image code, not hob code.

See additional comment below.

On 09/04/2013 09:10 AM, Saul Wold wrote:
> On 09/04/2013 08:57 AM, Valentin Popa wrote:
>> changes to split live into iso and hddimg without
>> adding a new image type class.
>>
>
> Will there be corresponding patches for the places that IMAGE_FSTYPES
> use the "live" type?
>
> There may also be some doc's changes that are needed.
>
> Sau!
>
>> [YOCTO #3197]
>> ---
>>   meta/classes/image.bbclass       | 11 ++++++++++-
>>   meta/classes/image_types.bbclass | 11 +++++++----
>>   2 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index ea59c36..3f76d80 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -87,7 +87,16 @@ do_rootfs[depends] +=
>> "makedevs-native:do_populate_sysroot virtual/fakeroot-nati
>>   do_rootfs[depends] +=
>> "virtual/update-alternatives-native:do_populate_sysroot
>> update-rc.d-native:do_populate_sysroot"
>>   do_rootfs[recrdeptask] += "do_packagedata"
>>
>> -IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live",
>> "empty", d)}'
>> +NOISO = '${@base_contains("IMAGE_FSTYPES", "iso", "0", "1", d)}'
>> +NOHDD = '${@base_contains("IMAGE_FSTYPES", "hddimg", "0", "1", d)}'
>> +
>> +def build_live(d):
>> +    if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
>> +        return "live"
>> +    else:
>> +        return "empty"
>> +
I think RP suggested a way to simplify this code.

Sau!

>> +IMAGE_TYPE_live = '${@build_live(d)}'
>>   inherit image-${IMAGE_TYPE_live}
>>   IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "vmdk",
>> "empty", d)}'
>>   inherit image-${IMAGE_TYPE_vmdk}
>> diff --git a/meta/classes/image_types.bbclass
>> b/meta/classes/image_types.bbclass
>> index c168ed5..6af6499 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -43,12 +43,15 @@ def get_imagecmds(d):
>>           if "ext3" not in alltypes:
>>               alltypes.append("ext3")
>>           types.remove("vmdk")
>> -    if "live" in types:
>> +    if "iso" in types or "hddimg" in types:
>>           if "ext3" not in types:
>>               types.append("ext3")
>>           if "ext3" not in alltypes:
>>               alltypes.append("ext3")
>> -        types.remove("live")
>> +        if "iso" in types:
>> +            types.remove("iso")
>> +        if "hddimg" in types:
>> +            types.remove("hddimg")
>>
>>       if d.getVar('IMAGE_LINK_NAME', True):
>>           if d.getVar('RM_OLD_IMAGE', True) == "1":
>> @@ -115,7 +118,7 @@ def imagetypes_getdepends(d):
>>       deps = []
>>       ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>>       for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
>> -        if type == "vmdk" or type == "live":
>> +        if type == "vmdk" or type == "iso" or type == "hddimg":
>>               type = "ext3"
>>           basetype = type
>>           for ctype in ctypes:
>> @@ -230,7 +233,7 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
>>   IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>>
>>   # This variable is available to request which values are suitable
>> for IMAGE_FSTYPES
>> -IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3
>> ext3.gz ext2.lzma btrfs live squashfs squashfs-xz ubi ubifs tar tar.gz
>> tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
>> +IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3
>> ext3.gz ext2.lzma btrfs squashfs squashfs-xz ubi ubifs tar tar.gz
>> tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf iso hddimg"
>>
>>   COMPRESSIONTYPES = "gz bz2 lzma xz"
>>   COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

