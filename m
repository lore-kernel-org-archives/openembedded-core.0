Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CFF936013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 15:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2DFxTAU017218; Fri, 13 Mar 2015 15:59:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nrkF2qYO6WRW; Fri, 13 Mar 2015 15:59:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2DFxEGm017186
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Mar 2015 15:59:25 GMT
Message-ID: <1426262354.9114.211.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Naresh Bhat <naresh.bhat@linaro.org>
Date: Fri, 13 Mar 2015 15:59:14 +0000
In-Reply-To: <1426258527-2329-3-git-send-email-naresh.bhat@linaro.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
	<1426258527-2329-3-git-send-email-naresh.bhat@linaro.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: matt.fleming@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core v1 PATCH 2/5] syslinux: Remove bootimg dependency on aarch64
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
X-List-Received-Date: Fri, 13 Mar 2015 15:59:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-03-13 at 20:25 +0530, Naresh Bhat wrote:
> Remove the bootimg dependency as syslinux for aarch64. The reason to skip the syslinux package
> - syslinux package contains x86 assembly code. Hence it cannot be compiled on aarch64.
> - There is no BIOS on aarch64 to answer syscalls.
> 
> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> ---
>  meta/classes/syslinux.bbclass |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
> index d6498d9..7bd8fed 100644
> --- a/meta/classes/syslinux.bbclass
> +++ b/meta/classes/syslinux.bbclass
> @@ -17,7 +17,15 @@
>  # ${SYSLINUX_SERIAL_TTY} - Set alternate console=tty... kernel boot argument
>  # ${SYSLINUX_KERNEL_ARGS} - Add additional kernel arguments
>  
> -do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
> +def boot_image_depends(bb, d):
> +         import re
> +         deps = bb.data.getVar('TARGET_PREFIX', d, True)
> +         if re.search("(x86_64|i.86).*",deps):
> +                 return "${MLPREFIX}syslinux:do_populate_sysroot"
> +         if re.search("aarch64",deps):
> +                 return ""
> +BIMGDEP = "${@boot_image_depends(bb, d)}"
> +do_bootimg[depends] += "${BIMGDEP} \
>                          syslinux-native:do_populate_sysroot"

How about something simpler like:

EXTRABOOTIMGDEPS = ""
EXTRABOOTIMGDEPS_x86 = "${MLPREFIX}syslinux:do_populate_sysroot"
EXTRABOOTIMGDEPS_x86-64 = "${MLPREFIX}syslinux:do_populate_sysroot"

?

Cheers,

Richard


