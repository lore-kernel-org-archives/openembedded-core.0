Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8D7C61DB9
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:00:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15956.1787576451342199007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h0HLVJt3;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso21612395e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576449; x=1788181249; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aiiuUIXLyKbRkg+RqxCcfudTBlPqVPCUHne6Va4dLeE=;
        b=h0HLVJt3AM+NaXbRfgRKlfC60FGrE2fBGU56cDAdOp4iYPcWKD5dTfFx2r3yb5jVs4
         0JBG6FJVJm9CEuDRyi5ZpSZLEPWx3hNTjtAj50SdD46KH7JMoIboGxdFdy4tBYxeQdP1
         vVX7LDcLMVrqsu6Ownd7Kac0lW4PBE1Q9RfSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576449; x=1788181249;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiiuUIXLyKbRkg+RqxCcfudTBlPqVPCUHne6Va4dLeE=;
        b=pPawiGVchBZhbMz04t5AJdJQhtCHdNk0Vtr7nBmIMbu+I2jY7c9/437vGy2dxJbhS1
         sJgKjPZEFaWe0FbYPUUE5xLFPbGRtXHJuPacoXKrrm3nNAcqlOh9L5bTKyb9svOpZ9An
         cAYSM1aQ9GX5im+X9m39w0KEMJVv1ydjU17K8U9FcQRIxht4gYtfdBo+HkHUMfp0XvfD
         NHTvGFr1vJo0550lfITXVliyKW89cT3r7G8PQhsbpk6MznihvUOtTHSTIGDOSlA6bAch
         3LHfqtYRGFeWghNXU+XzZrLry5RPvHSQmuJGZR5xzpE69+ZHmtprm2GoOWuwJCQN0hTz
         AJAA==
X-Gm-Message-State: AFuF++nER04ti41ljsJD2TOCOACnYCLMYdGvGXyEiDgTkN4L0aGkJ+2f
	jHzxLGiGbpnWLWWqTDClBedaFOO94cmOtY2Sr0uyyytJkDgFmFrgyjzpxrBQTtaUQszDh5Urav9
	vgMhXjNk=
X-Gm-Gg: AR+sD12LGkkL8Px540M99hPoBxv0lhaR24UrLmnqhdMglj2gr2z4m27KdAzy8wAHApu
	ooUoR+JmPyhwK1ue87yYJh09l+5DapzWumEeEx1sQUEPTvy5+9Rabo4qmgM687Wzpixjia8rTfV
	Ul+pJ2XMJS2QzSC0fPCX49svGwTJioH1ezTeaFEqdDUEcj5Ki1ym3I6CliFbvPHoTfpA6V09A4O
	7cgt+BAnbNDpz0dhHOa4NwIjmKZ5HBESdrhbMNf0mK4k9PlZ2LgJtIccqZ255orLJggn1zqkU3M
	DpxYyiK8lOIJEfZFfdfC5FrxqrqGez9z72W1V3d6lH2iDcZbVfo9ar7rJnlGuYjftHHrLR0eDw/
	WvRRJV/EYDNKOuHRrRI0pLQF73RR5EfLryTIH5Z37VKnay/FEFqDNhZUJHxfbR5Q/2r3TRwjnKi
	YVv2haFN74lFeLbygfChiOOqopx5T+Fudq0P+VqVuRy0y6Zj8PZLL8yN/KhxxvwvjW4AMXsxiM0
	3k+A6SWpXi5AWHPd+rZzBftgPxi6HAvXIT6KmScos9fesGKa4ve2xRWpwMlkjXz/lAl4fc=
X-Received: by 2002:a05:600c:4f0c:b0:499:80d0:8b73 with SMTP id 5b1f17b1804b1-499b8324cebmr354774115e9.4.1787576448093;
        Mon, 24 Aug 2026 06:00:48 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/19] bison: patch CVE-2026-56389
Date: Mon, 24 Aug 2026 14:59:54 +0200
Message-ID: <917066c3e03cb6f2648c05158cc16aa6cd156737.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244107

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 6c99410bd7f0bc4e2ed41ef5afe7d6b5fcb99837)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
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
index 513d7ec287d..03d3cffe2ae 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -12,6 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://autoconf-2.73.patch \
            file://add-with-bisonlocaledir.patch \
+           file://CVE-2026-56389.patch \
            "
 SRC_URI[sha256sum] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
 

