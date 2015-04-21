Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA2C65CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 16:38:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 21 Apr 2015 09:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,617,1422950400"; d="scan'208";a="483764009"
Received: from ppiorkow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.9.218])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2015 09:38:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 17:38:41 +0100
Message-ID: <4377812.5jFbXo8eAY@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1429627940-29049-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1429627940-29049-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] devtool: modify: use B=S if that is the default for the recipe
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
X-List-Received-Date: Tue, 21 Apr 2015 16:38:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 April 2015 17:52:19 Markus Lehtonen wrote:
> Makes the build succeed for packages which do not support separate build
> directory, e.g. zlib. The same outcome could be achieved with the
> --same-dir option, but, it's generally hard to tell if a random package
> would need that option. The negative side effect of this patch is that
> dev srctree (of some packages that build fine without this modification)
> gets dirtied by build artefacts.
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index 96e3bdb..1c1bce8 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -391,12 +391,19 @@ def modify(args, config, basepath, workspace):
>          f.write('inherit externalsrc\n')
>          f.write('# NOTE: We use pn- overrides here to avoid affecting
> multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
> f.write('EXTERNALSRC_pn-%s = "%s"\n' % (args.recipename, srctree)) -       
> if args.same_dir or bb.data.inherits_class('autotools-brokensep', rd): -   
>         if args.same_dir:
> -                logger.info('using source tree as build directory since
> --same-dir specified') -            else:
> -                logger.info('using source tree as build directory since
> original recipe inherits autotools-brokensep') +
> +        b_is_s = True
> +        if args.same_dir:
> +            logger.info('using source tree as build directory since
> --same-dir specified') +        elif
> bb.data.inherits_class('autotools-brokensep', rd):
> +            logger.info('using source tree as build directory since
> original recipe inherits autotools-brokensep') +        elif rd.getVar('B',
> True) == s:
> +            logger.info('using source tree as build directory since that is
> the default for this recipe') +        else:
> +            b_is_s = False
> +        if b_is_s:
>              f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (args.recipename,
> srctree)) +
>          if initial_rev:
>              f.write('\n# initial_rev: %s\n' % initial_rev)
>              for commit in commits:

Both this and 2/2 look good to me.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

