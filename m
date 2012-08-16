Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T24II-0007HZ-RE
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 19:55:43 +0200
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id BD6FC21162;
	Thu, 16 Aug 2012 10:43:45 -0700 (PDT)
Message-ID: <502D314F.5010302@windriver.com>
Date: Thu, 16 Aug 2012 10:43:43 -0700
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Phil Blundell <philb@gnu.org>
References: <1345070782-4518-1-git-send-email-andy.ross@windriver.com>
	<1345070782-4518-2-git-send-email-andy.ross@windriver.com>
	<1345106385.7750.76.camel@x121e.pbcl.net>
In-Reply-To: <1345106385.7750.76.camel@x121e.pbcl.net>
Subject: Re: [PATCH] insane.bbclass: Fix RPATH warning in the face of funny path strings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 17:55:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2012 01:39 AM, Phil Blundell wrote:
> If these RPATHs are causing host pollution then that sounds like there
> is another bug elsewhere.  They ought to be resolved relative to the
> sysroot during link edit.

Indeed, this is turning out to be a deeper issue than I wanted it to
be.  What seems to be is happening is this: an RPATH in the ELF header
is interpreted relative to sysroot normally.  But when linking, a
-rpath argument to the ld is interpreted relative to the *host*
filesystem even when there is a --sysroot argument.  See the quick
test script below.

As it happens, both of those are ultimately produced by libtool, and
it's only the second one that is fatal.  The RPATH itself is probably
still a warning condition, but it's not a build breaker.  But neither
is needed, they are happening in the case I'm looking at only because
libtool (I think) is confused by the "/../" syntax in the link path
into trying to add an RPATH where one isn't needed.

The specific case I'm looking at (with our internal tree, I'm working
on reproducing vs. poky right now) is with a pulseaudio build, where
an x86-64 build on an x86_64 host hits a RPATH in libgdk-x11-2.0 that
pulls in the host libXranr and fails due to version skew.  I was just
pointed at a discussion from last week on owl_video which looks all
but identical.

At least for the moment I'm going to try to track down the libtool
issue (maybe sanify the path before it sees if if possible) instead of
trying to fix a linker bug.

Andy

Reproducer for the underlying linker issue:

#!/bin/sh
set -ex

SYSROOT=/home/andy/oe/poky/build/tmp/sysroots/qemux86-64
CC=/home/andy/oe/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc

# A library:
echo 'int foo(){return 0;}' > foo.c
$CC -shared -fPIC -o libfoo.so foo.c

# Another library that references the first via RPATH=`pwd`
echo 'int foo(); int bar(){return foo();}' > bar.c
$CC -shared -fPIC -o libbar.so bar.c -L. -lfoo -Wl,-rpath -Wl,`pwd`

# A program that uses the second library:
echo 'int bar(); int main(){return bar();}' > main.c

# Works (incorrectly!) because the "-rpath `pwd" argument here is
# *not* interpreted relative to sysroot, so the linker sees
# ./libfoo.so as a potential library.
$CC --sysroot=$SYSROOT -L$SYSROOT/usr/lib64 -Wl,-rpath -Wl,`pwd` -o main2 main.c libbar.so

echo THAT LINK SHOULD HAVE FAILED

# Fails (correctly) because nothing on the link line tells libbar.so
# how to find libfoo.so, nor does libfoo.so exist in the
# sysroot-relative RPATH.
$CC --sysroot=$SYSROOT -o main main.c libbar.so




