Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AEC8261013
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 13:36:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7ODaRCZ025899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 24 Aug 2013 06:36:27 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.21.157) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sat, 24 Aug 2013 06:36:26 -0700
Message-ID: <5218B6D9.4040805@windriver.com>
Date: Sat, 24 Aug 2013 09:36:25 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <cover.1377280429.git.bruce.ashfield@windriver.com>
	<43c76ff9d0dcee4d4caa30a4e24d7f1e4613d750.1377280429.git.bruce.ashfield@windriver.com>
	<52180512.8020603@gmail.com>
In-Reply-To: <52180512.8020603@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] linux-yocto: introduce v3.10
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
X-List-Received-Date: Sat, 24 Aug 2013 13:36:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-23 8:57 PM, Jonathan Liu wrote:
> On 24/08/2013 4:08 AM, Bruce Ashfield wrote:
>> Introduce the 3.10 kernel. This is based on the 3.10.9 upstream kernel
>> and replaces the 3.8 recipes, which will be removed once all reference
>> boards have been updated.
>>
>> 3.10 also the latest LTSI and will be updated with that content when it
>> becomes available.
>>
>> Other features of the 3.10 kernel include:
>>
>>    - refreshed -rt support
>>    - refreshed yaffs2, aufs3
>>    - cryptodev
>>    - bfs, edf, and OCF staged features
>>    - scrubbed and updated meta data for v3.10
>>    - improved tools support for meta data updates and queue maintenance
>>    - patch carry forward from all previous linux-yocto kernels and
>>      configuration.
>>
>> This kernel has been built and boot tested on all qemu machines and
>> architectures.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   30
>> ++++++++++++++++++++
>>   meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   25
>> ++++++++++++++++
>>   meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   30
>> ++++++++++++++++++++
>>   3 files changed, 85 insertions(+)
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.10.bb
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>> new file mode 100644
>> index 0000000..4139be8
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
>> @@ -0,0 +1,30 @@
>> +require recipes-kernel/linux/linux-yocto.inc
>> +
>> +KBRANCH = "standard/preempt-rt/base"
>> +KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
>> +
>> +SRCREV_machine ?= "77c5842818867366c3d08ca1dec19dc43aee0e91"
>> +SRCREV_machine_qemuppc ?= "7be83bc1124d2a2c75f99df94baaf718659722ea"
>> +SRCREV_meta ?= "1b9b113837f353fd94148beb6bd00a3b7b35d01d"
>> +
>> +SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>>
>> +
>> +LINUX_VERSION ?= "3.10.9"
>> +
>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>> +
>> +KMETA = "meta"
>> +
>> +LINUX_KERNEL_TYPE = "preempt-rt"
>> +
>> +# Omit broken machines from COMPATIBLE_MACHINE
>> +#   qemuppc hangs at boot
>> +#   qemumips panics at boot
>> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
> I see COMPATIBLE_MACHINE has been carried over from the 3.4 and 3.8
> linux-rt recipes. Is linux-rt still broken on qemuppc and qemumips?

It is still the case, for the most part. -rt works fine on both ppc and
mips, just not in qemu.

The first port of any new kernel, I carry support over exactly as it is.
Only changing the kernel + headers, stabilize the existing support and
then look at adding new functionality and boards. That's the only way to
reasonably control the changes.

Cheers,

Bruce

>
>> +
>> +# Functionality flags
>> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
>> features/taskstats/taskstats.scc"
>> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES",
>> "mx32", " cfg/x32.scc", "" ,d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>> b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>> new file mode 100644
>> index 0000000..1c2ad37
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>> @@ -0,0 +1,25 @@
>> +require recipes-kernel/linux/linux-yocto.inc
>> +
>> +# We need lzma (as CONFIG_KERNEL_LZMA=y)
>> +DEPENDS += "xz-native"
>> +
>> +KBRANCH_DEFAULT = "standard/tiny/base"
>> +KBRANCH = "${KBRANCH_DEFAULT}"
>> +LINUX_KERNEL_TYPE = "tiny"
>> +KCONFIG_MODE = "--allnoconfig"
>> +
>> +LINUX_VERSION ?= "3.10.9"
>> +
>> +KMETA = "meta"
>> +
>> +SRCREV_machine ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
>> +SRCREV_meta ?= "1b9b113837f353fd94148beb6bd00a3b7b35d01d"
>> +
>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>> +
>> +SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
>>
>> +
>> +COMPATIBLE_MACHINE = "(qemux86)"
>> +
>> +# Functionality flags
>> +KERNEL_FEATURES = ""
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
>> new file mode 100644
>> index 0000000..ea6ad2a
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
>> @@ -0,0 +1,30 @@
>> +require recipes-kernel/linux/linux-yocto.inc
>> +
>> +KBRANCH_DEFAULT = "standard/base"
>> +KBRANCH = "${KBRANCH_DEFAULT}"
>> +
>> +SRCREV_machine_qemuarm ?= "8675d3d0a3c17135f70ef474d5c362397c02e62a"
>> +SRCREV_machine_qemumips  ?= "992b743b905edd21d3a4a27c92b5c6a9e44d7d73"
>> +SRCREV_machine_qemuppc ?= "09388c3572e26c78b34554e46e077f12be7b2401"
>> +SRCREV_machine_qemux86 ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
>> +SRCREV_machine_qemux86-64 ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
>> +SRCREV_machine_qemumips64 ?= "203679cb23c752fdcbc0180a55a81728d7462561"
>> +SRCREV_machine ?= "6c1528b2b78d1ec7e75bb7a9880074ec35aa1aa0"
>> +SRCREV_meta ?= "1b9b113837f353fd94148beb6bd00a3b7b35d01d"
>> +
>> +SRC_URI =
>> "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>>
>> +
>> +LINUX_VERSION ?= "3.10.9"
>> +
>> +PV = "${LINUX_VERSION}+git${SRCPV}"
>> +
>> +KMETA = "meta"
>> +
>> +COMPATIBLE_MACHINE =
>> "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>> +
>> +# Functionality flags
>> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>> +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>> +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>> +KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES",
>> "mx32", " cfg/x32.scc", "" ,d)}"
> Regards,
> Jonathan


