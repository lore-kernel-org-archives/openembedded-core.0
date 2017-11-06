Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4EE078435
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 16:54:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA6GsCPD029456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Nov 2017 08:54:12 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 6 Nov 2017 08:54:12 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
	<d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <f7c3b1e5-b5d1-37e3-0a19-24dfd2cab276@windriver.com>
Date: Mon, 6 Nov 2017 10:54:11 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
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
X-List-Received-Date: Mon, 06 Nov 2017 16:54:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/6/17 10:00 AM, Alexander Kanavin wrote:
> On 11/03/2017 07:58 PM, Mark Hatle wrote:
>>> Unfortunately, this also breaks grub and grub-efi:
>>>
>>> x86_64-poky-linux-musl-objcopy:
>>> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_aranges):
>>> relocation 1 has invalid symbol index 2053731167
>>> x86_64-poky-linux-musl-objcopy:
>>> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module:
>>> invalid relocation type 69
>>> x86_64-poky-linux-musl-objcopy: BFD (GNU Binutils) 2.29.0.20170912
>>> assertion fail ../../bfd/elf64-x86-64.c:351
>>> x86_64-poky-linux-musl-objcopy:
>>> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_info):
>>> relocation 0 has invalid symbol index 1634754402
>>>
>>
>> Look at debugedit.  This is the program used to adjust some of the debug references.
> 
> Thanks, this is the offending commit:
> 
> https://github.com/rpm-software-management/rpm/commit/88989572fff1f31e0c4f972a6895585e4742ef4b
> 
> Looks like they added sophisticated in-place processing/rewriting of the 
> actual binary (that is not possible to switch off). And it fails in case 
> of grub modules.
> 
> We, on the other hand, only need to extract the list of debug source 
> code files. Any hint on how to do that without the use of rpm/debugedit? 
> Perhaps something from binutils/elfutils?

You would need to interpret the dwarf symbols and find all of the referenced
files.  I can certainly be done with the libelf (libdwarf?), but I don't know if
it can be done with binutils or elfutils directly.  They may not have the
necessary translation to be able to assembly the pieces.

(A lot of the filenames are listed related to a directory.. and the entries are
stored in different places and have to be assembled to get a similar output to
what debugedit gave us.)

Writing a small standalone tool to give us this information may be very useful
to us though -- and would let us break the 'rpm' dependency for deb/ipkg
builds.. (probably)

--Mark

> Alex
> 


