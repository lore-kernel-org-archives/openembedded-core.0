Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 389CB78315
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:09:05 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5FC96WL029975
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:09:06 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v5FC96bT028377;
	Thu, 15 Jun 2017 14:09:06 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id BE7BD1CA96A;
	Thu, 15 Jun 2017 14:09:05 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 14:08:37 +0200
Message-Id: <1497528519-19425-6-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1497528519-19425-1-git-send-email-andrej.valek@siemens.com>
References: <1497528519-19425-1-git-send-email-andrej.valek@siemens.com>
Subject: [PATCH v3 5/7] libxml2: Fix CVE-2017-5969
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
X-List-Received-Date: Thu, 15 Jun 2017 12:09:07 -0000

Fix NULL pointer deref in xmlDumpElementContent

Can only be triggered in recovery mode.

Fixes bug 758422

CVE: CVE-2017-5969
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libxml/libxml2/libxml2-CVE-2017-5969.patch     | 62 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
new file mode 100644
index 0000000..571b05c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
@@ -0,0 +1,62 @@
+libxml2-2.9.4: Fix CVE-2017-5969
+
+[No upstream tracking] -- https://bugzilla.gnome.org/show_bug.cgi?id=758422
+
+valid: Fix NULL pointer deref in xmlDumpElementContent
+
+Can only be triggered in recovery mode.
+
+Fixes bug 758422
+
+Upstream-Status: Backport - [https://git.gnome.org/browse/libxml2/commit/?id=94691dc884d1a8ada39f073408b4bb92fe7fe882]
+CVE: CVE-2017-5969
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/valid.c b/valid.c
+index 19f84b8..0a8e58a 100644
+--- a/valid.c
++++ b/valid.c
+@@ -1172,29 +1172,33 @@ xmlDumpElementContent(xmlBufferPtr buf, xmlElementContentPtr content, int glob)
+ 	    xmlBufferWriteCHAR(buf, content->name);
+ 	    break;
+ 	case XML_ELEMENT_CONTENT_SEQ:
+-	    if ((content->c1->type == XML_ELEMENT_CONTENT_OR) ||
+-	        (content->c1->type == XML_ELEMENT_CONTENT_SEQ))
++	    if ((content->c1 != NULL) &&
++	        ((content->c1->type == XML_ELEMENT_CONTENT_OR) ||
++	         (content->c1->type == XML_ELEMENT_CONTENT_SEQ)))
+ 		xmlDumpElementContent(buf, content->c1, 1);
+ 	    else
+ 		xmlDumpElementContent(buf, content->c1, 0);
+             xmlBufferWriteChar(buf, " , ");
+-	    if ((content->c2->type == XML_ELEMENT_CONTENT_OR) ||
+-	        ((content->c2->type == XML_ELEMENT_CONTENT_SEQ) &&
+-		 (content->c2->ocur != XML_ELEMENT_CONTENT_ONCE)))
++	    if ((content->c2 != NULL) &&
++	        ((content->c2->type == XML_ELEMENT_CONTENT_OR) ||
++	         ((content->c2->type == XML_ELEMENT_CONTENT_SEQ) &&
++		  (content->c2->ocur != XML_ELEMENT_CONTENT_ONCE))))
+ 		xmlDumpElementContent(buf, content->c2, 1);
+ 	    else
+ 		xmlDumpElementContent(buf, content->c2, 0);
+ 	    break;
+ 	case XML_ELEMENT_CONTENT_OR:
+-	    if ((content->c1->type == XML_ELEMENT_CONTENT_OR) ||
+-	        (content->c1->type == XML_ELEMENT_CONTENT_SEQ))
++	    if ((content->c1 != NULL) &&
++	        ((content->c1->type == XML_ELEMENT_CONTENT_OR) ||
++	         (content->c1->type == XML_ELEMENT_CONTENT_SEQ)))
+ 		xmlDumpElementContent(buf, content->c1, 1);
+ 	    else
+ 		xmlDumpElementContent(buf, content->c1, 0);
+             xmlBufferWriteChar(buf, " | ");
+-	    if ((content->c2->type == XML_ELEMENT_CONTENT_SEQ) ||
+-	        ((content->c2->type == XML_ELEMENT_CONTENT_OR) &&
+-		 (content->c2->ocur != XML_ELEMENT_CONTENT_ONCE)))
++	    if ((content->c2 != NULL) &&
++	        ((content->c2->type == XML_ELEMENT_CONTENT_SEQ) ||
++	         ((content->c2->type == XML_ELEMENT_CONTENT_OR) &&
++		  (content->c2->ocur != XML_ELEMENT_CONTENT_ONCE))))
+ 		xmlDumpElementContent(buf, content->c2, 1);
+ 	    else
+ 		xmlDumpElementContent(buf, content->c2, 0);
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 3f78c2d..2996809 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -26,6 +26,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-fix_and_simplify_xmlParseStartTag2.patch \
            file://libxml2-CVE-2017-9047_CVE-2017-9048.patch \
            file://libxml2-CVE-2017-9049_CVE-2017-9050.patch \
+           file://libxml2-CVE-2017-5969.patch \
            file://CVE-2016-9318.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            "
-- 
2.1.4


