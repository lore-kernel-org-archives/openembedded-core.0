Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EC0CFA74C
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 06:44:32 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.16351.1728024267884578128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 23:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=c9+zEslU;
 spf=pass (domain: mvista.com, ip: 209.85.160.46, mailfrom: vanusuri@mvista.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-287c5745a9bso111641fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 23:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1728024266; x=1728629066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LsFoxaHEncCJgweBrc1s9hZh8tynpnJ9AvCwOTcbws=;
        b=c9+zEslUJc2UhxicwkaVXSA4qLDB/zejaMLf15ne8PZHXFZDgfMGWErTXmPsLvYQC2
         zFPpsjsGz9XKRwGt3/Pj1HrJrb+cOgVQiEzct+fpkOHtKDdfkOUioS+XF6cPsnm+11bH
         AG85MUu+BxLEVYdjmj5gzO6Mcp3oZJ3877eHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728024266; x=1728629066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LsFoxaHEncCJgweBrc1s9hZh8tynpnJ9AvCwOTcbws=;
        b=a8tlD41ayTAAkbH3wNU/6NujLhLcHeeFGMqSDeDnWkfs7sSXXaUaK7vMdhBiMQQ0Or
         xNxyuyg9IFNqk3hWEHuiJFX+c3JmVOdmXLoi36tMwlo6wppNS1Ep8CZy3LP4Kc9/ITNw
         GOIwYvokHEWVO7Qr6ELHjtuatn3F5DX0zmpg2JHTSGOdV4CPR2bvw+na8WDgguOU+X/Y
         IEDtwxDLEys5OrXLEaMBb17LMfCANHZwZ7OeQlz+JRNkAF5Uo9EeNzy3+9Qz/frnozXA
         URBQbGLD4g5nmu4LX++ph7maraUWE2yQLvQL4O/Rd5DsT2Ycib1mIy2NBM/z/LktDr6U
         ThDA==
X-Gm-Message-State: AOJu0YwHTQL+AKHhdYij8re1lWGeKck1TXI6UXHVoO6G4QMXqc1lp+pH
	FctV0M08RA7mD9dq2x2zgdt3IIhGgPPAQ/ZONqRvliNJ4kQO2VT85ihAiDbxxYkniQvmZsl/EvJ
	4
X-Google-Smtp-Source: AGHT+IEIIYkxoRV1u2sBoNnE6URwghR9sZ2QPepgUKMXKEMotIA5Pjsdhuslfxrpwt6MDx97RPMGDA==
X-Received: by 2002:a05:687c:2bcb:b0:264:9161:82e8 with SMTP id 586e51a60fabf-287c231cb8fmr995096fac.41.1728024265786;
        Thu, 03 Oct 2024 23:44:25 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882e:8443:ab7a:a2b4:44ee:d1cd])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-287aba1efafsm1005105fac.30.2024.10.03.23.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 23:44:24 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] cups: Backport fix for CVE-2024-47175
Date: Fri,  4 Oct 2024 12:14:10 +0530
Message-Id: <20241004064410.1246006-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 06:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205223

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://github.com/OpenPrinting/cups/commit/9939a70b750edd9d05270060cc5cf62ca98cfbe5
&
https://github.com/OpenPrinting/cups/commit/04bb2af4521b56c1699a2c2431c56c05a7102e69
&
https://github.com/OpenPrinting/cups/commit/e0630cd18f76340d302000f2bf6516e99602b844
&
https://github.com/OpenPrinting/cups/commit/1e6ca5913eceee906038bc04cc7ccfbe2923bdfd
& https://github.com/OpenPrinting/cups/commit/2abe1ba8a66864aa82cd9836b37e57103b8e1a3b

