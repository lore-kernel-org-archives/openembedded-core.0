Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4597ECAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 20:05:15 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.33517.1758139514876966739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PARAb1Pb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77251d7cca6so279805b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758139514; x=1758744314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzBhuVczhIozGkGj1RH7FdP/hoDiwQ1Zjz03vahiqX0=;
        b=PARAb1PbpVBlRc/eBIldoqcsI4w8LbUqYVdlOx5kme8Genm6ltArvLLuq1j+lcpnx2
         F90AGqtgsyLOae2lYhROAVac1EbYSxw5Z+g3rTTmMlJtKmNNkhI9nUFsAylI6JNn+L+2
         a8kULPx56ZQAqq3TK05SNPyqcGWTDOFkFcTVRVpJ3oVMZ6OZnvCZF9qqvi9Ikp/bMkIM
         h/YbocUL3CajjyiJO2nzfyzXgbfkAf5Fk81Czz0kVrakFwVukGlkLuemmdlU0QTOa8fu
         eHNMOZlkepSQQquIjGmJN4ZzJfJ39+F090Etx9ejyT1gfL/HfElp60Yk3hMRMfCTCLQ3
         myCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139514; x=1758744314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzBhuVczhIozGkGj1RH7FdP/hoDiwQ1Zjz03vahiqX0=;
        b=XFzlh2i3FujoKHzaU065ga3Mp4ebOVJ3r0WSL0L47vF/5r0Xo2YF9vJBrdcRm3VCpD
         +sx44Kb37Q6/A1Q/jT9U2u4PGlA/wSrzrz/ly1sg1ZouBLIZcFfLkAKo5MJiJULDCWxE
         Aahcd3WyZ2Be2tUUgtayDo35OPisbc5/WnjPPKzb9KDiTwK345sD9pYMl2TzMmWkJiRN
         xbks9jMdCA/9sApaUiJMUBT5BlAqiuI4VAsxZxmhbVKH5ODtcR4WjDB72k+SBTZ1GlaP
         FoC6RnNPa82olGNgjVHqTUHBK7doGmr5RZZSYENvSSg73q88vR44U6tpNk1mzLBPeM1S
         NJuQ==
X-Gm-Message-State: AOJu0Yx5kkvugc8rbIlvxl9p6glTeS43ZPE+gQDnNaBZDQOFcQzWwrqh
	1h+DZjs2ImsqVjpPUIQsxwWXGjUYc1jiEeVLCn9jD0dDzvdJRXU6NOajuy7N5P2XcBFrwRX8TxN
	UkLz3
X-Gm-Gg: ASbGncvnH6RYsMQl2Ph12/KbZijJBqLmR0PHzIxk1c6wXA521h/j2wwQN4HAarfkgKi
	xvGF0I8cTuHLnP7t+kX1t25IXHMer2oHk0ZXkmj8qQFLTmTLhaVi3ZiQNUqlf/8FFhE4HF8o5yt
	0BckNl7FBnE5+9uhtn80OTT9drMCVF39yL8R71t/VsZb6+uS95PCeNCsZmvg5O6VFQxyHEYVWEo
	nem4sb+Dg3pvbsF6aFFUflIF2OJnzBDOZo86UGcExLtOmn4s/OqvpjWdrndRQg4v7+Sj4ndLZGQ
	fZFBpK+Mi7ZsfuVeVyfKVG3q/26TWPtA5HD6fwzyS5zyjzpDB7yQv3dbHQDtHZqff5w4OcVfKEh
	nl6pQBswsKS/uBThP4ttmGgbmYPl7SaIs
X-Google-Smtp-Source: AGHT+IHUUwzjBb4oUqs8uo8u+il5wgeV1owHtW8EWgm8U0NDRNln8OBG1eUBloiGHwGK4IIyd6sfug==
X-Received: by 2002:a05:6a00:18a2:b0:772:6235:7038 with SMTP id d2e1a72fcca58-77bf72cbc6emr3874366b3a.10.1758139513014;
        Wed, 17 Sep 2025 13:05:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ed6:a4e8:9109:79e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm247452b3a.10.2025.09.17.13.05.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:05:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/8] cups: upgrade 2.4.10 -> 2.4.11
Date: Wed, 17 Sep 2025 13:04:40 -0700
Message-ID: <117a401756a3cf26d1fc0a6694b0c42967e00fec.1758139278.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758139278.git.steve@sakoman.com>
References: <cover.1758139278.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223618

From: Vijay Anusuri <vanusuri@mvista.com>

Removed CVE-2024-47175 patches which is fixed by upgrade
system-cups.slice added to FILES

Changelog
==========

v2.4.11

CUPS 2.4.11 brings several bug fixes regarding IPP response validation, processing PPD values, Web UI support (checkbox support, modifying printers) and others fixes.

