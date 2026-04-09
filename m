Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAA3E98FDF
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:28 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145070.1775776285694870686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MPHtvbRf;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488ba840146so13523505e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776284; x=1776381084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP2dmZ8/tCvcPVYoWBz+GfrxwcZDBTHysfpT3H3eCm0=;
        b=MPHtvbRfCAjjGB8Me29WCeKgGqUKnL5nEPbxH26yegge3DUGbEy4w3wDjpdN9uO+KP
         g6woO0fwysROmFgU1KqukasN7Elela89vULbFkjuloMhgEpKrd1FMko322kfmkfoIekg
         I2XeUAx5zpS7zKOJBQk0T99cMyRbo8bbFtkKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776284; x=1776381084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BP2dmZ8/tCvcPVYoWBz+GfrxwcZDBTHysfpT3H3eCm0=;
        b=iCdpdxin6qP8S4Wvpk5ytKeirhEEUU8iE0XYf2S6pjFe373f2J5vGDWtqm+e1cl1m7
         2aN+J4+vv+8ZFjt1WDUFBTZak/Ml9nQj6Dfk1Ute4rGnDF+bs0nEv/w6h8tieDq3LOaV
         fVwZXjCQDyeRdXP4jWpuUTp8eN4pxAO2eqkWyo2PBcctibvz23AeX0uozylPrildFtuH
         vOkcmoMH/tlIeUC0mXXfl2QouFe2MIPqelDuIwWPke0Eb6Idltpwqjr0DJFo9NChDXux
         8y+UCEw/LV87TnB58y574NGtC4SQiqBw5NxsxF4IE9UH4yrZc85EWYHgFOeQ+R8r0Gt/
         m9Cw==
X-Gm-Message-State: AOJu0YzSBEbB7smrRCHumEAX3UbSDwknGZQVx4Mpo/yz6aYk13IdlOR6
	sHSngSFAg/kHV3cpZtZnaVjTThATEXZJ0rx9kQSooBDpW6tcOwYibGoKbabw2141rwVJ584AsKR
	R+uumTsdWwUdc
X-Gm-Gg: AeBDievQpt7AZqpJqhonqNkHf5bhLqgFSpODzackabOIEbzPeQVHtSBysB1PSq8Icbm
	j3PrGBWfjiLzS6V59B3+O1sFut6A6Ch3xSSfW9BPNMWNseSnj/3RU1ZYMjefa76YlpuazVxA55G
	dV20TeBYibiwLfl9Bo8B2i7hy0TNoQFMiSy9kgy7nzVL2WOJdut/8jcPidB4y0PEvqPfWPHSpVe
	uGvelbwSYo2GXX1fS42VTh5GzR3mUiv1hnE5tc2+pRuDtILFWH/8DzhAoq/2w2loHHpTKjF25Ix
	C7Uff1mXIksOFcumJ4IFnArrkZ7mPn/565Cn31heDRCw/HbDcvYaMeW2DBerAhJiZqPMEW6a8gx
	3psGJ2iey80EMFdBd9SJzPis8/9ekX6SnvDFwwtuU24BAvw7yYgBM9dRfgI2Wt0XG9Lan7mdaZL
	aOLfP0O17pJJLLdd2rIBG6WteMeAAMhlGm6aTaS95cJcxGzycY56oMoQFE+SgzjnQQxHmuF3fHo
	26QwXQxFKJ7j5v5zNCmRVEprWTq
X-Received: by 2002:a05:600c:314b:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488d687c076mr6386615e9.26.1775776283779;
        Thu, 09 Apr 2026 16:11:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 12/30] vim: Fix CVE-2026-33412
Date: Fri, 10 Apr 2026 01:10:12 +0200
Message-ID: <910667342b78fefa22214f6375b657e8b130a24a.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234971

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned in NVD report with [2]
[1] https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-33412

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../vim/files/CVE-2026-33412.patch            | 61 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-33412.patch b/meta/recipes-support/vim/files/CVE-2026-33412.patch
new file mode 100644
index 00000000000..62daa308b58
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-33412.patch
@@ -0,0 +1,61 @@
+From 645ed6597d1ea896c712cd7ddbb6edee79577e9a Mon Sep 17 00:00:00 2001
+From: pyllyukko <pyllyukko@maimed.org>
+Date: Thu, 19 Mar 2026 19:58:05 +0000
+Subject: [PATCH] patch 9.2.0202: [security]: command injection via newline in
+ glob()
+
+Problem:  The glob() function on Unix-like systems does not escape
+          newline characters when expanding wildcards. A maliciously
+          crafted string containing '\n' can be used as a command
+          separator to execute arbitrary shell commands via
+          mch_expand_wildcards(). This depends on the user's 'shell'
+          setting.
+Solution: Add the newline character ('\n') to the SHELL_SPECIAL
+          definition to ensure it is properly escaped before being
+          passed to the shell (pyllyukko).
+
+closes: #19746
+
+Github Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-w5jw-f54h-x46c
+
+Signed-off-by: pyllyukko <pyllyukko@maimed.org>
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+CVE: CVE-2026-33412
+Upstream-Status: Backport [https://github.com/vim/vim/commit/645ed6597d1ea896c712cd7ddbb6edee79577e9a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/os_unix.c | 2 +-
+ src/version.c | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/os_unix.c b/src/os_unix.c
+index cf195e62e1..d767956b1a 100644
+--- a/src/os_unix.c
++++ b/src/os_unix.c
+@@ -7106,7 +7106,7 @@ mch_expandpath(
+ # define SEEK_END 2
+ #endif
+ 
+-#define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|"
++# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|\n"
+ 
+     int
+ mch_expand_wildcards(
+diff --git a/src/version.c b/src/version.c
+index 4f3912aedd..712a3e637c 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -724,6 +724,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    1684,
+ /**/
+     1683,
+ /**/
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 289f31be707..fc9b4db055a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://CVE-2026-33412.patch \
            "
 
 PV .= ".1683"

