Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E759C71A62
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 11:07:30 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 05 Jan 2017 03:07:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,321,1477983600"; d="scan'208";a="49796080"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 05 Jan 2017 03:07:30 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3ECBE6A4006;
	Thu,  5 Jan 2017 03:06:36 -0800 (PST)
Date: Thu, 5 Jan 2017 12:54:17 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170105105417.GA30684@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1483573733-10014-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20170105094009.GA30427@linux.intel.com>
	<1483611050.4367.87.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1483611050.4367.87.camel@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-selftest: Improve BUILDDIR environment handling
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
X-List-Received-Date: Thu, 05 Jan 2017 11:07:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jan 05, 2017 at 10:10:50AM +0000, Richard Purdie wrote:
> On Thu, 2017-01-05 at 11:40 +0200, Ed Bartosh wrote:
> > On Wed, Jan 04, 2017 at 11:48:53PM +0000, Richard Purdie wrote:
> > > 
> > > Its possible something (like bitbake/tinfoil2) may mess around with
> > > the
> > > environment and using the enviroment as a global variable store
> > > isn't
> > > particularly nice anyway.
> > > 
> > > This patch changes the BUILDDIR usages so that the environment
> > > isn't used
> > > as a global store and a global variable is used instead. Whilst
> > > that
> > > is still not perfect, it does avoid the current double and triple
> > > backtraces
> > > we're seeing where tinfoil2/bitbake has trampled the enviroment
> > > leading
> > > to failures of failures making debugging even harder.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  scripts/oe-selftest | 19 +++++++++++++------
> > >  1 file changed, 13 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/scripts/oe-selftest b/scripts/oe-selftest
> > > index bfcea66..e166521 100755
> > > --- a/scripts/oe-selftest
> > > +++ b/scripts/oe-selftest
> > > @@ -111,9 +111,13 @@ def get_args_parser():
> > >                          help='Submit test results to a
> > > repository')
> > >      return parser
> > >  
> > > +builddir = None
> > > +
> > >  
> > >  def preflight_check():
> > >  
> > > +    global builddir
> > > +
> > >      log.info("Checking that everything is in order before running
> > > the tests")
> > >  
> > >      if not os.environ.get("BUILDDIR"):
> > > @@ -135,7 +139,7 @@ def preflight_check():
> > >      return True
> > >  
> > >  def add_include():
> > > -    builddir = os.environ.get("BUILDDIR")
> > > +    global builddir
> > You don't need to use 'global' here. It's only mandatory if
> > you change variable value:
> > https://docs.python.org/3/reference/simple_stmts.html#the-global-stat
> > ement
> 
> In this case I did it purely for readability to make it clear how we
> were expecting it to work and to match the other uses. It doesn't hurt
> anything afaik.
> 
> > Would it be more readable to use name in upper case: BUILDDIR?
> 
> Not sure, that isn't something we've used as a style anywhere else so
> it doesn't really match any other style. Is that a python convention?
No, it's not. I thought it would be more readable as uppercase name
is the same as environment variable name. And it would be different
from local variable names, so you wouldn't need to use 'global'.

--
Regards,
Ed

