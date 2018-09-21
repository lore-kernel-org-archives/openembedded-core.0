Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Sep 2018 08:25:54 UTC
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 39EEA745ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 08:25:53 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id 3GdpgVERTCnte3GdqgHHyp; Fri, 21 Sep 2018 09:18:23 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=BqyzP7f5 c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=JBFolyDoGHsA:10 a=BpssFTErace8bW3yfQ4A:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>) id 1g3Gdp-00034m-Jx
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2018 09:18:21 +0100
Date: Fri, 21 Sep 2018 09:18:21 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180921081821.ctf3gllqoncmrb7i@mcrowe.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfAOT7/LCRlcpvfXRvWlIIcD5RVYt6d8qgf6tnqzOx1zwA6dKVGGjzEem/XBKXc/bmT0QUS3ahMt5E/KpeSbYL/9dD6eWDSrKU1LORcfhWDUDoE99oX4G
	KNWlT00LOx3NA4SKlACs9P6SwijXGPmJzKYEOEjjMcrodfGQDR+406Kq
Subject: Why does gcc-cross-canadian pass --with-mpfr= and --with-mpc= ?
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
X-List-Received-Date: Fri, 21 Sep 2018 08:25:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

gcc-cross-canadian.inc contains:

 EXTRA_OECONF += "\
     --with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
     --with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix} \
 "

This appears to be the only mention of ${layout_exec_prefix} in the whole
tree, so this ends up just passing ${STAGING_DIR_HOST}. These lines result
in configure passing -I${STAGING_DIR_HOST}/include twice to the compiler
when it's doing its test builds. This is mostly pointless since that
directory doesn't exist with the default oe-core configuration - the
correct path would be -I${STAGING_DIR_HOST}/usr/include - but even that
ought to be unnecessary (more on that later.)

Similarly, gcc-cross.inc contains:

 EXTRA_OECONF += "\
     --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
     --with-system-zlib \
 "

At least this time it's using ${prefix_native} so the compiler ends up
being passed -I${STAGING_DIR_HOST}/usr/include , but I still don't see why
it's necessary when this is the default header location for the sysroot
too.

I've gone back through the history, and it seems that these lines (or
similar ones) were originally added way back in
8800d8be25295dd7c7d84dde62c3be4df8e43346 for GCC 4.1.1 in 2006!

If I stop gcc-cross-canadian.inc and gcc-cross.inc passing both --with-mpfr
and --with-mpc, then core-image-minimal and meta-toolchain still build
successfully for me.


I noticed this on an older oe-core version with GCC 6.3 building for ARM,
because when using meta-micro gcc-cross-canadian _does_ end up passing a
correct path (since meta-micro removes the the /usr prefix.) This confuses
the nativesdk compiler into thinking that headers like <stdio.h> aren't
system headers during configure. This in turn results in errors that
wouldn't normally be reported (such as differing signatures for vasprintf
between stdio.h and system.h) to be fatal so configure gets very confused.

With the current state of master and without meta-micro, if I alter
gcc-cross-canadian to contain:

 EXTRA_OECONF += "\
     --with-mpfr=${STAGING_DIR_HOST}/usr \
     --with-mpc=${STAGING_DIR_HOST}/usr \
 "

then configure fails as soon as it tries to pass the derived include path
to the compiler:

 x86_64-oesdk-linux-gcc  --sysroot=/overflow/mac/nobackup/openembedded-core/build/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/gcc-cross-canadian-i586/8.2.0-r0/recipe-sysroot -c  -O2 -pipe -I/overflow/mac/nobackup/openembedded-core/build/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/gcc-cross-canadian-i586/8.2.0-r0/recipe-sysroot/usr/include -I/overflow/mac/nobackup/openembedded-core/build/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/gcc-cross-canadian-i586/8.2.0-r0/recipe-sysroot/usr/include   conftest.c >&5
 In file included from /overflow/mac/nobackup/openembedded-core/build/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/gcc-cross-canadian-i586/8.2.0-r0/recipe-sysroot/usr/include/sys/cdefs.h:443,
                  from /overflow/mac/nobackup/openembedded-core/build/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/gcc-cross-canadian-i586/8.2.0-r0/recipe-sysroot/usr/include/features.h:428,
                  from /overflow/mac/nobackup/openembedded-core/build/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/gcc-cross-canadian-i586/8.2.0-r0/recipe-sysroot/usr/include/bits/libc-header-start.h:33,
                  from /overflow/mac/nobackup/openembedded-core/build/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/gcc-cross-canadian-i586/8.2.0-r0/recipe-sysroot/usr/include/limits.h:26,
                  from /overflow/mac/nobackup/openembedded-core/build/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/gcc-cross-canadian-i586/8.2.0-r0/recipe-sysroot/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/include/gmp.h:56,
                  from conftest.c:10:/overflow/mac/nobackup/openembedded-core/build/tmp-glibc/work/x86_64-nativesdk-oesdk-linux/gcc-cross-canadian-i586/8.2.0-r0/recipe-sysroot/usr/include/bits/long-double.h:59:10: fatal error: bits/long-double-64.h: No such file or directory
 #include <bits/long-double-64.h>

(This isn't the symptom I saw with GCC 6.3 with ARM. In this case it looks
like recipe-sysroot is a 32-bit sysroot, but we're trying to use it with a
64-bit compiler, but I don't pretend to know how gcc-cross-canadian is
supposed to work.)


So, I conclude that passing --with-mpfr= and --with-mpc= in gcc-cross.inc
and gcc-cross-canadian.inc has no useful effect, and is only not causing
visible problems by luck.

Does anyone disagree? If not, I shall propose a patch to stop passing these
options from gcc-cross.inc and gcc-cross-canadian.inc.

Thanks.

Mike.

