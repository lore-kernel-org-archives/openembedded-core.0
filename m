Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DBD775160
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 03:08:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5438gVf000246
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Jun 2018 20:08:42 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Sun, 3 Jun 2018 20:08:41 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2018 11:10:06 +0800
Message-ID: <0f1606ad9eddb77711e4d974f95cb8dfb1a61284.1528081495.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528081495.git.Qi.Chen@windriver.com>
References: <cover.1528081495.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/14] oeqa/runtime/cases/dnf_runtime.py: skip test if PACKAGE_FEED_URIS is not set
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
X-List-Received-Date: Mon, 04 Jun 2018 03:08:41 -0000
Content-Type: text/plain

This test is to test the behaviour of PACKAGE_FEED_URIS is correct or not.
If it's not even set, it makes no sense to do such test. So skip this
test if PACKAGE_FEED_URIS is not set.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 81c50ed..1aa7274 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -1,6 +1,7 @@
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.cases.dnf import DnfTest
 from oeqa.utils.httpserver import HTTPService
+from oeqa.core.decorator.data import skipIfDataVar
 
 class DnfSelftest(DnfTest):
 
@@ -18,6 +19,8 @@ class DnfSelftest(DnfTest):
         cls.temp_dir.cleanup()
 
     @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    @skipIfDataVar('PACKAGE_FEED_URIS', None,
+                   'Not suitable as PACKAGE_FEED_URIS is not set')
     def test_verify_package_feeds(self):
         """
         Summary: Check correct setting of PACKAGE_FEED_URIS var
-- 
1.9.1


