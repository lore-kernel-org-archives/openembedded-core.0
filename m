Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 549E76D3D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 10:38:42 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Nov 2013 02:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="385926119"
Received: from unknown (HELO helios.localnet) ([10.252.121.102])
	by azsmga001.ch.intel.com with ESMTP; 07 Nov 2013 02:38:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
Date: Thu, 07 Nov 2013 10:38:41 +0000
Message-ID: <1573516.6qZOAZ09XO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <33115ABC4887814E8A92A08FBC93416B0A1AA18C@IRSMSX103.ger.corp.intel.com>
References: <1383329028-24348-1-git-send-email-corneliux.stoicescu@intel.com>
	<1383568473.6271.117.camel@ted>
	<33115ABC4887814E8A92A08FBC93416B0A1AA18C@IRSMSX103.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Thu, 07 Nov 2013 10:38:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 04 November 2013 12:42:59 Stoicescu, CorneliuX wrote:
> On Monday 04 November 2013 14:35:00 Richard Purdie wrote:
> > On Mon, 2013-11-04 at 12:14 +0000, Paul Eggleton wrote:
> > > On Monday 04 November 2013 09:31:19 Richard Purdie wrote:
> > > The basic idea with buildhistory is to only keep the latest version of
> > > data stored within it, on the assumption that you could always get
> > > previous versions from the git history; this also makes comparisons to
> > > previous versions straightforward.
> > 
> > This makes sense for absolute value data. The task build statistics are
> > not
> > entirely "absolute" data though and having to traverse many checkouts
> > trying to build up say "average task timing" might be problematic.
> > 
> > > As far as timestamps go, BUILDNAME does go into the commit message; if
> > > it helps we record the metadata revisions corresponding to the build
> > > in the buildhistory repo as well (in a "metadata-revs" file).
> > 
> > Currently the main use of the data is to say "visualise this build"
> > where you're building a target or set of targets. We name the build after
> > the first item in the list of build targets.
> > 
> > The logged data is useful both as part of a set which are viewed together
> > and individually on a task basis so see how much CPU/Disk a given task
> > uses and how that changes over time.
> > 
> > The tricky part is firstly that we should really use a true buildname,
> > secondly that we need both the set of data and data per target.
> > 
> > If we just logged data per target, we could overwrite any previous data
> > but
> > that would break usage as a set.
> > 
> > > If we do want to keep the builds split out in separate per-build
> > > directories then what are we gaining by trying to push buildstats into
> > > buildhistory in the first place?
> > 
> > We have a need to be able to merge and store build statistic data which
> > build history already does well. The question is whether it makes sense
> > to use the same mechanism or not since there are commonalities and
> > differences. Having two data storage systems and repositories doesn't
> > make a lot of sense.
> > 
> > I'm not sure this makes a solution much clearer but it does hopefully
> > better explain the challenge.
> 
> We could use add code to buildhistory-diff and make it return comparison
> buildstats data for a set of builds ? Usually people look at statistics for
> a certain task at a time and such a tool could actually make things easier.

Just to round this off - I still have some reservations about adding this data 
in its current form to buildhistory, but being able to associate it with the 
build and other changes that occurred at the same time is valuable. Let's add 
it under ${BUILDHISTORY_DIR} using ${BUILDNAME} as a subdirectory as Richard 
suggests, and then later we can add some analysis code and maybe optional 
automatic pruning of old data to keep things tidy.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

