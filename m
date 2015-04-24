Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65A63605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 08:59:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O8xRng009026
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 01:59:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 24 Apr 2015 01:59:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 16:59:35 +0800
Message-ID: <d98a4f63e65361f1356643863632fa26324d5b93.1429865892.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429865892.git.Qi.Chen@windriver.com>
References: <cover.1429865892.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] populate_sdk_base: avoid executing empty function
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
X-List-Received-Date: Fri, 24 Apr 2015 08:59:26 -0000
Content-Type: text/plain

`bitbake uninative-tarball' raises the following warning.

    WARNING: Function  doesn't exist

This is because SDK_PACKAGING_FUNC is set to "" in its recipe.
Anyway, we need to check this variable to avoid executing empty function.

[YOCTO #7598]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 5c07693..7f7a87f 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -94,7 +94,9 @@ fakeroot python do_populate_sdk() {
 
     bb.build.exec_func("tar_sdk", d)
 
-    bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
+    sdk_packaging_func = d.getVar("SDK_PACKAGING_FUNC", True) or ""
+    if sdk_packaging_func.strip():
+        bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
 }
 
 fakeroot create_sdk_files() {
-- 
1.9.1


