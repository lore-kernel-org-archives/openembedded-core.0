Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F36CB6098B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 14:57:41 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3MEvak7015068 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 15:57:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mlAaGbCtBDAE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 15:57:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3MEvXPg015064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 15:57:35 +0100
Message-ID: <1398178648.16672.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Apr 2014 15:57:28 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Arch specific compilers (instead of tune specific)
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
X-List-Received-Date: Tue, 22 Apr 2014 14:57:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Right now we build multiple different versions of gcc-cross, effectively
one per target tune. This is somewhat inefficient and the problem just
gets worse when you bring multilibs into the equation.

In theory at least, we can actually use the same cross binaries
(binutils/gcc/gdb) for all tunes for a given architecture. We've already
proven this is possible with the changes to the -cross-canadian
variants.

There are some things we don't currently support well too such as
multilib SDKs and 64 bit kernels with 32 bit userspace.

In the 1.7 timeframe I'd therefore like to propose we re-work the
gcc-cross recipes to have common architecture specific binaries. The
advantage would be fewer builds of gcc, better sstate cache reuse (and
size) and faster turnaround when switching tunes.

I've already experimented with patches for this and have something that
roughly works at:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t67&id=9c10238df1b2a5d818b289f85d2b9a13e2a886e9

This patch makes the cross recipes more like native ones with a new arch
suffix to the cross recipe.

At the practical level there are some challenges:

a) We need to split out a libgcc-initial from gcc-cross-intial since
this is target specific.
b) We need to stop gcc-cross and -initial from building libgcc but we
still need the unwind.h header it installs.
c) We need to remove references to tunes from the arch specific parts.
This includes the gcc float option code.
d) Need to remove the sstate dependency of gcc-cross-${TARGET_ARCH} on
libc
e) To allow libgcc-initial to work, we need to save out the
gcc-cross-initial artefacts. I'm hoping we can slim these down a little
(for gcc-cross too).

I'll split that patch into a number of patches and alter it to better
reuse the libgcc code now I have an idea what I'm aiming for.

I'd also note that this change doesn't yet optimise the multilib
toolchain build but that should be an easy step from this patch.

We may need to end up listing a hard list of "aliases" for the toolchain
on each arch rather than some of the funky multilib parsing we currently
do for simplicity. There are only a finite set of permutations supported
anyway.

The purpose of the email is to give people a headsup this is coming and
let people take a look at the preliminary code. 

Khem: Particularly interested in your thoughts! :)

Cheers,

Richard



