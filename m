Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R1YnP-0002r5-Bi
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 09:13:11 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Thu, 8 Sep 2011
	09:08:06 +0200
Date: Thu, 8 Sep 2011 09:08:19 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110908070819.GA3928@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20110907175510.GB3215@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20110907175510.GB3215@chargestorm.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: Race condition when building external kernel modules
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
X-List-Received-Date: Thu, 08 Sep 2011 07:13:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Anders Darander <anders@chargestorm.se> [110907 19:55]:
> I've seen a race condition when building multiple external kernel
> modules. 
> 
> We are running with BB_NUMBER_THREADS set to 8 or 16, depending on the
> build host, thus multiple external kernel modules can be built
> simultaneously.
> 
> In our layer, we have two small kernel modules, whose recipes inherits
> module.bbclass. Often when doing either a clean build, or after cleaning
> the two packages, we get a race issue.
> 
> At the end of the mail is a short excerpt of the bitbake output after
> the failure. The exact failure differs from run to run, but generally it
> is similar to this:

At the end is a new failure, one that is much more like the "standard"
failure that I see when this race occurs. In this case, only one of the
modules fails, and the other module will succeed. (In the previous mail
was an unusual case were both modules failed...).

> i.e. something under scripts in the sysroot gets rebuild in bitbake
> threads, but one will fail as the depfile has been removed. At least
> that's my interpretation of the most common failure. (Previously, it has
> often been the depfile scripts/basic/.fixdeps.d that has been missing).

This (above) is the most common failure, however like in the failure at
the end, scripts/basic/fixdep could error with a "Text file busy",
giving the same symptoms.
 
> Do there exist any framework (locks?) to disallow two different recipes
> to be build simultaneously? 
> Should the compile stage in the module bbclass be guarded with a
> lock/mutex?
> 
> Any other ideas at how this should be attacked?
> 
> For our developers, this is mostly an annoying issue; the real issue will
> start when we're setting up some autobuilders for our own distro...

Excerpt from new (more standard-like) failure:
NOTE: package at91-bootcount-1.0-r3: task do_compile: Started
NOTE: package ccudrv-1.0-r4: task do_compile: Started
ERROR: Function 'do_compile' failed (see /home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/temp/log.do_compile.20860 for further information)
ERROR: Logfile of failure stored in: /home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/temp/log.do_compile.20860
Log data follows:
| + cd /home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/git
| + do_compile
| + module_do_compile
| + do_make_scripts
| + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
| + oe_runmake 'CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld ' 'AR=arm-oe-linux-gnueabi-ar ' -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| + '[' xmake = x ']'
| + bbnote make -e MAKEFLAGS= 'CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld ' 'AR=arm-oe-linux-gnueabi-ar ' -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| + echo 'NOTE: make -e MAKEFLAGS= CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb LD=arm-oe-linux-gnueabi-ld  AR=arm-oe-linux-gnueabi-ar  -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts'
| NOTE: make -e MAKEFLAGS= CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb LD=arm-oe-linux-gnueabi-ld  AR=arm-oe-linux-gnueabi-ar  -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| + make -e MAKEFLAGS= 'CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld ' 'AR=arm-oe-linux-gnueabi-ar ' -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
| make: Entering directory `/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make[1]: Entering directory `/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
|   HOSTCC  scripts/basic/fixdep
| /bin/sh: scripts/basic/fixdep: Text file busy
| make[1]: *** [scripts/basic/fixdep] Error 1
| make[1]: Leaving directory `/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| make: *** [scripts_basic] Error 2
| make: Leaving directory `/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
| ERROR: Function 'do_compile' failed (see /home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/temp/log.do_compile.20860 for further information)
NOTE: package at91-bootcount-1.0-r3: task do_compile: Failed
ERROR: Task 19 (/home/anders/oe-build/openembedded-core/../chargestorm/recipes/at91-bootcount/at91-bootcount.bb, do_compile) failed with exit code '1'
Waiting for 1 active tasks to finish:
0: ccudrv-1.0-r4 do_compile (pid 20861)
NOTE: package ccudrv-1.0-r4: task do_compile: Succeeded
ERROR: '/home/anders/oe-build/openembedded-core/../chargestorm/recipes/at91-bootcount/at91-bootcount.bb' failed

-- 
Anders Darander
ChargeStorm AB


