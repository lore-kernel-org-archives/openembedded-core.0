Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 726AC6120D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2020 05:54:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2020 21:47:19 -0800
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="219629199"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.21.206])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2020 21:47:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2020 13:47:06 +0800
Message-Id: <20200204054707.913173-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204054707.913173-1-anuj.mittal@intel.com>
References: <20200204054707.913173-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libxml2: fix CVE-2020-7595
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
X-List-Received-Date: Tue, 04 Feb 2020 05:54:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libxml/libxml2/CVE-2020-7595.patch        | 36 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
new file mode 100644
index 0000000000..facfefd362
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
@@ -0,0 +1,36 @@
+From 0e1a49c8907645d2e155f0d89d4d9895ac5112b5 Mon Sep 17 00:00:00 2001
+From: Zhipeng Xie <xiezhipeng1@huawei.com>
+Date: Thu, 12 Dec 2019 17:30:55 +0800
+Subject: [PATCH] Fix infinite loop in xmlStringLenDecodeEntities
+
+When ctxt->instate == XML_PARSER_EOF,xmlParseStringEntityRef
+return NULL which cause a infinite loop in xmlStringLenDecodeEntities
+
+Found with libFuzzer.
+
+Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/0e1a49c89076]
+CVE: CVE-2020-7595
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
+---
+ parser.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index d1c31963..a34bb6cd 100644
+--- a/parser.c
++++ b/parser.c
+@@ -2646,7 +2646,8 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
+     else
+         c = 0;
+     while ((c != 0) && (c != end) && /* non input consuming loop */
+-	   (c != end2) && (c != end3)) {
++           (c != end2) && (c != end3) &&
++           (ctxt->instate != XML_PARSER_EOF)) {
+ 
+ 	if (c == 0) break;
+         if ((c == '&') && (str[1] == '#')) {
+-- 
+2.24.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 2c833fa7a2..6a4097c2c6 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
+           file://CVE-2020-7595.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.24.1