Reference: https://security-tracker.debian.org/tracker/CVE-2024-47175

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/cups/cups.inc           |   5 +
 .../cups/cups/CVE-2024-47175-1.patch          |  73 +++++
 .../cups/cups/CVE-2024-47175-2.patch          | 148 +++++++++++
 .../cups/cups/CVE-2024-47175-3.patch          | 116 ++++++++
 .../cups/cups/CVE-2024-47175-4.patch          | 249 ++++++++++++++++++
 .../cups/cups/CVE-2024-47175-5.patch          |  37 +++
 6 files changed, 628 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 6d5cf3b588..b87f9dee13 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,11 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
 	   file://CVE-2023-32360.patch \
 	   file://CVE-2023-4504.patch \
 	   file://CVE-2024-35235.patch \
+	   file://CVE-2024-47175-1.patch \
+	   file://CVE-2024-47175-2.patch \
+	   file://CVE-2024-47175-3.patch \
+	   file://CVE-2024-47175-4.patch \
+	   file://CVE-2024-47175-5.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
new file mode 100644
index 0000000000..14481271d1
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
@@ -0,0 +1,73 @@
+From 9939a70b750edd9d05270060cc5cf62ca98cfbe5 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 9 Sep 2024 10:03:10 -0400
+Subject: [PATCH] Mirror IPP Everywhere printer changes from master.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/9939a70b750edd9d05270060cc5cf62ca98cfbe5]
+CVE: CVE-2024-47175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/ppd-cache.c | 10 +++++-----
+ scheduler/ipp.c  |  7 +++++++
+ 2 files changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index 8861813..88b27e1 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -3198,10 +3198,10 @@ _ppdCreateFromIPP2(
+   }
+   cupsFilePuts(fp, "\"\n");
+ 
+-  if ((attr = ippFindAttribute(supported, "printer-more-info", IPP_TAG_URI)) != NULL)
++  if ((attr = ippFindAttribute(supported, "printer-more-info", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
+     cupsFilePrintf(fp, "*APSupplies: \"%s\"\n", ippGetString(attr, 0, NULL));
+ 
+-  if ((attr = ippFindAttribute(supported, "printer-charge-info-uri", IPP_TAG_URI)) != NULL)
++  if ((attr = ippFindAttribute(supported, "printer-charge-info-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
+     cupsFilePrintf(fp, "*cupsChargeInfoURI: \"%s\"\n", ippGetString(attr, 0, NULL));
+ 
+   if ((attr = ippFindAttribute(supported, "printer-strings-uri", IPP_TAG_URI)) != NULL)
+@@ -3270,10 +3270,10 @@ _ppdCreateFromIPP2(
+   if (ippGetBoolean(ippFindAttribute(supported, "job-accounting-user-id-supported", IPP_TAG_BOOLEAN), 0))
+     cupsFilePuts(fp, "*cupsJobAccountingUserId: True\n");
+ 
+-  if ((attr = ippFindAttribute(supported, "printer-privacy-policy-uri", IPP_TAG_URI)) != NULL)
++  if ((attr = ippFindAttribute(supported, "printer-privacy-policy-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
+     cupsFilePrintf(fp, "*cupsPrivacyURI: \"%s\"\n", ippGetString(attr, 0, NULL));
+ 
+-  if ((attr = ippFindAttribute(supported, "printer-mandatory-job-attributes", IPP_TAG_KEYWORD)) != NULL)
++  if ((attr = ippFindAttribute(supported, "printer-mandatory-job-attributes", IPP_TAG_KEYWORD)) != NULL && ippValidateAttribute(attr))
+   {
+     char	prefix = '\"';		// Prefix for string
+ 
+@@ -3291,7 +3291,7 @@ _ppdCreateFromIPP2(
+     cupsFilePuts(fp, "\"\n");
+   }
+ 
+-  if ((attr = ippFindAttribute(supported, "printer-requested-job-attributes", IPP_TAG_KEYWORD)) != NULL)
++  if ((attr = ippFindAttribute(supported, "printer-requested-job-attributes", IPP_TAG_KEYWORD)) != NULL && ippValidateAttribute(attr))
+   {
+     char	prefix = '\"';		// Prefix for string
+ 
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 14cadb0..729f5c4 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -5361,6 +5361,13 @@ create_local_bg_thread(
+     cupsdLogMessage(CUPSD_LOG_DEBUG, "%s: IPP/1.1 Get-Printer-Attributes returned %s (%s)", printer->name, ippErrorString(cupsLastError()), cupsLastErrorString());
+   }
+ 
++  // Validate response from printer...
++  if (!ippValidateAttributes(response))
++  {
++    cupsdLogMessage(CUPSD_LOG_ERROR, "%s: Printer returned invalid data: %s", printer->name, cupsLastErrorString());
++    return (NULL);
++  }
++
+   // TODO: Grab printer icon file...
+   httpClose(http);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
new file mode 100644
index 0000000000..ee58340300
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
@@ -0,0 +1,148 @@
+From 04bb2af4521b56c1699a2c2431c56c05a7102e69 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 9 Sep 2024 14:05:42 -0400
+Subject: [PATCH] Refactor make-and-model code.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/04bb2af4521b56c1699a2c2431c56c05a7102e69]
+CVE: CVE-2024-47175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/ppd-cache.c | 103 +++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 87 insertions(+), 16 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index 8a99a865c..986c64f73 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -3196,9 +3196,10 @@ _ppdCreateFromIPP2(
+   ipp_t			*media_col,	/* Media collection */
+ 			*media_size;	/* Media size collection */
+   char			make[256],	/* Make and model */
+-			*model,		/* Model name */
++			*mptr,		/* Pointer into make and model */
+ 			ppdname[PPD_MAX_NAME];
+ 		    			/* PPD keyword */
++  const char		*model;		/* Model name */
+   int			i, j,		/* Looping vars */
+ 			count,		/* Number of values */
+ 			bottom,		/* Largest bottom margin */
+@@ -3259,34 +3260,104 @@ _ppdCreateFromIPP2(
+   }
+ 
+  /*
+-  * Standard stuff for PPD file...
++  * Get a sanitized make and model...
+   */
+ 
+-  cupsFilePuts(fp, "*PPD-Adobe: \"4.3\"\n");
+-  cupsFilePuts(fp, "*FormatVersion: \"4.3\"\n");
+-  cupsFilePrintf(fp, "*FileVersion: \"%d.%d\"\n", CUPS_VERSION_MAJOR, CUPS_VERSION_MINOR);
+-  cupsFilePuts(fp, "*LanguageVersion: English\n");
+-  cupsFilePuts(fp, "*LanguageEncoding: ISOLatin1\n");
+-  cupsFilePuts(fp, "*PSVersion: \"(3010.000) 0\"\n");
+-  cupsFilePuts(fp, "*LanguageLevel: \"3\"\n");
+-  cupsFilePuts(fp, "*FileSystem: False\n");
+-  cupsFilePuts(fp, "*PCFileName: \"ippeve.ppd\"\n");
++  if ((attr = ippFindAttribute(supported, "printer-make-and-model", IPP_TAG_TEXT)) != NULL && ippValidateAttribute(attr))
++  {
++   /*
++    * Sanitize the model name to only contain PPD-safe characters.
++    */
+ 
+-  if ((attr = ippFindAttribute(supported, "printer-make-and-model", IPP_TAG_TEXT)) != NULL)
+     strlcpy(make, ippGetString(attr, 0, NULL), sizeof(make));
++
++    for (mptr = make; *mptr; mptr ++)
++    {
++      if (*mptr < ' ' || *mptr >= 127 || *mptr == '\"')
++      {
++       /*
++	* Truncate the make and model on the first bad character...
++	*/
++
++	*mptr = '\0';
++	break;
++      }
++    }
++
++    while (mptr > make)
++    {
++     /*
++      * Strip trailing whitespace...
++      */
++
++      mptr --;
++      if (*mptr == ' ')
++	*mptr = '\0';
++    }
++
++    if (!make[0])
++    {
++     /*
++      * Use a default make and model if nothing remains...
++      */
++
++      strlcpy(make, "Unknown", sizeof(make));
++    }
++  }
+   else
+-    strlcpy(make, "Unknown Printer", sizeof(make));
++  {
++   /*
++    * Use a default make and model...
++    */
++
++    strlcpy(make, "Unknown", sizeof(make));
++  }
+ 
+   if (!_cups_strncasecmp(make, "Hewlett Packard ", 16) || !_cups_strncasecmp(make, "Hewlett-Packard ", 16))
+   {
++   /*
++    * Normalize HP printer make and model...
++    */
++
+     model = make + 16;
+     strlcpy(make, "HP", sizeof(make));
++
++    if (!_cups_strncasecmp(model, "HP ", 3))
++      model += 3;
++  }
++  else if ((mptr = strchr(make, ' ')) != NULL)
++  {
++   /*
++    * Separate "MAKE MODEL"...
++    */
++
++    while (*mptr && *mptr == ' ')
++      *mptr++ = '\0';
++
++    model = mptr;
+   }
+-  else if ((model = strchr(make, ' ')) != NULL)
+-    *model++ = '\0';
+   else
+-    model = make;
++  {
++   /*
++    * No separate model name...
++    */
+ 
++    model = "Printer";
++  }
++
++ /*
++  * Standard stuff for PPD file...
++  */
++
++  cupsFilePuts(fp, "*PPD-Adobe: \"4.3\"\n");
++  cupsFilePuts(fp, "*FormatVersion: \"4.3\"\n");
++  cupsFilePrintf(fp, "*FileVersion: \"%d.%d\"\n", CUPS_VERSION_MAJOR, CUPS_VERSION_MINOR);
++  cupsFilePuts(fp, "*LanguageVersion: English\n");
++  cupsFilePuts(fp, "*LanguageEncoding: ISOLatin1\n");
++  cupsFilePuts(fp, "*PSVersion: \"(3010.000) 0\"\n");
++  cupsFilePuts(fp, "*LanguageLevel: \"3\"\n");
++  cupsFilePuts(fp, "*FileSystem: False\n");
++  cupsFilePuts(fp, "*PCFileName: \"ippeve.ppd\"\n");
+   cupsFilePrintf(fp, "*Manufacturer: \"%s\"\n", make);
+   cupsFilePrintf(fp, "*ModelName: \"%s\"\n", model);
+   cupsFilePrintf(fp, "*Product: \"(%s)\"\n", model);
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
new file mode 100644
index 0000000000..2ec4ecc3e2
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
@@ -0,0 +1,116 @@
+From e0630cd18f76340d302000f2bf6516e99602b844 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 9 Sep 2024 15:59:57 -0400
+Subject: [PATCH] PPDize preset and template names.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/e0630cd18f76340d302000f2bf6516e99602b844]
+CVE: CVE-2024-47175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/ppd-cache.c | 33 ++++++++++++++++++++++++---------
+ 1 file changed, 24 insertions(+), 9 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index 986c64f73..18c38d0ee 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -4975,12 +4975,14 @@ _ppdCreateFromIPP2(
+ 
+       cupsArrayAdd(templates, (void *)keyword);
+ 
++      pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
++
+       snprintf(msgid, sizeof(msgid), "finishing-template.%s", keyword);
+       if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+ 	if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+ 	  msgstr = keyword;
+ 
+-      cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", keyword);
++      cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", ppdname);
+       for (finishing_attr = ippFirstAttribute(finishing_col); finishing_attr; finishing_attr = ippNextAttribute(finishing_col))
+       {
+         if (ippGetValueTag(finishing_attr) == IPP_TAG_BEGIN_COLLECTION)
+@@ -4993,7 +4995,7 @@ _ppdCreateFromIPP2(
+ 	}
+       }
+       cupsFilePuts(fp, "\"\n");
+-      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lang->language, keyword, msgstr);
++      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lang->language, ppdname, msgstr);
+       cupsFilePuts(fp, "*End\n");
+     }
+ 
+@@ -5039,7 +5041,8 @@ _ppdCreateFromIPP2(
+       if (!preset || !preset_name)
+         continue;
+ 
+-      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", preset_name);
++      pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
++      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", ppdname);
+       for (member = ippFirstAttribute(preset); member; member = ippNextAttribute(preset))
+       {
+         member_name = ippGetName(member);
+@@ -5080,7 +5083,10 @@ _ppdCreateFromIPP2(
+             fin_col = ippGetCollection(member, i);
+ 
+             if ((keyword = ippGetString(ippFindAttribute(fin_col, "finishing-template", IPP_TAG_ZERO), 0, NULL)) != NULL)
+-              cupsFilePrintf(fp, "*cupsFinishingTemplate %s\n", keyword);
++            {
++              pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
++              cupsFilePrintf(fp, "*cupsFinishingTemplate %s\n", ppdname);
++            }
+           }
+         }
+         else if (!strcmp(member_name, "media"))
+@@ -5107,13 +5113,13 @@ _ppdCreateFromIPP2(
+           if ((keyword = ippGetString(ippFindAttribute(media_col, "media-source", IPP_TAG_ZERO), 0, NULL)) != NULL)
+           {
+             pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
+-            cupsFilePrintf(fp, "*InputSlot %s\n", keyword);
++            cupsFilePrintf(fp, "*InputSlot %s\n", ppdname);
+ 	  }
+ 
+           if ((keyword = ippGetString(ippFindAttribute(media_col, "media-type", IPP_TAG_ZERO), 0, NULL)) != NULL)
+           {
+             pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
+-            cupsFilePrintf(fp, "*MediaType %s\n", keyword);
++            cupsFilePrintf(fp, "*MediaType %s\n", ppdname);
+ 	  }
+         }
+         else if (!strcmp(member_name, "print-quality"))
+@@ -5159,7 +5165,10 @@ _ppdCreateFromIPP2(
+       cupsFilePuts(fp, "\"\n*End\n");
+ 
+       if ((localized_name = _cupsMessageLookup(strings, preset_name)) != preset_name)
+-        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n", lang->language, preset_name, localized_name);
++      {
++        pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
++        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n", lang->language, ppdname, localized_name);
++      }
+     }
+   }
+ 
+@@ -5543,7 +5552,7 @@ pwg_ppdize_name(const char *ipp,	/* I - IPP keyword */
+ 	*end;				/* End of name buffer */
+ 
+ 
+-  if (!ipp)
++  if (!ipp || !_cups_isalnum(*ipp))
+   {
+     *name = '\0';
+     return;
+@@ -5558,8 +5567,14 @@ pwg_ppdize_name(const char *ipp,	/* I - IPP keyword */
+       ipp ++;
+       *ptr++ = (char)toupper(*ipp++ & 255);
+     }
+-    else
++    else if (*ipp == '_' || *ipp == '.' || *ipp == '-' || _cups_isalnum(*ipp))
++    {
+       *ptr++ = *ipp++;
++    }
++    else
++    {
++      ipp ++;
++    }
+   }
+ 
+   *ptr = '\0';
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
new file mode 100644
index 0000000000..d8440ccad9
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
@@ -0,0 +1,249 @@
+From 1e6ca5913eceee906038bc04cc7ccfbe2923bdfd Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 23 Sep 2024 09:36:39 -0400
+Subject: [PATCH] Quote PPD localized strings.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/1e6ca5913eceee906038bc04cc7ccfbe2923bdfd]
+CVE: CVE-2024-47175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/ppd-cache.c | 93 +++++++++++++++++++++++++++---------------------
+ 1 file changed, 53 insertions(+), 40 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index 26911b3..3933545 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -31,6 +31,7 @@
+ 
+ static int	cups_connect(http_t **http, const char *url, char *resource, size_t ressize);
+ static int	cups_get_url(http_t **http, const char *url, char *name, size_t namesize);
++static void     ppd_put_string(cups_file_t *fp, cups_lang_t *lang, cups_array_t *strings, const char *ppd_option, const char *ppd_choice, const char *pwg_msgid);
+ static void	pwg_add_finishing(cups_array_t *finishings, ipp_finishings_t template, const char *name, const char *value);
+ static void	pwg_add_message(cups_array_t *a, const char *msg, const char *str);
+ static int	pwg_compare_finishings(_pwg_finishings_t *a, _pwg_finishings_t *b);
+@@ -3275,7 +3276,7 @@ _ppdCreateFromIPP2(
+   if ((attr = ippFindAttribute(supported, "printer-charge-info-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
+     cupsFilePrintf(fp, "*cupsChargeInfoURI: \"%s\"\n", ippGetString(attr, 0, NULL));
+ 
+-  if ((attr = ippFindAttribute(supported, "printer-strings-uri", IPP_TAG_URI)) != NULL)
++  if ((attr = ippFindAttribute(supported, "printer-strings-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
+   {
+     http_t	*http = NULL;		/* Connection to printer */
+     char	stringsfile[1024];	/* Temporary strings file */
+@@ -3319,7 +3320,7 @@ _ppdCreateFromIPP2(
+ 
+           response = cupsDoRequest(http, request, resource);
+ 
+-          if ((attr = ippFindAttribute(response, "printer-strings-uri", IPP_TAG_URI)) != NULL)
++          if ((attr = ippFindAttribute(response, "printer-strings-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
+           {
+ 	    cupsFilePrintf(fp, "*cupsStringsURI %s: \"%s\"\n", keyword, ippGetString(attr, 0, NULL));
+           }
+@@ -3909,18 +3910,16 @@ _ppdCreateFromIPP2(
+ 	cupsFilePrintf(fp, "*DefaultInputSlot: %s\n", ppdname);
+ 
+       for (j = 0; j < (int)(sizeof(sources) / sizeof(sources[0])); j ++)
++      {
+         if (!strcmp(sources[j], keyword))
+ 	{
+ 	  snprintf(msgid, sizeof(msgid), "media-source.%s", keyword);
+ 
+-	  if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	    if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	      msgstr = keyword;
+-
+ 	  cupsFilePrintf(fp, "*InputSlot %s: \"<</MediaPosition %d>>setpagedevice\"\n", ppdname, j);
+-	  cupsFilePrintf(fp, "*%s.InputSlot %s/%s: \"\"\n", lang->language, ppdname, msgstr);
++	  ppd_put_string(fp, lang, strings, "InputSlot", ppdname, msgid);
+ 	  break;
+ 	}
++      }
+     }
+     cupsFilePuts(fp, "*CloseUI: *InputSlot\n");
+   }
+@@ -3946,12 +3945,9 @@ _ppdCreateFromIPP2(
+       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
+ 
+       snprintf(msgid, sizeof(msgid), "media-type.%s", keyword);
+-      if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	  msgstr = keyword;
+ 
+       cupsFilePrintf(fp, "*MediaType %s: \"<</MediaType(%s)>>setpagedevice\"\n", ppdname, ppdname);
+-      cupsFilePrintf(fp, "*%s.MediaType %s/%s: \"\"\n", lang->language, ppdname, msgstr);
++      ppd_put_string(fp, lang, strings, "MediaType", ppdname, msgid);
+     }
+     cupsFilePuts(fp, "*CloseUI: *MediaType\n");
+   }
+@@ -4411,12 +4407,9 @@ _ppdCreateFromIPP2(
+       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
+ 
+       snprintf(msgid, sizeof(msgid), "output-bin.%s", keyword);
+-      if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	  msgstr = keyword;
+ 
+       cupsFilePrintf(fp, "*OutputBin %s: \"\"\n", ppdname);
+-      cupsFilePrintf(fp, "*%s.OutputBin %s/%s: \"\"\n", lang->language, ppdname, msgstr);
++      ppd_put_string(fp, lang, strings, "OutputBin", ppdname, msgid);
+ 
+       if ((tray_ptr = ippGetOctetString(trays, i, &tray_len)) != NULL)
+       {
+@@ -4535,9 +4528,6 @@ _ppdCreateFromIPP2(
+         cupsArrayAdd(names, (char *)keyword);
+ 
+ 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
+-	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	    msgstr = keyword;
+ 
+         if (value >= IPP_FINISHINGS_NONE && value <= IPP_FINISHINGS_LAMINATE)
+           ppd_keyword = base_keywords[value - IPP_FINISHINGS_NONE];
+@@ -4552,7 +4542,7 @@ _ppdCreateFromIPP2(
+           continue;
+ 
+ 	cupsFilePrintf(fp, "*StapleLocation %s: \"\"\n", ppd_keyword);
+-	cupsFilePrintf(fp, "*%s.StapleLocation %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
++	ppd_put_string(fp, lang, strings, "StapleLocation", ppd_keyword, msgid);
+ 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*StapleLocation %s\"\n", value, keyword, ppd_keyword);
+       }
+ 
+@@ -4615,9 +4605,6 @@ _ppdCreateFromIPP2(
+         cupsArrayAdd(names, (char *)keyword);
+ 
+ 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
+-	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	    msgstr = keyword;
+ 
+         if (value >= IPP_FINISHINGS_NONE && value <= IPP_FINISHINGS_LAMINATE)
+           ppd_keyword = base_keywords[value - IPP_FINISHINGS_NONE];
+@@ -4632,7 +4619,7 @@ _ppdCreateFromIPP2(
+           continue;
+ 
+ 	cupsFilePrintf(fp, "*FoldType %s: \"\"\n", ppd_keyword);
+-	cupsFilePrintf(fp, "*%s.FoldType %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
++	ppd_put_string(fp, lang, strings, "FoldType", ppd_keyword, msgid);
+ 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*FoldType %s\"\n", value, keyword, ppd_keyword);
+       }
+ 
+@@ -4703,9 +4690,6 @@ _ppdCreateFromIPP2(
+         cupsArrayAdd(names, (char *)keyword);
+ 
+ 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
+-	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	    msgstr = keyword;
+ 
+         if (value >= IPP_FINISHINGS_NONE && value <= IPP_FINISHINGS_LAMINATE)
+           ppd_keyword = base_keywords[value - IPP_FINISHINGS_NONE];
+@@ -4720,7 +4704,7 @@ _ppdCreateFromIPP2(
+           continue;
+ 
+ 	cupsFilePrintf(fp, "*PunchMedia %s: \"\"\n", ppd_keyword);
+-	cupsFilePrintf(fp, "*%s.PunchMedia %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
++	ppd_put_string(fp, lang, strings, "PunchMedia", ppd_keyword, msgid);
+ 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*PunchMedia %s\"\n", value, keyword, ppd_keyword);
+       }
+ 
+@@ -4791,9 +4775,6 @@ _ppdCreateFromIPP2(
+         cupsArrayAdd(names, (char *)keyword);
+ 
+ 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
+-	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	    msgstr = keyword;
+ 
+         if (value == IPP_FINISHINGS_TRIM)
+           ppd_keyword = "Auto";
+@@ -4801,7 +4782,7 @@ _ppdCreateFromIPP2(
+ 	  ppd_keyword = trim_keywords[value - IPP_FINISHINGS_TRIM_AFTER_PAGES];
+ 
+ 	cupsFilePrintf(fp, "*CutMedia %s: \"\"\n", ppd_keyword);
+-	cupsFilePrintf(fp, "*%s.CutMedia %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
++	ppd_put_string(fp, lang, strings, "CutMedia", ppd_keyword, msgid);
+ 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*CutMedia %s\"\n", value, keyword, ppd_keyword);
+       }
+ 
+@@ -4843,9 +4824,6 @@ _ppdCreateFromIPP2(
+       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
+ 
+       snprintf(msgid, sizeof(msgid), "finishing-template.%s", keyword);
+-      if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	  msgstr = keyword;
+ 
+       cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", ppdname);
+       for (finishing_attr = ippFirstAttribute(finishing_col); finishing_attr; finishing_attr = ippNextAttribute(finishing_col))
+@@ -4860,7 +4838,7 @@ _ppdCreateFromIPP2(
+ 	}
+       }
+       cupsFilePuts(fp, "\"\n");
+-      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lang->language, ppdname, msgstr);
++      ppd_put_string(fp, lang, strings, "cupsFinishingTemplate", ppdname, msgid);
+       cupsFilePuts(fp, "*End\n");
+     }
+ 
+@@ -5029,11 +5007,9 @@ _ppdCreateFromIPP2(
+ 
+       cupsFilePuts(fp, "\"\n*End\n");
+ 
+-      if ((localized_name = _cupsMessageLookup(strings, preset_name)) != preset_name)
+-      {
+-        pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
+-        cupsFilePrintf(fp, "*%s.APPrinterPreset %s/%s: \"\"\n", lang->language, ppdname, localized_name);
+-      }
++      snprintf(msgid, sizeof(msgid), "preset-name.%s", preset_name);
++      pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
++      ppd_put_string(fp, lang, strings, "APPrinterPreset", ppdname, msgid);
+     }
+   }
+ 
+@@ -5290,6 +5266,43 @@ cups_get_url(http_t     **http,		/* IO - Current HTTP connection */
+ }
+ 
+ 
++/*
++ * 'ppd_put_strings()' - Write localization attributes to a PPD file.
++ */
++
++static void
++ppd_put_string(cups_file_t  *fp,	/* I - PPD file */
++               cups_lang_t  *lang,	/* I - Language */
++               cups_array_t *strings,	/* I - Strings */
++	       const char   *ppd_option,/* I - PPD option */
++	       const char   *ppd_choice,/* I - PPD choice */
++	       const char   *pwg_msgid)	/* I - PWG message ID */
++{
++  const char	*text;			/* Localized text */
++
++
++  if ((text = _cupsLangString(lang, pwg_msgid)) == pwg_msgid || !strcmp(pwg_msgid, text))
++  {
++    if ((text = _cupsMessageLookup(strings, pwg_msgid)) == pwg_msgid)
++      return;
++  }
++
++  // Add the first line of localized text...
++  cupsFilePrintf(fp, "*%s.%s %s/", lang->language, ppd_option, ppd_choice);
++  while (*text && *text != '\n')
++  {
++    // Escape ":" and "<"...
++    if (*text == ':' || *text == '<')
++      cupsFilePrintf(fp, "<%02X>", *text);
++    else
++      cupsFilePutChar(fp, *text);
++
++    text ++;
++  }
++  cupsFilePuts(fp, ": \"\"\n");
++}
++
++
+ /*
+  * 'pwg_add_finishing()' - Add a finishings value.
+  */
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
new file mode 100644
index 0000000000..65f94a8f3e
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
@@ -0,0 +1,37 @@
+From 2abe1ba8a66864aa82cd9836b37e57103b8e1a3b Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 23 Sep 2024 10:11:31 -0400
+Subject: [PATCH] Fix warnings for unused vars.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2abe1ba8a66864aa82cd9836b37e57103b8e1a3b]
+CVE: CVE-2024-47175
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/ppd-cache.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index 85ede0f18..a6163a0e1 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -3222,8 +3222,7 @@ _ppdCreateFromIPP2(
+   int			have_qdraft = 0,/* Have draft quality? */
+ 			have_qhigh = 0;	/* Have high quality? */
+   char			msgid[256];	/* Message identifier (attr.value) */
+-  const char		*keyword,	/* Keyword value */
+-			*msgstr;	/* Localized string */
++  const char		*keyword;	/* Keyword value */
+   cups_array_t		*strings = NULL;/* Printer strings file */
+   struct lconv		*loc = localeconv();
+ 					/* Locale data */
+@@ -5009,9 +5008,8 @@ _ppdCreateFromIPP2(
+     {
+       ipp_t	*preset = ippGetCollection(attr, i);
+ 					/* Preset collection */
+-      const char *preset_name = ippGetString(ippFindAttribute(preset, "preset-name", IPP_TAG_ZERO), 0, NULL),
++      const char *preset_name = ippGetString(ippFindAttribute(preset, "preset-name", IPP_TAG_ZERO), 0, NULL);
+ 					/* Preset name */
+-		*localized_name;	/* Localized preset name */
+       ipp_attribute_t *member;		/* Member attribute in preset */
+       const char *member_name;		/* Member attribute name */
+       char      	member_value[256];	/* Member attribute value */
-- 
2.25.1


