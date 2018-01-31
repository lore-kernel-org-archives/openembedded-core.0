Return-Path: <california.l.sullivan@intel.com>
X-Greylist: delayed 567 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 Jan 2018 23:03:24 UTC
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 57D54786DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 23:03:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2018 14:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,441,1511856000"; d="scan'208";a="14957933"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga006.jf.intel.com with ESMTP; 31 Jan 2018 14:53:59 -0800
From: Cal Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
References: <20171219221234.21699-1-california.l.sullivan@intel.com>
	<8686fa07-e2a8-1080-e646-7380437e7338@intel.com>
Message-ID: <49611977-aff9-6e13-ab7a-0233208e49b3@intel.com>
Date: Wed, 31 Jan 2018 14:53:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <8686fa07-e2a8-1080-e646-7380437e7338@intel.com>
Subject: Re: [PATCH] core-image-minimal-initramfs: use initramfs-framework for initialization
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
X-List-Received-Date: Wed, 31 Jan 2018 23:03:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.

---
Cal

On 01/09/2018 05:00 PM, Cal Sullivan wrote:
> Anything wrong with this? Haven't seen it hit any mut branches.
>
> Thanks,
> Cal
>
> On 12/19/2017 02:12 PM, California Sullivan wrote:
>> initramfs-framework is more modular and expandable. This change was
>> proposed in commit 28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e
>> "core-image-minimal-initramfs: use initramfs-framework by default" but
>> reverted due to the selftests runqemu.RunqemuTests.test_boot_machine_iso
>> and runqemu.RunqemuTests.test_boot_deploy_hddimg failing. Since then,
>> the kinks have been worked out, and missing functionality that had been
>> missed (non-EFI installation module) has been added.
>>
>> Since the PACKAGE_INSTALL variable was getting so long with all these
>> individual modules getting added, I also introduced a new
>> INITRAMFS_SCRIPTS variable to the core-image-minimal-initramfs recipe.
>> This variable makes the recipe look much cleaner, and also allows easier
>> replacement or additions to the scripts.
>>
>> Fixes [YOCTO #10987].
>>
>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>> ---
>>   meta/recipes-core/images/core-image-minimal-initramfs.bb | 10 
>> +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb 
>> b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> index 5794a25952a..a9ba91bd310 100644
>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> @@ -3,7 +3,15 @@ DESCRIPTION = "Small image capable of booting a 
>> device. The kernel includes \
>>   the Minimal RAM-based Initial Root Filesystem (initramfs), which 
>> finds the \
>>   first 'init' program more efficiently."
>>   -PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install 
>> initramfs-live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev 
>> base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
>> +INITRAMFS_SCRIPTS ?= "\
>> +                      initramfs-framework-base \
>> +                      initramfs-module-setup-live \
>> +                      initramfs-module-udev \
>> +                      initramfs-module-install \
>> +                      initramfs-module-install-efi \
>> +                     "
>> +
>> +PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} 
>> ${VIRTUAL-RUNTIME_base-utils} udev base-passwd 
>> ${ROOTFS_BOOTSTRAP_INSTALL}"
>>     # Do not pollute the initrd image with rootfs features
>>   IMAGE_FEATURES = ""
>


