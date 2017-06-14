Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8E1783A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:27:00 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v5EFR1rq006085
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 17:27:01 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v5EFR0e8004265;
	Wed, 14 Jun 2017 17:27:01 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 36C2F1DDA39;
	Wed, 14 Jun 2017 17:27:01 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 17:26:45 +0200
Message-Id: <1497454006-13902-7-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
References: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
Subject: [PATCH 6/7] libxml2: Fix CVE-2017-0663
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
X-List-Received-Date: Wed, 14 Jun 2017 15:27:02 -0000

Fix type confusion in xmlValidateOneNamespace

Comment out code that casts xmlNsPtr to xmlAttrPtr. ID types
on namespace declarations make no practical sense anyway.

Fixes bug 780228

CVE: CVE-2017-0663
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libxml/libxml2/libxml2-CVE-2017-0663.patch     | 40 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
new file mode 100644
index 0000000..66eeb82
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
@@ -0,0 +1,40 @@
+libxml2-2.9.4: Fix CVE-2017-0663
+
+[No upstream tracking] -- https://bugzilla.gnome.org/show_bug.cgi?id=780228
+
+valid: Fix type confusion in xmlValidateOneNamespace
+
+Comment out code that casts xmlNsPtr to xmlAttrPtr. ID types
+on namespace declarations make no practical sense anyway.
+
+Fixes bug 780228
+
+Upstream-Status: Backported [https://git.gnome.org/browse/libxml2/commit/?id=92b9e8c8b3787068565a1820ba575d042f9eec66]
+CVE: CVE-2017-0663
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/libxml2-2.9.4/valid.c b/libxml2-2.9.4/valid.c
+index 19f84b8..e03d35e 100644
+--- a/valid.c
++++ b/valid.c
+@@ -4621,6 +4621,12 @@ xmlNodePtr elem, const xmlChar *prefix, xmlNsPtr ns, const xmlChar *value) {
+ 	}
+     }
+ 
++    /*
++     * Casting ns to xmlAttrPtr is wrong. We'd need separate functions
++     * xmlAddID and xmlAddRef for namespace declarations, but it makes
++     * no practical sense to use ID types anyway.
++     */
++#if 0
+     /* Validity Constraint: ID uniqueness */
+     if (attrDecl->atype == XML_ATTRIBUTE_ID) {
+         if (xmlAddID(ctxt, doc, value, (xmlAttrPtr) ns) == NULL)
+@@ -4632,6 +4638,7 @@ xmlNodePtr elem, const xmlChar *prefix, xmlNsPtr ns, const xmlChar *value) {
+         if (xmlAddRef(ctxt, doc, value, (xmlAttrPtr) ns) == NULL)
+ 	    ret = 0;
+     }
++#endif
+ 
+     /* Validity Constraint: Notation Attributes */
+     if (attrDecl->atype == XML_ATTRIBUTE_NOTATION) {
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 2996809..677d8c9 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-CVE-2017-9047_CVE-2017-9048.patch \
            file://libxml2-CVE-2017-9049_CVE-2017-9050.patch \
            file://libxml2-CVE-2017-5969.patch \
+           file://libxml2-CVE-2017-0663.patch \
            file://CVE-2016-9318.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            "
-- 
2.1.4


