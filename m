Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3978B60806
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 13:47:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vASDlUSC004530
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Nov 2017 05:47:30 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 28 Nov 2017 05:47:29 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
	<45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
	<1511432407.862.111.camel@linuxfoundation.org>
	<90368c50-316e-b03e-252f-33110c059737@windriver.com>
	<bfe14ba9-7de8-6e8d-9d26-2fd05a4e62a2@windriver.com>
	<6a03b501-31d9-5e20-4c40-ce381bb4ad17@windriver.com>
	<1511874917.862.134.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <8f517f26-055b-325a-b627-780bd6447332@windriver.com>
Date: Tue, 28 Nov 2017 21:46:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1511874917.862.134.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, "Xu, Chi" <Chi.Xu@windriver.com>,
	"WOLD, SAUL" <saul.wold@intel.com>
Subject: =?UTF-8?B?UmU6IEdvb2QgbmV3cyBSZTogWW9jdG8gUHJvamVjdCBTdGF0dXMgV1c0N+KAmTE3?=
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
X-List-Received-Date: Tue, 28 Nov 2017 13:47:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/28/2017 09:15 PM, Richard Purdie wrote:
> On Tue, 2017-11-28 at 20:48 +0800, Robert Yang wrote:
>> Hi RP,
>> On 11/28/2017 06:47 PM, Robert Yang wrote:
>>> # Works
>>> $ runqemu tmp/deploy/images/qemux86-64/ nographic snapshot
>>>
>>> # Doesn't work, like hang:
>>> $ runqemu tmp/deploy/images/qemux86-64/ nographic snapshot kvm
>> I upgraded qemu-native to qemu-2.11.0-rc2, then no hangs any more. I
>> dropped
>> the conflicted patches during upgrade. I will send a formal upgrade
>> tomorrow
>> it this is acceptable.
>>
>> Here is the draft patch for testing:
>>
>>     git://git.openembedded.org/openembedded-core-contrib rbt/qemu_test
>>     http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/
>> qemu_test
> 
> Thanks for the data point. I've been putting my data into:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12301
> 
> As you can see there, I think there are actually two issues:
> 
> a) A boot hang around the ..TIMER line where the guest isn't getting
> timer interupts
> 
> b) Something which causes the APIC to see "version 0".
> 
> I applied the 2.11-rc2 upgrade and it seemed to stop the hangs I was
> seeing with "-no-kvm-irqchip" but doesn't stop the ones I see without
> that.

Maybe you can try to reboot the host ? It didn't work when I first
upgrade to 2.11.0-rc2, and it worked after I reboot the machine.
My host is fedora 26 server which is running in qemu-kvm, what I did was:

- Upgrade to 2.11.0-rc2
- $ bitbake qemu-helper-native
- Reboot fedora 26
- run runqemu-parallel with qemux86-64
No hangs
- Back to qemu 2.10.1
- $ bitbake qemu-helper-native
- run runqemu-parallel
Hangs
- Upgrade to 2.11.0-rc2 again, no hangs

// Robert

> 
> I am seeing hangs in guests where the version 0 message appears as well
> as where we see 0x14. The 0x14 versions do boot further into userspace
> usually.
> 
> It also seems host hardware specific as I cannot get my local build
> machine to hang as yet. That could mean its timing or could be cpu
> revision, I've removed many but not all OS differences :/.
> 
> Cheers,
> 
> Richard
> 

