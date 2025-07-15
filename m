Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677BFC83F38
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:40 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.5345.1752611796427289478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k/AfMRHO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235ea292956so55745445ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611796; x=1753216596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkFbEyhgn7PbVY69p+vJ887vvayx1PPJHLrow7clPT4=;
        b=k/AfMRHOKxoDQfBiYejn7i144Ub/culU0xms/xfRYKtiVdbwXTO21VB0BR7619JFUu
         VK1K3PBeeiWknxUVHlnALesDRszcuSTftBVgvWFgQAmw6qmQv2FdJ6Gb9gbI/iIUeWRF
         udtwywTXYxqR/hMRowX8UO/kYtUUsArM6kY7Uwdh6X9w51bo3KAi16MXJucTvm511FOe
         XNOZyhmlPpuzNvaRU/HNmvL/Id/ibd+oYkuC3rbeMtr2uBucYLw7ronEKbhwwTwFysbV
         DmIsm/dBn/nkcxGKAudEZNG/xQPuX1tWvedSZMoaEOiCd+K9fcKB5AI0FHqkpCUwreN+
         1W/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611796; x=1753216596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkFbEyhgn7PbVY69p+vJ887vvayx1PPJHLrow7clPT4=;
        b=xJRzz4Gh1uSI3SOgXsnlmTmEGIwQsxjQGNIpgmtBne3Nyn4lw7OlxLu6JMnHqVIibN
         ULclWCaVFrmOqCOu7dpyKnZt/CZfjh7UQ0NUK7uYEl4P7T/lstmid8scjrOyvWT8ICv2
         LeZhZD93kAFQ6jtwDL85sohzCyrwk30begtb+JRPmksfrpHNKDVYueFbEdtEcyFQaS0i
         cz/n6+tx3xvr/eS/Cl4JNwhF3no4OAKWoqYLuR3lVhmqICZmWLwvQIAuOwcDL7y9TOVX
         YsQoa1J6Cp4FTS/Z4VlXFHUoYr+eMCuiFvdU0P3U4WbPsFvKx59DADbBEaywocSCGtvl
         IUqg==
X-Gm-Message-State: AOJu0YyiMOoCUA6WgclVGzF5rgcu11YbdLKiPC0e6i9+hPIjDU44ANxt
	wGdHtArJwvEa5Ocva8MuAtytaRtDG774mZCZgUKSaaXXtQJ4vhhjfkMHox+XOnLbV6v5g2N/xfM
	p4KGD
X-Gm-Gg: ASbGncvl/6vfIe4xCs6B9w3KlA/EVwpJaEeYofApH1qpi2Ux+t5hSS/sg0bLOL3tpX/
	RiYTWcmVyjU+FJYtrGKyno7MpKD++On5VuvsuJH8a3TnmzzbujcO4yvfBrV+KsLIi9LIeLZ096+
	LLNiB0+0W43w+qt+UsOIFj82MP51yi9wo/CutSleaEguKQUwz7/r1KC1k1Yzgs+xnE0ZAIwRi4m
	jI4fgKe18+tRk3ArHA0SSvh8JJnqX4H9jFTQPbjmZKOgJgLG/IJR3wKYjiCNS+N0KuitNZ368Ap
	HVre+VzTcdQmDRmj8xVittGF3ZM1eypL1JqaFr/qyKUq1jYcDEOJuggNBucMMDnTEsQFyYiaaxB
	Lb5kdIq1kPh3RfQ==
X-Google-Smtp-Source: AGHT+IHZ+dcU/1Zr3azkiotA1FPEwW9hiXqQHJadzIrJ64eibqUxGWkugCIrdpEbR4Qjj4CtTt8nDQ==
X-Received: by 2002:a17:902:f60a:b0:234:aa98:7d41 with SMTP id d9443c01a7336-23e257608famr1532835ad.42.1752611795553;
        Tue, 15 Jul 2025 13:36:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/16] ofono: fix CVE-2023-4235
Date: Tue, 15 Jul 2025 13:36:09 -0700
Message-ID: <3a3519324ec390044ff9f97c0f32027782699124.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220417

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in ofono, an Open Source Telephony on Linux. A stack overflow bug
is triggered within the decode_deliver_report() function during the SMS decoding.
It is assumed that the attack scenario is accessible from a compromised modem,
a malicious base station, or just SMS. There is a bound check for this memcpy
length in decode_submit(), but it was forgotten in decode_deliver_report().

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2023-4235.patch           | 37 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
new file mode 100644
index 0000000000..ce03bbd274
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
@@ -0,0 +1,37 @@
+From 02aa0f9bad3d9e47a152fc045d0f51874d901d7e Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Wed, 4 Dec 2024 10:18:51 +0200
+Subject: [PATCH] smsutil: check deliver reports fit in buffer
+
+Fixes CVE-2023-4235
+
+CVE: CVE-2023-4235
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=02aa0f9bad3d9e47a152fc045d0f51874d901d7e]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/smsutil.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 484bfd0b..ac89f16c 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1240,10 +1240,16 @@ static gboolean decode_deliver_report(const unsigned char *pdu, int len,
+			return FALSE;
+
+		if (out->type == SMS_TYPE_DELIVER_REPORT_ERROR) {
++			if (expected > (int) sizeof(out->deliver_err_report.ud))
++				return FALSE;
++
+			out->deliver_err_report.udl = udl;
+			memcpy(out->deliver_err_report.ud,
+					pdu + offset, expected);
+		} else {
++			if (expected > (int) sizeof(out->deliver_ack_report.ud))
++				return FALSE;
++
+			out->deliver_ack_report.udl = udl;
+			memcpy(out->deliver_ack_report.ud,
+					pdu + offset, expected);
+--
+2.30.2
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 8a298bfade..a3edf4ab5d 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -27,6 +27,7 @@ SRC_URI = "\
     file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
     file://CVE-2024-7537.patch \
     file://CVE-2023-4232.patch \
+    file://CVE-2023-4235.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.43.0


