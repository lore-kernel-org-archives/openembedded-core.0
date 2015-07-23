Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 784AD7621C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 07:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6N7umeU032625; Thu, 23 Jul 2015 08:56:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WRmEdWgg46o5; Thu, 23 Jul 2015 08:56:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6N7uXT9032619
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Jul 2015 08:56:44 +0100
Message-ID: <1437638193.821.89.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Burton Ross
	<ross.burton@intel.com>
Date: Thu, 23 Jul 2015 08:56:33 +0100
In-Reply-To: <CADkTA4MeGsBtd1iCOOWNhbb4TspG6=OMc6eJ=+wtE_rWWR=-MA@mail.gmail.com>
References: <cover.1437491325.git.bruce.ashfield@windriver.com>
	<CADkTA4NTzQhvmCt4J9BkbsAh6CL5joomn-NDA8=0kgjd6wcTxQ@mail.gmail.com>
	<CADkTA4MeGsBtd1iCOOWNhbb4TspG6=OMc6eJ=+wtE_rWWR=-MA@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] linux-yocto: build changes, 4.1 and libc-headers
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
X-List-Received-Date: Thu, 23 Jul 2015 07:56:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-22 at 15:48 -0400, Bruce Ashfield wrote:
> On Wed, Jul 22, 2015 at 10:03 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Tue, Jul 21, 2015 at 11:21 AM, Bruce Ashfield
> > <bruce.ashfield@windriver.com> wrote:
> >> Hi all,
> >>
> >> This series absolutely needs some more testing and runs through the
> >> autobuilder, but I've done pretty much all I can do with it here.
> >>
> >> I have more changes to the build process that will follow this, but
> >> these changes need to show that they are stable, so here's the first
> >> blast.
> >>
> >> With this series:
> >>
> >>   - I create the 4.1, and 4.1-rt linux-yocto content. This will be
> >>     the new LTSI kernel. Deletion of 3.14 and 3.19 will follow once
> >>     all machines have been moved forward.
> >>
> >>   - libc-headers updated to match the 4.1 kernel version.
> >>
> >> And the one that could cause some issues/compatibility issues is the
> >> split of the kernel configuration data from the kernel tree itself.
> >>
> >> From the commit log:
> >>
> >>   The linux-yocto tree has always been a combined set of kernel changes
> >>   and configuration (meta) data carried in a single tree. While this
> >>   format is effective at keeping kernel configuration and source
> >>   modifications synchronized, it isn't always obvious to developers on
> >>   how to manipulate the meta data versus the source.
> >>
> >>   With this change, we remove the meta data processing from the
> >>   kernel-yocto class and use the external meta-data repository that
> >>   has always been used to seed the linux-yocto meta branch.
> >>
> >>   After this change, linux-yocto can no longer process combined trees,
> >>   and is simplified as a result.
> >>
> >> I'm interested to find out if we get any breakages or severe compability
> >> issues with the change. I don't want to support both variants of the
> >> meta data (in and out of tree), since the goal is to reduce complexity
> >> in the code. Once this change lands, I'll further streamline things.
> >>
> >> I've built core-image-kernel-dev and boot tested the qemu* machines.
> >> qemuppc continues to show a boot failure with systemd, but we have a
> >> bugzilla to track that.
> >>
> >> I'm now doing graphical testing, but wanted to get this out and soaking
> >> for other images types while I wait for builds to churn.
> >
> > As a follow up, my qemuarm boots that worked on Friday, are now hanging.
> > I'm bisecting to find out what happened.
> 
> And a final follow up.
> 
> qemuarm (console and graphics) works fine .. but only if you use gcc
> 4.9.x, gcc 5.1
> is doing something evil.
> 
> We've looked into this in the past, so it is a known issue, but I need
> to handle these
> separately.

We got the results of a run of those changes through the autobuilder
without the noise of other failures. The error reporting system shows:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=d687cdfd04f3d97923c93239ea902bb38e2ea336

and I believe we have the following issues:

a) qemux86/qemux86-64 are throwing warnings about errors in logs
b) perf has some weird make race
c) the qemuarm build looks like qemu either segfaulted or was killed
d) we're occasionally seeing 3.19 and 3.14 fetch failures:
https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/394/steps/BuildImages/logs/stdio
https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/87/steps/Running%20oe-selftest/logs/stdio

To try and promote more sstate cache reuse whilst we sort the remaining
issues, I merged the linux-libc-header part, we need to get the above
fixed before the other pieces can merge.

Cheers,

Richard




