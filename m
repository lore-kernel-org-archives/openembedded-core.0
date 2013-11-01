Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C28DF6CCC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 14:36:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1EaLfS003888; Fri, 1 Nov 2013 14:36:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wfuHfvZp7VPe; Fri,  1 Nov 2013 14:36:21 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1EaGf7003879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 14:36:17 GMT
Message-ID: <1383316571.6271.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Janis Coders <janis.coders@gmail.com>
Date: Fri, 01 Nov 2013 14:36:11 +0000
In-Reply-To: <5273B339.6090700@gmail.com>
References: <5273B339.6090700@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: Patch file search order in DORA (1.5)
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
X-List-Received-Date: Fri, 01 Nov 2013 14:36:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-01 at 15:57 +0200, Janis Coders wrote:
> Hi, I am working on Freescale's BSP with my custom layer which overrides 
> (appends) the Linux kernel's recipe.
> In version 1.4 my custom recipe's defconfig had priority over the 
> 'original' layer's defconfig, but in 1.5 the priority has
> changed. After some debugging I found out that seems like order of patch 
> file searching has changed in version 1.5.
> 
> Order in 1.4 (example):
> DEBUG: Searching for defconfig in paths:
> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/arm
> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/armv7a
> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/mx5
> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/mx53
> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/imx53be
> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/poky
> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/
> /home/chocis/projects/balticembedded-bsp/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/arm
> /home/chocis/projects/balticembedded-bsp/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/armv7a
> /home/chocis/projects/balticembedded-bsp/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/mx5 
> 
>      ......
> Order in 1.5 (example):
> /home/chocis/projects/testdorafreescale/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/poky
> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm-extra/recipes-kernel/linux/linux-imx-2.6.35.3/poky
> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/poky
> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx/poky
> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/files/poky
> /home/chocis/projects/testdorafreescale/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/imx53be
> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm-extra/recipes-kernel/linux/linux-imx-2.6.35.3/imx53be
> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/imx53be
> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx/imx53be
> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/files/imx53be
>      .........
> 
> Was this intended and specially changed in version 1.5? Because now I 
> have to move my defconfig one directory deeper
> to get the priority.

It was not in the 1.5 release however I have just realised it is in the
dora branch and it is a change of behaviour there. I'm not sure it was
intentionally included for 1.5.1 and that is something we need to
discuss.

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=dora&id=0bd63125c3b44a656e44f2a76cc5f832c9db4bbd

I would say that the change is in master and is intentional however and
if you look at the search order, it does make more sense this way
around. Any distro override file should come first, then say armv7, then
armv6 and so on. In the original order, arm overrides armv7 which
overrides machine specific which makes no sense.

On those grounds it is a valid bug fix for 1.5.1 IMO.

Cheers,

Richard




