Return-Path: <chee.yang.lee@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Jan 2020 02:16:54 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 3290692031
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 02:16:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2020 18:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,352,1574150400"; d="scan'208";a="285800459"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jan 2020 18:09:48 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 10:09:47 +0800
Message-Id: <1579745387-74550-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH][zeus] libxml2: Fix CVE-2019-19956
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
X-List-Received-Date: Thu, 23 Jan 2020 02:16:55 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

see:
https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e683896d84878bd90641d8d9b0d0549

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libxml/libxml2/Fix-CVE-2019-19956.patch        | 40 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.9.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch

diff --git a/meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch b/meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch
new file mode 100644
index 0000000..1c2dff9
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch
@@ -0,0 +1,40 @@
+From 5a02583c7e683896d84878bd90641d8d9b0d0549 Mon Sep 17 00:00:00 2001
+From: Zhipeng Xie <xiezhipeng1@huawei.com>
+Date: Wed, 7 Aug 2019 17:39:17 +0800
+Subject: [PATCH] Fix memory leak in xmlParseBalancedChunkMemoryRecover
+
+When doc is NULL, namespace created in xmlTreeEnsureXMLDecl
+is bind to newDoc->oldNs, in this case, set newDoc->oldNs to
+NULL and free newDoc will cause a memory leak.
+
+Found with libFuzzer.
+
+Closes #82.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e683896d84878bd90641d8d9b0d0549]
+CVE: CVE-2019-19956
+
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ parser.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index 1ce1ccf1..26d9f4e3 100644
+--- a/parser.c
++++ b/parser.c
+@@ -13894,7 +13894,8 @@ xmlParseBalancedChunkMemoryRecover(xmlDocPtr doc, xmlSAXHandlerPtr sax,
+     xmlFreeParserCtxt(ctxt);
+     newDoc->intSubset = NULL;
+     newDoc->extSubset = NULL;
+-    newDoc->oldNs = NULL;
++    if(doc != NULL)
++	newDoc->oldNs = NULL;
+     xmlFreeDoc(newDoc);
+ 
+     return(ret);
+-- 
+2.24.1
+
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.9.bb b/meta/recipes-core/libxml/libxml2_2.9.9.bb
index c38f883..c44a90b 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.9.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.9.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
+           file://Fix-CVE-2019-19956.patch \
            "
 
 SRC_URI[libtar.md5sum] = "c04a5a0a042eaa157e8e8c9eabe76bd6"
-- 
2.7.4


