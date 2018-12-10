Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7136B3D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 02:10:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBA2AIZ0028143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Dec 2018 18:10:18 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 9 Dec 2018 18:10:17 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1544066027.git.Qi.Chen@windriver.com>
	<4e980624cf550689a95a3847a3dc1103975b1d8c.1544066027.git.Qi.Chen@windriver.com>
	<653c2aafab5fa07d5c41b2fb29675a154db4a5a5.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ceb4ea61-2001-15d3-5fd7-1769057a08d8@windriver.com>
Date: Mon, 10 Dec 2018 10:17:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <653c2aafab5fa07d5c41b2fb29675a154db4a5a5.camel@linuxfoundation.org>
X-Originating-IP: [128.224.163.141]
Subject: Re: [PATCH 1/1] oeqa: drop support of listing machines in QEMU_USE_KVM
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
X-List-Received-Date: Mon, 10 Dec 2018 02:10:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2018 07:02 PM, Richard Purdie wrote:
> On Thu, 2018-12-06 at 14:30 +0800, Chen Qi wrote:
>> We want QEMU_USE_KVM to only set to some boolean value, with possible
>> MACHINE override. Drop the support of listing machines in this variable,
>> and give users error message if they still do so.
>>
>> Error message below is an example.
>>
>> ERROR: core-image-minimal-1.0-r0 do_testimage: Invalid boolean value 'intel-corei7-64 intel-core2-32 qemux86 qemux86-64'
>> QEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.
>>    e.g.
>>    QEMU_USE_KVM_qemux86-64 = '1'
>> ERROR: core-image-minimal-1.0-r0 do_testimage: Function failed: do_testimage
>>
>> QB_CPU_KVM is also checked to determine whether to enable kvm.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/testimage.bbclass | 12 +++++++-----
>>   meta/lib/oeqa/targetcontrol.py | 12 +++++++-----
>>   2 files changed, 14 insertions(+), 10 deletions(-)
>>
>> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
>> index 82cbb06..3353d133 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -229,11 +229,13 @@ def testimage_main(d):
>>   
>>       # Get use_kvm
>>       qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>> -    if qemu_use_kvm and \
>> -       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
>> -        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
>> -        kvm = True
>> -    else:
>> +    try:
>> +        kvm = oe.types.boolean(qemu_use_kvm)
>> +    except ValueError as e:
>> +        bb.fatal("%s\nQEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.\n"
>> +                 "  e.g.\n"
>> +                 "  QEMU_USE_KVM_qemux86-64 = '1'" % e)
>> +    if kvm and not d.getVar('QB_CPU_KVM'):
>>           kvm = False
>>   
>>       slirp = False
>> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
>> index 59a9c35..d21823b 100644
>> --- a/meta/lib/oeqa/targetcontrol.py
>> +++ b/meta/lib/oeqa/targetcontrol.py
>> @@ -108,11 +108,13 @@ class QemuTarget(BaseTarget):
>>           dump_host_cmds = d.getVar("testimage_dump_host")
>>           dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>>           qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>> -        if qemu_use_kvm and \
>> -           (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
>> -            d.getVar("MACHINE") in qemu_use_kvm.split()):
>> -            use_kvm = True
>> -        else:
>> +        try:
>> +            use_kvm = oe.types.boolean(qemu_use_kvm)
>> +        except ValueError as e:
>> +            bb.fatal("%s\nQEMU_USE_KVM needs to be set to a boolean value. It no longer supports accepting a list of machines.\n"
>> +                     "  e.g.\n"
>> +                     "  QEMU_USE_KVM_qemux86-64 = '1'" % e)
>> +        if use_kvm and not d.getVar('QB_CPU_KVM'):
>>               use_kvm = False
>>   
>>           # Log QemuRunner log output to a file
> Unfortunately this still isn't going to work quite as I mentioned.
>
> We've about to add an aarch64 server to our autobuilder infrastructure.
> We need that to use kvm for arm targets but not x86 ones yet have x86
> targets use kvm on x86 hardware too.
>
> I appreciate that isn't how the code works now but we may as well fix
> this properly once and for all.
>
> Cheers,
>
> Richard
>
>
>

How about setting QB_CPU_KVM to something like 
${@bb.utils.contains('BUILD_ARCH', 'x86_64', '-cpu core2duo', '', d)}?
In this way, we are actually doing BUILD_ARCH and TARGET_ARCH match 
manually, as we are setting QB_CPU_KVM in different conf files like 
qemuboot-x86.inc, qemuboot-intel.inc, which contain target information 
in their names.
When aarch64 server is supported, qemuarm and qemuarm64's configuration 
files could also be modified to add QB_CPU_KVM.

I'm thinking about a general matching function to check BUILD_ARCH and 
TARGET_ARCH, and getting rid of QB_CPU_KVM. But when checking 
qemuboot-intel.inc, I found the '-cpu' option is not the same when 
enabling and disabling kvm.
QB_CPU_intel-core2-32 = "-cpu coreduo"
QB_CPU_KVM_intel-core2-32 = "-cpu kvm32"

So it seems QB_CPU_KVM is still needed. One step further, if it's still 
needed, we could set it properly, doing arch matching manually.

Best Regards,
Chen Qi

