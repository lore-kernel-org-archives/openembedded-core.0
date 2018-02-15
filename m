Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E32A5601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 17:59:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1FHxAMR002698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 15 Feb 2018 09:59:10 -0800
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 15 Feb 2018 09:58:56 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1517931042.git.bruce.ashfield@windriver.com>
	<9c618956cda395a9c8fd101fba7f87af8dbd2304.1517931042.git.bruce.ashfield@windriver.com>
	<CA+chaQcYM+edq-FkhAU4h=kV3fKAtoC=rVNFf5B3QRBVSzn8sg@mail.gmail.com>
	<acbb4efc-2b0c-4089-4b5c-4e2ce0c915f8@windriver.com>
	<CA+chaQdev33bwfdCoKHw6jP6N2yJ-1y_s9MLxcqh7nxjnN8uTQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <a5aad303-6536-bdc2-1ef6-7e85daf20c2c@windriver.com>
Date: Thu, 15 Feb 2018 12:59:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdev33bwfdCoKHw6jP6N2yJ-1y_s9MLxcqh7nxjnN8uTQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] linux-yocto: introduce 4.15 recipes
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
X-List-Received-Date: Thu, 15 Feb 2018 17:59:12 -0000
X-Groupsio-MsgNum: 108093
Content-Type: multipart/mixed; boundary="------------96FEA2A6D5B312E18458F540"
Content-Language: en-US

--------------96FEA2A6D5B312E18458F540
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 02/15/2018 11:37 AM, Martin Jansa wrote:
> After applying
> https://patchwork.openembedded.org/patch/147586/
> and the do_configure[depends] change I got the same error, but this time in:
> make-mod-scripts/1.0-r0/temp/log.do_configure.20429

Yep. you'd also need this attached patch.

Bruce

