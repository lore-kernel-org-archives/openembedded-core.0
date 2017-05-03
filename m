Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 43A7671A82
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 12:31:43 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 03 May 2017 05:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,283,1491289200"; d="scan'208";a="95029045"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 03 May 2017 05:31:45 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 298CD6A4080;
	Wed,  3 May 2017 05:31:30 -0700 (PDT)
Date: Wed, 3 May 2017 15:18:02 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Andreas Reichel <Andreas.Reichel@tngtech.com>
Message-ID: <20170503121802.GA21326@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
	<20170421121145.9797-6-andreas.reichel@tngtech.com>
	<20170502133622.GA29938@linux.intel.com>
	<20170503084745.GB1431@tng>
MIME-Version: 1.0
In-Reply-To: <20170503084745.GB1431@tng>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [wic patch 5/5] wic: Use enum like dicts for string constants
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
X-List-Received-Date: Wed, 03 May 2017 12:31:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 03, 2017 at 10:47:45AM +0200, Andreas Reichel wrote:
> On Tue, May 02, 2017 at 04:36:22PM +0300, Ed Bartosh wrote:
> > On Fri, Apr 21, 2017 at 02:11:45PM +0200, Andreas J. Reichel wrote:
> > > To increase code maintainability, use dictionaries
> > > as enum-like container for parameter string comparisons.
> > > 
> > > Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
> > > Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > > Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
> > > 
> > > ---
> > >  scripts/lib/wic/engine.py | 16 +++++++++++++---
> > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> > > index 647358287f..1428a73ba8 100644
> > > --- a/scripts/lib/wic/engine.py
> > > +++ b/scripts/lib/wic/engine.py
> > > @@ -35,6 +35,16 @@ from wic import WicError
> > >  from wic.pluginbase import PluginMgr
> > >  from wic.utils.misc import get_bitbake_var
> > >  
> > > +class StrEnum(dict):
> > > +    __getattr__ = dict.get
> > > +
> > > +ListType = StrEnum({
> > > +    'LIST_IMAGES': "images",
> > > +    'LIST_SRC_PLUGINS': "source-plugins" })
> > > +
> > > +HelpArg = StrEnum({
> > > +    'HELP': "help" })
> > > +
> > >  logger = logging.getLogger('wic')
> > >  
> > >  def verify_build_env():
> > > @@ -204,14 +214,14 @@ def wic_list(args, scripts_path):
> > >      if args.list_type is None:
> > >          return False
> > >  
> > > -    if args.list_type == "images":
> > > +    if args.list_type == ListType.LIST_IMAGES:
> > >  
> > >          list_canned_images(scripts_path)
> > >          return True
> > > -    elif args.list_type == "source-plugins":
> > > +    elif args.list_type == ListType.LIST_SRC_PLUGINS:
> > >          list_source_plugins()
> > >          return True
> > > -    elif len(args.help_for) == 1 and args.help_for[0] == 'help':
> > > +    elif len(args.help_for) == 1 and args.help_for[0] == HelpArg.HELP:
> > >          wks_file = args.list_type
> > >          fullpath = find_canned_image(scripts_path, wks_file)
> > >          if not fullpath:
> > 
> > I'm not sure if this increases maintainability, but it definitely increases code complexity and
> > decreases readability. Can you explain the idea in a bit more detailed way?
> > 
> In general, if string constants are used as keys, it is better do define them as
> constants. Maintainability increases because if you have to change them,
> you only change them in one place. You have a central place for this
> definition and not scattered them all over the code. That's the idea.
>

Not sure I'm convinced. From my point of view this patch changes quite
simple and readable code to something more complex and less readable for
no visible reason.

If I have to change 'images' or 'source-plugins'(why would I want to do that?)
I'd just go and change them in one place as they're not used anywhere else.

--
Regards,
Ed

