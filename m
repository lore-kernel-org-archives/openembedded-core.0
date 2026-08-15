Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9769FC5AD5A
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 19:08:27 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14251.1786820899643192001
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 12:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=W1tlTnTt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202608151908164b3b508b830002079f-5svxeu@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202608151908164b3b508b830002079f
        for <openembedded-core@lists.openembedded.org>;
        Sat, 15 Aug 2026 21:08:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vS8n52PUxwjDUYDj8ouwJU7MGoujZp32eZuCMgcMQL8=;
 b=W1tlTnTtsXC6wVrSOhTchOJYET5HmFWyzWumT87qXWs2kS/U2ZvkHwnwmP0gyN0TA3aDbA
 ogm3acz94BFLQO1mO1vQvq8Y1qY2DamkPbo68hddqdHZB953hVr5nvVzshyd0engACQG6w1k
 iu0dP8zdGsd1aJXJ+Ma1aQJnpxD9ycfKlzZ8bs0SJIZReJAZhUIKXvrw0cnZ6SJZZV9gxRpu
 qGvdGMPkHMTkD7KS0QIrIKsKYH0VwzvT8GD8gqR1Vns4MNNUf8iNvU1RK2FWz8OassQUzTo/
 8qGWTO77LKHGUg+suzKKfZh6eYj2NMMb04FbL9WLJBYuNBqd1yHhurqg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] bison: patch CVE-2026-56389
Date: Sat, 15 Aug 2026 21:08:09 +0200
Message-ID: <20260815190810.2980859-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 19:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243498

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 6c99410bd7f0bc4e2ed41ef5afe7d6b5fcb99837)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../bison/bison/CVE-2026-56389.patch          | 56 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56389.patch

diff --git a/meta/recipes-devtools/bison/bison/CVE-2026-56389.patch b/meta/recipes-devtools/bison/bison/CVE-2026-56389.patch
new file mode 100644
index 00000000000..ac827f6314a
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
index da138e35874..9808a96e993 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -12,6 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://autoconf-2.73.patch \
            file://add-with-bisonlocaledir.patch \
+           file://CVE-2026-56389.patch \
            "
 SRC_URI[sha256sum] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
 

