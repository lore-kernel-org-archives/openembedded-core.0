Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CE3F87F35E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 11:01:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Oct 2019 04:01:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="368396311"
Received: from unknown (HELO blackadder.local) ([10.252.56.237])
	by orsmga005.jf.intel.com with ESMTP; 08 Oct 2019 04:01:36 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20191007133836.1307-1-ross.burton@intel.com>
	<2d8ef388-4ec5-3142-4769-2d038f7d7773@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <405de303-0ef2-f695-9e77-a695f30a71e6@intel.com>
Date: Tue, 8 Oct 2019 12:01:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2d8ef388-4ec5-3142-4769-2d038f7d7773@windriver.com>
Subject: Re: [PATCH] pango: add PACKAGECONFIGs for all the optional dependencies
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
X-List-Received-Date: Tue, 08 Oct 2019 11:01:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 07/10/2019 18:44, Randy MacLeod wrote:
> PACKAGECONFIG has been nagging at me for years.
> This is mostly me just blowing off steam but I would
> like to hear your opinion.
> 
> While this is technically correct and seeing as oe-core is
> a distribution building system rather than a distro, this change
> makes sense, I do wonder how we're going to keep up with
> the testing that such flexibility requires. We could
> test each package's default config and then toggle each
> PACKAGECONFIG individually, hopefully with an automated tool.

I don't believe an automated tool for this makes complete sense, as 
several recipes have mutually exclusive PACKAGECONFIGs options. 
Building all of the combinations will by design fail some of the time, 
and that's not even considering other recipes where recipe A may depend 
on recipe B having PACKAGECONFIG foo enabled.

This tooling existing would be useful to easily verify a recipe instead 
of having to do it by hand, but I don't believe it should be part of the 
automated QA process.

> The status quo seems to be that we enable the options, pick
> reasonable defaults, and hope that distros and users test their
> configs and report errors. That'll work for detecting some errors
> even if it can take a while to get feedback. We recently tested
> a variety of configurations and found > 30 configurations that
> didn't work at all at build time.
> 
> So for this package, are there use cases that you know of where
> the old, hard-coded defaults are a problem?

I added the PACKAGECONFIGs for this package because there were some 
already but they didn't cover the range of optional dependencies, and 
most of the dependencies are for the tools and test suite.  If someone 
was slimming a system aggresively, they could disable the bulk of the 
PACKAGECONFIGs and still have a usable harfbuzz library.

There's definitely a balance between flexibility and complication. For 
example, I recently encouraged removal of some PACKAGECONFIGs for 
optional dependencies that have been dead for several years.

> It's also interesting to see that the README.md for pango says:
> 
>     The Cairo backend is the preferred backend to use Pango with and is
>     subject of most of the development in the future.  It has the
>     advantage that the same code can be used for display and printing.
> 
>     We suggest using Pango with Cairo as described above, but ...
> 
> so it would seem that even our defaults are not the ones recommended
> by upstream.
> 
> Does pango build if you drop glib? The README.md says:
>     Dependencies
>     ------------
>     Pango depends on the GLib library; more information about GLib can
>     be found at https://www.gtk.org/.

So there's a little confusion here in that I put "pango" in the commit 
message but the patch was for harfbuzz... v2 incoming.

Our Pango, however, is built with Cairo and Glib (not as a 
PACKAGECONFIG, but explicit DEPENDS).

Ross

