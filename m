Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 89A60606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 03:45:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 28 Nov 2016 19:45:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,714,1473145200"; d="scan'208";a="10828546"
Received: from schan1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.189.70])
	by orsmga002.jf.intel.com with ESMTP; 28 Nov 2016 19:45:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2016 16:45:09 +1300
Message-ID: <1910837.9fFbRdU0ck@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <a63e3bae-0fe1-1f52-88b6-d9c53c38f306@windriver.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<43EF9731-230A-4FEE-8D1F-D81BEB193D24@gmail.com>
	<a63e3bae-0fe1-1f52-88b6-d9c53c38f306@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Tue, 29 Nov 2016 03:45:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 29 Nov 2016 10:45:51 Robert Yang wrote:
> On 11/29/2016 09:57 AM, Khem Raj wrote:
> >> On Nov 24, 2016, at 10:59 AM, Paul Eggleton
> >> <paul.eggleton@linux.intel.com> wrote:>> 
> >> On Thu, 24 Nov 2016 08:46:29 Patrick Ohly wrote:
> >>> On Thu, 2016-11-24 at 11:38 +0800, Robert Yang wrote:
> >>>> Currently, debug-tweaks is in EXTRA_IMAGE_FEATURES by default for poky,
> >>>> and
> >>>> there is no passwd, so that user can login easily without a passwd, I
> >>>> think
> >>>> that current status is more unsafe ?
> >>> 
> >>> Both well-known password and no password are unsafe. User "root" with
> >>> password "root" is not even "more" safe already now, because tools that
> >>> brute-force logins try that. Choosing something else would be a bit
> >>> safer for a short while until the tools add it to their dictionary.
> >>> 
> >>> Poky is also targeting a different audience than OE-core. Poky can
> >>> assume to be used in a secure environment, OE-core can't (because it
> >>> might be used for all kinds of devices).
> >> 
> >> I don't think that's part of the design goals on either side, it's simply
> >> about making development easier. The feature is clearly labelled "debug-
> >> tweaks" because it's for debugging not for production. It could be that
> >> we
> >> should make it do other things like append a notice to /etc/issue to
> >> avoid
> >> people leaving it on for production, if that is a concern.
> > 
> > Sometimes such goals can lead to problems. Making development easier by
> > all means if you can ensure a hard error on production e.g. debug-tweaks
> > can then never be part of production images. Otherwise someone will
> > forget it and it will be discovered on millions of devices in field along
> > with the user project will be red-faced.

Right. FWIW in mitigation I did write the raw material for the following
section of the YP manuals, though I don't know how many people have ended
up reading it:

http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#making-images-more-secure

In there there is an explicit mention of disabling debug-tweaks. Looking
around the place it could be that we need more warnings about this being
on by default though.

> Will something like IMAGE_FEATURES += "production" help here ? 

I'd like to see something like this - at least give the user some way of
saying "I really am in production now, so error out on anything that I
shouldn't be doing there". I wonder if it potentially goes further than
just conflicting with things like debug-tweaks and empty-root-password.

> We may also need something like IMAGE_FEATURES += "test" to make it can work
> with -ctestimage.

Not sure I follow your reasoning here - can you explain what this feature
would do?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

