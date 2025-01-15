Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438A3C02189
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:14 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.22457.1736951892771587374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PLmGNO1D;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21649a7bcdcso118101035ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951892; x=1737556692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoc30xNvh2kRNh37pF8vpfGzD3hVgxc1HGNhd/d4FMk=;
        b=PLmGNO1DiFV3Fpf0MbCLZTH01YdZ02h4kexP7iF6vGHJoZIHYSrrTvviWRoc1oVe/U
         Gm8292Z6ZkKkYS/W+HezPwE6ZSyKSawSPJcRmFsXYNy2xNemowVx7g0iq34xMS25wnqc
         HzcBsfpuRvfYNnnyNXjLDdmYKdVydYljrBbtvHJkXytMNx05T6EZpvTOnzN+cRPPw9kO
         O5k/4Skb3qqtQ6wGRNqtsJWv55cRn8QHFXKcV6oXbvQm4wPtP3VCFlnYFj32x5FvuyI8
         Lm86vJdoHWbUDHTpfI6j/ckwh7hZMbjBHpbcsM/Tk+lQ/L+BmEa81Zlbylq+C2w/Lxfz
         E4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951892; x=1737556692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoc30xNvh2kRNh37pF8vpfGzD3hVgxc1HGNhd/d4FMk=;
        b=mXN9sLL9GPeBu0TkXsCen/3JSQty53q4iYmAnzHexMtbGn7JoeGvWkCJFx7JXUclw6
         BvPrRURl8m4H62NsXhXdtG3yzZiZWPZwAfgoRhJaOv1/3mGeUKxQoFzjX/zLWUVrk3FJ
         5yWss26lehhcwwRqrIZA3e1BUJMmPL3sZyrZQPg2uMcVncFecOhv+oBqyisgf41CiqQm
         d3dehRtGC+LLsQSylVCTHCQJ/AwMCjVVgdeoi8UtXHSzRuGTk3YDDU+VXC2azRPR+u65
         SINX6sahHIHuMIwr+19KPHMJtHUMVJZWWtRRcwvV4m+5lgrOc7l6tGvuQCXFU8D+IPK+
         XSbg==
X-Gm-Message-State: AOJu0Yy36YgQihxUEL1awaXtgGhzAIAB1x9V01UmXUhFEdMvLvhvnN4f
	aMBGPkNgh+oIZbT7DblSZrsHXlhCVK0gl2JyBwrUne4CM8QWkGvDgHpZ9Zp3wS8TJVm0egdD0q2
	fRk0=
X-Gm-Gg: ASbGncstLXCx2Kaz/DzHYGo9ohzLqxngYgdwVFL6LixCx9zHLNaX4pW/3qVa2oXLlaT
	sE76D1R+AjO9OWsMVHdmlgc+dvQOVtGhanm+FPsBR0m1m7r54djieoBjtnO3e5RZ+VzaBgiphdd
	OTfmnCyMjmDLo5Y83np7/c1iA7kT0D32WcfMyhXMXqY/e1DZMo7NtEExHx5USnGnPDxw+sCIxyQ
	h4lzuxG0B8aXmiSGXlBUakzoaoph/ZEYNNLNQvLGpSgEQ==
X-Google-Smtp-Source: AGHT+IEA2H9h8e2uiGM0zJc/2YPbb1bMCkS7+mm477ETextKykExCQc5GgcaZpcxPuce+yHk0HQ6Tw==
X-Received: by 2002:a17:902:ea08:b0:215:854c:a71a with SMTP id d9443c01a7336-21a83f76727mr440931725ad.34.1736951892064;
        Wed, 15 Jan 2025 06:38:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/11] ofono: fix CVE-2024-7545
Date: Wed, 15 Jan 2025 06:37:47 -0800
Message-ID: <f062d2e4ad3d0a35a2dadda679632d5d213b8487.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209914

From: Yogita Urade <yogita.urade@windriver.com>

oFono SimToolKit Heap-based Buffer Overflow Privilege Escalation
Vulnerability. This vulnerability allows local attackers to execute
arbitrary code on affected installations of oFono. An attacker must
first obtain the ability to execute code on the target modem in
order to exploit this vulnerability.

The specific flaw exists within the parsing of STK command PDUs.
The issue results from the lack of proper validation of the length
of user-supplied data prior to copying it to a heap-based buffer.
An attacker can leverage this vulnerability to execute code in the
context of the service account. Was ZDI-CAN-23458.

Reeference:
https://security-tracker.debian.org/tracker/CVE-2024-7545

Upstream patch:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=556e14548c38c2b96d85881542046ee7ed750bb5

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2024-7545.patch           | 32 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch
new file mode 100644
index 0000000000..80dc3c9ab0
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch
@@ -0,0 +1,32 @@
+From 556e14548c38c2b96d85881542046ee7ed750bb5 Mon Sep 17 00:00:00 2001
+From: Sicelo A. Mhlongo <absicsz@gmail.com>
+Date: Wed, Dec 4 12:07:34 2024 +0200
+Subject: [PATCH] stkutil: ensure data fits in buffer
+
+Fixes CVE-2024-7545
+
+CVE: CVE-2024-7545
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=556e14548c38c2b96d85881542046ee7ed750bb5]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index 475caaa..e1fd75c 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1938,6 +1938,10 @@ static bool parse_dataobj_mms_content_id(
+
+	data = comprehension_tlv_iter_get_data(iter);
+	mci->len = len;
++
++	if (len > sizeof(mci->id))
++		return false;
++
+	memcpy(mci->id, data, len);
+
+	return true;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 54710aa9fd..0597caff3c 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -21,6 +21,7 @@ SRC_URI = "\
     file://CVE-2024-7539.patch \
     file://CVE-2024-7543.patch \
     file://CVE-2024-7544.patch \
+    file://CVE-2024-7545.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.43.0


