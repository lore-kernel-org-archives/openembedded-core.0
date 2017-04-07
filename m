Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5737D77D49
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 08:04:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3784Is5001721
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Apr 2017 01:04:18 -0700 (PDT)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Fri, 7 Apr 2017 01:04:17 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Nathan Rossi
	<nathan@nathanrossi.com>
References: <cover.1490850708.git.Qi.Chen@windriver.com>
	<d6b2737e706f743644df63f21a8f061b9e2f83c7.1490850708.git.Qi.Chen@windriver.com>
	<CA+aJhH1JjWONYpOFi8S4QsDzUdfoPSJS_0FZf=5dQTm-O_4wEQ@mail.gmail.com>
	<1491391320.17200.8.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <e60723a0-a6f4-3dd7-a53c-044bf0f7c62b@windriver.com>
Date: Fri, 7 Apr 2017 16:05:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1491391320.17200.8.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.201]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.inc/qemu.inc: preserve directories to be used by runqemu
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
X-List-Received-Date: Fri, 07 Apr 2017 08:04:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2017 07:22 PM, Richard Purdie wrote:
> On Wed, 2017-04-05 at 20:06 +1000, Nathan Rossi wrote:
>> On 30 March 2017 at 15:12, Chen Qi <Qi.Chen@windriver.com> wrote:
>>> The 'recipe-sysroot' and 'recipe-sysroot-native' directories need
>>> to
>>> be preserved for runqemu to work correctly. Otherwise, when
>>> 'rm_work'
>>> is enabled, these directories are removed, thus causing errors when
>>> using runqemu .
>>>
>>> [YOCTO #11266]
>>> [YOCTO #11193]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/classes/image.bbclass         | 1 +
>>>   meta/conf/machine/include/qemu.inc | 3 +++
>>>   2 files changed, 4 insertions(+)
>>>
>>> diff --git a/meta/classes/image.bbclass
>>> b/meta/classes/image.bbclass
>>> index 405fd73..cac3a5f 100644
>>> --- a/meta/classes/image.bbclass
>>> +++ b/meta/classes/image.bbclass
>>> @@ -8,6 +8,7 @@ inherit ${SDKEXTCLASS}
>>>   TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
>>>   TOOLCHAIN_TARGET_TASK_ATTEMPTONLY +=
>>> "${PACKAGE_INSTALL_ATTEMPTONLY}"
>>>   POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks;
>>> "
>>> +RM_WORK_EXCLUDE_ITEMS_append = " ${IMAGE_RM_WORK_EXCLUDE_ITEMS}"
>>>
>>>   LICENSE = "MIT"
>>>   PACKAGES = ""
>>> diff --git a/meta/conf/machine/include/qemu.inc
>>> b/meta/conf/machine/include/qemu.inc
>>> index 0e4103b..8345c08 100644
>>> --- a/meta/conf/machine/include/qemu.inc
>>> +++ b/meta/conf/machine/include/qemu.inc
>>> @@ -29,3 +29,6 @@ KERNEL_FEATURES_append_pn-linux-yocto = "
>>> features/nfsd/nfsd-enable.scc"
>>>   MACHINE_EXTRA_RRECOMMENDS += "rng-tools"
>>>
>>>   IMAGE_CLASSES += "qemuboot"
>>> +
>>> +# These two directories need to be preserved for runqemu to work
>>> well
>>> +IMAGE_RM_WORK_EXCLUDE_ITEMS = "recipe-sysroot recipe-sysroot-
>>> native"
>> Should this be setup by qemuboot.bbclass instead, so that it applies
>> to any image/machine (even those that do not use qemu.inc) that is
>> intended to be used by runqemu?
> I'm trying to decide what the best approach here is. I'm thinking it
> might be better to:
>
> a) make qemu builds depend on qemu-helper-native
> b) make that preserve its native sysroot (not the target one).
> c) have runqemu look at qemu-helper-native
>
> I think that should solve problems and work better than the above?
>
> Cheers,
>
> Richard
>
Hi Richard,

I've sent out a new patch series. The solution is a little bit different 
from the above.

As 'tunctl' is from qemu-helper-native, and 'qemu-xxx' is from 
qemu-native, I choose to have runqemu look at things under 
sysroots-components. The STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE 
logic is still preserved so that runqemu still works well in SDK.

I've used the following test cases for testing.

1) runqemu + rm_work

2) oe-selftest -r runqemu

3) runqemu + SDK

4) runqemu + Ext SDK

Best Regards,

Chen Qi


