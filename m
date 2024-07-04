Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770DCC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 10:56:25 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7553.1720090583777436846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 03:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FUFS2Oq5;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-424acf3226fso3473755e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720090582; x=1720695382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bE4YReOBW5Pg6lBo58CAoFaRQE5bHEnjSvxRt0WiFKg=;
        b=FUFS2Oq5jn28toD3p7+qNw69IBiTiRWdw2JKf9eaycTsGxa8GlKWyW+zsgrTIljWwq
         X7XSY99NfvXPJZnjKIZk+BYjqmXIshNKeQW3oLvScO9rz/YAJiV8aFfQxXqgWIef/J/6
         pUMeCN3RTxnjpiEfl+kT6ixDr0zpgr8vkoDfPKWMPL8cJ1894fXbjfhJVA7fwUxKWheC
         bjthqao0AC5Se23VxwTmzv+NQEJU86sIF9e8HJhPEW9jNZLeWaUjq0KLwco6rWBvTCi5
         18LxxGI8gXC3n28it7nYywe48gueGFGImedWR9QKjUXfSJxwnJqNa7X0VMpBeOf9oAdA
         LaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720090582; x=1720695382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bE4YReOBW5Pg6lBo58CAoFaRQE5bHEnjSvxRt0WiFKg=;
        b=MU7jT7GTsiDbyGPXq2A8mrGp58G36MdGMtO9WhZ239NBwNycq9/oA638NO5c6O4SCX
         dqrnPJefJKQj63A22G8759KHLN8GA8SMtagiucE5cuq6DTmT1P/NjxOdQrXj2nLS4/pA
         fwnX0bIn0QpFNr6XtsSn35qUYFJfaNspTruAZVlGFMkLZKJxed/+o6DhnHa3oDTxVtA0
         dK/N6tlvlqoDKAZsrF810omk4bZ5QbMN3xn8a5Z0GtX6PkvEYJGa34GyAjGuX1JzH8AD
         qE01LUdX+A6NJhgjVXAovo+uroCiKxRJojUdKtFloT98+EZy3tB9ylrOuubb+BgJvoXw
         l13Q==
X-Gm-Message-State: AOJu0YwOeeaaTmm4BOwQUGhnZ177eMV3UjNCF/pyqvoSEd2lT7DXK4FK
	nKOXRz72iVZCQeMN33SvmsgKp8s4UamY/d8K02W5UbWnBpukgzBIVu8Yow==
X-Google-Smtp-Source: AGHT+IGDinctulx8xJ46Jd3Py/KTk6O9tKSWWLfjUFpIP15rNngUJ83GalJEGFFyr1A5ThPD5PWupw==
X-Received: by 2002:a05:600c:4487:b0:425:6a12:bbe6 with SMTP id 5b1f17b1804b1-4264a36e4c2mr10812785e9.0.1720090581703;
        Thu, 04 Jul 2024 03:56:21 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm19193655e9.26.2024.07.04.03.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 03:56:21 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] openssh: fix CVE-2024-6387
Date: Thu,  4 Jul 2024 11:56:17 +0100
Message-ID: <20240704105617.130735-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 10:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201534

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
---
 .../openssh/openssh/CVE-2024-6387.patch       | 27 +++++++++++++++++++
 .../openssh/openssh_9.7p1.bb                  |  1 +
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index 0bc14c5553..69eade3ee7 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
+           file://CVE-2024-6387.patch \
            "
 SRC_URI[sha256sum] = "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
 
-- 
2.45.2


