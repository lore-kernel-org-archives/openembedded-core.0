Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD9FCD98D9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:31 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33647.1781132120631956094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I44104xo;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490c1915793so52501385e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132119; x=1781736919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ab/XDrmIEt0xDhhe22Srzmn+Rywjv9p6PvX8q6pFCq0=;
        b=I44104xoswpPkAsz6XuXMNgZ/Xyqk06mHrst9l4ONxVh8BgNlVAkHHHy1FkHaZbiDO
         DkSpunqyrNWvsuWxiO5DwGM/kCvnNCWTpYK2NE97n3/21JZPvuqwunXH4bTNoxXJkeJ4
         JQUeHvsHKtLIX6jKHCoq7WdJNmQ2dG6d+RQog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132119; x=1781736919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ab/XDrmIEt0xDhhe22Srzmn+Rywjv9p6PvX8q6pFCq0=;
        b=WTiKyvYcCksPTM5xzSkn6Q5FRco7tgxA3uN5OxcF2kZM0hgWWT4vndV69Mkm58wBOH
         RfWK4YttbRSepjA7MwrgzaXRPikXzc6lIIeg36Z7u0sCoIYevFWE6eTxUxAbmcgS+CUQ
         hZNGrRzUZwshRUJLpVjH7FWGV5AXoGnhlaXLPJ5uMPWrRzxApxtLkCSdw+ned07xW/1f
         c/7LClduYr5eHv3I8F+tEYWxBYsycOn5z+gTiWWYpdMofq1LeqEni7tZ7t+Asnyd3oAY
         37Lz7xl4cufH4rVHlpsZ45S4pNqEVd2YOoO3ly1kGTx932hII4ZjbnNQ0LzL6cPdQfbO
         vWHQ==
X-Gm-Message-State: AOJu0Yym6B4ew4u5IxV+bKyDMqDxtSoB8jdm/w7NWUIBqVDmhRXSKFip
	4bZmF66LFrJZGnd9/IviU8ZuvY8nNdFTaxdcd7Prqn1OA8iX0eH3NmnKZB2iM/T7ljRnMIWUCYl
	zXnJn
X-Gm-Gg: Acq92OFQSvhnVAh55klwDY6bmFlLrYpvhqxTynL3HaUU9wXdG7TM1wAMdwAoASjdKv2
	NvK0wilfjC/AWqPo8wpfizz4JxB7FWlSRLSanAjpRtCwnxCaNjYOFuFdBAiERhY0imcqNuCqFQl
	EHRJm7Z1bUYjdsSuAcUm0i2wpv4C2cK/ng51Cmzx798KVztPb921cnA7wfgwrO7mEH/UqG58xNr
	MyKCJZ33gdHjIcTRET0wfnNAj1EKdaYzsu1Kk3s+/7e0iXg3RTmDypuUZbEyLGASEqF6W7b0mcA
	WvsBU7CLQvAy7d1nIDxphI7MtZu7JrgjWaQNcziHICpYMQw1Gis0gEuKlUbNe74xDyDAko4h1If
	+zlnU/KCyn49CRnqiZgW1uZ9JbTnCwGPhYsbiIlWZ2YBECuGgIz3e8jq3GkcZtaHHU+bUrsAgCH
	4BhfdLqJNxr+skQE1+COUoi06Omz4QQRKNz8a7Z/VZBBVzDa9z+uOm6AyjYJRT1MR/EWM9hwamT
	ZIJmnUzHycyjz527XvcC8ipdnAO5oph6au6lU4=
X-Received: by 2002:a05:6000:41ed:b0:460:3210:b6eb with SMTP id ffacd0b85a97d-460677c116amr248955f8f.43.1781132118982;
        Wed, 10 Jun 2026 15:55:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/21] cups: fix CVE-2026-34980
Date: Thu, 11 Jun 2026 00:54:57 +0200
Message-ID: <adae3ad82c3ef428424a78793f0bad3f0f1e1773.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238402

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

In CUPS versions 2.4.16 and prior, a network-exposed cupsd
with a shared target queue allows an unauthorized client
to send a Print-Job without authentication. The server
accepts a page-border value supplied as textWithoutLanguage,
preserves an embedded newline through option escaping and
reparse, and then reparses the resulting second-line PPD
text as a trusted scheduler control record. A follow-up
raw print job can therefore make the server execute an
attacker-chosen existing binary (e.g., /usr/bin/vim) as lp.

