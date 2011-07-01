Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QclSr-0006xX-P0 for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 23:41:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61LbgFB020840;
	Fri, 1 Jul 2011 22:37:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17513-10; Fri,  1 Jul 2011 22:37:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61LbZYj020830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2011 22:37:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E0E156E.5050301@mvista.com>
References: <RFC: Layer tooling brainstorming>
	<201105201745.29497.paul.eggleton@linux.intel.com>
	<4DD6A817.6050701@mvista.com>
	<201107011424.27821.paul.eggleton@linux.intel.com>
	<4E0E156E.5050301@mvista.com>
Date: Fri, 01 Jul 2011 22:37:12 +0100
Message-ID: <1309556232.20015.552.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] Add support for remote layering.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2011 21:41:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 11:43 -0700, Jeremy Puhlman wrote:
> Just a quick follow up, the part of this statement that to me is wrong,
> is it appears you are dictating work flow. While, imho, the layer
> management code which is above this level, is the place to dicate
> workflow. The patch is to core bitbake and isolated at that. This patch
> adds an additional work flow, and can be used in either state(the
> results of a current BBLAYERS setting is exactly the same today as it as
> after the patch).  More or less the patch is useful in a scope larger
> then just layer-tooling.

Let me try and convey at least one of the things I'm worrying about with
this patch. We're looking at establishing layer tooling which operate
outside of or "above" bitbake. There are a variety of reasons for that,
rightly or wrongly but this patch implies we're going to reverse that.

If we go forward with the patch and don't reverse that decision it means
that layers can sometimes be a thing that are "above" bitbake, sometimes
not depending on the circumstances. I'm trying hard to avoid that kind
of interwoven complexity as it makes code changes very hard to make in
the future and leads to frequent breakage where multiple usage methods
exist.

As an example consider the case someone calls a script asking for new
commits in layer Y to be added to flattened layer Z. We then have to add
code checking if layer Y or layer X is a "bitbake remote layer" and then
handle the updating of the layer accordingly. Can something external to
the bitbake code do that? When we extend the later tooling are we
expected to extend this code to match functionality?

The abstraction in the remote layers code isn't strong enough to cope
with that kind of interaction in its own right and I'm not sure its
possible to do that simply with a line in a bblayers.conf file and still
be readable.

So I guess my question is how do you see this moving forwards? Are you
planning to use external layer tooling at all or are you wanting
anything that external tooling can do exposed also by the bblayers.conf
URI? If this is some kind of stopgap solution for compatibility and is a
single blocking issue for Montavista that might be reasonable. If its
the start of a move to reverse the order of the stack and put bitbake at
the top and layer tooling secondary, I'm worried.

Also looking at the patch at a technical level, is there any reason to
use _layerUnpack() instead of the fetch2 unpack method? The patch is
much cleaner than it was, that much is good but needing to set so many
fetcher variables like that is a sign that worries me a little. I guess
the solution there is to code them as fallback defaults into the
fetchers themselves.

Cheers,

Richard



