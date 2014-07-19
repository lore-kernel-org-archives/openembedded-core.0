Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A02CF65E28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jul 2014 16:21:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6JGLTuo024035; Sat, 19 Jul 2014 17:21:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3CthlFbd0pT8; Sat, 19 Jul 2014 17:21:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6JGLNQ4024027
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 19 Jul 2014 17:21:25 +0100
Message-ID: <1405786878.22985.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Sat, 19 Jul 2014 17:21:18 +0100
In-Reply-To: <53CA603D.4050900@topic.nl>
References: <53CA603D.4050900@topic.nl>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: PRSERVER is killing settop boxes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jul 2014 16:21:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-07-19 at 14:10 +0200, Mike Looijmans wrote:
> For a hobby project (openpli.org) there are about a million boxes 
> running software built with OE.
> 
> I recently upgraded its core to the current master. What now happens is 
> that if a package like gcc has been changed, it will not only rebuild 
> everything, but it will also give all packages a new PR number. When a 
> box in the field now runs "opkg upgrade", it will get 286 "new" packages 
> and will try to squeeze them into its flash filesystem (even though only 
> about 5 of these packages actually have different content). This is 
> likely to kill the box, as the packages installed later on will take up 
> more room in the flash system than when they were initially installed 
> from scratch, and many models are using over 90% of the NAND flash space 
> available already.
> 
> Before the PRSERVER was made mandatory, we never had this problem.
> 
> Is there a way we can get the old behaviour of having to explicitly set 
> the PR of each package?
> Or at least, distinguish between "the package itself was modified" and 
> "some library it depended upon was altered and we built a new one just 
> to make sure, but it'll likely work just fine with the previously built 
> one, so don't update the PR of the dependent packages".

The key question is how do you tell that?

Its always been assumed that we should be able to add some kind of
binary diff tooling onto the end result and then only upgrade the
package, if it really did change (for whatever value of 'change' you
configure).

The issue is that as yet, nobody has actually written that tool. The old
PR bump approach wasn't much better since the right ones never seemed to
get bumped, I was forever getting complaints that the wrong things
changed and I can guarantee you'd have more than 5 new packages even on
the old system.

So the best way forward is some kind of binary history/comparison
tooling interfacing to the PR server but who is going to write that and
when, I don't know. Do I regret moving away from the manual PR bump
model? No, not really, it was a mess.

To be honest, I get depressed when I read things like this. There are
key pieces of functionality we're missing and we simply do not have the
developer manpower to be able to go and fix them all. I want to help but
I'm drowning just trying to keep the day to day project and patches
flowing and generally I never hear about the successes, just when
people's builds break (which is always *my* fault and must be fixed
*now*).

I'd love to see more organisations donating some man power to address
issues like this. People see the project basically keeping moving and
therefore decide to put manpower on things closer to home though. I wish
I knew how to try and improve things, I don't even get the time to step
back and think about that these days though :(.

Cheers,

Richard



