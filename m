Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA69D731F9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 19:19:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u27JJkJv021577
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Mar 2016 11:19:46 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 7 Mar 2016 11:19:45 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Mar 2016 13:19:44 -0600
Message-ID: <cover.1457378195.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/6 v5] Upgrade RPM to 5.4.16 (CVE HEAD)
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
X-List-Received-Date: Mon, 07 Mar 2016 19:19:47 -0000
Content-Type: text/plain

The new lines follow (patch 1/6).  I won't be sending a full patch in order to stop polluting mailboxes.

+SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.15-0.20140824.src.rpm;name=srpm;extract=rpm-5.4.15.tar.gz \
+          http://downloads.yoctoproject.org/releases/rpm5/rpm-5.4.15-to-5.4.16-20160225.patch.gz;name=rpm-patch \
+          http://downloads.yoctoproject.org/releases/rpm5/syck-5.4.15-to-5.4.16-20160225.patch.gz;name=syck-patch \
+          http://downloads.yoctoproject.org/releases/rpm5/beecrypt-5.4.15-to-5.4.16-20160225.patch.gz;name=beecrypt-patch \
+          http://downloads.yoctoproject.org/releases/rpm5/lua-5.4.15-to-5.4.16-20160225.patch.gz;name=lua-patch \
+          file://perfile_rpmdeps.sh \
+          file://pythondeps.sh \
+"
+
+SRC_URI[srpm.md5sum] = "d53782842ac11b3100a43fb2958c9bc0"
+SRC_URI[srpm.sha256sum] = "d4ae5e9ed5df8ab9931b660f491418d20ab5c4d72eb17ed9055b80b71ef6c4ee"
+
+SRC_URI[rpm-patch.md5sum] = "8b7deb1c9574d3d47ed8ba8c690fd8bf"
+SRC_URI[rpm-patch.sha256sum] = "1c1983d001b04eaa23eb2c8d9598b9d0899acb0a89f54a2d4c4e974086fd17a5"
+
+SRC_URI[syck-patch.md5sum] = "f31d7a32105a364688354419ec3559e4"
+SRC_URI[syck-patch.sha256sum] = "4dd1d04489206d8b5d1970f2a8d143a002f2895cefbe15d73459785096545e8a"
+
+SRC_URI[beecrypt-patch.md5sum] = "9e71ee3ccb0a52985a071dd250279132"
+SRC_URI[beecrypt-patch.sha256sum] ="df7c0708a7fab9bdf6d46194519b42e736f99cb0599dcc1c3c1bf1b228705cde"
+
+SRC_URI[lua-patch.md5sum] = "ca10d03d83b1fc1c31a0b50819534cd7"
+SRC_URI[lua-patch.sha256sum] = "6bde435cc827a7d4b2520e8f3e1c9bd2ca74375de0a4402aa99ef4d48eab9a7e"

Patch 2 - 6 remain unchanged.

v4:
* Move large patches to externally downloaded
  - Included in a commit to be testable, but that commit should not be merged
* Disable default stack-protector for popt
* Fix AddErase API breakage
* Break popt header dependency
* Allow popt to be built internal (does not yet work, note caveat in recipe)
* Update 'security_flags.inc' to know about RPM
* rpmresolve remove unnecessary -lpopt

V3:
* Update rpm-db5-or-db6.patch to remove potential host contamination
* Update rpm-disable-auto-stack-protector.patch to only disable the stack protector
* Add new patch: rpm-atomic-ops.patch
  - Disable atomic operations in bson when the architecture does not support them
* Add new patch: rpm-gnu-atomic.patch
  - Dynamically detect and disable when -fgnu-tm/libitm support is not available
* Add new patch: rpm-tagname-type.patch and rpm-python-tagname.patch
  - Fix rpm-python legacy API regressions
* Add new patch: rpm-disable-blaketest.patch
  - Disable building the blake test apps, they appear to have dep issues in large
    parallel builds.
* Update db-6.0.30 to make it clear that when it is updated, to also update RPM5.

V2:
Fixed three issues
- Added Apache 2.0 license for specific mongodb code

- Switch SSE usage dynamically in rpmio/keccak.c
  See rpm-keccak-sse-intrin.patch

- Add support for architectures that do not support sync_add_and_fetch_8
  See rpm-atomic-ops.patch

All of those changes are made in patch 1/3.

This has been built for all of the qemu* BSPs.

V1:
There is not yet an official RPM 5.4.16 release, however one will be coming
soon.  Until then, 4 distinct patches are used to upgrade RPM 5.4.15 to
5.4.16.  These patches are part of the commit (compressed w/ .xz).  However
I am not sending them as part of the email as it's not very interesting
to review base64.  :P

