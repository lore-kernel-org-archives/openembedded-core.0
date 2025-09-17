Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B654BCAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 02:47:59 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.13454.1758077251244062296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 19:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup google._domainkey.mvista.com on 100.100.100.100:53: no such host" header.i=@mvista.com header.s=google header.b=RNcr70rl;
 spf=temperror, err=temporary DNS error (domain: mvista.com, ip: 209.85.210.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-776df11e5d3so4084082b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 19:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1758077230; x=1758682030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HoPHN8cHfnzVzQSjTetIe9Zksh5baLocL8Q2a1C1jy0=;
        b=RNcr70rlgs8IqgS4dp4fFVJ1+e6ZDoRIaftxSPeq6V6iHw7RD8WvuaPIn+mXpbN2z7
         zn4nwL5pBLjYcIk4xxArckTWC8pyvh+n5DUg2RtHBMAAOXlw5rqWqfWsxqQJ+oXt9tWr
         ZEFsW4vjB8qF6pRLiTznSPIGbKfhOlB+iiS14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758077230; x=1758682030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoPHN8cHfnzVzQSjTetIe9Zksh5baLocL8Q2a1C1jy0=;
        b=Cf7cIqOtayFSkM/S32wbZTLrlTNA2yEt31hIRIYFSUWpDphrZG2r9bjBrRzgZiUqd1
         vNGLrSMPkKNBHCHNKSd40281L+9a7I/ujKTzi6f8wvHLWp+mGRtBDC/J9XCToJ1c3aDn
         zGWAmaUffCtNkG9dZKGmL0Y5laaB71ZUloaCMbWSSO628nU3ChxH7/53ncvq1UD9EfNP
         qzjWg7AGunLF4jLFws2XI/J/GLVoFB7mbiTRP7JkengHIQaojhGz6y1pdU+SKSqAlM4t
         aj4AnWTvYxjqpNh7VOtFVtZSjSiEAQde+jN/yLpDiBz/kAQBswh56MZuQZSQRiliCa0b
         zjLQ==
X-Gm-Message-State: AOJu0YyeNs8beRWsRxWqHYiPh3KQje3hWgy68hCkahgaDBGjVjKbtBo/
	++173NzqklAUw1mYKCFxEuYIcK9zDs86/tiPEn6O8fKAPWrfFJXaP5F1mYXL4I1SWCH+6Gtl2wp
	Q71klOB4=
X-Gm-Gg: ASbGncvVQkkTad4GI9hnEr9qGG8IyjwuwVBdWOSwSG0vmh6E4L7m9FYRje7TzsesfWb
	3JVH+MYt4swOXziULJ+IwMCSQfmilaaOFz2xBQdNk0IDdO1Mjwb5LLKwwKzxf1UG8dfdY90ppWu
	S9ZwCa8vjzHdZTQ9OIVqYkY6ngLolcg8EBKmoxF1K+VwjzvP85ojazFIZVm3RD9o/1p+MrL7Ve5
	ZBpnKHg7A760eHr/Mqa1SNY2pYVQg4Jt/D94QiG7UKfIVVtg3H9aIiufY1iPTkmZ2Ef5Fyz3EtC
	xDOezuGHMxmPZzXpKQs4wea0GmQQN993IXyl34G1y15tjqoqsvokjOC6pTLV1xArSKSO112EKxt
	SYAsMO4qODQmbHAYR9bfVyaLz9q8xoJ3WlA0Dpwyr9Gg=
X-Google-Smtp-Source: AGHT+IFwmH5UziurD4iX2k0a8qLNqismrUk6oFgMdUVMqpHTtKAyxVsRt1gBZ+dIKUHdsHd9a8Fmww==
X-Received: by 2002:a05:6a20:3d05:b0:243:b3e2:ca07 with SMTP id adf61e73a8af0-27ab81613efmr653318637.58.1758077229785;
        Tue, 16 Sep 2025 19:47:09 -0700 (PDT)
Received: from localhost.localdomain ([49.207.233.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a46eedsm17545717b3a.30.2025.09.16.19.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 19:47:08 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] cups: Fix for CVE-2025-58060 and CVE-2025-58364
Date: Wed, 17 Sep 2025 08:17:00 +0530
Message-Id: <20250917024700.5752-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 02:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223582

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from debian to fix
  CVE-2025-58060
  CVE-2025-58364

Upstream-Status: Backport [import from debian cups 2.4.2-3+deb12u9
Upstream commit
https://github.com/OpenPrinting/cups/commit/595d691075b1d396d2edfaa0a8fd0873a0a1f221
&
https://github.com/OpenPrinting/cups/commit/e58cba9d6fceed4242980e51dbd1302cf638ab1d]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/cups/cups.inc           |  2 +
 .../cups/cups/CVE-2025-58060.patch            | 76 +++++++++++++++++++
 .../cups/cups/CVE-2025-58364.patch            | 63 +++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58060.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58364.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index b87f9dee13..cba4406720 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -25,6 +25,8 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
 	   file://CVE-2024-47175-3.patch \
 	   file://CVE-2024-47175-4.patch \
 	   file://CVE-2024-47175-5.patch \
+	   file://CVE-2025-58060.patch \
+	   file://CVE-2025-58364.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58060.patch b/meta/recipes-extended/cups/cups/CVE-2025-58060.patch
new file mode 100644
index 0000000000..0aea12a9ea
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2025-58060.patch
@@ -0,0 +1,76 @@
+From 595d691075b1d396d2edfaa0a8fd0873a0a1f221 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 11 Sep 2025 14:44:59 +0200
+Subject: [PATCH] cupsd: Block authentication using alternate method
+
+Fixes: CVE-2025-58060
+
+Upstream-Status: Backport [import from debian 2.4.2-3+deb12u9
+Upstream commit https://github.com/OpenPrinting/cups/commit/595d691075b1d396d2edfaa0a8fd0873a0a1f221]
+CVE: CVE-2025-58060
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ scheduler/auth.c | 26 ++++++++++++++++++++------
+ 1 file changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/scheduler/auth.c b/scheduler/auth.c
+index aa773f9..55f8912 100644
+--- a/scheduler/auth.c
++++ b/scheduler/auth.c
+@@ -513,6 +513,16 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+     int	userlen;			/* Username:password length */
+ 
+ 
++    /*
++     * Only allow Basic if enabled...
++     */
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
+@@ -558,10 +568,6 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+     * Validate the username and password...
+     */
+ 
+-    switch (type)
+-    {
+-      default :
+-      case CUPSD_AUTH_BASIC :
+           {
+ #if HAVE_LIBPAM
+ 	   /*
+@@ -715,8 +721,6 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
+           }
+ 
+ 	  cupsdLogClient(con, CUPSD_LOG_DEBUG, "Authorized as \"%s\" using Basic.", username);
+-          break;
+-    }
+ 
+     con->type = type;
+   }
+@@ -733,6 +737,16 @@ cupsdAuthorize(cupsd_client_t *con)	/* I - Client connection */
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/cups/cups/CVE-2025-58364.patch b/meta/recipes-extended/cups/cups/CVE-2025-58364.patch
new file mode 100644
index 0000000000..89c6f7bcb3
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2025-58364.patch
@@ -0,0 +1,63 @@
+From e58cba9d6fceed4242980e51dbd1302cf638ab1d Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 11 Sep 2025 14:53:49 +0200
+Subject: [PATCH] libcups: Fix handling of extension tag in `ipp_read_io()`
+
+Fixes: CVE-2025-58364
+
+Upstream-Status: Backport [import from debian 2.4.2-3+deb12u9
+Upstream commit https://github.com/OpenPrinting/cups/commit/e58cba9d6fceed4242980e51dbd1302cf638ab1d]
+CVE: CVE-2025-58364
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ cups/ipp.c | 27 +--------------------------
+ 1 file changed, 1 insertion(+), 26 deletions(-)
+
+diff --git a/cups/ipp.c b/cups/ipp.c
+index 42cf2fc..4b9dc4e 100644
+--- a/cups/ipp.c
++++ b/cups/ipp.c
+@@ -2949,32 +2949,6 @@ ippReadIO(void       *src,		/* I - Data source */
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
+-	    tag = (ipp_tag_t)((((((buffer[0] << 8) | buffer[1]) << 8) |
+-	                        buffer[2]) << 8) | buffer[3]);
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
+@@ -3323,6 +3297,7 @@ ippReadIO(void       *src,		/* I - Data source */
+ 	        {
+ 		  if ((*cb)(src, buffer, (size_t)n) < n)
+ 		  {
++		     _cupsSetError(IPP_STATUS_ERROR_INTERNAL, _("Unable to read IPP attribute name."), 1);
+ 		    DEBUG_puts("1ippReadIO: unable to read string value.");
+ 		    goto rollback;
+ 		  }
+-- 
+2.25.1
+
-- 
2.25.1


