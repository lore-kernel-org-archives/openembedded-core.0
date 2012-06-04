Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SbbXC-0004t5-LN
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 19:57:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q54HlGVY012170
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jun 2012 10:47:16 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 4 Jun 2012 10:47:15 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2012 12:52:50 -0500
Message-ID: <cover.1338832214.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/6 v4] Uprev RPM to 5.4.9
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
X-List-Received-Date: Mon, 04 Jun 2012 17:57:43 -0000
Content-Type: text/plain

Only 6/6 is new in this version.  RPM 5.4.9 appears to be more demanding
for both the DB_CONFIG file and empty manifest files.  The new patch resolves
this issue by ensuring that the DB_CONFIG is always generated, and empty
manifest files do not get installed.

Patches 1-5 are identical to the v3 versions.

v3 messages follows:

Rebase of the v2 changes.

Re-disabled the "test" chunk..  this should resolve the hang problem a 
few people have observed.

v2 message follows:

Berkley DB also gets upreved, and a new package ossp-uuid gets added to
the system.

This was -heavily- tested with and without zypper on IA, and PPC.

In addition a minor performance enhancement with a query operation was added.

The uprev also adds the capability of using PACKAGECONFIG settings to tailor
the behavior of RPM.

V2 changes:

Fix a problem with libuuid.so from util-linux would sometimes be linked into
the binary.

Also force libzypp, sat-solver and zypper to refresh via a PR bump.


*** BLURB HERE ***
The following changes since commit e3113827810e98eb1b012f0b280fb917199704c1:

  webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:37:58 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/rpm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm

Mark Hatle (6):
  rpm: Upgrade RPM to 5.4.8  (db to 5.3.15)
  rpm: Upgrade RPM to 5.4.9
  ossp-uuid: Add oss-uuid package and RPM 5.4.9 integration
  package_rpm: Add capability to directly query packageorigin
  rpm: Bump PR numbers on componets that require RPM
  rootfs_rpm.bbclass: Update database configuration and initial install

 meta/classes/package_rpm.bbclass                   |   85 +++-
 meta/classes/rootfs_rpm.bbclass                    |   29 --
 .../ossp-uuid/0001-Change-library-name.patch       |  112 +++++
 ...erve-m-option-status-in-v-option-handling.patch |   55 +++
 .../ossp-uuid/0003-Fix-whatis-entries.patch        |   51 +++
 .../ossp-uuid/0004-fix-data-uuid-from-string.patch |   36 ++
 .../ossp-uuid/ossp-uuid/uuid-libtool.patch         |   24 +
 .../ossp-uuid/ossp-uuid/uuid-nostrip.patch         |   16 +
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |   58 +++
 .../rpm/rpm/fix_for_automake_1.11.2.patch          |   54 ---
 .../rpm/rpm/fprint-pointer-fix.patch               |   35 --
 .../rpm/rpm/remove-compiled-tests.patch            |  443 --------------------
 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch   |   22 -
 meta/recipes-devtools/rpm/rpm/rpm-autogen.patch    |   41 +--
 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch  |   16 +-
 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |   12 +-
 meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |   29 ++
 .../rpm/rpm/rpm-no-perl-urpm.patch                 |   43 ++
 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch    |   36 --
 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch  |   20 +
 .../rpm/rpm/rpm-packageorigin.patch                |   23 +
 .../rpm/rpm/rpm-scriptletexechelper.patch          |   33 +-
 meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch |   26 +-
 .../rpm/{rpm_5.4.0.bb => rpm_5.4.9.bb}             |  158 ++++----
 .../libzypp/libzypp/libzypp-rpm549.patch           |   28 ++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    3 +-
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    2 +-
 meta/recipes-extended/zypper/zypper_git.bb         |    2 +-
 .../db/{db_5.1.19.bb => db_5.3.15.bb}              |    8 +-
 29 files changed, 692 insertions(+), 808 deletions(-)
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
 delete mode 100644 meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/fprint-pointer-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/remove-compiled-tests.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-no-perl-urpm.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-packageorigin.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.0.bb => rpm_5.4.9.bb} (76%)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
 rename meta/recipes-support/db/{db_5.1.19.bb => db_5.3.15.bb} (93%)

-- 
1.7.3.4



