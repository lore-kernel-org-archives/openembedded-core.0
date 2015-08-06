Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 41C6F60167
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 08:38:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 06 Aug 2015 01:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="777971931"
Received: from ekalugin-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.17.192])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2015 01:38:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 06 Aug 2015 09:38:16 +0100
Message-ID: <3388285.Ji3DKKVymS@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAMKF1sra8sykgB4q5+qQd4hL2fPOxfuND7W-WivqS_YxYPfvWw@mail.gmail.com>
References: <1438765311-13423-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAMKF1sra8sykgB4q5+qQd4hL2fPOxfuND7W-WivqS_YxYPfvWw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] create-pull-request: cd to relative directory
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
X-List-Received-Date: Thu, 06 Aug 2015 08:38:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 05 August 2015 20:33:48 Khem Raj wrote:
> On Wed, Aug 5, 2015 at 2:01 AM, Ed Bartosh <ed.bartosh@linux.intel.com> 
wrote:
> > create-pull-request -d path creates empty patches if directory
> > is specified as a path, i.e. ./bitbake or ./bitbake/ or full path.
> > It behaves expected way only if script is run with -d bitbake, i.e.
> > relative dir name doesn't contain '\'.
> > 
> > Fixed this unwanted behaviour by changing directory and running
> > git format-patch in it with --relative, without specifying
> > relative path as a parameter.
> > 
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> > 
> >  scripts/create-pull-request | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> > index 216edfd..7eac618 100755
> > --- a/scripts/create-pull-request
> > +++ b/scripts/create-pull-request
> > @@ -177,12 +177,15 @@ mkdir $ODIR
> > 
> >  if [ -n "$RELDIR" ]; then
> >  
> >         ODIR=$(realpath $ODIR)
> > 
> > -       extraopts="--relative=$RELDIR"
> > +       pushd $RELDIR
> 
> can we avoid using pushd so it works with non bash shells too ?

Should be possible, but it's worth mentioning that this script already starts 
with #!/bin/bash.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

