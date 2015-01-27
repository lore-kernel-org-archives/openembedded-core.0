Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ABF1E718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 14:52:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 Jan 2015 06:46:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,475,1418112000"; d="scan'208";a="668393385"
Received: from krogon-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.16.44])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2015 06:52:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jan 2015 14:52:23 +0000
Message-ID: <37435110.6UC4Jjg6C7@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1422368253.18842.46.camel@marquiz.fi.intel.com>
References: <1420646442-28948-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1479350.nZ5qbCGpkf@peggleto-mobl5.ger.corp.intel.com>
	<1422368253.18842.46.camel@marquiz.fi.intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 27 Jan 2015 14:52:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 27 January 2015 16:17:33 Markus Lehtonen wrote:
> On Mon, 2015-01-12 at 11:46 +0000, Paul Eggleton wrote:
> > On Wednesday 07 January 2015 18:00:42 Markus Lehtonen wrote:
> > > Support defining the top commit up to which to update. In other words,
> > > this makes it possible to update up to certain point other than the
> > > branch head. The update point (git commitish) is given on the command
> > > line by appending the component name(s) with a colon and the commitish,
> > > e.g.
> > > 
> > >  $ combo-layer update my_component:sha1
> > > 
> > > Only the "update" action supports this.
> > > 
> > > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > > ---
> > > 
> > >  scripts/combo-layer | 22 ++++++++++++++++------
> > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/scripts/combo-layer b/scripts/combo-layer
> > > index 37d1f47..851003d 100755
> > > --- a/scripts/combo-layer
> > > +++ b/scripts/combo-layer
> > > @@ -26,6 +26,7 @@ import logging
> > > 
> > >  import subprocess
> > >  import ConfigParser
> > >  import re
> > > 
> > > +from collections import OrderedDict
> > > 
> > >  __version__ = "0.2.1"
> > > 
> > > @@ -347,7 +348,13 @@ def action_update(conf, args):
> > >          generate the patch list
> > >          apply the generated patches
> > >      
> > >      """
> > > 
> > > -    repos = get_repos(conf, args[1:])
> > > +    components = [arg.split(':')[0] for arg in args[1:]]
> > > +    revisions = []
> > > +    for arg in args[1:]:
> > > +        revision= arg.split(':', 1)[1] if ':' in arg else None
> > > +        revisions.append(revision)
> > > +    # Map commitishes to repos
> > > +    repos = OrderedDict(zip(get_repos(conf, components), revisions))
> > > 
> > >      # make sure combo repo is clean
> > >      check_repo_clean(os.getcwd())
> > > 
> > > @@ -361,9 +368,9 @@ def action_update(conf, args):
> > >      if conf.nopull:
> > >          logger.info("Skipping pull (-n)")
> > >      
> > >      else:
> > > -        action_pull(conf, args)
> > > +        action_pull(conf, ['arg0'] + components)
> > 
> > What's this 'arg0' ?
> 
> It's a dummy "args[0] placeholder". Needed because action_pull() assumes
> a "full" command line args list where args[0] would contain the command
> name (which is not used for anything, though).

Right, OK - I would have used args[0] but I don't think it really matters as 
you point out. In which case:

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

