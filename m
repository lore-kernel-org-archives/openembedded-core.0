Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65000CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 11:27:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.20239.1758108401291595608
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 04:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup google._domainkey.mvista.com on 100.100.100.100:53: no such host" header.i=@mvista.com header.s=google header.b=W0qxBj1R;
 spf=temperror, err=temporary DNS error (domain: mvista.com, ip: 209.85.216.44, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32e34f472d9so2216367a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 04:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1758108390; x=1758713190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wp164UzVW8cb0roIy/f4LSxQ6nLwEZg6up78ddcMWA=;
        b=W0qxBj1RFauv8V0ZnfFTGxuEEVz/8R0srsONZA38aU7LYTCKCuon8qoEtbvh9eaGCj
         y8sVxr8TSrZNh8ozNvn+SbUJFczyZx3070jF1zppUrdl4FKJcJsfnr4dR/zC7/ex2LoQ
         FTb4qhRGjKdPrbzFMBELy0YdrG7c+0qDLa5Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758108390; x=1758713190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wp164UzVW8cb0roIy/f4LSxQ6nLwEZg6up78ddcMWA=;
        b=V4tIAl2s/pk0J7R0gmq5EvtIt05NMIrXl1hHNLL8m+bDy0ADzz8djT9urzOCP+pBwK
         JMnj/eRzVR7PT20qOvdiVLmbYH015pvd09aiTdgZ30r/uGJXHAl2epe7eSWPgljWp4nc
         M7nrDVLT4xCY+8jMgxEs80O48pTP70PntHgKUGqJurIfA5ulvXxnFy5NIGn3/bWTrygq
         ep9j7TUYTmO3XupVlRyALTUpcVs0pk2DsLKoFkVuTXYU1jlIrRQKnpJLMsehjjzxznhj
         u26vr4FZfdFSteHgyrrpnbbzUjqGTJiMLkDVeVOF0GWA+L/h3U7CQILZHxLZor/bEO+/
         RURA==
X-Gm-Message-State: AOJu0YwrzlXLWJ8/Y+7WIuw+PoCGIczmGv2OjgUb6Orz0EQPJIQzPRTu
	i0/ilkGpLUh+zMl5I5y1EKW8ptGVUh4ZA2dT9T2xVj0oxPauueQofK9OxOFx+5zZug+m1MUbQ9D
	XmC6dbhA=
X-Gm-Gg: ASbGncuev3zX2HwgP8G5J8tTYlcLjzd1jjFNnrxeqEtypYs5ZaCw8zenB00XePatU5U
	F7j4BiqFfLGPk0kydm9fNJ2nOgHCbmlS3p7iOyUKb1VuzwL0MKhoQdoYFHlSv8kjp62yXQzbr64
	GZaicAGnSRpuQ9eg9enSZLQfR6bwU7gsXA2FsJly/MdcG3GTGN8ymegVoAIhIXRUce6R9PjpV5h
	pmYTBgElBqgyBPyzUmwhY7U/RIN5wdaDijx71AwNNXuXHrJEBdWhnt0ezyVtx/CJuTirz9snVLd
	PVaU48+ywTAVSsrjQw4yVsMtA916oe+YtxXJt7N211bFbyRrymNPpxdtx/Wrs/C8HQc6UEboK5C
	ZUsnlbXT8TymuGpTZxRWyMGk1LwHDhJEq
X-Google-Smtp-Source: AGHT+IGsg8a1A8Vx2nOZtO9h8wFNABQdtC7cNRSuGOxPtpDiQRYulMXvknxjf/GL+pvcHxvHmcWdGw==
X-Received: by 2002:a17:90b:390a:b0:32e:dd8c:dd18 with SMTP id 98e67ed59e1d1-32ee3f2f98cmr2717818a91.17.1758108389711;
        Wed, 17 Sep 2025 04:26:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.233.0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387b5absm16434005a12.25.2025.09.17.04.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 04:26:29 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v3 2/2] cups: Fix for CVE-2025-58060 and CVE-2025-58364
Date: Wed, 17 Sep 2025 16:56:13 +0530
Message-Id: <20250917112613.60915-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250917112613.60915-1-vanusuri@mvista.com>
References: <20250917112613.60915-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 11:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223593

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://github.com/OpenPrinting/cups/commit/595d691075b1d396d2edfaa0a8fd0873a0a1f221
& https://github.com/OpenPrinting/cups/commit/e58cba9d6fceed4242980e51dbd1302cf638ab1d

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/cups/cups.inc           |  2 +
 .../cups/cups/CVE-2025-58060.patch            | 60 ++++++++++++++++++
 .../cups/cups/CVE-2025-58364.patch            | 61 +++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58060.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58364.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 50db18d42a..0a26a9b6de 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2025-58060.patch \
