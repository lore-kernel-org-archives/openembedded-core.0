Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCCA65CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 15:05:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 21 Apr 2015 08:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="683415891"
Received: from ppiorkow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.9.218])
	by orsmga001.jf.intel.com with ESMTP; 21 Apr 2015 08:04:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Tue, 21 Apr 2015 16:04:57 +0100
Message-ID: <11442871.jqCMSY985y@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1429627794-28895-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1429627794-28895-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: extract: remove patches when S=WORKDIR
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
X-List-Received-Date: Tue, 21 Apr 2015 15:05:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Markus,

On Tuesday 21 April 2015 17:49:54 Markus Lehtonen wrote:
> All local files from the layer, including patches, are added to to
> srctree repository when S==WORKDIR. The patch files are useless as they
> are automatically applied on top of the srctree by devtool.
> 
> This change causes devtool extract to remove these unnecessary (and
> possibly confusing) patch file(s). The patches will be removed in one
> single commit.
> 
> [YOCTO #7602]
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py index a50a771..41bcf86 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -248,6 +248,26 @@ def _extract_source(srctree, keep_temp, devbranch, d):
>              else:
>                  os.rmdir(patchdir)
> 
> +        # Find local patches that were "unpacked" to srctree directory
> +        patches = []
> +        for uri in (crd.getVar('SRC_URI', True) or "").split():
> +            if uri.startswith('file://'):
> +                fname = os.path.basename(uri).split(';')[0]
> +                # Take patch "basename" without the possible compression
> +                # extension (.gz etc)
> +                match = re.match(r'^(.+\.patch)(\..+)?$', fname)
> +                if match:
> +                    patches.append(match.group(1))

Could you please use get_recipe_patches() from recipeutils.py for this? 
There's some logic in there that I'd rather we didn't re-implement.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

