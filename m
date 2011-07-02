Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QcoDX-0002J6-GS
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 02:37:51 +0200
Received: by pvf24 with SMTP id 24so3183620pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 17:34:05 -0700 (PDT)
Received: by 10.68.29.130 with SMTP id k2mr4238824pbh.514.1309566845425;
	Fri, 01 Jul 2011 17:34:05 -0700 (PDT)
Received: from [192.168.1.174] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id b8sm2272938pbj.14.2011.07.01.17.34.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Jul 2011 17:34:04 -0700 (PDT)
Message-ID: <4E0E6776.8010709@mvista.com>
Date: Fri, 01 Jul 2011 17:33:58 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <RFC: Layer tooling
	brainstorming>	<201105201745.29497.paul.eggleton@linux.intel.com>	<4DD6A817.6050701@mvista.com>	<201107011424.27821.paul.eggleton@linux.intel.com>	<4E0E156E.5050301@mvista.com>
	<1309556232.20015.552.camel@rex>
In-Reply-To: <1309556232.20015.552.camel@rex>
X-Enigmail-Version: 1.1.1
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
X-List-Received-Date: Sat, 02 Jul 2011 00:37:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 7/1/2011 2:37 PM, Richard Purdie wrote:
> On Fri, 2011-07-01 at 11:43 -0700, Jeremy Puhlman wrote:
>> Just a quick follow up, the part of this statement that to me is wrong,
>> is it appears you are dictating work flow. While, imho, the layer
>> management code which is above this level, is the place to dicate
>> workflow. The patch is to core bitbake and isolated at that. This patch
>> adds an additional work flow, and can be used in either state(the
>> results of a current BBLAYERS setting is exactly the same today as it as
>> after the patch).  More or less the patch is useful in a scope larger
>> then just layer-tooling.
> 
> Let me try and convey at least one of the things I'm worrying about with
> this patch. We're looking at establishing layer tooling which operate
> outside of or "above" bitbake. There are a variety of reasons for that,
> rightly or wrongly but this patch implies we're going to reverse that.

I think that only is true if you view the patch in the scope of the only
purpose for the patch is an element of the layer tooling. Being able to
specify a uri as a layer is in and of it self a useful ability,
irrespective of whether there exists higher order tools to create that list.

> If we go forward with the patch and don't reverse that decision it means
> that layers can sometimes be a thing that are "above" bitbake, sometimes
> not depending on the circumstances. 

This kind of goes back to work flow issue. Unless you plan to make it so
you cannot use the layers with out the specific layering tools that are
in development, bitbake will always need to support different work flows.

> I'm trying hard to avoid that kind
> of interwoven complexity as it makes code changes very hard to make in
> the future and leads to frequent breakage where multiple usage methods
> exist.

Well in this case, there is little that is interwoven. The remote layers
bit in the main thread of the execution is a single line in the cooker.
Paul was saying that he wanted to more or less still implement the tool
with in the bitbake code. Ironically, that will likely be more
interwoven then this patch.

The patch on its own with out regard to layer tooling for this project,
can pretty much stand on its own(which is why I provided it a month or
two before we pushed up the content tools).

> 
> As an example consider the case someone calls a script asking for new
> commits in layer Y to be added to flattened layer Z. We then have to add
> code checking if layer Y or layer X is a "bitbake remote layer" and then
> handle the updating of the layer accordingly. 

When ever you evaluate any of the layers, they are downloaded and
unpacked prior to examination of any of the meta data(stay
bblayers.conf). More or less any place where you would evalute
bblayers.conf you would evaluate the collection uri's. How you
update(i.e. if they are git for example) should be setable via the
already in place fetch mechanism.

More or less you would just need to run the BBLAYERS var through the
remote layers class then the end result is the BBLAYERS is just a list
of directories like it is now, which is why there is only one line of
change in the current thread of execution.

> Can something external to
> the bitbake code do that?

