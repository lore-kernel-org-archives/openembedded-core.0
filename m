Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R67zg-0002DP-CE
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 23:36:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8KLVPwQ018512
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 14:31:25 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Sep 2011 14:31:24 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 16:33:33 -0500
Message-ID: <cover.1316553828.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/7] Fix a number of package installation related items
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
X-List-Received-Date: Tue, 20 Sep 2011 21:36:46 -0000
Content-Type: text/plain

This set of patches fixes a number of items related to regular and multilib
package installs.

The first two commits are from Dongxiao Xu's series.  I believe this is the
latest version of each.  These commits are required to use the
MULTILIB_IMAGE_INSTALL option, as well as avoid conflicts when building
some types of packages (machine specific packages).  These can be left out
if they're deemed not ready yet.

The next 4 patches are required to fix the basic problems with rpm
installation.  Due to a typo, the provides were not being set properly causing
various invalid rootfs's to be created.  Fixing this typo showed a small
number of additional runtime dependencies were not being accounted for:
* "rpmdeps" checks for GNU_HASH, and adds a requirement.  For compatibility
  we now set rtld(GNU_HASH) as being provided by eglibc.

* the python specific requirements were versioned, however there is no easy
  way to satisfy the versioning within the OE-Core environment today.  This
  was modified to instead simply require "python", which the python-core
  package satisfies... a small change to packages.bbclass was required to
  invalidate the sstate-cache as well.

* Enhance busybox to specific list a per-file runtime dependency for each
  link that /bin/busybox is capable of satisfying.  This per-file dep is
  available for all packaging backends, but only affects RPM at this time.

Finally the last patch fixes a problem in the multilib_global.bbclass which
causes incorrect provide and rprovides to be placed into packages when
multilib builds are enabled.

---

All of the above has been tested with

MACHINE = "qemux86_64"
MULTILIB_IMAGE_INSTALL = "lib32-connman-gnome lib32-task-base-3g lib32-task-base-wifi lib32-task-base-bluetooth"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
MACHINE_virtclass-multilib-lib32 = "qemux86"

I have build core-image-minimal, core-image-core and core-image-sato.  Each
image was built with and without the MULTILIB_IMAGE_INSTALL being enabled.


The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:

  freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/rpm.deps
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm.deps

Dongxiao Xu (2):
  rootfs_rpm: Use specific MACHINE_ARCH for multilib recipes
  multilib: install MULTILIB_IMAGE_INSTALL

Mark Hatle (5):
  Fix RPM dependencies
  Add a run-time dependency that eglibc support GNU_HASH
  Update python dependencies to be simply to "python"
  busybox: Enhance to add dynamic per-file provides
  multilib_global.bbclass: Fix non-multilib package provides

 meta/classes/multilib_global.bbclass        |   30 +++++++++++++++---
 meta/classes/package.bbclass                |    6 ++++
 meta/classes/package_rpm.bbclass            |   44 +++++++++++++++++---------
 meta/classes/rootfs_rpm.bbclass             |    7 ++++
 meta/recipes-core/busybox/busybox.inc       |   32 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.18.5.bb |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc |    3 +-
 meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 meta/recipes-devtools/rpm/rpm/pythondeps.sh |   16 ++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb      |    4 ++-
 11 files changed, 123 insertions(+), 25 deletions(-)
 create mode 100755 meta/recipes-devtools/rpm/rpm/pythondeps.sh

-- 
1.7.3.4



