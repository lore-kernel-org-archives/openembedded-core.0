Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Rgpp7-0000nF-1O
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Dec 2011 04:41:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Dec 2011 19:33:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90981313"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by azsmga001.ch.intel.com with ESMTP; 30 Dec 2011 19:33:10 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Dec 2011 11:31:37 +0800
Message-Id: <cover.1325302234.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PRService/meta V2 0/3] new PRService features in meta
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Dec 2011 03:41:33 -0000

NOTE: This set of patches added supporting for new features in meta layer.
It should work together with another branch of patches in bitbake.
    git://git.pokylinux.org/poky-contrib llu/PRService_bitbake

It supports the export/import AUTOPR values from/to PRservice to lockdown 
the PR values for release. The typical usage scenario is:

1. UserA enabled the PRService and run buildings. The PRService will 
record the AUTOPR values(which will be included in the finale PKGR) for 
different packages the userA builds.

2. UserA runs "bitbake-prserv-tool export <file>" to export the AUTOPR 
values from the current PRService into an exported inc file.

3. UserB gets the exported inc file and runs the command 
"bitbake -R <exported file> target" to lockdown and reproduce the same AUTOPR 
when generating packages.

4. UserB may run "bitbake-prserv-tool import <file>" to import the exported
AUTOPR values back into his own PRService. The AUTOPR values will be 
incremented from there. 

This set of changes also supports the per-recipe based PRSERV_HOST and 
PRSERV_PORT. 

This set of changes makes the basichash instead of the basic as the default
signature generator.

The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:
  Saul Wold (1):
        coreutils: ensure --color works so DEPEND on libcap

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/PRService_oecore
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/PRService_oecore

Lianhao Lu (3):
  meta/PRService: Added export/import fuctions.
  package.bbclass: per recipe PRSERV_HOST support
  conf/bitbake.conf: basichash as default signature.

 meta/classes/package.bbclass          |   21 ++++-
 meta/classes/prserv.bbclass           |  163 ++++++++++++++++++++++++++++++---
 meta/conf/bitbake.conf                |    6 +-
 meta/recipes-core/meta/prserv-misc.bb |   67 ++++++++++++++
 scripts/bitbake-prserv-tool           |   53 +++++++++++
 5 files changed, 292 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-core/meta/prserv-misc.bb
 create mode 100755 scripts/bitbake-prserv-tool



