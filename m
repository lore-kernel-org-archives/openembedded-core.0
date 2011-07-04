Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QdiUV-00077h-4n
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 14:43:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2011 05:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,471,1304319600"; d="scan'208";a="26076793"
Received: from unknown (HELO helios.localnet) ([10.255.17.147])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2011 05:39:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 4 Jul 2011 13:39:15 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <RFC: Layer tooling brainstorming>
	<1309556232.20015.552.camel@rex> <4E0E6776.8010709@mvista.com>
In-Reply-To: <4E0E6776.8010709@mvista.com>
MIME-Version: 1.0
To: Jeremy Puhlman <jpuhlman@mvista.com>
Message-Id: <201107041339.15672.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 04 Jul 2011 12:43:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 02 July 2011 01:33:58 Jeremy Puhlman wrote:
> On 7/1/2011 2:37 PM, Richard Purdie wrote:
> > If we go forward with the patch and don't reverse that decision it means
> > that layers can sometimes be a thing that are "above" bitbake, sometimes
> > not depending on the circumstances.
>
> This kind of goes back to work flow issue. Unless you plan to make it so
> you cannot use the layers with out the specific layering tools that are
> in development, bitbake will always need to support different work flows.

We aren't going to tie bitbake layer support of local layers to the layer 
tooling, no. We're expressly trying to avoid that.

You suggest that I'm trying to "dictate workflow" however I'd argue that I'm 
doing the opposite (see below regarding updating).

> > I'm trying hard to avoid that kind
> > of interwoven complexity as it makes code changes very hard to make in
> > the future and leads to frequent breakage where multiple usage methods
> > exist.
> 
> Well in this case, there is little that is interwoven. The remote layers
> bit in the main thread of the execution is a single line in the cooker.
> Paul was saying that he wanted to more or less still implement the tool
> with in the bitbake code. Ironically, that will likely be more
> interwoven then this patch.

I don't think that they will. Firstly, no hooks are needed to fetch a layer 
remotely - it's just a fetch; you call cooker to run through a parse and then 
run the fetch operations you need. No changes to the bitbake core should be 
necessary, as far as I can see. (I don't object to reworking fetcher 
initialisation so that they are set up correctly "out of the box", though, 
that may be helpful to both approaches.)

Secondly, the changes I have previously implemented within bitbake for use by 
bitbake-layers are generic and have negligible impact on bitbake operation. 
If you have any technical concerns with these, in all seriousness please reply 
to the patches on bitbake-devel; there's always room for improvement.

> When ever you evaluate any of the layers, they are downloaded and
> unpacked prior to examination of any of the meta data(stay
> bblayers.conf). More or less any place where you would evalute
> bblayers.conf you would evaluate the collection uri's. How you
> update(i.e. if they are git for example) should be setable via the
> already in place fetch mechanism.

Updating is something I would like to allow to be a conscious action. That 
way, if you want to fetch down the metadata, then disconnect and carry on 
building, you can do so easily. Also, if you want to stay with the current 
version you have on disk, you know bitbake is not going to update the metadata 
in the course of doing the build, because you didn't explicitly ask it to. 
You're also free to make any additional changes on top of the fetched metadata 
before running the build. If bitbake is doing all the fetching/updating of 
metadata then immediately jumping into the build, there's no room for that - 
unless you use Ctrl+C to break out, which isn't really ideal.

I think the piece I am missing at the moment is why having it as an external 
tool that largely replicates the same outward functionality as having it 
within bitbake presents a problem for the use case that you have. Is there 
some technical capability that we couldn't have using this approach - other 
than the fact that you're just calling bitbake and it does everything? If 
that's the only objection, would it not achieve the same thing if you had a 
small shell script that ran the fetch/update then bitbake?

> More or less you would just need to run the BBLAYERS var through the
> remote layers class then the end result is the BBLAYERS is just a list
> of directories like it is now, which is why there is only one line of
> change in the current thread of execution.
> 
> > Can something external to
> > the bitbake code do that?
> 
> Unless your planning on creating tooling that doesn't use any of the
> bitbake internals, not unless you want to duplicate a whole bunch of code.

I don't plan to duplicate any significant amount of code. I'm not seeing that 
you couldn't do what was described using an external tool.

