Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcYs1-0000XW-PW for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 10:14:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p618ArmX008438
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 09:10:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08141-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 09:10:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p618Akj6008432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 09:10:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <2B6421C4-E7C5-42FB-B46F-AAFAE85DB7F2@dominion.thruhere.net>
References: <cover.1309243115.git.liezhi.yang@windriver.com>
	<4E0D062C.5060302@linux.intel.com>
	<2B6421C4-E7C5-42FB-B46F-AAFAE85DB7F2@dominion.thruhere.net>
Date: Fri, 01 Jul 2011 09:10:26 +0100
Message-ID: <1309507826.20015.509.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: It's broken, please revert. Re: [PATCH 0/4 V4] Share gcc work directories
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
X-List-Received-Date: Fri, 01 Jul 2011 08:14:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 09:15 +0200, Koen Kooi wrote:
> Op 1 jul 2011, om 01:26 heeft Saul Wold het volgende geschreven:
> 
> > On 06/28/2011 02:05 AM, Robert Yang wrote:
> >> Changes of V4:
> >> 
> >> * Change the definition of GLIBC_DYNAMIC_LINKER as Richard suggested.
> >> 
> >>   e.g., the entries in the files that look like:
> >>   #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
> >> 
> >>   become
> >> 
> >>   #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
> >> 
> >>   and we define SYSTEMLIBS_DIR in defaults.h.
> >> 
> >>   NOTE, the round brackets:
> >>   #define GLIBC_DYNAMIC_LINKER64 (SYSTEMLIBS_DIR "/ld-linux-x86-64.so.2")
> >> 
> >>   doesn't work in in the following define:
> >> 
> >>   #define LINUX_DYNAMIC_LINKER \
> >>           CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
> >> 
> >>   so use:
> >>   #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
> >> 
> >> * Compare to V3, reduce two patches which are for gcc-crosssdk.inc and
> >>   gcc-cross-canadian which are not needed any more.
> >> 
> >> * Fix the conflicts(gcc-4.6.0 ->  gcc-4.6, and the ${BRANCH})
> >> 
> >> * Both tested 4.5.1 and 4.6:
> >>   $ bitbake meta-toolchain core-image-sato
> >>   $ runqemu qemurm
> >> 
> >>   Also unpack the sdk to /opt and test to make sure the toolchain works well.
> >> 
> >> 
> >> The following changes since commit a1f79a7896b6411669b3ccada6204d2695e80fc5:
> >> 
> >>   runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)
> >> 
> >> are available in the git repository at:
> >>   git://git.pokylinux.org/poky-contrib robert/share_gcc
> >>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/share_gcc
> >> 
> >> Robert Yang (4):
> >>   bitbake: share source directory
> >>   Share gcc work directories
> >>   gcc-4.5.1: share work directories
> >>   gcc-4.6: share work directories
> >> 
> >>  bitbake/lib/bb/build.py                            |    4 +-
> >>  bitbake/lib/bb/cache.py                            |    3 +
> >>  bitbake/lib/bb/runqueue.py                         |   10 +++
> >>  meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    1 +
> >>  .../gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch   |   57 ++++++++++++++
> >>  meta/recipes-devtools/gcc/gcc-4.6.inc              |    5 +-
> >>  .../gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch |   80 ++++++++++++++++++++
> >>  meta/recipes-devtools/gcc/gcc-common.inc           |   32 +++++++-
> >>  meta/recipes-devtools/gcc/gcc-configure-common.inc |   48 +++++++-----
> >>  meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    4 +-
> >>  meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    6 --
> >>  11 files changed, 218 insertions(+), 32 deletions(-)
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch
> >>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch
> >> 
> >> 
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >> 
> > 
> > Merged into OE-Core
> 
> incremental build with rm_work turned on:
> 
> ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 for further information)
> ERROR: Logfile of failure stored in: /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092
> Log data follows:
> | + cd /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4.5/build.x86_64-linux.arm-angstrom-linux-gnueabi
> | + do_configure
> | + sed -i '/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*/linux*.h' -e 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
> | sed: can't read /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/gcc-4_5-branch/gcc/config/*/linux*.h: No such file or directory
> | ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r37.0+svnr175127/temp/log.do_configure.27092 for further information)
> NOTE: package gcc-cross-initial-4.5-r37.0+svnr175127: task do_configure: Failed
> ERROR: Task 764 (/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_configure) failed with exit code '1'
> 
> Can this patchset get reverted please and reapplied when it actually has been tested to work?

Testing patches is not the sole responsibility of myself and Saul. This
gcc patchset was on the mailing list for a considerable time and has
been tested in a variety of ways. Various breakage was identified found
and those breakages were fixed. The fact there looks to be some
incremental build issue with rm_work is unfortunate and likely easy to
fix so I think this request is a little out of proportion.

If someone had reported the problem before it merged it would have
waited until it was fixed before merging.

I find it ironic you're one of the people asking to turn the autobuilder
red, make warnings fatal and break things for everyone as 'its the only
way to get people to look at and fix them; but on the other hand you're
unhappy if testing of patches doesn't happen on every single combination
of usages and something does break :/.

Cheers,

Richard



