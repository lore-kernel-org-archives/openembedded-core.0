Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 86123793F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 14:44:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7MEi9kk027718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Aug 2018 07:44:10 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 22 Aug 2018 07:44:09 -0700
To: Lukasz Majewski <lukma@denx.de>
References: <20180822134022.1067-1-lukma@denx.de>
	<5293a704-cd9d-9e94-dc78-631d02c4a67e@windriver.com>
	<20180822160515.72d37bb3@jawa>
	<dc51efd5-c251-5f66-15fc-dca2fd81c2d8@windriver.com>
	<20180822162040.33304bef@jawa>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <a5f08555-3cd7-d367-d679-05440d424916@windriver.com>
Date: Wed, 22 Aug 2018 10:44:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180822162040.33304bef@jawa>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: yocto: Add dependency on do_prepare_recipe_sysroot
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
X-List-Received-Date: Wed, 22 Aug 2018 14:44:15 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/22/2018 10:20 AM, Lukasz Majewski wrote:
> On Wed, 22 Aug 2018 10:13:33 -0400
> Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> 
>> On 08/22/2018 10:05 AM, Lukasz Majewski wrote:
>>> Hi Bruce,
>>>    
>>>> On 08/22/2018 09:40 AM, Lukasz Majewski wrote:
>>>>> Without this patch it happens that do_populate_recipe_sysroot is
>>>>> called just before do_compile (on multi core build machines).
>>>>> This is way too late as the .config generated in
>>>>> do_kernel_configme() is already broken.
>>>>>
>>>>> The problem is that do_kernel_configme() calls native's
>>>>> merge_config.sh script which may call bison and arm-linux-*-gcc to
>>>>> compile kconfig infrastructure to create base .config
>>>>> (scripts/kconfig/conf  --allnoconfig Kconfig.)
>>>>>
>>>>> It turns out that we only got above binaries after
>>>>> do_prepare_recipe_sysroot() is called.
>>>>> If those binaries are not available, the merge_config.sh do not
>>>>> generate base .config and without any error produces
>>>>> malfunctioned .config. The build process continues and as a result
>>>>> broken kernel is compiled.
>>>>>
>>>>> To reproduce:
>>>>>
>>>>> bitbake -c cleansstate virtual/kernel
>>>>> bitbake -c kernel_metadata -v virtual/kernel
>>>>> bitbake -c do_kernel_configme -v virtual/kernel
>>>>> (one shall see broken .config in ${B}/.config)
>>>>> bitbake -c do_populate_sysroot -v virtual/kernel
>>>>> bitbake -c do_compile -v virtual/kernel
>>>>>
>>>>> (Poky) SHA1: bb91b2ae3ee5cf108aa2f9b78abb14d5aa00831d
>>>>>
>>>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>>>>> ---
>>>>>     meta/classes/kernel-yocto.bbclass | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta/classes/kernel-yocto.bbclass
>>>>> b/meta/classes/kernel-yocto.bbclass index 4ac3a39e47..19a3f2bc46
>>>>> 100644 --- a/meta/classes/kernel-yocto.bbclass
>>>>> +++ b/meta/classes/kernel-yocto.bbclass
>>>>> @@ -276,6 +276,7 @@ do_kernel_metadata[depends] =
>>>>> "kern-tools-native:do_populate_sysroot"
>>>>> do_validate_branches[depends] =
>>>>> "kern-tools-native:do_populate_sysroot" do_kernel_configme[dirs]
>>>>> += "${S} ${B}" +do_kernel_configme[depends] +=
>>>>> "virtual/kernel:do_prepare_recipe_sysroot"
>>>>
>>>> On a closer look .. what branch is this from ? We already have a
>>>> change that triggered breakage on 4.17+ that should fix this.
>>>>
>>>> i.e. commit ff1bdd75d50f0ebac3d599e461685ace29559a82 in oe-core,
>>>> adds:
>>>>
>>>> ----------
>>>>
>>>>     do_kernel_metadata[depends] =
>>>> "kern-tools-native:do_populate_sysroot"
>>>> do_validate_branches[depends] =
>>>> "kern-tools-native:do_populate_sysroot"
>>>>
>>>> +do_kernel_configme[depends] +=
>>>> "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
>>>> +do_kernel_configme[depends] +=
>>>> "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
>>>> +do_kernel_configme[depends] += "bc-native:do_populate_sysroot
>>>> bison-native:do_populate_sysroot"
>>>>     do_kernel_configme[dirs] += "${S} ${B}"
>>>>     do_kernel_configme() {
>>>>
>>>> ----------
>>>>
>>>> Which I don't see in the context of your patch.
>>>>   
>>>
>>> I do use poky as in the commit message.
>>
>> Yes, I checked that .. but that isn't a useful part of a patch
>> to oe-core.
>>
>> The kernel-yocto bbclass in that context is not the one in master, and
>> if I run a --contains on that commit ID, I don't get an active
>> branch.
> 
> I might have misunderstood something... apparently.
> 
> The changes which I did were to:
> 
> poky/meta/classes/kernel-yocto.bbclass
> 
> Is this a wrong place to add the fix?

It is the right place to add the fix, but the tree that you are
using is not up to date with the current poky or oe-core master.

There are other changes in place that address a similar failure.

For us to look at this change, it needs to be rebased on top of
master (or master-next).

Bruce

> 
>>
>> So the patch as it stands, cannot be applied to master (and I
>> also checked master-next in case something snuck in that I
>> missed) of oe-core or poky, so there's no way to work with it.
>>
>> Bruce
>>
>>>
>>> Regarding the kernel - I do have my own recipe;
>>> inherit kernel
>>>
>>> require
>>> recipes-kernel/linux/linux-yocto.inc
>>>
>>>
>>> And then I do have:
>>> COMPATIBLE_MACHINE_display5 = "display5"
>>>
>>> KBUILD_DEFCONFIG_pn-linux-yocto-custom_display5 =
>>> "imx6q_display5_defconfig"
>>>
>>> As the board is in mainline I just point to Linus tree.
>>>    
>>>> Bruce
>>>>   
>>>>>     do_kernel_configme() {
>>>>>     	set +e
>>>>>     
>>>>>       
>>>>   
>>>
>>>
>>>
>>>
>>> Best regards,
>>>
>>> Lukasz Majewski
>>>
>>> --
>>>
>>> DENX Software Engineering GmbH,      Managing Director: Wolfgang
>>> Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
>>> Germany Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email:
>>> wd@denx.de
>>
> 
> 
> 
> 
> Best regards,
> 
> Lukasz Majewski
> 
> --
> 
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> 


