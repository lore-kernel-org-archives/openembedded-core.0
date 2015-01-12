Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E0EAC62252
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 11:46:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2015 03:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,743,1413270000"; d="scan'208";a="649778668"
Received: from fcrouzet-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.81])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2015 03:46:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Mon, 12 Jan 2015 11:46:21 +0000
Message-ID: <1479350.nZ5qbCGpkf@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1420646442-28948-3-git-send-email-markus.lehtonen@linux.intel.com>
References: <1420646442-28948-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1420646442-28948-3-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] combo-layer: support updating up to arbitrary commit
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
X-List-Received-Date: Mon, 12 Jan 2015 11:46:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Markus,

On Wednesday 07 January 2015 18:00:42 Markus Lehtonen wrote:
> Support defining the top commit up to which to update. In other words,
> this makes it possible to update up to certain point other than the
> branch head. The update point (git commitish) is given on the command
> line by appending the component name(s) with a colon and the commitish,
> e.g.
>  $ combo-layer update my_component:sha1
> 
> Only the "update" action supports this.
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  scripts/combo-layer | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/combo-layer b/scripts/combo-layer
> index 37d1f47..851003d 100755
> --- a/scripts/combo-layer
> +++ b/scripts/combo-layer
> @@ -26,6 +26,7 @@ import logging
>  import subprocess
>  import ConfigParser
>  import re
> +from collections import OrderedDict
> 
>  __version__ = "0.2.1"
> 
> @@ -347,7 +348,13 @@ def action_update(conf, args):
>          generate the patch list
>          apply the generated patches
>      """
> -    repos = get_repos(conf, args[1:])
> +    components = [arg.split(':')[0] for arg in args[1:]]
> +    revisions = []
> +    for arg in args[1:]:
> +        revision= arg.split(':', 1)[1] if ':' in arg else None
> +        revisions.append(revision)
> +    # Map commitishes to repos
> +    repos = OrderedDict(zip(get_repos(conf, components), revisions))
> 
>      # make sure combo repo is clean
>      check_repo_clean(os.getcwd())
> @@ -361,9 +368,9 @@ def action_update(conf, args):
>      if conf.nopull:
>          logger.info("Skipping pull (-n)")
>      else:
> -        action_pull(conf, args)
> +        action_pull(conf, ['arg0'] + components)

What's this 'arg0' ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

