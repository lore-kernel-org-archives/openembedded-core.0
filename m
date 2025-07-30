Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE8FC87FD6
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:24 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.47214.1753910957437078163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1T/nRwlb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23dc5bcf49eso4166255ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910957; x=1754515757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj8NBJfZ/rxtSQTfZYCTIOQbeoatc3iyunMQ9iujhQM=;
        b=1T/nRwlbpxoeFUujBmPcH/8Ofu4dXUIQkUU1q9nWrCB6Oc7ZCF+foCC0t0MGAxyr1D
         g48F27KIm9JdyUCJL2R4nYVHfEKEO8J2Iy0zpQo6DMZ672RQlJ4Z8x492ELUXe+ysOeR
         dGXnW7MvncBvEAJ89wiNPYBOdy+qGqKM0/gI9bB2uKhvEAHlDEfaj/agy7Fx0hVzC9AI
         qOQSAzyMpUvPFSeb+0rI8oUrtZRPz+7AQKWGIim9PGDtYQHIpfEnhr/iEMye0SyZMSU8
         xMarUswFFuOdhaQ7supL/SywtzizGqHUYWu5m9VdI/oAz5GUjZw7R2CPtw9DNwdvR9gF
         xYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910957; x=1754515757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qj8NBJfZ/rxtSQTfZYCTIOQbeoatc3iyunMQ9iujhQM=;
        b=tYifSOucTuMAZLYi7qbecDsj9N6vuVaHYJzD0ymGtku1b5EJ82U8pef5KlIJwcAtdF
         xxlsQ3jM/uSKYLtBgy6mCbtvD6ozY5mK5Seda6Q1NiVvzrpw3us3fK2iOO34RWvqjgm3
         5y+RKLXgY8c0B5TgtRVf+Fp90evMPrW5WDQ3gDxslFuhTTJlhvNct/9MeCBPEn70YEoC
         lkkKJl+XcuSyErkFUUl0iW6hoH4z5pIpkl+Sgcxn3RtoUgZlBnOSfKPX3PDvcYf03ieU
         /PjgBHRc2d54h2j72hn7OAOf8R8l+jFJBD5zReynJMlvsvngA+4lW3lw9qsJa0Yjyn6t
         oIzA==
X-Gm-Message-State: AOJu0Yx3SSEq33odLSZzSXakDXW3209jszn6xVlE1qE9MWlGYd2o5DYn
	qUagif9OD/PDXzyYUQyC9Gok9QgB8vFnUvM3hbm0z3YF2LBo4aHQCo37vdkVTy1kSodKItetkz7
	/LjDc
X-Gm-Gg: ASbGncuKoUxesXpa4YjCcT1vD/2A0siSYpbmOnCak1nwkZBmCboHp5KPBpUqoU+aFQn
	a+L6Qbkwxpms075RtdH8VvzHjkx5PCCKLFaiGwjfA4/Yn3WT8zqCpXz5htHNyJtEYheZXw570E1
	J/boPRoqrcIRQA7oSDccRzm++HPZpc4ZjEUaDDvh1esWe8i+LyngFDRcfKC5ba9/6yjeuyrFVdZ
	JsNjyODFXuv1/rvp0IPigZ/SseKYbMi48wEyJXWWl0Tkci7Ed1JWkR0v0JGSTzkvHGYNbAJbj3l
	Hm9IjKKUa0S0+bUpnRV73r44vjMojpCa5ZMarZS9Wu7FNr3KAT2TjERFUXhZFs5Wm8zuDDg9m1/
	gDH4vm3V87yQv
X-Google-Smtp-Source: AGHT+IHj45TPGU/CLuF9DRnur4qNcplbEm5ArEjQ/I0y4yxKJDm1g+sdnW0C8rRiTyrjWPRod4xqJA==
X-Received: by 2002:a17:903:22c4:b0:240:a54e:218e with SMTP id d9443c01a7336-240a54e232cmr49777895ad.53.1753910956644;
        Wed, 30 Jul 2025 14:29:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/11] gnutls: patch CVE-2025-32988
Date: Wed, 30 Jul 2025 14:28:55 -0700
Message-ID: <2838dae57a1236d4f6eb97e32eb500892ba67184.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753910853.git.steve@sakoman.com>
References: <cover.1753910853.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221163

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2025-32988.patch        | 58 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-32988.patch
new file mode 100644
index 0000000000..007dfb2309
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
+ * Version 3.8.4 (released 2024-03-18)
+ 
+ ** libgnutls: RSA-OAEP encryption scheme is now supported
+diff --git a/lib/x509/extensions.c b/lib/x509/extensions.c
+index 6c2da8fd1..e8be12eaf 100644
+--- a/lib/x509/extensions.c
++++ b/lib/x509/extensions.c
+@@ -754,7 +754,6 @@ int _gnutls_write_new_othername(asn1_node ext, const char *ext_name,
+ 	result = asn1_write_value(ext, name2, oid, 1);
+ 	if (result != ASN1_SUCCESS) {
+ 		gnutls_assert();
+-		asn1_delete_structure(&ext);
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
+@@ -763,7 +762,6 @@ int _gnutls_write_new_othername(asn1_node ext, const char *ext_name,
+ 	result = asn1_write_value(ext, name2, data, data_size);
+ 	if (result != ASN1_SUCCESS) {
+ 		gnutls_assert();
+-		asn1_delete_structure(&ext);
+ 		return _gnutls_asn2err(result);
+ 	}
+ 
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 2a73a1e3d8..9644f3c50e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://5477db1bb507a35e8833c758ce344f4b5b246d8e \
            file://0001-x509-reject-zero-length-version-in-certificate-reque.patch \
            file://3e94dcdff862ef5d6db8b5cc8e59310b5f0cdfe2 \
+           file://CVE-2025-32988.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.43.0


