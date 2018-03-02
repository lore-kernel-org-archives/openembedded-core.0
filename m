Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B0D0571A88
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 04:44:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 20:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,409,1515484800"; d="scan'208";a="22246119"
Received: from anmitta2-mobl1.png.intel.com ([10.221.22.4])
	by orsmga006.jf.intel.com with ESMTP; 01 Mar 2018 20:44:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 12:44:16 +0800
Message-Id: <1519965857-14794-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] perf: fix packaging of scripting modules
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
X-List-Received-Date: Fri, 02 Mar 2018 04:44:24 -0000

Make sure that python and perl scripts are packaged in the correct rpm.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 1bad6f4..d798492 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -223,13 +223,14 @@ RDEPENDS_${PN}-tests =+ "python"
 RSUGGESTS_SCRIPTING = "${@bb.utils.contains('PACKAGECONFIG', 'scripting', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
-#FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core /usr/lib64/traceevent ${libdir}/traceevent"
 FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
 FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
 FILES_${PN}-tests = "${libdir}/perf/perf-core/tests ${libexecdir}/perf-core/tests"
-FILES_${PN}-python = "${libdir}/perf/perf-core/scripts/python ${PYTHON_SITEPACKAGES_DIR}"
-FILES_${PN}-python += "${libexecdir}/perf-core/scripts/python/*"
-FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
+FILES_${PN}-python = " \
+                       ${PYTHON_SITEPACKAGES_DIR} \
+                       ${libexecdir}/perf-core/scripts/python \
+                       "
+FILES_${PN}-perl = "${libexecdir}/perf-core/scripts/perl"
 
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
-- 
2.7.4


