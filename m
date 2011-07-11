Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QgKci-000666-Rh
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 19:50:25 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2011 10:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,516,1304319600"; d="scan'208";a="29007566"
Received: from unknown (HELO helios.localnet) ([10.255.17.172])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2011 10:46:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Date: Mon, 11 Jul 2011 18:46:26 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <RFC: Layer tooling brainstorming>
	<201107041339.15672.paul.eggleton@linux.intel.com>
	<4E13A081.2020904@mvista.com>
In-Reply-To: <4E13A081.2020904@mvista.com>
MIME-Version: 1.0
Message-Id: <201107111846.26118.paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Mon, 11 Jul 2011 17:50:25 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 06 July 2011 00:38:41 Jeremy Puhlman wrote:
> Our projects start off with zero meta data other then a local.conf and
> bblayers.conf. In earlier days, we provided collections.inc and
> bitbake.conf in a local conf directory provided with bitbake. That is
> not done anymore(ergo why the fetchers are broken from go, previously
> nothing happened until at lease one bitbake.conf was loaded).

I am aiming for this use case to be supported with my utility. What I would 
also like to handle though is that if you have chosen to set up some 
configuration, then it will be able to be read in before the fetching starts.
 
> I get it you don't want it to be automatic. Do you have something I can look
> at that addresses the remote layering? 

I've thrown together a proof-of-concept "bitbake-fetchlayers"  in the 
"paule/remotelayers" contrib branch:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-
contrib/log/?h=paule/remotelayers

This is by no means a finished utility, may have hideous bugs, etc. This 
requires nothing more than vanilla bitbake to operate. Some notes:

 * BBPATH needs to be set, LAYER_UNPACKDIR also.

 * Currently it requires conf/bitbake.conf, classes/ etc., which are shipped 
with bitbake master but are not present with the copy of bitbake that's in 
Poky; I hope to be able to address this in such a way that the utility does 
not require these.

 * "init" is the command used to fetch multiple layers. I've also provided 
"fetch" as a way to test a single fetch operation; I would expect the latter 
to be removed at some point. (Also, none of these command names are final.)

 * Update is not yet implemented. For your use case, update is no more than a 
re-fetch; however where you are intending to interact with the layers as SCM 
working directories it would be better to do an update in-place. I'm still 
thinking about how best to implement this.

 * Output is rather noisy, this needs to be fixed also.

 * I did have to patch the fetchers as Richard suggested so they have default 
values for the configurable fetch commands. (We'd have to have done this 
anyway.)

> If your not saving the layers data in BBLAYERS where are you saving it?

Well, this is not entirely clear to me yet. However if they are not in 
bblayers.conf and you wish to refer to them again (as in your use case you 
would for updating) they would naturally have to be in another file somewhere.

FWIW bitbake-fetchlayers' "init" command currently takes a list consisting of 
uri,localdir,subdir items, with the last two parameters being optional, and 
outputs a new BBLAYERS definition. This list could alternatively come from a 
file.

> It really comes down to use case. Since we started out with a bitbake/oe
> derived product, our collections have been always been stowed in tmp.
> Basically keep the upstream pristine make changes with mechanisms like
> amend.inc/.bbappend in more private layers. Now we are more or less
> working with non-oe developers, and folks that are more or less complete
> novices when it comes to this type of stuff.
>
> I accept this is only one use case, however I actually think it is more
> important then the standard oe-developer case. Most oe-developers could
> probably take the layers wiki page listing all the disparate layers and
> be good. Its the folks that are not as oe/bitbake sophicticated that
> this helps.

Ultimately anyone coming to bitbake/OE fresh is going to need to know 
something about setting it up and using it. However, any mechanical steps can 
be scripted away. For these kinds of users, running "bitbake <target>" or 
"startbuild.sh" is not going to be much different.
 
> Richard was commenting about moving checkin's from layer to layer. While
> for me in my personal work, that is fantastic. However, I can already do
> that with out the aid of a separate tool. Most people who use git in
> there day to day work could as well, whether they have ever heard of
> bitbake or oe or not. While that functionality is "neat", it shouldn't,
> imho, be added to complicate basic functionality.

Richard's aim is simply to keep the core of bitbake free of complexities that 
may be painful to extend if they are in the core.

> If it comes down to running an extra command prior to running bitbake
> then will work. The one thing I would prefer is that the whole set of
> layers(including oe-core) be able to be checked out, rather then
> checking out oe-core first then checkout any additional layers. In that
> same vain supporting archives as valid layer types, would be helpful.

I think we can support this without any issues - any of bitbake's fetchers 
should be able to be used, including wget and local. You won't need to grab 
oe-core first.

> Backwards compatibility. Currently we are supporting legacy code, that
> would require some rework to go with fetch2. For those products I could
> halt the forward progression on bitbake, but using a single version of
> bitbake would be better for us, though I completely understand the
> removal of the older fetch. Its more or less my problem then anything
> you need to deal with.

Hmm. For simplicity I've only supported fetch2 in bitbake-fetchlayers - in 
fact it forces it at startup. It would not be hard to support fetch also, 
however I hope we could avoid having to do so.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


