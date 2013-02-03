Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U29f1-0002av-27
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 01:11:47 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14012G4020441; Mon, 4 Feb 2013 00:01:02 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M-QqTzqTWw0r; Mon,  4 Feb 2013 00:01:02 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1400vvS020438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 4 Feb 2013 00:00:58 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U29PV-0000W2-Kg; Sun, 03 Feb 2013 23:55:45 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 23:55:43 +0000
Message-Id: <cover.1359935562.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/22] Packaging performance improvements, round 2
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
X-List-Received-Date: Mon, 04 Feb 2013 00:11:47 -0000

The following patch series contains various performance improvements for 
do_package.

It also includes changes to the sanity testing to start giving warnings 
about packaging variables used without packages being specified, eg:

RDEPENDS = "x"

instead of

RDEPENDS_${PN} = "x"

The final patch in the series stops the packaging code using the non-package
versions in many cases. I'm not planning to merge that one right away, its just
included for illustration and benchmarking purposes now. 

There were three cases I found using bad syntax in OE-Core and the series includes 
patches to fix them.

There is also a useful performance improvement to sstate manipulations to use
hardlinks instead of file copies which should be universally helpful to
build performance of tasks.

The following changes are available in the git repository at:

  git://git.openembedded.org/openembedded-core master-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core/log/?h=master-next

Richard Purdie (22):
  package.bbclass: Multithread per file dependency generation code
  package: Don't export PATH
  package: Process package stripping in parallel
  insane.bbclass: Add pkgvarcheck to check for suboptimal usages of
    variables
  insane.bbclass: Add documentation headers for logical code blocks
  staging/insane.bbclass: Move legacy do_stage check iinto
    insane.bbclass
  staging.bbclass: Drop unused/legacy function
  update-rc.d: Drop OVERRIDES code
  qemu: Set RDEPENDS on the specific package that needs it
  gdb-cross-canadian: Set RDEPENDS on the specific package that needs
    it
  initramfs-live-boot: Set RDEPENDS on the specific package that needs
    it
  package.bbclass: Fix up bb.mkdirhier/bb.copyfile usage
  package.bbclass: Rewrite split_and_strip_files
  kernel.bbclass: Improve populate_packages_prepend
  package.bbclass: Make use of cleandirs and dirs function flags
  package.bbclass: Various minor performance tweaks
  package.bbclass: Simplify empty directory removal
  package.bbclass: Add PACKAGESPLITFUNCS variable
  sstate/path.py: Add copyhardlinktree() function and use for
    performance optimisation
  package.bbclass: Better document the different phases of operation
  package.bbclass: Pre-expand some variables to save time
  classes: Drop none package specific packaging variable accesses

 meta/classes/base.bbclass                          |    2 +-
 meta/classes/gconf.bbclass                         |    9 +-
 meta/classes/gtk-icon-cache.bbclass                |    4 +-
 meta/classes/gtk-immodules-cache.bbclass           |    4 +-
 meta/classes/insane.bbclass                        |   30 +-
 meta/classes/kernel.bbclass                        |   52 +--
 meta/classes/mime.bbclass                          |    8 +-
 meta/classes/package.bbclass                       |  460 +++++++++-----------
 meta/classes/sstate.bbclass                        |    4 +-
 meta/classes/staging.bbclass                       |    9 -
 meta/classes/update-alternatives.bbclass           |   10 +-
 meta/classes/update-rc.d_real.bbclass              |   21 +-
 meta/lib/oe/package.py                             |   96 ++++
 meta/lib/oe/path.py                                |    4 +
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    4 +-
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 17 files changed, 390 insertions(+), 331 deletions(-)
 create mode 100644 meta/lib/oe/package.py

-- 
1.7.10.4



