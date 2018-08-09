Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id BBF4B6086F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 08:06:44 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w7986iMo002947
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Aug 2018 10:06:44 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w7986ij3012952;
	Thu, 9 Aug 2018 10:06:44 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 1F1A795183E;
	Thu,  9 Aug 2018 10:06:45 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Aug 2018 10:06:37 +0200
Message-Id: <20180809080637.11672-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libxml2: Fix CVE-2018-14404
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
X-List-Received-Date: Thu, 09 Aug 2018 08:06:45 -0000

Fix nullptr deref with XPath logic ops

If the XPath stack is corrupted, for example by a misbehaving extension
function, the "and" and "or" XPath operators could dereference NULL
pointers. Check that the XPath stack isn't empty and optimize the
logic operators slightly.

CVE: CVE-2018-14404
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libxml/libxml2/fix-CVE-2018-14404.patch        | 45 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.8.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2018-14404.patch

diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2018-14404.patch b/meta/recipes-core/libxml/libxml2/fix-CVE-2018-14404.patch
new file mode 100644
index 0000000000..21668e25ad
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/fix-CVE-2018-14404.patch
@@ -0,0 +1,45 @@
+libxml2-2.9.8: Fix CVE-2018-14404
+
+[No upstream tracking] -- https://gitlab.gnome.org/GNOME/libxml2/issues/5
+ -- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=901817
+ -- https://bugzilla.redhat.com/show_bug.cgi?id=1595985
+
+xpath: Fix nullptr deref with XPath logic ops
+
+If the XPath stack is corrupted, for example by a misbehaving extension
+function, the "and" and "or" XPath operators could dereference NULL
+pointers. Check that the XPath stack isn't empty and optimize the
+logic operators slightly.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/a436374994c47b12d5de1b8b1d191a098fa23594]
+CVE: CVE-2018-14404
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/xpath.c b/xpath.c
+index f440696..75cac5c 100644
+--- a/xpath.c
++++ b/xpath.c
+@@ -13297,9 +13297,8 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr ctxt, xmlXPathStepOpPtr op)
+ 		return(0);
+ 	    }
+             xmlXPathBooleanFunction(ctxt, 1);
+-            arg1 = valuePop(ctxt);
+-            arg1->boolval &= arg2->boolval;
+-            valuePush(ctxt, arg1);
++	    if (ctxt->value != NULL)
++		ctxt->value->boolval &= arg2->boolval;
+ 	    xmlXPathReleaseObject(ctxt->context, arg2);
+             return (total);
+         case XPATH_OP_OR:
+@@ -13323,9 +13322,8 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr ctxt, xmlXPathStepOpPtr op)
+ 		return(0);
+ 	    }
+             xmlXPathBooleanFunction(ctxt, 1);
+-            arg1 = valuePop(ctxt);
+-            arg1->boolval |= arg2->boolval;
+-            valuePush(ctxt, arg1);
++	    if (ctxt->value != NULL)
++		ctxt->value->boolval |= arg2->boolval;
+ 	    xmlXPathReleaseObject(ctxt->context, arg2);
+             return (total);
+         case XPATH_OP_EQUAL:
diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index 27a648e97a..4ebd2ef383 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
            file://fix-CVE-2017-8872.patch \
+           file://fix-CVE-2018-14404.patch \
            "
 
 SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
-- 
2.11.0


