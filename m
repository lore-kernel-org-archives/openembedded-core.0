Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC1AD2ED1C
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6480.1768916290591955402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VMgg2uv+;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so50916035e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916289; x=1769521089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heTDfoh649jmidpfyy43Tt33d7fnRIyyittQVRJsedg=;
        b=VMgg2uv+U84uVwSp4RDnBfzJOnFTXx/mqEJzoIUzcI8ygIM+iyhlmn9JgFXN4oD2Ae
         G8yvmOvYm7+KR0z8B9cNmAlclDgpBTULZVdKJCDZHvfyx0j3BEapO5t/Cm6Gco+XfxHJ
         GXbbEFQX31laGqAXqTn1FYNdffCGAiB5MywGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916289; x=1769521089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heTDfoh649jmidpfyy43Tt33d7fnRIyyittQVRJsedg=;
        b=Zk7cK9OCDqI5ID48EQcKKLaL89KCj5O2ONP0ouWi+veh0fliD0q1MKk/MbWEOcS0YO
         gyjWIfPbvRuwwDQ2uc/fZRdSZsl4yVjazI5FK1PBifl7T4XR8yv+2/HRXak95r/OovAL
         riRwG2lC5VjeUTh+MVp8xBoWv4oN8YPCTyPr3/s5cHOHE7XT1d7ris28aJei4ROwE8wb
         PBzr35zevQnCeEq1O+dCvgZg3CCJfPAx4Mj0O6n5u9VEwIaYPEN9oM88noIRVMAUgS9m
         6uwCM3VRRHXOeFStszog+wWjgPEPaKlawBOJjA1vLvLF/F4q+w4YvSDspPvdViRaZKPn
         ye6g==
X-Gm-Message-State: AOJu0YyL5qgXIT95bFmvjRu82jIBRlnGgU+p0exoFe00Uj2z4LAfah5Q
	GtMMz4PR2RoeZFN4NsgUIeeUrXt1tlB+L36duDgfcTsHl82qb8fYN0QPhMA5QiivudZyWaFMg1y
	G7Y6u
X-Gm-Gg: AY/fxX5sWCmGlCrO2Oy6RXLPJg4n0bd+2eDHb6/crp04T0ftm4edFzHFONe5b5ieCFK
	HktcNIbkRqMln9iw+JQhSJI4mcitYAvsqFxnWqY9ROp0oNyUndCTbV9F6R6MUELiVShgN35nujl
	bgbfG6nFN2+HnVfmwodLc7hbuA2I9O1wfjHZ6cCTjl5OE8tfelAxzuKTAo0fpJu3gkVj7551xru
	mIQkK+BX6bvZrjjE74G6LzfSyLXbVuyMoRkTUU2U/Me8t63ImmOlA9yilTiZCwUmdl7VOQEYrDy
	tBxfElWTdjMyuPk+1k/PWZxlPw8bfG65R6B+OvLAhIlaZ1dG75+jIKssHzIIAd5IU0bLy8DR33G
	sTMnP+P6kjT8A0NwU2J3JIQKN3trcLRd7FBGTeZLjb5Jgw3HZpoP4TlPe6he+799Xh7Twyfv9Ve
	mg8KoUrPxHfGX1ogUf4Foi0wlo6XZgFm9rIQnBdo+tqBKBCkXqEicvhpruOe2Rdzk0mYWb4U7Ki
	MFSDXzezDUAvUf6vfjmzA==
X-Received: by 2002:a05:600c:3150:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-4803e7e7dacmr28119795e9.22.1768916288690;
        Tue, 20 Jan 2026 05:38:08 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:08 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/26] cups: allow unknown directives in conf files
Date: Tue, 20 Jan 2026 14:37:30 +0100
Message-ID: <d5ffa7b0c9ef975a53d743205d2a1d159cf54bf1.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229714

From: Peter Marko <peter.marko@siemens.com>

Patch for CVE-2025-61915 by mistake causes fatal error on unknown
directives in configuration files.
The default configuration already contains unknown directive in
non-systemd setups:
Unknown directive IdleExitTimeout on line 32 of /etc/cups/cupsd.conf

Backport fix for this from 2.4.x branch which reverts this behavior.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 ...pping-scheduler-on-unknown-directive.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index ce55a8ef6f..f70c4e7026 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -29,6 +29,7 @@ SRC_URI = "https://github.com/OpenPrinting/cups/releases/download/v${PV}/cups-${
 	   file://CVE-2025-58364.patch \
            file://CVE-2025-58436.patch \
            file://CVE-2025-61915.patch \
+           file://0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch b/meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch
new file mode 100644
index 0000000000..572a8941f4
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
+@@ -2695,16 +2695,16 @@ parse_variable(
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

