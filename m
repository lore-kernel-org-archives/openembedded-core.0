Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B18606F800
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:19:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2KJJ5DZ022020
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:19:05 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 20 Mar 2014 12:19:04 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 14:19:02 -0500
Message-ID: <39eb2abc0ec49407fecf389609caf4f3fb4a7230.1395342974.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395342974.git.mark.hatle@windriver.com>
References: <cover.1395342974.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] useradd{-static}: Ignore useradds on nativesdk
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
X-List-Received-Date: Thu, 20 Mar 2014 19:19:06 -0000
Content-Type: text/plain

The code was supposed to ignore both native and nativesdk operations when
using the useradd and useradd-static code.  However, somewhere along the way
the code was dropped.  This didn't cause any issues until someone enabled the
enforcing mode in the new useradd-static and various nativesdk packages
started to fail.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/useradd-staticids.bbclass | 3 ++-
 meta/classes/useradd.bbclass           | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index 3efe2a8..a89cb10 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -262,7 +262,8 @@ def update_useradd_static_config(d):
 
 
 python __anonymous() {
-    if not bb.data.inherits_class('nativesdk', d):
+    if not bb.data.inherits_class('nativesdk', d) \
+        and not bb.data.inherits_class('native', d):
         try:
             update_useradd_static_config(d)
         except bb.build.FuncFailed as f:
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index b5f3768..3dd7a61 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -145,7 +145,8 @@ def update_useradd_after_parse(d):
             bb.fatal("%s inherits useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or GROUPMEMS_PARAM for package %s" % (d.getVar('FILE'), pkg))
 
 python __anonymous() {
-    if not bb.data.inherits_class('nativesdk', d):
+    if not bb.data.inherits_class('nativesdk', d) \
+        and not bb.data.inherits_class('native', d):
         update_useradd_after_parse(d)
 }
 
@@ -197,7 +198,8 @@ fakeroot python populate_packages_prepend () {
 
     # Add the user/group preinstall scripts and RDEPENDS requirements
     # to packages specified by USERADD_PACKAGES
-    if not bb.data.inherits_class('nativesdk', d):
+    if not bb.data.inherits_class('nativesdk', d) \
+        and not bb.data.inherits_class('native', d):
         useradd_packages = d.getVar('USERADD_PACKAGES', True) or ""
         for pkg in useradd_packages.split():
             update_useradd_package(pkg)
-- 
1.8.5.3


