Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDz6M-00034y-H0 for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 16:16:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VE78df024151;
	Sat, 31 Mar 2012 15:07:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23140-03; Sat, 31 Mar 2012 15:07:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VE70cf024143
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 31 Mar 2012 15:07:02 +0100
Message-ID: <1333202821.18082.225.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 31 Mar 2012 15:07:01 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "sanil.kumar" <sanil.kumar@huawei.com>, Steve Sakoman <steve@sakoman.com>
Subject: Re-execution of tasks - test report and results
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
X-List-Received-Date: Sat, 31 Mar 2012 14:16:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As some people have noticed, there are some rebuild issues happening due
to sstate and the use of hashes in the stamp files. By this I mean the
case where due to some checksum change, some task gets rerun and the
task was not written to run a second time.

In other words all tasks are not idempotent (thanks Koen!) but should
be.

For the purposes of finding these tasks, we have the open bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=2123

and there are two proposed scripts there. One is a simple forced
re-execution of each task in turn. This catches some issues but not
others. I therefore wrote a second slower script which after forcing a
task, re-executes the current target to completion. The second script is
much slower than the first but finds different errors and better
pinpoints some others.

I've had my build machine iterating with the second script for a while
and its tested about 5,000 task re-executions and identified a number of
failures. Its not complete yet but its mostly there and I'm going to put
the failures in two groups:

a) Don't build at all:

alsa-tools.compile - need to check into/fix (local issue, works on AB?)
insserv-native.compile - need to check into/fix or delete
libx11-diet.compile - need to check into/fix
external-python-tarball - need to check into/fix
external-poky-toolchain - time to delete this recipe?
package-index - rpm package feed generation dependencies missing, has open bug
gobject-introspection - Known issue, not cross compile capable

Most of these are things excluded from world which have "fallen through
the cracks" or are known issues.

b) Failures in specific task re-execution

boost.boostconfig
boost.patch
docbook-utils-native.unpack
dropbear.debug_patch
eglibc-initial-nativesdk.patch
eglibc-initial.patch
eglibc-nativesdk.patch
eglibc.patch
gcc.configure
gcc-cross-canadian-i586.configure
gcc-cross-canadian-i586.headerfix
gcc-cross-canadian-i586.patch
gcc-cross-canadian-i586.unpack
gcc.headerfix
gcc.patch
gcc.unpack
man-pages.unpack
nasm-native.patch
nasm-native.patch_fixaclocal
nasm.patch
nasm.patch_fixaclocal
net-tools.patch
net-tools.unpack
perl.patch
python-native.patch
python-nativesdk.patch
python.patch
qt-x11-free.configure
qt-x11-free.generate_qt_config_file
qt-x11-free.patch
sgml-common-native.compile
unfs-server-native.configure
unfs-server-nativesdk.configure
wget.patch

To reproduce, just run "bitbake xxx -c cleansstate; bitbake xxx; bitbake
xxx -c yyy -f; bitbake xxx".

I've weeded out the false positives which were things like errors about
multiple providers changing bitbake's exit code. I also found building
libiconv totally destroyed the sysroot and caused iconv.h failures so I
blacklisted it.

Is there anything these tests won't find?

Sadly, yes :(

If you do something like "bitbake -c compile perl -f; bitbake git -c
compile -f", it breaks since there is a dependency there with the
timestamps that causes problems. Neither script above would conclusively
detect this, you might get lucky with the first one.

Secondly, in these tests we didn't check "does the output change?" since
we have no good tool to do this yet.

I'd propose we at least get the above issues identified fixed. People
can then report any other issues they run into and we fix them as we
find them...

We also need to go through Jiajun's list in the bugzilla carefully too
since I think there are some different issues being exposed there. Some
are duplicates of the above, some are not.

Cheers,

Richard




