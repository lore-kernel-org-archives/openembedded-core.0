Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C3DEDB7D2
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:13:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75569.1775546032401976278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GPh75y2v;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-482f454be5bso59008915e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 00:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775546030; x=1776150830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP2dmZ8/tCvcPVYoWBz+GfrxwcZDBTHysfpT3H3eCm0=;
        b=GPh75y2vT8nNJ5xITq3CJruFGsXMdCDB55T8QZPc1TM122A14VXf0YSOQM5l19ghWs
         CAiBI6AWALVw9djfNU2fVCw/p8NnGS2NvQA+yAeSJa8G7szxEmBcCp8x6PHqdwNnCSec
         mUp3V1uoACIuKiZkGiYW0s8zQyhe4NnF7fjNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775546030; x=1776150830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BP2dmZ8/tCvcPVYoWBz+GfrxwcZDBTHysfpT3H3eCm0=;
        b=seYMiRAfdxl4gJTILqYAeU0LrbdcBI2zyPQLZI8XmZ/a8XjJg5scGjFlbpi/J/K1Up
         RapRK5Pqid8/jzwafURl+fa/vyRFYxhm8iT3S9frAqKcLOm4vIeckaEcx7zZveU4+2kd
         goz26WI1ZjpZgki+NAeQDr2F0GJdvZIxjdFxRnDPvLgazlQxaz5midwhYTC3HXI52pI5
         OgI847GHVLyw/Tf/hIrrNEhA6P1QOheL7NVy3m8Cjp2EoWZY/BdrIhb7PMEveYSGS8mE
         xQc9ZOVdh2WTq1BHTS706fulUh8JpfIc9o6wJn8sYdvl2Phx6RYZUfmWxJxlvwxb0jme
         Evgg==
X-Gm-Message-State: AOJu0YwH9odyBtiF4q/V9dHgbQ9X2rr1OX1vVO9K/79UERnuYydiON3m
	x+M9ohxCPbHdv8+DgS8CrYcYjA/6Y7bMRdUgMlzHOQJNCsLi/kFmNH1N0Qb4NtcV5Ya+bA3omSG
	JOM5yXFI=
X-Gm-Gg: AeBDieuNYXngNiykmaFuv/jyfyDAZRvnQvqurjQS6lZHW06xiftla/eSQ8iFhcdM1P1
	n7g76UA7H+neg5vKF8Q8LYN0Y8J3of/dcYXHZnNkfyOYu97h6EK32AwoCkmr+8BQEeN3Qdlqkn8
	9+wRbDk2Oxm22buWyfufkJJ1tKXhmcRPxIUas3VA2fbn8zycIq4AHtRDfZ8XcUQ0IcZApT5GEMA
	cayiBGaZ68V4OlsCXQ8Z0OkWPLAv1gn0QMFUNHlrS4O+MYBFATwDLNmbPEi92Pd9h4SZN60T+mZ
	fgXUPBMpmf07WsIF4Z2v9Snm436Z9reKFTqKA95RN2kQGF2KLt6XqnMmMRhWVxGWTHiKzMK6vbU
	Jc9PB2+Pf30aFhJiMbqygFOPAvONJIZcCVxs0N33Pi0Z2hXe2ukr9xoybjcDNTu4UO5mK7WY1uz
	MgEgBm/Yna4Qeyr8zx7SvJE2o5QFfxE/aZfmllrDRHFSXvv2WnbSCckH77q8RbtGRfU/10y5AUz
	wmyRzSttMkEueghirSE6purITg=
X-Received: by 2002:a05:600c:c096:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-4889946a4demr134150765e9.5.1775546030227;
        Tue, 07 Apr 2026 00:13:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899d0fc00sm156364925e9.4.2026.04.07.00.13.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:13:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v2 12/18] vim: Fix CVE-2026-33412
Date: Tue,  7 Apr 2026 09:13:20 +0200
Message-ID: <910667342b78fefa22214f6375b657e8b130a24a.1775545489.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775545489.git.yoann.congal@smile.fr>
References: <cover.1775545489.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234716

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

