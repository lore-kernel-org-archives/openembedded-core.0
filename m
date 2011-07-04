Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QdhUY-0005mx-4u for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 13:39:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64BZFGJ016951;
	Mon, 4 Jul 2011 12:35:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16508-08; Mon,  4 Jul 2011 12:35:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64BZ6R5016942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 4 Jul 2011 12:35:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <4E0E6776.8010709@mvista.com>
References: <RFC: Layer tooling brainstorming>
	<201105201745.29497.paul.eggleton@linux.intel.com>
	<4DD6A817.6050701@mvista.com>
	<201107011424.27821.paul.eggleton@linux.intel.com>
	<4E0E156E.5050301@mvista.com> <1309556232.20015.552.camel@rex>
	<4E0E6776.8010709@mvista.com>
Date: Mon, 04 Jul 2011 12:34:37 +0100
Message-ID: <1309779277.20015.659.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 04 Jul 2011 11:39:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 17:33 -0700, Jeremy Puhlman wrote:
> On 7/1/2011 2:37 PM, Richard Purdie wrote:
> > On Fri, 2011-07-01 at 11:43 -0700, Jeremy Puhlman wrote:
> >> Just a quick follow up, the part of this statement that to me is wrong,
> >> is it appears you are dictating work flow. While, imho, the layer
> >> management code which is above this level, is the place to dicate
> >> workflow. The patch is to core bitbake and isolated at that. This patch
> >> adds an additional work flow, and can be used in either state(the
> >> results of a current BBLAYERS setting is exactly the same today as it as
> >> after the patch).  More or less the patch is useful in a scope larger
> >> then just layer-tooling.
> > 
> > Let me try and convey at least one of the things I'm worrying about with
> > this patch. We're looking at establishing layer tooling which operate
> > outside of or "above" bitbake. There are a variety of reasons for that,
> > rightly or wrongly but this patch implies we're going to reverse that.
> 
> I think that only is true if you view the patch in the scope of the only
> purpose for the patch is an element of the layer tooling. Being able to
> specify a uri as a layer is in and of it self a useful ability,
> irrespective of whether there exists higher order tools to create that list.

I agree the patch has a use in its own right, standalone. I am however
asking us all to take a step back and consider the big picture which is
what I need do with a lot of what we're doing.

My point is that whilst in isolation its ok, I don't think that approach
can scale to fulfil all the varying needs of our users. If it can't, we
need to look at what can, and then how we could include equivalent
functionality.

> Well in this case, there is little that is interwoven. The remote layers
> bit in the main thread of the execution is a single line in the cooker.
> Paul was saying that he wanted to more or less still implement the tool
> with in the bitbake code. Ironically, that will likely be more
> interwoven then this patch.
> 
> The patch on its own with out regard to layer tooling for this project,
> can pretty much stand on its own(which is why I provided it a month or
> two before we pushed up the content tools).

The interwoven comment has nothing to do with how many lines of code it
adds/removes. My concern is that we have a ton of different operations
we really need to have around layers and they can't all work through the
bitbake command itself as it simply wasn't designed for it.

Ending up in a case where the bitbake command may do some things to
layers some of the time isn't the consistent user experience I'd like to
have. Would you like to explain to a user that yes, bitbake can fetch a
remote layer but can't update it?