> 
> Regards,
> 
> On Thu, Feb 15, 2018 at 5:23 PM, Bruce Ashfield 
> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>> wrote:
> 
>     On 02/15/2018 11:18 AM, Martin Jansa wrote:
> 
>         I'm not sure if this is caused by linux-yocto upgrade or lttng
>         upgrade, but without openssl-dev installed on the host I'm
>         seeing following failures on ubuntu builders:
> 
> 
>     It's lttng and the new dependencies of the kernel.
> 
>     I have a two patch series that moves the make-mod-scripts into a recipe
>     for better synchronization and fewer races, and on top of that, I have
>     this change:
> 
>     -------
> 
>     index 6645c873f015..c1b80bf8b148 100644
>     --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>     <http://make-mod-scripts_1.0.bb>
>     @@ -5,15 +5,17 @@ inherit kernel-arch
> 
>       S = "${WORKDIR}"
> 
>     -do_configure[depends] += "virtual/kernel:do_shared_workdir"
>     +do_configure[depends] += "virtual/kernel:do_shared_workdir
>     openssl-native:do_populate_sysroot"
> 
>     ----
> 
>     That makes the header available before lttng actually goes looking for
>     it (but it isn't limited to lttng, it is just the expanding kernel
>     requirements).
> 
>     Would you be willing to try those two patches in your usecase ? I sent
>     the make-mod-scripts one in the past, but didn't hear anything on it, so
>     I'm carrying it locally.
> 
>     Bruce
> 
> 
>         oe-core/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb
>         <http://lttng-modules_2.10.5.bb>:do_make_scripts) failed with
>         exit code '1'
> 
>         work-shared/qemux86/kernel-source/scripts/extract-cert.c:21:25:
>         fatal error: openssl/bio.h: No such file or directory
>         |  #include <openssl/bio.h>
>         |                          ^
>         | compilation terminated.
>         | make[2]: *** [scripts/extract-cert] Error 1
>         | make[1]: *** [scripts] Error 2
> 
>         On Tue, Feb 6, 2018 at 5:21 PM, Bruce Ashfield
>         <bruce.ashfield@windriver.com
>         <mailto:bruce.ashfield@windriver.com>
>         <mailto:bruce.ashfield@windriver.com
>         <mailto:bruce.ashfield@windriver.com>>> wrote:
> 
>              This commit makes the 4.15 kernel available for use with the
>              Yocto configuration fragments and qemu* BSPs.
> 
>              It has been tested for x86,arm,mips and powerpc against the
>         lsb, core*
>              and glibc/mulsc test matrix.
> 
>              This will serve as the "latest" kernel in master, with
>         others being
>              removed in subsequent commits.
> 
>              Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com
>         <mailto:bruce.ashfield@windriver.com>
>              <mailto:bruce.ashfield@windriver.com
>         <mailto:bruce.ashfield@windriver.com>>>
>              ---
>                meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>         <http://linux-yocto-rt_4.15.bb>
>              <http://linux-yocto-rt_4.15.bb>   | 38 +++++++++++++++++
>                meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b  | 25
>         ++++++++++++
>                meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>
>              <http://linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>> | 47 ++++++++++++++++++++++
>                meta/recipes-kernel/linux/linux-yocto_4.15.bb
>         <http://linux-yocto_4.15.bb>
>              <http://linux-yocto_4.15.bb>      | 47 ++++++++++++++++++++++
>                4 files changed, 157 insertions(+)
>                create mode 100644
>              meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>         <http://linux-yocto-rt_4.15.bb>
>              <http://linux-yocto-rt_4.15.bb>
>                create mode 100644
>         meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>                create mode 100644
>              meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>
>              <http://linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>>
>                create mode 100644
>         meta/recipes-kernel/linux/linux-yocto_4.15.bb
>         <http://linux-yocto_4.15.bb>
>              <http://linux-yocto_4.15.bb>
> 
>              diff --git
>         a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>         <http://linux-yocto-rt_4.15.bb>
>              <http://linux-yocto-rt_4.15.bb>
>              b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>         <http://linux-yocto-rt_4.15.bb>
>              <http://linux-yocto-rt_4.15.bb>
>              new file mode 100644
>              index 000000000000..31f8c23cef52
>              --- /dev/null
>              +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
>         <http://linux-yocto-rt_4.15.bb>
>              <http://linux-yocto-rt_4.15.bb>
>              @@ -0,0 +1,38 @@
>              +KBRANCH ?= "v4.15/standard/preempt-rt/base"
>              +
>              +require recipes-kernel/linux/linux-yocto.inc
>              +
>              +# Skip processing of this recipe if it is not explicitly
>         specified
>              as the
>              +# PREFERRED_PROVIDER for virtual/kernel. This avoids
>         errors when trying
>              +# to build multiple virtual/kernel providers, e.g. as
>         dependency of
>              +# core-image-rt-sdk, core-image-rt.
>              +python () {
>              +    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and
>              d.getVar("PREFERRED_PROVIDER_virtual/kernel") !=
>         "linux-yocto-rt":
>              +        raise bb.parse.SkipRecipe("Set
>              PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to
>         enable it")
>              +}
>              +
>              +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
>              +
>              +SRC_URI =
>             
>         "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
>         <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
>             
>         <http://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
>         <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>>
>              \
>              +             
>           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA} <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA} <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>>"
> 
>              +
>              +LINUX_VERSION ?= "4.15"
>              +
>              +PV = "${LINUX_VERSION}+git${SRCPV}"
>              +
>              +KMETA = "kernel-meta"
>              +KCONF_BSP_AUDIT_LEVEL = "2"
>              +
>              +LINUX_KERNEL_TYPE = "preempt-rt"
>              +
>              +COMPATIBLE_MACHINE =
>         "(qemux86|qemux86-64|qemuarm|qemuppc|qemumips)"
>              +
>              +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>              +
>              +# Functionality flags
>              +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc
>              features/taskstats/taskstats.scc"
>              +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>              +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>              +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc
>         cfg/paravirt_kvm.scc"
>              +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>              diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>              b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>              new file mode 100644
>              index 000000000000..7a6696c71a68
>              --- /dev/null
>              +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.b
>              @@ -0,0 +1,25 @@
>              +KBRANCH ?= "v4.15/standard/tiny/common-pc"
>              +LINUX_KERNEL_TYPE = "tiny"
>              +KCONFIG_MODE = "--allnoconfig"
>              +
>              +require recipes-kernel/linux/linux-yocto.inc
>              +
>              +LINUX_VERSION ?= "4.15"
>              +
>              +KMETA = "kernel-meta"
>              +KCONF_BSP_AUDIT_LEVEL = "2"
>              +
>              +SRCREV_machine ?= "f7a6d45fff853173bfbf61706aeffcd1d1e99467"
>              +SRCREV_meta ?= "ef2f5d9a0ac1c5ac60e76b18b0bb3393be450336"
>              +
>              +PV = "${LINUX_VERSION}+git${SRCPV}"
>              +
>              +SRC_URI =
>             
>         "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
>         <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
>             
>         <http://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
>         <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>>
>              \
>              +             
>           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA} <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA} <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>>"
>              +
>              +COMPATIBLE_MACHINE = "qemux86|qemux86-64"
>              +
>              +# Functionality flags
>              +KERNEL_FEATURES = ""
>              +
>              +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>              diff --git
>         a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>
>              <http://linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>>
>              b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>
>              <http://linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>>
>              new file mode 100644
>              index 000000000000..60b7e600d24d
>              --- /dev/null
>              +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>
>              <http://linux-yocto-tiny_4.15.bb
>         <http://linux-yocto-tiny_4.15.bb>>
> 
>              @@ -0,0 +1,47 @@
>              +KBRANCH ?= "v4.15/standard/base"
>              +
>              +require recipes-kernel/linux/linux-yocto.inc
>              +
>              +# board specific branches
>              +KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
>              +KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
>              +KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
>              +KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
>              +KBRANCH_qemux86  ?= "v4.15/standard/base"
>              +KBRANCH_qemux86-64 ?= "v4.15/standard/base"
>              +KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
>              +
>              +SRCREV_machine_qemuarm ?=
>         "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
>              +SRCREV_machine_qemuarm64 ?=
>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_machine_qemumips ?=
>         "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
>              +SRCREV_machine_qemuppc ?=
>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_machine_qemux86 ?=
>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_machine_qemux86-64 ?=
>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_machine_qemumips64 ?=
>         "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
>              +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
>              +
>              +SRC_URI =
>             
>         "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}
>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>
>             
>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}
>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>>;
>              \
>              +             
>           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA} <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA} <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>>"
> 
>              +
>              +LINUX_VERSION ?= "4.15"
>              +
>              +DEPENDS += "${@bb.utils.contains('ARCH', 'x86',
>         'elfutils-native',
>              '', d)}"
>              +DEPENDS += "openssl-native util-linux-native"
>              +
>              +PV = "${LINUX_VERSION}+git${SRCPV}"
>              +
>              +KMETA = "kernel-meta"
>              +KCONF_BSP_AUDIT_LEVEL = "2"
>              +
>              +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>              +
>              +COMPATIBLE_MACHINE =
>             
>         "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>              +
>              +# Functionality flags
>              +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>              +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>              +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>              +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc
>         cfg/paravirt_kvm.scc"
>              +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc
>         cfg/paravirt_kvm.scc"
>              +KERNEL_FEATURES_append = "
>         ${@bb.utils.contains("TUNE_FEATURES",
>              "mx32", " cfg/x32.scc", "" ,d)}"
>              diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>         <http://linux-yocto_4.15.bb>
>              <http://linux-yocto_4.15.bb>
>              b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>         <http://linux-yocto_4.15.bb>
>              <http://linux-yocto_4.15.bb>
>              new file mode 100644
>              index 000000000000..60b7e600d24d
>              --- /dev/null
>              +++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
>         <http://linux-yocto_4.15.bb>
>              <http://linux-yocto_4.15.bb>
> 
>              @@ -0,0 +1,47 @@
>              +KBRANCH ?= "v4.15/standard/base"
>              +
>              +require recipes-kernel/linux/linux-yocto.inc
>              +
>              +# board specific branches
>              +KBRANCH_qemuarm  ?= "v4.15/standard/arm-versatile-926ejs"
>              +KBRANCH_qemuarm64 ?= "v4.15/standard/qemuarm64"
>              +KBRANCH_qemumips ?= "v4.15/standard/mti-malta32"
>              +KBRANCH_qemuppc  ?= "v4.15/standard/qemuppc"
>              +KBRANCH_qemux86  ?= "v4.15/standard/base"
>              +KBRANCH_qemux86-64 ?= "v4.15/standard/base"
>              +KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
>              +
>              +SRCREV_machine_qemuarm ?=
>         "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
>              +SRCREV_machine_qemuarm64 ?=
>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_machine_qemumips ?=
>         "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
>              +SRCREV_machine_qemuppc ?=
>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_machine_qemux86 ?=
>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_machine_qemux86-64 ?=
>         "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_machine_qemumips64 ?=
>         "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
>              +SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
>              +SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
>              +
>              +SRC_URI =
>             
>         "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}
>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>
>             
>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}
>         <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D>>;
>              \
>              +             
>           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA} <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA} <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=$%7BKMETA%7D>>"
> 
>              +
>              +LINUX_VERSION ?= "4.15"
>              +
>              +DEPENDS += "${@bb.utils.contains('ARCH', 'x86',
>         'elfutils-native',
>              '', d)}"
>              +DEPENDS += "openssl-native util-linux-native"
>              +
>              +PV = "${LINUX_VERSION}+git${SRCPV}"
>              +
>              +KMETA = "kernel-meta"
>              +KCONF_BSP_AUDIT_LEVEL = "2"
>              +
>              +KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>              +
>              +COMPATIBLE_MACHINE =
>             
>         "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>              +
>              +# Functionality flags
>              +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>              +KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>              +KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>              +KERNEL_FEATURES_append_qemux86=" cfg/sound.scc
>         cfg/paravirt_kvm.scc"
>              +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc
>         cfg/paravirt_kvm.scc"
>              +KERNEL_FEATURES_append = "
>         ${@bb.utils.contains("TUNE_FEATURES",
>              "mx32", " cfg/x32.scc", "" ,d)}"
>              --
>              2.5.0
> 
>              --
>              _______________________________________________
>              Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>              <mailto:Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>             
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core <http://lists.openembedded.org/mailman/listinfo/openembedded-core>>
> 
> 
> 
> 


--------------96FEA2A6D5B312E18458F540
Content-Type: text/x-patch; name="0001-openssl-for-lttng-modules-v1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-openssl-for-lttng-modules-v1.patch"

From c03eea2046161ab8088e60eb6112b37ffcd79c86 Mon Sep 17 00:00:00 2001
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 5 Dec 2017 18:15:52 -0500
Subject: [PATCH] openssl for lttng-modules v1

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 6645c873f015..c1b80bf8b148 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -5,15 +5,17 @@ inherit kernel-arch
 
 S = "${WORKDIR}"
 
-do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_configure[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
 do_compile[depends] += "virtual/kernel:do_compile_kernelmodules"
 
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+
 # Build some host tools under work-shared.  CC, LD, and AR are probably
 # not used, but this is the historical way of invoking "make scripts".
 #
 do_configure() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
+	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
 	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
 }
 
-- 
2.5.0


--------------96FEA2A6D5B312E18458F540--
