Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8396C3A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 03:10:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x863AIbG006333
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Sep 2019 20:10:19 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 5 Sep 2019 20:10:18 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190904014322.96351-1-hongzhi.song@windriver.com>
	<CADkTA4NipOoQ6qWThig_-hRS5W-QwXNv4Vc9=VSv2yA9sCWxmQ@mail.gmail.com>
	<b92e2a4e-1f37-1c89-4316-80c91ddc1b0f@windriver.com>
	<CADkTA4PLrV7w-4muqS6nh4OBdRsqXfg3sJud+L6taQPkmT8NFA@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <ee438438-7885-2b12-666d-0b026166b97d@windriver.com>
Date: Fri, 6 Sep 2019 11:10:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PLrV7w-4muqS6nh4OBdRsqXfg3sJud+L6taQPkmT8NFA@mail.gmail.com>
X-Originating-IP: [128.224.162.188]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: copy mmiowb.h and modpost from ${B} of kernel
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
X-List-Received-Date: Fri, 06 Sep 2019 03:10:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/4/19 8:34 PM, Bruce Ashfield wrote:
> On Wed, Sep 4, 2019 at 6:07 AM Hongzhi, Song <hongzhi.song@windriver.com> wrote:
>>
>> On 9/4/19 11:55 AM, Bruce Ashfield wrote:
>>> On Tue, Sep 3, 2019 at 9:43 PM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>>>> There are two errors when compile an out of tree kernel module
>>>> using sdk:
>>>>
>>> This is not universally true. Can you expand on what kernel version
>>> and architectures you are building ? I'm able to build kernel modules
>>> across all the arches I'm currently testing, so I'd like to capture
>>> your exact config in the long log. Neither is the autobuilder showing
>>> any errors.
>> Hi Bruce,
>>
>>
>> kernel version: 5.0.19
>>
>> git clone poky
>>
>> echo  TOOLCHAIN_HOST_TASK_append = " nativesdk-openssl-dev
>> nativesdk-bison nativesdk-flex"
>>            TOOLCHAIN_TARGET_TASK_append = " python-dev kernel-dev
>> kernel-devsrc")
>>
>>            >> conf/local.conf
>>
>> Other config is default.
>>
>>
>> bitbake core-image-minimal &&  bitbake core-image-minimal -c populate_sdk
>>
>> ./tmp/deploy/sdk/xxx.sh
>>
>> cd ${Your SDK path}/sysroots/xxx/usr/src/kernel
>>
>> make scripts
>>
>> Then you can build yourself module. And you will meet missing some head
>> files and scripts/mod/modpost.
>>
>>
>> I test qemux86-64 and qemuarm.
>>
>> Both of above arch miss different head files, which all of them
>> generated in ${B}/arch/${ARCH}/include/generated/asm
>>
>> (qemux86-64 needs asm/early_ioremap.h and asm/mmiowb.h
>>
>> qemuarm needs asm/bitsperlong.h)
>>
>>
>>>> 1. "In file included from ./include/linux/seqlock.h:36:0,
>>>>                    from ./include/linux/time.h:6,
>>>>                    from ./include/linux/stat.h:19,
>>>>                    from ./include/linux/module.h:10,
>>>>                    from kernel-module/char.c:1:
>>>> ./include/linux/spinlock.h:60:10: fatal error: asm/mmiowb.h: No such
>>>> file or directory"
>>>>
>>>> mmiowb.h is generated to ${B}/arch/${ARCH}/include/generated/asm/.
>>>>
>>>> And there is only generated/ under ${B}/arch/${ARCH}/include/,
>>>> so I copy whole ${B}/arch/${ARCH}/include/ to $kerneldir/build/
>>>> in case of other files under generated/ is needed in the future.
>>>>
>>>> 2. "/bin/sh: scripts/mod/modpost: No such file or directory"
>>>>
>>>> Copy above files or directory to $kerneldir/build/ fix the errors.
>>>>
>>>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
>>>> index 3900489..feff9f1 100644
>>>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>>>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>>>> @@ -80,6 +80,12 @@ do_install() {
>>>>
>>>>           cp .config $kerneldir/build
>>>>
>>>> +       if [ -d arch/${ARCH}/include ]; then
>>>> +           cp -a --parents arch/${ARCH}/include $kerneldir/build/
>>>> +       fi
>>> Just copy the files you need, not the entire directory.
>>
>> Just as explained above, exactly speaking I think include/generated is
>> necessary.
> It shouldn't be. The point of what we include in devsrc is that it can
> regenerate all these files either on target, or the SDK.
>
>> ps: only generated/ under include/.
>>
>>
>>
>>>> +
>>>> +       cp --parents scripts/mod/modpost $kerneldir/build/
>>> We shouldn't be copying binaries or scripts. They are regenerated on target.
>>>
>>> Bruce
>>
>> But scripts/mod/modpost is needed when compile a module by sdk.
> yes, that is expected. But 'make scripts prepare' should be recreating
> them. Is that not working for you ?


Even without this patch, 'make scripts prepare' works.

So 2.7doc maybe need to be update, because 2.6doc uses 'make scripts'.

https://www.yoctoproject.org/docs/2.6/mega-manual/mega-manual.html#building-out-of-tree-modules-on-the-target


--Hongzhi


>
> We can't copy the binaries, since you'll get QA errors depending on
> your host/target arch combination.
>
> Bruce
>
>> Otherwise it will show error info:
>>
>> "
>>
>> /bin/sh: scripts/mod/modpost: No such file or directory
>> scripts/Makefile.modpost:92: recipe for target '__modpost' failed
>>
>> "
>>
>>
>> --Hongzhi
>>
>>>> +
>>>>           # This scripts copy blow up QA, so for now, we require a more
>>>>           # complex 'make scripts' to restore these, versus copying them
>>>>           # here. Left as a reference to indicate that we know the scripts must
>>>> --
>>>> 2.8.1
>>>>
>
>

