Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9D8706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 09:24:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 23 Feb 2015 01:19:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,629,1418112000"; d="scan'208";a="531338240"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 01:15:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 23 Feb 2015 09:24:04 +0000
Message-ID: <10796820.h4sv9pPNbH@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <alpine.LFD.2.11.1502221509270.29570@localhost>
References: <alpine.LFD.2.11.1502210434001.12954@localhost>
	<1424595258.11836.72.camel@linuxfoundation.org>
	<alpine.LFD.2.11.1502221509270.29570@localhost>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: questions about WORKDIR and S usage and files/ stuff
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
X-List-Received-Date: Mon, 23 Feb 2015 09:24:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 22 February 2015 15:25:07 Robert P. J. Day wrote:
> On Sun, 22 Feb 2015, Richard Purdie wrote:
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=4eb3db9a2ca8eaff64b64
> > b8f56dac25d4734571c
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=cf72ede74d35746a10d07
> > 08942287548f9c72f30
> > 
> > and some of the surrounding patches. I'd assumed base-files was part
> > of that series, clearly it wasn't but there were many other recipes
> > changed at that time.
> 
>   ah, gotcha. so let me just summarize my understanding of this, it
> looks pretty straightforward.
> 
>   once upon a time, base.bbclass politely(?) auto-created the S
> directory for each recipe. this had the potential for screwing things
> up if the recipe author didn't set S properly for that recipe.
> 
>   solution: stop auto-creating S, leaving the responsibility for
> creating whatever S refers to to the recipe itself, typically as a
> result of just doing a regular unpack of the SRC_URI. this allows a
> trivial sanity check -- whatever directory S refers to should exist as
> the result of the simple unpacking of that recipe.
> 
>   now, given the default setting in bitbake.conf of
> 
>   S = WORKDIR/BP
> 
> as long as that value is appropriate for a recipe, then the recipe
> author need not set it explicitly. *but*, even in the case where a
> recipe doesn't require any "unpacking" -- as in, recipes like
> base-files which refer exclusively to local files -- it is still
> necessary to set S to *something* that will exist, just to pass that
> sanity test, and the easiest solution is to just set it to WORKDIR,
> which is guaranteed to exist for *any* recipe.

Yes, but this is not generally good advice for every recipe. If the main 
source for your recipe unpacks to a subdirectory then that is where you should 
point S to.

>   final thought on this -- to pass the sanity check, it is necessary
> only for the directory referred to by S to exist. the obvious thing to
> set it to is, of course, WORKDIR, but in the case of recipes like
> base-files which don't even *use* S, it's technically possible to set
> it to *any* directory guaranteed to exist. i'm not suggesting this is
> a smart thing to do, only that it would be technically viable.

In theory, but why is that of any interest? You seem to be looking at this 
from the perspective of just passing the sanity test, but the sanity test is 
there for a reason - so that you set it to a proper value, not to just any old 
value to make the warning go away.

>   and all this suggests that, even if you set S = WORKDIR, for
> cleanliness, you should still avoid referring to unpacked objects
> relative to S, just in case -- it's safer to restrict yourself to
> referring to things relative to WORKDIR. is that about right?

For individual files that don't actually get unpacked, sure. You should use S 
to point to the actual source for the recipe, though. S is actually used.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

