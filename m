Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D791D719FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 01:43:40 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 03 Oct 2016 18:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,292,1473145200"; d="scan'208";a="16345703"
Received: from kjacobse-mobl1.amr.corp.intel.com ([10.252.205.248])
	by orsmga004.jf.intel.com with ESMTP; 03 Oct 2016 18:43:39 -0700
Date: Mon, 3 Oct 2016 18:43:38 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20161004014338.GA25207@kjacobse-mobl1.amr.corp.intel.com>
References: <20161002235824.131044-1-stephano.cetola@linux.intel.com>
	<1617309.fNo2yXclr1@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1617309.fNo2yXclr1@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] devtool: modify command fails to ignore source files
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
X-List-Received-Date: Tue, 04 Oct 2016 01:43:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/04, Paul Eggleton wrote:
> On Sun, 02 Oct 2016 16:58:24 Stephano Cetola wrote:
> > With recent changes to recipeutils, the list of local files returned
> > by get_recipe_local_files could possibly include source files. This
> > only happens when the recipe contains a SRC_URI using subdir= to put
> > files in the source tree. These files should be ignored when
> > populating the list of local files for oe-local-files directory.
> > 
> > [YOCTO #10326]
> > 
> > introduced in
> > OE-Core revision 9069fef5dad5a873c8a8f720f7bcbc7625556309
> > 
> > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > ---
> >  scripts/lib/devtool/standard.py | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py index 8319145..b6f9e12 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -568,8 +568,12 @@ def _extract_source(srctree, keep_temp, devbranch,
> > sync, d): recipe_patches = [os.path.basename(patch) for patch in
> >                            oe.recipeutils.get_recipe_patches(crd)]
> >          local_files = oe.recipeutils.get_recipe_local_files(crd)
> > +
> > +        # Ignore local files with subdir={BP}
> > +        srcabspath = os.path.abspath(srcsubdir)
> >          local_files = [fname for fname in local_files if
> > -                       os.path.exists(os.path.join(workdir, fname))]
> > +                       os.path.exists(os.path.join(workdir, fname)) and
> > +                       not os.path.join(workdir,
> > fname).startswith(srcabspath)] if local_files:
> >              for fname in local_files:
> >                  _move_file(os.path.join(workdir, fname),
> 
> OK - this looks better. One minor tweak I'd suggest though is to add os.sep on 
> the end of srcabspath so we can be sure we're matching that directory and not 
> one whose name starts with the same string.

Good point. I'll add this in and resubmit.

> 
> Cheers,
> Paul
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre

