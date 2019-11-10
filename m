Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1123F7F959
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Nov 2019 14:54:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2019 06:54:37 -0800
X-IronPort-AV: E=Sophos;i="5.68,289,1569308400"; d="scan'208";a="197423062"
Received: from wkwak-mobl1.gar.corp.intel.com (HELO
	anmitta2-mobl1.gar.corp.intel.com) ([10.252.8.93])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2019 06:54:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Nov 2019 22:54:10 +0800
Message-Id: <20191110145416.5171-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191110145416.5171-1-anuj.mittal@intel.com>
References: <20191110145416.5171-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] libxslt: fix CVE-2019-18197
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
X-List-Received-Date: Sun, 10 Nov 2019 14:54:36 -0000
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Use patch from upstream after 1.1.33 release.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libxslt/files/CVE-2019-18197.patch        | 33 +++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.33.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-18197.patch

diff --git a/meta/recipes-support/libxslt/files/CVE-2019-18197.patch b/meta/recipes-support/libxslt/files/CVE-2019-18197.patch
new file mode 100644
index 0000000000..5f2b620396
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/CVE-2019-18197.patch
@@ -0,0 +1,33 @@
+libxslt: fix CVE-2019-18197
+
+Added after 1.1.33 release.
+
+CVE: CVE-2019-18197
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt.git]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+commit 2232473733b7313d67de8836ea3b29eec6e8e285
+Author: Nick Wellnhofer <wellnhofer@aevum.de>
+Date:   Sat Aug 17 16:51:53 2019 +0200
+
+    Fix dangling pointer in xsltCopyText
+    
+    xsltCopyText didn't reset ctxt->lasttext in some cases which could
+    lead to various memory errors in relation with CDATA sections in input
+    documents.
+    
+    Found by OSS-Fuzz.
+
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 95ebd07..d7ab0b6 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -1094,6 +1094,8 @@ xsltCopyText(xsltTransformContextPtr ctxt, xmlNodePtr target,
+ 	    if ((copy->content = xmlStrdup(cur->content)) == NULL)
+ 		return NULL;
+ 	}
++
++	ctxt->lasttext = NULL;
+     } else {
+         /*
+ 	 * normal processing. keep counters to extend the text node
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index abc00a09ea..9f268e7bb0 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
            file://0001-Fix-security-framework-bypass.patch \
            file://CVE-2019-13117.patch \
            file://CVE-2019-13118.patch \
+           file://CVE-2019-18197.patch \
 "
 
 SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
-- 
2.21.0


