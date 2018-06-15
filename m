Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB8C751AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 07:35:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5F7Zgng027112
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jun 2018 00:35:42 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 15 Jun 2018 00:35:42 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
	<5B10DBE5.5050603@windriver.com>
	<62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
	<CANNYZj-JRVCWfRr++c6YQzEtq1WgmhUgf8CwAx4_N6PEdXrYHg@mail.gmail.com>
	<ef063f72-b7b0-e48b-fd50-1f0d05b22255@gmail.com>
	<94dbb164-5f36-de0f-9d2f-c3e9f4afc6f5@linux.intel.com>
	<399d37ef-b872-cae7-f086-818127a588b7@gmail.com>
	<CANNYZj-pDd=Dpgs4sk-73HbxXFKa_aBLMJaRYSxzvdq-EO6aKg@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5B236B5C.7060603@windriver.com>
Date: Fri, 15 Jun 2018 15:31:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-pDd=Dpgs4sk-73HbxXFKa_aBLMJaRYSxzvdq-EO6aKg@mail.gmail.com>
X-Originating-IP: [128.224.162.173]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 15 Jun 2018 07:35:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年06月15日 14:54, Alexander Kanavin wrote:
> Thanks! Mingli, can you try this please?

Sure,

>
> Alex
>
> 2018-06-15 9:44 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>>
>>
>> On 6/1/18 12:34 PM, Alexander Kanavin wrote:
>>>
>>> On 06/01/2018 09:33 PM, Khem Raj wrote:
>>>>>
>>>>> The .s file is not generated and it does not contain any .file
>>>>> directives. The .o file also does not contain the path. It appears in
>>>>> the final .so library at linking stage.
>>>>
>>>>
>>>> Can you share the linker cmdline ?
>>>
>>>
>>> https://pastebin.com/WK9GVDfj
>>>
>>> Note that of the three assembly-generated object files, only the path to
>>> the first shows up in the .so - because of assembly labels I believe.
>>>
>>
>> Thanks for sharing this. If there is a no file directive in an object file
>> then linker will use whatever is specified on linker cmdline so thats what
>> we see, We should define FILE symbol explicitly for .S files here, for C/C++
>> files compiler does that automatically.
>>
>> Other files dont make a claim in final symbol table since this one file
>> alone has cross referencing to symbols from other objects.
>>
>> Something like this will help

Thanks Khem very much!

Have set .file section in .S file as you suggested, it works.

Thanks,

>>
>> Index: boost_1_67_0/libs/context/src/asm/make_i386_sysv_elf_gas.S
>> ===================================================================
>> --- boost_1_67_0.orig/libs/context/src/asm/make_i386_sysv_elf_gas.S
>> +++ boost_1_67_0/libs/context/src/asm/make_i386_sysv_elf_gas.S
>> @@ -23,7 +23,7 @@
>>    *
>> ----------------------------------------------------------------------------------
>> *
>>    *                  *
>>
>> ****************************************************************************************/
>> -
>> +.file "make_i386_sysv_elf_gas.S"
>>   .text
>>   .globl make_fcontext
>>   .align 2
>> Index: boost_1_67_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
>> ===================================================================
>> --- boost_1_67_0.orig/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
>> +++ boost_1_67_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
>> @@ -23,7 +23,7 @@
>>    *
>> ----------------------------------------------------------------------------------
>> *
>>    *                  *
>>
>> ****************************************************************************************/
>> -
>> +.file "make_x86_64_sysv_elf_gas.S"
>>   .text
>>   .globl make_fcontext
>>   .type make_fcontext,@function
>>
>>
>>> Alex
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

