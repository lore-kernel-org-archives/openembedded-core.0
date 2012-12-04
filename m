Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw4o-0008G4-7Q
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H09fi008183
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:09 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:09 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:32 -0600
Message-ID: <cover.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 00/22] Misc fixes
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
X-List-Received-Date: Tue, 04 Dec 2012 17:14:34 -0000
Content-Type: text/plain

While working on the Smart integration PaulE and I fixed a number of 
small defect that we found.  Some of the RPM package defects were not 
visible with the previous integration (it had silently worked around 
them), while other issues are small and nobody seems to have noticed 
them before.

The following changes since commit 24b954253dd1aa626835352c4dc8d085a19aae35:

  xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions (2012-12-03 16:38:28 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/misc
  http://git.yoctoproject.org/cgit.cgi//log/?h=mhatle/misc

Mark Hatle (13):
  cpio: Split RMT from cpio
  tar: Split RMT from tar
  update-alternatives.bbclass: Add missing runtime dependency
  package_rpm.bbclass: Add the runtime dependencies to the pre/post
    scriptlets
  rpm: Move rpmdb_loadcvt from base to dev package
  rpm: Fix rpm relocation macro usage
  rpm: Fixup platform matching code
  rpm: Fix Upstream-Status fields
  python-smartpm: Fix incorrect comparison arguments
  package_deb: Dependencies with a ( or ) in them are invalid in debs
  pkgconfig: Add a manual dependency of pkgconfig(pkg-config)
  pseudo: Rework target, native and nativesdk pseudo intergration
  license.bbclass: Avoid grep error message

Paul Eggleton (9):
  rpm: enable _openall_before_chroot by default
  createrepo: implement support for recommends
  python-smartpm: add support for recommends
  python-smartpm: style fixes
  python-smartpm: fix package metadata not being read from rpm-md feeds
  python-smartpm: don't create /var/tmp on every rpm database open
  python-smartpm: support nolinktos and noparentdirs rpm options
  python-smartpm: allow setting arbitrary macros in smart config
  shadow: add runtime dependency on base-passwd

 meta/classes/license.bbclass                       |    3 +-
 meta/classes/package_deb.bbclass                   |   10 +
 meta/classes/package_rpm.bbclass                   |   86 +-
 meta/classes/update-alternatives.bbclass           |    6 +
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |    5 +
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb  |    2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |    1 +
 meta/recipes-devtools/pseudo/pseudo.inc            |   58 +-
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb       |    2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    2 +-
 .../python/python-smartpm/smart-dflags.patch       |   40 +
 .../python-smartpm/smart-metadata-match.patch      |   28 +
 .../python/python-smartpm/smart-missingok.patch    |   43 -
 .../python/python-smartpm/smart-recommends.patch   | 1362 ++++++++++++++++++++
 .../python-smartpm/smart-rpm-extra-macros.patch    |   27 +
 .../python/python-smartpm/smart-rpm-md-parse.patch |   26 +
 .../python/python-smartpm/smart-tmpdir.patch       |   30 +
 .../python/python-smartpm_1.4.1.bb                 |   57 +-
 .../rpm/rpm/python-rpm-rpmsense.patch              |    2 +-
 .../rpm/rpm/rpm-db_buffer_small.patch              |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |   56 +
 .../rpm/rpm/rpm-reloc-macros.patch                 |   31 +
 .../rpm/rpm/rpm-stub-out-git_strerror.patch        |    2 +-
 .../rpm/rpm/rpm-uuid-include.patch                 |    2 +
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   11 +-
 meta/recipes-extended/cpio/cpio_2.11.bb            |    2 +-
 meta/recipes-extended/cpio/cpio_2.8.bb             |    2 +-
 meta/recipes-extended/cpio/cpio_v2.inc             |   11 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 +-
 meta/recipes-extended/tar/tar.inc                  |   11 +-
 meta/recipes-extended/tar/tar_1.17.bb              |    2 +-
 meta/recipes-extended/tar/tar_1.26.bb              |    2 +-
 .../createrepo/createrepo/recommends.patch         |   71 +
 .../createrepo/createrepo_0.4.11.bb                |    3 +-
 34 files changed, 1852 insertions(+), 151 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-missingok.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-recommends.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
 create mode 100644 meta/recipes-support/createrepo/createrepo/recommends.patch

-- 
1.7.3.4



