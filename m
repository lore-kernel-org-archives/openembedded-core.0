Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9457FC9D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 20:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9AD0940BFF;
	Fri,  8 Nov 2019 20:59:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KztD6LGn3C9m; Fri,  8 Nov 2019 20:59:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 85E8D40BEA;
	Fri,  8 Nov 2019 20:59:32 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 31DAE170443;
	Fri,  8 Nov 2019 15:59:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Nov 2019 15:59:29 -0500
Message-Id: <1573246769-12052-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] buildhistory: fix "version went backwards" QA error message
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
X-List-Received-Date: Fri, 08 Nov 2019 20:59:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Fix parentheses placement in the message from:
Package version for package X went backwards which would break package feeds from (Y to Z)
to this one:
Package version for package X went backwards which would break package feeds (from Y to Z)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - escape parentheses in the regular expression of the selftest case, as
those are part of the text and not regex itself, otherwise it won't match.

 meta/classes/buildhistory.bbclass            | 2 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f986f7c..affdf27 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -280,7 +280,7 @@ python buildhistory_emit_pkghistory() {
             last_pkgr = lastversion.pkgr
             r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
             if r < 0:
-                msg = "Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr)
+                msg = "Package version for package %s went backwards which would break package feeds (from %s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr)
                 package_qa_handle_error("version-going-backwards", msg, d)
 
         pkginfo = PackageInfo(pkg)
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 6a5378d..e91f0bd 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -143,7 +143,7 @@ class BuildhistoryTests(BuildhistoryBase):
 
     def test_buildhistory_buildtime_pr_backwards(self):
         target = 'xcursor-transparent-theme'
-        error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds from (.*-r1.* to .*-r0.*)" % target
+        error = "ERROR:.*QA Issue: Package version for package %s went backwards which would break package feeds \(from .*-r1.* to .*-r0.*\)" % target
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
-- 
2.7.4


