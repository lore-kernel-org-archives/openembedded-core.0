Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1T7ZDt-0002cu-C1
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 23:57:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Aug 2012 14:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,349,1344236400"; d="scan'208";a="194368016"
Received: from unknown (HELO localhost) ([10.255.13.47])
	by orsmga002.jf.intel.com with ESMTP; 31 Aug 2012 14:45:21 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, sgw@linux.intel.com
Date: Fri, 31 Aug 2012 16:45:19 -0500
Message-Id: <cover.1346448608.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/1] crosstap: a systemtap usability script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 21:57:53 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patch implements a script called 'crosstap', which essentially
encapsulates and automates the tedious steps until now required to
use systemtap on a remote embedded target, outlined here:

https://wiki.yoctoproject.org/wiki/Tracing_and_Profiling

There's actually a Yocto bug tracking this work, see for a little
more background:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=1551

I've tested the below scripts on a couple qemu targets (qemuarm and
qemux86) as well as on real hardware (emenlow).  I'll be doing a lot
more testing of this script in the coming weeks as I address another
enhancement (tracing and profiling HOWTOs):

https://bugzilla.yoctoproject.org/show_bug.cgi?id=1640

The examples tested were:

1) The simplest possible probe, which just prints 'hello world':

probe begin
{
	print ("hello world\n")
	exit ()
}

[trz@empanada tutorial]$ crosstap root@192.168.7.10 helloworld.stp
~/tracing/systemtap/scripts/tutorial ~/tracing/systemtap/scripts/tutorial
~/tracing/systemtap/scripts/tutorial
root@192.168.7.10's password: 
hello world

2) The next simplest possible probe, which prints 'hello world', but also
demonstrates that any number of arguements can be passed to the systemtap
script:

probe begin
{
	printf("hello world with cmdline args, numeric arg: %d, string arg: %s\n", $1, @2)
	exit ()
}

[trz@empanada tutorial]$ crosstap root@192.168.7.10 helloworld_args.stp 99 ninetynine -v
~/tracing/systemtap/scripts/tutorial ~/tracing/systemtap/scripts/tutorial
~/tracing/systemtap/scripts/tutorial
root@192.168.7.10's password: 
Pass 1: parsed user script and 83 library script(s) using 150500virt/22236res/2148shr/20612data kb, in 80usr/0sys/81real ms.
Pass 2: analyzed script: 1 probe(s), 1 function(s), 0 embed(s), 0 global(s) using 150896virt/22760res/2224shr/21008data kb, in 0usr/0sys/2real ms.
Pass 3: translated to C into "/tmp/stapJsYotR/helloworld_args_src.c" using 151020virt/23208res/2616shr/21132data kb, in 0usr/0sys/0real ms.
Pass 4: compiled C into "helloworld_args.ko" in 1030usr/450sys/1568real ms.
Pass 5: starting run.
hello world with cmdline args, numeric arg: 99, string arg: ninetynine
Pass 5: run completed in 10usr/0sys/426real ms.

3) A more interesting, marginally useful test, instrumenting and printing
out information about every 'open' syscall that happens on the system:

probe syscall.open
{
	printf ("%s(%d) open (%s)\n", execname(), pid(), argstr)
}

probe timer.ms(9000) # after 9 seconds
{
	exit ()
}

On the target system:
# cat /etc/*

[trz@empanada tutorial]$ crosstap root@192.168.7.10 trace_open.stp
~/tracing/systemtap/scripts/tutorial ~/tracing/systemtap/scripts/tutorial
~/tracing/systemtap/scripts/tutorial
root@192.168.7.10's password: 
syslogd(811) open ("/var/log/messages", O_WRONLY|O_APPEND|O_CREAT|O_LARGEFILE|O_NOCTTY|O_NONBLOCK, 0666)
cat(963) open ("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC|O_CLOEXEC)
cat(963) open ("/lib/libc.so.6", O_RDONLY|O_CLOEXEC|O_CLOEXEC)
cat(963) open ("X11", O_RDONLY|O_LARGEFILE)
cat(963) open ("apm", O_RDONLY|O_LARGEFILE)
cat(963) open ("asound.conf", O_RDONLY|O_LARGEFILE)
.
.
.
cat(963) open ("init.d", O_RDONLY|O_LARGEFILE)
cat(963) open ("inittab", O_RDONLY|O_LARGEFILE)
cat(963) open ("inputrc", O_RDONLY|O_LARGEFILE)
cat(963) open ("issue", O_RDONLY|O_LARGEFILE)
cat(963) open ("issue.net", O_RDONLY|O_LARGEFILE)
cat(963) open ("ld.so.cache", O_RDONLY|O_LARGEFILE)
matchbox-termin(891) open ("/tmp/vteNQTCKW", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE, 0600)
matchbox-termin(891) open ("/tmp/vteQOVCKW", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE, 0600)
matchbox-termin(891) open ("/tmp/vte0QKDKW", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE, 0600)
matchbox-termin(891) open ("/tmp/vteUBAFKW", O_RDWR|O_CREAT|O_EXCL|O_LARGEFILE, 0600)
cat(963) open ("ld.so.conf", O_RDONLY|O_LARGEFILE)
cat(963) open ("libnl", O_RDONLY|O_LARGEFILE)
cat(963) open ("limits", O_RDONLY|O_LARGEFILE)
cat(963) open ("login.access", O_RDONLY|O_LARGEFILE)
cat(963) open ("login.defs", O_RDONLY|O_LARGEFILE)
cat(963) open ("logrotate.d", O_RDONLY|O_LARGEFILE)
cat(963) open ("matchbox", O_RDONLY|O_LARGEFILE)
.
.
.


The following changes since commit 9ba1e33e2d14362971d6441ee6142bcb0857df1a:

  sstate: Ensure master.list exists if it doesn't already (2012-08-30 22:45:56 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/crosstap.v1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/crosstap.v1

Tom Zanussi (1):
  crosstap: new script

 scripts/crosstap | 148 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100755 scripts/crosstap

-- 
1.7.11.4



