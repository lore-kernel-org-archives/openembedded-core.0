Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2854DCD98D0
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33476.1781132119349364999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XEwKL3EG;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef4223be7so4048756f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132118; x=1781736918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZt/U68JikNjdlbA5Y3vOxsKAe7eErk2YRLBwQUtmJI=;
        b=XEwKL3EGTuSgInzCW3Xluyt6sH6UcOyagPnc46PS0Hz3Aso06KcblQIY2kMhrqNsLE
         NvZ0Oz3LzdmYNbD99rAjKMOUHkCMoXgckdqZtElxIXtzK5TzjUNHcQzt2sZRv91LDUff
         lImdy19h1ynnbQnOcyBLmTtuujVCRy5Q7pcB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132118; x=1781736918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZt/U68JikNjdlbA5Y3vOxsKAe7eErk2YRLBwQUtmJI=;
        b=ou2z24/PNlMFyAcYA3sQ0EK8jlThiav1o0MbTjxmIgcqfVqOyddfcN1Fm7ITbuJQC2
         XfqEiLWNXMoQuE+KLvnHAB+E9CMipQz9dJ/NXu8FkKXCA2RIDSKP9qjwzsRIDHUbIU1f
         CwogOkHvMm+PR5EAQqzVJuucYBaJa9ojZKIltjgDVHOiwdMJgjQBCGiniUJNxqkp/tR3
         X47y7fIvMd+MD0RquI9NlpOVf343jXpBGz1JhWNU8UW1H0R5ekM5x7fU6RU/GwlTxqAL
         HVdxF/PQOGZ1lE1QOUcxVwfNo6ZQEF9SW2QJS1lcX38OponkxVPDDL7asOGhWZOYfNyK
         avzg==
X-Gm-Message-State: AOJu0YzHiObqSdoY9uteSawSwEmjXLtyCvWleBGNhYJ2ZwxmevI31hti
	9m+rBHjqPgIqOFdGU8XuNHl/Y54LyxspgGfd+wZMYaGbmC1cEfZMNBh7AcMf+q5Xaf3KrczO+pZ
	dKfbg
X-Gm-Gg: Acq92OE/u931YEq1kwADz8UvStaLOGPMBWJ2KqJ0UMh/tvoFky6iOtgM5rRA0EdiMvF
	adqP8EGrZgUJtARmK2IvZV1mwlzqVYXwmvXc+oiS+PcaUevx+i7H2aJs8ge1VDWsKHkxoYl0yct
	5RJljzNMi5UU/1YrPPOuSCehP9F7ICnX+XsFKB4DJm4Xy6u4+Lg7ijF0DbDLkCzRXzYBi8tredY
	mYR39NhB2wMZhufUPG+QIYYanC4rOB9oIWQQv6dA83MUyCcR2kH52lzTgzHrXKW6Ehl+bsQmmVC
	lJAad+ebImH1idJCLU5U8FV1oZAaASHQSs7aWpExJbG5xBLj6eluR0VksUAzRcv/slh++HYGahz
	cqR1Atg+SZ/01iHq7opo+YXlXG9vNrDoI3V2KjbDD1HEPW+ZQVZ33i1/jtUd5DQ+eW0xKxGnn0X
	ifvTN1SM8fiEFHfSTt4yJ8ONf7aEgM7+f60fHNpHnwoK6URV2QB0th63gv0KH6n46CptGgrc1eG
	TLLCkWguBh+n0tMrGB5+lHK3KoHqn2pFbPZYu4=
X-Received: by 2002:adf:e008:0:10b0:460:e00:121d with SMTP id ffacd0b85a97d-4606758b140mr173243f8f.14.1781132117629;
        Wed, 10 Jun 2026 15:55:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/21] cups: fix CVE-2026-34978
Date: Thu, 11 Jun 2026 00:54:55 +0200
Message-ID: <c63b4233d7c62146c6ca0f2dde60fb67048cb48a.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238400

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

