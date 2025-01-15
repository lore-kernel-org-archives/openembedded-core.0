Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E26C02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:14 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.22655.1736951891321583634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AmMqfFHc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2167141dfa1so18182745ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951890; x=1737556690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4w+7J9IRKuV1WBu/k8izw+38n49pktIS162T32ZNO6Q=;
        b=AmMqfFHc0lQ0wD0qUPGsYu8iooeeAwd8JuMDnH7ur9qpxjP9T26g9L2e70aiALuBvG
         BhX9bKJEGF9v+U867VlHHZxHaKCaD47XzKxWHMohtCnFzVdVswZmOkgg34H96+GMyjOm
         SKnl2Il26f47AjJFrWwjD5FHNVDADZfzKXx2+w24PHGTG9AmAQVM3j7YAVwSJ0gD+J89
         Wx+5DeMEA7tK6oQ0oosQVDIFeWb3mUhcDwAB+IzdVYBQDxUm3Pw5QYn+XCfWczCOpRkw
         1wkcbwnhoyQueHrOrG6TjTrzfW9ModPco3yhPKikAI0lqGmbBp1afcJ8hpoemjy89fCG
         9+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951890; x=1737556690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4w+7J9IRKuV1WBu/k8izw+38n49pktIS162T32ZNO6Q=;
        b=VzxdOyU4mraKeQ7h2BjG2FK+8pmBgilcWSnq+5dxw+IOb9GeMAQs7pnEgavVjVTQyu
         Ta12SdpWeJ/XfF8VYFgBDCAdlgtJDL0kd64b3svfL+4dLGOyQdhc/7hBh8MsfR4mN6iP
         INaWWrau+Wcx2hhA9nEUUA6xhryIOXremqqI/QGWLGKi0Lp/zJLZONafxkFX4rZ1oUmp
         z4nae/VAO1zoYyBoMYqZnZMO+7jWSBLzJAX787/cpJEP6tlnvls27APGOKKmuu8FUlEe
         G7Mqjpo0rPY57912t3Z1KxvBpKhVMKKRAx4Gl3NoG/iIBR+RdGTjrcYE88BMliDVXILF
         wY1w==
X-Gm-Message-State: AOJu0YwPoyqZbSB7lMGjkPU4uh6ZxbaETBU9UmJA1I3WAOyeeNQJxXMV
	jxFhmYQW544kGQvNfWtWgAcSd4ZccBblYcotKfNha/cdyViKpabpb4XCoP0Ffe5V1SKJ64nagdL
	dJBU=
X-Gm-Gg: ASbGncv3+0LpkC4i7nK2G/ovuOZUHxCBDWJjXkBdtGpafN3ONlcKSw13u6CmvSNeaF/
	PadVjbFHKd3u24dA1gbFv8Twleroyp2+/tXkg0orhuZSntDROMYTzjU6tjdCkTfqA8XH4MEWWSG
	b3xaUiKfMvJn1KsoCAtOdHscKX2SswVYGadxW3yIugmnZJ8Ek55U6L2bP9RWd5pCZyCoKaqV/MD
	WT/NN1MdjZcwG+mF5WEIY8ecGiXneRsA/VZ/Y5/IzP8Bw==
X-Google-Smtp-Source: AGHT+IEqSp+i29HSiRL7RgxBLRGOpePXhndNA3biTw3T/Ox4fnI6Zr2Lp57ZT0KJrIINtdzn82RLKA==
X-Received: by 2002:a17:902:fc86:b0:21a:87e8:3891 with SMTP id d9443c01a7336-21bf077daafmr47124295ad.6.1736951890633;
        Wed, 15 Jan 2025 06:38:10 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/11] ofono: fix CVE-2024-7544
Date: Wed, 15 Jan 2025 06:37:46 -0800
Message-ID: <c4e7d6fad2ed96296bcea2b7d12b41e1354eafa8.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209913

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
context of the service account. Was ZDI-CAN-23457.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-7544

Upstream patch:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=a240705a0d5d41eca6de4125ab2349ecde4c873a

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2024-7544.patch           | 30 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch
new file mode 100644
index 0000000000..ebbf809030
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch
@@ -0,0 +1,30 @@
+From a240705a0d5d41eca6de4125ab2349ecde4c873a Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Tue, 3 Dec 2024 21:43:49 +0200
+Subject: [PATCH] stkutil: Fix CVE-2024-7544
+
+CVE: CVE-2024-7544
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=a240705a0d5d41eca6de4125ab2349ecde4c873a]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index fdd11ad..475caaa 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1898,6 +1898,10 @@ static bool parse_dataobj_mms_id(struct comprehension_tlv_iter *iter,
+
+	data = comprehension_tlv_iter_get_data(iter);
+	mi->len = len;
++
++	if (len > sizeof(mi->id))
++		return false;
++
+	memcpy(mi->id, data, len);
+
+	return true;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 731b186b12..54710aa9fd 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -20,6 +20,7 @@ SRC_URI = "\
     file://CVE-2023-2794-0004.patch \
     file://CVE-2024-7539.patch \
     file://CVE-2024-7543.patch \
+    file://CVE-2024-7544.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.43.0


