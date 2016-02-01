Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 458 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 Feb 2016 16:02:13 UTC
Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
	by mail.openembedded.org (Postfix) with ESMTP id 848327725C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 16:02:13 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout03 with smtp
	id D3ua1s0060BmcFC013ub5s; Mon, 01 Feb 2016 15:54:35 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=X8+vUzne c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=v2Bel0npaxN5B6V_JlgA:9 a=lc-Gj3QC1r_cbutT:21
	a=zDeai6rKt7G0xmNH:21 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>) id 1aQGoE-0001By-FZ
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Feb 2016 15:54:34 +0000
Date: Mon, 1 Feb 2016 15:54:34 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160201155434.GA4351@mcrowe.com>
References: <20160129154748.GB19208@mcrowe.com>
	<1454089333.10340.80.camel@linuxfoundation.org>
	<20160201111450.GA28760@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20160201111450.GA28760@mcrowe.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: package.tgz files not touched in sstate-cache
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
X-List-Received-Date: Mon, 01 Feb 2016 16:02:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 01 February 2016 at 11:14:50 +0000, Mike Crowe wrote:
> On Friday 29 January 2016 at 17:42:13 +0000, Richard Purdie wrote:
> > On Fri, 2016-01-29 at 15:47 +0000, Mike Crowe wrote:
> > > It turned out that whilst the populate_sysroot.gz and package_ipk.tgz files
> > > were still in the sstate-cache, the package.tgz tarball was not. This meant
> > > that the whole package was built again in order to satisfy the build
> > > dependencies of other packages that had changed.

> > The "right" answer here is to figure out what in your builds seems to
> > be needing the package.tgz files.
> > 
> > The only time the system should need to pull the package tgzs from
> > sstate is if package_qa or package_write_* were going to rerun. This
> > doesn't happen often, if ever. I've sometimes wondered if we should in
> > fact generate them. They are useful for switching package backends.
> >
> > So the fact they're not getting touched doesn't surprise me. The more
> > concerning thing is that its actually trying to use them.
> > 
> > We have found a number of bugs in this area in sstate and have some
> > patches merged, I know there are a small number pending too. Whether
> > we've found all the issues remains unknown.
> 
> The branch we saw this on was using dizzy from about
> e848484989307ae6826ba0f5217f7702322181e3 so it's quite likely that we're
> lacking some more recent fixes.

For those following along at home, it appears that only four commits are
required to remove the need for the package.tgz files and they cherry-pick
easily:

 80b3974081c4a8c604e23982a6db8fb32c616058
 06c891f0fa6c7712eae233dd18612f1ab1889c45
 76aa4f49db7d32bbd35703c64470fdfc63f403a4
 654f0eec426e882e50f688f6d097d992e34e5b40

Thanks again for your help.

Mike.

