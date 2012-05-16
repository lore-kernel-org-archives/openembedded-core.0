Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUj1C-0007zr-HY
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:32:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2012 11:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141379808"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2012 11:22:11 -0700
Message-ID: <4FB3F050.9000706@linux.intel.com>
Date: Wed, 16 May 2012 21:22:08 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <2c51f2017955dff27ab68c1f4165309567864ee5.1336522880.git.raj.khem@gmail.com>
	<096c4f3ac2f83fc08064afcec5a05824bb96b94e.1336522880.git.raj.khem@gmail.com>
In-Reply-To: <096c4f3ac2f83fc08064afcec5a05824bb96b94e.1336522880.git.raj.khem@gmail.com>
Subject: Re: [PATCH 3/3] xserver-xorg: Fix build on powerpc
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
X-List-Received-Date: Wed, 16 May 2012 18:32:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2012 03:27 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../xorg-xserver/xserver-xorg-1.11.2.inc           |    9 +++--
>   .../xserver-xorg-1.11.2/gcc-47-warning.patch       |   33 ++++++++++++++++++++
>   2 files changed, 38 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index f5fa629..6a86af4 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -1,10 +1,11 @@
> -SRC_URI += "file://crosscompile.patch"
> -
>   # Misc build failure for master HEAD
> -SRC_URI += "file://fix_open_max_preprocessor_error.patch"
> +SRC_URI += "file://crosscompile.patch \
> +            file://fix_open_max_preprocessor_error.patch \
> +            file://gcc-47-warning.patch \
> +           "
>
>   SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
>   SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
>
> -PR = "r1"
> +PR = "r2"
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
> new file mode 100644
> index 0000000..ed4eaac
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/gcc-47-warning.patch
> @@ -0,0 +1,33 @@
> +This patch fixes errors on powerpc like below
> +
> +| lnx_video.c: In function 'unmapVidMem':
> +| lnx_video.c:472:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> +
> +Its in 1.12 branch
> +
> +http://cgit.freedesktop.org/xorg/xserver/commit/?h=server-1.12-branch&id=eb3377ffb8a7baa26c9831e56ed782d48b28fa71
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Index: xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c
> +===================================================================
> +--- xorg-server-1.11.2.orig/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:32:34.186489019 -0700
> ++++ xorg-server-1.11.2/hw/xfree86/os-support/linux/lnx_video.c	2012-05-01 06:49:14.926537452 -0700
> +@@ -469,11 +469,11 @@
> + static void
> + unmapVidMem(int ScreenNum, pointer Base, unsigned long Size)
> + {
> +-    memType alignOff = (memType)Base
> +-	- ((memType)Base&  ~(getpagesize() - 1));
> ++    uintptr_t alignOff = (uintptr_t)Base
> ++	- ((uintptr_t)Base&  ~(getpagesize() - 1));
> +
> +-    DebugF("alignment offset: %lx\n",alignOff);
> +-    munmap((caddr_t)((memType)Base - alignOff), (Size + alignOff));
> ++    DebugF("alignment offset: %lx\n",(unsigned long)alignOff);
> ++    munmap((void*)((uintptr_t)Base - alignOff), (Size + alignOff));
> + }
> +
> +


Merged into OE-Core

Thanks
	Sau!


