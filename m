Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id BDA796E905
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 15:43:19 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 6EBE281E; Fri,  7 Feb 2014 16:43:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 06FB67FE;
	Fri,  7 Feb 2014 16:43:22 +0100 (CET)
Date: Fri, 7 Feb 2014 16:43:19 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20140207154319.GA3070@piout.net>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<52CC1E02.9070102@windriver.com>
	<52CC633C.6000404@free-electrons.com>
	<52CC65E5.6010003@windriver.com> <20140129131021.GH24156@piout.net>
	<52F40344.907@windriver.com> <20140207140223.GA30901@piout.net>
	<52F4F796.2070101@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52F4F796.2070101@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Fri, 07 Feb 2014 15:43:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 07/02/2014 at 10:11:18 -0500, Bruce Ashfield wrote :
> On 14-02-07 09:02 AM, Alexandre Belloni wrote:
> >>>cp defconfig .config
> >>>make oldnoconfig
> >>scripts/kconfig/conf --olddefconfig Kconfig
> >>#
> >># configuration written to .config
> >>#
> >>yow-bashfiel-d3 [/home/bruc...rnel/linux]> grep USB_ETH .config
> >>CONFIG_USB_ETH=m
> >>CONFIG_USB_ETH_RNDIS=y
> >>CONFIG_USB_ETH_EEM=y
> >>
> >>.. CONFIG_USB_ETH is still =m.
> >>
> >
> >That is where I end up with:
> 
> What's in your saved defconfig ? My point is that if you are saving
> a defconfig, it is on the save where that value needs to be correct,
> not on the application to the tree, since if it is set .. it will be
> respected.
> 

Exactly my point, using yes "" | make oldconfig DOESN'T respect the
provided defconfig because that doesn't go through the correct kconfig
code that is solving the issue:

$ make savedefconfig
scripts/kconfig/conf --savedefconfig=defconfig Kconfig
$ grep USB_ETH defconfig 
CONFIG_USB_ETH=y
CONFIG_USB_ETH_EEM=y
$ cp defconfig .config
‘defconfig’ -> ‘.config’
$ yes '' | make oldconfig > /dev/null
$ grep USB_ETH .config
CONFIG_USB_ETH=m
CONFIG_USB_ETH_RNDIS=y
CONFIG_USB_ETH_EEM=y


$ cp defconfig .config
‘defconfig’ -> ‘.config’
$ make oldnoconfig
scripts/kconfig/conf --olddefconfig Kconfig
#
# configuration written to .config
#
$ grep USB_ETH .config
CONFIG_USB_ETH=y
CONFIG_USB_ETH_RNDIS=y
CONFIG_USB_ETH_EEM=y


> >I believe my commit message is actually right and something went wrong
> >in your tests.
> 
> Heh, then we are at a stalemate. I used a stock 3.14 kernel, and my
> results stand, and in my testing, your results with the savedefconfig
> flow don't match.
> 

Please check again, maybe you had CONFIG_USB_ETH=m in your defconfig ?


> Use the mips example in the changelog then .. since that one actually
> is a consistent result.
> 

Ok, I can do that.

> >
> >I understand that it may change the behaviour for some existing
> >configurations but I believe it is the correct behaviour to actually
> >respect what is in the kernel config provided by the user.
> 
> On that point, I disagree. It is respecting the default values, not
> the config provided by the user. If the user wants full control, they
> can supply a full .config, or fragments.
> 

I'm not sure I follow you. I have a defconfig with CONFIG_USB_ETH=y and
I ended with a kernel compiled with CONFIG_USB_ETH=m. I don't think this
is sane. It would not be necessary to provide a full kernel .config if
the config options provided in the defconfig were respected.


> >
> >>  kernel_do_configure() {
> >>         # fixes extra + in /lib/modules/2.6.37+
> >>         # $ scripts/setlocalversion . => +
> >>@@ -325,7 +327,7 @@ kernel_do_configure() {
> >>         if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
> >>                 cp "${WORKDIR}/defconfig" "${B}/.config"
> >>         fi
> >>-       yes '' | oe_runmake oldconfig
> >>+       eval ${KERNEL_CONFIG_COMMAND}
> >>  }
> >>--->----->--->----->--->----->--->----->
> >>
> >>Doing a v3 of the fallback version, with a checked commit log and
> >>perhaps even the command flexibility would keep everyone happy and
> >>I can add my Acked-by to that version.
> >>
> >
> >BTW, I've been told by the kconfig maintainers that the preferred way of
> >doing it would be to copy the provided defconfig to
> >arch/${ARCH}/configs/oe_defconfig and then oe_runmake oe_defconfig. But
> 
> linux-yocto* doesn't use defconfigs, and defconfigs can cause plenty of
> pain, so opinions vary on this and anyone with a custom kernel recipe
> is free to use defconfigs from within the tree, but making the generic
> build change to that .. risks jiggling things for no obvious gain.
> 

linux-yocto is not the only user of kernel.bbclass. meta-fsl-arm and
meta-fs-arm-extra are using defconfigs and Otavio would prefer not
having full configs which I understand (and isn't the name used by
kernel.bbclass "defconfig" misleading then ?).

Anyway, let me prepare a v3 and see if we all agree on that (and I
believe we will :) ).

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

