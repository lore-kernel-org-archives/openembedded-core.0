Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 382 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 13 Jun 2015 18:52:57 UTC
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 39508758F5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jun 2015 18:52:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,608,1427756400"; d="scan'208";a="59954639"
Received: from deneb.mcrowe.com (HELO deneb) ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 13 Jun 2015 19:46:35 +0100
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>) id 1Z3qRu-0004cd-Uu
	for openembedded-core@lists.openembedded.org;
	Sat, 13 Jun 2015 19:46:34 +0100
Date: Sat, 13 Jun 2015 19:46:34 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150613184634.GA17587@mcrowe.com>
References: <1434221081-4286-1-git-send-email-mac@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <1434221081-4286-1-git-send-email-mac@mcrowe.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] pixbufcache: Ensure that jpeg-native is available for postinst if necessary
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
X-List-Received-Date: Sat, 13 Jun 2015 18:52:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Saturday 13 June 2015 at 19:44:41 +0100, Mike Crowe wrote:
> pixbufcache_sstate_postinst expects to be able to call
> gdk-pixbuf-query-loaders which may be linked against libjpeg.so.8 so we'd
> better make sure jpeg-native is available in the sysroot.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/pixbufcache.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
> index 9e6ecc8..755a654 100644
> --- a/meta/classes/pixbufcache.bbclass
> +++ b/meta/classes/pixbufcache.bbclass
> @@ -72,6 +72,7 @@ PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
>      glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene \
>      libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene \
>      harfbuzz-native:do_populate_sysroot_setscene \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'jpeg', 'jpeg-native:do_populate_sysroot_setscene', '', d)} \

If this patch is deemed acceptable then perhaps a similar check against
PACKAGECONFIG should be added to libpng-native?

Mike.

