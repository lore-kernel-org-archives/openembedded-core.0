Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4A45574031
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 10:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4DAY0wC004042; Wed, 13 May 2015 11:34:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7csGllnt8Li7; Wed, 13 May 2015 11:34:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4DAXhlF004029
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 May 2015 11:33:55 +0100
Message-ID: <1431513222.30971.163.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Wed, 13 May 2015 11:33:42 +0100
In-Reply-To: <5551972F.9070202@topic.nl>
References: <5549B621.4060008@topic.nl>
	<1430915731.8074.34.camel@linuxfoundation.org>
	<5551972F.9070202@topic.nl>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Changing external kernel module results in rebuild of whole kernel
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
X-List-Received-Date: Wed, 13 May 2015 10:34:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-05-12 at 08:01 +0200, Mike Looijmans wrote:
> ﻿On 06-05-15 14:35, Richard Purdie wrote:
> > On Wed, 2015-05-06 at 08:35 +0200, Mike Looijmans wrote:
> >> ﻿Something in recent OE-core triggered a weird dependency "backfire".
> >>
> >> If I change a recipe for a kernel module (a bb recipe that does "inherit
> >> module") this will trigger a rebuild of the whole kernel.
> >>
> >> This turns the 5-second job of just updating a single module into a several
> >> minute workout for the build machine, and then causes boards to re-write the
> >> kernel into flash needlessly when upgrading.
> >>
> >> I now see this on all projects using OE-core master. I can't really pin what
> >> caused it though. Anyone else seen this?
> >
> > I have a suspicion this may be as a result of the changed kernel build
> > process in 1.8.
> >
> > The idea there is that the modules depend on the kernel source and
> > rather than taring up and then extracting a large (GB) sized sstate
> > object, we just extract the original kernel source.
> >
> > So is the kernel really rebuilding, or, is it just extracting source for
> > the kernel to build against? I noticed rm_work in your other post and
> > this may also be some bad interaction between rm_work and the kernel
> > build process changes.
> 
> Any things I can try or provide on this?
> 
> As things are now, I'd much prefer the "taring up and then extracting a large 
> (GB) sized sstate object" option, since that at least worked correctly.

Sorry for the delayed reply, I didn't understand exactly what was
happening without looking at a build. By far the easiest "fix" right now
is:

RM_WORK_EXCLUDE += "<my kernel recipe PN>"

This won't cost that much diskspace and should avoid the problem you're
seeing.

The problem is module.bbclass has a DEPENDS on virtual/kernel which
means it depends on <kernel>:do_populate_sysroot. As well as triggering
the unpack to repopulate the shared work area for the kernel, this means
it will cause the thing to effectively repackage.

There are various ideas coming to mind:

* We could drop virtual/kernel from DEPENDS which would shorten the
kernel dependency chain by removing populate_sysroot from the equation.

* We could change the task dependencies of populate_sysroot in
kernel.bbclass so that it doesn't depend on do_install (it doesn't
handle files any more now anyway).

* We could figure out why populate_sysroot from sstate isn't good enough
for bitbake and change the sstate code to use sstate more heavily. If I
remember rightly, we currently rerun all a task's tasks rather than pull
it half from sstate and half not.

None of these jumps out at me as an easy or necessarily desirable fix.

Cheers,

Richard




