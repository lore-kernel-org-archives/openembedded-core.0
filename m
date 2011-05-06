Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QIKup-0000IF-RZ for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 15:17:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p46DFE3B023890;
	Fri, 6 May 2011 14:15:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23729-03; Fri,  6 May 2011 14:15:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p46DF4fE023878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 6 May 2011 14:15:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1304014179-32612-2-git-send-email-jpuhlman@mvista.com>
References: <RFC: Layer tooling brainstorming>
	<1304014179-32612-2-git-send-email-jpuhlman@mvista.com>
Date: Fri, 06 May 2011 14:15:02 +0100
Message-ID: <1304687702.30391.109.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: chris_larson@mentor.com
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
X-List-Received-Date: Fri, 06 May 2011 13:17:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Jeremy,

Sorry for the delayed response, I took the opportunity to take some
vacation for a change and its taken me a few days to catch up on email.

Thanks for posting this. Whilst some of what I mention below may sound
negative, its not meant this way and what you have gives a nice basis to
start some discussion from on this topic. I do want to take a step back
and ensure we integrate this functionality at the right level within the
stack. I've made comments below.

On Thu, 2011-04-28 at 11:09 -0700, Jeremy Puhlman wrote:
> The bulk of this patch is based on Chris Larson's collection.inc,
> but refactored for use inside bitbake, and for layers.
> 
> Adds two new configuration options:
> 
> LAYER_UNPACKDIR - directory to unpack downloaded layers for use in configuration.
> LAYER_REMOTE_STASH - location to store downloaded layers for use in configuration.
> 
> Layers can be specified in the current manner:
> BBLAYERS = " \
>    /path/to/layer/one \
>    /path/to/layer/two \
> "
> 
> Or you can specify uris:
> 
> BBLAYERS = " \
> 	http://url.to.my.tarball/tarball.tar.gz \
> 	git://gitserver.com/git/repo;proto=http \
>         /path/to/layer/three \
>         file:///path/to/layer/four \
> "

This is good but what I don't really like about this is that whilst you
can specify where to get the layer from, it isn't clear where the layer
ends up locally. Compare the above to something like:

BBLAYERS = " \
 	/path/to/layer/one;srcuri=http://url.to.my.tarball/tarball.tar.gz \
 	/path/to/layer/two;srcuri=git://gitserver.com/git/repo;proto=http \
        /path/to/layer/three \
        /path/to/layer/four \
"

This is more ugly but it does clearly set an expectation for both where
its coming from and where it ends up on disk. It also means we can then
set specific revisions to checkout or other information e.g. whether the
revisions should auto-increment. The syntax would probably come
naturally to anyone who has used SRC_URI (and hence it also flows nicely
into the fetcher code).

> Currently there is a single layer option, that can be added to a uri, layerBase=<subpath>.
> This option would be used to specify if a layer starts somewhere other then the base of the
> tarball/scm repository. For example if you wanted to add oe-core you would do:

Ideally this could become an option that any of our fetchers would
support...

>  lib/bb/cooker.py       |    3 +-
>  lib/bb/fetch/layer.py  |   65 ++++++++++++++++
>  lib/bb/fetch2/layer.py |   76 ++++++++++++++++++
>  lib/bb/remotelayer.py  |  197 ++++++++++++++++++++++++++++++++++++++++++++++++

I'm not going to dive into the patches at this point but "layer" isn't
really a fetcher as such as it doesn't correspond to a specific source
type, its just a wrapper around other fetch methods. I'm therefore a
little worried this confuses the abstraction we currently have there.

Going back to the high level approach discussion, I'm also wondering if
there should be some "bblayers" tool which gets run prior to bitbake
(maybe automatically in some cases) which handles the parsing of the
BBLAYERS options and does whatever is needed to handle the setup there,
then hands off to bitbake itself.

I'm very keen to get the abstraction level of this code right so I'd be
interested in your (and others) thoughts on this...

Cheers,

Richard



