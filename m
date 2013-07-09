Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 41A926B0D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 10:37:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2013 03:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1027,1363158000"; d="scan'208";a="362501432"
Received: from unknown (HELO helios.localnet) ([10.252.121.245])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2013 03:38:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mihai Lindner <mihaix.lindner@linux.intel.com>
Date: Tue, 09 Jul 2013 11:37:44 +0100
Message-ID: <1631742.S4HDYdM6UZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1373304800.2546.57.camel@mlindnex-mobl1.ger.corp.intel.com>
References: <1373304800.2546.57.camel@mlindnex-mobl1.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: oe-selftest script to run automated tests against bitbake tools
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
X-List-Received-Date: Tue, 09 Jul 2013 10:37:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mihai,

On Monday 08 July 2013 20:33:20 Mihai Lindner wrote:
> The idea of "oe-selftest" would be to have an extra method of testing to
> cover what's not addressed by sanity tests, bitbake-selftest or image
> run-time testing. More information and some example tests are posted in
> the related bug, here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4740
> 
> Before starting any work on this, maybe we can gather some thoughts,
> comments, here or in the bugzilla entry, something in the lines of what
> kind of tests should it run or not, what would be the usage scenario,

Some of the kinds of tests I would expect this tool to be able to handle:

* Tests that require configuration changes or addition/modification of testing 
recipes. One issue here is that if the script did modify existing 
configuration/metadata you could potentially break user's environments if they 
run this script without realising what it does. Maybe it should set up its own 
temporary build directory to avoid this, and add additional recipes via a 
temporary layer? This could help keep the test environment sane in any case.

* As an extension to the above, tests that verify failure output. We often 
don't notice when something breaks in the error handling code, and this leads 
to regressions where we get python tracebacks instead of a proper error 
message.

* yocto-bsp/yocto-layer (although these are not in OE-Core - perhaps this is a 
chance to engineer the oe-selftest script so it can be extended by additional 
layers? I think this is something we want to allow for anyway)

* buildhistory (by running builds and then comparing using buildhistory-diff)

* create-recipe

* runqemu?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

