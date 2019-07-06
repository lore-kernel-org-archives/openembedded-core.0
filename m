Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9806D74B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2019 09:53:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45gn8r3Mz3z3J;
	Sat,  6 Jul 2019 11:53:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562406813;
	bh=3fOaA5kUXVmMgmyuU/kXg+IGC0WG1VmIYMBPF8Avc0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtnPxaXRmjgCzfBR7fsmWeBzfyLxRHLzlv5T/rAlzvdTwu8q0mxIs2Kespj8ZxzxW
	y4nq4li4w6DXApOG+3IFR0hOMAsGho4twfr2BFiFZOG9SYBa3mThuowY/+mAw+Gk8f
	9Nhgtdqqfy7rKyplAVeEHdKMIqSE/9NiRsJ0N+bVR43bzbG+DWdOsyuU6Gw0V0mJOv
	C9Wv+Jpl5ryR2f/GIf9BBmfzWBemP84X+Z4KA6m636eDOxMNehKJnxBr8HTW29o6zU
	0lDCYxqLNc4nu/8OAU7BabSI9RGiipildtKZegQCcSelTJDnCi2cOcagnqyPR1jz1C
	IRO3D6XjSaIii+9mywRSLwZyL1dpp2Q5JNA1qkd+QmVYh/7pLlVCkGgTyH3C9C9CWR
	8vQ5lx1fruwM5uJqgUdk3RD10cHaU7yMjfeIwKceptk+NrlKz49jQDFcyInMXZ7j7M
	T3fMM0/1LS1sBz1BIE4Ul9H4zlc8WPF6z8y/CTFQjsISTEdKbaiSnN7xKbUF14sRBb
	KDKpuRzAGlCdq3wi7ozFKGcQ8gM+Wm4k04+YM2kZX82IuCtHs5hg2cMZGFa6U9E7+y
	yeHwLjtIY9LvsmALIxZomEZ0AEnf3n4dl1ErnfrV3HrcyLPGd4//ebQ4tf11rbB9hZ
	2gUg9nxL9zjMzY+6uovZRlqY=
Date: Sat, 6 Jul 2019 12:53:28 +0300
From: Adrian Bunk <bunk@stusta.de>
To: kai.kang@windriver.com
Message-ID: <20190706095328.GA1877@localhost>
References: <20190704134520.16320-1-kai.kang@windriver.com>
	<20190704134520.16320-2-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190704134520.16320-2-kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] defaultsetup.conf: enable select init manager
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
X-List-Received-Date: Sat, 06 Jul 2019 09:53:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jul 04, 2019 at 09:45:19PM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Introduce a new variable INIT_MANAGER and create 3 init-manager-*.inc
> files to configure init manager settings. Available values of
> INIT_MANAGER are sysvinit, systemd and mdev-busybox. 'sysvinit' is set
> by default for compatibility.
>...
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -23,3 +23,6 @@ PACKAGE_CLASSES ?= "package_ipk"
>  INHERIT_BLACKLIST = "blacklist"
>  INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
>  INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
> +
> +INIT_MANAGER ??= "sysvinit"
> +require conf/distro/include/init-manager-${INIT_MANAGER}.inc
>...
> --- /dev/null
> +++ b/meta/conf/distro/include/init-manager-sysvinit.inc
> @@ -0,0 +1,6 @@
> +# Use sysvinit for system initialization
> +DISTRO_FEATURES_append = " sysvinit"
> +DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " systemd"
> +VIRTUAL-RUNTIME_init_manager = "sysvinit"
> +VIRTUAL-RUNTIME_initscripts = "initscripts"
> +VIRTUAL-RUNTIME_login_manager = "busybox"

I am not sure whether this can be fixed better, but this does break 
existing configurations that use a non-default init system.

I just ran into a build issue with
  VIRTUAL-RUNTIME_init_manager = "systemd"
since this now resulted in both sysvinit and systemd being attempted to 
be installed to the image.

This was fixable in my configuration with
  -VIRTUAL-RUNTIME_init_manager = "systemd"
  +INIT_MANAGER = "systemd"

This at least needs to be properly documented as a breaking change.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


