Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 03F0977053
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Sep 2015 05:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t855URrT003773; Sat, 5 Sep 2015 06:33:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AZ3lHvwPw1n0; Sat,  5 Sep 2015 06:33:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t855Wsjn003909
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 5 Sep 2015 06:33:06 +0100
Message-ID: <1441431174.24871.204.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <jslater@windriver.com>
Date: Sat, 05 Sep 2015 06:32:54 +0100
In-Reply-To: <1441419511-5991-1-git-send-email-jslater@windriver.com>
References: <1441419511-5991-1-git-send-email-jslater@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox: more nails in the coffin
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
X-List-Received-Date: Sat, 05 Sep 2015 05:33:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-04 at 19:18 -0700, Joe Slater wrote:
> Create packagegroup-busybox and modify packagegroup-core-boot
> to conditionally use it.

This says what it goes but not why. I'm also less than keen on the
subject line :/.

> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../packagegroups/packagegroup-busybox.bb          |   23 ++++++++++++++++++++
>  .../packagegroups/packagegroup-core-boot.bb        |   17 ++++++++-------
>  2 files changed, 32 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-core/packagegroups/packagegroup-busybox.bb
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-busybox.bb b/meta/recipes-core/packagegroups/packagegroup-busybox.bb
> new file mode 100644
> index 0000000..acf0791
> --- /dev/null
> +++ b/meta/recipes-core/packagegroups/packagegroup-busybox.bb
> @@ -0,0 +1,23 @@
> +#
> +# Copyright (C) 2015 Wind River Inc.
> +#
> +
> +SUMMARY = "Busybox related information"
> +DESCRIPTION = "Busybox packages and variables"
> +LICENSE = "MIT"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
> +
> +# Do not ever, ever override LOCAL variables.
> +#

Why?

> +LOCAL_sysvinit = " \
> +                   ${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
> +                   "
> +
> +RDEPENDS_${PN} = "\
> +    busybox \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${LOCAL_sysvinit}", "", d)} \
> +    "
> +
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index 09f5373..b2d0775 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -17,14 +17,17 @@ inherit packagegroup
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
>  MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
>  
> -# Distro can override the following VIRTUAL-RUNTIME providers:
> +# These can be overridden in any .conf file.
> +#
>  VIRTUAL-RUNTIME_dev_manager ?= "udev"
> -VIRTUAL-RUNTIME_login_manager ?= "busybox"
> -VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
>  VIRTUAL-RUNTIME_initscripts ?= "initscripts"
>  VIRTUAL-RUNTIME_keymaps ?= "keymaps"
> +VIRTUAL-RUNTIME_busybox ?= "packagegroup-busybox"

What about anyone who actually use these existing VIRTUAL-RUNTIME
variables?

Cheers,

Richard