In CUPS versions 2.4.16 and prior, the RSS notifier allows
path traversal in notify-recipient-uri (e.g., rss:///../job.cache),
letting a remote IPP client write RSS XML bytes outside
CacheDir/rss. Because CacheDir is group-writable by default,
the notifier (running as lp) can overwrite root-managed state
files via temp-file + rename(), leading to job cache corruption
and loss of queued jobs after restart.

Apply upstream fix to prevent path traversal in RSS notifier.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-34978 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-34978.patch            | 120 ++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34978.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2724ce72fba..e739cfa5797 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2026-34978.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
new file mode 100644
index 00000000000..043cab86eab
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
@@ -0,0 +1,120 @@
+From 730347c5bbd5e1271149c6739aa858c0c83a7568 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:18:26 -0400
+Subject: [PATCH] Fix RSS notifier.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, the RSS
+notifier allows .. path traversal in notify-recipient-uri (e.g.,
+rss:///../job.cache), letting a remote IPP client write RSS XML bytes
+outside CacheDir/rss (anywhere that is lp-writable). In particular,
+because CacheDir is group-writable by default (typically root:lp and
+mode 0770), the notifier (running as lp) can replace root-managed state
+files via temp-file + rename(). This PoC clobbers CacheDir/job.cache
+with RSS XML, and after restarting cupsd the scheduler fails to parse
+the job cache and previously queued jobs disappear.
+
+CVE: CVE-2026-34978
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/730347c5bbd5e1271149c6739aa858c0c83a7568 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ notifier/rss.c  | 20 ++++++++++++++------
+ scheduler/ipp.c | 14 +++++++++++++-
+ 3 files changed, 29 insertions(+), 7 deletions(-)
+
+diff --git a/notifier/rss.c b/notifier/rss.c
+index f17e1494c6..250ad877e7 100644
+--- a/notifier/rss.c
++++ b/notifier/rss.c
+@@ -1,11 +1,12 @@
+ /*
+  * RSS notifier for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
+- * Copyright 2007-2015 by Apple Inc.
+- * Copyright 2007 by Easy Software Products.
++ * Copyright © 2020-2026 by OpenPrinting.
++ * Copyright © 2007-2015 by Apple Inc.
++ * Copyright © 2007 by Easy Software Products.
+  *
+- * Licensed under Apache License v2.0.  See the file "LICENSE" for more information.
++ * Licensed under Apache License v2.0.  See the file "LICENSE" for more
++ * information.
+  */
+ 
+ /*
+@@ -80,6 +81,7 @@ main(int  argc,				/* I - Number of command-line arguments */
+   http_status_t	status;			/* HTTP GET/PUT status code */
+   char		filename[1024],		/* Local filename */
+ 		newname[1024];		/* filename.N */
++  struct stat	fileinfo;		/* Local file information */
+   cups_lang_t	*language;		/* Language information */
+   ipp_attribute_t *printer_up_time,	/* Timestamp on event */
+ 		*notify_sequence_number,/* Sequence number */
+@@ -111,9 +113,9 @@ main(int  argc,				/* I - Number of command-line arguments */
+ 
+   if (httpSeparateURI(HTTP_URI_CODING_ALL, argv[1], scheme, sizeof(scheme),
+                       username, sizeof(username), host, sizeof(host), &port,
+-		      resource, sizeof(resource)) < HTTP_URI_OK)
++		      resource, sizeof(resource)) < HTTP_URI_OK || strstr(resource, "../") != NULL)
+   {
+-    fprintf(stderr, "ERROR: Bad RSS URI \"%s\"!\n", argv[1]);
++    fprintf(stderr, "ERROR: Bad RSS URI \"%s\".\n", argv[1]);
+     return (1);
+   }
+ 
+@@ -209,6 +211,12 @@ main(int  argc,				/* I - Number of command-line arguments */
+     snprintf(filename, sizeof(filename), "%s/rss%s", cachedir, resource);
+     snprintf(newname, sizeof(newname), "%s.N", filename);
+ 
++    if (!lstat(filename, &fileinfo) && !S_ISREG(fileinfo.st_mode))
++    {
++      fprintf(stderr, "ERROR: Local RSS path \"%s\" is not a file.\n", filename);
++      return (1);
++    }
++
+     httpAssembleURIf(HTTP_URI_CODING_ALL, baseurl, sizeof(baseurl), "http",
+                      NULL, server_name, atoi(server_port), "/rss%s", resource);
+   }
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 174871741b..cb228b87c8 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -1,7 +1,7 @@
+ /*
+  * IPP routines for the CUPS scheduler.
+  *
+- * Copyright © 2020-2025 by OpenPrinting
++ * Copyright © 2020-2026 by OpenPrinting
+  * Copyright © 2007-2021 by Apple Inc.
+  * Copyright © 1997-2007 by Easy Software Products, all rights reserved.
+  *
+@@ -1997,6 +1997,12 @@ add_job_subscriptions(
+ 	                "notify-status-code", IPP_ATTRIBUTES);
+ 	  return;
+ 	}
++	else if (!strcmp(scheme, "rss") && strstr(resource, "../") != NULL)
++	{
++          send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-recipient-uri URI \"%s\"."), recipient);
++	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
++	  return;
++	}
+       }
+       else if (!strcmp(attr->name, "notify-pull-method") &&
+                attr->value_tag == IPP_TAG_KEYWORD)
+@@ -6067,6 +6073,12 @@ create_subscriptions(
+ 	                "notify-status-code", IPP_ATTRIBUTES);
+ 	  return;
+ 	}
++	else if (!strcmp(scheme, "rss") && strstr(resource, "../") != NULL)
++	{
++	  send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-recipient-uri URI \"%s\"."), recipient);
++	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "notify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
++	  return;
++	}
+       }
+       else if (!strcmp(attr->name, "notify-pull-method") &&
+                attr->value_tag == IPP_TAG_KEYWORD)

