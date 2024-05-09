Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB48C25B79
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:20 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.8614.1715256312314081799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0Or+7E7w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f44b5e7f07so681129b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256311; x=1715861111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwKhBsO8KmgxZslx1vMEYaR1H9xLZlKpcsoX7rCqOtQ=;
        b=0Or+7E7whVZetgzOrOHeS6cqht9OMYQ5REoKa+23PS8j6GiyO7jLqgBgEAT5ISgKZ/
         tMg+RSFprvyOqoZadkiOXV88MsjneB0wIkf+b4vwMxHmyDjiAYAEgt0lBKCzkoTz6sJG
         xcvqSeLvUNfaPPIc1o/y1lnWmQ6mWmzA8HVGUjiMRCol5EMXjWVUb2R1T9cRpCuEI8HT
         gYvpuJRQ31kWzawlKjFhyaual1sF24hZV1bMkwyQ1f7eFwaQY6B5JlPyYaJJ+lr2QFrs
         Ei6xtZbqWWuvWLe6VmXTGPdAFDIl/zpPiOVRErMkh8RE23uxXHQ2Ot0Ma5t0jkytdbtd
         21+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256311; x=1715861111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwKhBsO8KmgxZslx1vMEYaR1H9xLZlKpcsoX7rCqOtQ=;
        b=DZKpVFBoUk/OuCdBWMsHkDykHZduh6M1o2wk+4y13alzOx/xbkYPe6qECCf4df1b4i
         z+KwfMWsVBgGaLrKWY1hPxCcqkzO6I9S3uHfz1j4et1z3asZ780wI9ZCRzXqf7RaqMr1
         svJXKkdxpFPF1eE4eqAJGYCn7HZi+s18bM7IGZV27Bj1p+t74LJhz9zAm1xXpvwsjmHU
         2/u6RVqsYFiiOn01TaMkN8g9GtqE4e/8OQT1RxSdAtKY+Ei90ee6HW2VmVjKSkhqW9zQ
         TtJlQ+b2dtQ6bJ8FJ4KaoIAgspnXMm6oe/zC3C3ztUWav1FcpR7/lrkO7Dn4t0KwgaDW
         UW9w==
X-Gm-Message-State: AOJu0YxVM7d5zAaWsMer9z5P6DFA+TcPAS7e/O6/s6n1M+fYlsMS2Hd7
	3opqSxWwkaGfr8o+YffXJ4kxuofys/L5BlT/rK9Eo0JFk03EsIsdkJP3agpY58741wcWVKHt5//
	O
X-Google-Smtp-Source: AGHT+IGmN56PQ21Pc8mTKJtl+aUix/5/itLqtZJ4B4EKTdW1Eke+2T0S/PlsTUeGm0YVbkotyal2YA==
X-Received: by 2002:aa7:8286:0:b0:6f3:ee60:54c3 with SMTP id d2e1a72fcca58-6f49c226b26mr5528105b3a.19.1715256311506;
        Thu, 09 May 2024 05:05:11 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/23] ofono: fix CVE-2023-4233
Date: Thu,  9 May 2024 05:04:40 -0700
Message-Id: <996c03dfb5295ec38286dee37c70c700b88e0a1e.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199149

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in ofono, an Open Source Telephony on Linux. A stack overflow bug
is triggered within the sms_decode_address_field() function during the SMS
PDU decoding. It is assumed that the attack scenario is accessible from a compromised
modem, a malicious base station, or just SMS.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2023-4233.patch           | 32 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4233.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4233.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4233.patch
new file mode 100644
index 0000000000..d047a0d87a
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4233.patch
@@ -0,0 +1,32 @@
+From 1a5fbefa59465bec80425add562bdb1d36ec8e23 Mon Sep 17 00:00:00 2001
+From: Denis Grigorev <d.grigorev@omp.ru>
+Date: Fri, 29 Dec 2023 13:30:04 +0300
+Subject: [PATCH] smsutil: Validate the length of the address field
+
+This addresses CVE-2023-4233.
+
+CVE: CVE-2023-4233
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=1a5fbefa59465bec]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/smsutil.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 5a12708..8dd2126 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -626,6 +626,9 @@ gboolean sms_decode_address_field(const unsigned char *pdu, int len,
+
+	if (!next_octet(pdu, len, offset, &addr_len))
+		return FALSE;
++	/* According to 23.040 9.1.2.5 Address-Length must not exceed 20 */
++        if (addr_len > 20)
++                return FALSE;
+
+	if (sc && addr_len == 0) {
+		out->address[0] = '\0';
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 8aab312ff8..f4548b8a30 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -13,6 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
     file://CVE-2023-4234.patch \
+    file://CVE-2023-4233.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.34.1


