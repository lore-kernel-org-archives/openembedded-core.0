Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8F26B78436
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 16:01:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2017 08:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,353,1505804400"; d="scan'208";a="1240354873"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2017 08:00:48 -0800
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
Date: Mon, 6 Nov 2017 18:00:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Mon, 06 Nov 2017 16:01:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/03/2017 07:58 PM, Mark Hatle wrote:
>> Unfortunately, this also breaks grub and grub-efi:
>>
>> x86_64-poky-linux-musl-objcopy:
>> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_aranges):
>> relocation 1 has invalid symbol index 2053731167
>> x86_64-poky-linux-musl-objcopy:
>> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module:
>> invalid relocation type 69
>> x86_64-poky-linux-musl-objcopy: BFD (GNU Binutils) 2.29.0.20170912
>> assertion fail ../../bfd/elf64-x86-64.c:351
>> x86_64-poky-linux-musl-objcopy:
>> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_info):
>> relocation 0 has invalid symbol index 1634754402
>>
> 
> Look at debugedit.  This is the program used to adjust some of the debug references.

Thanks, this is the offending commit:

https://github.com/rpm-software-management/rpm/commit/88989572fff1f31e0c4f972a6895585e4742ef4b

Looks like they added sophisticated in-place processing/rewriting of the 
actual binary (that is not possible to switch off). And it fails in case 
of grub modules.

We, on the other hand, only need to extract the list of debug source 
code files. Any hint on how to do that without the use of rpm/debugedit? 
Perhaps something from binutils/elfutils?

Alex

