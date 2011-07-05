Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QeFGH-00083z-Br
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 01:42:37 +0200
Received: by iwn4 with SMTP id 4so6120905iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 16:38:47 -0700 (PDT)
Received: by 10.43.49.8 with SMTP id uy8mr2062803icb.462.1309909126986;
	Tue, 05 Jul 2011 16:38:46 -0700 (PDT)
Received: from [192.168.1.220] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id a9sm8095864icy.18.2011.07.05.16.38.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 16:38:45 -0700 (PDT)
Message-ID: <4E13A081.2020904@mvista.com>
Date: Tue, 05 Jul 2011 16:38:41 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.18) Gecko/20110616 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <RFC: Layer tooling brainstorming>
	<1309556232.20015.552.camel@rex> <4E0E6776.8010709@mvista.com>
	<201107041339.15672.paul.eggleton@linux.intel.com>
In-Reply-To: <201107041339.15672.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.1.1
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
X-List-Received-Date: Tue, 05 Jul 2011 23:42:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> 
> We aren't going to tie bitbake layer support of local layers to the layer 
> tooling, no. We're expressly trying to avoid that.
> 
> You suggest that I'm trying to "dictate workflow" however I'd argue that I'm 
> doing the opposite (see below regarding updating).

The line that led me to dicate:
Fetching/updating layers should be (able to be) a conscious action
rather than something that happens implicitly as part of the build process.

Was not as firm a statement as was thinking it was. Apologies.

> I don't think that they will. Firstly, no hooks are needed to fetch a layer 
> remotely - it's just a fetch; you call cooker to run through a parse and then 
> run the fetch operations you need. No changes to the bitbake core should be 
> necessary, as far as I can see. (I don't object to reworking fetcher 
> initialisation so that they are set up correctly "out of the box", though, 
> that may be helpful to both approaches.)

I think this is kinda where I get hung up. The run through parse part.
Our projects start off with zero meta data other then a local.conf and
bblayers.conf. In earlier days, we provided collections.inc and
bitbake.conf in a local conf directory provided with bitbake. That is
not done anymore(ergo why the fetchers are broken from go, previously
nothing happened until at lease one bitbake.conf was loaded).


> Secondly, the changes I have previously implemented within bitbake for use by 
> bitbake-layers are generic and have negligible impact on bitbake operation. 
> If you have any technical concerns with these, in all seriousness please reply 
> to the patches on bitbake-devel; there's always room for improvement.

Ill dig in to these, I have not done much digging, but I did see the
flurry of recent patches.

> Updating is something I would like to allow to be a conscious action. That 
> way, if you want to fetch down the metadata, then disconnect and carry on 
> building, you can do so easily. Also, if you want to stay with the current 
> version you have on disk, you know bitbake is not going to update the metadata 
> in the course of doing the build, because you didn't explicitly ask it to. 
> You're also free to make any additional changes on top of the fetched metadata 
> before running the build. If bitbake is doing all the fetching/updating of 
> metadata then immediately jumping into the build, there's no room for that - 
> unless you use Ctrl+C to break out, which isn't really ideal.

So not to defend the patch again here, but this is not a problem with
the patch either. Currently if you run "bitbake" and provide no other
options, the patch will just fetch everything. You wouldn't need to
Ctrl+C to make modifications. Now you can just jump off in to a build if
it is what you want to do. Actually anything that calls cooker basically
causes them to be fetched. Running bitbake-layers for example does the
fetch.

> I think the piece I am missing at the moment is why having it as an external 
> tool that largely replicates the same outward functionality as having it 
> within bitbake presents a problem for the use case that you have. Is there 
> some technical capability that we couldn't have using this approach - other 
> than the fact that you're just calling bitbake and it does everything? If 
> that's the only objection, would it not achieve the same thing if you had a 
> small shell script that ran the fetch/update then bitbake?

