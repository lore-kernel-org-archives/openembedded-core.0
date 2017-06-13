Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 455 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Jun 2017 09:48:46 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9B0782E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:48:46 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id Y9h81v0060BmcFC019hAYH; Tue, 13 Jun 2017 10:41:11 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=GetnpUfL c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=LWSFodeU3zMA:10 a=-An2I_7KAAAA:8 a=NEAV23lmAAAA:8
	a=3-s3ndU_L0Zl2Y9u0JsA:9 a=CjuIK1q_8ugA:10 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1dKiJw-00018P-Mt; Tue, 13 Jun 2017 10:41:08 +0100
Date: Tue, 13 Jun 2017 10:41:08 +0100
From: Mike Crowe <mac@mcrowe.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20170613094108.GB1963@mcrowe.com>
References: <1489251265-31851-1-git-send-email-mac@mcrowe.com>
	<CAJTo0LbcgpA5FOKPiLQq_92cFsfJSjH09XkVfasvhdKjJ8ofUA@mail.gmail.com>
	<20170313135146.GA4512@mcrowe.com>
	<20170315115419.GA17975@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20170315115419.GA17975@mcrowe.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] ccache: Disable CCACHE_HASHDIR by default
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
X-List-Received-Date: Tue, 13 Jun 2017 09:48:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 15 March 2017 at 11:54:19 +0000, Mike Crowe wrote:
> On Monday 13 March 2017 at 13:51:46 +0000, Mike Crowe wrote:
> > On Monday 13 March 2017 at 13:33:27 +0000, Burton, Ross wrote:
> > > On 11 March 2017 at 16:54, Mike Crowe <mac@mcrowe.com> wrote:
> > > 
> > > > ccache apparently does this so that paths in the debug information will
> > > > always be correct. In an OE world these paths may already be missing or
> > > > incorrect due to rm_work or the use of a shared sstate cache, so it doesn't
> > > > seem as if we're losing much by disabling this feature.
> > > >
> > > 
> > > In an OE world we tell GCC to rewrite them to be target paths anyway, so
> > > this isn't a problem.  Maybe worth rewriting the commit message?
> > > 
> > > (see bitbake.conf, -fdebug-prefix-map)
> > 
> > I wasn't aware of that.

It turns out that I wasn't aware of it because meta-micro overwrites
FULL_OPTIMIZATION, so we don't end up using DEBUG_FLAGS. :(

I'm not sure that putting DEBUG_FLAGS in FULL_OPTIMIZATION makes sense
since its value has nothing to do with optimization. It appears to have
been this way since the individual flags were extracted from
FULL_OPTIMIZATION into DEBUG_FLAGS in 2011 in
9cb7113790d716a4c5cf7d511535ba87fdecd1ac .

Perhaps DEBUG_FLAGS should go into TARGET_CFLAGS directly? If I were to
prepare and test a patch to do that, would it be well received?

> > ccache does have some technology to detect this situation:
> > 
> >   Exception: The CWD will not be included in the hash if *base_dir* is set
> >   (and matches the CWD) and the compiler option *-fdebug-prefix-map* is
> >   used.
> > 
> > I think this means that if CCACHE_BASEDIR is set appropriately then it
> > wouldn't be necessary to set CCACHE_NOHASHDIR. (Looking at the ccache code,
> > I think that "matches the CWD" means "CWD is under *base_dir*" rather than
> > the two needing to be identical.)
> > 
> > I shall investigate why things weren't working correctly for us. In the
> > meantime I don't think my patch is yet proven to be doing the right thing.
> 
> Unfortunately ccache only supports this special behaviour for the last
> -fdebug-prefix-map argument. All the arguments make it through to the
> compiler, but the last one isn't enough to stop the current directory being
> hashed by default.
> 
> I've raised this as https://github.com/ccache/ccache/issues/163 .

That bug has now apparently been fixed in ccache, although there has not
yet been a release containing the fix.

> It seems that for the time being setting CCACHE_NOHASHDIR is required to
> make ccache effective for us. I'll reword the commit message based on
> Ross's input and this information.

The patch with the reworded commit message went in as
fb7a5cdcff19bb44a25a51e20de0440c1ebcc057. 

I've tested ccache with the multiple -fdebug-prefix-map fix patched in.
Unfortunately, it still doesn't work as well as I'd hoped without
CCACHE_NOHASHDIR because bitbake.conf sets DEBUG_PREFIX_MAP to contain:

 -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}

so every time PV or PR changes the ccache hash changes even when the actual
source hasn't. :( Luckily, setting CCACHE_NOHASHDIR means that none of the
debug prefix maps are considered significant for the hash anyway.

So I think that this means, even if a version of ccache containing the
-fdebug-prefix-map fix is merged, it is still necessary to set
CCACHE_NOHASHDIR for ccache to be effective, but that runs the risk of
debug information being incorrect.

The use of PV and PR was added in ecb56a6ae0c870af680da03db9d39703b525fc98
in order to cope with debug packages that contain the full source. That's
not a feature we use, so I'm not sure whether it would continue to work if
DEBUG_PREFIX_MAP were instead just to contain:

 -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}

?

Mike.

