Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0DCB0615AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 19:38:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Nov 2013 11:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,746,1378882800"; d="scan'208";a="437537254"
Received: from unknown (HELO [10.255.15.149]) ([10.255.15.149])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2013 11:38:08 -0800
Message-ID: <528E6120.1020805@linux.intel.com>
Date: Thu, 21 Nov 2013 11:38:08 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1385062552-3945-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1385062552-3945-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [dora][PATCH] Qemu:Arm:versatilepb: Add memory size checking
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
X-List-Received-Date: Thu, 21 Nov 2013 19:38:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2013 11:35 AM, Mark Hatle wrote:
> From: Jiang Lu <lu.jiang@windriver.com>
>
> The machine can not work with memory over 256M, so add a checking
> at startup. If the memory size exceed 256M, just stop emulation then
> throw out warning about memory limitation.
>
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> ---
>   ...-Arm-versatilepb-Add-memory-size-checking.patch | 34 ++++++++++++++++++++++
>   meta/recipes-devtools/qemu/qemu_1.5.0.bb           |  1 +
>   2 files changed, 35 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
>
> diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
> new file mode 100644
> index 0000000..ef1090b
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
> @@ -0,0 +1,34 @@
> +From 896fa02c24347e6e9259812cfda187b1d6ca6199 Mon Sep 17 00:00:00 2001
> +From: Jiang Lu <lu.jiang@windriver.com>
> +Date: Wed, 13 Nov 2013 10:38:08 +0800
> +Subject: [PATCH] Qemu:Arm:versatilepb: Add memory size checking
> +
> +The machine can not work with memory over 256M, so add a checking
> +at startup. If the memory size exceed 256M, just stop emulation then
> +throw out warning about memory limitation.
> +
No Upstream-Status: tag

Sau!

> +Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> +---
> + hw/arm/versatilepb.c |    6 ++++++
> + 1 files changed, 6 insertions(+), 0 deletions(-)
> +
> +diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> +index 753757e..0906377 100644
> +--- a/hw/arm/versatilepb.c
> ++++ b/hw/arm/versatilepb.c
> +@@ -193,6 +193,12 @@ static void versatile_init(QEMUMachineInitArgs *args, int board_id)
> +         fprintf(stderr, "Unable to find CPU definition\n");
> +         exit(1);
> +     }
> ++    if (ram_size > (256 << 20)) {
> ++        fprintf(stderr,
> ++                "qemu: Too much memory for this machine: %d MB, maximum 256 MB\n",
> ++                ((unsigned int)ram_size / (1 << 20)));
> ++        exit(1);
> ++    }
> +     memory_region_init_ram(ram, "versatile.ram", args->ram_size);
> +     vmstate_register_ram_global(ram);
> +     /* ??? RAM should repeat to fill physical memory space.  */
> +--
> +1.7.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_1.5.0.bb b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
> index 06c2cdb..f8c60e8 100644
> --- a/meta/recipes-devtools/qemu/qemu_1.5.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
> @@ -7,6 +7,7 @@ SRC_URI += "file://fdt_header.patch \
>               file://target-i386-Fix-aflag-logic-for-CODE64-and-the-0x67-.patch \
>               file://target-ppc_fix_bit_extraction.patch \
>               file://fxrstorssefix.patch \
> +            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>              "
>
>   SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
>

