Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DC9C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:34:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.43351.1712918055350949275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 03:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CDoEMVNs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29D8F1BF209;
	Fri, 12 Apr 2024 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712918053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MPJv1vI7x7Yu4uN00jcNlhprVTj/O7GqCXiOWKihtac=;
	b=CDoEMVNs2wOR3TmTYK8nLXxsVHKzZKj/RGM/kGxso5eu3y5pwaRfrZOhN2MHXkQ6f4fi7M
	t6g1+hCUh3nE0UTgWDed70F24ogS57dgJmKfMipwVIuErMur+Bm3SIokqlUGnxK9aMjF7I
	4cAcw5PmKkvtW0TQbxR70f0QfxFT8H16ARIcXQ/6mxEejmFeqoyMHDtUKWhOM6R5akzHqU
	ozYUXhDaqoZsRma5eknQXF+TlwVlZTTrHu3HzRTWwmktRhGyTvCxc7oYuHEtVE5fqdtqvx
	bq/PAM9s3lb/Us6PX0e6KGUB7zFxrf/L8wq8n9jNj1qWQ8qvz6rZdziS2At41A==
Date: Fri, 12 Apr 2024 12:34:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: K Sanjay Nayak <nayakksanjay@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Replaced :append with += in multiple recipe
 files under meta layer.
Message-ID: <20240412103412466186fe@mail.local>
References: <20240412060536.34983-1-nayakksanjay@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412060536.34983-1-nayakksanjay@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 10:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198162

On 12/04/2024 11:35:36+0530, K Sanjay Nayak wrote:
> Fixes [YOCTO #2951]
> 
> Conditional operator is preferred over the append operation,

I don't believe += is conditional.

> hence modified multiple recipes under the meta-layer.
> 
> Reported-by : Christopher Larson <kergoth@gmail.com>
> Signed-off-by: K Sanjay Nayak <nayakksanjay@gmail.com>
> ---
>  meta/recipes-bsp/grub/grub-efi_2.12.bb                          | 2 +-
>  meta/recipes-core/initscripts/initscripts_1.0.bb                | 2 +-
>  meta/recipes-core/sysvinit/sysvinit_3.04.bb                     | 2 +-
>  .../baremetal-example/baremetal-helloworld_git.bb               | 2 +-
>  meta/recipes-extended/less/less_643.bb                          | 2 +-
>  meta/recipes-gnome/librsvg/librsvg_2.57.1.bb                    | 2 +-
>  meta/recipes-graphics/waffle/waffle_1.7.2.bb                    | 2 +-
>  meta/recipes-support/libgpg-error/libgpg-error_1.48.bb          | 2 +-
>  meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb         | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub/grub-efi_2.12.bb
> index 9857e8e036..4cd1c696f4 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
> @@ -4,7 +4,7 @@ require conf/image-uefi.conf
>  
>  GRUBPLATFORM = "efi"
>  
> -DEPENDS:append = " grub-native"
> +DEPENDS += " grub-native"
>  RDEPENDS:${PN} = "grub-common virtual-grub-bootconf"
>  
>  SRC_URI += " \
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index e61ac554f3..2ad4d0b0b0 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -42,7 +42,7 @@ SRC_URI:append:armeb = " file://alignment.sh"
>  
>  KERNEL_VERSION = ""
>  
> -DEPENDS:append = " update-rc.d-native"
> +DEPENDS += " update-rc.d-native"
>  PACKAGE_WRITE_DEPS:append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
>  
>  PACKAGES =+ "${PN}-functions ${PN}-sushell"
> diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
> index 6a612468f3..2dee7bc3ce 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_3.04.bb
> @@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2
>  S = "${WORKDIR}/sysvinit-${PV}"
>  
>  inherit update-alternatives features_check
> -DEPENDS:append = " update-rc.d-native base-passwd virtual/crypt"
> +DEPENDS += " update-rc.d-native base-passwd virtual/crypt"
>  do_package_setscene[depends] = "${MLPREFIX}base-passwd:do_populate_sysroot"
>  
>  PACKAGECONFIG[psplash-text-updates] = ",,"
> diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> index 6832ccc541..f66581cca3 100644
> --- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> +++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> @@ -25,7 +25,7 @@ inherit baremetal-image
>  
>  
>  # startup code for x86 uses NASM syntax
> -DEPENDS:qemux86:append = " nasm-native"
> +DEPENDS:qemux86 += " nasm-native"
>  
>  # These parameters are app specific for this example
>  # This will be translated automatically to the architecture and
> diff --git a/meta/recipes-extended/less/less_643.bb b/meta/recipes-extended/less/less_643.bb
> index 67834bdd58..5c17571768 100644
> --- a/meta/recipes-extended/less/less_643.bb
> +++ b/meta/recipes-extended/less/less_643.bb
> @@ -55,7 +55,7 @@ do_install_ptest () {
>          cp -r ${S}/lesstest/lt ${D}${PTEST_PATH}
>  }
>  
> -RDEPENDS:${PN}-ptest:append = " perl-module-getopt-std perl-module-cwd locale-base-en-us"
> +RDEPENDS:${PN}-ptest += " perl-module-getopt-std perl-module-cwd locale-base-en-us"
>  
>  ALTERNATIVE:${PN} = "less"
>  ALTERNATIVE_PRIORITY = "100"
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
> index 4b52d4062b..b774fe8c47 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb
> @@ -30,7 +30,7 @@ UPSTREAM_CHECK_REGEX = "librsvg-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
>  # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
>  # so we cannot use cargo class directly, but still need bits and pieces from it 
>  # for cargo to be happy
> -BASEDEPENDS:append = " cargo-native"
> +BASEDEPENDS += " cargo-native"
>  
>  export RUST_BACKTRACE = "full"
>  export RUSTFLAGS
> diff --git a/meta/recipes-graphics/waffle/waffle_1.7.2.bb b/meta/recipes-graphics/waffle/waffle_1.7.2.bb
> index cb917d8894..84f2f70ab2 100644
> --- a/meta/recipes-graphics/waffle/waffle_1.7.2.bb
> +++ b/meta/recipes-graphics/waffle/waffle_1.7.2.bb
> @@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
>  
>  inherit meson features_check lib_package bash-completion pkgconfig
>  
> -DEPENDS:append = " python3"
> +DEPENDS += " python3"
>  
>  # This should be overridden per-machine to reflect the capabilities of the GL
>  # stack.
> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
> index 9f2b49209d..b268d5b9c1 100644
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
> @@ -26,7 +26,7 @@ BINCONFIG = "${bindir}/gpg-error-config"
>  
>  inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
>  
> -RDEPENDS:${PN}-ptest:append = " make bash"
> +RDEPENDS:${PN}-ptest += " make bash"
>  
>  MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/gpgrt-config"
>  
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
> index e6668da01f..30838cb3a6 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
> @@ -31,7 +31,7 @@ do_install () {
>  RDEPENDS:${PN}:append:libc-glibc = " libgcc"
>  
>  # pstree is called by ptest-runner-collect-system-data
> -RDEPENDS:${PN}:append = " pstree"
> +RDEPENDS:${PN} += " pstree"
>  
>  # Create a non-root user that test suites can use easily
>  inherit useradd
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198154): https://lists.openembedded.org/g/openembedded-core/message/198154
> Mute This Topic: https://lists.openembedded.org/mt/105477868/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

