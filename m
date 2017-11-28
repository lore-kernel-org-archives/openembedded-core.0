Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91E3E7807D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 12:49:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vASCnmF1012051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 28 Nov 2017 04:49:48 -0800
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 28 Nov 2017 04:49:35 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
	<45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
	<1511432407.862.111.camel@linuxfoundation.org>
	<90368c50-316e-b03e-252f-33110c059737@windriver.com>
	<bfe14ba9-7de8-6e8d-9d26-2fd05a4e62a2@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6a03b501-31d9-5e20-4c40-ce381bb4ad17@windriver.com>
Date: Tue, 28 Nov 2017 20:48:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <bfe14ba9-7de8-6e8d-9d26-2fd05a4e62a2@windriver.com>
Cc: openembedded-core@lists.openembedded.org, "Xu, Chi" <Chi.Xu@windriver.com>,
	"WOLD, SAUL" <saul.wold@intel.com>
Subject: =?UTF-8?B?R29vZCBuZXdzIFJlOiBZb2N0byBQcm9qZWN0IFN0YXR1cyBXVzQ34oCZMTc=?=
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
X-List-Received-Date: Tue, 28 Nov 2017 12:49:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi RP,

On 11/28/2017 06:47 PM, Robert Yang wrote:
> 
> 
> On 11/28/2017 03:49 PM, Robert Yang wrote:
>>
>> On 11/23/2017 06:20 PM, Richard Purdie wrote:
>>> On Mon, 2017-11-20 at 20:22 -0500, Randy MacLeod wrote:
>>>>> o   Issues with 4.13.10 host kernels booting kvm x86 guests on
>>>>> Tumbleweed (Suse) and Fedora 26 (attempting to see if 4.13.12
>>>>> helps)
>>>> Robert, can you test Fedora 26. It would help to have a defect open
>>>> with steps to reproduce or
>>>> something about the typical workflow/ build time/ day of the week/
>>>> phase of the moon.
>>>
>>> We have some further data:
>>>
>>> a) The issue occurs on 4.13.12
>>>
>>> rpurdie@tumbleweed:/tmp> cat /proc/version
>>> Linux version 4.13.12-1-vanilla (geeko@buildhost) (gcc version 7.2.1 20171020 
>>> [gcc-7-branch revision 253932] (SUSE Linux)) #1 SMP PREEMPT Wed Nov 8 
>>> 11:21:09 UTC 2017 (9151c66)
>>>
>>> b) The hang usually occurs at the TIMER line in the kernel logs but can
>>> occur after booting into userspace around the udevd line, or
>>> occasionally later in the boot process.
>>>
>>> c) The similarity between this and the ppc bug I worked on make me
>>> strongly suspect qemu's timers are stopping firing and the guest is
>>> sitting in the idle loop.
>>>
>>> d) I do now have a way to brute force the hangs at will. The attached
>>> "runqemu-parallel.py" script runs 50 qemus in parallel. In around 45s I
>>> had 10 hung on the autobuilder. I can provide more info on using that
>>> script if its not obvious. It does assume my recent master changes to
>>> the qemuconf files so we don't need to run bitbake -e to run runqemu.
>>>
>>> This could well be the same kind of locking issue we saw on ppc. I'll
>>> continue to look into that.
>>>
>>> Hopefully this extra information will put us on a good track to
>>> resolving it now. It is continuing to break builds and stop patch
>>> merging.
>>
>> I modified the script to run on my host (I used qemux86, not qemux86-64,
>> the later one is still in building) (Up to date Fedora 26, the kernel
>> is 4.13.13):
>>
>> $ cat /proc/version
>> Linux version 4.13.13-200.fc26.x86_64 
>> (mockbuild@bkernel01.phx2.fedoraproject.org) (gcc version 7.2.1 20170915 (Red 
>> Hat 7.2.1-2) (GCC)) #1 SMP Wed Nov 15 15:46:36 UTC 2017
>>
>> But didn't see any hangs after 10 minutes, all the qemus reached login. So maybe
>> it had been fixed on 4.13.13 ?
> 
> I tested qemux86-64, the boot became very slow (just like hang), no one booted
> after about 2 hours (still in booting). And it only happened when
> use qemux86-64 + kvm:
> 
> # Works
> $ runqemu tmp/deploy/images/qemux86-64/ nographic snapshot
> 
> # Doesn't work, like hang:
> $ runqemu tmp/deploy/images/qemux86-64/ nographic snapshot kvm

I upgraded qemu-native to qemu-2.11.0-rc2, then no hangs any more. I dropped
the conflicted patches during upgrade. I will send a formal upgrade tomorrow
it this is acceptable.

Here is the draft patch for testing:

   git://git.openembedded.org/openembedded-core-contrib rbt/qemu_test
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/qemu_test

Robert Yang (1):
   qemu: 2.10.1 -> 2.11.0-rc2 (test)

// Robert

> 
> // Robert
> 
>>
>> // Robert
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>>

