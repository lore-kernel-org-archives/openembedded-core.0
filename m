Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79208C531F9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7384.1785054620184312504
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Fz0Xi8tU;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954afac04bso19460085e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054618; x=1785659418; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGXeUg5L8UOgL7piB0gZRD/R2RscXqa9ZStXe0MJr8M=;
        b=Fz0Xi8tUJTA83R43ZZx1VtVHOHBrRwyGYKdZjtyHWmzbJRmcLLTb+q0JeCgU77x4Q0
         YedL0ZeQ8OjVjdNV50QwwzR91c/GlMy6vRKDoYfZkrNInf0zoXyHyPRi3U4AfNthu/eE
         tivm0xgeLRY6KpMUe+7oyCEocPWrs+g57x+Pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054618; x=1785659418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGXeUg5L8UOgL7piB0gZRD/R2RscXqa9ZStXe0MJr8M=;
        b=cn8Kv7IRVmITInUDTPuGD0lsPtAQ8YgwhNoeMNAKb8MGmLzCikeBLVM4Xpdvmk9Q/2
         ha3+r8GDE12gRp21VmNSjzVVD6F5MHltz4JFxchBQQfnMCtvgxyiLjw2U/dmTgLcKO7c
         au9RVlA5A1drDtc4TwWNJyvojqmgAyL1hiZpBbrfRjLIkDeBTRU6Ed6rzdnD34FnoqHQ
         MlS0m/8i+1SLOkr8rxZg5xaljO63S9FOm9ok1i/+b3yzxhe7hl2OvBon1X/tMt5Z2U2w
         ItwJ+2fE5+9ng15e7Xz5J0BcS02HHsQ16sXPeMhARrb3KPK/RZRRW3NY/gkkyL2MaxAE
         lZqg==
X-Gm-Message-State: AOJu0YwKqxxAGDl++sSPRioh2LA+XOk2TRUdiXbPbj4EDtootoyU7yXc
	NPw+yCG1pLsAGl2ZHXICo94d0TUFtd4zMlo+y/tSJCKOEImOIB9oxMVzMmYFFg5k91sHLPFf6pJ
	mnoUeXZ4=
X-Gm-Gg: AR+sD11+ww7/USV5kxn0NFkGIrqMRRSpWVau2bKEWCyQOrvGZbThDUXmhy06oTv2qfz
	c8vQFA514ljOGTXP6cNFn4oyNuA/FmlbCENl8SMy8T27FjdG9BgneMoFD3D9i05VCwHGgBr3Rvq
	aWVByX0m337tX3yfFCix/a/9ytjhTpc6WyqrjvpT8sQAX2PajDUgStwJREKgaQxkavoP/j8S9ue
	aJJQMG2rdMJmBMddhXQKL1yDflQ51q/ugWpKRhtUjuTiDvsbUvr2aZjebstlFQWNYkFEs2H4kRS
	KP5JTM+B8IXNg9aKQano6/At0VHpPv3pLcG2hQaCAvyhg00fd8XIMKPM0zE5J7Cw/tp+sT43DZh
	H2JraG9VigBQykMi33++LwYLayDQKVul6WXl6406aBRJOvMX0osDAqPHyQgpgEY1WMa6jsFuGlk
	E63NBFWsreGnQBHnfiveU942MTl+5wKsIg7asAcmO8kZqfGKaABAnl9BxvG0i/cAIg8kliBGHu7
	sp/Nw==
X-Received: by 2002:a05:600c:4eca:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-496b563fd7emr62601985e9.0.1785054618425;
        Sun, 26 Jul 2026 01:30:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/31] cups: fix CVE-2026-34978
Date: Sun, 26 Jul 2026 10:29:39 +0200
Message-ID: <511d976c70fb591f3bc72b750df1542c4ee84d6a.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241997

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream patch [1] as mentioned in [2].

[1] https://github.com/OpenPrinting/cups/commit/730347c5bbd5e1271149c6739aa858c0c83a7568
[2] https://security-tracker.debian.org/tracker/CVE-2026-34978

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
[YC: reverted upstream patch indentation]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-34978.patch            | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34978.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index f74bcaffab5..5e272dbcf6b 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447-regression_p1.patch \
            file://CVE-2026-27447-regression_p2.patch \
            file://CVE-2026-41079.patch \
+           file://CVE-2026-34978.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
new file mode 100644
index 00000000000..5929268f4fa
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
@@ -0,0 +1,107 @@
+From ab6ab965de6890aed4df39c97f7cd708fd5cb00c Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:18:26 -0400
+Subject: [PATCH] Fix RSS notifier.
+
+CVE: CVE-2026-34978
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/730347c5bbd5e1271149c6739aa858c0c83a7568]
+
+Backport Changes:
+- Rebase scheduler/ipp.c subscription context to the CUPS 2.4.11 source
+  carried by this recipe.
+- Omit the upstream CHANGES.md release-note hunk because Yocto patch metadata
+  carries the CVE details and the target source release-note sections differ.
+- Omit the upstream scheduler/ipp.c copyright-year-only header update because
+  this backport carries only the functional changes needed for CUPS 2.4.11.
+
+(cherry picked from commit 730347c5bbd5e1271149c6739aa858c0c83a7568)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ notifier/rss.c  |   20 ++++++++++++++------
+ scheduler/ipp.c |   12 ++++++++++++
+ 2 files changed, 26 insertions(+), 6 deletions(-)
+
+diff --git a/notifier/rss.c b/notifier/rss.c
+index f17e1494c..250ad877e 100644
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
+index 2d80a960e..2dc7376c1 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -1985,6 +1985,12 @@ add_job_subscriptions(
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
+@@ -6010,6 +6016,12 @@ create_subscriptions(
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

