Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7D22F605C3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 19:38:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Feb 2017 11:38:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,137,1484035200"; d="scan'208";a="1124430766"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 09 Feb 2017 11:38:25 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 077B36A4006;
	Thu,  9 Feb 2017 11:37:23 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 21:38:15 +0200
Message-Id: <cover.1486668313.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Fix cve-check (for recipe sysroots)
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
X-List-Received-Date: Thu, 09 Feb 2017 19:38:25 -0000

Recipe sysroots broke cve-check in several places, this patch set
should get it running again.

The CA cert fix is a workaround really: Native libcurl is broken
and looks for CA cert bundle in the wrong place.

Note that the NVD CVE database is flaky: I have serious problems
getting populate_cve_db to succeed during mornings in Europe as the
xml files and their metadata does not match for hours. I've reported
this to NVD.

I mentioned error output improvements in email  but did not implement
as that requires more upstream changes: I'll talk to the maintainer
about them.


  Jussi

The following changes since commit e758547db9048d4aa1c1415d6af8072f519fae24:

  nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH (2017-02-09 10:52:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/cve-check
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/cve-check

Jussi Kukkonen (3):
  cve-check.bbclass: Fix dependencies
  cve-check-tool: Fixes for recipe sysroots
  cve-check-tool: Use CA cert bundle in correct sysroot

 meta/classes/cve-check.bbclass                     |   2 +-
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |   7 +-
 ...ow-overriding-default-CA-certificate-file.patch | 215 +++++++++++++++++++++
 3 files changed, 221 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch

-- 
2.1.4


