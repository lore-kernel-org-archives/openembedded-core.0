Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 59D1E73183
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:42:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2016 14:42:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,530,1444719600"; d="scan'208";a="629143818"
Received: from bzhou5-mobl2.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.147.172])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2016 14:42:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Date: Thu, 07 Jan 2016 11:42:48 +1300
Message-ID: <32271845.G6keziNVL7@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <ba0f9159197a8f0af61c637a5f4fdf024a2dbab0.1452118391.git.randy.e.witt@linux.intel.com>
References: <cover.1452118391.git.randy.e.witt@linux.intel.com>
	<ba0f9159197a8f0af61c637a5f4fdf024a2dbab0.1452118391.git.randy.e.witt@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] copy_buildsystem.py: Allow substring matches for excluded_targets
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
X-List-Received-Date: Wed, 06 Jan 2016 22:42:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Randy,

On Wed, 06 Jan 2016 14:15:49 Randy Witt wrote:
> This is so that the excluded_targets passed to prune_lockedsigs can
> take a partial form such as nativesdk to filter based on partial matches.
> 
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> ---
>  meta/lib/oe/copy_buildsystem.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oe/copy_buildsystem.py
> b/meta/lib/oe/copy_buildsystem.py index 15af4eb..9d8f3a6 100644
> --- a/meta/lib/oe/copy_buildsystem.py
> +++ b/meta/lib/oe/copy_buildsystem.py
> @@ -83,8 +83,11 @@ def prune_lockedsigs(allowed_tasks, excluded_targets,
> lockedsigs, pruned_output) for line in infile:
>                  if invalue:
>                      if line.endswith('\\\n'):
> -                        splitval = line.strip().split(':')
> -                        if splitval[1] in allowed_tasks and not splitval[0]
> in excluded_targets: +                        target, task =
> line.strip().split(':')[:2] +                        badmatch = ([x for x
> in excluded_targets.split() +                                     if x in
> target])
> +
> +                        if task in allowed_tasks and not badmatch:

Actually Mark and I have just noticed excluded_targets is being treated as a 
list in the original code here but we're passing in a string. I think maybe 
expecting the caller to supply a list would be a better approach (so we would 
call .split() on the value of SDK_TARGETS before passing it in). Could you 
take care of that in a separate patch before doing this?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

