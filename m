Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 183F3766DD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 13:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t95DMosZ020843; Mon, 5 Oct 2015 14:22:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C6P6NW01TM94; Mon,  5 Oct 2015 14:22:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t95DMZWR020837
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Oct 2015 14:22:47 +0100
Message-ID: <1444051353.5118.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 05 Oct 2015 14:22:33 +0100
In-Reply-To: <561263C5.2050606@topic.nl>
References: <56124413.7020901@topic.nl>
	<1444040307.5118.13.camel@linuxfoundation.org>
	<561263C5.2050606@topic.nl>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to find out why my do_compile depends on $MACHINE
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
X-List-Received-Date: Mon, 05 Oct 2015 13:22:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-10-05 at 13:49 +0200, Mike Looijmans wrote:
> ﻿On 05-10-15 12:18, Richard Purdie wrote:
> > On Mon, 2015-10-05 at 11:34 +0200, Mike Looijmans wrote:
> >> ﻿I've been puzzling with this for many hours now, but I can't seem to figure
> >> this out.
> >>
> >> I have a recipe that doesn't mention MACHINE anywhere, but still the
> >> sstate-cache won't be re-used for other machines, because OE somehow insists
> >> the package does depend on $MACHINE.
> >>
> >> The workaround I could find is to put something like this in the recipe:
> >>
> >> MACHINE[vardepvalue] = "any"
> >>
> >> (Similar stupid hacks like "vardepsexclude" will probably work too, but I'm
> >> not interested in forcing this particular recipe, but I'm trying to figure out
> >> what makes bitbake think it matters)
> >>
> >> Since it builds for an FPGA type, the package has
> >> PACKAGE_ARCH="${FPGA_FAMILY}" set, and FGPA_FAMILY is set in local.conf.
> >>
> >>
> >> When switching machines, "bitbake -S printdiff fpga-image-dyplo-test" reports
> >> that MACHINE changed and that is what caused sstate not beign reused. But the
> >> recipe does not use anything related to $MACHINE at all.
> >>
> >> Is there a way to make it tell me WHY it thinks that MACHINE is important to
> >> the recipe?
> >
> > Very briefly (sorry travelling), find the task that you want to know
> > more around and find the sigdata file in the stamps directory for it.
> > Run "bitbake-diffsigs <sigdatafile>" and it will show you how the
> > dependencies are calculated. You can compare two sigdata files using the
> > same command, "bitbake-diffsigs <sigdatafile1> <sigdatafile2>".
> 
> Thanks, that reveiled the issue.
> 
> I was smart in local.conf and calculated the FPGA name from the MACHINE name. 
> That yields the same word, but somehow the dependency on the MACHINE variable 
> is kept.
> 
> A simple fix is then to just use a ":=" assignment for FPGA_FAMILY so that the 
> link to MACHINE is lost, but that then results in another rebuild:
> 
>    List of dependencies for variable FPGA_FAMILY changed from 
> 'set(['MACHINE'])' to 'set([])'
>    Dependency on Variable MACHINE was removed

FWIW you can use vardepvalue, e.g.:

FEATURE_INSTALL[vardepvalue] = "${FEATURE_INSTALL}"

which will make it depend on the value of the variable rather than the
dependencies. Yes, a rebuild will result after this but it should be a
one off.

> The FPGA packages take long to build (4 hours for just one is no exception, on 
> an i7 machine) so preventing them to be rebuilt is really important here.
> 
> But having found the issue, I guess after a round of rebuilds, it'll go away now.
>
> For the bigger picture:
> 
> If I have a recipe that says:
> 
> X = "x"
> 
> And I refactor it a bit to read:
> 
> Y = "x"
> X = "${Y}"
> 
> What is the logic behind having to rebuild the package now? Why does the 
> 'source' of the contents matter to the hash? It won't generate different 
> output, regardless whether X is 'calculated' or just 'constant'.
>
> In particular, I've noticed this happening when switching between AUTOREV and 
> a fixed revision in a recipe.

This is simply just the way the system is designed. It checksums the
intermediate steps as well as the endpoints. I guess in the above
example the system might do "export Y" for example.

There are alternative ways to do things but its simply not the way
things were implemented. If you do need to collapse the dependency
chain, you can use vardepvalue which was added for that reason. There
are only a small number of places you really need to do that.

Cheers,

Richard


