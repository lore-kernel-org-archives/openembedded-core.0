Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24Qf-000834-NW
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 20:04:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 10:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="135069621"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 10:52:22 -0700
Message-ID: <502D3356.2000406@linux.intel.com>
Date: Thu, 16 Aug 2012 10:52:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344404123-14649-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1344404123-14649-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] qemu: backport patch to fix pl031 RTC
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
X-List-Received-Date: Thu, 16 Aug 2012 18:04:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/07/2012 10:35 PM, rongqing.li@windriver.com wrote:
> From: Roy.Li <rongqing.li@windriver.com>
>
> Intergrate the patch from:
> http://repo.or.cz/w/qemu.git/commit/13a16f1d91fc7a46b65b22a33f6ffea1b826a097
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 ++++++++++++++++++++
>   meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
>   2 files changed, 43 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
> new file mode 100644
> index 0000000..2ccc663
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
> @@ -0,0 +1,41 @@
> +Upstream-Status: Backport
> +commit 13a16f1d91fc7a46b65b22a33f6ffea1b826a097
> +in git://git.qemu.org/qemu.git master
> +
> +From 13a16f1d91fc7a46b65b22a33f6ffea1b826a097 Mon Sep 17 00:00:00 2001
> +From: Peter Maydell <peter.maydell@linaro.org>
> +Date: Thu, 16 Feb 2012 09:56:10 +0000
> +Subject: [PATCH] hw/pl031: Actually raise interrupt on timer expiry
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fix a typo in pl031_interrupt() which meant we were setting a bit
> +in the interrupt mask rather than the interrupt status register
> +and thus not actually raising an interrupt. This fix allows the
> +rtctest program from the kernel's Documentation/rtc.txt to pass
> +rather than hanging.
> +
> +Reported-by: Daniel Forsgren <daniel.forsgren@enea.com>
> +Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> +Acked-by: Andreas Färber <afaerber@suse.de>
> +---
> + hw/pl031.c |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/hw/pl031.c b/hw/pl031.c
> +index 05b5b11..69abc4f 100644
> +--- a/hw/pl031.c
> ++++ b/hw/pl031.c
> +@@ -76,7 +76,7 @@ static void pl031_interrupt(void * opaque)
> + {
> +     pl031_state *s = (pl031_state *)opaque;
> +
> +-    s->im = 1;
> ++    s->is = 1;
> +     DPRINTF("Alarm raised\n");
> +     pl031_update(s);
> + }
> +--
> +1.7.4.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> index 983e831..a914bcf 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> @@ -3,7 +3,7 @@ require qemu.inc
>   LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                       file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>
> -PR = "r10"
> +PR = "r11"
>
>   FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
>   FILESDIR = "${WORKDIR}"
> @@ -22,6 +22,7 @@ SRC_URI = "\
>       file://dummy-gl-config.patch \
>       file://0001-ppc64-Fix-linker-script.patch \
>       file://ppc-s500-set-invalid-mask.patch \
> +    file://hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch \
>       "
>
>   # Only use the GL passthrough patches for native/nativesdk versions
>

Merged into OE-Core

Thanks
	Sau!



