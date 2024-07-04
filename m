Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97446C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:32:26 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.8994.1720096345318263535
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Heacc6h2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb1c918860so10944535ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096344; x=1720701144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdDUrgPWtpHnj0EWzpvSQAnvk5+ymNJIvlrtB8Bcykg=;
        b=Heacc6h2MvZuuZx21Z90GHwVT2EirEjsbtagIxjN8pf88Q4qmfCHblMD6hsacbAY+I
         jhxurN+vOtjSRWvjlwuWhag8m/GLIkHR3ap5evrZYfAfVw+A+pIiZOuPEZobmsWDuHKm
         mL2JvbKL3b0Izg1Z/jhITF1AacCxZnHKkF/jWZo+FTN5Phl2B+GhVQ1e2AhbgrpEfKCO
         oR4HOLhCyN9KuBgGZG+oGHYktSI9La5ghAO4TEvuJrseIZGjh7GxkOQ31NmJnPUHK9vf
         fEG4BXAEXYl2/WNKmEnu0pqiW2jzWQuG9GHt6VA5Mop9eFlikGfIt4UlxzHguwE8hqxu
         T9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096344; x=1720701144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdDUrgPWtpHnj0EWzpvSQAnvk5+ymNJIvlrtB8Bcykg=;
        b=wZfweDApCijIPUegXBfY4lWqs7MNXX7G1/kPgPX4L1E9hi+xkKc2L/FlWdaWPSZyVx
         EkzhJ1iS9phsxk+v7c/GPy7MWp7NAESkQkQ+7ExQpCOBszNPRLQhwTvXiiAh5NLGCOpO
         LymivDD4JYCOHJXybltDYAHJ0bIHjxooyugvcO3VrajVX9CM2yKPAMBTqR41UpKVXcnF
         IN7PG5pFxlmx+ws9/JQ68AILjZ/dAMHjgZuA3C2aR71SQLPBQ6NjYEQVpAIv7OzZat35
         tsWqSW+WVJpazQTkwEGPM8ObatNg69ZQ6pHM0OjFEpcAcYGmI6It8R48HS2L3IbN+3FP
         ccbg==
X-Gm-Message-State: AOJu0YwquFePgWReGJsTnBEHenHz/rUTRD/R/pDRj0SDpkIxl7M5re9o
	bH34hhSjl0IbcVI2FVBF6kr11YsD+cveNcxTDomcdcfAaNX/n38M9oTlRXugWSY7Fo9CVHha4MM
	7
X-Google-Smtp-Source: AGHT+IED6RY6qYL/Jg80m8YbdfGXQ/SvIK2YIs+QhfUM+X/ljcFkNxIDRup8W3XMiIY1zSPVs4cqow==
X-Received: by 2002:a17:902:d58a:b0:1f7:1b42:42f3 with SMTP id d9443c01a7336-1fb37055ef2mr20990335ad.18.1720096344474;
        Thu, 04 Jul 2024 05:32:24 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159d337sm121034095ad.284.2024.07.04.05.32.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:32:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/7] openssh: fix CVE-2024-6387
Date: Thu,  4 Jul 2024 05:32:09 -0700
Message-Id: <ddb998d16fd869acb00a1cd8038ada20fd32aa8b.1720096173.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720096173.git.steve@sakoman.com>
References: <cover.1720096173.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201570

From: Jose Quaresma <quaresma.jose@gmail.com>

sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).
Race condition resulting in potential remote code execution.
A race condition in sshd(8) could allow remote code execution as root on non-OpenBSD systems.
This attack could be prevented by disabling the login grace timeout (LoginGraceTime=0 in sshd_config)
though this makes denial-of service against sshd(8) considerably easier.
For more information, please refer to the release notes [1] and the
report from the Qualys Security Advisory Team [2] who discovered the bug.

[1] https://www.openssh.com/txt/release-9.8
[2] https://www.qualys.com/2024/07/01/cve-2024-6387/regresshion.txt

References:
https://www.openssh.com/security.html

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>

v2: include the missing cve tag: CVE: CVE-2024-6387
v3: add the Signed-off-by on the CVE-2024-6387.patch
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2024-6387.patch       | 27 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
new file mode 100644
index 0000000000..3e7c707100
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
@@ -0,0 +1,27 @@
+Description: fix signal handler race condition
+Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/2070497
+
+CVE: CVE-2024-6387
+
+Upstream-Status: Backport
+https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=applied/ubuntu/jammy-devel&id=b059bcfa928df4ff2d103ae2e8f4e3136ee03efc
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+
+--- a/log.c
++++ b/log.c
+@@ -452,12 +452,14 @@ void
+ sshsigdie(const char *file, const char *func, int line, int showfunc,
+     LogLevel level, const char *suffix, const char *fmt, ...)
+ {
++#if 0
+ 	va_list args;
+ 
+ 	va_start(args, fmt);
+ 	sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
+ 	    suffix, fmt, args);
+ 	va_end(args);
++#endif
+ 	_exit(1);
+ }
+ 
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 6411a64eff..d2c477a062 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-48795.patch \
            file://CVE-2023-51384.patch \
            file://CVE-2023-51385.patch \
+           file://CVE-2024-6387.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.34.1


