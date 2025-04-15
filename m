Return-Path: <bst@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EC7C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:11:54 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.19693.1744722709723305509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: bst@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1u4g4q-0001KM-3J; Tue, 15 Apr 2025 15:11:48 +0200
Message-ID: <93208223-1610-45f6-92d5-dfbe60181211@pengutronix.de>
Date: Tue, 15 Apr 2025 15:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH oe-core 1/4] initramfs-framework: make
 RDEPENDS/RRECOMMENDS base package-specific
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
References: <20250415130608.1804620-1-bst@pengutronix.de>
From: Bastian Krause <bst@pengutronix.de>
In-Reply-To: <20250415130608.1804620-1-bst@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214851

On 4/15/25 3:06 PM, Bastian Krause wrote:
> initramfs-framework itself is a meta package. It cannot be referenced in
> PACKAGE_INSTALL directly, so the RDEPENDS/RRECOMMENDS do not have an
> effect. So turn them into directives for initramfs-framework-base
> instead.
> 
> Currently all users of initramfs-framework-* add
> ${VIRTUAL-RUNTIME_base-utils} explicitly to PACKAGE_INSTALL. For
> `PACKAGE_CLASSES = "package_rpm"`, a dependency for `/bin/sh` is added by
> RPM's shebang detection further hiding this issue.

Initially I stumbled upon this in a custom initramfs image with:

   PACAKGE_INSTALL = "initramfs-framework-base"

Having PACKAGE_CLASSES = "package_ipk", the initramfs did not contain a
shell. With PACKAGE_CLASSES = "package_rpm" however, busybox appeared
(unexpectedly) in the image.

Checking the rpm package's dependencies:

   $ rpm -qp build/tmp/deploy/rpm/noarch/initramfs-framework-base-1.0-r0.noarch.rpm --requires
   warning: Found bdb_ro Packages database while attempting sqlite backend: using bdb_ro backend.
   /bin/sh
   rpmlib(CompressedFileNames) <= 3.0.4-1
   rpmlib(FileDigests) <= 4.6.0-1
   rpmlib(PayloadFilesHavePrefix) <= 4.0-1
   rpmlib(PayloadIsZstd) <= 5.4.18-1

The shebang in the initramfs-framework-base scripts is added as a
dependency, pulling in busybox in my case.

Now I'm wondering if that's expected. I'm surprised that switching the
package manager results in additional dependencies getting pulled in.

This seems to have caused issues before, e.g.:

   https://git.yoctoproject.org/poky/commit/?id=bc5d66e793b0750e540e9dac4608b8eb9644590e

Regards,
Bastian


> 
> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> ---
>   meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index bb4984366d..184da4f39d 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -1,8 +1,6 @@
>   SUMMARY = "Modular initramfs system"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> -RDEPENDS:${PN} += "${VIRTUAL-RUNTIME_base-utils}"
> -RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
>   
>   
>   inherit allarch
> @@ -72,6 +70,7 @@ PACKAGES = "${PN}-base \
>              "
>   
>   FILES:${PN}-base = "/init /init.d/99-finish /dev"
> +RDEPENDS:${PN}-base += "${VIRTUAL-RUNTIME_base-utils}"
>   
>   # 99-finish in base depends on some other module which mounts
>   # the rootfs, like 90-rootfs. To replace that default, use
> @@ -79,7 +78,7 @@ FILES:${PN}-base = "/init /init.d/99-finish /dev"
>   # initramfs recipe and install something else, or install
>   # something that runs earlier (for example, a 89-my-rootfs)
>   # and mounts the rootfs. Then 90-rootfs will proceed immediately.
> -RRECOMMENDS:${PN}-base += "initramfs-module-rootfs"
> +RRECOMMENDS:${PN}-base += "initramfs-module-rootfs ${VIRTUAL-RUNTIME_base-utils-syslog}"
>   
>   SUMMARY:initramfs-module-exec = "initramfs support for easy execution of applications"
>   RDEPENDS:initramfs-module-exec = "${PN}-base"


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