Many of the OE patches have been sent to the RPM 5 maintainer, and may be
part of the official 5.4.16 release.  When that release happens I expect a
simple rebase to remove the unnecessary patches.

The following changes since commit 380ee36811939d947024bf78de907e3c071b834f:

  image creation: allow overriding .rootfs suffix (2016-03-07 17:16:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib mhatle/rpm-5.4.16
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/rpm-5.4.16

Mark Hatle (6):
  rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
  security_flags.inc: Special flags are needed for RPM
  rpm: Enable specific crypto and digest settings via variables
  rpm: A number of the patches have been submitted upstream
  rpmresolve: It is not necessary to manually specify -lpopt
  db: remove the NO_UPDATE_REASON and replace it a comment about RPM

 meta/conf/distro/include/security_flags.inc        |    2 +
 meta/lib/oe/package_manager.py                     |   14 +-
 .../rpm/rpm/0001-define-EM_AARCH64.patch           |    2 +-
 ...arseArgvString-to-parse-the-_gpg_check_pa.patch |    2 +-
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |   48 +-
 ...debugedit-valid-file-to-fix-segment-fault.patch |    2 +-
 .../rpm/rpm/fstack-protector-configure-check.patch |   21 -
 .../rpm/rpm/header-include-fix.patch               |   12 +-
 .../rpm/rpm/makefile-am-exec-hook.patch            |    2 +-
 .../rpm/popt-disable-auto-stack-protector.patch    |   27 +
 .../rpm/rpm/python-rpm-rpmsense.patch              |   32 +-
 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch |   73 ++
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |   43 +-
 meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   56 +
 .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 -
 .../rpm/rpm/rpm-disable-auto-stack-protector.patch |   24 +
 .../rpm/rpm/rpm-disable-blaketest.patch            |   28 +
 .../rpm/rpm/rpm-fix-logio-cp.patch                 |    2 +-
 .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 +
 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch |   61 ++
 .../rpm/rpm/rpm-hardlink-segfault-fix.patch        |    2 +-
 .../rpm/rpm/rpm-keccak-sse-intrin.patch            |   27 +
 ...ction.c-fix-file-conflicts-for-mips64-N32.patch |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |    2 +-
 .../rpm/rpm/rpm-lsb-compatibility.patch            |    2 +-
 .../rpm/rpm/rpm-lua-fix-print.patch                |  104 --
 ...rpm-macros.in-disable-external-key-server.patch |   16 +-
 .../rpm/rpm/rpm-mongodb-sasl.patch                 |   69 ++
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |    2 +-
 ...b-before-verifyscript-to-avoid-null-point.patch |    2 +-
 .../rpm/rpm/rpm-packageorigin.patch                |    2 +-
 .../rpm/rpm/rpm-payload-use-hashed-inode.patch     |   22 +-
 .../rpm/rpm/rpm-pkgconfigdeps.patch                |   10 +-
 .../rpm/rpm/rpm-platform-file-fix.patch            |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |    4 +-
 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   16 +-
 .../rpm/rpm/rpm-python-AddErase.patch              |   35 +
 .../rpm/rpm/rpm-python-restore-origin.patch        |   49 +
 .../rpm/rpm/rpm-python-tagname.patch               |   24 +
 .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |   14 -
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |    2 +-
 .../rpm/rpm/rpm-rpmdb-grammar.patch                |  124 +++
 .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |    2 +-
 .../rpm/rpm/rpm-rpmio-headers.patch                |   19 +
 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch |   67 --
 .../recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patch |   26 +
 .../rpm/rpm/rpm-scriptletexechelper.patch          |   29 +-
 .../rpm/rpm/rpm-syck-fix-gram.patch                | 1081 ++++++++++++++++++++
 .../rpm-tag-generate-endian-conversion-fix.patch   |    2 +-
 .../rpm/rpm/rpm-tagname-type.patch                 |   25 +
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |    2 +-
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   32 +-
 .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   27 +-
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   38 +-
 ...broken-logic-for-ghost-avoidance-Mark-Hat.patch |   38 -
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  302 +++++-
 .../rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb}           |  211 +++-
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb        |    2 +-
 meta/recipes-support/db/db_6.0.30.bb               |    2 +-
 61 files changed, 2381 insertions(+), 570 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/popt-disable-auto-stack-protector.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db60.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-blaketest.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-AddErase.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-tagname.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tagname-type.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb} (78%)

-- 
2.5.0


