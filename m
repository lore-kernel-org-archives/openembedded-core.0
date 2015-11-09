Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 49AE175EE7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 10:13:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 02:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="831506123"
Received: from pdelcroi-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.221])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2015 02:12:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tzu-Jung Lee <roylee17@currantlabs.com>
Date: Mon, 09 Nov 2015 10:12:39 +0000
Message-ID: <2702139.DZhhJoAPGz@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.10-100.fc21.x86_64; KDE/4.14.11; x86_64; ;
	)
In-Reply-To: <1446873010-15801-1-git-send-email-roylee17@currantlabs.com>
References: <CAHZ5O5wc-mLh9akYz=tnbDiw9ngH7PJNRr_0WsTJbiB6ae8L0w@mail.gmail.com>
	<1446873010-15801-1-git-send-email-roylee17@currantlabs.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] devtool: add sync command
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
X-List-Received-Date: Mon, 09 Nov 2015 10:13:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 06 November 2015 21:10:10 Tzu-Jung Lee wrote:
> The sync command is similar to the extract command, except it
> fetches the sync'ed and patched branch to an existing git repository.
> 
> This enables users to keep track the upstream development while
> maintaining their own local git repository at the same time.
> 
> Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index c5c647b..8efd262 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -238,7 +238,29 @@ def extract(args, config, basepath, workspace):
>          return 1
> 
>      srctree = os.path.abspath(args.srctree)
> -    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
> +    initial_rev = _extract_source(srctree, args.keep_temp, args.branch,
> False, rd) +    logger.info('Source tree extracted to %s' % srctree)
> +
> +    if initial_rev:
> +        return 0
> +    else:
> +        return 1
> +
> +def sync(args, config, basepath, workspace):
> +    """Entry point for the devtool 'sync' subcommand"""
> +    import bb
> +
> +    tinfoil = _prep_extract_operation(config, basepath, args.recipename)
> +    if not tinfoil:
> +        # Error already shown
> +        return 1
> +
> +    rd = parse_recipe(config, tinfoil, args.recipename, True)
> +    if not rd:
> +        return 1
> +
> +    srctree = os.path.abspath(args.srctree)
> +    initial_rev = _extract_source(srctree, args.keep_temp, args.branch,
> True, rd) logger.info('Source tree extracted to %s' % srctree)
> 
>      if initial_rev:
> @@ -293,7 +315,7 @@ def _prep_extract_operation(config, basepath,
> recipename): return tinfoil
> 
> 
> -def _extract_source(srctree, keep_temp, devbranch, d):
> +def _extract_source(srctree, keep_temp, devbranch, sync, d):

You're changing this function but you missed updating one call in  
scripts/lib/devtool/upgrade.py. (I know, the name starting with _ implies it's 
internal, but we're also using it there as well).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