Unless your planning on creating tooling that doesn't use any of the
bitbake internals, not unless you want to duplicate a whole bunch of code.

> When we extend the later tooling are we
> expected to extend this code to match functionality?

Well if the end results of the layer tooling is a BBLAYERS with a list
of directories as it is now, there is nothing to extend. The code
handles that now. More or less if unless you are going in a drastically
different direction with the BBLAYERS list, I am not sure what would
need to be updated.

> 
> The abstraction in the remote layers code isn't strong enough to cope
> with that kind of interaction in its own right and I'm not sure its
> possible to do that simply with a line in a bblayers.conf file and still
> be readable.

My problem with this is currently using the same uri mechanism used in
the rest of bitbake fetches. Why pick on it here?

> 
> So I guess my question is how do you see this moving forwards? 

Well paul more or less said he was going to be writing the remote
layering tools with hooks in to bitbake like bitbake-layers, so I am not
entirely certain what external means in this context. With the current
patch, you could basically write the entire tool calling in to bitbake
and pass uri's to the layer fetch code, and either pass in our pass out
the path of the final destination.


> Are you
> planning to use external layer tooling at all or are you wanting
> anything that external tooling can do exposed also by the bblayers.conf
> URI?

Well it is two fold. Right now, the actual form of the end layer-tooling
doesn't exist. So no I really couldn't commit to using what ever is
produced. However, the entire reason why we provided this patch and the
content-tools, is so that we could nudge them in a direction were we
would be much more likely to use them.

More or less the entire point of the yocto project was to stop inventing
the same tools over and over again for each distro, so we can
concentrate on the actual value adds that each company/distro/group
brings to the table.

Basically what your implementing here has already been done, ergo in the
spirit of the purpose of the project, we were trying to avoid
reinventing the same tools again either here or in
yocto/oe-core/bitbake. The path you guys are tracking, is more or less
the same track we started on and we ended up with what we provided to you.

> If this is some kind of stopgap solution for compatibility and is a
> single blocking issue for Montavista that might be reasonable. If its
> the start of a move to reverse the order of the stack and put bitbake at
> the top and layer tooling secondary, I'm worried.

Actually the remote fetching is just a mechanism to empower the
layer-tooling and not duplicate code. I am not sure of you have looked
at the content-tools I provided last month, but those are basically our
"layer-tools". They create two things, collections(which at this point
would be layers) and solutions, which are sets of collections/layers
that work together. All of that is well above the bitbake level. Given
that the layers need to exist/be defined prior to the first execution of
bitbake, I wouldn't even begin to fathom how one would make
layer-tooling secondary to bitbake.

So I don't think I am trying to do that.

> 
> Also looking at the patch at a technical level, is there any reason to
> use _layerUnpack() instead of the fetch2 unpack method?

The code is more or less, a minor reworking of OE's collection.inc from
Chris. So it has just carried that a long for the ride. In addition, it
would mean the code could only work with fetch2. fetch does not provide
unpack. I originally put this together to work on both version of
fetch(which it does). It shouldn't be an issue to call unpack if the
fetcher is fetch2.

> The patch is
> much cleaner than it was, that much is good but needing to set so many
> fetcher variables like that is a sign that worries me a little. 

I have not submitted an updated patch. What you are looking at would
have to be the original. :) I got feed back and responded and never got
any comment on those responses.

> I guess
> the solution there is to code them as fallback defaults into the
> fetchers themselves.

Well as I noted at the start, the setting of the fetcher stuff is
primarily because, the fetchers don't start off with reasonable defaults
so they are more or less broken until we parse conf/bitbake.conf.

In the setup I/we use, we do not start our projects with any local
layers/collections at all, so we would not have access to bitbake.conf,
unless we went back to sourceing the mini one that used to be provided.
We can move the setting of that stuff to the init of the fetchers, and
that wouldn't be a big deal.

But once you eliminate the stuff to make fetching work, the list would
almost entirely go away.



