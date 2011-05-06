Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QITWE-0001kW-3o
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 00:29:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 May 2011 15:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,328,1301900400"; d="scan'208";a="689299267"
Received: from unknown (HELO [10.255.12.56]) ([10.255.12.56])
	by fmsmga002.fm.intel.com with ESMTP; 06 May 2011 15:26:23 -0700
Message-ID: <4DC4758E.4070209@linux.intel.com>
Date: Fri, 06 May 2011 15:26:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1304707341.git.bruce.ashfield@windriver.com>
	<a258388e5b8d134009bb37cfc9f6b1c1dd8ba94e.1304707341.git.bruce.ashfield@windriver.com>
In-Reply-To: <a258388e5b8d134009bb37cfc9f6b1c1dd8ba94e.1304707341.git.bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org, dvhart@linux.intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [yocto] [PATCH 1/1] linux-yocto: move non-core machines to	meta-yocto
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2011 22:29:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2011 11:44 AM, Bruce Ashfield wrote:
> The machine configuration of the non-core (non-qemu) machines
> has moved to meta-yocto. Moving the branch mappings, compatibility
> and SRCREVs of these machines to meta-yocto should also be
> done.
>
> Anyone using meta-yocto to build these machines will see no impact
> from this change.
>
> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>   meta-yocto/conf/layer.conf                         |    3 ++-
>   .../linux/linux-yocto-stable_git.bbappend          |   12 ++++++++++++
>   .../recipes-kernel/linux/linux-yocto_git.bbappend  |   12 ++++++++++++
>   .../recipes-kernel/linux/linux-yocto-stable_git.bb |   10 +---------
>   meta/recipes-kernel/linux/linux-yocto_git.bb       |   11 +----------

Bruce,

This need to be 2 pull requests, since the first 4 files are actually in 
meta-yotco, part of poky.git and the linux-yocto_git.bb is in OE-core

Please split this into 2 requests, one for oe-core, just the 
linux-yocto_git.bb file

and a second one to poky with the reset.

I also noted that you list the emenlow in one of the .bbappend files, 
but only as SRCREV_machine_emenlow, should that be there with Paul's 
moving emenlow to meta-intel?

Sau!

