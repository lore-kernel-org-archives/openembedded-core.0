Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3BA7680A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 20:39:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0MKdMTV022376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Jan 2016 12:39:22 -0800 (PST)
Received: from bruce-ashfields-macbook.local (128.224.22.138) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 22 Jan 2016 12:39:21 -0800
To: Ming Liu <liu.ming50@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
	<1451999565-3502-2-git-send-email-liu.ming50@gmail.com>
	<569E90F9.6020806@windriver.com> <569EB15C.9040502@gmail.com>
	<569F1086.6030400@windriver.com> <56A01873.8010604@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56A29386.1090600@windriver.com>
Date: Fri, 22 Jan 2016 15:39:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56A01873.8010604@gmail.com>
Cc: "Tao, Yue" <Yue.Tao@windriver.com>,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH 1/3] kernel.bbclass: do not install initramfs bundled kernel image
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
X-List-Received-Date: Fri, 22 Jan 2016 20:39:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 16-01-20 6:29 PM, Ming Liu wrote:
>
>
> On 01/20/2016 05:43 AM, Bruce Ashfield wrote:
>> On 2016-01-19 4:57 PM, Ming Liu wrote:
>>>
>>>
>>> On 01/19/2016 08:39 PM, Bruce Ashfield wrote:
>>>> On 16-01-05 08:12 AM, Ming Liu wrote:
>>>>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>>>
>>>>> It makes no sense to install a initramfs bundled kernel image since
>>>>> do_package does not depend on do_bundle_initramfs at all,
>>>>> otherwise, it
>>>>> leads to a implicit kernel-image package depending on do_package run
>>>>> before
>>>>> or after do_bundle_initramfs.
>>>>
>>>> Again. So why not just add the ordering in the task dependencies ?
>>> If we add a intertask dependency like:
>>> add bundle_initramfs before do_install after do_deploy do_package
>>>
>>> Then it will somehow introduce a circular dependency as I described in
>>> another mail.
>>>>
>>>> I'm probably missing something, which just means we need to tweak
>>>> the commit log a bit more.
>>> Maybe I should add some description in commit log about why I think we
>>> could not introduce a intertask dependency as a fix.
>>>
>>
>> That would be ideal, the more information the better.
>>
>>>>
>>>> The code you are removing is conditional, and is run after an
>>>> explicit kernel_do_compile is called, to rebuild the existing
>>>> kernel configuration with an embedded initramfs (via alternate initrd).
>>>> So outside of some ordering/parallel execution issues, I'm not seeing
>>>> it as broken.
>>> Yes, I agree, it will not break the kernel re-compiling, the problem I
>>> want to fix here is just that it does not provide a certain way that we
>>> could add initramfs bundled kernel image into a rootfs.
>>>
>>
>> Speaking of breaking. What happens to existing users of INITRAMFS_IMAGE?
>> Do their existing image types and bundling continue to work without
>> modification ?
> That depends, the existing users always can find the INITRAMFS_IMAGE
> bundled kernel in DEPLOY_DIR with or without my patches, it is not
> broken. But if they want it installed in the rootfs, for some reasons,
> they will have the problem, like in my company, we want to boot the
> kernel from /boot/ on a USB disk, but it is not guaranteed we will get
> the INITRAMFS_IMAGE bundled kernel there during the build.

Right. And if someone isn't doing any initramfs bundling, is there
any impact ? No variables to change, etc ?

I'd suggest double checking meta-initramfs:

http://layers.openembedded.org/layerindex/branch/master/layer/meta-initramfs/

And checking with Andrea to be sure that none of the existing use
cases are broken.

Bruce

>
> //Ming Liu
>>
>> Bruce
>>
>>> //Ming Liu
>>>>
>>>> Bruce
>>>>
>>>>>
>>>>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>>> ---
>>>>>   meta/classes/kernel.bbclass | 4 ----
>>>>>   1 file changed, 4 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>>> index 4ce1611..d1ca614 100644
>>>>> --- a/meta/classes/kernel.bbclass
>>>>> +++ b/meta/classes/kernel.bbclass
>>>>> @@ -179,10 +179,6 @@ do_bundle_initramfs () {
>>>>>           kernel_do_compile
>>>>>           mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
>>>>>           mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
>>>>> -        # Update install area
>>>>> -        echo "There is kernel image bundled with initramfs:
>>>>> ${B}/${KERNEL_OUTPUT}.initramfs"
>>>>> -        install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs
>>>>> ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
>>>>> -        echo "${B}/${KERNEL_OUTPUT}.initramfs"
>>>>>       fi
>>>>>   }
>>>>>
>>>>>
>>>>
>>>
>>
>


