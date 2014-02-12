Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8CC6E8DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:29:33 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id A860287B; Wed, 12 Feb 2014 17:29:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 484D67BA;
	Wed, 12 Feb 2014 17:29:30 +0100 (CET)
Date: Wed, 12 Feb 2014 17:29:21 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140212162920.GB11498@piout.net>
References: <1392220457-23287-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1392220457-23287-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass, base.bbclass: Fix support for old kernel configuration
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
X-List-Received-Date: Wed, 12 Feb 2014 16:29:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 12/02/2014 at 13:54:17 -0200, Otavio Salvador wrote :
> This solves a regression introduced by OE-Core:9b75f6a (kernel:
> use oldnoconfig before yes '' | make oldconfig).
> 
> The original oe_runmake explicitly calls 'die' command in case of
> failure so the fallback code never runs. The fallback code needs
> to handle the oe_runmake return code to call the backward
> compatible callback so we introduced a new command called
> oe_runmake_call which is used by oe_runmake.
> 
> This does not change the functional behaviour of oe_runmake so it
> avoids any change except for the code which does need to handle
> the oe_runmake exit code.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

I'm fine with that patch and I'm sorry for the breakage. I tested
"make oldnoconfig || yes '' | make oldconfig" outside of oe as I don't
have any instance of yocto using a kernel older than 3.10 and assumed
oe_runmake was simply calling make with the correct environment...

Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

> ---
>  meta/classes/base.bbclass   | 8 ++++++--
>  meta/classes/kernel.bbclass | 2 +-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 81fc305..7837c89 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -53,9 +53,13 @@ die() {
>  	bbfatal "$*"
>  }
>  
> -oe_runmake() {
> +oe_runmake_call() {
>  	bbnote ${MAKE} ${EXTRA_OEMAKE} "$@"
> -	${MAKE} ${EXTRA_OEMAKE} "$@" || die "oe_runmake failed"
> +	${MAKE} ${EXTRA_OEMAKE} "$@"
> +}
> +
> +oe_runmake() {
> +	oe_runmake_call "$@" || die "oe_runmake failed"
>  }
>  
>  
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3003fb1..6953109 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -313,7 +313,7 @@ python sysroot_stage_all () {
>      oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>  }
>  
> -KERNEL_CONFIG_COMMAND ?= "oe_runmake oldnoconfig || yes '' | oe_runmake oldconfig"
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call oldnoconfig || yes '' | oe_runmake oldconfig"
>  
>  kernel_do_configure() {
>  	# fixes extra + in /lib/modules/2.6.37+
> -- 
> 1.8.5.3
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

