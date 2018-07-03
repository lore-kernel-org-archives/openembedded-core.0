Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACC6362134
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 08:00:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6380HFW028266
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jul 2018 01:00:17 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 3 Jul 2018 01:00:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 3 Jul 2018 16:10:12 +0800
Message-ID: <1530605412-17668-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libxml2: fix CVE-2017-8872
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
X-List-Received-Date: Tue, 03 Jul 2018 08:00:17 -0000
Content-Type: text/plain

The htmlParseTryOrFinish function in HTMLparser.c in libxml2 2.9.4
allows attackers to cause a denial of service (buffer over-read) or
information disclosure.

https://bugzilla.gnome.org/show_bug.cgi?id=775200

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libxml/libxml2/fix-CVE-2017-8872.patch         | 38 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.8.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch

diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch b/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
new file mode 100644
index 0000000..e34a48e
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
@@ -0,0 +1,38 @@
+From b4bee17b158e289e5c4c9045e64e5374ccafe068 Mon Sep 17 00:00:00 2001
+From: Salvatore Bonaccorso <carnil@debian.org>
+Date: Tue, 3 Jul 2018 15:54:03 +0800
+Subject: [PATCH] Out-of-bounds read in htmlParseTryOrFinish (CVE-2017-8872)
+
+https://bugzilla.gnome.org/show_bug.cgi?id=775200
+Fixes bug 775200.
+
+Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
+
+Upstream-Status: Backport
+https://bug775200.bugzilla-attachments.gnome.org/attachment.cgi?id=366193
+CVE: CVE-2017-8872
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ parser.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index ca9fde2..fb4c889 100644
+--- a/parser.c
++++ b/parser.c
+@@ -12464,7 +12464,11 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
+ 	}
+ 	ctxt->input->cur = BAD_CAST"";
+ 	ctxt->input->base = ctxt->input->cur;
+-        ctxt->input->end = ctxt->input->cur;
++	ctxt->input->end = ctxt->input->cur;
++	if (ctxt->input->buf)
++	    xmlBufEmpty (ctxt->input->buf->buffer);
++	else
++	    ctxt->input->length = 0;
+     }
+ }
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index d55e650..1f22bb0 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
+           file://fix-CVE-2017-8872.patch \
            "
 
 SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
-- 
2.7.4


