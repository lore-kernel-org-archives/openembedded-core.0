Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0BB56AC68
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 20:01:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s61K1EBh017975
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Jul 2014 13:01:14 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 1 Jul 2014 13:01:14 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Jul 2014 15:01:07 -0500
Message-ID: <cover.1404244287.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 0/6] RPM, BerkleyDB and related changes
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
X-List-Received-Date: Tue, 01 Jul 2014 20:01:23 -0000
Content-Type: text/plain

This set make a group of changes that affect RPM, BerkleyDB and other 
related systems.

The changes were tested using buildhistory.  It was verified that only
expected changes (the version string) occured in both the BerkleyDB and
RPM uprevs.  The dependencies are the same, or similar [within expecations].

Buildhistory testing consisted of build w/ origin/master.  Build with
patch 1/6, build with patch 5/6, and build with patch 6/6 (with the
PREFERRED_VERSION enabled.)

1/6 - Fixes a rare issue when the arch translation fails (multilib case)
2/6 - Uprev BerkelyDB to 6.0.30 -- note it also adds a comment explaining the
       thumb patch.  The comment comes from the original OE commit message
       from 2005.  Note new BerkleyDB is now under the AGPL-3.0 license!
3/6 - Upgrade RPM to 5.4.14 release.  Change yacc from bison to byacc.
4/6 - Change a backported patch to the upstream version.
5/6 - Fix an issue where TARGET_VENDOR and _OS were used, when it should
      have been HOST.  This was breaking non-linux SDKs.
6/6 - [optional] This adds a development RPM 5 based on the CVS rpm-5_4
      branch.  This recipe is being provided to help in future development.

If 6/6 is not acceptable that it can be ignored.

The following changes since commit c36d459f0d40bdbd3ba809835e0475e8992bc778:

  python3: fix builtins imports (2014-06-30 16:35:03 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/rpm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm

Mark Hatle (6):
  lib/oe/package_manager.py: Fix _pkg_translate_smart_to_oe function
  db: Uprev to 6.0.30
  rpm: Upgrade to 5.4.14
  rpm: Replace patch with backport from SCM version of RPM5
  package_rpm.bbclass: Should be using HOST_* not TARGET_*
  rpm_5.4+cvs: Add RPM community tree for future development

 meta/classes/package_rpm.bbclass                   |   4 +-
 meta/lib/oe/package_manager.py                     |   1 +
 meta/recipes-devtools/rpm/rpm/dbconvert.patch      |  24 +-
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |  19 +-
 ...debugedit-valid-file-to-fix-segment-fault.patch |  14 +-
 .../rpm/rpm/fstack-protector-configure-check.patch |   8 +-
 .../rpm/rpm/header-include-fix.patch               |  16 +-
 .../rpm/rpm/makefile-am-exec-hook.patch            |   8 +-
 .../rpm/rpm/python-rpm-rpmsense.patch              |   6 +-
 meta/recipes-devtools/rpm/rpm/rpm-autogen.patch    |   8 +-
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |  14 +-
 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch  |   6 +-
 .../rpm/rpm/rpm-db_buffer_small.patch              |  18 +-
 .../rpm/rpm/rpm-debug-platform.patch               |  14 +-
 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch  |  12 +-
 .../rpm/rpm/rpm-hardlink-segfault-fix.patch        |  10 +-
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |  12 +-
 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |  10 +-
 .../rpm/rpm/rpm-lsb-compatibility.patch            |   8 +-
 meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |  18 +-
 meta/recipes-devtools/rpm/rpm/rpm-macros.patch     |  19 +-
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |   9 +-
 .../rpm/rpm/rpm-no-perl-urpm.patch                 |   8 +-
 meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch  |   9 +-
 .../rpm/rpm/rpm-packageorigin.patch                |   8 +-
 .../rpm/rpm/rpm-payload-use-hashed-inode.patch     |  30 +-
 .../rpm/rpm/rpm-pkgconfigdeps.patch                |  11 +-
 .../rpm/rpm/rpm-platform-file-fix.patch            |  12 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |  39 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |  22 +-
 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   8 +-
 .../rpm/rpm/rpm-reloc-macros.patch                 |   6 +-
 .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |   8 +-
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |  10 +-
 .../rpm/rpm/rpm-respect-arch.patch                 |  67 ---
 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch |  67 +++
 .../rpm/rpm/rpm-scriptletexechelper.patch          |  20 +-
 meta/recipes-devtools/rpm/rpm/rpm-showrc.patch     |   9 +-
 meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch    |  31 --
 .../rpm/rpm/rpm-stub-out-git_strerror.patch        |  60 ---
 .../rpm-tag-generate-endian-conversion-fix.patch   |   7 +-
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |  10 +-
 .../rpm/rpm/rpm-uuid-include.patch                 |  15 +-
 .../rpm/rpm/rpm-verify-files.patch                 |  22 -
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |  26 +-
 meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch |  14 +-
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |  36 +-
 ...broken-logic-for-ghost-avoidance-Mark-Hat.patch |  38 ++
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           | 527 +++++++++++++++++++++
 .../rpm/{rpm_5.4.9.bb => rpm_5.4.14.bb}            |  21 +-
 .../db/db/arm-thumb-mutex_db5.patch                |  10 +
 .../db/{db_5.3.21.bb => db_6.0.30.bb}              |  33 +-
 52 files changed, 962 insertions(+), 480 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-respect-arch.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
 rename meta/recipes-devtools/rpm/{rpm_5.4.9.bb => rpm_5.4.14.bb} (97%)
 rename meta/recipes-support/db/{db_5.3.21.bb => db_6.0.30.bb} (77%)

-- 
1.9.3


