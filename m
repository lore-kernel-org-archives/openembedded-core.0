Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B019C31D97
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 16:55:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.29629.1719939334497626105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 09:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FcGFHMo9;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4256eec963eso31427845e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 09:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719939332; x=1720544132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yn5icqdN4UsqV2IidGLr/DBMqyYqBDRCgQtiFoeKHSc=;
        b=FcGFHMo9VERj4qiSOn3raPuLkl3QCqIkjJv52LxH//L0HhT8hFJFJYZC1JXNVeXDFt
         xgE1ZrWOdWRLmBBSM/vFTAfa3ANwiCoa6Hq5D5ckfGBSawpK46g4C07r3Dl2BnIuSu1O
         bbFjaXgaYg1zQd9oqkd69wpDG1CcCJUJurP+tiU0AhDmRgj3OUmTNUw4VxQyNdvjbgS9
         6az3Ka5AxcPqMPDNSw5EQmBg6AvIt79fZ8fGjQB/jq2sVaApjgVu5J7psvWrUPf7p4QP
         dmGcMhmUlBFkrhr4bB0ceEg+Pr0gulnB6mBcScudFozi8jQ2hu0tm3ziFlFD0lglEuaA
         c/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719939332; x=1720544132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yn5icqdN4UsqV2IidGLr/DBMqyYqBDRCgQtiFoeKHSc=;
        b=kduGOY4yierYC0Z6pwn9nSWUowhWGnRuMAEhXELaEUPiN1uFEoDn6nMvuY7EKskNzw
         JKkGRumOSPm60uVUXJVqCESOBKufNB0ZOllsVI+CFFzuaDIRAESkRw9BgMDHp3wQQfYm
         n7VUfAzOYhGNmPhseLyUNh2vlqG96hLClr4pNknPytS6rwHbjbieO2avrzADAZcrYxVb
         tYf2NCrdjXJDUsuB6YE5S2XQ4xZ/ukQnheymUZXkNBKYRXhH68ylqTLSFViknV9VSozp
         msGcGoO7UuqSjYdL2E1o8BSALE1+OSShcgxN84tPq38IT7e9IR8exPy3C0AotAxYOwU8
         pClw==
X-Gm-Message-State: AOJu0YwcSDZJOlHlnvtIl0a1GbYLzhSywunOZoRmaDOvPNBVE6vp9KG7
	dKg1izX2LU4wpJMyXSQWT2EPTCmF0ba97ZF4ARhlnTCNZUf+iOrHl63LeQ==
X-Google-Smtp-Source: AGHT+IG8ukvyAQMbwGWTlOLzx2+3VXxyIMbG5KU647h8CsshmW6RVmDGDtT5TiEN2ktYxl7Qxu+Stw==
X-Received: by 2002:a05:600c:3542:b0:423:b672:9d64 with SMTP id 5b1f17b1804b1-4257a03a3edmr64025835e9.18.1719939332355;
        Tue, 02 Jul 2024 09:55:32 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af54ecasm202517105e9.12.2024.07.02.09.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 09:55:31 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH v3] openssh: fix CVE-2024-6387
Date: Tue,  2 Jul 2024 17:53:16 +0100
Message-ID: <20240702165315.97744-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 16:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201437

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
2.45.2


