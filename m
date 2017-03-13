Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 43318776BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 13:51:49 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id vRrn1u0040BmcFC01RroeX; Mon, 13 Mar 2017 13:51:50 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Hr8GIwbS c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=6Iz7jQTuP9IA:10 a=-An2I_7KAAAA:8
	a=lRRjvdHZWNGjDXx_GwwA:9
	a=CjuIK1q_8ugA:10 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.84_2)
	(envelope-from <mac@mcrowe.com>)
	id 1cnQO2-0001NS-VG; Mon, 13 Mar 2017 13:51:46 +0000
Date: Mon, 13 Mar 2017 13:51:46 +0000
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170313135146.GA4512@mcrowe.com>
References: <1489251265-31851-1-git-send-email-mac@mcrowe.com>
	<CAJTo0LbcgpA5FOKPiLQq_92cFsfJSjH09XkVfasvhdKjJ8ofUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbcgpA5FOKPiLQq_92cFsfJSjH09XkVfasvhdKjJ8ofUA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 13 Mar 2017 13:51:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 13 March 2017 at 13:33:27 +0000, Burton, Ross wrote:
> On 11 March 2017 at 16:54, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > ccache apparently does this so that paths in the debug information will
> > always be correct. In an OE world these paths may already be missing or
> > incorrect due to rm_work or the use of a shared sstate cache, so it doesn't
> > seem as if we're losing much by disabling this feature.
> >
> 
> In an OE world we tell GCC to rewrite them to be target paths anyway, so
> this isn't a problem.  Maybe worth rewriting the commit message?
> 
> (see bitbake.conf, -fdebug-prefix-map)

I wasn't aware of that.

ccache does have some technology to detect this situation:

  Exception: The CWD will not be included in the hash if *base_dir* is set
  (and matches the CWD) and the compiler option *-fdebug-prefix-map* is
  used.

I think this means that if CCACHE_BASEDIR is set appropriately then it
wouldn't be necessary to set CCACHE_NOHASHDIR. (Looking at the ccache code,
I think that "matches the CWD" means "CWD is under *base_dir*" rather than
the two needing to be identical.)

I shall investigate why things weren't working correctly for us. In the
meantime I don't think my patch is yet proven to be doing the right thing.

Thanks.

Mike.

