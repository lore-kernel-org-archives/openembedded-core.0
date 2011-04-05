Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q7DlG-0000aN-Jq for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 23:26:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p35LO1di002702;
	Tue, 5 Apr 2011 22:24:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02402-01-5; Tue,  5 Apr 2011 22:23:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p35LLBT3001652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Apr 2011 22:21:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: poky <poky@yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Tue, 05 Apr 2011 12:02:45 +0100
Message-ID: <1302001365.24596.459.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Tue, 05 Apr 2011 21:26:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

One of the items on our post 1.0 schedule is multilib and we need a plan
of implementation. I've been thinking about this for a while and at
least have some ideas how some of the issues can be handled.

In case anyone isn't familiar with the idea of multilibs, the most
common example are x86 systems which have both 32 bit and 64 bit
libraries installed at the same time in /lib/ and /lib64/ directories or
similar and hence both types of binaries can be used.

The number of libs isn't limited to two choices as for example the mips
platform has three choices which can be used in parallel. The x32 ABI
would mean three possible x86 options too. 

The first step is being able to build given recipes for each of a set of
given multilibs. This is very similar in principle to the way
BBCLASSEXTEND is used, the difference it that whilst the native or
nativesdk classes are used once, for multilib we need a kind of multiple
inheritance of a class assuming we don't want one class per multilib.

To do this I'm thinking of a new set of include files of the form
conf/machine/include/multilib-xxxx.inc, similar in nature to the
tune-xxx.inc files. A given setup would include each of the multilibs it
requred. Each multilib include file would look something like:

conf/machine/include/multilib-x86-lib32.inc:

MULTILIBS += "lib32"

BASE_PACKAGE_ARCH_virtclass-multilib-lib32 = "core2-lib32"
TARGET_CC_ARCH_virtclass-multilib-lib32 = "-m32 -march=core2"
PACKAGE_EXTRA_ARCHS += "core2-lib32"

libdir_virtclass-multilib-lib32 = "${exec_prefix}/lib32"
base_libdir_virtclass-multilib-lib32 = "${base_prefix}/lib32"

i.e. use overrides to change the target cc architecture specifying the
required flags to the compiler and also alter the library paths as
required.

I'm envisaging passing an optional new parameter to classes in
BBCLASSEXTEND so for example the definition of a multilib could look
something like:

BBCLASSEXTEND_append = " multilib:x86-lib32"

and all the multilib class would need to do is to manipulation of
variables including OVERRIDES in a similar way to native.bbclass with
the complication of handling the parameter.

The toolchain bootstrap process would become a little complicated by
this. We'll need to be able to iterate over the list of multilibs and
configure the compiler with a configuration appropriate to the multilibs
requested. The compiler should then take care of generating a suitable
libgcc for each multilib. Where the compiler currently depends on
virtual/libc-initial, we'll need with a function called to generate the
dependecies so for example: "virtual/libc virtual/libc-initial-lib32"

The toolchain bootstrap process would hence become something like:

gcc-cross-initial
libc-initial
libc-initial-lib32
gcc-cross-intermediate
libc
libc-lib32
gcc-cross
libgcc (package)
libgcc-lib32 (package)
gcc-runtime
gcc-runtime-lib32

So for any multilib, we're stuck with always building the libc due to
the way gcc handles multilib. For subsequent tasks, only the libs
requested in a give image in a given ABI would be built.

Note that as far as the build system is concerned there become distinct
targets for each ABI so "bitbake mysql" would build the default library
type, "bitbake mysql-lib32" would build the 32 bit version. Including
both "mysql" and "mysql-lib32" in an image is where things get
interesting, the build system will ensure they're both built, then it
becomes the problem of the image creation and package
creation/management processes.

The final tricky part of the puzzle which is under the guidance of the
package manager. rpm has extensive pre-existing mutlilib support. opkg
has none.

It should be possible to convert the build system package name
libmysql-libx32 into just "libmysql" for the benefit of rpm and use
rpm's package flavours to handle the multilib issues.

For opkg there are multiple levels we can take the integration to. It
should be possible for example to install the "weaker" multilibs first,
then just install the stronger ones over the top, assuming any file
overwriting is ok and can be ignored. Teaching opkg about proper
multilib support would be a bigger project but would be much less of a
hack/workaround.

So to summarise the steps needed are:

a) bitbake enhancement for BBCLASSEXTEND parameter support
b) Add simple multilib build configuration
c) Update toolchain bootstrap with multilibs support
d) Add RPM multilib packaging
e) Look at opkg multilib integration


Does this make sense to everyone, are there any questions/ objections/
concerns/ things I've missed?

Cheers,

Richard



