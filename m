Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113D5C61DCA
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18286.1787652443142539154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=F1IzGb53;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so2335370f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652441; x=1788257241; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9bgPkmsOxfT49SglkXgLymGc6XuEtiT1UbArxsqk/k=;
        b=F1IzGb53AS39eA2JFqLk3dtznXuozIMfxCeK4FMKfecx8TZa+F6FqXFAe+UP+k91GT
         rBp4D6k6NIc0MEQH+buhp6L7+RzMghHK9NuIbQg+2EPvBoRn+TSD9CATbxKWxT9pl0Jz
         swKuP65kIkLj0AtOnmPKDMOOqusB5CjS0q2Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652441; x=1788257241;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9bgPkmsOxfT49SglkXgLymGc6XuEtiT1UbArxsqk/k=;
        b=WmdSSwjU26A9zjTxnApzv9VRg7/lUyed2GijkzyalDVnaODsFWiFAZoDyEz5AYMCLB
         L9jZuX5MC7fys7zoKZTkidnNHBjBdtNPPjqsDc5zbG0lR66WBhByH+a/mHUvo5zl1A/X
         bBJZ76pC7wVPQXjQDCXBsqLTPWGzLhgZEGTPwmnAPdfMh1cnTKOpyqg/nTQi80Qd6tAZ
         S0MgUDXOB8+hnG/eNJ8i1nPCV6uxUZPq1sYMoZ1S9BxT1E4NYxRxS86C2AjD8KEWVVIb
         xwj++rdDt9u3lPeRSVR37V0y9svsQiK5d0sSb/LQXTrQMsSXB81RXm2BoMM/bqcC/AMl
         ekQQ==
X-Gm-Message-State: AFuF++kNkThuAwO4JXTr2sKjwKwwbEy0/5GYT0nys1FVNIiz5a+lYhy9
	sFAAdd/PrTqm55o4de6QvJ2K64pmvNP20xtkTR57SVYlAbfO9nsE2uuewoVhftZNpUtVhI933De
	JkdAz9EE=
X-Gm-Gg: AR+sD11ojCI81mWJoi7ZjKcux5HTqHF8ih3ZwOPhkBVm6YoUti2/sCoUIl/riESCNGE
	xyKwN9qX45mEmN1xwgfkVIvoGOT3OBKuaJshjExAhEnd/KFohOVuFpfRZ6tpv8/dKem5BkyskZV
	o3AHlW+oZdzDzGBiMFys9T7bvGLGQCXiN2NGQrY4mcgk77L7iHz3PhcVeE2UbaBUZmywEbtRl8w
	ArPicYsYqZHs2ULWbatbaEDouDLQfrZj6zKTPERQ5wMjErTY1TTta3or1bf4vLwHv6POa8JYam6
	1J4EIlpYKlTwb+SQXTtqWhJr0UowMpuTs+RnIX8xYu/27GH9SFR80DE++0xC33SSObzDqocetrr
	PUIjBEyVHT4PtlurP4dH0AW8+EaVDQGNwbGp0TNUUt1WoMuFxhRYuo14yCGijAcv/yf25+ueUs3
	ys/3p+NkiKgoq9hkxkPG0qOX/dqUymlvJOAtTOSjNpP4udenSM/NDQf0PyKe9R8Va38376+WY+P
	hMNfgHYd0fwnThWFgJ561vlqZ2tqIdWdw/rx7274snqlV/SDoccIaKm8gMfcyR1TkdNKt0=
X-Received: by 2002:a05:6000:22c4:b0:481:568e:11b5 with SMTP id ffacd0b85a97d-482c8107859mr27980501f8f.5.1787652441198;
        Tue, 25 Aug 2026 03:07:21 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/11] bison: patch CVE-2026-56389
Date: Tue, 25 Aug 2026 12:06:48 +0200
Message-ID: <1f3e800a68de0c053e95eed781fbaab567912c06.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244224

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
 

