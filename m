Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 77D346057A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:03:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 13 Apr 2016 09:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,480,1455004800"; d="scan'208";a="784150726"
Received: from mbabyjoh-mobl.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 13 Apr 2016 09:03:16 -0700
Date: Wed, 13 Apr 2016 19:04:10 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20160413160410.GA11312@mbabyjoh-desk.ger.corp.intel.com>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
	<1460472857.9308.63.camel@linuxfoundation.org>
	<CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
	<4550e71bd1f24135a2f6978294e25f94@XBOX02.axis.com>
	<1460545515.9308.85.camel@linuxfoundation.org>
	<5715165f841f46d0a50fb951acfbf0ac@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <5715165f841f46d0a50fb951acfbf0ac@XBOX02.axis.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Wed, 13 Apr 2016 16:03:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

On Wed, Apr 13, 2016 at 03:14:09PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: den 13 april 2016 13:05
> > To: Peter Kjellerstedt; Otavio Salvador
> > Cc: OE Core (openembedded-core@lists.openembedded.org)
> > Subject: Re: [OE-core] [PATCHv2 1/1] Revert "useradd.bbclass: remove
> > user/group created by the package in clean* task"
> > 
> > I am pretty frustrated with this thread. The reasons are perhaps not
> > immediately obvious though.
> > 
> > The issue is that there are only a limited number of people who
> > actually dive in and try and fix some of the underlying "core
> > architecture" bugs. There is what I believe to be a pretty good patch
> > here which does fix real world issues which have been reported into the
> > bugzilla (its related to at least two bug reports). As such it has been
> > seen as a bugfix. Its now clear it does have some side effects which
> > weren't envisaged, some causing issues for a small number of meta-oe
> > recipes, the others breaking a companies internal code.
> > 
> > Otavio wants it deferred to 2.2, Peter wants it abandoned entirely.
> > 
> > If I revert this, Peter is then happy and has zero incentive to do
> > anything further. The pressure is still on the reopened bugs to try and
> > fix this somehow and falls back to the usual suspects. There is a real
> > world usability problem there.
> 
> Hold your horses. I definitely see the problem the change tried to 
> address as one that needs to be fixed, and I am already looking at 
> how to solve this properly (currently based on my second suggested 
> solution). However, I do not know if I can fix it in time for Krogoth. 
> Which is why I agree with Otavio that the change was introduced too 
> late in the process, especially as it causes breakage for existing 
> users.

As the author of that patch, I am responsible for that regression and would 
like to assist in fixing that particular problem. As you can see, I had no
option to test your particular scenario as that recipe was not part of my oe-core 
"world" build test. RP has already sent a patch to fix the "cyrus-sasl" recipe
which had some troubles with this change.

> > In a single isolated case, fine, we'd figure a way through this. I
> > think I'm so frustrated as we see this all the time. Making a change to
> > the core architecture is hard and gets ever harder, then we wonder why
> > we don't have contributors. Part of this is having so many different
> > workflows and corner cases.
> > 
> > I have pushed very hard to have more test cases, then its easier to
> > determine if a patch causes regressions. Again though, few people are
> > contributing to them outside the usual suspects.
> 
> Here I must show my lack of knowledge. How and where should I go about 
> adding a regression test that verifies the support for that multiple 
> recipes can add the same user/group? Since this does not test a 
> specific recipe, but rather a part of the build framework, I do not 
> know if, e.g., ptest is applicable (of which I have no experience 
> either).

Just want to let you know that I am interested in working together to fix this one.
As per my understanding, you have a library and an application, which depends on that 
library. Both these packages creates the same user. 

At this point, a package manager (eg: smart) doesn't remove the users when we remove the package.
However, I am not sure about the situation where a package manager removes the users added by a 
package when we remove it from the target device. In that case,wouldn't the removal of application, 
remove the user which the library depends on ?

Best Regards,
Maxin