+           file://CVE-2025-58364.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58060.patch b/meta/recipes-extended/cups/cups/CVE-2025-58060.patch
new file mode 100644
index 0000000000..4162fa2c27
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2025-58060.patch
@@ -0,0 +1,60 @@
+From 595d691075b1d396d2edfaa0a8fd0873a0a1f221 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 11 Sep 2025 14:44:59 +0200
+Subject: [PATCH] cupsd: Block authentication using alternate method
+
+Fixes: CVE-2025-58060
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/595d691075b1d396d2edfaa0a8fd0873a0a1f221]
+CVE: CVE-2025-58060
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ scheduler/auth.c | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index 5fa53644d..3c9aa72aa 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -513,6 +513,16 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+     int	userlen;			/* Username:password length */
+ 
+ 
++   /*
++    * Only allow Basic if enabled...
++    */
++
++    if (type != CUPSD_AUTH_BASIC)
++    {
++      cupsdLogClient(con, CUPSD_LOG_ERROR, "Basic authentication is not enabled.");
++      return;
++    }
++
+     authorization += 5;
+     while (isspace(*authorization & 255))
+       authorization ++;
+@@ -558,7 +568,6 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+     * Validate the username and password...
+     */
+ 
+-    if (type == CUPSD_AUTH_BASIC)
+     {
+ #if HAVE_LIBPAM
+      /*
+@@ -727,6 +736,16 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+ 					/* Output token for username */
+     gss_name_t		client_name;	/* Client name */
+ 
++   /*
++    * Only allow Kerberos if enabled...
++    */
++
++    if (type != CUPSD_AUTH_NEGOTIATE)
++    {
++      cupsdLogClient(con, CUPSD_LOG_ERROR, "Kerberos authentication is not enabled.");
++      return;
++    }
++
+ #  ifdef __APPLE__
+    /*
+     * If the weak-linked GSSAPI/Kerberos library is not present, don't try
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58364.patch b/meta/recipes-extended/cups/cups/CVE-2025-58364.patch
new file mode 100644
index 0000000000..2be36e3b7a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2025-58364.patch
@@ -0,0 +1,61 @@
+From e58cba9d6fceed4242980e51dbd1302cf638ab1d Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 11 Sep 2025 14:53:49 +0200
+Subject: [PATCH] libcups: Fix handling of extension tag in `ipp_read_io()`
+
+Fixes: CVE-2025-58364
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/e58cba9d6fceed4242980e51dbd1302cf638ab1d]
+CVE: CVE-2025-58364
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/ipp.c | 26 +-------------------------
+ 1 file changed, 1 insertion(+), 25 deletions(-)
+
+diff --git a/cups/ipp.c b/cups/ipp.c
+index 47ba9fa..9b7bf3f 100644
+--- a/cups/ipp.c
++++ b/cups/ipp.c
+@@ -2949,31 +2949,6 @@ ippReadIO(void       *src,		/* I - Data source */
+ 	  */
+ 
+           tag = (ipp_tag_t)buffer[0];
+-          if (tag == IPP_TAG_EXTENSION)
+-          {
+-           /*
+-            * Read 32-bit "extension" tag...
+-            */
+-
+-	    if ((*cb)(src, buffer, 4) < 4)
+-	    {
+-	      DEBUG_puts("1ippReadIO: Callback returned EOF/error");
+-	      goto rollback;
+-	    }
+-
+-	    tag = (ipp_tag_t)((buffer[0] << 24) | (buffer[1] << 16) | (buffer[2] << 8) | buffer[3]);
+-
+-            if (tag & IPP_TAG_CUPS_CONST)
+-            {
+-             /*
+-              * Fail if the high bit is set in the tag...
+-              */
+-
+-	      _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("IPP extension tag larger than 0x7FFFFFFF."), 1);
+-	      DEBUG_printf(("1ippReadIO: bad tag 0x%x.", tag));
+-	      goto rollback;
+-            }
+-          }
+ 
+ 	  if (tag == IPP_TAG_END)
+ 	  {
+@@ -3196,6 +3171,7 @@ ippReadIO(void       *src,		/* I - Data source */
+ 
+ 	    if ((*cb)(src, buffer, (size_t)n) < n)
+ 	    {
++		 _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to read IPP attribute name."), 1);
+ 	      DEBUG_puts("1ippReadIO: unable to read name.");
+ 	      goto rollback;
+ 	    }
+-- 
+2.25.1
+
-- 
2.25.1