Detailed list of changes is available in CHANGES.md

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |   7 +-
 .../cups/0001-use-echo-only-in-init.patch     |   2 +-
 ...-don-t-try-to-run-generated-binaries.patch |   2 +-
 ...-fix-multilib-install-file-conflicts.patch |   6 +-
 .../cups/cups/CVE-2024-47175-1.patch          |  73 -----
 .../cups/cups/CVE-2024-47175-2.patch          | 151 -----------
 .../cups/cups/CVE-2024-47175-3.patch          | 119 ---------
 .../cups/cups/CVE-2024-47175-4.patch          | 249 ------------------
 .../cups/cups/CVE-2024-47175-5.patch          |  40 ---
 .../cups/cups/libexecdir.patch                |   5 +-
 .../cups/{cups_2.4.10.bb => cups_2.4.11.bb}   |   2 +-
 11 files changed, 9 insertions(+), 647 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
 rename meta/recipes-extended/cups/{cups_2.4.10.bb => cups_2.4.11.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 5590eb0fa0..50db18d42a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,11 +15,6 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
-           file://CVE-2024-47175-1.patch \
-           file://CVE-2024-47175-2.patch \
-           file://CVE-2024-47175-3.patch \
-           file://CVE-2024-47175-4.patch \
-           file://CVE-2024-47175-5.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
@@ -101,7 +96,7 @@ do_install () {
 PACKAGES =+ "${PN}-lib ${PN}-libimage ${PN}-webif"
 
 RDEPENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps', '', d)}"
-FILES:${PN} += "${libexecdir}/cups/"
+FILES:${PN} += "${libexecdir}/cups/ ${systemd_system_unitdir}/system-cups.slice"
 
 FILES:${PN}-lib = "${libdir}/libcups.so.*"
 
diff --git a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
index e6bd400779..c0cb7df581 100644
--- a/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
+++ b/meta/recipes-extended/cups/cups/0001-use-echo-only-in-init.patch
@@ -1,4 +1,4 @@
-From ddfe6ed6a89226985e8c9f0751c026aabc0927a0 Mon Sep 17 00:00:00 2001
+From c5f943b1ac6e1c86ae64686e29e178fedf933e96 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Thu, 13 Dec 2012 19:03:52 -0800
 Subject: [PATCH] use echo only in init
diff --git a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
index 75270cb0cb..cf2f1a6747 100644
--- a/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0002-don-t-try-to-run-generated-binaries.patch
@@ -1,4 +1,4 @@
-From ff6c7168c3f26094b3a18298208a28831d1c1fd5 Mon Sep 17 00:00:00 2001
+From da9a313ae5a2d1da683dd58572df0d7a660eb922 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
 Subject: [PATCH] don't try to run generated binaries
diff --git a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
index d49fb8f2c2..31338822e6 100644
--- a/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
+++ b/meta/recipes-extended/cups/cups/0004-cups-fix-multilib-install-file-conflicts.patch
@@ -1,4 +1,4 @@
-From 6e286b582571ffca3f7874076d70eec6fd5713f6 Mon Sep 17 00:00:00 2001
+From 880bad2c6b08afd2e2e303bc3ceea559edbe76d2 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 3 Oct 2018 00:27:11 +0800
 Subject: [PATCH] cups: fix multilib install file conflicts
@@ -15,10 +15,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/conf/cups-files.conf.in b/conf/cups-files.conf.in
-index 93584a1..65b7052 100644
+index f96f745..27d8be9 100644
 --- a/conf/cups-files.conf.in
 +++ b/conf/cups-files.conf.in
-@@ -67,7 +67,7 @@ PageLog @CUPS_LOGDIR@/page_log
+@@ -70,7 +70,7 @@ PageLog @CUPS_LOGDIR@/page_log
  #RequestRoot @CUPS_REQUESTS@
  
  # Location of helper programs...
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
deleted file mode 100644
index 8ec720ea0d..0000000000
--- a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 9939a70b750edd9d05270060cc5cf62ca98cfbe5 Mon Sep 17 00:00:00 2001
-From: Michael R Sweet <msweet@msweet.org>
-Date: Mon, 9 Sep 2024 10:03:10 -0400
-Subject: [PATCH] Mirror IPP Everywhere printer changes from master.
-
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/9939a70b750edd9d05270060cc5cf62ca98cfbe5]
-CVE: CVE-2024-47175
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- cups/ppd-cache.c | 10 +++++-----
- scheduler/ipp.c  |  7 +++++++
- 2 files changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
-index e750fcc..cd2d6cb 100644
---- a/cups/ppd-cache.c
-+++ b/cups/ppd-cache.c
-@@ -3317,10 +3317,10 @@ _ppdCreateFromIPP2(
-   }
-   cupsFilePuts(fp, "\"\n");
- 
--  if ((attr = ippFindAttribute(supported, "printer-more-info", IPP_TAG_URI)) != NULL)
-+  if ((attr = ippFindAttribute(supported, "printer-more-info", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
-     cupsFilePrintf(fp, "*APSupplies: \"%s\"\n", ippGetString(attr, 0, NULL));
- 
--  if ((attr = ippFindAttribute(supported, "printer-charge-info-uri", IPP_TAG_URI)) != NULL)
-+  if ((attr = ippFindAttribute(supported, "printer-charge-info-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
-     cupsFilePrintf(fp, "*cupsChargeInfoURI: \"%s\"\n", ippGetString(attr, 0, NULL));
- 
-   if ((attr = ippFindAttribute(supported, "printer-strings-uri", IPP_TAG_URI)) != NULL)
-@@ -3389,10 +3389,10 @@ _ppdCreateFromIPP2(
-   if (ippGetBoolean(ippFindAttribute(supported, "job-accounting-user-id-supported", IPP_TAG_BOOLEAN), 0))
-     cupsFilePuts(fp, "*cupsJobAccountingUserId: True\n");
- 
--  if ((attr = ippFindAttribute(supported, "printer-privacy-policy-uri", IPP_TAG_URI)) != NULL)
-+  if ((attr = ippFindAttribute(supported, "printer-privacy-policy-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
-     cupsFilePrintf(fp, "*cupsPrivacyURI: \"%s\"\n", ippGetString(attr, 0, NULL));
- 
--  if ((attr = ippFindAttribute(supported, "printer-mandatory-job-attributes", IPP_TAG_KEYWORD)) != NULL)
-+  if ((attr = ippFindAttribute(supported, "printer-mandatory-job-attributes", IPP_TAG_KEYWORD)) != NULL && ippValidateAttribute(attr))
-   {
-     char	prefix = '\"';		// Prefix for string
- 
-@@ -3410,7 +3410,7 @@ _ppdCreateFromIPP2(
-     cupsFilePuts(fp, "\"\n");
-   }
- 
--  if ((attr = ippFindAttribute(supported, "printer-requested-job-attributes", IPP_TAG_KEYWORD)) != NULL)
-+  if ((attr = ippFindAttribute(supported, "printer-requested-job-attributes", IPP_TAG_KEYWORD)) != NULL && ippValidateAttribute(attr))
-   {
-     char	prefix = '\"';		// Prefix for string
- 
-diff --git a/scheduler/ipp.c b/scheduler/ipp.c
-index 37623c5..836e41d 100644
---- a/scheduler/ipp.c
-+++ b/scheduler/ipp.c
-@@ -5417,6 +5417,13 @@ create_local_bg_thread(
-     }
-   }
- 
-+  // Validate response from printer...
-+  if (!ippValidateAttributes(response))
-+  {
-+    cupsdLogMessage(CUPSD_LOG_ERROR, "%s: Printer returned invalid data: %s", printer->name, cupsLastErrorString());
-+    return (NULL);
-+  }
-+
-   // TODO: Grab printer icon file...
-   httpClose(http);
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
deleted file mode 100644
index 11e8209626..0000000000
--- a/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 04bb2af4521b56c1699a2c2431c56c05a7102e69 Mon Sep 17 00:00:00 2001
-From: Michael R Sweet <msweet@msweet.org>
-Date: Mon, 9 Sep 2024 14:05:42 -0400
-Subject: [PATCH] Refactor make-and-model code.
-
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/04bb2af4521b56c1699a2c2431c56c05a7102e69]
-CVE: CVE-2024-47175
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- cups/ppd-cache.c | 103 +++++++++++++++++++++++++++++++++++++++--------
- 1 file changed, 87 insertions(+), 16 deletions(-)
-
-diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
-index cd2d6cb..a4d7403 100644
---- a/cups/ppd-cache.c
-+++ b/cups/ppd-cache.c
-@@ -3197,9 +3197,10 @@ _ppdCreateFromIPP2(
-   ipp_t			*media_col,	/* Media collection */
- 			*media_size;	/* Media size collection */
-   char			make[256],	/* Make and model */
--			*model,		/* Model name */
-+			*mptr,		/* Pointer into make and model */
- 			ppdname[PPD_MAX_NAME];
- 		    			/* PPD keyword */
-+  const char		*model;		/* Model name */
-   int			i, j,		/* Looping vars */
- 			count,		/* Number of values */
- 			bottom,		/* Largest bottom margin */
-@@ -3260,34 +3261,104 @@ _ppdCreateFromIPP2(
-   }
- 
-  /*
--  * Standard stuff for PPD file...
-+  * Get a sanitized make and model...
-   */
- 
--  cupsFilePuts(fp, "*PPD-Adobe: \"4.3\"\n");
--  cupsFilePuts(fp, "*FormatVersion: \"4.3\"\n");
--  cupsFilePrintf(fp, "*FileVersion: \"%d.%d\"\n", CUPS_VERSION_MAJOR, CUPS_VERSION_MINOR);
--  cupsFilePuts(fp, "*LanguageVersion: English\n");
--  cupsFilePuts(fp, "*LanguageEncoding: ISOLatin1\n");
--  cupsFilePuts(fp, "*PSVersion: \"(3010.000) 0\"\n");
--  cupsFilePuts(fp, "*LanguageLevel: \"3\"\n");
--  cupsFilePuts(fp, "*FileSystem: False\n");
--  cupsFilePuts(fp, "*PCFileName: \"ippeve.ppd\"\n");
-+  if ((attr = ippFindAttribute(supported, "printer-make-and-model", IPP_TAG_TEXT)) != NULL && ippValidateAttribute(attr))
-+  {
-+   /*
-+    * Sanitize the model name to only contain PPD-safe characters.
-+    */
- 
--  if ((attr = ippFindAttribute(supported, "printer-make-and-model", IPP_TAG_TEXT)) != NULL)
-     strlcpy(make, ippGetString(attr, 0, NULL), sizeof(make));
-+
-+    for (mptr = make; *mptr; mptr ++)
-+    {
-+      if (*mptr < ' ' || *mptr >= 127 || *mptr == '\"')
-+      {
-+       /*
-+	* Truncate the make and model on the first bad character...
-+	*/
-+
-+	*mptr = '\0';
-+	break;
-+      }
-+    }
-+
-+    while (mptr > make)
-+    {
-+     /*
-+      * Strip trailing whitespace...
-+      */
-+
-+      mptr --;
-+      if (*mptr == ' ')
-+	*mptr = '\0';
-+    }
-+
-+    if (!make[0])
-+    {
-+     /*
-+      * Use a default make and model if nothing remains...
-+      */
-+
-+      strlcpy(make, "Unknown", sizeof(make));
-+    }
-+  }
-   else
--    strlcpy(make, "Unknown Printer", sizeof(make));
-+  {
-+   /*
-+    * Use a default make and model...
-+    */
-+
-+    strlcpy(make, "Unknown", sizeof(make));
-+  }
- 
-   if (!_cups_strncasecmp(make, "Hewlett Packard ", 16) || !_cups_strncasecmp(make, "Hewlett-Packard ", 16))
-   {
-+   /*
-+    * Normalize HP printer make and model...
-+    */
-+
-     model = make + 16;
-     strlcpy(make, "HP", sizeof(make));
-+
-+    if (!_cups_strncasecmp(model, "HP ", 3))
-+      model += 3;
-+  }
-+  else if ((mptr = strchr(make, ' ')) != NULL)
-+  {
-+   /*
-+    * Separate "MAKE MODEL"...
-+    */
-+
-+    while (*mptr && *mptr == ' ')
-+      *mptr++ = '\0';
-+
-+    model = mptr;
-   }
--  else if ((model = strchr(make, ' ')) != NULL)
--    *model++ = '\0';
-   else
--    model = make;
-+  {
-+   /*
-+    * No separate model name...
-+    */
- 
-+    model = "Printer";
-+  }
-+
-+ /*
-+  * Standard stuff for PPD file...
-+  */
-+
-+  cupsFilePuts(fp, "*PPD-Adobe: \"4.3\"\n");
-+  cupsFilePuts(fp, "*FormatVersion: \"4.3\"\n");
-+  cupsFilePrintf(fp, "*FileVersion: \"%d.%d\"\n", CUPS_VERSION_MAJOR, CUPS_VERSION_MINOR);
-+  cupsFilePuts(fp, "*LanguageVersion: English\n");
-+  cupsFilePuts(fp, "*LanguageEncoding: ISOLatin1\n");
-+  cupsFilePuts(fp, "*PSVersion: \"(3010.000) 0\"\n");
-+  cupsFilePuts(fp, "*LanguageLevel: \"3\"\n");
-+  cupsFilePuts(fp, "*FileSystem: False\n");
-+  cupsFilePuts(fp, "*PCFileName: \"ippeve.ppd\"\n");
-   cupsFilePrintf(fp, "*Manufacturer: \"%s\"\n", make);
-   cupsFilePrintf(fp, "*ModelName: \"%s\"\n", model);
-   cupsFilePrintf(fp, "*Product: \"(%s)\"\n", model);
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
deleted file mode 100644
index e7d012fb8a..0000000000
--- a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From e0630cd18f76340d302000f2bf6516e99602b844 Mon Sep 17 00:00:00 2001
-From: Michael R Sweet <msweet@msweet.org>
-Date: Mon, 9 Sep 2024 15:59:57 -0400
-Subject: [PATCH] PPDize preset and template names.
-
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/e0630cd18f76340d302000f2bf6516e99602b844]
-CVE: CVE-2024-47175
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- cups/ppd-cache.c | 33 ++++++++++++++++++++++++---------
- 1 file changed, 24 insertions(+), 9 deletions(-)
-
-diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
-index a4d7403..53c22be 100644
---- a/cups/ppd-cache.c
-+++ b/cups/ppd-cache.c
-@@ -4976,12 +4976,14 @@ _ppdCreateFromIPP2(
- 
-       cupsArrayAdd(templates, (void *)keyword);
- 
-+      pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
-+
-       snprintf(msgid, sizeof(msgid), "finishing-template.%s", keyword);
-       if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
- 	if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
- 	  msgstr = keyword;
- 
--      cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", keyword);
-+      cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", ppdname);
-       for (finishing_attr = ippFirstAttribute(finishing_col); finishing_attr; finishing_attr = ippNextAttribute(finishing_col))
-       {
-         if (ippGetValueTag(finishing_attr) == IPP_TAG_BEGIN_COLLECTION)
-@@ -4994,7 +4996,7 @@ _ppdCreateFromIPP2(
- 	}
-       }
-       cupsFilePuts(fp, "\"\n");
--      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lang->language, keyword, msgstr);
-+      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lang->language, ppdname, msgstr);
-       cupsFilePuts(fp, "*End\n");
-     }
- 
-@@ -5040,7 +5042,8 @@ _ppdCreateFromIPP2(
-       if (!preset || !preset_name)
-         continue;
- 
--      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", preset_name);
-+      pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
-+      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", ppdname);
-       for (member = ippFirstAttribute(preset); member; member = ippNextAttribute(preset))
-       {
-         member_name = ippGetName(member);
-@@ -5081,7 +5084,10 @@ _ppdCreateFromIPP2(
-             fin_col = ippGetCollection(member, i);
- 
-             if ((keyword = ippGetString(ippFindAttribute(fin_col, "finishing-template", IPP_TAG_ZERO), 0, NULL)) != NULL)
--              cupsFilePrintf(fp, "*cupsFinishingTemplate %s\n", keyword);
-+            {
-+              pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
-+              cupsFilePrintf(fp, "*cupsFinishingTemplate %s\n", ppdname);
-+            }
-           }
-         }
-         else if (!strcmp(member_name, "media"))
-@@ -5108,13 +5114,13 @@ _ppdCreateFromIPP2(
-           if ((keyword = ippGetString(ippFindAttribute(media_col, "media-source", IPP_TAG_ZERO), 0, NULL)) != NULL)
-           {
-             pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
--            cupsFilePrintf(fp, "*InputSlot %s\n", keyword);
-+            cupsFilePrintf(fp, "*InputSlot %s\n", ppdname);
- 	  }
- 
-           if ((keyword = ippGetString(ippFindAttribute(media_col, "media-type", IPP_TAG_ZERO), 0, NULL)) != NULL)
-           {
-             pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
--            cupsFilePrintf(fp, "*MediaType %s\n", keyword);
-+            cupsFilePrintf(fp, "*MediaType %s\n", ppdname);
- 	  }
-         }
-         else if (!strcmp(member_name, "print-quality"))
-@@ -5160,7 +5166,10 @@ _ppdCreateFromIPP2(
-       cupsFilePuts(fp, "\"\n*End\n");
- 
-       if ((localized_name = _cupsMessageLookup(strings, preset_name)) != preset_name)
--        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n", lang->language, preset_name, localized_name);
-+      {
-+        pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
-+        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n", lang->language, ppdname, localized_name);
-+      }
-     }
-   }
- 
-@@ -5544,7 +5553,7 @@ pwg_ppdize_name(const char *ipp,	/* I - IPP keyword */
- 	*end;				/* End of name buffer */
- 
- 
--  if (!ipp)
-+  if (!ipp || !_cups_isalnum(*ipp))
-   {
-     *name = '\0';
-     return;
-@@ -5559,8 +5568,14 @@ pwg_ppdize_name(const char *ipp,	/* I - IPP keyword */
-       ipp ++;
-       *ptr++ = (char)toupper(*ipp++ & 255);
-     }
--    else
-+    else if (*ipp == '_' || *ipp == '.' || *ipp == '-' || _cups_isalnum(*ipp))
-+    {
-       *ptr++ = *ipp++;
-+    }
-+    else
-+    {
-+      ipp ++;
-+    }
-   }
- 
-   *ptr = '\0';
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
deleted file mode 100644
index 7665513485..0000000000
--- a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
+++ /dev/null
@@ -1,249 +0,0 @@
-From 1e6ca5913eceee906038bc04cc7ccfbe2923bdfd Mon Sep 17 00:00:00 2001
-From: Michael R Sweet <msweet@msweet.org>
-Date: Mon, 23 Sep 2024 09:36:39 -0400
-Subject: [PATCH] Quote PPD localized strings.
-
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/1e6ca5913eceee906038bc04cc7ccfbe2923bdfd]
-CVE: CVE-2024-47175
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- cups/ppd-cache.c | 93 +++++++++++++++++++++++++++---------------------
- 1 file changed, 53 insertions(+), 40 deletions(-)
-
-diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
-index 53c22be..f425ac0 100644
---- a/cups/ppd-cache.c
-+++ b/cups/ppd-cache.c
-@@ -32,6 +32,7 @@
- static int	cups_connect(http_t **http, const char *url, char *resource, size_t ressize);
- static int	cups_get_url(http_t **http, const char *url, char *name, size_t namesize);
- static const char *ppd_inputslot_for_keyword(_ppd_cache_t *pc, const char *keyword);
-+static void	ppd_put_string(cups_file_t *fp, cups_lang_t *lang, cups_array_t *strings, const char *ppd_option, const char *ppd_choice, const char *pwg_msgid);
- static void	pwg_add_finishing(cups_array_t *finishings, ipp_finishings_t template, const char *name, const char *value);
- static void	pwg_add_message(cups_array_t *a, const char *msg, const char *str);
- static int	pwg_compare_finishings(_pwg_finishings_t *a, _pwg_finishings_t *b);
-@@ -3394,7 +3395,7 @@ _ppdCreateFromIPP2(
-   if ((attr = ippFindAttribute(supported, "printer-charge-info-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
-     cupsFilePrintf(fp, "*cupsChargeInfoURI: \"%s\"\n", ippGetString(attr, 0, NULL));
- 
--  if ((attr = ippFindAttribute(supported, "printer-strings-uri", IPP_TAG_URI)) != NULL)
-+  if ((attr = ippFindAttribute(supported, "printer-strings-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
-   {
-     http_t	*http = NULL;		/* Connection to printer */
-     char	stringsfile[1024];	/* Temporary strings file */
-@@ -3438,7 +3439,7 @@ _ppdCreateFromIPP2(
- 
- 	  response = cupsDoRequest(http, request, resource);
- 
--	  if ((attr = ippFindAttribute(response, "printer-strings-uri", IPP_TAG_URI)) != NULL)
-+	  if ((attr = ippFindAttribute(response, "printer-strings-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
- 	    cupsFilePrintf(fp, "*cupsStringsURI %s: \"%s\"\n", keyword, ippGetString(attr, 0, NULL));
- 
- 	  ippDelete(response);
-@@ -4044,18 +4045,16 @@ _ppdCreateFromIPP2(
- 	cupsFilePrintf(fp, "*DefaultInputSlot: %s\n", ppdname);
- 
-       for (j = 0; j < (int)(sizeof(sources) / sizeof(sources[0])); j ++)
-+      {
-         if (!strcmp(sources[j], keyword))
- 	{
- 	  snprintf(msgid, sizeof(msgid), "media-source.%s", keyword);
- 
--	  if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
--	    if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
--	      msgstr = keyword;
--
- 	  cupsFilePrintf(fp, "*InputSlot %s: \"<</MediaPosition %d>>setpagedevice\"\n", ppdname, j);
--	  cupsFilePrintf(fp, "*%s.InputSlot %s/%s: \"\"\n", lang->language, ppdname, msgstr);
-+	  ppd_put_string(fp, lang, strings, "InputSlot", ppdname, msgid);
- 	  break;
- 	}
-+      }
-     }
-     cupsFilePuts(fp, "*CloseUI: *InputSlot\n");
-   }
-@@ -4081,12 +4080,9 @@ _ppdCreateFromIPP2(
-       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
- 
-       snprintf(msgid, sizeof(msgid), "media-type.%s", keyword);
--      if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
--	if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
--	  msgstr = keyword;
- 
-       cupsFilePrintf(fp, "*MediaType %s: \"<</MediaType(%s)>>setpagedevice\"\n", ppdname, ppdname);
--      cupsFilePrintf(fp, "*%s.MediaType %s/%s: \"\"\n", lang->language, ppdname, msgstr);
-+      ppd_put_string(fp, lang, strings, "MediaType", ppdname, msgid);
-     }
-     cupsFilePuts(fp, "*CloseUI: *MediaType\n");
-   }
-@@ -4547,12 +4543,9 @@ _ppdCreateFromIPP2(
-       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
- 
-       snprintf(msgid, sizeof(msgid), "output-bin.%s", keyword);
--      if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
--	if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
--	  msgstr = keyword;
- 
-       cupsFilePrintf(fp, "*OutputBin %s: \"\"\n", ppdname);
--      cupsFilePrintf(fp, "*%s.OutputBin %s/%s: \"\"\n", lang->language, ppdname, msgstr);
-+      ppd_put_string(fp, lang, strings, "OutputBin", ppdname, msgid);
- 
-       if ((tray_ptr = ippGetOctetString(trays, i, &tray_len)) != NULL)
-       {
-@@ -4671,9 +4664,6 @@ _ppdCreateFromIPP2(
-         cupsArrayAdd(names, (char *)keyword);
- 
- 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
--	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
--	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
--	    msgstr = keyword;
- 
-         if (value >= IPP_FINISHINGS_NONE && value <= IPP_FINISHINGS_LAMINATE)
-           ppd_keyword = base_keywords[value - IPP_FINISHINGS_NONE];
-@@ -4688,7 +4678,7 @@ _ppdCreateFromIPP2(
-           continue;
- 
- 	cupsFilePrintf(fp, "*StapleLocation %s: \"\"\n", ppd_keyword);
--	cupsFilePrintf(fp, "*%s.StapleLocation %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
-+	ppd_put_string(fp, lang, strings, "StapleLocation", ppd_keyword, msgid);
- 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*StapleLocation %s\"\n", value, keyword, ppd_keyword);
-       }
- 
-@@ -4751,9 +4741,6 @@ _ppdCreateFromIPP2(
-         cupsArrayAdd(names, (char *)keyword);
- 
- 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
--	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
--	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
--	    msgstr = keyword;
- 
-         if (value >= IPP_FINISHINGS_NONE && value <= IPP_FINISHINGS_LAMINATE)
-           ppd_keyword = base_keywords[value - IPP_FINISHINGS_NONE];
-@@ -4768,7 +4755,7 @@ _ppdCreateFromIPP2(
-           continue;
- 
- 	cupsFilePrintf(fp, "*FoldType %s: \"\"\n", ppd_keyword);
--	cupsFilePrintf(fp, "*%s.FoldType %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
-+	ppd_put_string(fp, lang, strings, "FoldType", ppd_keyword, msgid);
- 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*FoldType %s\"\n", value, keyword, ppd_keyword);
-       }
- 
-@@ -4839,9 +4826,6 @@ _ppdCreateFromIPP2(
-         cupsArrayAdd(names, (char *)keyword);
- 
- 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
--	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
--	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
--	    msgstr = keyword;
- 
-         if (value >= IPP_FINISHINGS_NONE && value <= IPP_FINISHINGS_LAMINATE)
-           ppd_keyword = base_keywords[value - IPP_FINISHINGS_NONE];
-@@ -4856,7 +4840,7 @@ _ppdCreateFromIPP2(
-           continue;
- 
- 	cupsFilePrintf(fp, "*PunchMedia %s: \"\"\n", ppd_keyword);
--	cupsFilePrintf(fp, "*%s.PunchMedia %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
-+	ppd_put_string(fp, lang, strings, "PunchMedia", ppd_keyword, msgid);
- 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*PunchMedia %s\"\n", value, keyword, ppd_keyword);
-       }
- 
-@@ -4927,9 +4911,6 @@ _ppdCreateFromIPP2(
-         cupsArrayAdd(names, (char *)keyword);
- 
- 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
--	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
--	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
--	    msgstr = keyword;
- 
-         if (value == IPP_FINISHINGS_TRIM)
-           ppd_keyword = "Auto";
-@@ -4937,7 +4918,7 @@ _ppdCreateFromIPP2(
- 	  ppd_keyword = trim_keywords[value - IPP_FINISHINGS_TRIM_AFTER_PAGES];
- 
- 	cupsFilePrintf(fp, "*CutMedia %s: \"\"\n", ppd_keyword);
--	cupsFilePrintf(fp, "*%s.CutMedia %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
-+	ppd_put_string(fp, lang, strings, "CutMedia", ppd_keyword, msgid);
- 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*CutMedia %s\"\n", value, keyword, ppd_keyword);
-       }
- 
-@@ -4979,9 +4960,6 @@ _ppdCreateFromIPP2(
-       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
- 
-       snprintf(msgid, sizeof(msgid), "finishing-template.%s", keyword);
--      if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
--	if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
--	  msgstr = keyword;
- 
-       cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", ppdname);
-       for (finishing_attr = ippFirstAttribute(finishing_col); finishing_attr; finishing_attr = ippNextAttribute(finishing_col))
-@@ -4996,7 +4974,7 @@ _ppdCreateFromIPP2(
- 	}
-       }
-       cupsFilePuts(fp, "\"\n");
--      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lang->language, ppdname, msgstr);
-+      ppd_put_string(fp, lang, strings, "cupsFinishingTemplate", ppdname, msgid);
-       cupsFilePuts(fp, "*End\n");
-     }
- 
-@@ -5165,11 +5143,9 @@ _ppdCreateFromIPP2(
- 
-       cupsFilePuts(fp, "\"\n*End\n");
- 
--      if ((localized_name = _cupsMessageLookup(strings, preset_name)) != preset_name)
--      {
--        pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
--        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n", lang->language, ppdname, localized_name);
--      }
-+      snprintf(msgid, sizeof(msgid), "preset-name.%s", preset_name);
-+      pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
-+      ppd_put_string(fp, lang, strings, "APPrinterPreset", ppdname, msgid);
-     }
-   }
- 
-@@ -5440,6 +5416,43 @@ cups_get_url(http_t     **http,		/* IO - Current HTTP connection */
- }
- 
- 
-+/*
-+ * 'ppd_put_strings()' - Write localization attributes to a PPD file.
-+ */
-+
-+static void
-+ppd_put_string(cups_file_t  *fp,	/* I - PPD file */
-+               cups_lang_t  *lang,	/* I - Language */
-+               cups_array_t *strings,	/* I - Strings */
-+	       const char   *ppd_option,/* I - PPD option */
-+	       const char   *ppd_choice,/* I - PPD choice */
-+	       const char   *pwg_msgid)	/* I - PWG message ID */
-+{
-+  const char	*text;			/* Localized text */
-+
-+
-+  if ((text = _cupsLangString(lang, pwg_msgid)) == pwg_msgid || !strcmp(pwg_msgid, text))
-+  {
-+    if ((text = _cupsMessageLookup(strings, pwg_msgid)) == pwg_msgid)
-+      return;
-+  }
-+
-+  // Add the first line of localized text...
-+  cupsFilePrintf(fp, "*%s.%s %s/", lang->language, ppd_option, ppd_choice);
-+  while (*text && *text != '\n')
-+  {
-+    // Escape ":" and "<"...
-+    if (*text == ':' || *text == '<')
-+      cupsFilePrintf(fp, "<%02X>", *text);
-+    else
-+      cupsFilePutChar(fp, *text);
-+
-+    text ++;
-+  }
-+  cupsFilePuts(fp, ": \"\"\n");
-+}
-+
-+
- /*
-  * 'pwg_add_finishing()' - Add a finishings value.
-  */
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
deleted file mode 100644
index 77a30857e2..0000000000
--- a/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2abe1ba8a66864aa82cd9836b37e57103b8e1a3b Mon Sep 17 00:00:00 2001
-From: Michael R Sweet <msweet@msweet.org>
-Date: Mon, 23 Sep 2024 10:11:31 -0400
-Subject: [PATCH] Fix warnings for unused vars.
-
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2abe1ba8a66864aa82cd9836b37e57103b8e1a3b]
-CVE: CVE-2024-47175
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- cups/ppd-cache.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
-index f425ac0..d2533b7 100644
---- a/cups/ppd-cache.c
-+++ b/cups/ppd-cache.c
-@@ -3223,8 +3223,7 @@ _ppdCreateFromIPP2(
-   int			have_qdraft = 0,/* Have draft quality? */
- 			have_qhigh = 0;	/* Have high quality? */
-   char			msgid[256];	/* Message identifier (attr.value) */
--  const char		*keyword,	/* Keyword value */
--			*msgstr;	/* Localized string */
-+  const char		*keyword;	/* Keyword value */
-   cups_array_t		*strings = NULL;/* Printer strings file */
-   struct lconv		*loc = localeconv();
- 					/* Locale data */
-@@ -5010,9 +5009,8 @@ _ppdCreateFromIPP2(
-     {
-       ipp_t	*preset = ippGetCollection(attr, i);
- 					/* Preset collection */
--      const char *preset_name = ippGetString(ippFindAttribute(preset, "preset-name", IPP_TAG_ZERO), 0, NULL),
-+      const char *preset_name = ippGetString(ippFindAttribute(preset, "preset-name", IPP_TAG_ZERO), 0, NULL);
- 					/* Preset name */
--		*localized_name;	/* Localized preset name */
-       ipp_attribute_t *member;		/* Member attribute in preset */
-       const char *member_name;		/* Member attribute name */
-       char      	member_value[256];	/* Member attribute value */
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/cups/cups/libexecdir.patch b/meta/recipes-extended/cups/cups/libexecdir.patch
index 7ccad94f0f..493c7970ea 100644
--- a/meta/recipes-extended/cups/cups/libexecdir.patch
+++ b/meta/recipes-extended/cups/cups/libexecdir.patch
@@ -1,4 +1,4 @@
-From 1724f7bcdbcfdb445778f8a2e530c5c094c18c10 Mon Sep 17 00:00:00 2001
+From 4ae7ad87aa022f5128be222dffbf0c50ec6e846e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 13 Jul 2021 12:56:30 +0100
 Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
@@ -6,13 +6,12 @@ Subject: [PATCH] Use $libexecdir instead of hardcoding $prefix/lib as this
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  config-scripts/cups-directories.m4 | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/config-scripts/cups-directories.m4 b/config-scripts/cups-directories.m4
-index 2033d47..230166e 100644
+index 069ee7b..2f67e5b 100644
 --- a/config-scripts/cups-directories.m4
 +++ b/config-scripts/cups-directories.m4
 @@ -239,7 +239,7 @@ AC_SUBST([CUPS_REQUESTS])
diff --git a/meta/recipes-extended/cups/cups_2.4.10.bb b/meta/recipes-extended/cups/cups_2.4.11.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.10.bb
rename to meta/recipes-extended/cups/cups_2.4.11.bb
index e16ad47cf5..71568295cb 100644
--- a/meta/recipes-extended/cups/cups_2.4.10.bb
+++ b/meta/recipes-extended/cups/cups_2.4.11.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "d75757c2bc0f7a28b02ee4d52ca9e4b1aa1ba2affe16b985854f5336940e5ad7"
+SRC_URI[sha256sum] = "9a88fe1da3a29a917c3fc67ce6eb3178399d68e1a548c6d86c70d9b13651fd71"
-- 
2.43.0


