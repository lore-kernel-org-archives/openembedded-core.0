Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id E6C6C71A70
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 08:50:20 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym02.jp.fujitsu.com with smtp
	id 1338_35b6_445ed53c_fcdb_4d49_bdf0_ca475d074228;
	Wed, 07 Jun 2017 17:50:17 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id A0805AC01AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 17:50:17 +0900 (JST)
Received: from g01jpexchkw33.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	8AD15692519 for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 17:50:16 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw33.g01.fujitsu.local (10.0.193.36) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 7 Jun 2017 17:50:16 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jun 2017 17:51:37 +0900
Message-ID: <1496825497-26430-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libxml2: Fix CVE-2017-8872
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
X-List-Received-Date: Wed, 07 Jun 2017 08:50:21 -0000
Content-Type: text/plain

CVE: CVE-2017-8872
The htmlParseTryOrFinish function in HTMLparser.c in libxml2 2.9.4 allows attackers
to cause a denial of service (buffer over-read) or information disclosure.

External References:
https://bugzilla.gnome.org/show_bug.cgi?id=77520

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../libxml/libxml2/libxml2-CVE-2017-8872.patch     | 23 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
new file mode 100644
index 0000000..df05e06
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
@@ -0,0 +1,23 @@
+libxml2-2.9.4: Fix CVE-2017-8872
+
+Bug 775200 - (CVE-2017-8872) global-buffer-overflow in htmlParseTryOrFinish (HTMLparser.c:5403) 
+ - [https://bugzilla.gnome.org/show_bug.cgi?id=775200]
+
+CVE: CVE-2017-8872
+Upstream-Status: Submitted
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+Index: libxml2-2.9.4/HTMLparser.c
+===================================================================
+--- libxml2-2.9.4.orig/HTMLparser.c
++++ libxml2-2.9.4/HTMLparser.c
+@@ -5396,6 +5396,8 @@ htmlParseTryOrFinish(htmlParserCtxtPtr c
+ 		ctxt->instate = XML_PARSER_EOF;
+ 		if ((ctxt->sax) && (ctxt->sax->endDocument != NULL))
+ 		    ctxt->sax->endDocument(ctxt->userData);
++
++		goto done;
+ 	    }
+ 	}
+         if (avail < 1)
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index ea0d3b8..0b4cbca 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-CVE-2016-4658.patch \
            file://libxml2-fix_NULL_pointer_derefs.patch \
            file://CVE-2016-9318.patch \
+	   file://libxml2-CVE-2017-8872.patch \
           "
 
 SRC_URI[libtar.md5sum] = "ae249165c173b1ff386ee8ad676815f5"
-- 
1.9.1


