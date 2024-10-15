Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEF8D1D89D
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:10 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.4785.1729018265819918203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nYcS59Kc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea78037b7eso2611931a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018265; x=1729623065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX4uEgNwO9DLgIgjziCwyDYvL3DTPR5pqATKlemMjeE=;
        b=nYcS59KcbzAZZ5emA7IalL8kspTOY5aWQ0xMOkTiS3/w2vm+4Yvou0pMKo4pLfKrX3
         R4ZYLs+9+Wl8gdeofB4K11bObVXK92f0c7PwG5Y6u3HKjdEDIQcFmG+QOIHnu0rYpaUl
         vn9Y44hQGru76SfPblgp2QR5ftS2CqUUs/JEEKyx5S73OC6qyItqDSXhVB/oEHMhoqHA
         lugEQNxIa1nSFvBCLg2v2DELcRpOIt9yh1u3uZ6qvsK0h2iNxQe5mTv8b868qpnvJN5P
         g1OwlRZ0dwekaEV1RaKv4GZn4qYVNKclYipreXN7neFpc7GdYEvbmAfRfz6xfQZdoiyY
         UhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018265; x=1729623065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX4uEgNwO9DLgIgjziCwyDYvL3DTPR5pqATKlemMjeE=;
        b=va5I7GkOWRobz7ZxECjgPhmWiZ18nCi7/mSkm3Si5mda+JHSC4gXISTGpQ4gC93plj
         Htqotrq1VfF4031dKFmbvxMNGga4Z65gi9g8U0bDTzcgCE/Oxd8/tyemuEUfwn6cAezj
         uu5qjEMcj4KgNY65Nrh9tzpfYLS8F6cAsSfNO1Bz/BrDxaPqtyxj3g6F2mO5GHA+Bc0x
         kZR9YG4v3jzp7ga2ZtnZWgYsI93veOogQDriuDyMfbwsSKi2ZCACDXNH5FI8ncvU1HYJ
         Ojw9VMyfe+D4+137DrngVcBQuBZZcxCzqDPAwkYbB9oQVvlZt4MVyIe8aYnB3cQsGxKU
         NKMQ==
X-Gm-Message-State: AOJu0YzJK4L0Azh8NAHTVVZMYZN9zvCIpoXcfEG85nPUWlGQ7C8k+t+c
	cRgP33wXOBPSDL8TeuwzffRbSloFIGOvX1NAkC9ut3+8JMFrC8YSTREZeNIl17oXnryM1oPn+sN
	e
X-Google-Smtp-Source: AGHT+IHAIv6bJ5VOe9ZhuehB7lrMTVZex7sQK9iu6rbxLhCCyYq7K/jIsXeq+k3W4tjj324sEh7SEQ==
X-Received: by 2002:a05:6a20:b58b:b0:1d8:a6bb:2760 with SMTP id adf61e73a8af0-1d8bcfc225dmr24634284637.47.1729018264526;
        Tue, 15 Oct 2024 11:51:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/18] cups: Backport fix for CVE-2024-47175
Date: Tue, 15 Oct 2024 11:50:38 -0700
Message-Id: <f00847d91eb9440c9f1bc2f34cd0edd2af490f78.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205926

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from
https://github.com/OpenPrinting/cups/commit/9939a70b750edd9d05270060cc5cf62ca98cfbe5
&
https://github.com/OpenPrinting/cups/commit/04bb2af4521b56c1699a2c2431c56c05a7102e69
&
https://github.com/OpenPrinting/cups/commit/e0630cd18f76340d302000f2bf6516e99602b844
&
https://github.com/OpenPrinting/cups/commit/1e6ca5913eceee906038bc04cc7ccfbe2923bdfd
&
https://github.com/OpenPrinting/cups/commit/2abe1ba8a66864aa82cd9836b37e57103b8e1a3b

Reference: https://security-tracker.debian.org/tracker/CVE-2024-47175

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |   5 +
 .../cups/cups/CVE-2024-47175-1.patch          |  73 +++++
 .../cups/cups/CVE-2024-47175-2.patch          | 151 +++++++++++
 .../cups/cups/CVE-2024-47175-3.patch          | 119 +++++++++
 .../cups/cups/CVE-2024-47175-4.patch          | 249 ++++++++++++++++++
 .../cups/cups/CVE-2024-47175-5.patch          |  40 +++
 6 files changed, 637 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index b70ba3ae58..5590eb0fa0 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2024-47175-1.patch \