> > When we extend the later tooling are we
> > expected to extend this code to match functionality?
> 
> Well if the end results of the layer tooling is a BBLAYERS with a list
> of directories as it is now, there is nothing to extend. The code
> handles that now. More or less if unless you are going in a drastically
> different direction with the BBLAYERS list, I am not sure what would
> need to be updated.

Well, with my solution I would prefer to see BBLAYERS unchanged, so it just 
points to the local checkout of the remote layer.

> > The abstraction in the remote layers code isn't strong enough to cope
> > with that kind of interaction in its own right and I'm not sure its
> > possible to do that simply with a line in a bblayers.conf file and still
> > be readable.
> 
> My problem with this is currently using the same uri mechanism used in
> the rest of bitbake fetches. Why pick on it here?

Fetching metadata and fetching source code are two different things. You don't 
really expect to have to do anything to the source code before bitbake builds 
it - bitbake and whatever metadata you have takes care of that. However with 
the metadata you may wish to make modifications prior to building.

> > So I guess my question is how do you see this moving forwards?
> 
> Well paul more or less said he was going to be writing the remote
> layering tools with hooks in to bitbake like bitbake-layers, so I am not
> entirely certain what external means in this context. With the current
> patch, you could basically write the entire tool calling in to bitbake
> and pass uri's to the layer fetch code, and either pass in our pass out
> the path of the final destination.

External means it's not part of the normal bitbake execution flow and there's 
nothing that needs to be changed within the bitbake core, unless it's of a 
generic nature (and right now I don't see any needed changes with my 
solution). No hooks should be necessary.

> > Are you planning to use external layer tooling at all or are you wanting
> > anything that external tooling can do exposed also by the bblayers.conf
> > URI?
> 
> Well it is two fold. Right now, the actual form of the end layer-tooling
> doesn't exist. So no I really couldn't commit to using what ever is
> produced. However, the entire reason why we provided this patch and the
> content-tools, is so that we could nudge them in a direction were we
> would be much more likely to use them.

And that's a good thing, agreed.

> More or less the entire point of the yocto project was to stop inventing
> the same tools over and over again for each distro, so we can
> concentrate on the actual value adds that each company/distro/group
> brings to the table.

Right. To me, that means going from a list of requirements (and I'll admit, it 
has been an informal list for this particular feature) and trying to come 
up with an implementation that fulfils those requirements.

> Basically what your implementing here has already been done, ergo in the
> spirit of the purpose of the project, we were trying to avoid
> reinventing the same tools again either here or in
> yocto/oe-core/bitbake. The path you guys are tracking, is more or less
> the same track we started on and we ended up with what we provided to you.

You have come up with an implementation that works well for you, and you've 
published that implementation. Thankyou for that. However, there are some 
aspects of that implementation that concern Richard and I so I'm trying to 
come up with an alternative implementation (using some of the same code) that 
meets the requirements. If we're not going to meet some important requirements 
that you have then I'm more than happy to stop and re-evaluate the situation.

> > Also looking at the patch at a technical level, is there any reason to
> > use _layerUnpack() instead of the fetch2 unpack method?
> 
> The code is more or less, a minor reworking of OE's collection.inc from
> Chris. So it has just carried that a long for the ride. In addition, it
> would mean the code could only work with fetch2. fetch does not provide
> unpack. I originally put this together to work on both version of
> fetch(which it does). It shouldn't be an issue to call unpack if the
> fetcher is fetch2.

Understood. However, I'd hope we can soon move to a state where we only 
have one set of fetchers. Is there anything preventing Montavista from using 
fetch2 currently?

> > The patch is
> > much cleaner than it was, that much is good but needing to set so many
> > fetcher variables like that is a sign that worries me a little.
> 
> I have not submitted an updated patch. What you are looking at would
> have to be the original. :) I got feed back and responded and never got
> any comment on those responses.

Well, we definitely would need the "layer" fetcher code to be refactored out; 
Richard made that comment earlier. I would also hope that as you suggested we 
can move to having the initialisation within the fetchers themselves so that 
the layer fetching isn't doing anything special in that regard. We need to 
establish the direction we want to go in however.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


