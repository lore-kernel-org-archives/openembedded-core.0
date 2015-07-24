Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 42BF360962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 22:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6OMgZtN022881; Fri, 24 Jul 2015 23:42:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hDYGltNuEIKM; Fri, 24 Jul 2015 23:42:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6OMgJ9a022865
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 24 Jul 2015 23:42:30 +0100
Message-ID: <1437777739.821.161.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 24 Jul 2015 23:42:19 +0100
In-Reply-To: <CADkTA4MmTxDpE-TsJdZGhYGDR1sOtUDtETJpjnvyL330+YpGXQ@mail.gmail.com>
References: <cover.1437491325.git.bruce.ashfield@windriver.com>
	<CADkTA4NTzQhvmCt4J9BkbsAh6CL5joomn-NDA8=0kgjd6wcTxQ@mail.gmail.com>
	<CADkTA4MeGsBtd1iCOOWNhbb4TspG6=OMc6eJ=+wtE_rWWR=-MA@mail.gmail.com>
	<1437638193.821.89.camel@linuxfoundation.org>
	<CADkTA4N76E2P5vL=6SuM5xqveotp1tpYon0HN0M8CMa2aXrN7w@mail.gmail.com>
	<1437660855.821.121.camel@linuxfoundation.org>
	<CADkTA4MmTxDpE-TsJdZGhYGDR1sOtUDtETJpjnvyL330+YpGXQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 24 Jul 2015 22:42:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-23 at 11:01 -0400, Bruce Ashfield wrote:
> On Thu, Jul 23, 2015 at 10:14 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2015-07-23 at 09:10 -0400, Bruce Ashfield wrote:
> >> > a) qemux86/qemux86-64 are throwing warnings about errors in logs
> >> > b) perf has some weird make race
> >> > c) the qemuarm build looks like qemu either segfaulted or was killed
> >> > d) we're occasionally seeing 3.19 and 3.14 fetch failures:
> >> > https://autobuilder.yoctoproject.org/main/builders/nightly-intel-gpl/builds/394/steps/BuildImages/logs/stdio
> >> > https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/87/steps/Running%20oe-selftest/logs/stdio
> >>
> >> I explained to Ross that dependent layers need to be updated if they set
> >> their own SRCREV_meta, since the repository is completely different. I
> >> sent a patch for meta-intel to deal with it. Obviously, I only built with the
> >> core BSPs during testing.
> >
> > That could explain d). I believe c) is from the ongoing selftest issues
> > we're having and I we've work in progress for that. That leaves a) and
> > b) to look into and fix.
> >
> >> I'll definitely need help on these, since I wasn't seeing any of these issues
> >> during my testing. Otherwise, this won't be done until September (vacation
> >> and other issues to deal with).
> >>
> >> But I'll see what I can do.
> >>
> >> I unfortunately can't merge anything but critical kernel patches until
> >> these go in as well
> >> since the meta branch is gone in the new scripts, which means SRCREV_meta is
> >> a constant conflict.
> >
> > a) should be straightfoward to fix, its just updating the message
> > whitelists (again).
> 
> I'm building a fresh qemux86-64 now, I'm going to see if the warnings
> are something
> I should fix, versus the whitelist. I should know tomorrow on this one.
> 
> >
> > b) I'm less sure about. Are there any race fixes in mainline for perf?
> > Hard to believe others don't see that one.
> 
> I'm searching as well. I'll share any findings ASAP.

I believe we have everything except b), the last build was much greener.
For b), what strikes me as odd:

https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/409/steps/BuildImages/logs/stdio

|   CC       /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/qemux86-poky-linux/perf/1.0-r9/perf-1.0/util/thread-stack.o
|   CC       /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/qemux86-poky-linux/perf/1.0-r9/perf-1.0/util/symbol-elf.o
|   CC       /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/qemux86-poky-linux/perf/1.0-r9/perf-1.0/util/probe-event.o
|   CC       /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/qemux86-pokymllib32-linux/lib32-perf/1.0-r9/perf-1.0/builtin-annotate.o
|   CC       /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/qemux86-poky-linux/perf/1.0-r9/perf-1.0/util/perf_regs.o
|   MKDIR    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work//lib32-perf/1.0-r9/perf-1.0/util/scripting-engines/
|   CC       /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/qemux86-pokymllib32-linux/lib32-perf/1.0-r9/perf-1.0/util/scripting-engines/trace-event-perl.o
|   CC       /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-world/build/build/tmp/work/qemux86-poky-linux/perf/1.0-r9/perf-1.0/util/zlib.o

Why is it building in two different directories (qemux86-poky-linux and
qemux86-pokymllib32-linux) ?

I'd bet that would explain the errors and that it would only show up in
a multilib case (which is the default on the AB for this part of the
build).

Hopefully this gets us closer to figuring out what its doing...

Cheers,

Richard




