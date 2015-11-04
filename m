Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9EFB560125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 15:48:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 04 Nov 2015 07:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,243,1444719600"; d="scan'208";a="842496307"
Received: from atharazi-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.130.179])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2015 07:48:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tzu-Jung Lee <roylee17@currantlabs.com>
Date: Wed, 04 Nov 2015 15:48:06 +0000
Message-ID: <28368483.pNfb4kAufo@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.11; x86_64; ; )
In-Reply-To: <CAHZ5O5wJAsNPv52=_YDFUebC5H3H1N9Z3zsPN7QRakpox14B1A@mail.gmail.com>
References: <1445468805-22100-1-git-send-email-roylee17@currantlabs.com>
	<7693189.S1Wl4IG7qW@peggleto-mobl.ger.corp.intel.com>
	<CAHZ5O5wJAsNPv52=_YDFUebC5H3H1N9Z3zsPN7QRakpox14B1A@mail.gmail.com>
MIME-Version: 1.0
Cc: Tzu-Jung Lee <roy@currantlabs.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] devtool: add sync command
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
X-List-Received-Date: Wed, 04 Nov 2015 15:48:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 26 October 2015 10:29:24 Tzu-Jung Lee wrote:
> Hi Paul
> 
> On Mon, Oct 26, 2015 at 2:20 AM, Paul Eggleton <
> 
> paul.eggleton@linux.intel.com> wrote:
> > Hi Tzu-Jung,
> > 
> > Thanks for the patch.
> > 
> > On Wednesday 21 October 2015 23:06:45 Tzu-Jung Lee wrote:
> > > The sync command is similar to the extract command, except it
> > > fetches the sync'ed and patched branch to an existing git repository.
> > > 
> > > This enables users to keep track the upstream development while
> > > maintaining their own local git repository at the same time.
> > > 
> > > Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>
> > > ---
> > > 
> > >  scripts/lib/devtool/standard.py | 73
> > > 
> > > +++++++++++++++++++++++++++++++---------- 1 file changed, 56
> > 
> > insertions(+),
> > 
> > > 17 deletions(-)
> > > 
> > > diff --git a/scripts/lib/devtool/standard.py
> > > b/scripts/lib/devtool/standard.py index 5d7e903..2c6b7b3 100644
> > > --- a/scripts/lib/devtool/standard.py
> > > +++ b/scripts/lib/devtool/standard.py
> > > 
> > > @@ -234,7 +234,29 @@ def extract(args, config, basepath, workspace):
> > >          return 1
> > >      
> > >      srctree = os.path.abspath(args.srctree)
> > > 
> > > -    initial_rev = _extract_source(srctree, args.keep_temp, args.branch,
> > 
> > rd)
> > 
> > > +    initial_rev = _extract_source(srctree, args.keep_temp, args.branch,
> > > False, rd)
> > > +    logger.info('Source tree extracted to %s' % srctree)
> > > +
> > > +    if initial_rev:
> > > +        return 0
> > > +    else:
> > > +        return 1
> > 
> > Hmm, so your patch shows this check being added but it's there in master.
> > Are
> > you patching an older version?
> 
> Not really, it was patched against the tip of master.
> But git is sometimes confused by the boundary of back-to-back similar
> functions.
> So that checks are actually belongs to "def sync", which was copied from
> "def extract"
> 
>     def extract
>         ...
> --------------------
> 
> |      [checks]
> |   
> |   def sync
> |   
> |       ...
> 
> --------------------
>        [checks]
> 
> > +def sync(args, config, basepath, workspace):
> > > +    """Entry point for the devtool 'sync' subcommand"""
> > > +    import bb
> > > +
> > > +    tinfoil = _prep_extract_operation(config, basepath,
> > > args.recipename)
> > > +    if not tinfoil:
> > > +        # Error already shown
> > > +        return 1
> > > +
> > > +    rd = parse_recipe(config, tinfoil, args.recipename, True)
> > > +    if not rd:
> > > +        return 1
> > > +
> > > +    srctree = os.path.abspath(args.srctree)
> > > +    initial_rev = _extract_source(srctree, args.keep_temp, args.branch,
> > > True, rd) logger.info('Source tree extracted to %s' % srctree)
> > > 
> > >      if initial_rev:
> > > @@ -289,7 +311,7 @@ def _prep_extract_operation(config, basepath,
> > > recipename): return tinfoil
> > > 
> > > 
> > > -def _extract_source(srctree, keep_temp, devbranch, d):
> > > 
> > > +def _extract_source(srctree, keep_temp, devbranch, sync, d):
> > >      """Extract sources of a recipe"""
> > >      import bb.event
> > >      import oe.recipeutils
> > > 
> > > @@ -308,21 +330,26 @@ def _extract_source(srctree, keep_temp, devbranch,
> > 
> > d):
> > >      _check_compatible_recipe(pn, d)
> > > 
> > > -    if os.path.exists(srctree):
> > > -        if not os.path.isdir(srctree):
> > > -            raise DevtoolError("output path %s exists and is not a
> > > directory" % -                               srctree)
> > > -        elif os.listdir(srctree):
> > > -            raise DevtoolError("output path %s already exists and is "
> > > -                               "non-empty" % srctree)
> > > +    if sync:
> > > +        if not os.path.exists(srctree):
> > > +                raise DevtoolError("output path %s does not exist" %
> > > srctree) +    else:
> > > +        if os.path.exists(srctree):
> > > +            if not os.path.isdir(srctree):
> > > +                raise DevtoolError("output path %s exists and is not a
> > > directory" % +                                   srctree)
> > > +            elif os.listdir(srctree):
> > > +                raise DevtoolError("output path %s already exists and
> > 
> > is "
> > 
> > > +                                   "non-empty" % srctree)
> > > 
> > > -    if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
> > > -        raise DevtoolError("The %s recipe has do_unpack disabled,
> > 
> > unable to
> > 
> > > " -                           "extract source" % pn)
> > > +        if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
> > > +            raise DevtoolError("The %s recipe has do_unpack disabled,
> > > unable to " +                               "extract source" % pn)
> > > 
> > > -    # Prepare for shutil.move later on
> > > -    bb.utils.mkdirhier(srctree)
> > > -    os.rmdir(srctree)
> > > +    if not sync:
> > > +        # Prepare for shutil.move later on
> > > +        bb.utils.mkdirhier(srctree)
> > > +        os.rmdir(srctree)
> > > 
> > >      # We don't want notes to be printed, they are too verbose
> > >      origlevel = bb.logger.getEffectiveLevel()
> > > 
> > > @@ -431,8 +458,11 @@ def _extract_source(srctree, keep_temp, devbranch,
> > 
> > d):
> > >              logger.info('Adding local source files to srctree...')
> > >              shutil.move(os.path.join(tempdir, 'oe-local-files'),
> > 
> > srcsubdir)
> > 
> > > +        if sync:
> > > +            bb.process.run('git fetch file://' + srcsubdir + ' ' +
> > > devbranch + ':' + devbranch, cwd=srctree)
> > > +        else:
> > > +            shutil.move(srcsubdir, srctree)
> > > 
> > > -        shutil.move(srcsubdir, srctree)
> > > 
> > >      finally:
> > >          bb.logger.setLevel(origlevel)
> > > 
> > > @@ -532,7 +562,7 @@ def modify(args, config, basepath, workspace):
> > >      commits = []
> > >      srctree = os.path.abspath(args.srctree)
> > > 
> > >      if args.extract:
> > > -        initial_rev = _extract_source(args.srctree, False, args.branch,
> > 
> > rd)
> > 
> > > +        initial_rev = _extract_source(args.srctree, False, args.branch,
> > > 
> > > False, rd) if not initial_rev:
> > >              return 1
> > >          
> > >          logger.info('Source tree extracted to %s' % srctree)
> > > 
> > > @@ -1107,6 +1137,15 @@ def register_commands(subparsers, context):
> > >      parser_extract.add_argument('--keep-temp', action="store_true",
> > > 
> > > help='Keep temporary directory (for debugging)')
> > > parser_extract.set_defaults(func=extract)
> > > 
> > > +    parser_sync = subparsers.add_parser('sync', help='Synchronize the
> > > source for an existing recipe', +
> > > description='Synchronize the source for an existing recipe', +
> > > 
> > > formatter_class=argparse.ArgumentDefaultsHelpFormatter) +
> > > parser_sync.add_argument('recipename', help='Name for recipe to sync the
> > > source for') +    parser_sync.add_argument('srctree', help='Path to
> > > where
> > > to sync the source tree') +    parser_sync.add_argument('--branch',
> > > '-b',
> > > default="devtool", help='Name for development branch to checkout') +
> > > parser_sync.add_argument('--keep-temp', action="store_true", help='Keep
> > > temporary directory (for debugging)') +
> > > parser_sync.set_defaults(func=sync)
> > > +
> > > 
> > >      parser_update_recipe = subparsers.add_parser('update-recipe',
> > > 
> > > help='Apply changes from external source tree to recipe',
> > > description='Applies changes from external source tree to a recipe
> > > (updating/adding/removing patches as necessary, or by updating SRCREV)')
> > > parser_update_recipe.add_argument('recipename', help='Name of recipe to
> > > update')
> > 
> > Exploring the use case a bit more, do you anticipate using this sync
> > command
> > in conjunction with a recipe that's in the workspace, or standalone?
> 
> The use case is for workspace to keep git repos up-to-date. (Kind of
> rebasing) So the assumption is that the recipes have a corresponding git
> repository already, which could be an existing internal one, or a freshly
> constructed by an earlier devtool modify/extract. For standalone recipes,
> they can still go through the workspace :-)

I guess what I was wondering was is there a way we can better fit this in with 
devtool's workflow for when the recipe is in the workspace. However, other than 
perhaps not expecting the path to the source tree when the recipe is in the 
workspace I can't think of anything though. I guess we can always improve it 
later.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

