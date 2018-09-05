Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8729B74D0C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 07:05:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8575Ubx004549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2018 00:05:30 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Sep 2018 00:05:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2018 15:16:17 +0800
Message-ID: <568c7b051fd166a653c943d618027f7b59e436b5.1536130313.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1536130313.git.liezhi.yang@windriver.com>
References: <cover.1536130313.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2 V2] oe/utils.py: Add vartrue()
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
X-List-Received-Date: Wed, 05 Sep 2018 07:05:29 -0000
Content-Type: text/plain

It can be used to simplify code like:
"${@['iffalse', 'iftrue'][var]}"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 meta/lib/oe/utils.py   | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index faef771..dbadeb3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -610,7 +610,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 # Disabled until the option works properly -feliminate-dwarf2-dups
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
-SELECTED_OPTIMIZATION = "${@d.getVar(['FULL_OPTIMIZATION', 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') == '1'])}"
+SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
 BUILD_OPTIMIZATION = "-O2 -pipe"
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index f22a6ab..914a6f2 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -464,3 +464,10 @@ class ImageQAFailed(bb.build.FuncFailed):
             msg = msg + ' (%s)' % self.description
 
         return msg
+
+def vartrue(var, iftrue, iffalse, d):
+    import oe.types
+    if oe.types.boolean(d.getVar(var)):
+        return iftrue
+    else:
+        return iffalse
-- 
2.7.4


