Return-Path: <california.l.sullivan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 002C060746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 20:06:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 13:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="1030337436"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2016 13:06:32 -0700
Received: from orsmsx161.amr.corp.intel.com (10.22.240.84) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 27 Jul 2016 13:06:31 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.5.146]) by
	ORSMSX161.amr.corp.intel.com ([169.254.4.17]) with mapi id
	14.03.0248.002; Wed, 27 Jul 2016 13:06:31 -0700
From: "Sullivan, California L" <california.l.sullivan@intel.com>
To: "Ashfield, Bruce (Wind River)" <bruce.ashfield@windriver.com>,
	"ed.bartosh@linux.intel.com" <ed.bartosh@linux.intel.com>
Thread-Topic: [OE-core] 2.7% build time regression caused by enabling
	debug/printk.scc KERNEL_FEATURE]
Thread-Index: AQHR6AeJ7dnrEb3oIUa6C4iDG925Ow==
Date: Wed, 27 Jul 2016 20:06:31 +0000
Message-ID: <48F3FC2919BF894DA92986D5D64EA12801AC99C8@ORSMSX103.amr.corp.intel.com>
References: <1469620052.23580.115.camel@linuxfoundation.org>
	<20160727122801.GA7061@linux.intel.com>
	<5798B1E4.2090508@windriver.com>
	<20160727131844.GA31757@linux.intel.com>
	<5798C5A5.5050909@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.201.168]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 27 Jul 2016 20:06:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Adding the debug-kernel fragment to the printk fragment was probably a=0A=
