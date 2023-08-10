Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B134C04A94
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 11:50:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.15176.1691668208626661573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 04:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Hl8ZttK3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53327C0009;
	Thu, 10 Aug 2023 11:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691668206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7YeEohShCOBeTDF54gTxLrdahobMRDmyymOCxsrk7KU=;
	b=Hl8ZttK3NuQNXGjuYlOfmtLAdB9qcz6nT48yJmqZ9SBaFjdC547SuKdObC6JxWuX0MHNNj
	ykq4K+d2V0RUmWy0hbltA8zgbCnUYodnNPrk3aNmESNCZV+NNc1x5tBLMAFmdhJW5NC3mz
	LnNvyH4Yt/3fdGzqhcR56fqPDSOH8lBo3j4t3GNSrc+49OHikylr6mjWYuCPdusKenl4id
	MDuCZyG86NLdKKPE20Nm2CalM3meN4sdcj6c0T+XbxP5uIZn8Uh/0HZbPdFy4A+G616mvm
	0BoKMN8f+RdglGW4fphb+PseA3hroUmKqOUDQdIVW0WZBfGGCis8pk5BIjb2QQ==
Date: Thu, 10 Aug 2023 13:50:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Subject: Re: [OE-core] [PATCH v2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
Message-ID: <2023081011500664548dca@mail.local>
References: <20230805110643.2708376-1-luca.boccassi@gmail.com>
 <20230805213551.2737605-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230805213551.2737605-1-luca.boccassi@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 11:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185738

Hello,

This breaks most of the tests on the autobuilders, I guess you will have
to also update the distribution configuration.

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3326/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5581/steps/14/logs/stdio

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-graphics/wayland/weston_12.0.1.bb DEPENDS on or otherwise requires it)
systemd PROVIDES udev but was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (in DISTRO_FEATURES)
ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-graphics/wayland/weston_12.0.1.bb, /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-core/psplash/psplash_git.bb, /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-core/dbus/dbus_1.14.8.bb, /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-core/seatd/seatd_0.7.0.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Nothing RPROVIDES 'systemd' (but /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-core/packagegroups/packagegroup-core-boot.bb RDEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)





On 05/08/2023 22:35:51+0100, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Support for unmerged-usr is deprecated upstream, taints the system and
> has been removed for v255 (next release).
> Enforce building merged-usr images when using systemd. This allows one
> release cycle where it can be tested for any remaining issue, and can
> still be overridden, before it stops working completely.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: rearrange so systemd-boot.bb is left as-is for now
> 
>  meta/recipes-core/systemd/systemd-compat-units.bb      | 3 ++-
>  meta/recipes-core/systemd/systemd-conf_1.0.bb          | 3 +++
>  meta/recipes-core/systemd/systemd-machine-units_1.0.bb | 3 ++-
>  meta/recipes-core/systemd/systemd-serialgetty.bb       | 3 ++-
>  meta/recipes-core/systemd/systemd_254.bb               | 6 +++++-
>  5 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
> index 55ebf99117f..75b1045728a 100644
> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> @@ -14,7 +14,8 @@ INHIBIT_DEFAULT_DEPS = "1"
>  
>  ALLOW_EMPTY:${PN} = "1"
>  
> -REQUIRED_DISTRO_FEATURES = "systemd"
> +REQUIRED_DISTRO_FEATURES += "systemd"
> +REQUIRED_DISTRO_FEATURES += "usrmerge"
>  
>  SYSTEMD_DISABLED_SYSV_SERVICES = " \
>    busybox-udhcpc \
> diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> index 61ce7939d3a..2355936631e 100644
> --- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
> +++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> @@ -5,6 +5,9 @@ DefaultTimeoutStartSec setting."
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES += "usrmerge"
> +
>  PE = "1"
>  
>  PACKAGECONFIG ??= "dhcp-ethernet"
> diff --git a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
> index 12f27d6ae30..7e59e86f9be 100644
> --- a/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
> +++ b/meta/recipes-core/systemd/systemd-machine-units_1.0.bb
> @@ -7,7 +7,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PR = "r19"
>  
> -inherit systemd
> +inherit systemd features_check
> +REQUIRED_DISTRO_FEATURES += "usrmerge"
>  SYSTEMD_SERVICE:${PN} = ""
>  
>  ALLOW_EMPTY:${PN} = "1"
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
> index fd888bb8340..c2c67e6fe08 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -14,7 +14,8 @@ S = "${WORKDIR}"
>  
>  # As this package is tied to systemd, only build it when we're also building systemd.
>  inherit features_check
> -REQUIRED_DISTRO_FEATURES = "systemd"
> +REQUIRED_DISTRO_FEATURES += "systemd"
> +REQUIRED_DISTRO_FEATURES += "usrmerge"
>  
>  do_install() {
>  	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
> diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
> index 7ba4233f6a2..3fa49122cd6 100644
> --- a/meta/recipes-core/systemd/systemd_254.bb
> +++ b/meta/recipes-core/systemd/systemd_254.bb
> @@ -10,9 +10,13 @@ SECTION = "base/shell"
>  
>  inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu systemd gettext bash-completion manpages features_check
>  
> +# unmerged-usr support is deprecated upstream, taints the system and will be
> +# removed in the near future. Fail the build if it is not enabled.
> +REQUIRED_DISTRO_FEATURES += "usrmerge"
> +
>  # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
>  # that we don't build both udev and systemd in world builds.
> -REQUIRED_DISTRO_FEATURES = "systemd"
> +REQUIRED_DISTRO_FEATURES += "systemd"
>  
>  SRC_URI += " \
>             file://touchscreen.rules \
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185557): https://lists.openembedded.org/g/openembedded-core/message/185557
> Mute This Topic: https://lists.openembedded.org/mt/100572063/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

