Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1Qrfsv-0007EJ-C8
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 02:46:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7C0fRYH019853
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Aug 2011 17:41:28 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.18.204) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 11 Aug 2011 17:41:27 -0700
Message-ID: <4E44766F.6090201@windriver.com>
Date: Thu, 11 Aug 2011 20:40:15 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.7; en-US;
	rv:1.9.2.20) Gecko/20110804 Thunderbird/3.1.12
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1313092152.git.dvhart@linux.intel.com>
	<21924dcdc775dde5b7144cf26367663dbc0cfaeb.1313092152.git.dvhart@linux.intel.com>
In-Reply-To: <21924dcdc775dde5b7144cf26367663dbc0cfaeb.1313092152.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] meta-rt: add linux-yocto-rt_3.0 recipe
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
X-List-Received-Date: Fri, 12 Aug 2011 00:46:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11-08-11 7:08 PM, Darren Hart wrote:
> Add the initial linux-yocto-rt_3.0 recipe.
>
> TODO: replace the AUTOREV with real commit ids.

I think you did this!

>
> Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>   meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb |   55 ++++++++++++++++++++
>   1 files changed, 55 insertions(+), 0 deletions(-)
>   create mode 100644 meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
>
> diff --git a/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> new file mode 100644
> index 0000000..7eaeb0f
> --- /dev/null
> +++ b/meta-rt/recipes-kernel/linux/linux-yocto-rt_3.0.bb
> @@ -0,0 +1,55 @@
> +inherit kernel
> +require recipes-kernel/linux/linux-yocto.inc
> +
> +KMACHINE = "yocto/standard/preempt-rt/base"

I just noticed this on the way through, this could likely just
be set to "common-pc", all it really is supposed to be
is a fallback if a machine specific override doesn't work.

(I see that you actually do this in patch 8/10 for 2.6.34 anyway).

> +KMACHINE_qemux86  = "common-pc"
> +KMACHINE_qemux86-64  = "common-pc-64"
> +KMACHINE_qemuarm  = "arm-versatile-926ejs"
> +# qemuppc hangs at boot
> +#KMACHINE_qemuppc  = "qemu-ppc32"
> +# qemumips panics at boot
> +#KMACHINE_qemumips = "mti-malta32-be"
> +
> +KBRANCH = ${KMACHINE}

And instead of the above, you could just say:

KBRANCH = "yocto/standard/preempt-rt/base"

to have a fallback in place that keeps the fetcher chugging along.
That's all that the KMACHINE default was doing in the end anyway.

Sorry I didn't see this earlier, but seeing it in front of me
here, it jumped out.

The rest looks good.

Bruce

> +KBRANCH_qemux86 = "yocto/standard/preempt-rt/base"
> +KBRANCH_qemux86-64 = "yocto/standard/preempt-rt/base"
> +KBRANCH_qemuarm  = "yocto/standard/preempt-rt/base"
> +#KBRANCH_qemuppc  = "yocto/standard/preempt-rt/base"
> +#KBRANCH_qemumips = "yocto/standard/preempt-rt/base"
> +KMETA = meta
> +
> +LINUX_VERSION ?= "3.0"
> +LINUX_KERNEL_TYPE = "preempt-rt"
> +LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
> +
> +SRCREV_machine_qemux86 = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
> +SRCREV_machine_qemux86-64 = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
> +SRCREV_machine_qemuarm = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
> +#SRCREV_machine_qemuppc = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
> +#SRCREV_machine_qemumips = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
> +SRCREV_machine = "7e1e5b6c8a13c615feb0d7b6d37988a094aae98f"
> +SRCREV_meta = "7782fc673afd6a1c742409896ae787560d96fce8"
> +
> +PR = "r0"
> +PV = "${LINUX_VERSION}+git${SRCPV}"
> +SRCREV_FORMAT = "meta_machine"
> +
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
> +
> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
> +
> +# Functionality flags
> +KERNEL_REVISION_CHECKING ?= "t"
> +KERNEL_FEATURES=features/netfilter
> +KERNEL_FEATURES_append=" features/taskstats"
> +KERNEL_FEATURES_append_qemux86=" cfg/sound"
> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
> +
> +YOCTO_KERNEL_META_DATA=t
> +
> +# extra tasks
> +addtask kernel_link_vmlinux after do_compile before do_install
> +addtask validate_branches before do_patch after do_kernel_checkout
> +addtask kernel_configcheck after do_configure before do_compile
> +
> +require recipes-kernel/linux/linux-tools.inc



