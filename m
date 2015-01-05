Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2457E72143
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t05A7HhT020740; Mon, 5 Jan 2015 10:07:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OVRiTgtR6dly; Mon,  5 Jan 2015 10:07:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t05A75WJ020724
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Jan 2015 10:07:17 GMT
Message-ID: <1420452462.25779.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 05 Jan 2015 10:07:42 +0000
In-Reply-To: <54AA5C4C.60201@topic.nl>
References: <54A2C3B2.9010006@topic.nl>
	<20141230175915.GB18678@crash.betafive.co.uk>
	<54A44ADC.3010000@topic.nl> <54A65B5E.4030504@topic.nl>
	<1420190187.25779.15.camel@linuxfoundation.org>
	<54A95A5A.70809@topic.nl>
	<1420450079.25779.21.camel@linuxfoundation.org>
	<54AA5C4C.60201@topic.nl>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Bug: PR server changes the PKGV variable too
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
X-List-Received-Date: Mon, 05 Jan 2015 10:07:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-01-05 at 10:41 +0100, Mike Looijmans wrote:
> ﻿On 01/05/2015 10:27 AM, Richard Purdie wrote:
> > On Sun, 2015-01-04 at 16:20 +0100, Mike Looijmans wrote:
> > Imagine you're not using gitpkgv. You set:
> >
> > PV = "x.y+${SRCPV}"
> >
> > Since SRCPV contains a revision hash, you can end up in a situation
> > where the version changes and you cannot upgrade the package since the
> > hash didn't 'increase'.
> >
> > The PR server therefore combines with the git fetcher to add an
> > incremental number at the start of the SRCPV string and yes, in that
> > scenario, it acts as a PV server. This is actually working as designed.
> 
> Then the design is wrong. If a package chose to override PKGV manually, then 
> the rest of the system should leave that value as is, and not touch it. 
> Apparently the recipe author knows better, so please let him use that wisdom.
> 
> Also, if you change the architecture of the package, the PR server will reset 
> the version counter to 0 and break the upgrade path too. That was the problem 
> that caused me to discover this problem, the PR server is making it hard to 
> fix arch errors in recipes.

You realise why it does that though? Imagine multiple MACHINE values
being built against a PR server. Each MACHINE will have different
package architecture values and different hashes. The 'PR' values should
therefore be seen as different. If the system didn't do this, it would
increment PR for every MACHINE change.

Ok, so you say, lets make it work against MACHINE. That fails in the
case where multiple MACHINES share a package architecture :/. Its not a
simple problem to try and deal with :(

I make no claim the system is perfect or free from bugs but these
behaviours you're referring to are like this for various reasons. I'm
open to changing them but we need to address the underlying problems
like changing MACHINE above.

There are several other issues with changing package architecture such
as the sstate files in the sysroot. There is an open bug for this and
right now, I simply don't know how to solve it properly :(.

> > When you add in gitpkgv, something is obviously going wrong. gitpkgv is
> > in meta-oe since I've refused to add it to core on the several occasions
> > its been requested. I've said this before but I will say is again, it
> > *needs* become part of the standard fetcher API rather than a hacked in
> > afterthought which doesn't integrate well.
> 
> I already volunteered and tried to do that, but got stuck in lack of 
> understanding how the fetcher works, and did not get any help so abandoned it 
> in favor of keep using gitpkgv "as is". I'm still volunteering, but without 
> help I can't do it.

I'm struggling since to provide the help you need, I'd nearly have to
solve the problem myself. I've helped several different people
understand the fetcher in the past, only to have most of them move onto
other things :(. Add in the 101 other distractions I have and its
frustrating for everyone including me. Can you remind me where you were
at (links to the right emails would help)?

Cheers,

Richard



