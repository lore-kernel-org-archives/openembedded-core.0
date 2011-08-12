Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qruqd-0000GW-9e for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:44:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CGe6dD013723
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 17:40:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13071-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 17:40:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CGdwAX013700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 17:39:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <e43470acc45e0b2d15a3fdc54a5db92f2486f616.1313117148.git.xiaofeng.yan@windriver.com>
References: <cover.1313117148.git.xiaofeng.yan@windriver.com>
	<e43470acc45e0b2d15a3fdc54a5db92f2486f616.1313117148.git.xiaofeng.yan@windriver.com>
Date: Fri, 12 Aug 2011 17:39:18 +0100
Message-ID: <1313167158.14274.513.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] libx11-diet: Fix bug 1050
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
X-List-Received-Date: Fri, 12 Aug 2011 16:44:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-12 at 15:06 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> [YOCTO #1050]
> I got do_compile failure during building qemux86 image
> | ../../../doltlibtool: line 17:
> /distro/dcui/0704/pc1/build/tmp/work/i586-poky-linux/libx11-diet-1.3-r2/libX11-1.3/modules/im/ximcp/../../../libtool:
> No such file or directory
> 
> This is due to not found libtool, but i586-poky-linux-libtool in libX11-1.3
> So I link libtool to ${TARGET_PREFIX}libtool for solving this problem.
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-graphics/xorg-lib/libx11.inc |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
> index c156ce6..dbc50f8 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -18,6 +18,12 @@ EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --disable-sp
>  FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
>  FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
>  
> +do_configure_append() {
> +    if [ -f ${TARGET_PREFIX}libtool ]; then
> +        ln -sf ${TARGET_PREFIX}libtool libtool
> +    fi
> +}
> +

Please just disable dolt as per the other libx11 recipes.

Cheers,

Richard



