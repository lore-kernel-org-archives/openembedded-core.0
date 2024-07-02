Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372FDC30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 16:10:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.28927.1719936612739740271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 09:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e46o8VXh;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42138eadf64so31519665e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719936611; x=1720541411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NUvvFvkILNncEQcQbR+zpE+kBSv8NpDL5X3SMbSgKEA=;
        b=e46o8VXhFgjCqjdRPdHcAifwekSaqnhtTBlHxLCJQ8YsWNyvx2+mlPXcVzi5feDRou
         gb79EHmK2ntBI89ZGtGVFpMtvvNe7JatbOYmmuvhJy03D06RTMi02yHTw+vMjCnp+dqi
         D0g/xNOl5aODMuWE7kpTzkHx1uv8BXYyhw93RXeRO8Z1T5B3TtUUoV2B4/ppQkWwuV6O
         C0dbfQNFdK9ro8cTWVt/mJuJRSyBqO/rivqPm9eGruf9V+Q5y6lFBm2KBsiGhrkVgGj0
         pWERYzAxbfTFSaMUCp3a7dnEJbB5ry26EzuwjvKu7pyx9QNkoJtzFr9RACHjq/aUJ68T
         tmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719936611; x=1720541411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUvvFvkILNncEQcQbR+zpE+kBSv8NpDL5X3SMbSgKEA=;
        b=A+qzbry6w9V9pRVkKTvj5Ng2tpkv1Ntvpv3XpF/uq94+ERZNBmHE3T8ILMZhEM62wN
         vcCMUdRRPROpy7Zl/W1DC3EdliYCNtnk5ZUP6rueM4swrT+j/7VG1N9itj+/kO8XLEO9
         E72UI8zcjvZ6sr+xl3PoPrzDKWOQKBLifGiMCVRA4hpee9OcL5aEtftkr1BRSHY8MOzl
         nJlYi9EQwMVErTLsEfcj2qkcKs+6AiWe/oLlMj/bmh1auwFbgfRrCaoMjekQfFCCv0li
         sZsoElK6KcOrLfUJ1Om9XnXtMEUtsq2NJjxEi2DEw0fgy++ikFRWsbBckhyBJS2eo6tf
         DB5g==
X-Gm-Message-State: AOJu0YxGCOVFXXwb2A1qcpF85qzM0VwaUl+mckrRIOBLe/jbXaqSOEpr
	gXnGSEg4AvCJUf29BmKnCTpZckdulqV9f5DhWUKEXtMXbOs09x/DVJ37OQ==
X-Google-Smtp-Source: AGHT+IEyxdCooUR5rlKijFq22aMlALT+IbKpFWvDl8dfozalG5lj3PhAEUG6VfM5It4WClzDAXp9GA==
X-Received: by 2002:a05:600c:4d96:b0:425:5f6d:b4a with SMTP id 5b1f17b1804b1-4257a02f1d7mr60342815e9.9.1719936610592;
        Tue, 02 Jul 2024 09:10:10 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4257cdf4982sm125127045e9.47.2024.07.02.09.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 09:10:10 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH] openssh: fix CVE-2024-6387
Date: Tue,  2 Jul 2024 17:10:02 +0100
Message-ID: <20240702161002.75384-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 16:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201433

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
 .../openssh/openssh/CVE-2024-6387.patch       | 23 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
new file mode 100644
index 0000000000..fa7d30e883
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2024-6387.patch
@@ -0,0 +1,23 @@
+Description: fix signal handler race condition
+Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/openssh/+bug/2070497
+
+Upstream-Status: Backport
+https://git.launchpad.net/ubuntu/+source/openssh/commit/?h=applied/ubuntu/jammy-devel&id=b059bcfa928df4ff2d103ae2e8f4e3136ee03efc
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


