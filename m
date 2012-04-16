Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJulA-0007hY-EP
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 00:51:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GMfYVk000238
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 15:41:34 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 15:40:59 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 17:45:03 -0500
Message-ID: <cover.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 00/17] Fix update-alternatives and RPM package dependencies
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
X-List-Received-Date: Mon, 16 Apr 2012 22:51:00 -0000
Content-Type: text/plain

It was recently noticed that many packages that use update-alternatives were
not setting package level provides.  So a package that required /usr/bin/env
would not be satisfied by coreutils, even though it had a /usr/bin/env
alternative.

The first patch in the series adds the enhanced alternatives capatibilities.

The patches that follow resolve Yocto defect 2289 and use these new
capabilities to ensure the produced packages are correct.

(Note, this only affects RPM packages as they have enhanced dependency
scanning and resolution compared to deb and ipk.)

These patches were tested by running a core-image-minimal build on both
qemux86 and qemumips.  I also ran a core-image-sato on qemux86 and built
each of the items affected manually.  Once build, I verified the install
time scriptlets were correct and each package provided the correct "Provides".

The following changes since commit 03cfc6ea6df9d1fbf5520c9707a725e38d2e377b:

  libzypp: add libproxy to DEPENDS (2012-04-16 23:30:41 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/upd-alt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/upd-alt

Mark Hatle (17):
  update-alternatives.bbclass: Ensure alternatives end up in per file
    deps
  coreutils_*.bb: Use update alternatives and add missing manual alt
    links
  coreutils_*.bb: Sync up file path with busybox and minor cleanup
  grep: Use update-alternatives
  openssh: Use update-alternatives
  hdparm: Use update-alternatives
  iputils: Use update-alternatives
  net-tools: Use update-alternatives
  shadow: Use update-alternatives
  findutils: Use update-alternatives
  gzip: Use update-alternatives class
  module-init-tools: Update to use update-alternatives class
  kbd: Use update-alternatives
  console-tools: Use update-alternatives
  sysvinit: Use update-alternatives in a different way
  lrzsz: sz, sx and sb were linked incorrectly
  lrzsz: Use update-alternatives to set provides

 meta/classes/package.bbclass                       |   16 +++--
 meta/classes/package_rpm.bbclass                   |    4 -
 meta/classes/update-alternatives.bbclass           |   69 +++++++++++++++++++-
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |   21 +++++-
 meta/recipes-connectivity/openssh/openssh_5.9p1.bb |    9 ++-
 .../console-tools/console-tools_0.3.2.bb           |   27 ++------
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   44 ++++++-------
 meta/recipes-core/coreutils/coreutils_8.14.bb      |   49 +++++---------
 meta/recipes-core/kbd/kbd_1.15.2.bb                |   34 ++--------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   44 ++++---------
 meta/recipes-extended/findutils/findutils.inc      |    5 +-
 .../recipes-extended/findutils/findutils_4.2.31.bb |   22 ++-----
 meta/recipes-extended/findutils/findutils_4.4.2.bb |   17 +-----
 meta/recipes-extended/grep/grep_2.5.1a.bb          |   25 +++-----
 meta/recipes-extended/grep/grep_2.9.bb             |   22 ++----
 meta/recipes-extended/gzip/gzip.inc                |   32 +++-------
 meta/recipes-extended/gzip/gzip_1.3.12.bb          |   24 ++-----
 meta/recipes-extended/gzip/gzip_1.4.bb             |    2 +-
 meta/recipes-extended/hdparm/hdparm_9.39.bb        |   16 ++---
 meta/recipes-extended/iputils/iputils_s20101006.bb |    5 +-
 .../net-tools/net-tools_1.60-23.bb                 |   28 +++------
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   42 ++++++------
 .../module-init-tools/module-init-tools_3.16.bb    |   35 ++++++----
 23 files changed, 267 insertions(+), 325 deletions(-)

-- 
1.7.3.4



