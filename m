Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F15F96CA74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 21:32:50 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Oct 2013 14:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,502,1378882800"; d="scan'208";a="375208832"
Received: from unknown (HELO helios.localnet) ([10.252.120.232])
	by azsmga001.ch.intel.com with ESMTP; 15 Oct 2013 14:32:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Tue, 15 Oct 2013 22:32:50 +0100
Message-ID: <1445010.oBzEy73nH0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <525D9E59.6010107@windriver.com>
References: <cover.1380172958.git.Qi.Chen@windriver.com>
	<524B062E.7010901@windriver.com> <525D9E59.6010107@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] buildhistory.bbclass: always record PKG, PKGE, PKGV and PKGR
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
X-List-Received-Date: Tue, 15 Oct 2013 21:32:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 October 2013 15:58:17 Randy MacLeod wrote:
> On 13-10-01 01:28 PM, Mark Hatle wrote:
> > On 9/30/13 11:26 AM, Paul Eggleton wrote:
> >> On Thursday 26 September 2013 13:23:32 Qi.Chen@windriver.com wrote:
> >>> From: Chen Qi <Qi.Chen@windriver.com>
> >>> 
> >>> The buildhistory.bbclass always records PV instead of PKGV. However,
> >>> the buildhistory-diff script treats PKGV as a monitored variable
> >>> instead of PV.
> >>> 
> >>> If a recipe's PV changes, for example, hello_1.0.bb is renamed to
> >>> hello_2.0.bb, then buildhistory-diff reports nothing because PV is
> >>> not monitored and PKGV is not recorded.
> >>> 
> >>> So the buildhistory.bbclass should always record PKGV no matter it
> >>> equals to PV or not.
> >>> 
> >>> The same logic applies to PKG, PKGE and PKGR.
> >>> 
> >>> [YOCTO #5263]
> >>> 
> >>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>> ---
> >>> 
> >>>   meta/classes/buildhistory.bbclass |    8 ++++----
> >>>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>> 
> >>> diff --git a/meta/classes/buildhistory.bbclass
> >>> b/meta/classes/buildhistory.bbclass index 3da03c8..cea917c 100644
> >>> --- a/meta/classes/buildhistory.bbclass
> >>> +++ b/meta/classes/buildhistory.bbclass
> >>> 
> >>> @@ -277,10 +277,10 @@ def write_pkghistory(pkginfo, d):
> >>>           f.write("PR = %s\n" %  pkginfo.pr)
> >>>           
> >>>           pkgvars = {}
> >>> 
> >>> -        pkgvars['PKG'] = pkginfo.pkg if pkginfo.pkg != pkginfo.name
> >>> else ''
> >>> -        pkgvars['PKGE'] = pkginfo.pkge if pkginfo.pkge != pkginfo.pe
> >>> else
> >>> '' -        pkgvars['PKGV'] = pkginfo.pkgv if pkginfo.pkgv != pkginfo.pv
> >>> else '' -        pkgvars['PKGR'] = pkginfo.pkgr if pkginfo.pkgr !=
> >>> pkginfo.pr else '' +        pkgvars['PKG'] = pkginfo.pkg
> >>> +        pkgvars['PKGE'] = pkginfo.pkge
> >>> +        pkgvars['PKGV'] = pkginfo.pkgv
> >>> +        pkgvars['PKGR'] = pkginfo.pkgr
> >>> 
> >>>           for pkgvar in pkgvars:
> >>>               val = pkgvars[pkgvar]
> >> 
> >>>               if val:
> >> Please see my comment on the bug (just added):
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5263
> > 
> > Already added to the bug, but here so people not watching the bug can see:
> > 
> > I believe this change is requested because otherwise there is no way to
> > detect a package upgrade/uprev when using buildhistory.  This type of
> > upgrade can happy when comparing no-GPLv3 and GPLv3 builds -- or just
> > simple software updates when a layer gets updated.
> > 
> > We want to use the buildhistory from one build to the next to look for
> > changes that have occurred that may be unexpected.
> > 
> > --Mark
> 
> Paul,
> Any comments?
> Qi replied to your comment in bugzilla.
> 
> Qi,
> Perhaps you need to post an example showing how this change
> helps for a package upgrade and compare it to what happens when
> the patch is not applied.

My apologies, I've been meaning to get back to this. I'll run some tests 
tomorrow so we can get a definitive resolution.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

