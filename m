Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgGzc-0007Gf-SH for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 16:34:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5FKCsV019048;
	Wed, 5 Dec 2012 15:20:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18639-04; Wed,  5 Dec 2012 15:20:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5FK3cC019033
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Dec 2012 15:20:05 GMT
Message-ID: <1354720793.25268.115.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 05 Dec 2012 15:19:53 +0000
In-Reply-To: <20121205144539.GA3396@jama.jama.net>
References: <1354716839.25268.105.camel@ted>
	<20121205144539.GA3396@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Switch to PR server model for PR bumps - 1 week
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 15:34:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-12-05 at 15:45 +0100, Martin Jansa wrote:
> On Wed, Dec 05, 2012 at 02:13:59PM +0000, Richard Purdie wrote:
> > I've made it clear we want and need to switch to the PR service for
> > handling PR bumps. I'd now like to put a deadline in place for doing
> > this, namely that I'm going to stop requiring PR bumps in patches as of
> > 1 week's time. The TSC did discuss this and our conclusion was that we
> > need to switch early in this release cycle to give time for any issues
> > to get resolved. Now is a good time to do this as I think we're ready.
> > 
> > There were a number of open bugs related to the PR service[1]. We've
> > looked through them and they are now resolved with the exception of one
> > related to the incremental git PV issue for which we have a plan in
> > place and patches ready.
> > 
> > We've taken on board feedback about documentation and the following wiki
> > page has been setup which details the current situation:
> > 
> > https://wiki.yoctoproject.org/wiki/PR_Service
> > 
> > I appreciate this is going to be a disruptive change for some but I
> > believe it is in the best interests of the project longer term and that
> > we will have a better system as an end result of this. If people do run
> > into problems, please send email or file bugs. I'm trying to ensure
> > there are some people with time available to look into these issues as a
> > priority so we can make a smooth transition.
> 
> After reading this wiki page I have few questions (I admit I haven't
> tried it yet).
> 
> 1) How do you limit access to shared prserv instance?
>    Can you define some group as RO, some RW?
>    For RO access it would be great to export state from remote PRSERV 
>    on first connection and then continue to increment locally (with
>    PRSERV running on localhost)

This isn't implemented as things stand. As you point out, a true RO
connection causes problems...

> 2) If you have slightly different builder (e.g. someone with extra BSP
>    or different host distro), then he will have different checksums, so
>    different AUTOPR values and you cannot share binary feed with such
>    builder, right? I know this wasn't possible (or at least safe) to use
>    before too. But it should be more clear from documentation.

If the extra BSP uses its own package_arch it would probably be ok,
otherwise not. The host distro only affects native/cross packages and
not the checksum itself so again, that should also be ok?

> 3) Is it possible to use OEBasic together with PRSERV or should bitbake
>    show fatal error when PRSERV is used toghether with OEBasic?


Added to the page: "The service works with both OEBasic and OEBasicHash
generators, with the understanding that PR bumps happen when the
checksum changes and the different generator mechanisms change
signatures under different circumstances."

> 4) Is there plan to import current PR values from recipes, so that
>    bitbake can parse all enabled layers, gather checksum-PR values and
>    export it for bitbake-prserv-tool to import it as inital state?
> 5) Is there plan to remove PR from all recipes or are they ignored with
>    PRSERV in use and can stay in for some time? If there is functionality 
>    for 4) then we should tag all layers just before PR/PRINC are removed, 
>    so someone can create own initial export from last known PR state.

Added to the page: "As implemented, values from the PR service are
included into the PR field as an addition of the form ".X" so r0 becomes
r0.1, r0.2 and so on. This allows existing PR values to be used for
whatever reasons allowing manual PR bumps should it be necessary."

(should cover both questions)

As for removing PR, as recipes are upgraded, I'm expecting we will
remove PR values so we should get a smooth transition. We can still have
PR values, it will just become an exception rather than the rule.

Cheers,

Richard



