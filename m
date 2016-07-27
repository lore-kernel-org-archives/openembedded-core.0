Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB29D606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 14:31:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6REV2go009676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2016 07:31:02 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jul 2016 07:31:02 -0700
To: <ed.bartosh@linux.intel.com>
References: <1469620052.23580.115.camel@linuxfoundation.org>
	<20160727122801.GA7061@linux.intel.com>
	<5798B1E4.2090508@windriver.com>
	<20160727131844.GA31757@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5798C5A5.5050909@windriver.com>
Date: Wed, 27 Jul 2016 10:31:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160727131844.GA31757@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: 2.7% build time regression caused by enabling debug/printk.scc KERNEL_FEATURE]
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
X-List-Received-Date: Wed, 27 Jul 2016 14:31:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-07-27 09:18 AM, Ed Bartosh wrote:
> On Wed, Jul 27, 2016 at 09:06:44AM -0400, Bruce Ashfield wrote:
>> On 2016-07-27 08:28 AM, Ed Bartosh wrote:
>>> Hi Bruce,
>>>
>>> Thank you for your suggestion to experiment with configuration options!
>>>
>>>> On 2016-07-26 10:32 AM, Ed Bartosh wrote:
>>>>> Hi all,
>>>>>
>>>>> We've noticed quite big increase of core-image-minimal build time caused by commit
>>>>> d55b7650d305ffad953dd36595ee6b9aa8df5a72 linux-yocto: Enablei debug/printk.scc KERNEL_FEATURE on qemuall machines.
>>>>>
>>>>
>>>> That commit only enables the following options:
>>>>
>>>> CONFIG_PRINTK=y
>>>> CONFIG_PRINTK_TIME=y
>>>>
>>>> CONFIG_EARLY_PRINTK=y
>>>>
>>>> CONFIG_EARLY_PRINTK_DBGP=y
>>>> CONFIG_EARLY_PRINTK_EFI=y
>>>> CONFIG_TTY_PRINTK=y
>>>>
>>>> And yes, that will add some size to the kernel, but I'm not seeing
>>>> similar size increases here.
>>>>
>>>> If you take a look through the kernel source and build, there are
>>>> relatively few additions to the actual kernel build that change
>>>> based on those options, and most of them are runtime changes versus
>>>> build-time changes.
>>>>
>>>
>>> The actuall difference in configuration is bigger as far as I can see:
>>> $ diff -u ../build-kernel/tmp/work/qemux86_64-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/config-4.4.14-yocto-standard
>>> tmp/work/qemux86_64-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/config-4.4.14-yocto-standard | grep '^+C'
>>> +CONFIG_CONSOLE_POLL=y
>>> +CONFIG_PRINTK_TIME=y
>>> +CONFIG_DEBUG_INFO=y
>>> +CONFIG_DEBUG_KERNEL=y
>>> +CONFIG_SCHED_DEBUG=y
>>> +CONFIG_DEBUG_PREEMPT=y
>>> +CONFIG_KGDB=y
>>> +CONFIG_KGDB_SERIAL_CONSOLE=y
>>> +CONFIG_KGDB_LOW_LEVEL_TRAP=y
>>> +CONFIG_KGDB_KDB=y
>>> +CONFIG_KDB_DEFAULT_ENABLE=0x1
>>> +CONFIG_KDB_KEYBOARD=y
>>> +CONFIG_KDB_CONTINUE_CATASTROPHIC=0
>>> +CONFIG_EARLY_PRINTK_DBGP=y
>>> +CONFIG_EARLY_PRINTK_EFI=y
>>> +CONFIG_DEBUG_RODATA=y
>>> +CONFIG_DEBUG_RODATA_TEST=y
>>> +CONFIG_X86_DEBUG_FPU=y
>>>
>>> I guess the reason of this is that printk.scc includes debug-kernel.scc,
>>> which brings more config options:
>>> CONFIG_DEBUG_KERNEL=y
>>> CONFIG_DEBUG_INFO=y
>>> CONFIG_DEBUG_PREEMPT=y
>>>
>>> That probably explains the difference in kernel size and compile time.
>>>
>>
>> Yup.
>>
>>> After removing 'include debug-kernel.scc' the difference in
>>> configuration became more reasonable:
>>> +CONFIG_PRINTK_TIME=y
>>> +CONFIG_EARLY_PRINTK_DBGP=y
>>> +CONFIG_EARLY_PRINTK_EFI=y
>>>
>>> And the size of kernel and modules became almost the same as before
>>> enabling printk feature.
>>>
>>> Considering that the rest of the options from printk.scc don't appear in
>>> the result configuration even if debug-kernel.scc is included I hope
>>> it should be ok to remove 'include debug-kernel.scc' from printk.scc.
>>>
>>> Does it make sense for you?
>>
>> It does to me. Since we actually have a "developer" kernel type that
>> is intended for this purpose. Anything that we add to the standard
>> kernel type should be more surgical.
>>
>
> Looking at guilty commit
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?h=yocto-4.4&id=fd8d90ca69f53d425fdb34fc9a9debac1d0c5f52
> I'd say that the rest of scc files should be also tested the same way.
> We may not need to enable all 3 CONFIG_DEBUG options for each of them.

Adding Cal, since he did the work on this split up.

The profiling feature makes sense with debug kernel being included, but
I can see some latency top use cases that would be valid with a non
developer mode kernel (i.e. the standard kernel).

But yes, we don't want fragments that could be included by the standard
kernel to add typical functionality to add more than they need to
function. Further tweaking can be done, its part of the iterative
process on these fragments as we work through use cases.

Bruce

>
>
> --
> Regards,
> Ed
>


