Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 287BA72491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 10:26:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 30 Apr 2015 03:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,676,1422950400"; d="scan'208";a="687945809"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga001.jf.intel.com with ESMTP; 30 Apr 2015 03:26:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Thu, 30 Apr 2015 11:26:34 +0100
Message-ID: <2485695.8j5bf1Bp03@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.6 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <1430389061.9508.14.camel@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
	<df99c07e8afaaef6fe5f0ada4cd3f33b7f7b555f.1430314621.git.paul.eggleton@linux.intel.com>
	<1430389061.9508.14.camel@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] recipetool: ensure git clone is a full clone when extracting
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
X-List-Received-Date: Thu, 30 Apr 2015 10:26:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Markus,

On Thursday 30 April 2015 13:17:41 Markus Lehtonen wrote:
> On Wed, 2015-04-29 at 14:41 +0100, Paul Eggleton wrote:
> > If -x is specified and the specified URI was a git repository, we need
> > to ensure that the resulting clone is a full clone and not one that has
> > pointers into the temporary fetch location or DL_DIR. Split out the code
> > from devtool that already does this for "devtool modify -x" and reuse
> > that.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  scripts/lib/devtool/standard.py  |  8 ++------
> >  scripts/lib/recipetool/create.py |  2 ++
> >  scripts/lib/scriptutils.py       | 10 ++++++++++
> >  3 files changed, 14 insertions(+), 6 deletions(-)
> > 
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py index 94b5e0b..eb41f28 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -23,6 +23,7 @@ import glob
> > 
> >  import tempfile
> >  import logging
> >  import argparse
> > 
> > +import scriptutils
> > 
> >  from devtool import exec_build_env_command, setup_tinfoil
> >  
> >  logger = logging.getLogger('devtool')
> > 
> > @@ -236,12 +237,7 @@ def _extract_source(srctree, keep_temp, devbranch, 
d):
> >              # Handle if S is set to a subdirectory of the source
> >              srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir,
> >              workdir).split(os.sep)[0])> 
> > -        if os.path.exists(os.path.join(srcsubdir, '.git')):
> > -            alternatesfile = os.path.join(srcsubdir, '.git', 'objects',
> > 'info', 'alternates') -            if os.path.exists(alternatesfile):
> > -                # This will have been cloned with -s, so we need to
> > convert it to a full clone -                bb.process.run('git repack
> > -a', cwd=srcsubdir)
> > -                os.remove(alternatesfile)
> > +        scriptutils.git_convert_full_clone(srcsubdir)
> > 
> >          patchdir = os.path.join(srcsubdir, 'patches')
> >          haspatches = False
> > 
> > diff --git a/scripts/lib/recipetool/create.py
> > b/scripts/lib/recipetool/create.py index 1d5bfd9..15de694 100644
> > --- a/scripts/lib/recipetool/create.py
> > +++ b/scripts/lib/recipetool/create.py
> > @@ -22,6 +22,7 @@ import glob
> > 
> >  import fnmatch
> >  import re
> >  import logging
> > 
> > +import scriptutils
> > 
> >  logger = logging.getLogger('recipetool')
> > 
> > @@ -238,6 +239,7 @@ def create_recipe(args):
> >      outlines.extend(lines_after)
> > 
> >      if args.extract_to:
> > +        scriptutils.git_convert_full_clone(srctree)
> > 
> >          shutil.move(srctree, args.extract_to)
> >          logger.info('Source extracted to %s' % args.extract_to)
> > 
> > diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
> > index e786126..4af6fd5 100644
> > --- a/scripts/lib/scriptutils.py
> > +++ b/scripts/lib/scriptutils.py
> > 
> > @@ -58,3 +58,13 @@ def load_plugins(logger, plugins, pluginpath):
> >              if hasattr(plugin, 'plugin_init'):
> >                  plugin.plugin_init(plugins)
> >                  plugins.append(plugin)
> > 
> > +
> > +def git_convert_full_clone(repodir):
> > +    """If specified directory is a git repository, ensure it's a full
> > clone""" +    import bb.process
> > +    if os.path.exists(os.path.join(repodir, '.git')):
> > +        alternatesfile = os.path.join(repodir, '.git', 'objects', 'info',
> > 'alternates') +        if os.path.exists(alternatesfile):
> > +            # This will have been cloned with -s, so we need to convert
> > it to a full clone +            bb.process.run('git repack -a',
> > cwd=repodir)
> > +            os.remove(alternatesfile)
> 
> I just find the term "full clone" a bit misleading here. I somehow tend
> to associate it with a mirrored clone / cloning all refs / cloning with
> full history. Could the term used above be "independent clone" or
> "standalone clone" or something?

Yep, sounds reasonable - I'll rename it in a v2.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

