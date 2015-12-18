Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA4D6E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 01:35:32 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id to4so25970759igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 17:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SN2ZVbVrMQdNTmCY3SUJESkBm7VF7zSScaWYzjNqVek=;
	b=MWl66oV4G18m8sHDiHcAfTRldLhvjRSP/dVgZeMHPdA8elyiInzNNXOzpa+xbwSKLz
	M4z5yZsDNQbbPV9mWZGHKf8ErXmvW4wY+SzfHAI0xYC8aJwmU2RVsMtKzOkkd2rcOePd
	O+zCiE6oDtQ+yv4kGMpTtuRkRcLooo45wIT5NZwBLj5oX8cuTu0zLz6Kq7dlaU4BHFtQ
	fj/4RkQKz0dsBjYW98whQJ1529ZiTpv8jTljW1Z2+2xUn2jdJ+HnWrV215maSMOAxCeu
	HzSrtWKwg+J4V7hXL7xooj/7lqS1lIXOrn6LWHRrO06ORF2GkctBhZ07iNPjX11ROtP+
	riNQ==
X-Received: by 10.50.171.197 with SMTP id aw5mr637734igc.21.1450402532988;
	Thu, 17 Dec 2015 17:35:32 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id w8sm1745659igl.0.2015.12.17.17.35.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Dec 2015 17:35:32 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:35:21 -0800
Message-Id: <1450402525-11430-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4 v2] valgrind: update to 3.11.0 + fixes
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
X-List-Received-Date: Fri, 18 Dec 2015 01:35:34 -0000

Rebase Alexander's valgrind 3.11.0 update patch to current
oe-core master (remove redunant FILES_${PN}-dbg line) plus
fix additional issues.

This time based on v2 of Alexander's 3.11.0 update patch...

Alexander Kanavin (1):
  valgrind: update to 3.11.0

Andre McCurdy (3):
  security_flags.inc: disable -fstack-protector-XXX for valgrind
  valgrind: make it explicit that valgrind supports armv7a and above
  valgrind: include aarch64 in COMPATIBLE_HOST

 meta/conf/distro/include/security_flags.inc        |   2 +-
 ...able-rt_sigpending-syscall-on-ppc64-linux.patch |  35 ---
 .../valgrind/valgrind/0002-remove-rpath.patch      |  35 +++
 .../valgrind/0004-Fix-out-of-tree-builds.patch     | 175 +++++++++++++++
 ...vg_test-wrapper-to-support-PTEST-formats.patch} |  87 ++++----
 .../valgrind/enable.building.on.4.x.kernel.patch   |  37 ----
 .../valgrind/valgrind/force-nostabs.patch          |  42 ----
 .../recipes-devtools/valgrind/valgrind/glibc.patch |  44 ----
 .../pass-maltivec-only-if-it-supported.patch       |  68 ------
 .../valgrind/remove-ppc-tests-failing-build.patch  |  75 -------
 .../valgrind/valgrind/sepbuildfix.patch            | 235 ---------------------
 .../{valgrind_3.10.1.bb => valgrind_3.11.0.bb}     |  45 ++--
 12 files changed, 282 insertions(+), 598 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-valgrind-Enable-rt_sigpending-syscall-on-ppc64-linux.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-remove-rpath.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
 rename meta/recipes-devtools/valgrind/valgrind/{add-ptest.patch => 0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch} (80%)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/enable.building.on.4.x.kernel.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/glibc.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/sepbuildfix.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.10.1.bb => valgrind_3.11.0.bb} (71%)

-- 
1.9.1