Pretty much everything is a small matter of code. It is a matter of
complexity. More or less when you boil it down, bitbakewith out content
is fantastic at a few basic tasks, one of them being fetching. Its a
kinda straight line to let bitbake be bitbake. I get it you don't want
it to be automatic. Do you have something I can look at that addresses
the remote layering? If your not saving the layers data in BBLAYERS
where are you saving it?

> 
> Fetching metadata and fetching source code are two different things. You don't 
> really expect to have to do anything to the source code before bitbake builds 
> it - bitbake and whatever metadata you have takes care of that. However with 
> the metadata you may wish to make modifications prior to building.

It really comes down to use case. Since we started out with a bitbake/oe
derived product, our collections have been always been stowed in tmp.
Basically keep the upstream pristine make changes with mechanisms like
amend.inc/.bbappend in more private layers. Now we are more or less
working with non-oe developers, and folks that are more or less complete
novices when it comes to this type of stuff.

I accept this is only one use case, however I actually think it is more
important then the standard oe-developer case. Most oe-developers could
probably take the layers wiki page listing all the disparate layers and
be good. Its the folks that are not as oe/bitbake sophicticated that
this helps.

Richard was commenting about moving checkin's from layer to layer. While
for me in my personal work, that is fantastic. However, I can already do
that with out the aid of a separate tool. Most people who use git in
there day to day work could as well, whether they have ever heard of
bitbake or oe or not. While that functionality is "neat", it shouldn't,
imho, be added to complicate basic functionality.

>> Basically what your implementing here has already been done, ergo in the
>> spirit of the purpose of the project, we were trying to avoid
>> reinventing the same tools again either here or in
>> yocto/oe-core/bitbake. The path you guys are tracking, is more or less
>> the same track we started on and we ended up with what we provided to you.
> 
> You have come up with an implementation that works well for you, and you've 
> published that implementation. Thankyou for that. However, there are some 
> aspects of that implementation that concern Richard and I so I'm trying to 
> come up with an alternative implementation (using some of the same code) that 
> meets the requirements. If we're not going to meet some important requirements 
> that you have then I'm more than happy to stop and re-evaluate the situation.

Well what we have more or less been able to accomplish with what we have
provided is the ability for a user to generate a project with nothing
locally stored but the uri's. The end user sources a script and runs
bitbake. The layers/collections are retrieved and it is off and running.
The content-tools more or less shuffle around uri's, source mirrors and
prebuilt mirrors. The project lacking more or less any metadata other
the configuration options can get dropped right in to scm, especially
when using remote uris.

Some of the above may not fit in the scope of what we are trying to do
here, which is why I have been pushing some of the lower functionality
that can be reused.

If it comes down to running an extra command prior to running bitbake
then will work. The one thing I would prefer is that the whole set of
layers(including oe-core) be able to be checked out, rather then
checking out oe-core first then checkout any additional layers. In that
same vain supporting archives as valid layer types, would be helpful.

> Understood. However, I'd hope we can soon move to a state where we only 
> have one set of fetchers. Is there anything preventing Montavista from using 
> fetch2 currently?

Backwards compatibility. Currently we are supporting legacy code, that
would require some rework to go with fetch2. For those products I could
halt the forward progression on bitbake, but using a single version of
bitbake would be better for us, though I completely understand the
removal of the older fetch. Its more or less my problem then anything
you need to deal with.

> Well, we definitely would need the "layer" fetcher code to be refactored out; 
> Richard made that comment earlier.

Well the code that lives there now would need to move in to __init__.py
or in to the remotealyers bit with if else bits for fetch/fetch2. OTOH,
it sounds like the decision is not to use the patch at all.

> I would also hope that as you suggested we 
> can move to having the initialisation within the fetchers themselves so that 
> the layer fetching isn't doing anything special in that regard. We need to 
> establish the direction we want to go in however.

Well yeah this is general goodness.


-- 
Jeremy Puhlman
Montavista Sofware, LLC.


