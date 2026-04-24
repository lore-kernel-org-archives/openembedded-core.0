Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2557CFDEE55
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:56:51 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32577.1777064206710951302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1vLl/3Lu;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so47911675e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064205; x=1777669005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55Y7L25TOWINX3f157tQ+cU68068vDkT8HdhS71eb6A=;
        b=1vLl/3LuffP88LafOqLP6/J+iVRjkJ/lSCwx08zg2Bb6T2uJKvHUFJOTjZS2snSEzU
         7/2tmbPCJ9K4v1aYlubUUjiIKUi1jXAxPIn8MHu6e9fYMz7rKwbeE0K9LZb0qB/ofo5w
         ZOQFcp1qdDqMrr/vWWBMWIO2E8cugU8FoSB5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064205; x=1777669005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=55Y7L25TOWINX3f157tQ+cU68068vDkT8HdhS71eb6A=;
        b=YhhR5DsrnB1IGL1LNriKtyoeScsd3Y/c0Pjdvo2c2qOecHl/F69E2FYlrtW2TOYkwM
         8w3l8cTH/dCkbdpOSGRiDAI7ypaMfIdIYw9BIt8AzFCQNpdZTrNLT38nQzItzAvwppdI
         UB7FVFTLOclcJa6TCbjyk7wFpkOEMVRdRtPyMfzsiN7nzRNQ0nKugIn6kMVgh6BiH6e3
         33xmPjCoBHj6a4YbFSFA6hR6lRSKL869/hFPqut8UJ61UawACuVPH3vsO3xFftv/G5OA
         ZngvgGbvacuf4Y5GNV32cnxlrF6R/nv6SgCpS66SZdJYI3cPoxy3O/CupHP05ilkGJV9
         xr2g==
X-Gm-Message-State: AOJu0YyGEmLaOnwe6xa29/kcWm2FA2xBcWBRWjqgfKrZwveDcD/f7V5T
	cfW2FHtJQJyioA9Fbt2lIfZWVwkK5k+5di0Xcic5KDsL42UVd0yEJKwjASjrqyWpFRdMu3726x0
	Z04NXaaZfq3I1
X-Gm-Gg: AeBDieszIo+vB9rks3OpRevWdvLTdaqhd87HpazWYNcpZOHZPQJwQDFt22RwWCsS3mI
	QO8KyVxA1n/baGOsQXCgMYNDYSImbcE5REVMXbCaNHTDCeE3A7plz/xJ5JiYL9jHxurGZgnzlKe
	gUjbv7ItwSS58xBTccXksowppxN+xOFvVOiIvddEvLGq1ElYC7MZ+OmdcJqRZZfjg9t3Xyf8bel
	qGBmvrtaPxM2JO0KakPatDji7GERCYzy3YeOL8c5ncNPPciRwYLqGH736xO2W4G7hqaMBaw+By2
	4gS1ONe5bTT2MfAkudK54p/P36v04fNFolRd34au9xs/xu/qfGaWSRgrD3+F6OhkHRqEzW4lVlE
	/A8IKhbZyLssHZFk5egYLD2luwLr9kujNsgLJ5qVL9PmfuQwsolwwC5f4woleVropNeEPTYC5xX
	3WoDaN30K8GqpurWLjgxgUl5kBZPliYRArVWdLpyrJN+KzwE/R/PrHV6i6IzYy++N4JXdkBNl3k
	SK1H7HIN2YyS9avLRBveEiie0plmdCB9oPImg==
X-Received: by 2002:a05:600c:5297:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-488fb74a431mr527606105e9.8.1777064204776;
        Fri, 24 Apr 2026 13:56:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/66] vim: Fix CVE-2026-33412
Date: Fri, 24 Apr 2026 22:55:12 +0200
Message-ID: <dcedbba9b4d8a4cb02e2a7a291b934ea3bf7bdce.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235886

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
index 640aa2c9da1..4553c69c55f 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
+           file://CVE-2026-33412.patch \
            "
 
 PV .= ".1683"

