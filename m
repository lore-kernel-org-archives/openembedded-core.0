Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5318D785D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 15:35:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 08:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,358,1498546800"; d="scan'208";a="299051660"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2017 08:35:33 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 18:35:23 +0300
Message-Id: <cover.1502465021.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v2 0/7] Support signed RPM package feeds
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
X-List-Received-Date: Fri, 11 Aug 2017 15:35:33 -0000

Second try of re-enabling signed rpm package feeds.

Changes since v1:
- enabling sign_package_feed.bbclass now causes the pubkey of the signing key
  to be installed in the image
- enabling sign_package_feed.bbclass automatically enables repo_gpgcheck (i.e.
  gpg signature check of the repo metadata) in rpm repositories added via
  PACKAGE_FEED_URIS
- dnf package feed selftest adjusted to the changes above


The following changes since commit df7f5221a56118da7654476f072c37ae1e75dc50:

  libinput: Upgrade 1.7.3 -> 1.8.1 (2017-08-09 09:25:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-11209
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-11209

Markus Lehtonen (7):
  lib/oe/package_manager: re-implement rpm feed signing
  dnf: rrecommend gnupg
  sign_package_feed.bbclass: install signing key into rootfs
  package_manager.py: enable dnf's repo_gpgcheck if feed signing is
    enabled
  oeqa: fix dnf tests
  oeqa: fix temp file handling in dnf package feed test
  dnf: expand dnf selftest to test signed package feeds

 meta-selftest/files/signing/key.passphrase         |  1 +
 .../cases/{dnf-runtime.py => dnf_runtime.py}       | 12 +++++++----
 meta/classes/sign_package_feed.bbclass             |  3 +++
 meta/lib/oe/package_manager.py                     | 24 +++++++++++++++++++---
 meta/lib/oeqa/selftest/cases/runtime_test.py       | 14 +++++++++++--
 meta/recipes-devtools/dnf/dnf_2.5.1.bb             |  2 ++
 6 files changed, 47 insertions(+), 9 deletions(-)
 create mode 100644 meta-selftest/files/signing/key.passphrase
 rename meta-selftest/lib/oeqa/runtime/cases/{dnf-runtime.py => dnf_runtime.py} (80%)

-- 
2.12.3


