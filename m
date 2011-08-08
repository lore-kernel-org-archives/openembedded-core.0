Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QqOCj-0002RW-W8
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 13:41:10 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Mon, 8 Aug 2011
	13:36:42 +0200
Date: Mon, 8 Aug 2011 13:36:50 +0200
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110808113650.GA20162@chargestorm.se>
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
Subject: Unrecognized option while building pseudo (target)
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
X-List-Received-Date: Mon, 08 Aug 2011 11:41:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline


Hi,

After updating my work-in-progress to upgrade our internal distro from
oe-dev to oe-core, I got a new problem... (At least new to me, as far as
I remember I didn't have that problem before the vacation. Otoh, my old
build-box is temporarily out of service HW-problems, so this is a new
build environment).

The problem is that my cross-compiler, arm-oe-linux-gnueabi-gcc, do not
recognize the -m32 option, that the pseudo makefile tries to supply.

Short excerpt of the build log, just to show the call to gcc and its
error message:
| arm-oe-linux-gnueabi-gcc  -march=armv5te  -mno-thumb -mthumb-interwork
-mtune=arm926ej-s
--sysroot=/home/anders/oe-build-core/build-ccu/tmp-eglibc/sysroots/ccu
-O2 -pipe -g -feliminate-unused-debug-types -pipe -std=gnu99 -Wall -W
-Wextra -fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE -m32
-DPSEUDO_PREFIX='"/usr"' -DPSEUDO_SUFFIX='""' -DPSEUDO_BINDIR='"bin"'
-DPSEUDO_LIBDIR='"lib/pseudo/lib"' -DPSEUDO_LOCALSTATEDIR='"var/pseudo"'
-DPSEUDO_VERSION='"1.1.1"' -O2 -g
-L/home/anders/oe-build-core/build-ccu/tmp-eglibc/sysroots/ccu/usr/lib
-I/home/anders/oe-build-core/build-ccu/tmp-eglibc/sysroots/ccu/usr/include
-Wl,-R/home/anders/oe-build-core/build-ccu/tmp-eglibc/sysroots/ccu/usr/lib
-c -o pseudo_tables.o pseudo_tables.c
| cc1: error: unrecognized command line option '-m32'cc1: error:
unrecognized command line option '-m32'cc1: error: unrecognized command
line option '-m32'cc1: error: unrecognized command line option '-m32'

By commenting out the setting of 'CFLAGS_CODE += -m$(BITS)' in
Makefile.in, I can get the build to continue past pseudo.

Any ideas of how I should correctly fix this? Or if I have some other
problem in my environment that could cause such a failure....

Cheers,
Anders 

-- 
Anders Darander
ChargeStorm AB / EStorm AB


