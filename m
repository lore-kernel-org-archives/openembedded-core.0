Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CECE571BA0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:59:29 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 04:59:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,406,1496127600"; d="scan'208";a="130395604"
Received: from mwidmer-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.43.109])
	by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2017 04:59:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Date: Mon, 24 Jul 2017 13:59:28 +0200
Message-ID: <2731401.MvQCrO92Yh@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1500884703-154582-2-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1500884703-154582-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1500884703-154582-2-git-send-email-rebecca.swee.fun.chang@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 1/3] recipetool: create: disable PREMIRRORS and MIRRORS by default
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
X-List-Received-Date: Mon, 24 Jul 2017 11:59:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Rebecca,

On Monday, 24 July 2017 10:25:01 AM CEST Chang Rebecca Swee Fun wrote:
> When creating new recipes, we are almost certainly fetching a new
> source rather that something that has already been fetched. I have
> disable PREMIRRORS and MIRRORS settings from tinfoil while leaving
> an option for users to enable them manually if needed.
> 
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  scripts/lib/recipetool/create.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/
create.py
> index 359eb9a..3885017 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -422,6 +422,7 @@ def create_recipe(args):
>      source = args.source
>      srcsubdir = ''
>      srcrev = '${AUTOREV}'
> +    mirrors = args.mirrors
>  
>      if os.path.isfile(source):
>          source = 'file://%s' % os.path.abspath(source)
> @@ -440,6 +441,14 @@ def create_recipe(args):
>              srcrev = res.group(1)
>              srcuri = rev_re.sub('', srcuri)
>  
> +        if not mirrors:
> +            # We do not need PREMIRRORS since we are almost certainly
> +            # fetching new source rather than something that has already
> +            # been fetched. Hence, we disable them by default.
> +            # However, we provide an option for users to enable it.
> +            tinfoil.config_data.setVar('PREMIRRORS', '')
> +            tinfoil.config_data.setVar('MIRRORS', '')

I think we need to set these in the dummy recipe we're creating rather than 
through tinfoil.config_data, otherwise we'll break PREMIRRORS / MIRRORS needed 
to fetch other items if they've not already been fetched. Also, I'm not sure, 
but the above may trigger a reparse which we'd want to avoid as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

