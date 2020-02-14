Return-Path: <chee.yang.lee@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E1C5D6102A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 08:08:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2020 00:01:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,439,1574150400"; d="scan'208";a="434706326"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2020 00:01:02 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 16:01:00 +0800
Message-Id: <1581667260-55575-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581667260-55575-1-git-send-email-chee.yang.lee@intel.com>
References: <1581667260-55575-1-git-send-email-chee.yang.lee@intel.com>
Subject: [PATCH 2/2] libxml2: Fix CVE-2019-20388
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
X-List-Received-Date: Fri, 14 Feb 2020 08:08:10 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

see:
https://gitlab.gnome.org/GNOME/libxml2/merge_requests/68

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libxml/libxml2/CVE-2019-20388.patch            | 33 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb         |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch b/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
new file mode 100644
index 0000000..49ff6fb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
@@ -0,0 +1,33 @@
+From 7ffcd44d7e6c46704f8af0321d9314cd26e0e18a Mon Sep 17 00:00:00 2001
+From: Zhipeng Xie <xiezhipeng1@huawei.com>
+Date: Tue, 20 Aug 2019 16:33:06 +0800
+Subject: [PATCH] Fix memory leak in xmlSchemaValidateStream
+
+When ctxt->schema is NULL, xmlSchemaSAXPlug->xmlSchemaPreRun
+alloc a new schema for ctxt->schema and set vctxt->xsiAssemble
+to 1. Then xmlSchemaVStart->xmlSchemaPreRun initialize
+vctxt->xsiAssemble to 0 again which cause the alloced schema
+can not be freed anymore.
+
+Found with libFuzzer.
+
+Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
+---
+ xmlschemas.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/xmlschemas.c b/xmlschemas.c
+index 301c8449..39d92182 100644
+--- a/xmlschemas.c
++++ b/xmlschemas.c
+@@ -28090,7 +28090,6 @@ xmlSchemaPreRun(xmlSchemaValidCtxtPtr vctxt) {
+     vctxt->nberrors = 0;
+     vctxt->depth = -1;
+     vctxt->skipDepth = -1;
+-    vctxt->xsiAssemble = 0;
+     vctxt->hasKeyrefs = 0;
+ #ifdef ENABLE_IDC_NODE_TABLES_TEST
+     vctxt->createIDCNodeTables = 1;
+-- 
+2.24.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 6a4097c..097aceb 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
            file://CVE-2020-7595.patch \
+           file://CVE-2019-20388.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.7.4


