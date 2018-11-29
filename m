Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7E86BF3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 23:41:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 15:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,296,1539673200"; d="scan'208";a="96980885"
Received: from vsiribox-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.174.172])
	by orsmga008.jf.intel.com with ESMTP; 29 Nov 2018 15:41:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 30 Nov 2018 12:41:03 +1300
Message-ID: <3273041.7S1xXB7S2i@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <42011d953b1350b6cc094fd0acc19d03931b092c.camel@linuxfoundation.org>
References: <20181128215407.13237-1-paul.eggleton@linux.intel.com>
	<5939456.jcG4z1hedJ@localhost.localdomain>
	<42011d953b1350b6cc094fd0acc19d03931b092c.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 4/4] oe-selftest: add some tests for recipeutils module
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
X-List-Received-Date: Thu, 29 Nov 2018 23:41:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 30 November 2018 12:09:58 PM NZDT richard.purdie@linuxfoundation.org wrote:
> On Fri, 2018-11-30 at 08:35 +1300, Paul Eggleton wrote:
> > On Friday, 30 November 2018 3:06:32 AM NZDT Richard Purdie wrote:
> > > On Thu, 2018-11-29 at 22:21 +1300, Paul Eggleton wrote:
> > > > Add some tests for functions in meta/lib/oe/recipeutils.py, in
> > > > particular for a few issues I've just fixed. I haven't added
> > > > tests
> > > > for
> > > > all of the functions - some of them are already being tested via
> > > > devtool
> > > > in any case.
> > > 
> > > Hate to say it but this still isn't working:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/28/steps/7/logs/step2d
> > > 
> > > probably due to it not working with the -j option :/
> > 
> > Right, so it seems that COREBASE isn't pointing where I'd expect it
> > to 
> > here - instead of the copy of the core metadata that's made for the
> > test, it's
> > pointing to the original layer. Is that a bug?
> 
> I put 
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=74b7df6ff73764e108bd81e05835c8a7d134c187
> 
> together to fix this. Its not a bug since the tests modify meta-
> selftest and therefore when running in parallel, we create copies of
> that layer per build directory.

OK, I've sent a fix - I discussed with RP on IRC but for others' benefit
there's already a function in oeqa.utils.commands that gets the path
to meta-selftest from BBLAYERS so I used that in v4 that I just sent. 
I also tested this one with -j which I hadn't with the previous versions.

> I do think we should start using the separate build directory always
> for oe-selftest for consistency though. It would also make ensuring
> some things like rm_work disabled easier.

Probably since there are gotchas like this one.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



