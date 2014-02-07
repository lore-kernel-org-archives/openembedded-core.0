Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A7576E918
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 16:43:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s17GhCNR008671
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Feb 2014 08:43:12 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 7 Feb 2014 08:43:11 -0800
Message-ID: <52F50D1C.2080200@windriver.com>
Date: Fri, 7 Feb 2014 11:43:08 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	<openembedded-core@lists.openembedded.org>
References: <1391790632-29801-1-git-send-email-alexandre.belloni@free-electrons.com>
In-Reply-To: <1391790632-29801-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH v3] kernel: use oldnoconfig before yes '' | make oldconfig
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
X-List-Received-Date: Fri, 07 Feb 2014 16:43:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-02-07 11:30 AM, Alexandre Belloni wrote:
> When using a defconfig, using yes '' | make oldconfig may not result in
> the correct configuration being set. For example:

Thanks for your patience, v3 looks good to me. Obviously RP will
over rule as he sees fit :)

>
>   $ ARCH=mips make qi_lb60_defconfig
>   #
>   # configuration written to .config
>   #
>   $ grep USB_ETH .config
>   CONFIG_USB_ETH=y
>   # CONFIG_USB_ETH_RNDIS is not set
>   # CONFIG_USB_ETH_EEM is not set
>
>   $ cp arch/mips/configs/qi_lb60_defconfig .config
>   $ yes '' | make ARCH=mips oldconfig
> [...]
>   $ grep USB_ETH .config
>   CONFIG_USB_ETH=m
>   # CONFIG_USB_ETH_RNDIS is not set
>   # CONFIG_USB_ETH_EEM is not set
>
> Using make olddefconfig solves that but we'll use the oldnoconfig alias
> for backward compatibility with older kernels.
>
>   $ cp arch/mips/configs/qi_lb60_defconfig .config
>   $ make ARCH=mips oldnoconfig
>   scripts/kconfig/conf --olddefconfig Kconfig
>   #
>   # configuration written to .config
>   #
>   $ grep USB_ETH .config
>   CONFIG_USB_ETH=y
>   # CONFIG_USB_ETH_RNDIS is not set
>   # CONFIG_USB_ETH_EEM is not set

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>   meta/classes/kernel.bbclass | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 51626b03f824..9f1d669b3cf6 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -301,6 +301,8 @@ python sysroot_stage_all () {
>       oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>   }
>
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake oldnoconfig || yes '' | oe_runmake oldconfig"
> +
>   kernel_do_configure() {
>   	# fixes extra + in /lib/modules/2.6.37+
>   	# $ scripts/setlocalversion . => +
> @@ -313,7 +315,7 @@ kernel_do_configure() {
>   	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>   		cp "${WORKDIR}/defconfig" "${B}/.config"
>   	fi
> -	yes '' | oe_runmake oldconfig
> +	eval ${KERNEL_CONFIG_COMMAND}
>   }
>
>   do_savedefconfig() {
>


