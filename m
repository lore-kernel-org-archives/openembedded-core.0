Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0AFD776104
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:31:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 27 Aug 2015 02:31:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,421,1437462000"; d="scan'208";a="776621060"
Received: from wneubaue-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.11.162])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2015 02:31:20 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 12:31:12 +0300
Message-Id: <1440667876-1024-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/4] Sign packages in RPM feeds
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
X-List-Received-Date: Thu, 27 Aug 2015 09:31:19 -0000

Second iteration of my patchset. I tried to address the issues pointed out by
Mark:
1. The gpg key is not imported to the (temporary) rpm databases used by
   createrepo. Instead, createrepo is patched to ignore signature
   verification altogether.
2. There is a new optional config variable GPG_BIN which can be used to
   define the gpg binary used for signing.
3. The filename of the public keys (published with the package feed and
   depoyed into the target rootfs as part of os-release package) is now
   postfixed with "-${DISTRO_VERSION}".

[YOCTO #8134]

*** BLURB HERE ***

Markus Lehtonen (4):
  createrepo: disable RPM signature validation
  package_rpm: support signing of rpm packages
  os-release: add the public package-signing key
  package_manager: support for signed RPM package feeds

 meta/classes/package_rpm.bbclass                   |  5 ++
 meta/classes/sign_rpm.bbclass                      | 60 ++++++++++++++++++++++
 meta/lib/oe/package_manager.py                     | 40 +++++++++++++++
 meta/recipes-core/os-release/os-release.bb         | 11 ++++
 ...dumpMetadata-disable-signature-validation.patch | 31 +++++++++++
 .../createrepo/createrepo_0.4.11.bb                | 17 +++---
 6 files changed, 156 insertions(+), 8 deletions(-)
 create mode 100644 meta/classes/sign_rpm.bbclass
 create mode 100644 meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch

-- 
2.1.4


