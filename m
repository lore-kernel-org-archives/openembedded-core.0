Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A2E516D472
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 12:15:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Nov 2013 04:14:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,631,1378882800"; d="scan'208";a="427569368"
Received: from pauljbro-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.96])
	by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2013 04:14:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Stoicescu,
	CorneliuX" <corneliux.stoicescu@intel.com>
Date: Mon, 04 Nov 2013 12:14:46 +0000
Message-ID: <2223625.X3ey4vb7tr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1383557479.6271.105.camel@ted>
References: <1383329028-24348-1-git-send-email-corneliux.stoicescu@intel.com>
	<33115ABC4887814E8A92A08FBC93416B0A1AA0B0@IRSMSX103.ger.corp.intel.com>
	<1383557479.6271.105.camel@ted>
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
X-List-Received-Date: Mon, 04 Nov 2013 12:15:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 04 November 2013 09:31:19 Richard Purdie wrote:
> On Mon, 2013-11-04 at 09:24 +0000, Stoicescu, CorneliuX wrote:
> > > -----Original Message-----
> > > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > > Sent: Monday, November 04, 2013 11:16 AM
> > > To: Stoicescu, CorneliuX
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH] Modify buildstats to be merged inside
> > > buildhistory
> > > 
> > > On Sun, 2013-11-03 at 11:37 +0000, Stoicescu, CorneliuX wrote:
> > > > > > +BUILDSTATS_BASE = "${BUILDHISTORY_DIR}/buildstats"
> > > > > > 
> > > > > >  BNFILE = "${BUILDSTATS_BASE}/.buildname"
> > > > > >  DEVFILE = "${BUILDSTATS_BASE}/.device"
> > > > > 
> > > > > so when buildhistory is used, buildstats automatically becomes part
> > > > > of it?
> > > > > 
> > > > > > @@ -33,7 +33,7 @@ def set_bn(e):
> > > > > >  def get_bn(e):
> > > > > >      with open(e.data.getVar('BNFILE', True)) as f:
> > > > > > -        bn = f.readline()
> > > > > > +        bn = str(f.readline()).split("/")[0]
> > > > > > 
> > > > > >      return bn
> > > > > >  
> > > > > >  def set_device(e):
> > > > > > @@ -175,6 +175,10 @@ python run_buildstats () {
> > > > > > 
> > > > > >          # set the buildname
> > > 
> > > ##############################################################
> > > 
> > > > > ##########
> > > > > 
> > > > > >          try:
> > > > > > +            bb.utils.remove(e.data.getVar('BUILDSTATS_BASE',
> > > > > > + True),
> > > > > > + recurse=True)
> > > > > 
> > > > > Do we need to remove this?
> > > > 
> > > > By reworking the buildstats directory structure to not use the build
> > > > date to separate builds, if we don't remove buildstats each time we
> > > > make a new build the information from multiple builds will merge and
> > > > tools like bybootchartguy.py will not work anymore with buildstats.
> > > 
> > > I'd have expected that separate directories for each build are still
> > > maintained. Testing locally here, I can use pybootchartgui in the form:
> > > 
> > > scripts/pybootchartgui/pybootchartgui.py
> > > build/tmp/buildstats/core-image-
> > > sato-qemux86/201309302155/
> > > 
> > > and I'd have thought a similar command would still work in buildhistory
> > > since we'd still have the timestamped directory there?
> > 
> > The timestamped directory was removed in order to reduce buildhistory git
> > noise. Creating a new directory for each build will also increase the git
> > repo size dramatically In time.
> > 
> > If we choose to not use the timestamped directory, we need to delete the
> > buildstats data each build because, in contrast to buildhistory,
> > buildstats data is relevant when compiled as a whole. This is also how
> > pybootchart interprets it.
> 
> I hadn't realised you'd removed the timestamps. If you do that there is
> a problem, yes. Paul, how do you think we should handle this? I'd have
> thought it would be ok to save the historical data in there side by side
> since the size of the git repo will be the same, the size of the
> checkout will just be different. We do need to save something into the
> timestamped directory saying which revision(s) a given build happened
> against though so we have some kind of historical context.
> 
> Paul: Any thoughts on this?

The basic idea with buildhistory is to only keep the latest version of data 
stored within it, on the assumption that you could always get previous 
versions from the git history; this also makes comparisons to previous 
versions straightforward.

As far as timestamps go, BUILDNAME does go into the commit message; if it 
helps we record the metadata revisions corresponding to the build in the 
buildhistory repo as well (in a "metadata-revs" file).

If we do want to keep the builds split out in separate per-build directories 
then what are we gaining by trying to push buildstats into buildhistory in the 
first place?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

