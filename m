Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QPjnP-0001vc-Tw for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 01:16:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QNDmYb028450
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 00:13:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27999-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 00:13:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4QNDd6S028444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 00:13:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110526220829.GO3222@jama.jama.net>
References: <20110526220829.GO3222@jama.jama.net>
Date: Fri, 27 May 2011 00:13:35 +0100
Message-ID: <1306451615.27470.212.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Sad story about Shared State
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
X-List-Received-Date: Thu, 26 May 2011 23:16:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 00:08 +0200, Martin Jansa wrote:
> Good evening,
> 
> sorry for long and pesimistic e-mail, but I hope that someone will point
> me to something I'm doing completely wrong.
> 
> First I was surprised to see how many recipes were rebuilt after this
> change:
> http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=aebb9d6599aac683456adf56dc11f8b9f10f25c3
> 
> because [YOCTO #1074] was resolved by bitbake commit:
> http://git.openembedded.net/cgit.cgi/bitbake/commit/?id=139b8a625818225c358a1b8363518d7ed6913188
> and I had rm_work change
> http://patches.openembedded.org/patch/4807/
> during this build I decided to find out what is changing so many sstate
> checksums for such small changes
> 
> so I took another small dbus change from patchwork
> http://patches.openembedded.org/patch/4831/
> and rebuild many recipes again to play with bitbake-diffsig for a while..

[...]

> .. end of story ..
> 
> .. I agree it's "right (TM)" to rebuild not only changed package but also its dependencies ..
> .. I agree it's not possible to differentiate between important library change
>    which can infulence also packages depending on it even if only transitive and
>    cosmetic change improving ie RDEPENDS_${PN} which doesn't influence even direct dependants
> .. but impact of such small change on small shr-lite-image?
>    almost 2 hours on my quadcore AMD Phenom(tm) II X4 965@3.4Ghz, 4GB RAM, tmp/work on raid0 (3 SATA2 discs)
> 
> guess how long is runqueue when someone bumps binutils or gcc PR.. it's like DISTRO_PR bump :/
> but almost after every "git pull --rebase".
> 
> this was for our minimal image
> task-shr-feed we have in old OE takes about 2-3 days on our buildhost (dualcore with 2GB ram)
> for 1 arch, we (SHR) are supporting 3 arm architectures 
> armv4t (om-gta01, om-gta02), armv6-novfp (htcdream), armv7a (palmpre, palmpre2, nokia900)
> so currently it takes 10-14 days to rebuild feed after DISTRO_PR change..
> 
> I'm not sure if we can afford our feeds to track oe-core/meta-oe HEADs 
> like we did with old OE :(.

It should still be possible for OE-Core to behave like "old OE".

> Is it expected use-case to base layers only on released version of 
> oe-core/meta-oe and never touch recipes which are higher in dependency tree?

It is expected that as we get a more stable and fully featured core that
people should be able to base off released versions of it rather than
needing to track master the whole time.

> Is it possible to disable sstate and do DISTRO_PR bumps manually when 
> distro maintainder decides it's really needed and buildhost is free 
> for long enough to populate feeds?

What do you mean by disable sstate as there are several different
elements to it.

Which BB_SIGNATURE_HANDLER are you using? It sounds like you're using
basichash but want the behaviour generated by basic (the current
default). Nobody is forcing you to use basichash.

As you mention, there are benefits and drawbacks either way.

Cheers,

Richard




