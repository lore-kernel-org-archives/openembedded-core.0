Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFA2378CE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:28:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7SDT0LY005517
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Aug 2018 06:29:00 -0700
Received: from server.local (128.224.20.129) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 28 Aug 2018 06:28:59 -0700
To: He Zhe <zhe.he@windriver.com>, <richard.purdie@linuxfoundation.org>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
	<07f521eca58e783f87bd11793d76a93e099befdb.1535118570.git.bruce.ashfield@windriver.com>
	<79b97355-ef12-d567-2212-92bda56acc14@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <c68df684-0721-0e08-e5a0-4eb278bd9636@windriver.com>
Date: Tue, 28 Aug 2018 09:28:58 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <79b97355-ef12-d567-2212-92bda56acc14@windriver.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 28 Aug 2018 13:28:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-08-28 9:27 AM, He Zhe wrote:
> 
> 
> On 2018年08月24日 22:59, Bruce Ashfield wrote:
>> Introducing the 4.18 kernel as the 'newest' kernel for the oe core
>> release.
>>
>> This update includes tweaked configs, carried forward BSPs, features
>> (aufs, yaffs2, preempt-rt) and has been tested on all arches for boot
>> and performance sanity.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 43 +++++++++++++++++++
>>   meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 29 +++++++++++++
>>   meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 48 ++++++++++++++++++++++
>>   3 files changed, 120 insertions(+)
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_4.18.bb
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>> new file mode 100644
>> index 000000000000..f740b1dcd892
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>> @@ -0,0 +1,43 @@
>> +KBRANCH ?= "v4.18/standard/preempt-rt/base"
>> +
>> +require recipes-kernel/linux/linux-yocto.inc
>> +
>> +# Skip processing of this recipe if it is not explicitly specified as the
>> +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
>> +# to build multiple virtual/kernel providers, e.g. as dependency of
>> +# core-image-rt-sdk, core-image-rt.
>> +python () {
>> +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
>> +        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>> +}
>> +
>> +SRCREV_machine ?= "8a990322beb7b3aa5a06d7bd630f819b70911587"
>> +SRCREV_meta ?= "1f78e20cc98dd46637c0beb6007214fb3650992c"
>> +
>> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
>> +
>> +LINUX_VERSION ?= "4.18.3"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>> +
>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>> +DEPENDS += "openssl-native util-linux-native"
>> +
>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>> +
>> +KMETA = "kernel-meta"
>> +KCONF_BSP_AUDIT_LEVEL = "2"
>> +
>> +LINUX_KERNEL_TYPE = "preempt-rt"
>> +
>> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
> 
> Should qemuarm64 be in here?

It could be. But I haven't tested it so it hasn't made its way into
the list.

I can do a build boot of it today and send a patch to add it if it works.

Bruce

> 
> Zhe
> 
>> +
>> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>> +
>> +# Functionality flags
>> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
>> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
>> new file mode 100644
>> index 000000000000..1f0b35ec25ec
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
>> @@ -0,0 +1,29 @@
>> +KBRANCH ?= "v4.18/standard/tiny/common-pc"
>> +LINUX_KERNEL_TYPE = "tiny"
>> +KCONFIG_MODE = "--allnoconfig"
>> +
>> +require recipes-kernel/linux/linux-yocto.inc
>> +
>> +LINUX_VERSION ?= "4.18.3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>> +
>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>> +DEPENDS += "openssl-native util-linux-native"
>> +
>> +KMETA = "kernel-meta"
>> +KCONF_BSP_AUDIT_LEVEL = "2"
>> +
>> +SRCREV_machine ?= "eba03655e8e436ef6090100423bcea43e4911478"
>> +SRCREV_meta ?= "1f78e20cc98dd46637c0beb6007214fb3650992c"
>> +
>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>> +
>> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
>> +
>> +COMPATIBLE_MACHINE = "qemux86|qemux86-64"
>> +
>> +# Functionality flags
>> +KERNEL_FEATURES = ""
>> +
>> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
>> new file mode 100644
>> index 000000000000..b42c124c87da
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
>> @@ -0,0 +1,48 @@
>> +KBRANCH ?= "v4.18/standard/base"
>> +
>> +require recipes-kernel/linux/linux-yocto.inc
>> +
>> +# board specific branches
>> +KBRANCH_qemuarm  ?= "v4.18/standard/arm-versatile-926ejs"
>> +KBRANCH_qemuarm64 ?= "v4.18/standard/qemuarm64"
>> +KBRANCH_qemumips ?= "v4.18/standard/mti-malta32"
>> +KBRANCH_qemuppc  ?= "v4.18/standard/qemuppc"
>> +KBRANCH_qemux86  ?= "v4.18/standard/base"
>> +KBRANCH_qemux86-64 ?= "v4.18/standard/base"
>> +KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
>> +
>> +SRCREV_machine_qemuarm ?= "1af7de788a0d28968bd48ff733696de130e0427d"
>> +SRCREV_machine_qemuarm64 ?= "eba03655e8e436ef6090100423bcea43e4911478"
>> +SRCREV_machine_qemumips ?= "f431f068f06041a60b29628c97b507391c6ad92c"
>> +SRCREV_machine_qemuppc ?= "eba03655e8e436ef6090100423bcea43e4911478"
>> +SRCREV_machine_qemux86 ?= "eba03655e8e436ef6090100423bcea43e4911478"
>> +SRCREV_machine_qemux86-64 ?= "eba03655e8e436ef6090100423bcea43e4911478"
>> +SRCREV_machine_qemumips64 ?= "a8e005cb6453c4d59f4c460b6f034bba69ce7807"
>> +SRCREV_machine ?= "eba03655e8e436ef6090100423bcea43e4911478"
>> +SRCREV_meta ?= "1f78e20cc98dd46637c0beb6007214fb3650992c"
>> +
>> +SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
>> +           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>> +LINUX_VERSION ?= "4.18.3"
>> +
>> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>> +DEPENDS += "openssl-native util-linux-native"
>> +
>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>> +
>> +KMETA = "kernel-meta"
>> +KCONF_BSP_AUDIT_LEVEL = "2"
>> +
>> +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>> +
>> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>> +
>> +# Functionality flags
>> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>> +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> 


