Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D54BC3271E
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:26 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.8982.1720096045418174752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Qe9d+I+4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-70df2135426so336170a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096045; x=1720700845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKdXdVdR1Dk6VprNbBYH+9K3POqDgQB5T28ISlNJRm4=;
        b=Qe9d+I+40wkMx9m/tx6W1IYmbkZZCm57aq64Odl2jyCtBhJm7AYPrG0h26f+DeQz94
         FC3eGOiSgjulQr1iJ4JEL+crxm2U5u1nRoIH2++lw/800l3EFs3QmyJsIL1w+iZ9Ug5e
         3x9sUGmTwrwNnGkgoDghh/AdxdtBxBacHngOedstevDbz5Y8tjYlRgsOUhBKwELHSvJJ
         OvBtOcSwHdpsHoX6R8zpelMAvLlUxPRb0Y3KiCxGyx34qdFMTnq+Zk3/n5jUnFCNi+Gp
         nzSz4zgwfEEGazYdyyI01OiTYaz4AioyYOGYSPKz4u4gPQ2W6sbsgKEqwWURM7jICNnd
         fxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096045; x=1720700845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKdXdVdR1Dk6VprNbBYH+9K3POqDgQB5T28ISlNJRm4=;
        b=BV87lH5d827WlYgAz9EIjvdpU0IQSGm9TjI2ETB14vP9ewXhpU/o5z4ZzN0/u8IO2Z
         8Hcc8DKeYXooQcMQ5I7YSfsxbcF1WyNLuGQbYDLz3Q952bhCm/G2Ea3yTpq4mdCsVxg7
         oKODrYMyetc4GGwQ8waZyX5niUXCir7K9lLXFdM7xEwj9umoO33chxT19Hvzy39u2hBO
         8PwTbktzASmSzjOBwWHTY62xFy5M3ZtIgoT/g4hWvOOB7PM/1MPgA8kXGo9w2sKiaIu8
         vc03hp154WxMp1aNFVjMSjmdffh7I3yF22jL+rrmK12JW1I7kMFpc9G7NJZmYYxAW+Re
         NCqw==
X-Gm-Message-State: AOJu0YzLsQBBlbotHr+4EU1xIE193GVDswaVu1W62VsJfglF68zPt2LG
	aq4vPxDb3Dcii9A3hcHME6t4CiiQcrJ6Q38slLoJY5VP1L8J6daSCGcYuambCcPbL49G+WCsl8c
	x
X-Google-Smtp-Source: AGHT+IG7gmQPtVXIzWFQit4r0qKnjMpaBwYH2n7msTghMg7AplaIlomPmX6X7+MmlWzfgDZ+kkuGQQ==
X-Received: by 2002:a05:6a20:da84:b0:1be:d74c:dd5a with SMTP id adf61e73a8af0-1c0cc74bdaamr1213792637.23.1720096044494;
        Thu, 04 Jul 2024 05:27:24 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/21] openssh: fix CVE-2024-6387
Date: Thu,  4 Jul 2024 05:26:55 -0700
Message-Id: <39537bf4f9c0e25c63e984da367e6915da986ff5.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201546

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


