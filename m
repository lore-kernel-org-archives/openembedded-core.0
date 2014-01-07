Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC046CA08
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 15:32:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s07FWZDi004445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Jan 2014 07:32:35 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 7 Jan 2014 07:32:35 -0800
Message-ID: <52CC1E02.9070102@windriver.com>
Date: Tue, 7 Jan 2014 10:32:18 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	<openembedded-core@lists.openembedded.org>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
In-Reply-To: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>
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
X-List-Received-Date: Tue, 07 Jan 2014 15:32:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 14-01-07 09:18 AM, Alexandre Belloni wrote:
> When using a defconfig, using yes '' | make oldconfig may not result in
> the correct configuration being set. For example:
>
>   $ grep USB_ETH .config
>   CONFIG_USB_ETH=y
>   CONFIG_USB_ETH_RNDIS=y
>   CONFIG_USB_ETH_EEM=y
>   $ make savedefconfig
>   scripts/kconfig/conf --savedefconfig=defconfig Kconfig
>   $ cp defconfig .config
>   ‘defconfig’ -> ‘.config’
>   $ yes '' | make oldconfig
>   [...]
>   #
>   # configuration written to .config
>   #
>   $ grep USB_ETH .config
>   CONFIG_USB_ETH=m
>   CONFIG_USB_ETH_RNDIS=y
>   CONFIG_USB_ETH_EEM=y
>
> Using make olddefconfig solves that but we'll use oldnoconfig for
> backward compatibility with older kernels.
>
>   $ cp defconfig .config
>   ‘defconfig’ -> ‘.config’
>   $ make oldnoconfig
>   scripts/kconfig/conf --olddefconfig Kconfig
>   #
>   # configuration written to .config
>   #
>   $ grep USB_ETH .config
>   CONFIG_USB_ETH=y
>   CONFIG_USB_ETH_RNDIS=y
>   CONFIG_USB_ETH_EEM=y
>
> For more information, please refer to:
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=fbe98bb9ed3dae23e320c6b113e35f129538d14a

It was my understanding that this commit changed the Kconfig behaviour
to set the selected options to =y and prevent the menu choice from
"hiding" the options in a depedent choice menu. But maybe I'm remembering
wrong.

The point being, that with that commit in place. Doesn't the behaviour
match what we want with yes and oldconfig ?

.. I'll run some tests to confirm for myself, but I thought I'd throw
the question out as well. I don't typically use defconfigs, so I need
to do a bit of leg work.

I don't have any big issues with the patch, but I just want to be sure,
since changing this default could change the configs of many defconfig
users, and they may have been unknowingly relying on the old behaviour.

Bruce

>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>   meta/classes/kernel.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 61a6d102d7a8..644d7937923d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -313,7 +313,7 @@ kernel_do_configure() {
>   	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>   		cp "${WORKDIR}/defconfig" "${B}/.config"
>   	fi
> -	yes '' | oe_runmake oldconfig
> +	oe_runmake oldnoconfig
>   }
>
>   do_savedefconfig() {
>


