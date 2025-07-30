Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808E5C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:05:53 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.43743.1753902349671487222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KxSjSObw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7494999de5cso95239b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902349; x=1754507149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=er24vtki4ItXF4CSr93WSfIudYdIMdJE2HKmJiEwv8E=;
        b=KxSjSObwfsrefTG236RCuOy2/lA8H8ykE5B2xTU9VHgVcOaZVF5jWj3e2+w2FgiNQc
         A420MLyQofGjW6Lf7CYfLS43hPNbQlwto7Dpm6gyPsD7wwuT+qhAH0ns7byv8QRfGhcB
         +alwB69Gc934IXa9SutGWvaJiK9dJB1ukkVDPp+6QIHE1UiNSXNDWBcoppWO6Ao5HBe/
         s4WKytGOFCfrT7wgpfl2WaAAf0O3O3Brhvb+i7zQ8IveEzqrhkrkdPiFd4QFTxRSCWTP
         Ms40MBtIbav0HPhVhSFrP691oKk8+4aWuRMweZwswFHd5CMuOhhVR6WASKD/fW/AylV1
         jOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902349; x=1754507149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er24vtki4ItXF4CSr93WSfIudYdIMdJE2HKmJiEwv8E=;
        b=g1C4oEM78CiuaJDB3I0vfvS8kt64b85+LwkmJta2wswyh2wNO7asSmpBYE6ZV13mkC
         LFSCFZ1V9HaHCyV36PrnIAeTZAGjfV+fcvJfG0CvYrnvCY+SMKw3VB/CYJnxeW5HmpDo
         mZAEXeC/I0Ywx6NNXqTF5sHPPY+fAgmCUqKYY/pDnCvw35W+L/uqrbzrLHgmQANGINxM
         35xAQeWL7LiC62uoBO4e4xZnPGgcEsau61PsJJjYR7+ZUO+e63KaH57pGBIl4c0vfy+z
         HByrtumekOjJknGyQm2JtbQMM6DeloJZrKFL9qMNTDOXDGJArVdmVWuovv0JrgPTSMQJ
         hNww==
X-Gm-Message-State: AOJu0YzeHmN4SwCEgQ64XCeD/k8/rBtY2cTkVPMq3UU2wXaOhx4HQgii
	Kz9UsAMkCk8kAUIVWCARdnWVm3nBbCzbIGwgXl+Kx2lGpw1OuEkWWYeut5QWk/CXF26RHw4Rlyb
	nD0Cs
X-Gm-Gg: ASbGncuxryPQ7rdKvMiUCxhdXknG9xPSYT6xIxwg32K1avzoW7O+ibJWwOfqY5xW8ZR
	Cqkp2TdIL1ef+k7NvrkgpNAMpwntkMS0X43DvhLRAa3bPSeb0+VKuXfe79b3XVmXp72OZFGtj/s
	1AgvcMXV/xwZo4WwB+9Q7OS4NU9gp3+sd2N5Q6NPrmyM9W25RyjxsNqg4NAcd9J8L4od+P9WSWD
	gt8HWmGJNUspU6USv1OiliP8DG+9PmLwvzHz4jELlSxqN2RYung7vvo7pPS/w6BRfluM1SAS1wU
	m3mTfxHsSlE7R2w0jnfAdVlXTUi7+IiPfArR3HfzUgIDbIF2NquYwp5OqAXMfwxZv2gA2pTDiB7
	TsNmdrWOyrFyV
X-Google-Smtp-Source: AGHT+IGQsMCzcot5Nnx7wnCbMT6NDMFN4TfFRtqN7smMYloEl0Hxn1P58fCehaZxESAYzTEo6Qfozg==
X-Received: by 2002:a17:903:e91:b0:240:63a9:30c9 with SMTP id d9443c01a7336-24096a6f7e3mr43377955ad.17.1753902348543;
        Wed, 30 Jul 2025 12:05:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/10] gnutls: patch CVE-2025-32988
Date: Wed, 30 Jul 2025 12:05:29 -0700
Message-ID: <3600752d06c14fcfa0bc1b96222cc6a164955bb5.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753902181.git.steve@sakoman.com>
References: <cover.1753902181.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221143

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2025-32988.patch        | 58 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch
new file mode 100644
index 0000000000..4779787bc3
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch
@@ -0,0 +1,58 @@
+From 608829769cbc247679ffe98841109fc73875e573 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Mon, 7 Jul 2025 10:44:12 +0900
+Subject: [PATCH] x509: avoid double free when exporting othernames in SAN
+
+Previously, the _gnutls_write_new_othername function, called by
+gnutls_x509_ext_export_subject_alt_names to export "otherName" in a
+certificate's SAN extension, freed the caller allocated ASN.1
+structure upon error, resulting in a potential double-free.
+
+Reported by OpenAI Security Research Team.
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE: CVE-2025-32988
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/608829769cbc247679ffe98841109fc73875e573]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS                  | 5 +++++
+ lib/x509/extensions.c | 2 --
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 025e05148..ff289fa75 100644
+--- a/NEWS
++++ b/NEWS
+@@ -10,6 +10,11 @@ See the end for copying conditions.
+    and fix developed by Andrew Hamilton. [GNUTLS-SA-2025-07-07-1,
+    CVSS: medium] [CVE-2025-32989]
+ 
++** libgnutls: Fix double-free upon error when exporting otherName in SAN
++   Reported by OpenAI Security Research Team. [GNUTLS-SA-2025-07-07-2,
++   CVSS: low] [CVE-2025-32988]
++
++
+ * Version 3.7.4 (released 2022-03-17)
+ 
+ ** libgnutls: Fixed double free during verification of pkcs7 signatures.
+diff --git a/lib/x509/extensions.c b/lib/x509/extensions.c
+index 6c2da8fd1..e8be12eaf 100644
+--- a/lib/x509/extensions.c
++++ b/lib/x509/extensions.c
+@@ -805,7 +805,6 @@ _gnutls_write_new_othername(asn1_node ext, const char *ext_name,
+ 	result = asn1_write_value(ext, name2, oid, 1);
+ 	if (result != ASN1_SUCCESS) {
+ 		gnutls_assert();
+-		asn1_delete_structure(&ext);
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
+@@ -814,7 +813,6 @@ _gnutls_write_new_othername(asn1_node ext, const char *ext_name,
+ 	result = asn1_write_value(ext, name2, data, data_size);
+ 	if (result != ASN1_SUCCESS) {
+ 		gnutls_assert();
+-		asn1_delete_structure(&ext);
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 65e42c00c2..33553e617e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
            file://0001-x509-reject-zero-length-version-in-certificate-reque.patch \
            file://3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 \
+           file://CVE-2025-32988.patch \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
-- 
2.43.0


