Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHVe-0005zZ-J5
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:12:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 10:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="165844158"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2012 10:01:19 -0700
Message-ID: <4FFB0E5F.20904@linux.intel.com>
Date: Mon, 09 Jul 2012 10:01:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341598524-5354-1-git-send-email-msm@freescale.com>
In-Reply-To: <1341598524-5354-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] qemu-0.15.1: add patch to fix compilatation problems on powerpc
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
X-List-Received-Date: Mon, 09 Jul 2012 17:12:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/06/2012 11:15 AM, Matthew McClintock wrote:
> ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/log.do_compile.28447 for further information)
> ERROR: Logfile of failure stored in: /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/log.do_compile.28447
> Log data follows:
> | DEBUG: SITE files ['endian-big', 'bit-64', 'powerpc-common', 'common-linux', 'common-glibc', 'powerpc-linux', 'powerpc64-linux', 'common']
> | ERROR: Function failed: do_compile (see /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/temp/log.do_compile.28447 for further information)
> | NOTE: make -j 24
> |   LINK  ppc-linux-user/qemu-ppc
> | /opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/sysroots/x86_64-linux/usr/libexec/ppc64e5500-fsl-linux/gcc/powerpc64-fsl-linux/4.6.4/ld:/opt/yocto/cache-build/p5020ds-64b/build_p5020ds-64b_release/tmp/work/ppc64e5500-fsl-linux/qemu-0.15.1-r6/qemu-0.15.1/ppc64.ld:84: syntax error
> | collect2: ld returned 1 exit status
> | make[1]: *** [qemu-ppc] Error 1
> | make: *** [subdir-ppc-linux-user] Error 2
> | make: *** Waiting for unfinished jobs....
> | ERROR: oe_runmake failed
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 ++++++++++++++++++++
>   meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
>   2 files changed, 48 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch b/meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
> new file mode 100644
> index 0000000..d64d76f
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
> @@ -0,0 +1,46 @@
> +Upstream-Status: Backport
> +
> +From 7c0a3409627604c111d5c5e1ce4e0224c2b56315 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
> +Date: Tue, 4 Oct 2011 05:14:52 +0000
> +Subject: [PATCH] ppc64: Fix linker script
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Since commit 8733f609 (Fix linker scripts) linking on Linux/ppc64 fails:
> +
> +  LINK  ppc64-linux-user/qemu-ppc64
> +/usr/lib64/gcc/powerpc64-suse-linux/4.3/../../../../powerpc64-suse-linux/bin/ld:/home/afaerber/qemu/ppc64.ld:84: syntax error
> +collect2: ld gab 1 als Ende-Status zurück
> +make[1]: *** [qemu-ppc64] Fehler 1
> +make: *** [subdir-ppc64-linux-user] Fehler 2
> +
> +Fix by removing a leftover line in the ppc64 linker script.
> +
> +Cc: Gerd Hoffmann <kraxel@redhat.com>
> +Cc: Blue Swirl <blauwirbel@gmail.com>
> +Signed-off-by: Andreas Färber <afaerber@suse.de>
> +Signed-off-by: Alexander Graf <agraf@suse.de>
> +---
> + ppc64.ld |    4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ppc64.ld b/ppc64.ld
> +index 0059ee5..0a7c0dd 100644
> +--- a/ppc64.ld
> ++++ b/ppc64.ld
> +@@ -81,8 +81,8 @@ SECTIONS
> +   .sdata2         : { *(.sdata2 .sdata2.* .gnu.linkonce.s2.*) }
> +   .sbss2          : { *(.sbss2 .sbss2.* .gnu.linkonce.sb2.*) }
> +   .eh_frame_hdr : { *(.eh_frame_hdr) }
> +-*(.gcc_except_table.*) } /* Adjust the address for the data segment.  We want to
> +-adjust up to +     the same address within the page on the next page up.  */
> ++  /* Adjust the address for the data segment.  We want to adjust up to
> ++     the same address within the page on the next page up.  */
> +   . = ALIGN (0x10000) - ((0x10000 - .) & (0x10000 - 1)); . = DATA_SEGMENT_ALIGN
> + (0x10000, 0x1000);   /* Exception handling  */
> +   .eh_frame       : { KEEP (*(.eh_frame)) }
> +--
> +1.7.10
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> index bcff9f8..2cc59f6 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> @@ -3,7 +3,7 @@ require qemu.inc
>   LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                       file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>
> -PR = "r8"
> +PR = "r9"
>
>   FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
>   FILESDIR = "${WORKDIR}"
> @@ -20,6 +20,7 @@ SRC_URI = "\
>       file://arm-bgr.patch \
>       file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
>       file://dummy-gl-config.patch \
> +    file://0001-ppc64-Fix-linker-script.patch \
>       "
>
>   # Only use the GL passthrough patches for native/nativesdk versions
>



