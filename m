Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA28EC55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 20:47:23 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30279.1785703641761320795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 13:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lj9dQxep;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260802204718318bd204a700020777-5apu6p@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260802204718318bd204a700020777
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 22:47:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=T8yO1HG1lxXcPffFmeksjygkXnhEC3WKntGCDG5MFsI=;
 b=lj9dQxepuK6oDkcgumQ/VBydT6YvUhpxSQDKOJ4Ng+oVx/KcKUXlusQEupbMtswArNzODS
 pPTNMI7Lry+E8N+OakXa6msagTON5Pqw1R057Y6ZtHub6p0+YGe6goSfvRRBQemVt8xaP+l/
 CpKVMNitHrC2oCV3bLiao++7Wt3e9EniGVajQZ1GU3V8HS4G2dvbt2Hx+v/m3QRH6pRfkD6R
 FC41fPf82owwJI37+cv34f4NRqzllLpilt7D7EYMlxmpZ7uYXPH+pCrPaLkTNBkZ/sCU4hZ7
 zp9rhoSPt39dMrtVdCHrdTOMHt5cyaufbGtGi4xpBhdgJ/rU5g2Jwa/Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] bison: patch CVE-2026-56389
Date: Sun,  2 Aug 2026 22:46:58 +0200
Message-ID: <20260802204700.2422172-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 20:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242586

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../bison/bison/CVE-2026-56389.patch          | 56 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56389.patch

diff --git a/meta/recipes-devtools/bison/bison/CVE-2026-56389.patch b/meta/recipes-devtools/bison/bison/CVE-2026-56389.patch
new file mode 100644
index 0000000000..ac827f6314
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/CVE-2026-56389.patch
@@ -0,0 +1,56 @@
+From 3169c1e7a2c6acc4c59dfcf8b089896d6881925b Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 23 Apr 2026 09:20:43 -0700
+Subject: [PATCH] html: use xsltproc from PATH
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* src/print-xml.c (print_html):
+* src/reader.c (prepare_percent_define_front_end_variables):
+Drop undocumented support for lines like ‘%define tool.xsltproc
+"whatever"’, as this can cause more trouble than it cures.
+
+CVE: CVE-2026-56389
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=3169c1e7a2c6acc4c59dfcf8b089896d6881925b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/print-xml.c | 4 +---
+ src/reader.c    | 1 -
+ 2 files changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/print-xml.c b/src/print-xml.c
+index 8da6da0d..79bfa88d 100644
+--- a/src/print-xml.c
++++ b/src/print-xml.c
+@@ -543,10 +543,9 @@ print_html (void)
+   assert (xml_flag);
+ 
+   char *xml2html = xpath_join (pkgdatadir (), "xslt/xml2xhtml.xsl");
+-  char *xsltproc = muscle_percent_define_get ("tool.xsltproc");
+   char const *argv[11];
+   int i = 0;
+-  argv[i++] = xsltproc;
++  argv[i++] = "xsltproc";
+   argv[i++] = "-o";
+   argv[i++] = spec_html_file;
+   argv[i++] = xml2html;
+@@ -572,6 +571,5 @@ print_html (void)
+                /* termsigp */ NULL);
+   if (status)
+     complain (NULL, complaint, _("%s failed with status %d"), argv[0], status);
+-  free (xsltproc);
+   free (xml2html);
+ }
+diff --git a/src/reader.c b/src/reader.c
+index 862d7293..cb2a7f69 100644
+--- a/src/reader.c
++++ b/src/reader.c
+@@ -788,7 +788,6 @@ prepare_percent_define_front_end_variables (void)
+       muscle_percent_define_default ("lr.default-reduction", "accepting");
+     free (lr_type);
+   }
+-  muscle_percent_define_default ("tool.xsltproc", "xsltproc");
+ 
+   /* Check %define front-end variables.  */
+   {
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-devtools/bison/bison_3.8.2.bb
index 513d7ec287..03d3cffe2a 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -12,6 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://autoconf-2.73.patch \
            file://add-with-bisonlocaledir.patch \
+           file://CVE-2026-56389.patch \
            "
 SRC_URI[sha256sum] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
 

