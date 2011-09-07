Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R1MPu-0002UR-Q8
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 20:00:07 +0200
Received: from localhost (85.231.30.150) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Wed, 7 Sep 2011
	19:54:56 +0200
Date: Wed, 7 Sep 2011 19:55:11 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110907175510.GB3215@chargestorm.se>
Mail-Followup-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
MIME-Version: 1.0
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Race condition when building external kernel modules
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
X-List-Received-Date: Wed, 07 Sep 2011 18:00:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


I've seen a race condition when building multiple external kernel
modules. 

We are running with BB_NUMBER_THREADS set to 8 or 16, depending on the
build host, thus multiple external kernel modules can be built
simultaneously.

In our layer, we have two small kernel modules, whose recipes inherits
module.bbclass. Often when doing either a clean build, or after cleaning
the two packages, we get a race issue.

At the end of the mail is a short excerpt of the bitbake output after
the failure. The exact failure differs from run to run, but generally it
is similar to this:

|   HOSTCC  scripts/mod/mk_elfconfig
| fixdep: error opening depfile: scripts/mod/.mk_elfconfig.d: No such
file or directory

i.e. something under scripts in the sysroot gets rebuild in bitbake
threads, but one will fail as the depfile has been removed. At least
that's my interpretation of the most common failure. (Previously, it has
often been the depfile scripts/basic/.fixdeps.d that has been missing).

Do there exist any framework (locks?) to disallow two different recipes
to be build simultaneously? 
Should the compile stage in the module bbclass be guarded with a
lock/mutex?

Any other ideas at how this should be attacked?

For our developers, this is mostly an annoying issue; the real issue will
start when we're setting up some autobuilders for our own distro...

Thanks in advance for all ideas/suggestions!
Regards,
Anders



---------- Failure ----------------
NOTE: Running task 714 of 726 (ID: 7,
/home/anders/oe-build/openembedded-core/../chargestorm/recipes/ccudrv/ccudrv.bb,
do_compile)
NOTE: package at91-bootcount-1.0-r3: task do_compile: Started
NOTE: package ccudrv-1.0-r4: task do_compile: Started
ERROR: Function 'do_compile' failed (see
/home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/temp/log.do_compile.6959
for further information)
ERROR: Logfile of failure stored in:
/home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/temp/log.do_compile.6959
Log data follows:
| + cd
/home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/git
| + do_compile
| + module_do_compile
| + do_make_scripts
| + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
| + oe_runmake 'CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork
-mno-thumb' 'LD=arm-oe-linux-gnueabi-ld ' 'AR=arm-oe-linux-gnueabi-ar '
-C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel
scripts
| + '[' xmake = x ']'
| + bbnote make -e MAKEFLAGS= 'CC=arm-oe-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld '
'AR=arm-oe-linux-gnueabi-ar ' -C
/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| + echo 'NOTE: make -e MAKEFLAGS= CC=arm-oe-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb LD=arm-oe-linux-gnueabi-ld
AR=arm-oe-linux-gnueabi-ar  -C
/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts'
| NOTE: make -e MAKEFLAGS= CC=arm-oe-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb LD=arm-oe-linux-gnueabi-ld
AR=arm-oe-linux-gnueabi-ar  -C
/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| + make -e MAKEFLAGS= 'CC=arm-oe-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld '
'AR=arm-oe-linux-gnueabi-ar ' -C
/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| make: Entering directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make[1]: Entering directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
|   HOSTCC  scripts/basic/fixdep
|   HOSTCC  scripts/basic/docproc
| make[1]: Leaving directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make[1]: Entering directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make[2]: Entering directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
|   CC      scripts/mod/empty.o
|   HOSTCC  scripts/mod/mk_elfconfig
|   MKELF   scripts/mod/elfconfig.h
| /bin/sh: scripts/mod/mk_elfconfig: Text file busy
| make[2]: *** [scripts/mod/elfconfig.h] Error 1
| make[2]: Leaving directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make[1]: *** [scripts/mod] Error 2
| make[1]: Leaving directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make: *** [scripts] Error 2
| make: Leaving directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see
/home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/temp/log.do_compile.6959
for further information)
NOTE: package at91-bootcount-1.0-r3: task do_compile: Failed
ERROR: Function 'do_compile' failed (see
/home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/ccudrv-1.0-r4/temp/log.do_compile.6973
for further information)
ERROR: Logfile of failure stored in:
/home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/ccudrv-1.0-r4/temp/log.do_compile.6973
Log data follows:
| + cd
/home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/ccudrv-1.0-r4/git
| + do_compile
| + module_do_compile
| + do_make_scripts
| + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
| + oe_runmake 'CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork
-mno-thumb' 'LD=arm-oe-linux-gnueabi-ld ' 'AR=arm-oe-linux-gnueabi-ar '
-C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel
scripts
| + '[' xmake = x ']'
| + bbnote make -e MAKEFLAGS= 'CC=arm-oe-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld '
'AR=arm-oe-linux-gnueabi-ar ' -C
/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| + echo 'NOTE: make -e MAKEFLAGS= CC=arm-oe-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb LD=arm-oe-linux-gnueabi-ld
AR=arm-oe-linux-gnueabi-ar  -C
/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts'
| NOTE: make -e MAKEFLAGS= CC=arm-oe-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb LD=arm-oe-linux-gnueabi-ld
AR=arm-oe-linux-gnueabi-ar  -C
/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| + make -e MAKEFLAGS= 'CC=arm-oe-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld '
'AR=arm-oe-linux-gnueabi-ar ' -C
/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| make: Entering directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make[1]: Entering directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
|   HOSTCC  scripts/basic/docproc
| make[1]: Leaving directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make[1]: Entering directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make[2]: Entering directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
|   HOSTCC  scripts/mod/mk_elfconfig
| fixdep: error opening depfile: scripts/mod/.mk_elfconfig.d: No such
file or directory
| make[2]: *** [scripts/mod/mk_elfconfig] Error 2
| make[2]: Leaving directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make[1]: *** [scripts/mod] Error 2
| make[1]: Leaving directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make: *** [scripts] Error 2
| make: Leaving directory
`/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see
/home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/ccudrv-1.0-r4/temp/log.do_compile.6973
for further information)
NOTE: package ccudrv-1.0-r4: task do_compile: Failed
ERROR: Task 19
(/home/anders/oe-build/openembedded-core/../chargestorm/recipes/at91-bootcount/at91-bootcount.bb,
do_compile) failed with exit code '1'
ERROR: Task 7
(/home/anders/oe-build/openembedded-core/../chargestorm/recipes/ccudrv/ccudrv.bb,
do_compile) failed with exit code '1'
ERROR:
'/home/anders/oe-build/openembedded-core/../chargestorm/recipes/at91-bootcount/at91-bootcount.bb'
failed
ERROR:
'/home/anders/oe-build/openembedded-core/../chargestorm/recipes/ccudrv/ccudrv.bb'
failed


-- 
Anders Darander
ChargeStorm AB


