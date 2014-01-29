Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 74AAF6E9A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:06:33 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id 9B726815; Wed, 29 Jan 2014 14:06:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 4403A7BB;
	Wed, 29 Jan 2014 14:06:34 +0100 (CET)
Date: Wed, 29 Jan 2014 14:06:33 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20140129130632.GG24156@piout.net>
References: <1389879279-28203-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
In-Reply-To: <1389879279-28203-1-git-send-email-alexandre.belloni@free-electrons.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant-2.0: don't exit in pkg_postinst
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
X-List-Received-Date: Wed, 29 Jan 2014 13:06:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping ?

On Thu, Jan 16, 2014 at 14:34:39 +0100, Alexandre Belloni wrote :
> Exiting explicitly in pkg_postinst makes it impossible to use the
> update-rc.d class in a .bbappend because the link creation is appended
> to the pkg_postinst script.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
> index ce669a1ffa4f..ba28c6bd4528 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
> @@ -82,9 +82,8 @@ do_install () {
>  
>  pkg_postinst_wpa-supplicant () {
>  	# If we're offline, we don't need to do this.
> -	if [ "x$D" != "x" ]; then
> -		exit 0
> +	if [ "x$D" = "x" ]; then
> +		killall -q -HUP dbus-daemon || true
>  	fi
>  
> -	killall -q -HUP dbus-daemon || true
>  }
> -- 
> 1.8.3.2
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

