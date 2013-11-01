Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C1AC260D74
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 19:06:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 01 Nov 2013 12:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,618,1378882800"; d="scan'208";a="421005397"
Received: from unknown (HELO helios.localnet) ([10.252.121.91])
	by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2013 12:06:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 01 Nov 2013 19:06:33 +0000
Message-ID: <1395869.PvYfiEG9e4@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1383329643.6271.63.camel@ted>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<3227290.SyHHWdF4KT@helios> <1383329643.6271.63.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] packagegroup.bbclass: Drop build-time dependencies
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
X-List-Received-Date: Fri, 01 Nov 2013 19:06:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 01 November 2013 18:14:03 Richard Purdie wrote:
> On Fri, 2013-11-01 at 13:37 +0000, Paul Eggleton wrote:
> > On Friday 01 November 2013 13:12:12 Martin Jansa wrote:
> > > * RFC because:
> > >   packagegroup.bbclass inherits allarch and by default sets
> > >   PACKAGE_ARCH = "all", but then it has runtime-dependency on
> > >   TUNE_PKGARCH packages and different signatures, so instead
> > >   of setting INHIBIT_DEFAULT_DEPS in addition to inherit allarch
> > >   I would like to drop default allarch completely.
> > 
> > The fix looks OK, but I don't think we should be going further and
> > removing the inherit. To my mind, the question of dependencies comes down
> > to whether or not the packagegroup output changes depending on
> > TUNE_PKGARCH, which in the general case it should not do.
> > 
> > If we need to do some optimisation to avoid the packagegroup recipe
> > rebuilding when it shouldn't due to packages it "contains" changing, we
> > can certainly look at that.
> 
> A better idea might be something like:
> 
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 852fb7e..23e28f0 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -11,6 +11,8 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep,
> depname, dataCache): def isKernel(fn):
>          inherits = " ".join(dataCache.inherits[fn])
>          return inherits.find("module-base.bbclass") != -1 or
> inherits.find("linux-kernel-base.bbclass") != -1 
> +    def isPackageGroup(x):
> +        return "packagegroup-" in x

OK, but I think we can rely on checking inheritance for this. It didn't used 
to be the case but after my task -> packagegroup cleanup some time ago all of 
these recipes inherit the packagegroup class.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

