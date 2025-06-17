Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4B2C7115A
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:44 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.31409.1750195236369747885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PMzQDseZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so90637b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195236; x=1750800036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/qoC4Nnc1gnJ0GpKfqcbqD1FByAWjCvIxaPAP/AITo=;
        b=PMzQDseZHrlKIKCxftLV4xMM4f+Py3Wi1QPL3KXt5JVdA/azqPopAlVH0gbQBnnncz
         BxapkxHieDvO8AstPlD/gUuR22wE7CzCjwZFr9tpdiy2w46SKpZs4SXtQYsU26yj59Zt
         aWbTzm1fKpeW9+IfX7rmKp5Oqzy1huQBs62bYNBltOq8n5xMXGrbv47L9jDurvwf1H5U
         /WI6Rul6jK+A71d/VgcHLB4u+UDM8N5KBgjoWfvE6tjJrze5wZTUdTXcCDf5/2sRrn32
         8mIeGi0Iu02srZd6v8buk3Q6y84xjeTPvMX246yG65J2yrXf8piZ8qp4Ndmw4D+HH+l7
         N4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195236; x=1750800036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/qoC4Nnc1gnJ0GpKfqcbqD1FByAWjCvIxaPAP/AITo=;
        b=LKkkC6vbRiOJgtoXzqZNCqC8YRJp5ImuJuveWjWCWIbG0CCzhP70tpqlxh4nvHCXVc
         narlORFWUx8WuXyeHdy2+oAO1uwF0r8eTBjclMBmM5UZ6nDDuMnLOIJjsR0SIOOidl7I
         JpVPn5Whu3h+irfAgHfX+i6CugWnEUhHu99vw9OHlrhH192Nr2arY92FIP0wuJLQ4dB5
         BT+RKzJ0YaryNgbhpyXxX8yxyLU8jZdbjiQKiZYwR9i/XxYFloss/qlOhtgV6+lcfYbs
         eOpiTFDn+RAXjcoFrcDBsgyFVNf1Ykjfn+kCqP6+QcrkZ4wde/Dzg95fguGcMRjPGCXY
         nrQg==
X-Gm-Message-State: AOJu0YwTAIFA42NfgV03/XvML/gfXHXepPG4SxA/yZS5OUCKY/7r5adY
	d2tqGLAgZm0HZ8U5UEub/biMhR/DPw8zi02sIoMxYyaY8BOB/zXOCfQ7+Np7wAnJrIryVNL4/Lo
	J4vzW
X-Gm-Gg: ASbGncu8m1JVDYDWzpQHOM5oJPQ9+Hert9UKHL0a+k9OhlbS6Moq00ZdHUOMIof+67D
	M6fYTyLgpOZyhSqD80otXTeSXi6D/4MsCRiQiTx241YvLCr/0rKLl9QgU8/xd9MIA0XljFm6+iB
	EtxwY+N3ohsHVg06YecbkzuUeRrmKOeosOwFpJAT8o2bbRY5NjVt+V+oYdQcNE0FXPHldBE3K8y
	ADw1rQALVdfnS/47KenJpwsWM679SrQHpkgQFtel7yDSqngMCbjehb3BLPZ4COKQrHrckVe4diD
	XFCLxIAhKva/daxjDO7bSglyYCq6dLVYP2ktmnU5rwNLzwX24T6U1g==
X-Google-Smtp-Source: AGHT+IGnnPZV2FIUWLjlKZQylmEVpfF/CSHdhYoNawmnXv7uoUOubQCcXB0T5y79WddmCjRuOjI94g==
X-Received: by 2002:a05:6a00:4646:b0:742:b9d2:dc8f with SMTP id d2e1a72fcca58-748e6ec3c9emr124795b3a.1.1750195235558;
        Tue, 17 Jun 2025 14:20:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/27] python3-requests: fix CVE-2024-47081
Date: Tue, 17 Jun 2025 14:19:59 -0700
Message-ID: <37d746033710509ffabc244e0130d20fd81d9673.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218919

From: Jiaying Song <jiaying.song.cn@windriver.com>

Requests is a HTTP library. Due to a URL parsing issue, Requests
releases prior to 2.32.4 may leak .netrc credentials to third parties
for specific maliciously-crafted URLs. Users should upgrade to version
2.32.4 to receive a fix. For older versions of Requests, use of the
.netrc file can be disabled with `trust_env=False` on one's Requests
Session.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-47081

Upstream patch:
https://github.com/psf/requests/commit/96ba401c1296ab1dda74a2365ef36d88f7d144ef

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3-requests/CVE-2024-47081.patch     | 37 +++++++++++++++++++
 .../python/python3-requests_2.27.1.bb         |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch b/meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch
new file mode 100644
index 0000000000..1d465cc594
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2024-47081.patch
@@ -0,0 +1,37 @@
+From c664b4415baf1b237a8d74f5e880179e69ee764c Mon Sep 17 00:00:00 2001
+From: Nate Prewitt <nate.prewitt@gmail.com>
+Date: Wed, 25 Sep 2024 08:03:20 -0700
+Subject: [PATCH] Only use hostname to do netrc lookup instead of netloc
+
+CVE: CVE-2024-47081
+
+Upstream-Status: Backport
+[https://github.com/psf/requests/commit/96ba401c1296ab1dda74a2365ef36d88f7d144ef]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ requests/utils.py | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/requests/utils.py b/requests/utils.py
+index 153776c7..eae72959 100644
+--- a/requests/utils.py
++++ b/requests/utils.py
+@@ -208,13 +208,7 @@ def get_netrc_auth(url, raise_errors=False):
+             return
+ 
+         ri = urlparse(url)
+-
+-        # Strip port numbers from netloc. This weird `if...encode`` dance is
+-        # used for Python 3.2, which doesn't support unicode literals.
+-        splitstr = b':'
+-        if isinstance(url, str):
+-            splitstr = splitstr.decode('ascii')
+-        host = ri.netloc.split(splitstr)[0]
++        host = ri.hostname
+ 
+         try:
+             _netrc = netrc(netrc_path).authenticators(host)
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-requests_2.27.1.bb b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
index 689a1dffb7..6f7c47abac 100644
--- a/meta/recipes-devtools/python/python3-requests_2.27.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.27.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 SRC_URI += "file://CVE-2023-32681.patch \
             file://CVE-2024-35195.patch \
+            file://CVE-2024-47081.patch \
            "
 
 SRC_URI[sha256sum] = "68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61"
-- 
2.43.0


