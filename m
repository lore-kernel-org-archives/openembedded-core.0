Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7ACC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 19:19:48 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.3050.1724181586323084503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 12:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zw2FXfWg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E1D1240003;
	Tue, 20 Aug 2024 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724181584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ThPV1D1pSrqRmDE+SWcrZhCm+5eIBdXeVN1WcCyjr+E=;
	b=Zw2FXfWg4IPTLM/hiFyt8u/w2PRrZ7TWftbSVBARZKB0uY6OsjQy2Gdp+a9018lA9hKpaM
	8pIMgKzi2LVPdeVkijld8UKy/gf2L60xdzD2pn8DIFn5LCxDtmGRic0sNak3BZH94nf1Cl
	hHzdhaC5jat2XNcVTQk9sUiaTUhABvp2BsjF2ZehM0Svy4NfAPGpYO6zR4qnMI9ED+nXsD
	+SjcdoGat52pSb71KD+f/zwqyAvLLLbZcP5BZgR7OR8negIJw2QFKi6Gjs2CGafRhi1ON4
	REYPasuRyfCJKqGMgl+MvUosL5fOwD+o9bQKXrtnE8qqHR90n3Vrrku2CyykoA==
Date: Tue, 20 Aug 2024 21:19:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5] util-linux: Add PACKAGECONFIG option to
 mitigate rootfs remount error
Message-ID: <20240820191943c7d1348a@mail.local>
References: <20240819182649.128659-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819182649.128659-1-niko.mauno@vaisala.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 19:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203565

Hello,

arm64 fails to build with this patch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9356/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/4727/steps/13/logs/stdio


On 19/08/2024 18:26:49+0000, Niko Mauno via lists.openembedded.org wrote:
> The 2.39 version of util-linux took new file descriptors based mount
> kernel API into use. In relation to this change, the upstream release
> notes in
> https://github.com/util-linux/util-linux/blob/v2.39/Documentation/releases/v2.39-ReleaseNotes#L14-L21
> mention that
> 
>   This change is very aggressive to libmount code, but hopefully, it does not introduce regressions in traditional mount(8) behavior.
> 
> After observing following failure when booting a board using a bit
> older 6.1 series kernel together with initramfs rootfs based boot flow
> 
>   [FAILED] Failed to start Remount Root and Kernel File Systems.
>   See 'systemctl status systemd-remount-fs.service' for details.
> 
> closer inspection revealed:
> 
>   demoboard ~ # systemctl status -l systemd-remount-fs.service
>   x systemd-remount-fs.service - Remount Root and Kernel File Systems
>        Loaded: loaded (/usr/lib/systemd/system/systemd-remount-fs.service; enabled-runtime; preset: disabled)
>        Active: failed (Result: exit-code) since Wed 2024-08-14 14:53:48 UTC; 1min 22s ago
>          Docs: man:systemd-remount-fs.service(8)
>                https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>       Process: 76 ExecStart=/usr/lib/systemd/systemd-remount-fs (code=exited, status=1/FAILURE)
>      Main PID: 76 (code=exited, status=1/FAILURE)
> 
>   Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bin/mount for / exited with exit status 32.
>   Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: /: mount point not mounted or bad option.
>   Aug 14 14:53:48 demoboard systemd-remount-fs[81]:        dmesg(1) may have more information after failed mount system call.
>   Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Main process exited, code=exited, status=1/FAILURE
>   Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Failed with result 'exit-code'.
>   Aug 14 14:53:48 demoboard systemd[1]: Failed to start Remount Root and Kernel File Systems.
> 
> also consequentially, 'systemctl status' reported:
> 
>   State: degraded
> 
> When issuing 'strace -ff mount -o remount /' the failure occurred at
> 
>   mount_setattr(3, "", AT_EMPTY_PATH, {attr_set=MOUNT_ATTR_RDONLY|MOUNT_ATTR_NOATIME|MOUNT_ATTR_NODIRATIME, attr_clr=MOUNT_ATTR_NOSUID|MOUNT_ATTR_NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATTR_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_ATTR_NOSYMFOLLOW|0x40, propagation=0 /* MS_??? */, userns_fd=0}, 32) = -1 EINVAL (Invalid argument)
> 
> After further investigation, The issue was pinpointed to lack of Linux
> kernel commit
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=95de4ad173ca0e61034f3145d66917970961c210
> ("fs: relax mount_setattr() permission checks") in the kernel version
> that was being used. Above mitigation was discussed in email related to
> then-rejected CVE-2024-26821:
> https://lore.kernel.org/linux-cve-announce/2024051606-imaging-entrench-b327@gregkh/T/
> 
> After testing with qemuarm64 machine different linux-yocto versions,
> it was observed that the issue impacts following versions of currently
> supported LTS kernels:
>  - 6.6.17 (fixed since 6.6.18 i.e. mount_setattr() returns 0)
>  - 6.1.78 (fixed since 6.1.79 i.e. mount_setattr() returns 0)
>  - 5.15.164 which is currently the newest of 5.15.y series (i.e. no
>    known working version)
> 
> Taking the above findings into consideration, add a new PACKAGECONFIG
> option removing which enables users to opt-out from using the feature
> which can cause issues with a bit older kernels.
> 
> Versions 5.10.223, 5.4.279 and 4.10.317 were also tested but the issue
> was not reproduced with those versions - using strace showed that the
> mount_setattr call associated with the new mount API problem was not
> issued with these LTS kernel versions, which seemed to be confirmed
> also by following libmount debug message in these cases:
> 
>   415: libmount:     HOOK: [0x7fa115e818]: failed to init new API
> 
> Note: In addition to the aforementioned, this change was
> tested also briefly using the current latest kernel versions 6.1.104,
> 6.6.45 and 6.10.3 that using the old mount API with newest kernels
> did not introduce any observable regression to the boot flow.
> 
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  .../util-linux/util-linux_2.40.1.bb             | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> index a1aab94055..ef2384fe52 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> @@ -89,8 +89,14 @@ EXTRA_OECONF:append = " --disable-hwclock-gplv3"
>  # this helps to keep same expectations when using the SDK or
>  # build host versions during development
>  #
> -PACKAGECONFIG ?= "pcre2"
> -PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2', '', d)}"
> +PACKAGECONFIG ?= "\
> +    libmount-mountfd-support \
> +    pcre2 \
> +"
> +PACKAGECONFIG:class-target ?= "\
> +    libmount-mountfd-support \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam lastlog2', '', d)} \
> +"
>  # inherit manpages requires this to be present, however util-linux does not have
>  # configuration options, and installs manpages always
>  PACKAGECONFIG[manpages] = ""
> @@ -107,6 +113,13 @@ PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
>  PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
>  PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
>  PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
> +# Using the new file descriptors based mount kernel API can cause rootfs remount failure with some older kernels.
> +# Of currently supported LTS kernels, the old mount API should be used with:
> +# - versions prior to 6.6.18 in the 6.6.y series.
> +# - versions prior to 6.1.79 in the 6.1.y series.
> +# - versions till at least 5.15.164 in the 5.15.y series.
> +# - with 5.10.y, 5.4.y and 4.19.y series kernels, libmount seemed to use the old API regardless of this option.
> +PACKAGECONFIG[libmount-mountfd-support] = "--enable-libmount-mountfd-support,--disable-libmount-mountfd-support"
>  
>  EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
>  
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203518): https://lists.openembedded.org/g/openembedded-core/message/203518
> Mute This Topic: https://lists.openembedded.org/mt/107986659/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

