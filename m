Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C6A2673DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 14:24:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Aug 2015 07:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,746,1432623600"; d="scan'208";a="790619243"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.168])
	([10.219.5.168])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2015 07:24:31 -0700
Message-ID: <55DC7AE3.8090603@linux.intel.com>
Date: Tue, 25 Aug 2015 09:25:39 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: benjamin.esquivel@linux.intel.com, 
	openembedded-core@lists.openembedded.org, georgex.l.musat@intel.com
References: <1438614064-10290-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<1440187353.6529.24.camel@linux.intel.com>
In-Reply-To: <1440187353.6529.24.camel@linux.intel.com>
Subject: Re: [PATCH] init-install-efi.sh: Avoid /mnt/mtab creation if already present
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
X-List-Received-Date: Tue, 25 Aug 2015 14:24:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Tests were done in the same manner as described in the bugzilla 
(core-image-sato-sdk image and genericx86-64 machine). In my case, the 
only HW I tested was the minnowboard. The testing consists of booting a 
live image and installing the image. After this patch, installation went 
fine.


On 08/21/2015 03:02 PM, Benjamin Esquivel wrote:
> Hi Leo, this fix looks good to me, can you mention how did you test
> this?
>
> On Mon, 2015-08-03 at 15:01 +0000,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> The base-files recipe installs /mnt/mtab (it is a softlink of
>> /proc/mounts),
>> so if an image includes the latter, there is no new to created it
>> again inside
>> the install-efi.sh script, otherwise an error may occur as indicated
>> on the
>> bug's site.
>>
>> [YOCTO #7971]
>>
>> Signed-off-by: Leonardo Sandoval <
>> leonardo.sandoval.gonzalez@linux.intel.com>
>> ---
>>   meta/recipes-core/initrdscripts/files/init-install-efi.sh | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/initrdscripts/files/init-install
>> -efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>> index f339b30..665d04a 100644
>> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>> @@ -109,7 +109,11 @@ rm -f /etc/udev/scripts/mount*
>>   umount ${device}* 2> /dev/null || /bin/true
>>
>>   mkdir -p /tmp
>> -cat /proc/mounts > /etc/mtab
>> +
>> +# Create /etc/mtab if not present
>> +if [ ! -e /etc/mtab ]; then
>> +    cat /proc/mounts > /etc/mtab
>> +fi
>>
>>   disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" "
>> -f 3 | sed -e "s/MB//")
>>
>> --
>> 1.8.4.5
>>