Apply upstream fix to prevent newline injection and
unauthorized execution in shared PostScript queues.

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-34980.patch            | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 78e0495d1c1..f23411f44b5 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -17,6 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://cups-volatiles.conf \
            file://CVE-2026-34978.patch \
            file://CVE-2026-34979.patch \
+           file://CVE-2026-34980.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34980.patch b/meta/recipes-extended/cups/cups/CVE-2026-34980.patch
new file mode 100644
index 00000000000..ebf7a3a353a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34980.patch
@@ -0,0 +1,88 @@
+From 8d0f51cac24cb5bf949c5b6a221e51a150d982e3 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:45:13 -0400
+Subject: [PATCH] Filter out control characters from option values.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, in a
+network-exposed cupsd with a shared target queue, an unauthorized client
+can send a Print-Job to that shared PostScript queue without
+authentication. The server accepts a page-border value supplied as
+textWithoutLanguage, preserves an embedded newline through option
+escaping and reparse, and then reparses the resulting second-line PPD:
+text as a trusted scheduler control record. A follow-up raw print job
+can therefore make the server execute an attacker-chosen existing binary
+such as /usr/bin/vim as lp.
+
+CVE: CVE-2026-34980
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/8d0f51cac24cb5bf949c5b6a221e51a150d982e3 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ scheduler/job.c | 41 +++++++++++++++++++++++++++++++++++------
+ 1 file changed, 37 insertions(+), 6 deletions(-)
+
+diff --git a/scheduler/job.c b/scheduler/job.c
+index 1fef9d0cd..af6390687 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -4118,9 +4118,21 @@ get_options(cupsd_job_t *job,		/* I - Job */
+ 	  case IPP_TAG_URI :
+ 	      for (valptr = attr->values[i].string.text; *valptr;)
+ 	      {
+-	        if (strchr(" \t\n\\\'\"", *valptr))
+-		  *optptr++ = '\\';
+-		*optptr++ = *valptr++;
++	       /*
++	        * Convert tabs and newlines to spaces, filter out control chars,
++	        * and escape \, ', and ".
++	        */
++
++	        if (isspace(*valptr & 255))
++	        {
++	          *optptr++ = ' ';
++	        }
++	        else if ((*valptr & 255) >= ' ' && *valptr != 0x7f)
++	        {
++	          if (strchr("\\\'\"", *valptr))
++		    *optptr++ = '\\';
++		  *optptr++ = *valptr++;
++		}
+ 	      }
+ 
+ 	      *optptr = '\0';
+@@ -5395,13 +5407,30 @@ update_job(cupsd_job_t *job)		/* I - Job to check */
+     else if (loglevel == CUPSD_LOG_PPD)
+     {
+      /*
+-      * Set attribute(s)...
++      * Set PPD keyword(s)/value(s)...
+       */
+ 
++      int		i,		/* Looping var */
++			num_keywords;	/* Number of keywords */
++      cups_option_t	*keywords,	/* Keywords */
++			*keyword;	/* Current keyword */
++
+       cupsdLogJob(job, CUPSD_LOG_DEBUG, "PPD: %s", message);
+ 
+-      job->num_keywords = cupsParseOptions(message, job->num_keywords,
+-                                           &job->keywords);
++      keywords     = NULL;
++      num_keywords = cupsParseOptions(message, 0, &keywords);
++
++      for (i = 0, keyword = keywords; i < num_keywords; i ++)
++      {
++       /*
++        * Filter out "special" PPD keywords...
++        */
++
++        if (strcmp(keyword->name, "cupsFilter") && strcmp(keyword->name, "cupsFilter2") && strcmp(keyword->name, "cupsFinishingTemplate") && strcmp(keyword->name, "cupsIPPFinishings") && strcmp(keyword->name, "cupsIPPReason") && strcmp(keyword->name, "cupsMarkerName") && strcmp(keyword->name, "cupsMaxSize") && strncmp(keyword->name, "cupsMediaQualifier", 18) && strcmp(keyword->name, "cupsMinSize") && strcmp(keyword->name, "cupsPageSizeCategory") && strcmp(keyword->name, "cupsPortMonitor") && strcmp(keyword->name, "cupsPreFilter") && strcmp(keyword->name, "cupsPrintQuality") && strcmp(keyword->name, "APPrinterPreset"))
++          job->num_keywords = cupsAddOption(keyword->name, keyword->value, job->num_keywords, &job->keywords);
++      }
++
++      cupsFreeOptions(num_keywords, keywords);
+     }
+     else
+     {

