Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F266C6EFB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 12:06:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Mar 2014 05:01:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,728,1389772800"; d="scan'208";a="479500690"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga001.jf.intel.com with ESMTP; 25 Mar 2014 05:06:24 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Mar 2014 14:06:08 +0200
Message-Id: <1395749168-16746-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] piglit: ship files with correct permissions
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
X-List-Received-Date: Tue, 25 Mar 2014 12:06:30 -0000

Adress the warning
| warning: group pulse does not exist - using root

Piglit files from framework/ generated_tests/ tests/
and templates/ belong to xuser/pulse.
Don't keep the permissions while shipping the files,
they should be root/root.

[YOCTO #6028]

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 8616764..7417cd5 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -33,11 +33,11 @@ do_install() {
 	install -d ${D}${libdir}/piglit/bin
 	install -m 755 ${S}/bin/* ${D}${libdir}/piglit/bin
 
-	cp -a lib/ ${D}${libdir}/piglit/
-	cp -a framework/ ${D}${libdir}/piglit/
-	cp -a generated_tests/ ${D}${libdir}/piglit/
-	cp -a tests/ ${D}${libdir}/piglit/
-	cp -a templates/ ${D}${libdir}/piglit/
+	cp -Pr lib/ ${D}${libdir}/piglit/
+	cp -Pr framework/ ${D}${libdir}/piglit/
+	cp -Pr generated_tests/ ${D}${libdir}/piglit/
+	cp -Pr tests/ ${D}${libdir}/piglit/
+	cp -Pr templates/ ${D}${libdir}/piglit/
 
 	sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
 	sed -i -e 's|^templatedir = .*$|templatedir = "${libdir}/piglit/templates"|' ${D}${bindir}/piglit-summary-html.py
-- 
1.8.3.2


