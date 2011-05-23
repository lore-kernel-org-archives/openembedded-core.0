Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QOUtC-0000Ml-3z for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 15:09:42 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QOUqJ-0001gO-U8
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 15:06:44 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <596fd53943dd383f89abb767d7a3b624e6b20b92.1306152724.git.otavio@ossystems.com.br>
References: <cover.1306152724.git.otavio@ossystems.com.br>
	<596fd53943dd383f89abb767d7a3b624e6b20b92.1306152724.git.otavio@ossystems.com.br>
Organization: Phil Blundell Consulting Ltd
Date: Mon, 23 May 2011 14:06:42 +0100
Message-ID: <1306156002.2525.79.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/3] busybox: enable mdev by default
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
X-List-Received-Date: Mon, 23 May 2011 13:09:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-23 at 12:13 +0000, Otavio Salvador wrote:
>  CONFIG_LOSETUP=y
>  # CONFIG_LSPCI is not set
>  # CONFIG_LSUSB is not set
> -# CONFIG_MDEV is not set
> +CONFIG_MDEV=y
>  # CONFIG_FEATURE_MDEV_CONF is not set
>  # CONFIG_FEATURE_MDEV_RENAME is not set
>  # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set

This sort of thing, as we've seen previously in classic oe, doesn't
really scale very well since everyone's requirements for busybox are
subtly different.  Others will doubtless disagree but, personally, I
think it would be best for you to just maintain a busybox.conf in your
own distro layer which sets it up the way that you want.

> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 341c5c4..de711d2 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -29,7 +29,6 @@ INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
>  INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
>  INITSCRIPT_NAME_${PN}-udhcpc = "busybox-udhcpc" 
>  CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf.${PN}"
> -CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"

Agreed, it seems silly to declare the file as a CONFFILE if we aren't
shipping it in the first place.

p.




