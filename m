Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 60EBB60118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 02:30:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 22 Jun 2016 19:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="993338143"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2016 19:30:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2016 14:30:21 +1200
Message-ID: <2774839.1y5EqQaVkY@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <6ea53ae7-5516-a991-f9f6-111db319e5dc@windriver.com>
References: <1466632764-22540-1-git-send-email-jslater@windriver.com>
	<CAMKF1soa5wBYFyFV0sqxsN_0bpjTjpQ==Aow0Ui7ZAAhh-Mp=g@mail.gmail.com>
	<6ea53ae7-5516-a991-f9f6-111db319e5dc@windriver.com>
MIME-Version: 1.0
Cc: Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 0/1] blacklist: add BPNBLACKLIST support
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
X-List-Received-Date: Thu, 23 Jun 2016 02:30:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 22 Jun 2016 17:45:55 Mark Hatle wrote:
> On 6/22/16 5:35 PM, Khem Raj wrote:
> > On Jun 22, 2016 2:59 PM, "Joe Slater" <jslater@windriver.com
> > 
> > <mailto:jslater@windriver.com>> wrote:
> >> We have encountered some issues with the use of PNBLACKLIST in recipes.
> >> In particular, PNBLACKLIST[pkg] will not suppress building of lib32-pkg
> >> or lib64-pkg so world builds can fail unexpectedly.
> >> 
> >> One solution could be to implement BPNBLACKLIST[] which checks BPN
> >> instead
> >> of PN when a recipe is being parsed.  I have included a patch to do this.
> >> 
> >> If this were adopted, there are many recipes under meta-openembedded that
> >> should probably changed to use BPNBLACKLIST instead of PNBLACKLIST.
> > 
> > Bpn will also mean native and nativesdk among others. I think its better
> > to list multilibs explicitly.
> 
> This is intentional.
> 
> The problem with saying we have to list multilibs explicitly.  multilib
> naming is arbitrary.  I can say that it probably fits the pattern of lib64,
> lib32, libn32 and libx32.... but it doesn't have to.
> 
> But then I'd also need to blacklist native and nativesdk versions as well..
> so for a simple recipe that for some reason I want blacklisted, it's easier
> to hack the recipe to just blacklist itself -- then enter 7 or more
> blacklists.
> 
> Using the BPNBLACKLIST I can blacklist a single recipe with one command and
> not worry about multilibs, class extensions, etc.
> 
> (The patch leave PNBLACKLIST, specifically so that in the case where you
> want only partial usage blacklisted you can.)

So blacklist.bbclass already has code to extend PNBLACKLIST with multilib
variants - so we don't actually need this for multilib, right? It only helps
cover multilib and native/nativesdk AFAICT.

If we are going to make changes here I do have an alternative suggestion -
a while ago I wrote this patch but never got around to sending it because
I wasn't quite sure if it's the right approach. It makes PNBLACKLIST work
a bit more like other variables where you use overrides rather than
varflags to make it specific to a recipe:

  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=paule/stuff3&id=7383419cbe69c4d62b9695e6ae65adc8b54741f7

Does anyone else see value in this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

