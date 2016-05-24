Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 937FC6072C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 10:23:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 24 May 2016 03:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="987560993"
Received: from csim2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.192])
	by fmsmga002.fm.intel.com with ESMTP; 24 May 2016 03:23:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 24 May 2016 22:23:53 +1200
Message-ID: <2406091.eN5Xe47cZ7@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1464074758.9570.34.camel@linuxfoundation.org>
References: <cover.1464057554.git.paul.eggleton@linux.intel.com>
	<8f3a29655613c98c31c41ade3134540a96f074a7.1464057554.git.paul.eggleton@linux.intel.com>
	<1464074758.9570.34.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] oe-init-build-env: allow GIT_SSL_CAINFO from external environment
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
X-List-Received-Date: Tue, 24 May 2016 10:23:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 24 May 2016 08:25:58 Richard Purdie wrote:
> On Tue, 2016-05-24 at 14:40 +1200, Paul Eggleton wrote:
> > buildtools-tarball sets GIT_SSL_CAINFO so that the included
> > ca-certificates can be used by git; that can't work however unless
> > the GIT_SSL_CAINFO is still set in the environment in which git gets
> > run by the fetcher, so allow it through from the external
> > environment.
> > 
> > Fixes [YOCTO #9666].
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  scripts/oe-buildenv-internal | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Would it make more sense to just list this in
> lib/bb/fetch2/__init__.py:runfetchcmd() instead?

Actually it's already included in that list, but it wasn't working in the eSDK 
I was testing which I hadn't noticed was built before bitbake rev 
20ad1ea87712d042bd5d89ce1957793f7ff71da0 where we now also look at BB_ORIGENV, 
so it appears neither of these patches are even needed. We may need to 
backport that change to krogoth to fix this problem there though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

