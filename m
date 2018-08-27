Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19E54771B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 14:43:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7REh0GM024861
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Aug 2018 07:43:00 -0700
Received: from server.local (128.224.20.193) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 27 Aug 2018 07:42:59 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
	<07f521eca58e783f87bd11793d76a93e099befdb.1535118570.git.bruce.ashfield@windriver.com>
	<CAMKF1so+yGob=_NhA9iovsF4dp5M_NspifripUz2OfpA4bgHNg@mail.gmail.com>
	<0f3dc332-5c92-8124-9826-5d793c9bb205@windriver.com>
	<CAMKF1sqj4dvC48FCGB+SmcPMutFC3tMsOHO4ZfiX+0u2y6P5xw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <15d441ba-89ec-a9a4-89c4-62686b758e0c@windriver.com>
Date: Mon, 27 Aug 2018 10:42:58 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqj4dvC48FCGB+SmcPMutFC3tMsOHO4ZfiX+0u2y6P5xw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] linux-yocto: introduce 4.18 recipes
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
X-List-Received-Date: Mon, 27 Aug 2018 14:43:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sweet. I just saw mine break as well.

Were you going to do the uprev to meta-oe, or did you want me to
send a patch ?

Bruce

On 2018-08-27 10:20 AM, Khem Raj wrote:
> uprev fixes it even on mips
> On Mon, Aug 27, 2018 at 5:59 AM Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>>
>> On 2018-08-27 2:58 AM, Khem Raj wrote:
>>> There is one failure on meta-openembedded seen
>>
>> Not bad!
>>
>> I'll fire off a build and see what happens here. I'm guessing that
>> an uprev is the answer .. but you never know with mips :D
>>
>> Bruce
>>
>>>
>>> http://errors.yoctoproject.org/Errors/Details/187942/
>>> On Fri, Aug 24, 2018 at 8:01 AM Bruce Ashfield
>>> <bruce.ashfield@windriver.com> wrote:
>>>>
>>>> Introducing the 4.18 kernel as the 'newest' kernel for the oe core
>>>> release.
>>>>
>>>> This update includes tweaked configs, carried forward BSPs, features
>>>> (aufs, yaffs2, preempt-rt) and has been tested on all arches for boot
>>>> and performance sanity.
>>>>
>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 43 +++++++++++++++++++
>>>>    meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 29 +++++++++++++
>>>>    meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 48 ++++++++++++++++++++++
>>>>    3 files changed, 120 insertions(+)
>>>>    create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>>>>    create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
>>>>    create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.18.bb
>>>>
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>>>> new file mode 100644
>>>> index 000000000000..f740b1dcd892
>>>> --- /dev/null
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>>>> @@ -0,0 +1,43 @@
>>>> +KBRANCH ?= "v4.18/standard/preempt-rt/base"
>>>> +
>>>> +require recipes-kernel/linux/linux-yocto.inc
>>>> +
>>>> +# Skip processing of this recipe if it is not explicitly specified as the
>>>> +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
>>>> +# to build multiple virtual/kernel providers, e.g. as dependency of
>>>> +# core-image-rt-sdk, core-image-rt.
>>>> +python () {
>>>> +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>>>> +        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>>>> +}
>>>> +
>>>> +SRCREV_machine ?= "8a990322beb7b3aa5a06d7bd630f819b70911587"
>>>> +SRCREV_meta ?= "1f78e20cc98dd46637c0beb6007214fb3650992c"
>>>> +
>>>> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>>>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
>>>> +
>>>> +LINUX_VERSION ?= "4.18.3"
>>>> +
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>>>> +
>>>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>>>> +DEPENDS += "openssl-native util-linux-native"
>>>> +
>>>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>>>> +
>>>> +KMETA = "kernel-meta"
>>>> +KCONF_BSP_AUDIT_LEVEL = "2"
>>>> +
>>>> +LINUX_KERNEL_TYPE = "preempt-rt"
>>>> +
>>>> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
>>>> +
>>>> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>>> +
>>>> +# Functionality flags
>>>> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
>>>> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>>> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
>>>> new file mode 100644
>>>> index 000000000000..1f0b35ec25ec
>>>> --- /dev/null
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
>>>> @@ -0,0 +1,29 @@
>>>> +KBRANCH ?= "v4.18/standard/tiny/common-pc"
>>>> +LINUX_KERNEL_TYPE = "tiny"
>>>> +KCONFIG_MODE = "--allnoconfig"
>>>> +
>>>> +require recipes-kernel/linux/linux-yocto.inc
>>>> +
>>>> +LINUX_VERSION ?= "4.18.3"
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>>>> +
>>>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>>>> +DEPENDS += "openssl-native util-linux-native"
>>>> +
>>>> +KMETA = "kernel-meta"
>>>> +KCONF_BSP_AUDIT_LEVEL = "2"
>>>> +
>>>> +SRCREV_machine ?= "eba03655e8e436ef6090100423bcea43e4911478"
>>>> +SRCREV_meta ?= "1f78e20cc98dd46637c0beb6007214fb3650992c"
>>>> +
>>>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>>>> +
>>>> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>>>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
>>>> +
>>>> +COMPATIBLE_MACHINE = "qemux86|qemux86-64"
>>>> +
>>>> +# Functionality flags
>>>> +KERNEL_FEATURES = ""
>>>> +
>>>> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
>>>> new file mode 100644
>>>> index 000000000000..b42c124c87da
>>>> --- /dev/null
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
>>>> @@ -0,0 +1,48 @@
>>>> +KBRANCH ?= "v4.18/standard/base"
>>>> +
>>>> +require recipes-kernel/linux/linux-yocto.inc
>>>> +
>>>> +# board specific branches
>>>> +KBRANCH_qemuarm  ?= "v4.18/standard/arm-versatile-926ejs"
>>>> +KBRANCH_qemuarm64 ?= "v4.18/standard/qemuarm64"
>>>> +KBRANCH_qemumips ?= "v4.18/standard/mti-malta32"
>>>> +KBRANCH_qemuppc  ?= "v4.18/standard/qemuppc"
>>>> +KBRANCH_qemux86  ?= "v4.18/standard/base"
>>>> +KBRANCH_qemux86-64 ?= "v4.18/standard/base"
>>>> +KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
>>>> +
>>>> +SRCREV_machine_qemuarm ?= "1af7de788a0d28968bd48ff733696de130e0427d"
>>>> +SRCREV_machine_qemuarm64 ?= "eba03655e8e436ef6090100423bcea43e4911478"
>>>> +SRCREV_machine_qemumips ?= "f431f068f06041a60b29628c97b507391c6ad92c"
>>>> +SRCREV_machine_qemuppc ?= "eba03655e8e436ef6090100423bcea43e4911478"
>>>> +SRCREV_machine_qemux86 ?= "eba03655e8e436ef6090100423bcea43e4911478"
>>>> +SRCREV_machine_qemux86-64 ?= "eba03655e8e436ef6090100423bcea43e4911478"
>>>> +SRCREV_machine_qemumips64 ?= "a8e005cb6453c4d59f4c460b6f034bba69ce7807"
>>>> +SRCREV_machine ?= "eba03655e8e436ef6090100423bcea43e4911478"
>>>> +SRCREV_meta ?= "1f78e20cc98dd46637c0beb6007214fb3650992c"
>>>> +
>>>> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
>>>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
>>>> +
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>>>> +LINUX_VERSION ?= "4.18.3"
>>>> +
>>>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>>>> +DEPENDS += "openssl-native util-linux-native"
>>>> +
>>>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>>>> +
>>>> +KMETA = "kernel-meta"
>>>> +KCONF_BSP_AUDIT_LEVEL = "2"
>>>> +
>>>> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>>>> +
>>>> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>>>> +
>>>> +# Functionality flags
>>>> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>>>> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>>> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
>>>> --
>>>> 2.5.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>


