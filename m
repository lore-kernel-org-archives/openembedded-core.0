Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7C55B73166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 01:09:18 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id n128so21653402pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 17:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pEJvRkafcwrjWL9ogDVcZXGhfPAIJWyVB5wCIuqXdrI=;
	b=YHsZR4smIb7ZCDWgG45pL+XcmqvixULiFTPNNXe7POM1mtCn6UGJbtmguIZ4553aPr
	Cbu447RJ/Okfya7xbh6rX9dqpYURYfXA9Hpi+MeITKl2R3/0UXu/c41hhINfLWtRfe99
	EO6y4xeEvrZHry0zUKjFtT5f8DZ0SI2krgS4Hy2c+Or0Q+lacxRc10pUONRGLidYWB8R
	LeHc1UlW7yAFH9iDKGjkv+vlT9aUPDdMNXqrC9BfnheKRl0nS9axzUbK4vQC/l44WaTi
	NJxQ54V/TXFqyXDxuKrZmeXpTV7LGSxml8DTKw6tzzqHLwezHGonGseUMXJGBIAoyfxF
	n9Qw==
X-Received: by 10.98.13.204 with SMTP id 73mr1118780pfn.53.1450400958796;
	Thu, 17 Dec 2015 17:09:18 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ah10sm18207114pad.23.2015.12.17.17.09.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Dec 2015 17:09:17 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:09:00 -0800
Message-Id: <1450400944-10350-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] valgrind: update to 3.11.0 + fixes
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
X-List-Received-Date: Fri, 18 Dec 2015 01:09:18 -0000

Rebase Alexander's valgrind 3.11.0 update patch to current
oe-core master (remove redunant FILES_${PN}-dbg line) plus
fix additional issues.

Alexander Kanavin (1):
  valgrind: update to 3.11.0

Andre McCurdy (3):
  security_flags.inc: disable -fstack-protector-XXX for valgrind
  valgrind: make it explicit that valgrind supports armv7a and above
  valgrind: include aarch64 in COMPATIBLE_HOST

 meta/conf/distro/include/security_flags.inc        |   2 +-
 ...able-rt_sigpending-syscall-on-ppc64-linux.patch |  35 ---
 .../valgrind/valgrind/0002-remove-rpath.patch      |  35 +++
 .../valgrind/0004-Fix-out-of-tree-builds.patch     | 175 ++++++++++++++
 ...-vg_test-wrapper-to-support-PTEST-formats.patch | 252 +++++++++++++++++++++
 .../valgrind/valgrind/add-ptest.patch              | 243 --------------------
 .../valgrind/enable.building.on.4.x.kernel.patch   |  37 ---
 .../valgrind/valgrind/force-nostabs.patch          |  42 ----
 .../recipes-devtools/valgrind/valgrind/glibc.patch |  44 ----
 .../pass-maltivec-only-if-it-supported.patch       |  68 ------
 .../valgrind/remove-ppc-tests-failing-build.patch  |  75 ------
 .../valgrind/valgrind/sepbuildfix.patch            | 235 -------------------
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  | 104 ---------
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  | 101 +++++++++
 14 files changed, 564 insertions(+), 884 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
 create mode 100644 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb

-- 
1.9.1


