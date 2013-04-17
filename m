Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1USQ4Z-0003KH-Ux for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 12:58:46 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HAfQm5013874; Wed, 17 Apr 2013 11:41:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BtXpizMemS3R; Wed, 17 Apr 2013 11:41:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HAfKoo013863
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 17 Apr 2013 11:41:22 +0100
Message-ID: <1366195248.25282.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: b28495@freescale.com
Date: Wed, 17 Apr 2013 11:40:48 +0100
In-Reply-To: <1366188175-29768-1-git-send-email-b28495@freescale.com>
References: <1366188175-29768-1-git-send-email-b28495@freescale.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: r63875@freescale.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] augeas: allow empty augeas-lenses package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 10:58:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-17 at 16:42 +0800, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
> 
> Fix the error when do_rootfs:
> | Loading cache...
> | Updating cache...               ######################################## [100%]
> |
> | Computing transaction...error: Can't install libaugeas0-1.0.0-r1@ppce500v2: no package provides augeas-lenses
> |
> | Saving cache...
> |
> | ERROR: Function failed: do_rootfs
> 
> augeas-lenses rpm is not generated due to no content:
> $ ls tmp/deploy/rpm/ppce500v2/augeas-
> augeas-1.0.0-r1.ppce500v2.rpm      augeas-dev-1.0.0-r1.ppce500v2.rpm
> augeas-dbg-1.0.0-r1.ppce500v2.rpm  augeas-doc-1.0.0-r1.ppce500v2.rpm
> $ ls tmp/work/ppce500v2-fsl_networking-linux-gnuspe/augeas/1.0.0-r1/packages-split/augeas-lenses/
> $
> 
> Change-Id: I63b871fdbbd45f1c0b1b5605b342e62e1526c37b
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta/recipes-extended/augeas/augeas.inc      |    3 +++
>  meta/recipes-extended/augeas/augeas_1.0.0.bb |    2 +-
>  2 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
> index c956621..49da973 100644
> --- a/meta/recipes-extended/augeas/augeas.inc
> +++ b/meta/recipes-extended/augeas/augeas.inc
> @@ -29,3 +29,6 @@ LEAD_SONAME = "libaugeas.so"
>  do_install_append() {
>  	rm -fr ${D}${datadir}/vim
>  }
> +
> +ALLOW_EMPTY_${PN}-lenses = "1" 
> +
> diff --git a/meta/recipes-extended/augeas/augeas_1.0.0.bb b/meta/recipes-extended/augeas/augeas_1.0.0.bb
> index 82bda19..d898eea 100644
> --- a/meta/recipes-extended/augeas/augeas_1.0.0.bb
> +++ b/meta/recipes-extended/augeas/augeas_1.0.0.bb
> @@ -1,6 +1,6 @@
>  require augeas.inc
>  
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI[md5sum] = "82131019432ecf8102e1491610ad2dd1"
>  SRC_URI[sha256sum] = "31bf757c5b8197765946b3805f3793c32b03cd92a7a77ec95d37e71a1f131912"

Thanks for the warning about this but this isn't the right way to fix
it. The question is what happened to the files that should be there?

I've just sent out a patch which fixes this properly.

Cheers,

Richard