+           file://CVE-2024-47175-2.patch \
+           file://CVE-2024-47175-3.patch \
+           file://CVE-2024-47175-4.patch \
+           file://CVE-2024-47175-5.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-1.patch
new file mode 100644
index 0000000000..8ec720ea0d
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ cups/ppd-cache.c | 10 +++++-----
+ scheduler/ipp.c  |  7 +++++++
+ 2 files changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index e750fcc..cd2d6cb 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -3317,10 +3317,10 @@ _ppdCreateFromIPP2(
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
+@@ -3389,10 +3389,10 @@ _ppdCreateFromIPP2(
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
+@@ -3410,7 +3410,7 @@ _ppdCreateFromIPP2(
+     cupsFilePuts(fp, "\"\n");
+   }
+ 
+-  if ((attr = ippFindAttribute(supported, "printer-requested-job-attributes", IPP_TAG_KEYWORD)) != NULL)
++  if ((attr = ippFindAttribute(supported, "printer-requested-job-attributes", IPP_TAG_KEYWORD)) != NULL && ippValidateAttribute(attr))
+   {
+     char	prefix = '\"';		// Prefix for string
+ 
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 37623c5..836e41d 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -5417,6 +5417,13 @@ create_local_bg_thread(
+     }
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
index 0000000000..11e8209626
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2024-47175-2.patch
@@ -0,0 +1,151 @@
+From 04bb2af4521b56c1699a2c2431c56c05a7102e69 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 9 Sep 2024 14:05:42 -0400
+Subject: [PATCH] Refactor make-and-model code.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/04bb2af4521b56c1699a2c2431c56c05a7102e69]
+CVE: CVE-2024-47175
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ cups/ppd-cache.c | 103 +++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 87 insertions(+), 16 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index cd2d6cb..a4d7403 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -3197,9 +3197,10 @@ _ppdCreateFromIPP2(
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
+@@ -3260,34 +3261,104 @@ _ppdCreateFromIPP2(
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
new file mode 100644
index 0000000000..e7d012fb8a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2024-47175-3.patch
@@ -0,0 +1,119 @@
+From e0630cd18f76340d302000f2bf6516e99602b844 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 9 Sep 2024 15:59:57 -0400
+Subject: [PATCH] PPDize preset and template names.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/e0630cd18f76340d302000f2bf6516e99602b844]
+CVE: CVE-2024-47175
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ cups/ppd-cache.c | 33 ++++++++++++++++++++++++---------
+ 1 file changed, 24 insertions(+), 9 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index a4d7403..53c22be 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -4976,12 +4976,14 @@ _ppdCreateFromIPP2(
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
+@@ -4994,7 +4996,7 @@ _ppdCreateFromIPP2(
+ 	}
+       }
+       cupsFilePuts(fp, "\"\n");
+-      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lang->language, keyword, msgstr);
++      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lang->language, ppdname, msgstr);
+       cupsFilePuts(fp, "*End\n");
+     }
+ 
+@@ -5040,7 +5042,8 @@ _ppdCreateFromIPP2(
+       if (!preset || !preset_name)
+         continue;
+ 
+-      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", preset_name);
++      pwg_ppdize_name(preset_name, ppdname, sizeof(ppdname));
++      cupsFilePrintf(fp, "*APPrinterPreset %s: \"\n", ppdname);
+       for (member = ippFirstAttribute(preset); member; member = ippNextAttribute(preset))
+       {
+         member_name = ippGetName(member);
+@@ -5081,7 +5084,10 @@ _ppdCreateFromIPP2(
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
+@@ -5108,13 +5114,13 @@ _ppdCreateFromIPP2(
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
+@@ -5160,7 +5166,10 @@ _ppdCreateFromIPP2(
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
+@@ -5544,7 +5553,7 @@ pwg_ppdize_name(const char *ipp,	/* I - IPP keyword */
+ 	*end;				/* End of name buffer */
+ 
+ 
+-  if (!ipp)
++  if (!ipp || !_cups_isalnum(*ipp))
+   {
+     *name = '\0';
+     return;
+@@ -5559,8 +5568,14 @@ pwg_ppdize_name(const char *ipp,	/* I - IPP keyword */
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch b/meta/recipes-extended/cups/cups/CVE-2024-47175-4.patch
new file mode 100644
index 0000000000..7665513485
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
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ cups/ppd-cache.c | 93 +++++++++++++++++++++++++++---------------------
+ 1 file changed, 53 insertions(+), 40 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index 53c22be..f425ac0 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -32,6 +32,7 @@
+ static int	cups_connect(http_t **http, const char *url, char *resource, size_t ressize);
+ static int	cups_get_url(http_t **http, const char *url, char *name, size_t namesize);
+ static const char *ppd_inputslot_for_keyword(_ppd_cache_t *pc, const char *keyword);
++static void	ppd_put_string(cups_file_t *fp, cups_lang_t *lang, cups_array_t *strings, const char *ppd_option, const char *ppd_choice, const char *pwg_msgid);
+ static void	pwg_add_finishing(cups_array_t *finishings, ipp_finishings_t template, const char *name, const char *value);
+ static void	pwg_add_message(cups_array_t *a, const char *msg, const char *str);
+ static int	pwg_compare_finishings(_pwg_finishings_t *a, _pwg_finishings_t *b);
+@@ -3394,7 +3395,7 @@ _ppdCreateFromIPP2(
+   if ((attr = ippFindAttribute(supported, "printer-charge-info-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
+     cupsFilePrintf(fp, "*cupsChargeInfoURI: \"%s\"\n", ippGetString(attr, 0, NULL));
+ 
+-  if ((attr = ippFindAttribute(supported, "printer-strings-uri", IPP_TAG_URI)) != NULL)
++  if ((attr = ippFindAttribute(supported, "printer-strings-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
+   {
+     http_t	*http = NULL;		/* Connection to printer */
+     char	stringsfile[1024];	/* Temporary strings file */
+@@ -3438,7 +3439,7 @@ _ppdCreateFromIPP2(
+ 
+ 	  response = cupsDoRequest(http, request, resource);
+ 
+-	  if ((attr = ippFindAttribute(response, "printer-strings-uri", IPP_TAG_URI)) != NULL)
++	  if ((attr = ippFindAttribute(response, "printer-strings-uri", IPP_TAG_URI)) != NULL && ippValidateAttribute(attr))
+ 	    cupsFilePrintf(fp, "*cupsStringsURI %s: \"%s\"\n", keyword, ippGetString(attr, 0, NULL));
+ 
+ 	  ippDelete(response);
+@@ -4044,18 +4045,16 @@ _ppdCreateFromIPP2(
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
+@@ -4081,12 +4080,9 @@ _ppdCreateFromIPP2(
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
+@@ -4547,12 +4543,9 @@ _ppdCreateFromIPP2(
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
+@@ -4671,9 +4664,6 @@ _ppdCreateFromIPP2(
+         cupsArrayAdd(names, (char *)keyword);
+ 
+ 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
+-	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	    msgstr = keyword;
+ 
+         if (value >= IPP_FINISHINGS_NONE && value <= IPP_FINISHINGS_LAMINATE)
+           ppd_keyword = base_keywords[value - IPP_FINISHINGS_NONE];
+@@ -4688,7 +4678,7 @@ _ppdCreateFromIPP2(
+           continue;
+ 
+ 	cupsFilePrintf(fp, "*StapleLocation %s: \"\"\n", ppd_keyword);
+-	cupsFilePrintf(fp, "*%s.StapleLocation %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
++	ppd_put_string(fp, lang, strings, "StapleLocation", ppd_keyword, msgid);
+ 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*StapleLocation %s\"\n", value, keyword, ppd_keyword);
+       }
+ 
+@@ -4751,9 +4741,6 @@ _ppdCreateFromIPP2(
+         cupsArrayAdd(names, (char *)keyword);
+ 
+ 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
+-	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	    msgstr = keyword;
+ 
+         if (value >= IPP_FINISHINGS_NONE && value <= IPP_FINISHINGS_LAMINATE)
+           ppd_keyword = base_keywords[value - IPP_FINISHINGS_NONE];
+@@ -4768,7 +4755,7 @@ _ppdCreateFromIPP2(
+           continue;
+ 
+ 	cupsFilePrintf(fp, "*FoldType %s: \"\"\n", ppd_keyword);
+-	cupsFilePrintf(fp, "*%s.FoldType %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
++	ppd_put_string(fp, lang, strings, "FoldType", ppd_keyword, msgid);
+ 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*FoldType %s\"\n", value, keyword, ppd_keyword);
+       }
+ 
+@@ -4839,9 +4826,6 @@ _ppdCreateFromIPP2(
+         cupsArrayAdd(names, (char *)keyword);
+ 
+ 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
+-	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	    msgstr = keyword;
+ 
+         if (value >= IPP_FINISHINGS_NONE && value <= IPP_FINISHINGS_LAMINATE)
+           ppd_keyword = base_keywords[value - IPP_FINISHINGS_NONE];
+@@ -4856,7 +4840,7 @@ _ppdCreateFromIPP2(
+           continue;
+ 
+ 	cupsFilePrintf(fp, "*PunchMedia %s: \"\"\n", ppd_keyword);
+-	cupsFilePrintf(fp, "*%s.PunchMedia %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
++	ppd_put_string(fp, lang, strings, "PunchMedia", ppd_keyword, msgid);
+ 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*PunchMedia %s\"\n", value, keyword, ppd_keyword);
+       }
+ 
+@@ -4927,9 +4911,6 @@ _ppdCreateFromIPP2(
+         cupsArrayAdd(names, (char *)keyword);
+ 
+ 	snprintf(msgid, sizeof(msgid), "finishings.%d", value);
+-	if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	  if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	    msgstr = keyword;
+ 
+         if (value == IPP_FINISHINGS_TRIM)
+           ppd_keyword = "Auto";
+@@ -4937,7 +4918,7 @@ _ppdCreateFromIPP2(
+ 	  ppd_keyword = trim_keywords[value - IPP_FINISHINGS_TRIM_AFTER_PAGES];
+ 
+ 	cupsFilePrintf(fp, "*CutMedia %s: \"\"\n", ppd_keyword);
+-	cupsFilePrintf(fp, "*%s.CutMedia %s/%s: \"\"\n", lang->language, ppd_keyword, msgstr);
++	ppd_put_string(fp, lang, strings, "CutMedia", ppd_keyword, msgid);
+ 	cupsFilePrintf(fp, "*cupsIPPFinishings %d/%s: \"*CutMedia %s\"\n", value, keyword, ppd_keyword);
+       }
+ 
+@@ -4979,9 +4960,6 @@ _ppdCreateFromIPP2(
+       pwg_ppdize_name(keyword, ppdname, sizeof(ppdname));
+ 
+       snprintf(msgid, sizeof(msgid), "finishing-template.%s", keyword);
+-      if ((msgstr = _cupsLangString(lang, msgid)) == msgid || !strcmp(msgid, msgstr))
+-	if ((msgstr = _cupsMessageLookup(strings, msgid)) == msgid)
+-	  msgstr = keyword;
+ 
+       cupsFilePrintf(fp, "*cupsFinishingTemplate %s: \"\n", ppdname);
+       for (finishing_attr = ippFirstAttribute(finishing_col); finishing_attr; finishing_attr = ippNextAttribute(finishing_col))
+@@ -4996,7 +4974,7 @@ _ppdCreateFromIPP2(
+ 	}
+       }
+       cupsFilePuts(fp, "\"\n");
+-      cupsFilePrintf(fp, "*%s.cupsFinishingTemplate %s/%s: \"\"\n", lang->language, ppdname, msgstr);
++      ppd_put_string(fp, lang, strings, "cupsFinishingTemplate", ppdname, msgid);
+       cupsFilePuts(fp, "*End\n");
+     }
+ 
+@@ -5165,11 +5143,9 @@ _ppdCreateFromIPP2(
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
+@@ -5440,6 +5416,43 @@ cups_get_url(http_t     **http,		/* IO - Current HTTP connection */
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
index 0000000000..77a30857e2
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2024-47175-5.patch
@@ -0,0 +1,40 @@
+From 2abe1ba8a66864aa82cd9836b37e57103b8e1a3b Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 23 Sep 2024 10:11:31 -0400
+Subject: [PATCH] Fix warnings for unused vars.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2abe1ba8a66864aa82cd9836b37e57103b8e1a3b]
+CVE: CVE-2024-47175
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ cups/ppd-cache.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/cups/ppd-cache.c b/cups/ppd-cache.c
+index f425ac0..d2533b7 100644
+--- a/cups/ppd-cache.c
++++ b/cups/ppd-cache.c
+@@ -3223,8 +3223,7 @@ _ppdCreateFromIPP2(
+   int			have_qdraft = 0,/* Have draft quality? */
+ 			have_qhigh = 0;	/* Have high quality? */
+   char			msgid[256];	/* Message identifier (attr.value) */
+-  const char		*keyword,	/* Keyword value */
+-			*msgstr;	/* Localized string */
++  const char		*keyword;	/* Keyword value */
+   cups_array_t		*strings = NULL;/* Printer strings file */
+   struct lconv		*loc = localeconv();
+ 					/* Locale data */
+@@ -5010,9 +5009,8 @@ _ppdCreateFromIPP2(
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
+-- 
+2.25.1
+
-- 
2.34.1


