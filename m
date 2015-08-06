Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 57AE8763F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 09:07:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Aug 2015 02:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="743311657"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 06 Aug 2015 02:07:59 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 74F1D6A4083;
	Thu,  6 Aug 2015 02:07:12 -0700 (PDT)
Date: Thu, 6 Aug 2015 12:07:53 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150806090753.GA1883@linux.intel.com>
References: <1438765311-13423-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAMKF1sra8sykgB4q5+qQd4hL2fPOxfuND7W-WivqS_YxYPfvWw@mail.gmail.com>
	<3388285.Ji3DKKVymS@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3388285.Ji3DKKVymS@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] create-pull-request: cd to relative directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Aug 2015 09:07:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2015 at 09:38:16AM +0100, Paul Eggleton wrote:
> On Wednesday 05 August 2015 20:33:48 Khem Raj wrote:
> > On Wed, Aug 5, 2015 at 2:01 AM, Ed Bartosh <ed.bartosh@linux.intel.com> 
> wrote:
> > > create-pull-request -d path creates empty patches if directory
> > > is specified as a path, i.e. ./bitbake or ./bitbake/ or full path.
> > > It behaves expected way only if script is run with -d bitbake, i.e.
> > > relative dir name doesn't contain '\'.
> > > 
> > > Fixed this unwanted behaviour by changing directory and running
> > > git format-patch in it with --relative, without specifying
> > > relative path as a parameter.
> > > 
> > > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > > ---
> > > 
> > >  scripts/create-pull-request | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> > > index 216edfd..7eac618 100755
> > > --- a/scripts/create-pull-request
> > > +++ b/scripts/create-pull-request
> > > @@ -177,12 +177,15 @@ mkdir $ODIR
> > > 
> > >  if [ -n "$RELDIR" ]; then
> > >  
> > >         ODIR=$(realpath $ODIR)
> > > 
> > > -       extraopts="--relative=$RELDIR"
> > > +       pushd $RELDIR
> > 
> > can we avoid using pushd so it works with non bash shells too ?
> 
> Should be possible, but it's worth mentioning that this script already starts 
> with #!/bin/bash.

That was the reason I used pushd/popd.

--
Regards,
Ed