mistake on my part. I don't see anything that requires it.=0A=
=0A=
I'm also seeing another issue: TTY_PRINTK depends on EXPERT, which is=0A=
only enabled on the developer kernel by default, so you currently won't=0A=
be getting that option. From there, if we were to enable EXPERT,=0A=
DEBUG_KERNEL then gets selected automatically and we essentially end up=0A=
where we started and have the build time regression.=0A=
=0A=
Stuff to think about on my end I suppose. In the mean time I +1 removing=0A=
the debug-kernel include from printk.scc.=0A=
=0A=
---=0A=
Cal=0A=
=0A=
On 07/27/2016 07:31 AM, Bruce Ashfield wrote:=0A=
> On 2016-07-27 09:18 AM, Ed Bartosh wrote:=0A=
>> On Wed, Jul 27, 2016 at 09:06:44AM -0400, Bruce Ashfield wrote:=0A=
>>> On 2016-07-27 08:28 AM, Ed Bartosh wrote:=0A=
>>>> Hi Bruce,=0A=
>>>>=0A=
>>>> Thank you for your suggestion to experiment with configuration options=
!=0A=
>>>>=0A=
>>>>> On 2016-07-26 10:32 AM, Ed Bartosh wrote:=0A=
>>>>>> Hi all,=0A=
>>>>>>=0A=
>>>>>> We've noticed quite big increase of core-image-minimal build time ca=
used by commit=0A=
>>>>>> d55b7650d305ffad953dd36595ee6b9aa8df5a72 linux-yocto: Enablei debug/=
printk.scc KERNEL_FEATURE on qemuall machines.=0A=
>>>>>>=0A=
>>>>> That commit only enables the following options:=0A=
>>>>>=0A=
>>>>> CONFIG_PRINTK=3Dy=0A=
>>>>> CONFIG_PRINTK_TIME=3Dy=0A=
>>>>>=0A=
>>>>> CONFIG_EARLY_PRINTK=3Dy=0A=
>>>>>=0A=
>>>>> CONFIG_EARLY_PRINTK_DBGP=3Dy=0A=
>>>>> CONFIG_EARLY_PRINTK_EFI=3Dy=0A=
>>>>> CONFIG_TTY_PRINTK=3Dy=0A=
>>>>>=0A=
>>>>> And yes, that will add some size to the kernel, but I'm not seeing=0A=
>>>>> similar size increases here.=0A=
>>>>>=0A=
>>>>> If you take a look through the kernel source and build, there are=0A=
>>>>> relatively few additions to the actual kernel build that change=0A=
>>>>> based on those options, and most of them are runtime changes versus=
=0A=
>>>>> build-time changes.=0A=
>>>>>=0A=
>>>> The actuall difference in configuration is bigger as far as I can see:=
=0A=
>>>> $ diff -u ../build-kernel/tmp/work/qemux86_64-poky-linux/linux-yocto/4=
.4.14+gitAUTOINC+4800a400d5_8361321fec-r0/image/boot/config-4.4.14-yocto-st=
andard=0A=
>>>> tmp/work/qemux86_64-poky-linux/linux-yocto/4.4.14+gitAUTOINC+4800a400d=
5_8361321fec-r0/image/boot/config-4.4.14-yocto-standard | grep '^+C'=0A=
>>>> +CONFIG_CONSOLE_POLL=3Dy=0A=
>>>> +CONFIG_PRINTK_TIME=3Dy=0A=
>>>> +CONFIG_DEBUG_INFO=3Dy=0A=
>>>> +CONFIG_DEBUG_KERNEL=3Dy=0A=
>>>> +CONFIG_SCHED_DEBUG=3Dy=0A=
>>>> +CONFIG_DEBUG_PREEMPT=3Dy=0A=
>>>> +CONFIG_KGDB=3Dy=0A=
>>>> +CONFIG_KGDB_SERIAL_CONSOLE=3Dy=0A=
>>>> +CONFIG_KGDB_LOW_LEVEL_TRAP=3Dy=0A=
>>>> +CONFIG_KGDB_KDB=3Dy=0A=
>>>> +CONFIG_KDB_DEFAULT_ENABLE=3D0x1=0A=
>>>> +CONFIG_KDB_KEYBOARD=3Dy=0A=
>>>> +CONFIG_KDB_CONTINUE_CATASTROPHIC=3D0=0A=
>>>> +CONFIG_EARLY_PRINTK_DBGP=3Dy=0A=
>>>> +CONFIG_EARLY_PRINTK_EFI=3Dy=0A=
>>>> +CONFIG_DEBUG_RODATA=3Dy=0A=
>>>> +CONFIG_DEBUG_RODATA_TEST=3Dy=0A=
>>>> +CONFIG_X86_DEBUG_FPU=3Dy=0A=
>>>>=0A=
>>>> I guess the reason of this is that printk.scc includes debug-kernel.sc=
c,=0A=
>>>> which brings more config options:=0A=
>>>> CONFIG_DEBUG_KERNEL=3Dy=0A=
>>>> CONFIG_DEBUG_INFO=3Dy=0A=
>>>> CONFIG_DEBUG_PREEMPT=3Dy=0A=
>>>>=0A=
>>>> That probably explains the difference in kernel size and compile time.=
=0A=
>>>>=0A=
>>> Yup.=0A=
>>>=0A=
>>>> After removing 'include debug-kernel.scc' the difference in=0A=
>>>> configuration became more reasonable:=0A=
>>>> +CONFIG_PRINTK_TIME=3Dy=0A=
>>>> +CONFIG_EARLY_PRINTK_DBGP=3Dy=0A=
>>>> +CONFIG_EARLY_PRINTK_EFI=3Dy=0A=
>>>>=0A=
>>>> And the size of kernel and modules became almost the same as before=0A=
>>>> enabling printk feature.=0A=
>>>>=0A=
>>>> Considering that the rest of the options from printk.scc don't appear =
in=0A=
>>>> the result configuration even if debug-kernel.scc is included I hope=
=0A=
>>>> it should be ok to remove 'include debug-kernel.scc' from printk.scc.=
=0A=
>>>>=0A=
>>>> Does it make sense for you?=0A=
>>> It does to me. Since we actually have a "developer" kernel type that=0A=
>>> is intended for this purpose. Anything that we add to the standard=0A=
>>> kernel type should be more surgical.=0A=
>>>=0A=
>> Looking at guilty commit=0A=
>> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?h=
=3Dyocto-4.4&id=3Dfd8d90ca69f53d425fdb34fc9a9debac1d0c5f52=0A=
>> I'd say that the rest of scc files should be also tested the same way.=
=0A=
>> We may not need to enable all 3 CONFIG_DEBUG options for each of them.=
=0A=
> Adding Cal, since he did the work on this split up.=0A=
>=0A=
> The profiling feature makes sense with debug kernel being included, but=
=0A=
> I can see some latency top use cases that would be valid with a non=0A=
> developer mode kernel (i.e. the standard kernel).=0A=
>=0A=
> But yes, we don't want fragments that could be included by the standard=
=0A=
> kernel to add typical functionality to add more than they need to=0A=
> function. Further tweaking can be done, its part of the iterative=0A=
> process on these fragments as we work through use cases.=0A=
>=0A=
> Bruce=0A=
>=0A=
>>=0A=
>> --=0A=
>> Regards,=0A=
>> Ed=0A=
>>=0A=
>=0A=
=0A=

