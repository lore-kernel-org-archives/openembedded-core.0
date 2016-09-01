Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFD8731DF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 16:26:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 01 Sep 2016 09:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,268,1470726000"; d="scan'208";a="1023783532"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.25.136])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2016 09:26:46 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 17:26:39 +0100
Message-Id: <cover.1472747098.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v3 0/3] Preserve extended attributes in sstate objects
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
X-List-Received-Date: Thu, 01 Sep 2016 16:26:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This small series is part of a larger, on-going, effort to better support  extended attributes (xattr).

The goal of sending these three patches before the whole is complete is to improve support for distros with features that rely on xattr that wish to use meta-swupd.

meta-swupd creates sstate objects of update artefacts so that an OS update delta can be generated against a previous OS release without having to have the full build history in TMPDIR — this is especially useful for CI workflows.
Without these changes sstate objects don't preserve xattr and thus swupd updates artefacts are incorrect/incomplete.

Changes since v2:
* Call [s|g]etfattr with the full path in STAGING_BINDIR_NATIVE

Changes since v1:
* Drop extra addition of tar to buildtools tarball, it's already included
* Add two tests for oe.path.copytree(); one to ensure files with spaces and special characters are copied and one to ensure extended attributes are preserved.

Regards,

Joshua

The following changes since commit 384cf92ca9c3e66763c2c1ff2776c53d47ae25d6:

  init-install: Fixes the install script failing when not finding any mmcblk devices (2016-08-30 07:57:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/xattr
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/xattr

Joshua Lock (3):
  oeqa.selftest: add a test for oe.path.copytree()
  oe.path: preserve xattr in copytree() and copyhardlinktree()
  oeqa.selftest.liboe: add test for xattr in copytree

 meta/lib/oe/path.py             | 11 +++++--
 meta/lib/oeqa/selftest/liboe.py | 64 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 3 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/liboe.py

-- 
2.7.4

