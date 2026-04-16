Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F69F8806F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:31 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7717.1776322105833726665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pmpUpjnr;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so4850880f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322104; x=1776926904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5H+956W2Om0GF7vXp5yZdzTN9B0+uVvwobbLTIuw/HA=;
        b=pmpUpjnrzbE9BLG0/CjUAbecGY6RurCZJfqIn2RIgTT2PI+O6ToJxxjWXFmp5gtNqa
         QDbJL43WiVQGxJXIz763x3vAuuoN8KanH/li4CDasLBt8L4l3qPd/9S2VNROdAr0KJQn
         1MWLeMjvqo68muJo+M+hTftz7v9oK+KoslS6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322104; x=1776926904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5H+956W2Om0GF7vXp5yZdzTN9B0+uVvwobbLTIuw/HA=;
        b=G9WB5ZV8P70InFpjPKJad1psBVH0nf8+Y9sG+GII5/nuC4Z1u9uzFyrnVmuRM5RmKU
         9jVLa2QgMRtKCHZ6+aHShSaA+lVcyp3autxq+IPzOQqnpwVLVBQNP94LTpfeXjuDwr0n
         pcHNO7kLRFuy9Xb0HMZlNvumRh/3R9sNylLjAvmZkuawi/X7YAUC9sx1x+cS/pETNfAy
         Vkgc52WTi+UDCS901fkxwoIO6ga2UOw10SM55lY7hD4bIDgHih+WjSMgLwUPtojsOtQ5
         XvqlK5ZEWM6wFpt7VIMW20vwkfAQnWAsbQhFhJhPY8r1tpoqiTptouhB5EKRZQtyYF35
         ucyg==
X-Gm-Message-State: AOJu0YzBi+JFzwiSCdVxAaNfAJ/8oSqww+RmHwQf4q8xewISQp2S6hoz
	YXG7fl2aPjDUqUqilHH0s6rfu8DhjLygqHMJsI5+9iLhhN26Jy6tfeAfJgXlx9jxWd2NKWYcs41
	UixHRz70ErWEH
X-Gm-Gg: AeBDiev6/9sgYsnGHCSOZUWXaQE6KljB7hV+cthqqoEKJl4OeW5QWwRaGIKIACMYYC7
	4rLPs1NCFy8avN3Uh/y5OeAPoxBJ0Qh4hXoB0xNcv5TpgLYU13PLr1DxegeVn4PwCVDBbhzv6Ly
	FDuahFHOyxRTuu6u9kNxTWt5FJRqeXcsF414YHVb0Xqd7TkCAK2W26mCxWs5yTtpdygWhllg46n
	I+zsRM7vGGYGgejIcrT2w6KsUxYyKVzC+0a+gs50pMlD7BhrNX3VJpia4uyf9VogxfmFUWT6+l4
	s2TD+vvG9zlg9otvHKQ+Tr4LIldCZs5BJW73zuYx8+jX1+vnRhBabRzqEzeGdXqylEyHJ9zxtsI
	09U0tJQ+Vz/Qhz3j22jp9jlVN4J7PSehDQq1tT8hO0mKDvkD27k7h81HHYBeZNtrSzRCnh/4ZHO
	vui0rQ5TqXQh47K7Pl0F/Tplt00D6SrpdyWAmKcakgYJ0mPnuELJZZLEzFyIxSqbRwppziyCI7U
	0N3l3et+WmlsdbVpbY2vP8gENhR7FjxAE7Bzw==
X-Received: by 2002:a05:6000:4203:b0:43d:9bb5:bd9a with SMTP id ffacd0b85a97d-43d9bb5bfbfmr16364596f8f.23.1776322103811;
        Wed, 15 Apr 2026 23:48:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 10/47] vim: Fix CVE-2026-33412
Date: Thu, 16 Apr 2026 08:47:11 +0200
Message-ID: <f52c64c07f23713b0b29fa3206a5264b62cef7cc.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235352

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

