Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id D27AD77BC5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 15:38:52 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v93Fcr9I013678
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Oct 2017 17:38:53 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v93FcrBZ022672;
	Tue, 3 Oct 2017 17:38:53 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 6ED09140B094;
	Tue,  3 Oct 2017 17:38:56 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Oct 2017 17:38:51 +0200
Message-Id: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] busybox updating
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
X-List-Received-Date: Tue, 03 Oct 2017 15:38:54 -0000

Update busybox to version 1.27.2
Fix CVE-20177-5325

Changes:
- busybox: 1.24.1 -> 1.27.2:
 - fixed link creation to shell
  - reported bug with suid shells [https://bugs.busybox.net/show_bug.cgi?id=10346]
 - removed and modified already merged patches
 - updated defconfig regarding to new version

- busybox: Fix CVE-2011-5325
 - include necessary commits from upstream and fix CVE

Andrej Valek (1):
  busybox: 1.24.1 -> 1.27.2
Radovan Scasny (1):
  busybox: Fix CVE-2011-5325

 ...ss-interface-device-name-for-ipv6-route-c.patch |  52 --
 meta/recipes-core/busybox/busybox.inc              |  16 +-
 ...e-the-behaviour-of-c-parameter-to-match-u.patch |  64 ---
 ...mproper-optimization-req.r.rtm_scope-may-.patch |  33 --
 .../0001-iproute-support-scope-.-Closes-8561.patch | 122 -----
 ...biproute-handle-table-ids-larger-than-255.patch | 134 -----
 ...-n-flushes-pattern-space-terminates-early.patch |  72 ---
 .../busybox/BUG9071_buffer_overflow_arp.patch      |  53 --
 .../busybox/busybox/CVE-2011-5325.patch            | 481 +++++++++++++++++
 .../busybox/busybox/CVE-2016-2147.patch            |  57 --
 .../busybox/busybox/CVE-2016-2147_2.patch          |  32 --
 .../busybox/busybox/CVE-2016-2148.patch            |  74 ---
 .../busybox/busybox/CVE-2016-6301.patch            |  37 --
 .../busybox-1.24.1-truncate-open-mode.patch        |  81 ---
 .../busybox/busybox-1.24.1-unzip-regression.patch  | 143 ------
 .../busybox/busybox/busybox-1.24.1-unzip.patch     | 118 -----
 .../busybox/busybox/busybox-cross-menuconfig.patch |  18 +-
 .../busybox-kbuild-race-fix-commit-d8e61bb.patch   |  53 --
 .../busybox-tar-add-IF_FEATURE_-checks.patch       |  70 ---
 .../busybox/busybox-udhcpc-no_deconfig.patch       |  68 +--
 .../commit-applet_tables-fix-commit-0dddbc1.patch  |  61 ---
 meta/recipes-core/busybox/busybox/defconfig        | 572 ++++++++++++---------
 ...lem_on_mips64_n64_big_endian_musl_systems.patch |  90 ----
 .../busybox/busybox/makefile-fix-backport.patch    |  40 --
 .../{busybox_1.24.1.bb => busybox_1.27.2.bb}       |  24 +-
 25 files changed, 866 insertions(+), 1699 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-libiproute-handle-table-ids-larger-than-255.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/BUG9071_buffer_overflow_arp.patch
 create mode 100755 meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2148.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-6301.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-truncate-open-mode.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/makefile-fix-backport.patch
 rename meta/recipes-core/busybox/{busybox_1.24.1.bb => busybox_1.27.2.bb} (57%)

-- 
2.1.4


