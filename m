Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA1C77BFB6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 08:10:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x568AvXX028998
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Jun 2019 01:10:57 -0700 (PDT)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 6 Jun 2019 01:10:57 -0700
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <736954077d40261a25f189a4d459c8cede0f8d99.camel@linuxfoundation.org>
	<CAMKF1sp4uGcuL38vPsfcF6rm0sCvXjY9GDBuMckW4RM7Kzs-Ew@mail.gmail.com>
	<CAMKF1spLF_rzm3Vet3Lq+DjCxF96koSORHLukxjmiVX2Csapzg@mail.gmail.com>
	<CAMKF1spmyDREqVp4hu5UsSmfmi5KY7MgJNficCgZmXXo00tRjQ@mail.gmail.com>
	<CAMKF1soM4-qnt9STcuV=e8T=zLx1ESR=0HT3xeCCJ4J7mxCc_w@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CF8CBDB.8010705@windriver.com>
Date: Thu, 6 Jun 2019 16:16:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soM4-qnt9STcuV=e8T=zLx1ESR=0HT3xeCCJ4J7mxCc_w@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core status with gcc9
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
X-List-Received-Date: Thu, 06 Jun 2019 08:10:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年05月27日 15:53, Khem Raj wrote:
> On Sun, May 26, 2019 at 10:17 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, May 13, 2019 at 8:39 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Sun, May 12, 2019 at 1:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> On Sun, May 12, 2019 at 6:21 AM Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>
>>>>> I've run some tests and think we're now down to one remaining issue
>>>>> with gcc 9:
>>>>>
>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/579
>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/55/builds/145
>>>>>
>>>>
>>>> Assembler is not liking what gcc9 is generating
>>>>
>>>> HOSTCC scripts/kconfig/conf.o
>>>> /tmp/ccnMW5be.s: Assembler messages:
>>>> /tmp/ccnMW5be.s: Internal error (Segmentation fault).
>>>>
>>>> I wonder if its a common case or specific here?
>>>> I will try to reproduce it as well
>>>>
>>>
>>> I am able to get a .s file which crashes assembler on
>>> qemu. Same file assembles ok with mips cross assembler
>>> so next I want to get hold of a mips hardware and try
>>> it on the real h/w, meanwhile if someone has easy access
>>> to mips and can load core-image-sato-sdk on it then I can
>>> provide the asm file which crashes assembler
>>>
>> got some more time to narrow it down.
>> works with musl+gcc-9
>> works with glibc+clang-8
>> works with musl+Clang-8
>>
>> so only glibc+gcc-9 combo is one which exhibits the issue
>>
>
> I have sent a workaound for this which we can try out.
> https://patchwork.openembedded.org/patch/161674/

Failed to build llvm with gcc9 for qemuppc as below:
| collect2: fatal error: ld terminated with signal 11 [Segmentation 
fault], core dumped

Thanks,

>
>>>>> which is a kernel "make scripts" segfaulting on target on mips and
>>>>> hence failing to build kernel modules. If we can get that one fixed
>>>>> we're good from an OE-Core perspective to move to gcc 9.
>>>>>
>>>>> I have to recognise the work Khem has put in getting us this close!
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>

