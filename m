Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8A806028A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 06:29:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4F6T8HJ004455
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 23:29:08 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 14 May 2014 23:29:07 -0700
Message-ID: <53745ECB.5050909@windriver.com>
Date: Thu, 15 May 2014 14:29:31 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1389785224-56756-1-git-send-email-krzysztof.m.sywula@intel.com>
In-Reply-To: <1389785224-56756-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH] initrdscripts: add $CMDLINE to init-live switch_root
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
X-List-Received-Date: Thu, 15 May 2014 06:29:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2014 07:27 PM, krzysztof.m.sywula@intel.com wrote:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>
> init-live.sh: $CMDLINE variable should be provided to switch_root
> to let user specify runlevel on grub command line.
> Feeding with -c /dev/console as well as busybox switch_root enables that option.
>
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> ---
>   meta/recipes-core/initrdscripts/files/init-live.sh | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
> index bd259b9..7e27f91 100644
> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
> @@ -89,7 +89,10 @@ boot_live_root() {
>       mount -n --move /dev ${ROOT_MOUNT}/dev
>   
>       cd $ROOT_MOUNT
> -    exec switch_root $ROOT_MOUNT /sbin/init
> +
> +    # busybox switch_root supports -c option
> +    exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init $CMDLINE ||
> +        fatal "Couldn't switch_root, dropping to shell"
>   }
>   
>   fatal() {

I once sent out a patch to remove the '-c /dev/console' because this is 
busybox specific.
What if util-linux gets installed in the initramfs?

Could you please state what the benefit is with this option? Maybe in 
the comment?
The disadvantage is obvious, because if you have util-linux in 
initramfs, the 'switch_root' command doesn't support that option, and 
the 'switch_root' command would always fail.

Best Regards,
Chen Qi

