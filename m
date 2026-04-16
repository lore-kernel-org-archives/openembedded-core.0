Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F02F8DFE7
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:15 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28561.1776378786880594008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aN7rXbUE;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so506825e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378785; x=1776983585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5H+956W2Om0GF7vXp5yZdzTN9B0+uVvwobbLTIuw/HA=;
        b=aN7rXbUEBeS6cNeUIp48YaV+lZuyegLyoMihaozXmekoCvZn1cmTusHvYPhl6DIGz6
         LsYlYgD13eJaqJTxdmCo2pg26xA0IUmhJU8a3sCBdiZOz6j+SasG7OYDkjJ4etkrpSOa
         AJ69ZwcD5f9CtCBl8xCAhpAvy0B8rR20FT6TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378785; x=1776983585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5H+956W2Om0GF7vXp5yZdzTN9B0+uVvwobbLTIuw/HA=;
        b=SFQzfItw277IsxsOn8KpcEV6pTQg/doxLHbMMF/T360l4wI35ht2zldB4EzxwKBB+x
         0PjY+DUh0jvizruv+Su8ZCQEsUewWeXSplYsTDnBE1Co9uU5XB4fM8vqBkR9pQWfC2oL
         dB1xksIcUu/NbsKmernCCFKSdm7oojVsGdTnUnW4dVsJ7PSqKx7a2FfoJCqyqMrcJ4rY
         fLveYjXuFzBLRnWxLtevZCpFwAjAsDQ3gAM0Vk598awQ12qcSUAwdqNJj+9rIOFAyfa1
         chjLSdyOOagaCVu5995fb5gO3h9IWi2A+GKO7xDfj0VxcAtCjdvsxKSqpor8zUWl9kPg
         IbGQ==
X-Gm-Message-State: AOJu0YxdLNSWiu3TX5KukkTtW91rV6WwvFy5mmxaroEbkpyL6ZhmV6lK
	DdY3U8AnHuC3eKF9wWIbyJm70Fkx2JC8Aju09PT1KeovwGTWs3OvNaeQgkAm1pFhGptvOuE8Ph+
	8W75W9oGJLlnm
X-Gm-Gg: AeBDieszD8da8qoY05sGUDVW95Z9VDi6yh+4/+EVD6IEzlZroEOisqvGR5t5i5Es1qH
	dBR/tOZbZhoIcid2FWOHdDd629cJ00kiPVOFbfC/fQwsUGe0X/YYgL70hwE+eMFv45Z3469Weet
	0xcs9mG4o8FgpMEI3/1JVrFOrOH3+nhq36kRoEdSTgYqmPem38b0pB5FF4BBlDWJu0pAnZjGbbv
	GQmpdRyqK53jUMARmq3RQgJf4jB/z2m0NTgmP7Ka3tplOe8goJmfdfD+l4wW9/lEQ73EiazNt4Z
	9vBB15q3/F2ZWO4SZhf8AH8hQW9VNjjv/AYdTcD4dUY8reuwQnCvYcU9uqIjFop0f7buEZqaWn0
	6fmWpO4dh7Huo2uN2npiAAIPOXsR4dqRSRKltbf1Zewq7GRiXVHXv8apwRLyK5X0mP02cOOTO0E
	wbZyqaE4S/fyI5BMU1qx2tnToRQutI9opCj5XsGC7JfuP4Fb/hD1QFAts62xBE7hgjbvkDzpMHj
	iV6aRla1IG6AT1PbYe48LfG0lREnVSfW79tAg==
X-Received: by 2002:a05:600c:c4ab:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-488fb7864c3mr5211255e9.22.1776378785004;
        Thu, 16 Apr 2026 15:33:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 10/51] vim: Fix CVE-2026-33412
Date: Fri, 17 Apr 2026 00:29:53 +0200
Message-ID: <f52c64c07f23713b0b29fa3206a5264b62cef7cc.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235439

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
index 792a46faf75..c29361cf3c0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https;tag=v${PV}
            file://no-path-adjust.patch \
            file://CVE-2026-25749.patch \
            file://CVE-2026-26269.patch \
+           file://CVE-2026-33412.patch \
            "
 
 PV .= ".1683"

