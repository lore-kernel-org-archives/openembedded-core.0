Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 453506D5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 06:18:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAM6IYKB028909
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 22:18:34 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 21 Nov 2013 22:18:34 -0800
Message-ID: <528EF738.2000409@windriver.com>
Date: Fri, 22 Nov 2013 14:18:32 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1384854113.git.jackie.huang@windriver.com>
	<60e1553243c2b4d99fcb18246b516c1b4e03e2e9.1384854113.git.jackie.huang@windriver.com>
	<1385088545.3614.28.camel@dvhart-mobl4.amr.corp.intel.com>
	<528ED172.3020702@windriver.com>
	<1385096680.3614.35.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1385096680.3614.35.camel@dvhart-mobl4.amr.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] grub-efi: allow compilation without large model support
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
X-List-Received-Date: Fri, 22 Nov 2013 06:18:35 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/22/2013 1:04 PM, Darren Hart wrote:
> On Fri, 2013-11-22 at 11:37 +0800, jhuang0 wrote:
>>
>> On 11/22/2013 10:49 AM, Darren Hart wrote:
>>> On Wed, 2013-11-20 at 09:40 +0800, jackie.huang@windriver.com wrote:
>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>
>>>> -mcmodel=large is not supported by gcc with version lower
>>>> than 4.4, but we don't need to use memory over 4GiB, so add
>>>> a patch to allow compilation without large model support.
>>>>
>>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>>> ---
>>>>    ...allow-a-compilation-without-mcmodel-large.patch | 69 ++++++++++++++++++++++
>>>>    meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
>>>>    2 files changed, 70 insertions(+)
>>>>    create mode 100644 meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
>>>>
>>>> diff --git a/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
>>>> new file mode 100644
>>>> index 0000000..b2be74a
>>>> --- /dev/null
>>>> +++ b/meta/recipes-bsp/grub/files/grub-efi-allow-a-compilation-without-mcmodel-large.patch
>>>> @@ -0,0 +1,69 @@
>>>> +From 0cea0e4266214da1f11e812834f5d5c47a6e04e6 Mon Sep 17 00:00:00 2001
>>>> +From: Jackie Huang <jackie.huang@windriver.com>
>>>> +Date: Tue, 5 Nov 2013 07:23:32 -0500
>>>> +Subject: [PATCH] Allow a compilation without -mcmodel=large
>>>> +
>>>> +* kern/efi/mm.c (grub_efi_allocate_pages): don't allocate >4GiB
>>>> +  when compiled without -mcmodel=large
>>>> +  (filter_memory_map): remove memory post 4 GiB when compiled
>>>> +  without -mcmodel=large
>>>> +* configure.ac: add -DMCMODEL_SMALL=1 to TARGET_CFLAGS when
>>>> +  -mcmodel=large isn't supported
>>>> +
>>>> +Upstream-Status: Inappropriate [configuration]
>>>
>>> Nice try ;-) This is compatibility, not configuration. If grub-efi
>>> maintainers refuse to accept the patch that's up to them, but we need to
>>
>> Actually it's ported from old version of grub which means that they
>> allowed the comilation without large model support before, but not now.
>>   From the Changelog, it was added in 2009:
>>
>> 2009-06-04  Vladimir Serbinenko  <phcoder@gmail.com>
>>
>>           Allow a compilation without -mcmodel=large
>>
>>           * kern/efi/mm.c (grub_efi_allocate_pages): don't allocate >4GiB
>>           when compiled without -mcmodel=large
>>           (filter_memory_map): remove memory post 4 GiB when compiled
>>           without -mcmodel=large
>>           * configure.ac: fail gracefully and add -DMCMODEL_SMALL=1 to
>>           TARGET_CFLAGS when -mcmodel=large isn't supported
>>
>> but it was removed in 2010:
>> 2010-04-21  Vladimir Serbinenko  <phcoder@gmail.com>
>>
>>           * configure.ac: Refuse to compile for x86_64-efi is mcmodel=large
>>           is not supported.
>>
>> So I think they may not accept this patch again.
>
> It does appear to be a deliverate removale, fortunatley, you know
> exactly who to Cc on the list now :-) It's worth shooting it off to the
> list to see what they say. Either way, it is definitely not a
> configuration patch.

Yes, I will change to compatibility in v4 and add Vladimir in cc list.

Thanks,
Jackie

>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>
>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

