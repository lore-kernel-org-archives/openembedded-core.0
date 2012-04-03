Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SF9q3-0001lx-5N
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 21:56:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q33JlCIq029697
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 12:47:12 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 3 Apr 2012 12:47:12 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Apr 2012 14:47:00 -0500
Message-ID: <cover.1333481624.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 0/7] Cleanup and document tuning files
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
X-List-Received-Date: Tue, 03 Apr 2012 19:56:23 -0000
Content-Type: text/plain

This is a documentation and cleanup of the tuning files.  Every tuning listed
in AVAILTUNES was built for core-image-minimal!  The following is a list of
failure conditions with explanations:

ep9312 - binutils - gas fails to recognize -march=ep9312 as valid
         (see binutils armv5e note below)

cortexm3 - gcc reports the target CPU does not support ARM mode
cortexr4 - gcc reports the target CPU does not support ARM mode

mips64* - These are not yet supported by the OE compilers

(SH is new and experimental, based on the existing tunings)
sh3* - These are missing a patch in the compiler: 
       sh3-installfix-fixheaders.patch

sh*eb - Big endian varieties are defined, but not supported

x32 ABI variants for core2-64 and x86-64 - needs x32 layer


Multilibs verified to work:

x86-64 & x86

ppce5500 & ppc64e5500

---

Note armv5e & binutils-gas:

Finally there is a small patch to binutils gas that adds armv5e as a valid
architecture, otherwise all of the armv5e* tunings fail, even though gcc
says they are valid architectures.

---

Future work:

I'm still not completely happy with the ARM tunings, but it's too disruptive
to change them at this time.  I'd like to move to something closer to how
MIPS is configured.  Define various "variants" for the various tunings,
instead of simply defining the ARMPKGARCH.  The current method prevents us
from having a single build that can build packages optimized for armv5te and
armv7a.  While this is not likely to be a huge problem for the time being,
it may lead to problems for feed based systems that can support multiple
ARM architecture families.

The following changes since commit 38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458:

  gdb: build with expat, add missing RRECOMMENDS_gdbserver (2012-04-03 14:10:44 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/tunings
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/tunings

Mark Hatle (7):
  conf/machine/include/README: Add readme to explain cpu tunings
  conf/machine/include: Cleanup IA tunings to match README
  conf/machine/include: Cleanup MIPS tunings to match README
  conf/machine/include: Cleanup PowerPC tunings to match README
  conf/machine/include: Cleanup ARM tunings to match README
  conf/machine/include: Update SH tunings to match README
  binutils: Inform binutils that armv5e really is valid!

 meta/conf/bitbake.conf                             |    1 -
 meta/conf/machine/include/README                   |   77 ++++++++++++++++++++
 meta/conf/machine/include/arm/README               |   40 ++++++++++
 meta/conf/machine/include/arm/arch-arm.inc         |    2 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |    2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |    6 +-
 meta/conf/machine/include/ia32/README              |   24 ++++++
 meta/conf/machine/include/ia32/arch-ia32.inc       |   26 ++++---
 meta/conf/machine/include/mips/README              |   36 +++++++++
 meta/conf/machine/include/mips/arch-mips.inc       |   38 +++++++++-
 meta/conf/machine/include/powerpc/README           |   17 +++++
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   15 ++--
 .../machine/include/powerpc/arch-powerpc64.inc     |    1 +
 meta/conf/machine/include/sh/README                |   11 +++
 meta/conf/machine/include/sh/arch-sh.inc           |    9 +++
 meta/conf/machine/include/tune-c3.inc              |   12 +++-
 meta/conf/machine/include/tune-core2.inc           |   16 +++--
 meta/conf/machine/include/tune-cortexm3.inc        |    2 +-
 meta/conf/machine/include/tune-cortexr4.inc        |    2 +-
 meta/conf/machine/include/tune-i586.inc            |    8 +--
 meta/conf/machine/include/tune-mips32.inc          |   17 +++--
 meta/conf/machine/include/tune-ppc603e.inc         |    4 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce500.inc         |   10 ++-
 meta/conf/machine/include/tune-ppce500mc.inc       |    4 +-
 meta/conf/machine/include/tune-ppce500v2.inc       |   10 ++-
 meta/conf/machine/include/tune-ppce5500.inc        |    4 +-
 meta/conf/machine/include/tune-sh3.inc             |   19 ++++-
 meta/conf/machine/include/tune-sh4.inc             |   32 ++++++++-
 .../binutils/binutils/binutils-armv5e.patch        |   20 +++++
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    3 +-
 31 files changed, 401 insertions(+), 69 deletions(-)
 create mode 100644 meta/conf/machine/include/README
 create mode 100644 meta/conf/machine/include/arm/README
 create mode 100644 meta/conf/machine/include/ia32/README
 create mode 100644 meta/conf/machine/include/mips/README
 create mode 100644 meta/conf/machine/include/powerpc/README
 create mode 100644 meta/conf/machine/include/sh/README
 create mode 100644 meta/conf/machine/include/sh/arch-sh.inc
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils-armv5e.patch



