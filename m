Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBC560167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 13:27:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 22 Apr 2015 06:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,623,1422950400"; d="scan'208";a="484177381"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2015 06:27:06 -0700
Message-ID: <1429709225.5183.13.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 22 Apr 2015 16:27:05 +0300
In-Reply-To: <2243141.uRBUZPtYeh@peggleto-mobl.ger.corp.intel.com>
References: <1429627843-28955-1-git-send-email-markus.lehtonen@linux.intel.com>
	<2243141.uRBUZPtYeh@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.11 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: include bbappends in recipe parsing
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
X-List-Received-Date: Wed, 22 Apr 2015 13:27:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,


On Tue, 2015-04-21 at 17:42 +0100, Paul Eggleton wrote:
> On Tuesday 21 April 2015 17:50:43 Markus Lehtonen wrote:
> > In order to get correct metadata, SRCREV for example.
> > 
> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > ---
> >  meta/lib/oe/recipeutils.py      |  6 +++---
> >  scripts/lib/devtool/standard.py | 32 +++++++++++++++++++-------------
> >  2 files changed, 22 insertions(+), 16 deletions(-)
> > 
> > diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> > index 159a103..09bd7fd 100644
> > --- a/meta/lib/oe/recipeutils.py
> > +++ b/meta/lib/oe/recipeutils.py
> > @@ -44,10 +44,10 @@ def get_unavailable_reasons(cooker, pn):
> >      return taskdata.get_reasons(pn)
> > 
> > 
> > -def parse_recipe(fn, d):
> > +def parse_recipe(fn, appends, d):
> >      """Parse an individual recipe"""
> >      import bb.cache
> > -    envdata = bb.cache.Cache.loadDataFull(fn, [], d)
> > +    envdata = bb.cache.Cache.loadDataFull(fn, appends, d)
> >      return envdata
> > 
> > 
> > @@ -55,7 +55,7 @@ def get_var_files(fn, varlist, d):
> >      """Find the file in which each of a list of variables is set.
> >      Note: requires variable history to be enabled when parsing.
> >      """
> > -    envdata = parse_recipe(fn, d)
> > +    envdata = parse_recipe(fn, [], d)
> >      varfiles = {}
> >      for v in varlist:
> >          history = envdata.varhistory.variable(v)
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py index d5ded2f..96e3bdb 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -130,18 +130,26 @@ def _get_recipe_file(cooker, pn):
> >              logger.error("Unable to find any recipe file matching %s" % pn)
> > return recipefile
> > 
> > +def _parse_recipe(tinfoil, pn, appends):
> > +    """Parse recipe of a package"""
> > +    import oe.recipeutils
> > +    recipefile = _get_recipe_file(tinfoil.cooker, pn)
> > +    if not recipefile:
> > +        # Error already logged
> > +        return None
> > +    if appends:
> > +        append_files =
> > tinfoil.cooker.collection.get_file_appends(recipefile) +    return
> > oe.recipeutils.parse_recipe(recipefile, append_files,
> > +                                       tinfoil.config_data)
> > 
> >  def extract(args, config, basepath, workspace):
> >      import bb
> > -    import oe.recipeutils
> > 
> >      tinfoil = setup_tinfoil()
> > 
> > -    recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
> > -    if not recipefile:
> > -        # Error already logged
> > +    rd = _parse_recipe(tinfoil, args.recipename, True)
> > +    if not rd:
> >          return -1
> > -    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
> > 
> >      srctree = os.path.abspath(args.srctree)
> >      initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
> > @@ -327,11 +335,10 @@ def modify(args, config, basepath, workspace):
> > 
> >      tinfoil = setup_tinfoil()
> > 
> > -    recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
> > -    if not recipefile:
> > -        # Error already logged
> > +    rd = _parse_recipe(tinfoil, args.recipename, True)
> > +    if not rd:
> >          return -1
> > -    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
> > +    recipefile = rd.getVar('FILE', True)
> > 
> >      if not _check_compatible_recipe(args.recipename, rd):
> >          return -1
> > @@ -418,11 +425,10 @@ def update_recipe(args, config, basepath, workspace):
> >      from oe.patch import GitApplyTree
> >      import oe.recipeutils
> > 
> > -    recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
> > -    if not recipefile:
> > -        # Error already logged
> > +    rd = _parse_recipe(tinfoil, args.recipename, True)
> > +    if not rd:
> >          return -1
> > -    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
> > +    recipefile = rd.getVar('FILE', True)
> > 
> >      orig_src_uri = rd.getVar('SRC_URI', False) or ''
> >      if args.mode == 'auto':
> 
> I ran the oe-selftest tests and unfortunately this appears to cause a 
> regression - you can see the test failure by running:
> 
> oe-selftest --run-tests devtool.DevtoolTests.test_devtool_update_recipe_git
> 
> I suspect this might be because with this patch we'd be seeing the bbappends 
> within the workspace layer, which might tangle things up.

Good point, I'll post an updated patch.

However, seems that the tests got already broken earlier, even before my
patch. I'll send another patch to fix the tests.

Thanks,
  Markus




