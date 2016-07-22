Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC0176067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 19:42:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6MJgLhO003596
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Jul 2016 12:42:21 -0700 (PDT)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 22 Jul 2016 12:42:20 -0700
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id 6FBC4282EEE; Fri,
	22 Jul 2016 15:42:20 -0400 (EDT)
Date: Fri, 22 Jul 2016 15:42:20 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160722194218.GA12632@windriver.com>
References: <1469200932.23580.69.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1469200932.23580.69.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-dev: Ensure we don't reparse the recipe when its not being used (take 2)
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
X-List-Received-Date: Fri, 22 Jul 2016 19:42:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[[OE-core] [PATCH] linux-yocto-dev: Ensure we don't reparse the recipe when its not being used (take 2)] On 22/07/2016 (Fri 16:22) Richard Purdie wrote:

> The use of the ${AUTOREV} variable means bitbake would always re-parse the
> recipe. This isn't desirable when its disabled so undo the always parsing
> flag in this case.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Applied the revert and this take 2, and I see:

7: linux-yocto-dev-4.6-rc++gitAUTOINC+81548cf96c_673790d078-r0 do_unpack (pid 29471)

It would have blown up in fetch with take 1, so ....

Tested-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Thanks,
Paul.
--

> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 3085263..c777350 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -19,6 +19,7 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
>  # by the use of AUTOREV SRCREVs, which are the default for this recipe.
>  python () {
>      if d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) != "linux-yocto-dev":
> +        d.delVar("BB_DONT_CACHE")
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-dev to enable it")
>  }
>  
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

