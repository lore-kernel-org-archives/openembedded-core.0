Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D96CD6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 03:11:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 24 Aug 2016 20:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,573,1464678000"; d="scan'208";a="160610126"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2016 20:01:29 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 18:58:33 +0000
Message-Id: <cover.1472060412.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv4 0/2] Add initial capability to check CVEs for recipes
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
X-List-Received-Date: Thu, 25 Aug 2016 03:11:13 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This series add the cve-check-tool recipe, a tool used to identify
potentially vulnerable software through version matching. It will
check if a vulnerability has been addressed by a patch.

Also add the new cve-check class that will add a task for all recipes
to check for CVEs using cve-check-tool. This tool can be used by recipe,
mage (will generate an image report in deploy dir), and with "world"
and "universe"

To run it just inherit the class and enter:

bitbake -c cve_check <recipe>

Changes in v2:

- Set the explicit dependency of cve-check-tool-native:do_populate_cve_db
  in the cve-check class
- Squashed patch 2 into patch 1

Changes in v3:

- Support for python3
- Add check for BB_NO_NETWORK

Changes in v4:

- Support for GCC 6 adding -Wno-error=pedantic to CFLAGS
- Support for musl thanks to patch from Khem
- Tweaks when building the the CVE database
- Fix license

The following changes since commit a81b326933d15f08e06780f92d8dc0d4efb3cd23:

  combo-layer: python3: fix UnicodeDecodeError (2016-08-24 13:58:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug7515v5
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug7515v5

Mariano Lopez (2):
  cve-check-tool: Add recipe
  cve-check.bbclass: Add class

 meta/classes/cve-check.bbclass                     | 267 +++++++++++++++++++++
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |  59 +++++
 .../check-for-malloc_trim-before-using-it.patch    |  51 ++++
 3 files changed, 377 insertions(+)
 create mode 100644 meta/classes/cve-check.bbclass
 create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/check-for-malloc_trim-before-using-it.patch

-- 
2.6.6


