Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 249007F8B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 09:35:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBA9Zkhn000724
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 01:35:47 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 10 Dec 2019 01:35:46 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Dec 2019 17:35:34 +0800
Message-ID: <20191210093535.26762-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/2] base.bbclass: extend PACKAGECONFIG for conflict package configs
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
X-List-Received-Date: Tue, 10 Dec 2019 09:35:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There are mutually exclusive PACKAGECONFIGs in recipes. Though it
declares that package configs are exclusive, it can't prevent users to
set them at same time. Extend PACKAGECONFIG to support specifying
conflicted package configs.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/base.bbclass | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 31457f9f12..ef3afdf964 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -390,7 +390,7 @@ python () {
     # These take the form:
     #
     # PACKAGECONFIG ??= "<default options>"
-    # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends,foo_runtime_recommends"
+    # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends,foo_runtime_recommends,foo_conflict_packageconfig"
     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
     if pkgconfigflags:
         pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
@@ -437,8 +437,8 @@ python () {
         for flag, flagval in sorted(pkgconfigflags.items()):
             items = flagval.split(",")
             num = len(items)
-            if num > 5:
-                bb.error("%s: PACKAGECONFIG[%s] Only enable,disable,depend,rdepend,rrecommend can be specified!"
+            if num > 6:
+                bb.error("%s: PACKAGECONFIG[%s] Only enable,disable,depend,rdepend,rrecommend,conflict_packageconfig can be specified!"
                     % (d.getVar('PN'), flag))
 
             if flag in pkgconfig:
@@ -452,6 +452,20 @@ python () {
                     extraconf.append(items[0])
             elif num >= 2 and items[1]:
                     extraconf.append(items[1])
+
+            if num >= 6 and items[5]:
+                conflicts = set(items[5].split())
+                invalid = conflicts.difference(set(pkgconfigflags.keys()))
+                if invalid:
+                    bb.error("%s: PACKAGECONFIG[%s] Invalid conflict package config%s '%s' specified."
+                        % (d.getVar('PN'), flag, 's' if len(invalid) > 1 else '', ' '.join(invalid)))
+
+                if flag in pkgconfig:
+                    intersec = conflicts.intersection(set(pkgconfig))
+                    if intersec:
+                        bb.fatal("%s: PACKAGECONFIG[%s] Conflict package config%s '%s' set in PACKAGECONFIG."
+                            % (d.getVar('PN'), flag, 's' if len(intersec) > 1 else '', ' '.join(intersec)))
+
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
         appendVar('RRECOMMENDS_${PN}', extrarrecs)
-- 
2.17.1


