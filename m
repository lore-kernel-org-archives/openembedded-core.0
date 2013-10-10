Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D0B4E6CC7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 09:00:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9A90Our022778; Thu, 10 Oct 2013 10:00:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FFdia83nUpa9; Thu, 10 Oct 2013 10:00:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9A90GAF022769
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 10 Oct 2013 10:00:18 +0100
Message-ID: <1381395612.29912.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Richard Tollerton <rich.tollerton@ni.com>
Date: Thu, 10 Oct 2013 10:00:12 +0100
In-Reply-To: <87txgr64et.fsf@weregild.amer.corp.natinst.com>
References: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
	<524F85EA.30805@linux.intel.com> <1380958620.30971.9.camel@ted>
	<87mwmkpjlp.fsf@weregild.amer.corp.natinst.com>
	<1381234763.29912.39.camel@ted>
	<87txgr64et.fsf@weregild.amer.corp.natinst.com>
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
X-List-Received-Date: Thu, 10 Oct 2013 09:00:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-10-08 at 12:47 -0500, Richard Tollerton wrote:
> richard.purdie@linuxfoundation.org writes:
> 
> >> I know that the OE build is horribly slow, but is it really so slow as
> >> to require short-circuiting native package dependencies such as this?
> >> Has there been a general architectural decision made over this sort of
> >> thing? (I'm sorry, I tried to search for one on the mailing list and
> >> wiki, but couldn't find any.)
> >
> > Some native utilities cause big problems in the dependency chain. Things
> > like tar and gzip have caused us big problems in the past. We've made a
> > conscious decision to require specific versions of tar, gzip and git for
> > example to ensure builds work as expected.
> 
> I can level with that. However, it doesn't seem obvious that such a
> decision was conscientiously made, judging from the code/documentation
> (at least to a neophyte like me). Is there a place I've missed where
> such technical decisions have been documented? (Or should there be? Or
> should I just ask these sorts of questions on IRC?)

There have been mailing list discussions that have happened as issues
have been noticed and patches which documented what was being changed
and why. The "formal" documentation is probably the ASSUME_PROVIDED
variable. The project makes lots of decisions and its hard to document
everything formally, help in doing that would be great but it would be
hard. I guess asking people is the best way of getting information (as
you're doing now) and/or looking at the mailing list archives and the
git history.

For example, searching for "git-native" shows:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t2&id=617835990edf1d7ca4fc8c08993b1b6725f12290

> > The list of things we assume are ok is relatively small and we look at
> > new issues on a case by case basis. I think sed is well enough
> > established and well enough behaved to be something we can rely on. In
> > general we don't rely on much. Do you have any other specific things you
> > worry about? When you start to look at it, the list is rather small...
> 
> The biggest thing I can think of is gcc-native. My understanding of gcc
> documentation is that it's recommended to build a cross-compiler with a
> bootstrap, or at least the same version of compiler, and we're not doing
> that. (Right?)

We don't build a gcc-native, no. Equally, we've not run in many issues
due to that so its not been something we've thought necessary.

Cheers,

Richard



