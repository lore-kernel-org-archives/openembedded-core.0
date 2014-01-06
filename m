Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 49AEB60DFD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 16:00:36 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Jan 2014 08:00:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,613,1384329600"; d="scan'208";a="401472723"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 06 Jan 2014 08:00:36 -0800
Received: from localhost.localdomain (unknown [10.237.112.161])
	by linux.intel.com (Postfix) with ESMTP id 7FF486A4092;
	Mon,  6 Jan 2014 08:00:32 -0800 (PST)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2014 18:12:22 +0100
Message-Id: <1389028342-23264-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] Modify buildstats to be merged inside buildhistory
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
X-List-Received-Date: Mon, 06 Jan 2014 16:00:36 -0000

- added buildstats inheritance inside buildhistory
- when buildhisory is used, buildstats will be moved inside the buildhistory directory
---
 meta/classes/buildhistory.bbclass |    3 +++
 meta/classes/buildstats.bbclass   |    2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e9a9c3b..54efecfe 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -16,9 +16,12 @@ BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 BUILDHISTORY_COMMIT ?= "0"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
+BUILDSTATS_BASE = "${BUILDHISTORY_DIR}/buildstats"
 
 SSTATEPOSTINSTFUNCS += "buildhistory_emit_pkghistory"
 
+inherit buildstats
+
 #
 # Write out metadata about this package for comparision when writing future packages
 #
diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 72fff11..c8769ae 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -1,4 +1,4 @@
-BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
+BUILDSTATS_BASE ??= "${TMPDIR}/buildstats/"
 BNFILE = "${BUILDSTATS_BASE}/.buildname"
 DEVFILE = "${BUILDSTATS_BASE}/.device"
 
-- 
1.7.9.5


