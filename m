Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BDD2E7321C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 19:38:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 09 Feb 2017 11:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,137,1484035200"; d="scan'208";a="1105292687"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2017 11:38:38 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id BF6066A4006;
	Thu,  9 Feb 2017 11:37:36 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2017 21:38:32 +0200
Message-Id: <648860bfcd16c5ea3f29142ea778a13168dfc53c.1486668313.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486668313.git.jussi.kukkonen@intel.com>
References: <cover.1486668313.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] cve-check-tool: Fixes for recipe sysroots
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
X-List-Received-Date: Thu, 09 Feb 2017 19:38:38 -0000

* Use --enable-relative-plugins so cve-check-tool looks for
  loadable modules relative to binary location instead of
  hard-coding a wrong sysroot location
* do_populate_cve_db() assumes that the binary cve-check-update is in
  the sysroot. Ensure that this is true by adding a task dependency

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
index 6e35421..c78af67 100644
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -22,7 +22,7 @@ RDEPENDS_${PN} = "ca-certificates"
 
 inherit pkgconfig autotools
 
-EXTRA_OECONF = "--disable-coverage"
+EXTRA_OECONF = "--disable-coverage --enable-relative-plugins"
 CFLAGS_append = " -Wno-error=pedantic"
 
 do_populate_cve_db() {
@@ -50,6 +50,7 @@ do_populate_cve_db() {
 }
 
 addtask populate_cve_db after do_populate_sysroot
+do_populate_cve_db[depends] = "cve-check-tool-native:do_populate_sysroot"
 do_populate_cve_db[nostamp] = "1"
 do_populate_cve_db[progress] = "percent"
 
-- 
2.1.4


