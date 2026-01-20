Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB79D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5044.1768910961426933843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=elbsHGOM;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc305914so4323144f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910960; x=1769515760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ekrIi5oc/E9E3aF5xTNsK6i4oyqFTtT5ldUTnMHl5o=;
        b=elbsHGOM/P7TvRUJSpHUNDfUvsRASQpAW1SDlCYO0TqH4hTVWEJjaQZ+IrgFmWHHFd
         bV+n3nki69Aktx8BlizAUxbdKyljPQN98kHMtZYyaGpLylSi1WCgX0Zubue/bRGdu7Mf
         TklzhmnF9RiWjcFp9s8NONgk4E/1hzA8DnMN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910960; x=1769515760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ekrIi5oc/E9E3aF5xTNsK6i4oyqFTtT5ldUTnMHl5o=;
        b=uMwJy8IUeBB3+lhJmVgr+dwHYeeknvTJQumf+6pQkYbytvNqbpMrPQmscpFX2DdClR
         bUmwLG73Im5TLhWTU8YpiqwxP2hj1L9rEOvwuJJsE9+1OOA8D5nWU9AKTxMn3QzHH2sx
         0CKsX7Wapz/thQH/SkdjMsljpsIoDbSq2DnxzMczq7AAzvjdXoyPBBOEgcJtIMHNl8fs
         lwmCNvsdHR003vXidITPvFyGMvfN9Rgtvw3pymMS1jT9wYrdYxDGgvmqUus/RSMu8usN
         a9sdTagSamW3Hp/7Rvji+GWC/44dOHpE0pE7xj1UzDGliJBT6qeVadZzbacgmQZJoH/L
         x4Pw==
X-Gm-Message-State: AOJu0Yz3Cv4rNXZQIMqmRN0I5TKSxGivqAjezUJVdUDdL9w1rSjExTON
	Sie7o2VdjtO8dOR6PJOL42MsNaBDsAV2jhpELet/Ero3HIQmbYT9B6vIVCaQ4WXJ7N0iKdkyzN0
	wI1rL
X-Gm-Gg: AZuq6aLa6w6jtmiBO4BawbjtojlgUIsUHvgpaAviG3l5MEha2Pdwoh0mEc5PfUl9Dsp
	JHZGFmSDMyQNWGgTvmd3dg7hwo44qvyxSW85lnJ+/4oVljWDDqAUBuR48jtgJPHnHVLNLrEBJ8x
	TBN2OX97sx0e4XkrqVFQIxVHvLmGVMr8DlqJkbXB6AJ8qY+jNP9liZJPA/NPS6PEk+9UpRbZVKN
	LlHAxKclM2DumsJ/tDs8VXt+7EKFGKVJ/hnbCm//Yjqfp6snx6k5uM9KEmb+f3c+QHR4zhgddOl
	f71+ydDdz6wQ0Uk0284sNexjNGHL8zIbjxm4LbWSuilmTxAm2+KIyZe2Wj98rgIhr/aWeGZ/evL
	PruaLpvhhqKI49MeS2cAKaMI8u3U0mbA3NrdYHDccK/TIJskWBKx8LSFCJo9anuPKwO1fPpiLHC
	OJYxUKqQwj42+vr0LzYlCyJOkoN7zT/Fr+Rm3oQj+NMQsaTcDaihbBeF3eUN8DNyNmerurr1O4t
	WUPKREDZmBA5lMkm7OP/g==
X-Received: by 2002:a05:6000:290a:b0:430:f40f:61ba with SMTP id ffacd0b85a97d-4358ff2b2dcmr2611295f8f.41.1768910959537;
        Tue, 20 Jan 2026 04:09:19 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/22] cups: allow unknown directives in conf files
Date: Tue, 20 Jan 2026 13:08:25 +0100
Message-ID: <534f207c2869c6fbbef5d061607a28b6114c7a22.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229689

From: Peter Marko <peter.marko@siemens.com>

Patch for CVE-2025-61915 by mistake causes fatal error on unknown
directives in configuration files.
The default configuration already contains unknown directive in
non-systemd setups:
Unknown directive IdleExitTimeout on line 32 of /etc/cups/cupsd.conf

Backport fix for this from 2.4.x branch which reverts this behavior.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 ...pping-scheduler-on-unknown-directive.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 12668ca023..c7475d2b81 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2025-58364.patch \
            file://CVE-2025-58436.patch \
            file://CVE-2025-61915.patch \
+           file://0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch
new file mode 100644
index 0000000000..cf01c82cd6
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch
@@ -0,0 +1,43 @@
+From 277d3b1c49895f070bbf4b73cada011d71fbf9f3 Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Thu, 4 Dec 2025 09:04:37 +0100
+Subject: [PATCH] conf.c: Fix stopping scheduler on unknown directive
+
+Change the return value to do not trigger stopping the scheduler in case
+of unknown directive, because stopping the scheduler on config errors
+should only happen in case of syntax errors.
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/277d3b1c49895f070bbf4b73cada011d71fbf9f3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ scheduler/conf.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/scheduler/conf.c b/scheduler/conf.c
+index 7d6da0252..0e7be0ef4 100644
+--- a/scheduler/conf.c
++++ b/scheduler/conf.c
+@@ -2697,16 +2697,16 @@ parse_variable(
+   {
+    /*
+     * Unknown directive!  Output an error message and continue...
++    *
++    * Return value 1 is on purpose - we ignore unknown directives to log
++    * error, but do not stop the scheduler in case error in configuration
++    * is set to be fatal.
+     */
+ 
+-    if (!value)
+-      cupsdLogMessage(CUPSD_LOG_ERROR, "Missing value for %s on line %d of %s.",
+-		      line, linenum, filename);
+-    else
+-      cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d of %s.",
+-		      line, linenum, filename);
++    cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d of %s.",
++		    line, linenum, filename);
+ 
+-    return (0);
++    return (1);
+   }
+ 
+   switch (var->type)

