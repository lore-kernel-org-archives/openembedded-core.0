Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA8C065D69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:28:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5P0SBAF024225
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 17:28:11 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 24 Jun 2014 17:28:11 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jun 2014 19:28:05 -0500
Message-ID: <ec28cde60c7b58e26924a6adcd632798e1a670fd.1403655933.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1403655933.git.mark.hatle@windriver.com>
References: <cover.1403655933.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] populate_sdk: Fix TOOLCHAIN_TARGET_TASK_ATTEMPTONLY implementation
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
X-List-Received-Date: Wed, 25 Jun 2014 00:28:14 -0000
Content-Type: text/plain

The variable was only partially implemented, and the part that was there
was named incorrectly to, missing the 'TASK' piece.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 1 +
 meta/lib/oe/manifest.py                | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 35d837d..d3d8422 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -55,6 +55,7 @@ fakeroot python do_populate_sdk() {
 
     pn = d.getVar('PN', True)
     runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", pn, d)
+    runtime_mapping_rename("TOOLCHAIN_TARGET_TASK_ATTEMPTONLY", pn, d)
 
     # create target/host SDK manifests
     create_manifest(d, manifest_dir=d.getVar('SDK_DIR', True),
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index afda76b..42832f1 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -31,7 +31,7 @@ class Manifest(object):
         },
         MANIFEST_TYPE_SDK_TARGET: {
             "TOOLCHAIN_TARGET_TASK": PKG_TYPE_MUST_INSTALL,
-            "TOOLCHAIN_TARGET_ATTEMPTONLY": PKG_TYPE_ATTEMPT_ONLY
+            "TOOLCHAIN_TARGET_TASK_ATTEMPTONLY": PKG_TYPE_ATTEMPT_ONLY
         }
     }
 
-- 
1.9.3