>   5 files changed, 28 insertions(+), 20 deletions(-)
>   create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
>   create mode 100644 meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
>
> diff --git a/meta-yocto/conf/layer.conf b/meta-yocto/conf/layer.conf
> index f11d8ed..68786b2 100644
> --- a/meta-yocto/conf/layer.conf
> +++ b/meta-yocto/conf/layer.conf
> @@ -2,7 +2,8 @@
>   BBPATH := "${BBPATH}:${LAYERDIR}"
>
>   # We have a packages directory, add to BBFILES
> -BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
> +BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
> +            ${LAYERDIR}/recipes-*/*/*.bbappend"
>
>   BBFILE_COLLECTIONS += "yocto"
>   BBFILE_PATTERN_yocto := "^${LAYERDIR}/"
> diff --git a/meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend b/meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
> new file mode 100644
> index 0000000..ea0287d
> --- /dev/null
> +++ b/meta-yocto/recipes-kernel/linux/linux-yocto-stable_git.bbappend
> @@ -0,0 +1,12 @@
> +KMACHINE_atom-pc  = "atom-pc"
> +KMACHINE_routerstationpro = "routerstationpro"
> +KMACHINE_mpc8315e-rdb = "fsl-mpc8315e-rdb"
> +KMACHINE_beagleboard = "beagleboard"
> +
> +SRCREV_machine_atom-pc = "72ca49ab08b8eb475cec82a10049503602325791"
> +SRCREV_machine_routerstationpro = "49745cd45c92a89e70c6e2334caa80818c134562"
> +SRCREV_machine_mpc8315e-rdb = "a1c0ed6bf4060c10874b2a8547d81b3169dcf16a"
> +SRCREV_machine_beagleboard = "ef7f944e773950d4016b7643f9ecf052bbe250cd"
> +
> +COMPATIBLE_MACHINE += "(atom-pc|routerstationpro|mpc8315e-rdb|beagleboard)"
> +
> diff --git a/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend b/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
> new file mode 100644
> index 0000000..e4aa7fd
> --- /dev/null
> +++ b/meta-yocto/recipes-kernel/linux/linux-yocto_git.bbappend
> @@ -0,0 +1,12 @@
> +KMACHINE_atom-pc  = "yocto/standard/common-pc/atom-pc"
> +KMACHINE_routerstationpro = "yocto/standard/routerstationpro"
> +KMACHINE_mpc8315e-rdb = "yocto/standard/fsl-mpc8315e-rdb"
> +KMACHINE_beagleboard = "yocto/standard/beagleboard"
> +
> +SRCREV_machine_emenlow = "c3bbcb676f929c4fc0511a6e66494b8770d015a1"
> +SRCREV_machine_atom-pc = "b906f358fd404a1e74a961f25079274e0d933ee1"
> +SRCREV_machine_routerstationpro = "95ca94d2e71ca2db6822a37a7f575fa79c3d05d0"
> +SRCREV_machine_mpc8315e-rdb = "53c800c244e73d81d2832f6da306eeae3b09e5dc"
> +SRCREV_machine_beagleboard = "b906f358fd404a1e74a961f25079274e0d933ee1"
> +
> +COMPATIBLE_MACHINE = "(mpc8315e-rdb|routerstationpro|beagleboard)"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-stable_git.bb b/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
> index 93b06fd..66991ae 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
> @@ -7,10 +7,6 @@ KMACHINE_qemux86-64  = "common_pc_64"
>   KMACHINE_qemuppc  = "qemu_ppc32"
>   KMACHINE_qemumips = "mti_malta32_be"
>   KMACHINE_qemuarm  = "arm_versatile_926ejs"
> -KMACHINE_atom-pc  = "atom-pc"
> -KMACHINE_routerstationpro = "routerstationpro"
> -KMACHINE_mpc8315e-rdb = "fsl-mpc8315e-rdb"
> -KMACHINE_beagleboard = "beagleboard"
>
>   LINUX_VERSION ?= "2.6.34"
>   LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE_EXTENSION}"
> @@ -23,10 +19,6 @@ SRCREV_machine_qemumips = "c32d40f960e3c89d07f079bec4c96dcbfc749f0b"
>   SRCREV_machine_qemuppc = "96d6bc31d3caaf62a966255479cc5cee0e76b1e9"
>   SRCREV_machine_qemux86 = "72ca49ab08b8eb475cec82a10049503602325791"
>   SRCREV_machine_qemux86-64 = "72ca49ab08b8eb475cec82a10049503602325791"
> -SRCREV_machine_atom-pc = "72ca49ab08b8eb475cec82a10049503602325791"
> -SRCREV_machine_routerstationpro = "49745cd45c92a89e70c6e2334caa80818c134562"
> -SRCREV_machine_mpc8315e-rdb = "a1c0ed6bf4060c10874b2a8547d81b3169dcf16a"
> -SRCREV_machine_beagleboard = "ef7f944e773950d4016b7643f9ecf052bbe250cd"
>   SRCREV_machine = "72ca49ab08b8eb475cec82a10049503602325791"
>   SRCREV_meta = "ec26387cb168e9e0976999b528b5a9dd62e3157a"
>
> @@ -34,7 +26,7 @@ PR = "r1"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>   SRCREV_FORMAT = "meta_machine"
>
> -COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64|atom-pc|routerstationpro|mpc8315e-rdb|beagleboard)"
> +COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
>
>   # this performs a fixup on historical kernel types with embedded _'s
>   python __anonymous () {
> diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
> index 3b4e77e..d4f2ece 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_git.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
> @@ -7,10 +7,6 @@ KMACHINE_qemux86-64  = "yocto/standard/common-pc-64/base"
>   KMACHINE_qemuppc  = "yocto/standard/qemu-ppc32"
>   KMACHINE_qemumips = "yocto/standard/mti-malta32-be"
>   KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
> -KMACHINE_atom-pc  = "yocto/standard/common-pc/atom-pc"
> -KMACHINE_routerstationpro = "yocto/standard/routerstationpro"
> -KMACHINE_mpc8315e-rdb = "yocto/standard/fsl-mpc8315e-rdb"
> -KMACHINE_beagleboard = "yocto/standard/beagleboard"
>
>   KBRANCH = ${KMACHINE}
>   KMETA = meta
> @@ -23,11 +19,6 @@ SRCREV_machine_qemumips = "f5d26f2eda2be8b942172cda8f27de33ebf38ec3"
>   SRCREV_machine_qemuppc = "7eb6c68d977d9039a2b5a734172b064a9d19cdc1"
>   SRCREV_machine_qemux86 = "ad62d1aab734513cd96c8f4517f816420a218e77"
>   SRCREV_machine_qemux86-64 = "b906f358fd404a1e74a961f25079274e0d933ee1"
> -SRCREV_machine_emenlow = "c3bbcb676f929c4fc0511a6e66494b8770d015a1"
> -SRCREV_machine_atom-pc = "b906f358fd404a1e74a961f25079274e0d933ee1"
> -SRCREV_machine_routerstationpro = "95ca94d2e71ca2db6822a37a7f575fa79c3d05d0"
> -SRCREV_machine_mpc8315e-rdb = "53c800c244e73d81d2832f6da306eeae3b09e5dc"
> -SRCREV_machine_beagleboard = "b906f358fd404a1e74a961f25079274e0d933ee1"
>   SRCREV_machine = "b906f358fd404a1e74a961f25079274e0d933ee1"
>   SRCREV_meta = "ecab1e2bc12a8b0c4d064a00acc3260f6e8528c5"
>
> @@ -37,7 +28,7 @@ SRCREV_FORMAT = "meta_machine"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>
> -COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64|mpc8315e-rdb|routerstationpro|beagleboard)"
> +COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
>
>   # Functionality flags
>   KERNEL_REVISION_CHECKING ?= "t"



