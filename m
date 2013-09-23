Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 63D6B610DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 14:50:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Sep 2013 07:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,963,1371106800"; d="scan'208";a="405868958"
Received: from vpopa-desktop.rb.intel.com (HELO [10.237.105.58])
	([10.237.105.58])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2013 07:50:28 -0700
Message-ID: <5240556F.4040702@intel.com>
Date: Mon, 23 Sep 2013 17:51:27 +0300
From: Valentin Popa <valentin.popa@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1379597494-870-1-git-send-email-valentin.popa@intel.com>
	<523DE160.9030905@linux.intel.com>
In-Reply-To: <523DE160.9030905@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH_V5] image types: split live into iso and hddimg
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
X-List-Received-Date: Mon, 23 Sep 2013 14:50:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/21/2013 09:11 PM, Saul Wold wrote:
> On 09/19/2013 06:31 AM, Valentin Popa wrote:
>> Changes to split live into iso and hddimg without
>> adding a new image type class.
>> This patch has only a visible effect on HOB and solves
>> part 2 of #3197
>>
>> [YOCTO #3197]
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>> ---
>>   meta/classes/image.bbclass       | 13 ++++++++++++-
>>   meta/classes/image_types.bbclass | 13 +++++++++----
>>   2 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index f1e62f1..bbeb765 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -87,7 +87,18 @@ do_rootfs[depends] += 
>> "makedevs-native:do_populate_sysroot virtual/fakeroot-nati
>>   do_rootfs[depends] += 
>> "virtual/update-alternatives-native:do_populate_sysroot 
>> update-rc.d-native:do_populate_sysroot"
>>   do_rootfs[recrdeptask] += "do_packagedata"
>>
>> -IMAGE_TYPE_live = '${@base_contains("IMAGE_FSTYPES", "live", "live", 
>> "empty", d)}'
>> +def build_live(d):
>> +    if base_contains("IMAGE_FSTYPES", "live", "live", "0", d) == 
>> "0": # live is not set but hob might set iso or hddimg
>> +        d.setVar('NOISO', base_contains('IMAGE_FSTYPES', "iso", "0", 
>> "1", d))
>> +        d.setVar('NOHDD', base_contains('IMAGE_FSTYPES', "hddimg", 
>> "0", "1", d))
>> +        if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) 
>> == "0":
>> +            return "live"
>> +        return "empty"
>> +    return "live"
>> +
>> +IMAGE_TYPE_temp = "${@build_live(d)}"
>> +IMAGE_TYPE_live = "${@base_contains("IMAGE_FSTYPES", "live", "live", 
>> "${IMAGE_TYPE_temp}", d)}"
>> +
> I don't think you need the _temp thing anymore since you have the live 
> check above, is that not correct?

     You are right, but tried to call "build_live" form "base_contains" 
and gave me "ExpansionError during parsing ..."
>
>>   inherit image-${IMAGE_TYPE_live}
>>   IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", 
>> "vmdk", "empty", d)}'
>>   inherit image-${IMAGE_TYPE_vmdk}
>> diff --git a/meta/classes/image_types.bbclass 
>> b/meta/classes/image_types.bbclass
>> index 8c49169..9ead059 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -43,12 +43,17 @@ def get_imagecmds(d):
>>           if "ext3" not in alltypes:
>>               alltypes.append("ext3")
>>           types.remove("vmdk")
>> -    if "live" in types:
>> +    if "live" in types or "iso" in types or "hddimg" in types:
>>           if "ext3" not in types:
>>               types.append("ext3")
>>           if "ext3" not in alltypes:
>>               alltypes.append("ext3")
>> -        types.remove("live")
>> +        if "live" in types:
>> +            types.remove("live")
>> +        if "iso" in types:
>> +            types.remove("iso")
>> +        if "hddimg" in types:
>> +            types.remove("hddimg")
>>
>>       if d.getVar('IMAGE_LINK_NAME', True):
>>           if d.getVar('RM_OLD_IMAGE', True) == "1":
>> @@ -115,7 +120,7 @@ def imagetypes_getdepends(d):
>>       deps = []
>>       ctypes = d.getVar('COMPRESSIONTYPES', True).split()
>>       for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
>> -        if type == "vmdk" or type == "live":
>> +        if type == "vmdk" or type == "live" or type == "iso" or type 
>> == "hddimg":
>>               type = "ext3"
>>           basetype = type
>>           for ctype in ctypes:
>> @@ -230,7 +235,7 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
>>   IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>>
>>   # This variable is available to request which values are suitable 
>> for IMAGE_FSTYPES
>> -IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 
>> ext3.gz ext2.lzma btrfs live squashfs squashfs-xz ubi ubifs tar 
>> tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
>> +IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 
>> ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar 
>> tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
>>
> If live is still a valid type, why remove it from the IMAGE_TYPES list?
>
     Because HOB displays everything that IMAGE_TYPES contains and is 
not ok to have both "live" and "iso & hddimg".
     Indeed this is a problem for the moment (that will be fixed with 
the part 2 of  #3197 : "display only those image types that make sense") 
if the user selects to build only the "iso" , but the machine has "live" 
specified, both "iso" and "hddimg" will be built.

> Sau!
>
>
>>   COMPRESSIONTYPES = "gz bz2 lzma xz"
>>   COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>>


