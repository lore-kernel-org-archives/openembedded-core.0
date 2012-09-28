Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THY4C-0005sX-9M for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 12:45:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SAWCKF009084;
	Fri, 28 Sep 2012 11:32:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08971-03; Fri, 28 Sep 2012 11:32:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SAW1i8009078
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 11:32:03 +0100
Message-ID: <1348828323.15753.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthew McClintock <msm@freescale.com>
Date: Fri, 28 Sep 2012 11:32:03 +0100
In-Reply-To: <1348795994-21695-9-git-send-email-msm@freescale.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
	<1348795994-21695-9-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 09/10] binutils.inc: add vardep on multiarch DISTRO_FEATURE
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
X-List-Received-Date: Fri, 28 Sep 2012 10:45:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-27 at 20:33 -0500, Matthew McClintock wrote:
> binutils will build differently if this feature is enabled, so
> make the do_configure step depend on it
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> Not sure if we should try to fix via configure options
> 
> v2: update commit message a bit
> 
>  meta/recipes-devtools/binutils/binutils.inc |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index ee748a4..ff64882 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -80,6 +80,8 @@ export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
>  export CPP_FOR_BUILD = "${BUILD_CPP}"
>  export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
>  
> +MULTIARCH := "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "yes", "no", d)}"
> +do_configure[vardeps] += "MULTIARCH"
>  do_configure () {
>  	(cd ${S}; gnu-configize) || die "Failed to run gnu-configize"
>  	oe_runconf

This doesn't make sense. oe_runconf should depend on EXTRA_OECONF and
that should depend on DISTRO_FEATURES so the dependency should already
exist?

Cheers,

Richard



