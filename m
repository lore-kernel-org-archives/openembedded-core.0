Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B58C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 12:17:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.49596.1720009032244394223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 05:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJk5y6Sp;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42564316479so32581205e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720009030; x=1720613830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mv7hBTauTkpGPK8LmTG7TfaLn2gAVxTtETHY1j1Kpxs=;
        b=IJk5y6SpH8n0QQGDMVTGd2nU2XHiLCZpm6t9dQ6xuH0bkIag/U2yWJK0nOw8QUHAkU
         TvMxuQwgxUyhy+afcHrwCWLqiVn+xs51oUCoBox8YerZevXK9BnyUZRYpcC18e7YJLy5
         kbA3k8ZLth/3k/91G62SXdRWbXD7fGIRFv9GOSliU3qY7JCIkR3MZZroTaPjCQQAqNtp
         qnQTQMKiPBZmZMbYkenSzSgSuENgCnwP3dCbLuPuCIaAKdo/iPqqxNqfMRCmk9n8EhUP
         x6G9HlVbY2jcKStqiEcysH/crXp5cVke8wn+aATMKhFt0Wmbjk1HiVYrtqEtQLm4DueX
         5Ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720009030; x=1720613830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv7hBTauTkpGPK8LmTG7TfaLn2gAVxTtETHY1j1Kpxs=;
        b=n/48H0v4S2taNvs8pRmd3y2RXQP91sfhgM/p4gQaiqeXQ2jdDHKa+yZFkRH7HaWVFH
         uj0oqlQWE/DemPM794tVvHI/+8KTjez311fVo130mAEI3FlWoiddBfoxm72n2Qx7aktB
         3lypC0OQjeDAsuEyxW0DMTEOYbB3KQgN9hj7p2QYBkcs8KxytEI3X0EVInKJsu65Xu0E
         EqENnNQHxGKPro5XX0YoXZ1563naNB8zHYnF5W9jlUboFmtiMLInqtwI0YbS9J7gSv/R
         R9zhlXrWLENdWIzLMrWityqgeK1TgBbByGDXd6dewu5j4Hd/ZZz1WboiEtF7FSV/FeBf
         3ExQ==
X-Gm-Message-State: AOJu0YzFpsaXLTs2VBMBoORtQNC0qoJfppbNYhasTF6aNW9LMWEMWMro
	4EsQQol7vqkcIFXgYvJ3oXkfABWP2CahunoacG8sDORqwcbHdfcVKu8+Qw==
X-Google-Smtp-Source: AGHT+IFVW7F9c+zJyBg6Re5QC5uKN4sNOyLB9P9FxCvupl4IfHRNB1m7KQbRlYzvcktCVqqad0qcyw==
X-Received: by 2002:a05:600c:3b87:b0:425:672a:7693 with SMTP id 5b1f17b1804b1-42579fef0d6mr95665285e9.0.1720009030237;
        Wed, 03 Jul 2024 05:17:10 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b068e54sm240529455e9.25.2024.07.03.05.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:17:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][scarthgap][PATCH] openssh: fix CVE-2024-6387
Date: Wed,  3 Jul 2024 13:17:01 +0100
Message-ID: <20240703121701.175028-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 12:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201470

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
 .../openssh/openssh_9.6p1.bb                  |  1 +
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index d941664b41..3cdf0327b0 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
+           file://CVE-2024-6387.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.45.2


