Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0FFD662135
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 67A4120ABA;
	Mon, 30 Jan 2017 23:21:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RPkkm2kcRTph; Mon, 30 Jan 2017 23:21:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 466D8209DA;
	Mon, 30 Jan 2017 23:21:11 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C9F76162331; Mon, 30 Jan 2017 18:21:10 -0500 (EST)
Date: Mon, 30 Jan 2017 18:21:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20170130232110.GH15833@denix.org>
References: <1485813590-22370-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1485813590-22370-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ffmpeg: disable cpu autodetection
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
X-List-Received-Date: Mon, 30 Jan 2017 23:21:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 30, 2017 at 10:59:50PM +0100, Andreas Oberritter wrote:
> Just pass the correct -mcpu= configure switch (fallback to generic).
> 
> Avoids warnings like:
> | warning: switch -mcpu=cortex-a15 conflicts with -march=armv7-a switch

That is actually a valid warning - cortex-a15 is armv7ve, not armv7a...


> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> index 66718c4..c376d82 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.2.bb
> @@ -66,6 +66,12 @@ PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
>  # Check codecs that require --enable-nonfree
>  USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'openssl' ], 'yes', '', d)}"
>  
> +def cpu(d):
> +    for arg in (d.getVar('TUNE_CCARGS') or '').split():
> +        if arg.startswith('-mcpu='):
> +            return arg[6:]
> +    return 'generic'
> +
>  EXTRA_OECONF = " \
>      --disable-stripping \
>      --enable-pic \
> @@ -90,6 +96,7 @@ EXTRA_OECONF = " \
>      --shlibdir=${libdir} \
>      --datadir=${datadir}/ffmpeg \
>      ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
> +    --cpu=${@cpu(d)} \
>  "
>  
>  EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

