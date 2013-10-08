Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8542D610F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 12:19:44 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r98CJXsS003790; Tue, 8 Oct 2013 13:19:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gjciBAH2ZalM; Tue,  8 Oct 2013 13:19:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r98CJRMF003780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 8 Oct 2013 13:19:29 +0100
Message-ID: <1381234763.29912.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Richard Tollerton <rich.tollerton@ni.com>
Date: Tue, 08 Oct 2013 13:19:23 +0100
In-Reply-To: <87mwmkpjlp.fsf@weregild.amer.corp.natinst.com>
References: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
	<524F85EA.30805@linux.intel.com> <1380958620.30971.9.camel@ted>
	<87mwmkpjlp.fsf@weregild.amer.corp.natinst.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, gratian.crisan@ni.com,
	ken.sharp@ni.com
Subject: Re: [dylan, master][PATCH] autotools.bbclass: Fix race with sed-native
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
X-List-Received-Date: Tue, 08 Oct 2013 12:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-10-07 at 21:44 -0500, Richard Tollerton wrote:
> richard.purdie@linuxfoundation.org writes:
> 
> > On Fri, 2013-10-04 at 20:22 -0700, Saul Wold wrote:
> >> On 10/04/2013 04:35 PM, Richard Tollerton wrote:
> >> This also starts to create more front end bottle next on autotools 
> >> related items before we can really start to parallelize the build.
> >> 
> >> More thought is required on this.
> >
> > Please have a look at the sed-native changes that went into master
> > recently as I think this issue has been fixed differently...
> 
> Indeed, I agree that commit db2eb325 would fix the race... aaaand this
> also makes me 2-for-2 this month on reinventing the wheel. :'(
> 
> But this brings up a question I've been meaning to ask.
> 
> Build reproducibility is reduced (all other things being equal) as more
> external dependencies are introduced. So I would have expected that The
> Right Thing here would have been to specify -native packages as explicit
> dependencies (just like it's always important to comprehensively
> enumerate dependencies). Not to add specific short-circuits to use the
> system package. sed's probably a bad example here since it is rather
> well-behaved -- surely this sort of issue comes up for many other
> packages, though...
> 
> I know that the OE build is horribly slow, but is it really so slow as
> to require short-circuiting native package dependencies such as this?
> Has there been a general architectural decision made over this sort of
> thing? (I'm sorry, I tried to search for one on the mailing list and
> wiki, but couldn't find any.)

Some native utilities cause big problems in the dependency chain. Things
like tar and gzip have caused us big problems in the past. We've made a
conscious decision to require specific versions of tar, gzip and git for
example to ensure builds work as expected.

The list of things we assume are ok is relatively small and we look at
new issues on a case by case basis. I think sed is well enough
established and well enough behaved to be something we can rely on. In
general we don't rely on much. Do you have any other specific things you
worry about? When you start to look at it, the list is rather small...

Cheers,

Richard





