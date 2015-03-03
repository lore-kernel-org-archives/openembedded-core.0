Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 01CF56013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 16:57:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.09,682,1418083200"; d="scan'208";a="42491502"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 03 Mar 2015 16:56:48 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1YSq7k-00032g-7O; Tue, 03 Mar 2015 16:56:48 +0000
Date: Tue, 3 Mar 2015 16:56:48 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org,
	"Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150303165648.GA11515@mcrowe.com>
References: <20150205174208.GA7735@mcrowe.com>
	<1423158623-26927-1-git-send-email-mac@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <1423158623-26927-1-git-send-email-mac@mcrowe.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2] sed: Cope with ${bindir} and ${base_bindir} being the same
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
X-List-Received-Date: Tue, 03 Mar 2015 16:57:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 05 February 2015 at 17:50:23 +0000, Mike Crowe wrote:
> ${bindir} and ${base_bindir} may be the same. If they are don't try and
> move files onto themselves.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/recipes-extended/sed/sed_4.1.2.bb | 6 ++++--
>  meta/recipes-extended/sed/sed_4.2.2.bb | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
> index 4c0f345..40e3a53 100644
> --- a/meta/recipes-extended/sed/sed_4.1.2.bb
> +++ b/meta/recipes-extended/sed/sed_4.1.2.bb
> @@ -23,8 +23,10 @@ do_configure_prepend () {
>  do_install () {
>  	autotools_do_install
>  	install -d ${D}${base_bindir}
> -	mv ${D}${bindir}/sed ${D}${base_bindir}/sed
> -	rmdir ${D}${bindir}/
> +	if [ ! ${D}${bindir} -ef ${D}${base_bindir} ]; then
> +	    mv ${D}${bindir}/sed ${D}${base_bindir}/sed
> +	    rmdir ${D}${bindir}/
> +	fi
>  }
>  
>  ALTERNATIVE_${PN} = "sed"
> diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
> index 72976de..bbfa238 100644
> --- a/meta/recipes-extended/sed/sed_4.2.2.bb
> +++ b/meta/recipes-extended/sed/sed_4.2.2.bb
> @@ -22,8 +22,10 @@ EXTRA_OECONF = "--disable-acl \
>  do_install () {
>  	autotools_do_install
>  	install -d ${D}${base_bindir}
> -	mv ${D}${bindir}/sed ${D}${base_bindir}/sed
> -	rmdir ${D}${bindir}/
> +	if [ ! ${D}${bindir} -ef ${D}${base_bindir} ]; then
> +	    mv ${D}${bindir}/sed ${D}${base_bindir}/sed
> +	    rmdir ${D}${bindir}/
> +	fi
>  }
>  
>  ALTERNATIVE_${PN} = "sed"
> -- 
> 2.1.4

It doesn't look like this patch has been merged. Is there something wrong
with it than I need to attend to?

Thanks.

Mike.