Even with the code we're discussing, you need an external tool to create
the list and to update it at appropriate points from upstream so you
really might as well have that code actually do the fetch as well
(calling bitbake's fetchers)?

I'm much more worried about the workflow and its implications than I am
about the actual code.

> > As an example consider the case someone calls a script asking for new
> > commits in layer Y to be added to flattened layer Z. We then have to add
> > code checking if layer Y or layer X is a "bitbake remote layer" and then
> > handle the updating of the layer accordingly. 
> 
> When ever you evaluate any of the layers, they are downloaded and
> unpacked prior to examination of any of the meta data(stay
> bblayers.conf). More or less any place where you would evalute
> bblayers.conf you would evaluate the collection uri's. How you
> update(i.e. if they are git for example) should be setable via the
> already in place fetch mechanism.
> 
> More or less you would just need to run the BBLAYERS var through the
> remote layers class then the end result is the BBLAYERS is just a list
> of directories like it is now, which is why there is only one line of
> change in the current thread of execution.

As I've said, I don't care about the single line of code change. The
important thing is whether the work flow can consistently scale into
what we as project all need. Unfortunately at the moment its looking
like it doesn't.

> > The abstraction in the remote layers code isn't strong enough to cope
> > with that kind of interaction in its own right and I'm not sure its
> > possible to do that simply with a line in a bblayers.conf file and still
> > be readable.
> 
> My problem with this is currently using the same uri mechanism used in
> the rest of bitbake fetches. Why pick on it here?

I think layers are a bit different to a lot of the source code we
currently fetch. We might want to push things back, transfer commits
between layers and perform a number of other operations. These
operations all require "state" type data that currently we can't store
in a SRC_URI. I'm not even sure we want to store it there.

> Well paul more or less said he was going to be writing the remote
> layering tools with hooks in to bitbake like bitbake-layers, so I am not
> entirely certain what external means in this context. With the current
> patch, you could basically write the entire tool calling in to bitbake
> and pass uri's to the layer fetch code, and either pass in our pass out
> the path of the final destination.

I think Paul is planning something very similar in spirit to the code
you have with the difference you'd use a different tool to actually
manipulate the build environment and fetch the layers first rather than
having bitbake do it itself.

> > Are you
> > planning to use external layer tooling at all or are you wanting
> > anything that external tooling can do exposed also by the bblayers.conf
> > URI?
> 
> Well it is two fold. Right now, the actual form of the end layer-tooling
> doesn't exist. So no I really couldn't commit to using what ever is
> produced.

There has been discussion about this in person at Collab/ELC and on
the mailing lists/wikis but we probably need to do better at
communicating this I guess :/

>  However, the entire reason why we provided this patch and the
> content-tools, is so that we could nudge them in a direction were we
> would be much more likely to use them.
> 
> More or less the entire point of the yocto project was to stop inventing
> the same tools over and over again for each distro, so we can
> concentrate on the actual value adds that each company/distro/group
> brings to the table.
> 
> Basically what your implementing here has already been done, ergo in the
> spirit of the purpose of the project, we were trying to avoid
> reinventing the same tools again either here or in
> yocto/oe-core/bitbake. The path you guys are tracking, is more or less
> the same track we started on and we ended up with what we provided to you.

The whole point of Yocto is to collaborate. I'm pleased to have your
input in the form of the patches and I really do appreciate that.

This doesn't however guarantee we take them "as is" since we've also
consulted with a number of other people about what their needs are and
your solution whilst evidently perfect for you doesn't meet all the
criteria we established during the planning process. We're trying to
write some tools that should work for everyone. It may require some
changes in process for some people, hopefully these will be logical and
improve the user experience and understanding.

There are a variety of ways I think we could even directly make your use
case work (such as bitbake automatically calling the external update
tool if some environment variable is set). Collaboration means there are
more than just your requirements that need to be worked into this at
this point.

> > If this is some kind of stopgap solution for compatibility and is a
> > single blocking issue for Montavista that might be reasonable. If its
> > the start of a move to reverse the order of the stack and put bitbake at
> > the top and layer tooling secondary, I'm worried.
> 
> Actually the remote fetching is just a mechanism to empower the
> layer-tooling and not duplicate code. I am not sure of you have looked
> at the content-tools I provided last month, but those are basically our
> "layer-tools". They create two things, collections(which at this point
> would be layers) and solutions, which are sets of collections/layers
> that work together. All of that is well above the bitbake level. Given
> that the layers need to exist/be defined prior to the first execution of
> bitbake, I wouldn't even begin to fathom how one would make
> layer-tooling secondary to bitbake.
> 
> So I don't think I am trying to do that.

So why put all the work into that content-tool code and then have the
workflow so bitbake does the actual fetching? It shouldn't be hard to
write a "bitbake-layer-fetch" script that does this and it would make a
clearer separation of responsibility for the different scripts. What is
the reason for not doing that?

> > Also looking at the patch at a technical level, is there any reason to
> > use _layerUnpack() instead of the fetch2 unpack method?
> 
> The code is more or less, a minor reworking of OE's collection.inc from
> Chris. So it has just carried that a long for the ride. In addition, it
> would mean the code could only work with fetch2. fetch does not provide
> unpack. I originally put this together to work on both version of
> fetch(which it does). It shouldn't be an issue to call unpack if the
> fetcher is fetch2.

What's the opinion of fetch2 at this point? I'm hoping we can rely on
that for all future development work at this point.

> > The patch is
> > much cleaner than it was, that much is good but needing to set so many
> > fetcher variables like that is a sign that worries me a little. 
> 
> I have not submitted an updated patch. What you are looking at would
> have to be the original. :) I got feed back and responded and never got
> any comment on those responses.

I'm probably confusing this with the first version you sent out I guess,
sorry.

> > I guess
> > the solution there is to code them as fallback defaults into the
> > fetchers themselves.
> 
> Well as I noted at the start, the setting of the fetcher stuff is
> primarily because, the fetchers don't start off with reasonable defaults
> so they are more or less broken until we parse conf/bitbake.conf.
> 
> In the setup I/we use, we do not start our projects with any local
> layers/collections at all, so we would not have access to bitbake.conf,
> unless we went back to sourceing the mini one that used to be provided.
> We can move the setting of that stuff to the init of the fetchers, and
> that wouldn't be a big deal.

I understand that. You're not thinking about what I'm suggesting ;-)

> But once you eliminate the stuff to make fetching work, the list would
> almost entirely go away.

For example, what I mean is that instead of:

        fetchcmd = data.getVar("FETCHCOMMAND", d, True)

in wget.py, we could update this to something like:

        defaultcmd = "/usr/bin/env wget -t 5 -q --passive-ftp -P ${DL_DIR} ${URI}"
        fetchcmd = data.getVar("FETCHCOMMAND", d, True) or defaultcmd

Cheers,

Richard




