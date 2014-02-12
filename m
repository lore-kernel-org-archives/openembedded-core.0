Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3DC6DE07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:00:42 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5F1BCF811E1; Wed, 12 Feb 2014 09:00:43 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 7ECA8F811DD;
	Wed, 12 Feb 2014 09:00:42 -0700 (MST)
Message-ID: <52FB9AC0.3020108@mlbassoc.com>
Date: Wed, 12 Feb 2014 09:01:04 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1392220457-23287-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1392220457-23287-1-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.5.2
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
X-List-Received-Date: Wed, 12 Feb 2014 16:00:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-02-12 08:54, Otavio Salvador wrote:
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

You might make it clear in this description that this change is necessary
to handle older kernels where 'make oldnoconfig' is not supported.

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
> 

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

