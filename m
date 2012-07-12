Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SpHLg-0004Ih-Pk for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 13:14:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6CB36W6018359;
	Thu, 12 Jul 2012 12:03:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16802-09; Thu, 12 Jul 2012 12:03:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6CB2uur018353
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jul 2012 12:02:57 +0100
Message-ID: <1342090978.22262.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2012 12:02:58 +0100
In-Reply-To: <1342084646-23822-1-git-send-email-b28495@freescale.com>
References: <1342084646-23822-1-git-send-email-b28495@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: b29882@freescale.com
Subject: Re: [PATCH] kernel.bbclass: update image name to keep it same in D and DEPLOYDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2012 11:14:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-12 at 04:17 -0500, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
> 
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta/classes/kernel.bbclass |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 81c334b..420a1ec 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -122,7 +122,12 @@ kernel_do_install() {
>  	#
>  	install -d ${D}/${KERNEL_IMAGEDEST}
>  	install -d ${D}/boot
> -	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> +        install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGE_BASE_NAME}.bin
> +        cd ${D}/${KERNEL_IMAGEDEST}/
> +        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
> +        ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
> +	cd -
>  	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>  	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>  	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}

This is going to break users who rely on the existing naming/layout. 

The patch description is lacking on why we need to do this too, it just
says what you're doing and not why.

Cheers,

Richard



