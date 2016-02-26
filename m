Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC790772BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 03:28:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1Q3SpQR030391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 19:28:51 -0800
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 19:28:50 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Feb 2016 21:28:46 -0600
Message-ID: <cover.1456456877.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 0/3 v2] Upgrade RPM 5 to 5.4.16 (CVS HEAD)
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
X-List-Received-Date: Fri, 26 Feb 2016 03:28:51 -0000
Content-Type: text/plain

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

The following changes since commit 205b446f3fc4a9885179a66a8dab9d81bcc63dca:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib mhatle/rpm-5.4.16
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/rpm-5.4.16

Mark Hatle (3):
  rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
  rpm: Enable specific crypto and digest settings via variables
  rpm: A number of the patches have been submitted upstream

 meta/lib/oe/package_manager.py                     |   14 +-
 .../rpm/rpm/0001-define-EM_AARCH64.patch           |    2 +-
 ...arseArgvString-to-parse-the-_gpg_check_pa.patch |    2 +-
 .../rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.gz     |  Bin 0 -> 42815 bytes
 meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |   48 +-
 ...debugedit-valid-file-to-fix-segment-fault.patch |    2 +-
 .../rpm/rpm/fstack-protector-configure-check.patch |   21 -
 .../rpm/rpm/header-include-fix.patch               |   12 +-
 .../rpm/rpm/lua-5.4.15-to-5.4.16.patch.gz          |  Bin 0 -> 269940 bytes
 .../rpm/rpm/makefile-am-exec-hook.patch            |    2 +-
 .../rpm/rpm/python-rpm-rpmsense.patch              |   32 +-
 .../rpm/rpm/rpm-5.4.15-to-5.4.16.patch.gz          |  Bin 0 -> 2239384 bytes
 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch |   73 ++
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |   39 +-
 meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   56 +
 .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 -
 .../rpm/rpm/rpm-disable-auto-stack-protector.patch |   32 +
 .../rpm/rpm/rpm-fix-logio-cp.patch                 |    2 +-
 .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 +
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
 .../rpm/rpm/rpm-python-restore-origin.patch        |   49 +
 .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |   14 -
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |    2 +-
 .../rpm/rpm/rpm-rpmdb-grammar.patch                |  124 +++
 .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |    2 +-
 .../rpm/rpm/rpm-rpmio-headers.patch                |   19 +
 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch |   67 --
 .../rpm/rpm/rpm-scriptletexechelper.patch          |   29 +-
 .../rpm/rpm/rpm-syck-fix-gram.patch                | 1081 ++++++++++++++++++++
 .../rpm-tag-generate-endian-conversion-fix.patch   |    2 +-
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |    2 +-
 meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   32 +-
 .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   27 +-
 .../rpm/rpm/syck-5.4.15-to-5.4.16.patch.gz         |  Bin 0 -> 4837 bytes
 meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   38 +-
 ...broken-logic-for-ghost-avoidance-Mark-Hat.patch |   38 -
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  290 +++++-
 .../rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb}           |  185 +++-
 55 files changed, 2120 insertions(+), 565 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.gz
 delete mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/lua-5.4.15-to-5.4.16.patch.gz
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-5.4.15-to-5.4.16.patch.gz
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db60.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/syck-5.4.15-to-5.4.16.patch.gz
 delete mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb} (83%)

-- 
2.5.0


