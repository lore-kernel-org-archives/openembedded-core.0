Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC2B71995
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 23:54:47 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 02 Oct 2016 16:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,287,1473145200"; d="scan'208";a="15985239"
Received: from jhelton-mobl1.amr.corp.intel.com ([10.252.129.214])
	by orsmga004.jf.intel.com with ESMTP; 02 Oct 2016 16:54:48 -0700
Date: Sun, 2 Oct 2016 16:54:48 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20161002235448.GA12195@jhelton-mobl1.amr.corp.intel.com>
References: <20161002205506.124239-1-stephano.cetola@linux.intel.com>
	<1551142.S3eIX641iV@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1551142.S3eIX641iV@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: modify command fails to ignore source files
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
X-List-Received-Date: Sun, 02 Oct 2016 23:54:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/03, Paul Eggleton wrote:
> Hi Stephano,
> 
> Thanks for looking into this, a few things:
> 
> On Sun, 02 Oct 2016 13:55:06 Stephano Cetola wrote:
> > With recent changes to recipeutils, the list of local files returned
> > by get_recipe_local_files could possibly include source files. This
> > only happens when the recipe contains a SRC_URI using subdir= to put
> > files in the source tree. These files should be ignored when
> > populating the list of local files for oe-local-files directory.
> 
> You should include "Fixes [YOCTO #10326]." here. Also, if a patch fixes a 
> regression that we've been able to track down, as part of the commit message I 
> like to mention which revision caused it, and in this case it would be 
> OE-Core revision 9069fef5dad5a873c8a8f720f7bcbc7625556309.

Ops,thanks for catching that. Also, thanks for the notes on regressions.

> 
> > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > ---
> >  scripts/lib/devtool/standard.py | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py index 8319145..c7a5712 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -568,8 +568,12 @@ def _extract_source(srctree, keep_temp, devbranch,
> > sync, d): recipe_patches = [os.path.basename(patch) for patch in
> >                            oe.recipeutils.get_recipe_patches(crd)]
> >          local_files = oe.recipeutils.get_recipe_local_files(crd)
> > +
> > +        # Ignore local files with subdir={BP}
> > +        srcdirname = os.path.basename(os.path.normpath(srcsubdir))
> >          local_files = [fname for fname in local_files if
> > -                       os.path.exists(os.path.join(workdir, fname))]
> > +                       os.path.exists(os.path.join(workdir, fname)) and
> > +                       srcdirname not in fname]
> 
> This seems likely to false-trigger quite easily - you're only looking for the 
> basename and whether it appears anywhere in the path rather than at the start. 
> I'd suggest getting the absolute path to the source directory and check if it 
> starts with that (I think that's how I dealt with that elsewhere).

Ah okay, I think I see what you're saying. I'll fix this and
resubmit.

> 
> Cheers,
> Paul
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre

