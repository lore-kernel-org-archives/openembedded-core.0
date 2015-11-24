Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 121656057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 21:50:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAOLoOV0021484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Nov 2015 13:50:25 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 24 Nov 2015 13:49:23 -0800
To: Ming Liu <liu.ming50@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1448315884-3893-1-git-send-email-liu.ming50@gmail.com>
	<56549052.1020606@windriver.com> <5654D77E.3080306@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5654DB60.3020508@windriver.com>
Date: Tue, 24 Nov 2015 16:49:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5654D77E.3080306@gmail.com>
Cc: darren@dvhart.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	yue.tao@windriver.com
Subject: Re: [PATCH V1] kernel-devsrc: add 'make scripts' postinstall
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
X-List-Received-Date: Tue, 24 Nov 2015 21:50:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-11-24 04:32 PM, Ming Liu wrote:
>
>
> On 11/24/2015 05:29 PM, Bruce Ashfield wrote:
>> On 15-11-23 04:58 PM, Ming Liu wrote:
>>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>
>>> Run 'make scripts' inside qemu in order to create script binaries that
>>> needed by external modules build on the target.
>>>
>>> Add RDEPENDS on gcc, make, which are needed by the compilation.
>>
>> This version looks fine to me .. and by "fine", I mean that it probably
>> is still less than ideal, but with our current packaging and separation
>> it makes sense to make it work, with all dependencies being explicit.
>>
>> As we (re)slim down the devsrc/headers split, we can revisit this as
>> necessary.
>>
>> One question below though ..
>>
>>>
>>> [YOCTO #6630]
>>>
>>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>>> ---
>>>   meta/recipes-kernel/linux/kernel-devsrc.bb | 14 ++++++++++++--
>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
>>> b/meta/recipes-kernel/linux/kernel-devsrc.bb
>>> index 196c8c7..87826ad 100644
>>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =
>>> "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425
>>>   inherit linux-kernel-base
>>>
>>>   # Whilst not a module, this ensures we don't get multilib extended
>>> (which would make no sense)
>>> -inherit module-base
>>> +inherit module-base qemu
>>
>> Shouldn't this be qemu-native ? Since it is running on the host ? Or
>> maybe I'm completely misunderstanding something :)
> Indeed it is calling qemu-native when inheriting this class, to make a

That is probably my misunderstanding .. I didn't go look at the inherit,
and I read this more as a RDEPENDS, which would be qemu for the target.

> certain postinstall scriptlet run at do_rootfs time through a
> architecture dependent qemu.
> I am not sure if I had answered your question, maybe you mean the name
> is not proper? qemu-native.bbclass would make more sense?

I think you have. If the class is called qemu .. then that's what
you should use.

Bruce

>
> //Ming Liu
>>
>> Bruce
>>
>>>
>>>   # We need the kernel to be staged (unpacked, patched and
>>> configured) before
>>>   # we can grab the source and make the source package. We also need
>>> the bits from
>>> @@ -71,6 +71,16 @@ do_install() {
>>>   # Ensure we don't race against "make scripts" during cpio
>>>   do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>>>
>>> +pkg_postinst_${PN} () {
>>> +    if [ -n "$D" ]; then
>>> +        ${@qemu_run_binary(d, '$D', '${bindir}/make')} \
>>> +            -C $D${KERNEL_SRC_PATH} O=$D${KERNEL_SRC_PATH} scripts
>>> +    else
>>> +        make -C ${KERNEL_SRC_PATH} O=${KERNEL_SRC_PATH} scripts
>>> +    fi
>>> +}
>>> +
>>>   PACKAGES = "kernel-devsrc"
>>>   FILES_${PN} = "${KERNEL_SRC_PATH}"
>>> -RDEPENDS_${PN} = "bc"
>>> +DEPENDS = "qemu-native"
>>> +RDEPENDS_${PN} = "bc gcc make"
>>>
>>
>


