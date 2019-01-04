Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0627BDD4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 06:58:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x046whpM029991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Jan 2019 22:58:43 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 3 Jan 2019 22:58:30 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1546502650.git.liezhi.yang@windriver.com>
	<326e95f58fdba6db0602999725580a837eed549a.1546502650.git.liezhi.yang@windriver.com>
	<73fe35aa5d0da46e8d88d4ca5e4371654adcbb0f.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <7faed3ed-8ae4-e6ba-26d4-f7b04ef3f4a3@windriver.com>
Date: Fri, 4 Jan 2019 15:03:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <73fe35aa5d0da46e8d88d4ca5e4371654adcbb0f.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] oeqa: Fix for QEMU_USE_KVM
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
X-List-Received-Date: Fri, 04 Jan 2019 06:58:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/4/19 6:33 AM, Richard Purdie wrote:
> On Thu, 2019-01-03 at 16:04 +0800, Robert Yang wrote:
>> Fixed:
>> MACHINE = "qemux86"
>> QEMU_USE_KVM = "qemux86"
>> IMAGE_CLASSES += "testimage"
>>
>> $ oe-selftest -r runqemu.RunqemuTests.test_boot_rootfs
>>
>> [snip]
>>    File "/buildarea1/lyang1/poky/meta/lib/oe/types.py", line 122, in
>> boolean
>>      raise ValueError("Invalid boolean value '%s'" % value)
>> ValueError: Invalid boolean value 'qemux86'
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/testimage.bbclass |  8 +-------
>>   meta/lib/oe/types.py           | 18 ++++++++++++++++++
>>   meta/lib/oeqa/targetcontrol.py |  8 +-------
>>   3 files changed, 20 insertions(+), 14 deletions(-)
>>
>> diff --git a/meta/classes/testimage.bbclass
>> b/meta/classes/testimage.bbclass
>> index e8fa4a3..82aef9f 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -230,13 +230,7 @@ def testimage_main(d):
>>       boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT"))
>>   
>>       # Get use_kvm
>> -    qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>> -    if qemu_use_kvm and \
>> -       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
>> -        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
>> -        kvm = True
>> -    else:
>> -        kvm = False
>> +    kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'),
>> d.getVar('MACHINE'))
>>   
>>       slirp = False
>>       if d.getVar("QEMU_USE_SLIRP"):
>> diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
>> index f401713..a153f2c 100644
>> --- a/meta/lib/oe/types.py
>> +++ b/meta/lib/oe/types.py
>> @@ -156,3 +156,21 @@ def path(value, relativeto='', normalize='true',
>> mustexist='false'):
>>                   raise ValueError("{0}: {1}".format(value,
>> os.strerror(errno.ENOENT)))
>>   
>>       return value
>> +
>> +def qemu_use_kvm(kvm, machine):
>> +    """
>> +    kvm can be:
>> +    - bool: 0, yes, ...
>> +    - MACHINEs: qemux86 qemux86-64 ...
>> +    """
>> +    use_kvm = False
>> +    if kvm:
>> +        kvm_boolean = False
>> +        try:
>> +            kvm_boolean = boolean(kvm)
>> +        except ValueError:
>> +            pass
>> +        if (kvm_boolean and "x86" in machine) or (machine in
>> kvm.split()):
>> +            use_kvm = True
>> +    return use_kvm
>> +
>> diff --git a/meta/lib/oeqa/targetcontrol.py
>> b/meta/lib/oeqa/targetcontrol.py
>> index 59a9c35..980d6a2 100644
>> --- a/meta/lib/oeqa/targetcontrol.py
>> +++ b/meta/lib/oeqa/targetcontrol.py
>> @@ -107,13 +107,7 @@ class QemuTarget(BaseTarget):
>>           dump_target_cmds = d.getVar("testimage_dump_target")
>>           dump_host_cmds = d.getVar("testimage_dump_host")
>>           dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>> -        qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>> -        if qemu_use_kvm and \
>> -           (oe.types.boolean(qemu_use_kvm) and "x86" in
>> d.getVar("MACHINE") or \
>> -            d.getVar("MACHINE") in qemu_use_kvm.split()):
>> -            use_kvm = True
>> -        else:
>> -            use_kvm = False
>> +        use_kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'),
>> d.getVar('MACHINE'))
>>   
>>           # Log QemuRunner log output to a file
>>           import oe.path
> 
> 
> There have been a few patches related to this floating around. I'd like
> to fix this once and for all but we don't have a patch which quite gets
> this to where it needs to be.
> 
> I'd suggest we:
> 
> a) drop the approach of having MACHINE in the variable and simply have
> it either set to enabled or disabled
> 
> b) only enable KVM if the target arch matches the host arch
> 
> 
> For b) I'd like to cover the case where qemuarm64 is being run on an
> aarch64 server.
> 
> This way we'd automatically enable KVM where the arch matches rather
> than needing to code it for each MACHINE.
> 
> Does that make sense?

Thanks, that make sense, I've sent a v2 for it:

[OE-core] [PATCH v2 0/3] oeqa: Fix for QEMU_USE_KVM

// Robert

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 

