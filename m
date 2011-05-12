Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QKVj8-0003Ts-QC
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 15:14:51 +0200
Received: by pxi6 with SMTP id 6so1155233pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2011 06:11:55 -0700 (PDT)
Received: by 10.142.163.7 with SMTP id l7mr83144wfe.350.1305205915252;
	Thu, 12 May 2011 06:11:55 -0700 (PDT)
Received: from [192.168.1.60] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id k6sm1178547wfa.17.2011.05.12.06.11.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 06:11:54 -0700 (PDT)
Message-ID: <4DCBDC96.1080306@mvista.com>
Date: Thu, 12 May 2011 06:11:50 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Lightning/1.0b2 Thunderbird/3.1.10
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <RFC: Layer tooling
	brainstorming>	<1304014179-32612-2-git-send-email-jpuhlman@mvista.com>
	<1304687702.30391.109.camel@rex>
In-Reply-To: <1304687702.30391.109.camel@rex>
X-Enigmail-Version: 1.1.1
Cc: "paul.eggleton@linux.intel.com >> Paul Eggleton"
	<paul.eggleton@linux.intel.com>, chris_larson@mentor.com
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
X-List-Received-Date: Thu, 12 May 2011 13:14:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 5/6/2011 6:15 AM, Richard Purdie wrote:
> Hi Jeremy,
> 
> Sorry for the delayed response, I took the opportunity to take some
> vacation for a change and its taken me a few days to catch up on email.

No worries. Everyone needs some time off. :)

> Thanks for posting this. Whilst some of what I mention below may sound
> negative, its not meant this way and what you have gives a nice basis to
> start some discussion from on this topic. I do want to take a step back
> and ensure we integrate this functionality at the right level within the
> stack. I've made comments below.

Understood.



>> Or you can specify uris:
>>
>> BBLAYERS = " \
>> 	http://url.to.my.tarball/tarball.tar.gz \
>> 	git://gitserver.com/git/repo;proto=http \
>>         /path/to/layer/three \
>>         file:///path/to/layer/four \
>> "
> 
> This is good but what I don't really like about this is that whilst you
> can specify where to get the layer from, it isn't clear where the layer
> ends up locally. Compare the above to something like:
> 
> BBLAYERS = " \
>  	/path/to/layer/one;srcuri=http://url.to.my.tarball/tarball.tar.gz \
>  	/path/to/layer/two;srcuri=git://gitserver.com/git/repo;proto=http \
>         /path/to/layer/three \
>         /path/to/layer/four \
> "

So currently it gets stashed in the locations specified above. Currently
the code has the ability to extract values out of the uri as new bits.
The above would be reasonable, but you could do as well:

 BBLAYERS = " \
>  	http://url.to.my.tarball/tarball.tar.gz;local=/path/to/layer \
>  	git://gitserver.com/git/repo;proto=httplocalLayer=/path/to/layer/two \
>         /path/to/layer/three \
>         /path/to/layer/four \

With the current implementation the above is fairly straight forward.
(not that I am implying implementation should necessarily dictate the
what is done, just noting the above is significantly easier to implement
from the point the code is now.)


> 
> This is more ugly but it does clearly set an expectation for both where
> its coming from and where it ends up on disk. It also means we can then
> set specific revisions to checkout or other information e.g. whether the
> revisions should auto-increment. The syntax would probably come
> naturally to anyone who has used SRC_URI (and hence it also flows nicely
> into the fetcher code).

Actually the code already passes what ever the uri off to the base
fetchers already. So in reality what ever the global and uri setting is
for the fetcher, it should work here as well.

> I'm not going to dive into the patches at this point but "layer" isn't
> really a fetcher as such as it doesn't correspond to a specific source
> type, its just a wrapper around other fetch methods. I'm therefore a
> little worried this confuses the abstraction we currently have there.

This I can definately agree with. The primary issue was I actually was
trying to make the code work with both fetcher implementations largely
because I still use both, and it was either use two separated by ifs on
fetcher implementations, add to __init__ or just drop fetch support at
all. Using the separate file was useful for demonstration purposes. The
actual code placed there is fairly sparce since it just dealt with the
difference in fetchers, and most if not all common code was handled in
the remote layers file above.

> 
> Going back to the high level approach discussion, I'm also wondering if
> there should be some "bblayers" tool which gets run prior to bitbake
> (maybe automatically in some cases) which handles the parsing of the
> BBLAYERS options and does whatever is needed to handle the setup there,
> then hands off to bitbake itself.

So we have been using a tool to generate bblayers via a whole higher
level mirroring setup, and then let bitbake handle all the grunt work
doing the fetching. This works in our case. FWIW I have been trying to
push the company to open those, and we are still in discussions.

> 
> I'm very keen to get the abstraction level of this code right so I'd be
> interested in your (and others) thoughts on this...

Yeah which is kind of why I reposted. The response was limited.


