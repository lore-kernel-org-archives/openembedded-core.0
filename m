Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9187D6066A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:54:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLw9sN024971; Wed, 29 May 2013 22:58:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id S7Y2hzTUIi_h; Wed, 29 May 2013 22:58:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TLvvrE024957
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 29 May 2013 22:58:00 +0100
Message-ID: <1369864411.14887.255.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Wed, 29 May 2013 22:53:31 +0100
In-Reply-To: <1369863047-3105-1-git-send-email-eric@eukrea.com>
References: <1369863047-3105-1-git-send-email-eric@eukrea.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: depend on gdk-pixbuf-native
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
X-List-Received-Date: Wed, 29 May 2013 21:54:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2013-05-29 at 23:30 +0200, Eric Bénard wrote:
> it's using scripts from scripts/postinst-intercepts/ which contain
> gdk-pixbuf-query-loaders so it should depend on gdk-pixbuf-native
> else the host binary will be used and it will try to update the
> host's cache
> 
> [YOCTO #4572]
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
> fix the same problem in dylan
> 
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 04db533..6c16a1a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -10,7 +10,7 @@ inherit gzipnative
>  
>  LICENSE = "MIT"
>  PACKAGES = ""
> -DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
> +DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross gdk-pixbuf-native"
>  RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
>  RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"

Ah, this has made me realise what the real problem is and that there is
a better way to fix this. We need to add

DEPENDS += "gdk-pixbuf-native"

to pixbufcache.bbclass and gtk-icon-cache.bbclass then people not using
those things don't get the dependency added.

Cheers,

Richard
 



