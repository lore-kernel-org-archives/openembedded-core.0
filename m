Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 00D1F78F79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 21:48:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB6Lmc5x015714
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2018 13:48:39 -0800 (PST)
Received: from server.local (128.224.23.195) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 6 Dec 2018 13:48:38 -0800
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
References: <3fdeffd5-0d20-b50a-0d8c-8aec3715ebb2@windriver.com>
	<a545e5df-65fc-1249-4fcd-d0c9b0175e27@windriver.com>
	<b8a47a27-bc7c-8404-9133-2c036a25a930@windriver.com>
	<e321e6c6-40e4-ecda-c738-5d6784beefee@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <be00d0a1-e2a4-cbb6-5037-a4ef7bb51e47@windriver.com>
Date: Thu, 6 Dec 2018 16:48:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.3.2
MIME-Version: 1.0
In-Reply-To: <e321e6c6-40e4-ecda-c738-5d6784beefee@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IElzIGl0IG5lY2Vzc2FyeSB0byBmaXggdGhlIEJ1Z3ppbGxhIOKAkyBCdWcgMTE4MDcgYW5kIDU4NzYgPw==?=
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
X-List-Received-Date: Thu, 06 Dec 2018 21:48:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-12-05 10:33 p.m., Hongzhi, Song wrote:
> 
> 
> On 12/06/2018 11:04 AM, Hongzhi, Song wrote:
>>
>>
>> On 12/05/2018 06:57 PM, Bruce Ashfield wrote:
>>> On 12/5/18 5:17 AM, Hongzhi, Song wrote:
>>>> Hi all,
>>>>
>>>> I don't know if it is necessary to do this enhancement.
>>>>
>>>> 1. Bug 11807:
>>>>
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=11807
>>>>
>>>>
>>>> 'CONFIG_EXTRA_FIRMWARE' is used to be set to the names of firmware 
>>>> files which
>>>>
>>>> should be provided by driver vendors.
>>>>
>>>> 'CONFIG_EXTRA_FIRMWARE_DIR' is set to a path which contains above 
>>>> firmware
>>>>
>>>> files. The default path is /lib/firmware if the 
>>>> 'CONFIG_EXTRA_FIRMWARE_DIR' is not set.
>>>>
>>>>
>>>> The path and firmware files must exist in rootfs eventually.
>>>>
>>>>
>>>> 2. Bug 5876:
>>>>
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5876
>>>>
>>>>
>>>> I think it mean that bbclass should check the state of menuconfig.
>>>>
>>>>
>>>> I don't know if is necessary to fix these bugs. Could you give me help?
>>>
>>> I have some enhancements and other things in flight that can already do
>>> what these two bugs are talking about. Paul and I had discussed some of
>>> the config auditing on the list about a year ago, and agreed that
>>> there's no sense duplicating the functionality that already exists
>>> (rather I was going to tweak a few things to make it more easily
>>> accessible).
>>>
>>> If you want, you could assign 5876 to me, and I could take care of it.
>>
>> Hi Bruce,
>>
>> Thanks, I will assign it to you.
>>
>>>
>>> As for 11807, that is simply a kernel configuration option and it should
>>> be handled like any other. I don't see the need for anything special to
>>> be done.
>>>
>>
>> This option is different from the common options. It can only be set 
>> two types
>> of value, "" and "filename1 filename2 ...", which depends on customer.
>>
>> Maybe we can add a variable containing useful firmware in kernel 
>> recipe for customer.
>> The variable will eventually set CONFIG_EXTRA_FIRMWARE in .config .
> 

I disagree that this is different from any other option, simply
because it is used for firmware or has filenames doesn't immediately
make it require special handling.

> How to translate the variable to CONFIG_EXTRA_FIRMWARE and set the 
> option in .config ?
> 1. Append do_kernel_configme in kernel recipe with sed command inside it.
> 2. or modify the bbclass.

This is exactly the problem. You don't want to have many parts
of the build system messing about and modifying the .config.

It makes debug difficult, and it makes the entire process more
complex. Not to mention, when doing things like this, you've now
made parts of the system sensitive to kernel versions, patched
kernels, etc, since you'd be trying to do this in a common location.
In fact, you wouldn't want to have someone setting the actual CONFIG_
value as it appears in the kernel, you'd want some abstracted variable
name that could be mapped to the options later.

In fact, that sort of mapping is what is done with the KERNEL_FEATURES
variable already. It is supposed to translate abstract groups of options
to their kernel specific values. Due to the way the kernel recipes work,
etc, that isn't globally true .. but that is the intent none the less.

The only place you really know about the option and the firmware is in
the kernel recipe anyway. In there you are already specifying a
defconfig or fragments, so it isn't that hard to insist that someone
set the firmware option and manage it in their kernel. It isn't
something that is done everywhere, so it still falls into a special
case.

Bruce

> 
> I am not sure if the requirement in the bug 11807 is reasonable and if 
> my above opinion is
> practical.
> 
> Thanks,
> --Hongzhi
> 
>>
>> --Hongzhi
>>
>>> Bruce
>>>
>>>
>>>>
>>>>
>>>> --Honghzi
>>>>
>>>>
>>>
>>>
>>
> 


