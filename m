Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Skb8q-0006Mi-S8
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 15:21:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5TDAkZ5027787
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jun 2012 06:10:46 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 29 Jun 2012 06:10:46 -0700
Message-ID: <4FEDA947.8060105@windriver.com>
Date: Fri, 29 Jun 2012 09:10:31 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<e5738406d99b07701d77d873a5a6c9ea95b4adb2.1340942930.git.dvhart@linux.intel.com>
In-Reply-To: <e5738406d99b07701d77d873a5a6c9ea95b4adb2.1340942930.git.dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] linux-yocto: Use INC_PR and move kernel require to linux-yocto.inc
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
X-List-Received-Date: Fri, 29 Jun 2012 13:21:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-06-29 12:18 AM, Darren Hart wrote:
> When making changes to kernel.bbclass, it would be nice not to have to
> manually change the PR of every linux-yocto*.bb file that requires it.
>
> Move the "require kernel" line to linux-yocto.inc and update the
> linux-yocto recipes to use INC_PR.

Looks good. I've been getting ready to change this myself .. saves me
the work!

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> CC: Bruce Ashfield<bruce.ashfield@windriver.com>
> CC: Tom Zanussi<tom.zanussi@intel.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    3 +--
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    3 +--
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    3 +--
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    3 +--
>   meta/recipes-kernel/linux/linux-yocto.inc         |    3 +++
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb      |    3 +--
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    3 +--
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    3 +--
>   8 files changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> index 1de0411..1dd95c6 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> @@ -1,4 +1,3 @@
> -inherit kernel
>   require recipes-kernel/linux/linux-yocto.inc
>
>   KBRANCH = "yocto/standard/preempt-rt/base"
> @@ -12,7 +11,7 @@ SRCREV_machine ?= "e67428d9966eecec4c081993dc64ceb5c0e64643"
>   SRCREV_machine_qemuppc ?= "dcca458cb92cc287f70e4062f02460f36a881b16"
>   SRCREV_meta ?= "d282029891bba5440630a885b940dea5e34e3e2c"
>
> -PR = "r2"
> +PR = "${INC_PR}.0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
> index ada66b8..cf88fae 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
> @@ -1,4 +1,3 @@
> -inherit kernel
>   require recipes-kernel/linux/linux-yocto.inc
>
>   KBRANCH = "standard/preempt-rt/base"
> @@ -13,7 +12,7 @@ SRCREV_machine ?= "c413f23eafb3e91ff98653e578e771532fd71be9"
>   SRCREV_machine_qemuppc ?= "d7020ba154df03cba5351011ff664f5e3e1ce678"
>   SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
>
> -PR = "r1"
> +PR = "${INC_PR}.0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> index 9b77186..fde9020 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
> @@ -1,4 +1,3 @@
> -inherit kernel
>   require recipes-kernel/linux/linux-yocto.inc
>
>   KBRANCH = "standard/preempt-rt/base"
> @@ -13,7 +12,7 @@ SRCREV_machine ?= "4a688295a1c6d44f3eea409d51a0344c8830d829"
>   SRCREV_machine_qemuppc ?= "83843542dd524007547eddba507690cd4bab393b"
>   SRCREV_meta ?= "d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0"
>
> -PR = "r0"
> +PR = "${INC_PR}.0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
> index 546971b..78337fb 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
> @@ -1,4 +1,3 @@
> -inherit kernel
>   require recipes-kernel/linux/linux-yocto.inc
>
>   # We need lzma (as CONFIG_KERNEL_LZMA=y)
> @@ -13,7 +12,7 @@ LINUX_VERSION ?= "3.2.18"
>   SRCREV_machine ?= "27b68a93eb791e830da8d3a2c0fc99780897ad89"
>   SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
>
> -PR = "r0"
> +PR = "${INC_PR}.0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 0912bee..2e01946 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -4,6 +4,8 @@ LICENSE = "GPLv2"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>
> +INC_PR = "r0"
> +
>   # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>   # by the kernel. This is typically the branch that should be built,
>   # and it can be specific to the machine or shared
> @@ -23,6 +25,7 @@ do_patch[depends] = "kern-tools-native:do_populate_sysroot"
>   addtask kernel_configme before do_configure after do_patch
>
>   # Pick up shared functions
> +inherit kernel
>   inherit kernel-yocto
>   require linux-dtb.inc
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> index 362e65a..d178cd0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
> @@ -1,4 +1,3 @@
> -inherit kernel
>   require recipes-kernel/linux/linux-yocto.inc
>
>   KBRANCH = "yocto/standard/base"
> @@ -20,7 +19,7 @@ SRCREV_machine_qemux86-64 ?= "cba836a545fbeb96f6f2392c3ecbac9d7735fa65"
>   SRCREV_machine ?= "bd6ad607c754dea30d91502a237870b4c45e0f1b"
>   SRCREV_meta ?= "d282029891bba5440630a885b940dea5e34e3e2c"
>
> -PR = "r4"
> +PR = "${INC_PR}.0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> index 3e4a9dd..1e9a1d1 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
> @@ -1,4 +1,3 @@
> -inherit kernel
>   require recipes-kernel/linux/linux-yocto.inc
>
>   KBRANCH = "standard/default/base"
> @@ -18,7 +17,7 @@ SRCREV_machine_qemux86-64 ?= "dd488f551fa0f8e3bf1aadd78083b8547bba8bdf"
>   SRCREV_machine ?= "76133a1cadf0de417c29ed15d6fbb12c41c0802b"
>   SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
>
> -PR = "r1"
> +PR = "${INC_PR}.0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   KMETA = "meta"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> index 7d14967..0247d24 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> @@ -1,4 +1,3 @@
> -inherit kernel
>   require recipes-kernel/linux/linux-yocto.inc
>
>   KBRANCH = "standard/base"
> @@ -22,7 +21,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckou
>
>   LINUX_VERSION ?= "3.4.3"
>
> -PR = "r0"
> +PR = "${INC_PR}.0"
>   PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   KMETA = "meta"



