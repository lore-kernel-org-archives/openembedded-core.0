Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2064CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 05:43:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.12339.1758001397687458971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 22:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup google._domainkey.mvista.com on 100.100.100.100:53: no such host" header.i=@mvista.com header.s=google header.b=g1W2sgfv;
 spf=temperror, err=temporary DNS error (domain: mvista.com, ip: 209.85.210.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77619f3f41aso2780761b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 22:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1758001373; x=1758606173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43YE9zGr6MvmpJEvMmZe/Dyav6NJhQkb1XxMCaRKHrw=;
        b=g1W2sgfvKP3ldliZRQ1RVHDJjx3GX2PVSaoqXcSgt6+a5L9a7l+lPhaqylaSe8MjOt
         0A+nqAxDKw7zJmJxe522BxhmZMPHp1uTcbFDxxd1vAkkgQCrXrDp+xk2Em/pN0rB9um5
         dHqs5AmYIfamrGJLPs13LCDZrnzRTP/a6uuJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001373; x=1758606173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43YE9zGr6MvmpJEvMmZe/Dyav6NJhQkb1XxMCaRKHrw=;
        b=norgiKKh7tGJOc/CFisfFEFJ22mRb0FA9vbKgJMjCqg8hxJRWZt6UfR0f9bWPEWvne
         kuWJqJssFyKdScMTBiMQQm//wfXGGmemfZ2no4JhJGiHHYbvqVmIhT9PoqeV/J2EzpWL
         twgf1xZfWDR6jRVwNJjrM8ubPXBntR+CYtLWAy4y5ORjMEnZrFcFsqZF1nwIRONgk3ix
         KjuNhAeodAt+QNtcHdV8mFpyJNL7ysBYCL7wBtKN4dPHVzv626JXXE441WbQdEQ1Q8MD
         OuTAdWDgfv0Wa77FIgMy+4mj1ttzXwp5BrGgRRmpZabwUB5U5gIJaCnXoh2usVgCrQZU
         NbpA==
X-Gm-Message-State: AOJu0YwyBGOEEIuPThQcOPanEHglg6aR50dypaiYIaUJvcCtgBLn0NVk
	ojmAC5BAA3K6vJByQVLoK6KwMO8Y8EMvEBbsMniUoQc/ZCF0GKJvHFesXetHOqMH8jmmxePMuUR
	jd7cDPBc=
X-Gm-Gg: ASbGncvrW+z++CjknqLHgpTM3BcjImxxR1B+Avk7yeahFavBBu69B0zOOUQ+VMMADNQ
	qpJP5rQH2ZGs0y5AqQK59AwJhmAoNnPAn9IHMdE4GtFmhY7GIUS0rIrVPyi6GlJT/HxWapF/FcY
	1AgoLbwnlXhLDiMiaE+efuH7xk2y5ZP9Wv2049KWaPDimQ4fbwEOWiD8aZJLlYrHum0OWQICBPc
	TvZeaTxGIHtbMNDD6ceLn/I88kgEeG+E98lGh8EAR7yki8ifIORKH6AtLu0C1SG6hVLFX30QTQS
	lJWaRwYUS8b5MLCaWa4YhoujZxldaPaMQjp82wcmpD9DKBrh05crNhJRSmaj2KNkHomh1iz7fYU
	vZREaTwB/xV1gpMjxHMT6bDZaodr/uBXClg==
X-Google-Smtp-Source: AGHT+IHQEtPtnVNVflicW4misyThEBdWzRvGSWVbAslShzJCdhFqr6NDm24U2h0+iUtISUhPUmrnAw==
X-Received: by 2002:a05:6a20:432b:b0:245:fb85:ef58 with SMTP id adf61e73a8af0-2602c90cbe2mr21131432637.40.1758001372944;
        Mon, 15 Sep 2025 22:42:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760944a9a9sm14617516b3a.78.2025.09.15.22.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 22:42:52 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v2 2/2] cups: Fix for CVE-2025-58060 and CVE-2025-58364
Date: Tue, 16 Sep 2025 11:12:38 +0530
Message-Id: <20250916054238.117124-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250916054238.117124-1-vanusuri@mvista.com>
References: <20250916054238.117124-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223530

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
index b70ba3ae58..48c0ce5956 100644
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


