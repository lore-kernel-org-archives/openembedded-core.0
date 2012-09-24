Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG5yI-0004dz-V0 for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:33:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAKBjp027699;
	Mon, 24 Sep 2012 11:20:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27527-07; Mon, 24 Sep 2012 11:20:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAK3qF027687
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 11:20:04 +0100
Message-ID: <1348482003.4654.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 24 Sep 2012 11:20:03 +0100
In-Reply-To: <1348333994-18026-2-git-send-email-Martin.Jansa@gmail.com>
References: <20120921112144.GE10268@jama.jama.net>
	<1348333994-18026-1-git-send-email-Martin.Jansa@gmail.com>
	<1348333994-18026-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Mon, 24 Sep 2012 10:33:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-22 at 19:13 +0200, Martin Jansa wrote:
> * it doesn't make much sense with PV, because xserver-xorg-module-exa
>   was introduced in
>   http://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/xorg-xserver?id=1a666ee1cda3c0b74daba5881fc5f62e13deec66
>   so our xserver-xorg-module-exa RCONFLICTS with xserver-xorg (<= 1.11.2-r4)
>   and (< 1.11.2) is not good enough
> 
> * because we don't know how many PRINC are in BSP/DISTRO layers,
>   then it's safer to RCONFLICTS with every older version then current
>   EXTENDPKGV
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> --
> 
> * I haven't really tested this with IPK, since it was changed from
>   RREPLACES to RCONFLICTS (because of RPM) and all my installed devices
>   are already upgraded
> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 33f59fe..7513399 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -66,7 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
>  
>  RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
>  RDEPENDS_${PN}-xvfb += "xkeyboard-config"
> -RCONFLICTS_${PN}-module-exa = "${PN} (< ${PV})"
> +RCONFLICTS_${PN}-module-exa = "${PN} (< ${EXTENDPKGV})"
>  
>  FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
>  FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"

The original patch and this patch are wrong, this value should not be
"floating". It should be spelt out explicitly so it doesn't change with
the recipe version in future.:

RCONFLICTS_${PN}-module-exa = "${PN} (< 1.11.2-r4)"

Cheers,

Richard



