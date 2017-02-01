Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF2E7732A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:57:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2017 06:57:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="1089690947"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.141])
	([10.219.128.141])
	by orsmga001.jf.intel.com with ESMTP; 01 Feb 2017 06:57:40 -0800
To: Tom Hochstein <tom.hochstein@nxp.com>,
	openembedded-core@lists.openembedded.org
References: <1485892109-2868-1-git-send-email-tom.hochstein@nxp.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <bd10d24c-efb8-502e-b5d5-de81ee576c47@linux.intel.com>
Date: Wed, 1 Feb 2017 09:04:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485892109-2868-1-git-send-email-tom.hochstein@nxp.com>
Subject: Re: [PATCH] xserver-xorg: Fix X server 1.19 crash
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
X-List-Received-Date: Wed, 01 Feb 2017 14:57:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/31/2017 01:48 PM, Tom Hochstein wrote:
> Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of
> useSIGIO option:
>
> xfree86 SIGIO support is reworked to use internal versions of
> OsBlockSIGIO and OsReleaseSIGIO
>
> The check for useSIGIO is no longer needed.
>
> Upstream-Status: Pending

patchtest complained because the Upstream-Status must be in the patch 
you are adding, not inside the commit description.

>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>   .../0003-Remove-check-for-useSIGIO-option.patch    | 45 ++++++++++++++++++++++
>   .../xorg-xserver/xserver-xorg_1.19.1.bb            |  1 +
>   2 files changed, 46 insertions(+)
>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
> new file mode 100644
> index 0000000..db2d845
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
> @@ -0,0 +1,45 @@
> +From cf407b16cd65ad6e26a9c8e5984e163409a5c0f7 Mon Sep 17 00:00:00 2001
> +From: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
> +Date: Mon, 30 Jan 2017 16:32:06 -0600
> +Subject: [PATCH] Remove check for useSIGIO option
> +
> +Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of useSIGIO
> +option.
> +
> +As the xfree86 SIGIO support is reworked to use internal versions of OsBlockSIGIO
> +and OsReleaseSIGIO.
> +
> +No longer the check for useSIGIO is needed
> +
> +Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
> +---
> + hw/xfree86/os-support/shared/sigio.c | 6 ------
> + 1 file changed, 6 deletions(-)
> +
> +diff --git a/hw/xfree86/os-support/shared/sigio.c b/hw/xfree86/os-support/shared/sigio.c
> +index 884a71c..be76498 100644
> +--- a/hw/xfree86/os-support/shared/sigio.c
> ++++ b/hw/xfree86/os-support/shared/sigio.c
> +@@ -185,9 +185,6 @@ xf86InstallSIGIOHandler(int fd, void (*f) (int, void *), void *closure)
> +     int i;
> +     int installed = FALSE;
> +
> +-    if (!xf86Info.useSIGIO)
> +-        return 0;
> +-
> +     for (i = 0; i < MAX_FUNCS; i++) {
> +         if (!xf86SigIOFuncs[i].f) {
> +             if (xf86IsPipe(fd))
> +@@ -256,9 +253,6 @@ xf86RemoveSIGIOHandler(int fd)
> +     int max;
> +     int ret;
> +
> +-    if (!xf86Info.useSIGIO)
> +-        return 0;
> +-
> +     max = 0;
> +     ret = 0;
> +     for (i = 0; i < MAX_FUNCS; i++) {
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
> index 987a2be..5a657e0 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
> @@ -3,6 +3,7 @@ require xserver-xorg.inc
>   SRC_URI += "file://musl-arm-inb-outb.patch \
>               file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
>               file://0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch \
> +            file://0003-Remove-check-for-useSIGIO-option.patch \
>               "
>   SRC_URI[md5sum] = "caa8ee7b2950abbf734347d137529fb6"
>   SRC_URI[sha256sum] = "79ae2cf39d3f6c4a91201d8dad549d1d774b3420073c5a70d390040aa965a7fb"


