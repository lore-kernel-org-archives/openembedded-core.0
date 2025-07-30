Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9051CC87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 19:05:53 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.43857.1753902345081270528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 12:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xJKS/DL7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24014cd385bso2454485ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 12:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753902344; x=1754507144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QvLVub/tn66Hr3fHuC56nhQWArLNK5GOz/8W3+b8uq8=;
        b=xJKS/DL7rU7PgDOBFbXeqvEbwCyDNxVH/b0PpVuiFcqfbd6qmjZvK9wdsPMwurpqlO
         K658LzerDsCwj8vcqL5ldFRtKwZ03VBdHgt+V+d6hpbOlv9I8c0wf+bZTJLcIyl5nrkI
         jKI+PMNES3ISMa8qu7BOidPApmuopieKesODhPGpSHrXGrqSkIbS7mhosT7ORv4rZY5d
         p6dUPOFO9curcNYDSW7bMn7F0oGtIEinJL9IujCdq6HefNwwCbeAtL0M/6dMTy2+Kyhd
         R0JCr2TQPfWVb+4DgMN6ulmQXigc4VKd7akugj9GV41kZFS4EBD4HK4cO0SIQ40DmtVg
         qYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753902344; x=1754507144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvLVub/tn66Hr3fHuC56nhQWArLNK5GOz/8W3+b8uq8=;
        b=t7i0rd0NLDtzzSrp3SkIJ9ginGn28WoU5q2QlzaF5phhBhLqHS74T/4efruOw633Ra
         NaSf4dTp66RRvuvsgdgiKYrG54rhe2Bt+aWx2tlWno9hPrcUcCyTAhOSGqkRfvW+RTQt
         LPJgwrGHX29kJPe8aPrZe5ZUvmOSfsNrLi6Wwn+2Ufu70y1OHdx2tftvfVdROB933C8F
         hTTTd6uIlnLMMxVN5/Q0oqwZ5itfXa7jo4870kpa1ekjlLO3PeloouljN05XoaVFWon/
         JnFNVBTPObIw9qfdXuuoY3nSD3hfVQtzoPpItlTMkNgZ7uqg/oQLUIfMKVVXT0NACDUc
         JhdQ==
X-Gm-Message-State: AOJu0YwsotDufYyIDYwFa5HFiZ8l2FFuQdm0rsQhI68dIR3aRM/h0WRj
	CNc4hy4v1BsbunEFXvpCuzUmPtjxUBZwFdSVFNlaOqvppBY0IacxYK7go0nRmIfNN6igwNNZNUw
	o5EBo
X-Gm-Gg: ASbGncsdr/Q0PR9IDO+Uw43D0ML3m68ecONd04VBK4NOEbYmFiKZ6BUBLjjd0K7K9Vh
	FMNYXggsGopz8e45ovEHKJ0zNQdJ/mk0Z8YuTLc5JGHGvSe9aQzjYW1h9WCfbcWcuxMTypn5lNj
	/sIGbwtdrcL2z/bs2wSCS5FlHuMyV2fiof4+LXOBJzCvJludtRO3f9Rjzf6piT8F7P4W7u8Nllg
	UxWPdlFUt1b0hBFuQ85O74hmN6iDpYy4BxUF+sCrCuCgReXdIvA/+gJwPmOGh4YUkeIgaRpHyGS
	Mej+tpjfIQ3HxLJRBuwx+NTNjop7AfWa4ilU6jRI/MFBloMc9p6GrcgCDi/aPglT2bdOzHcfbzq
	WAgmK6ym/7JqL
X-Google-Smtp-Source: AGHT+IENDrNEAz200oG6YQvvwUlaBHTFjicffcfJb8DtP5wtBuoPHr8U+AxhDVmjy+ZlY/NZpVZD+A==
X-Received: by 2002:a17:903:41c2:b0:240:aa0:1584 with SMTP id d9443c01a7336-24096b68210mr78490355ad.38.1753902344080;
        Wed, 30 Jul 2025 12:05:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240a48b77d3sm22129025ad.117.2025.07.30.12.05.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:05:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] gnutls: patch CVE-2025-32989
Date: Wed, 30 Jul 2025 12:05:26 -0700
Message-ID: <fbe5f828c63071962d571a8787298aa5fd78ebe8.1753902181.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753902181.git.steve@sakoman.com>
References: <cover.1753902181.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 19:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221140

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].

Binary test file was added as separate file as binary diffs are not
supported.

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../04939b75417cc95b7372c6f208c4bda4579bdc34  | Bin 0 -> 1782 bytes
 .../gnutls/gnutls/CVE-2025-32989.patch        |  50 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.4.bb   |   6 +++
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch

diff --git a/meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34 b/meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
new file mode 100644
index 0000000000000000000000000000000000000000..ffcfe23e99d4b353f07192729a86ffb5a249bbde
GIT binary patch
literal 1782
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

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
new file mode 100644
index 0000000000..c21fc6e969
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
@@ -0,0 +1,50 @@
+From 8e5ca951257202089246fa37e93a99d210ee5ca2 Mon Sep 17 00:00:00 2001
+From: Andrew Hamilton <adhamilt@gmail.com>
+Date: Mon, 7 Jul 2025 10:23:59 +0900
+Subject: [PATCH] x509: fix read buffer overrun in SCT timestamps
+
+Prevent reading beyond heap buffer in call to _gnutls_parse_ct_sct
+when processing x509 Signed Certificate Timestamps with certain
+malformed data. Spotted by oss-fuzz at:
+https://issues.oss-fuzz.com/issues/42530513
+
+Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE: CVE-2025-32989
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/8e5ca951257202089246fa37e93a99d210ee5ca2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS                                             |   5 +++++
+ lib/x509/x509_ext.c                              |   2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index 85efb5680..025e05148 100644
+--- a/NEWS
++++ b/NEWS
+@@ -5,6 +5,11 @@ Copyright (C) 2000-2016 Free Software Foundation, Inc.
+ Copyright (C) 2013-2019 Nikos Mavrogiannopoulos
+ See the end for copying conditions.
+ 
++** libgnutls: Fix heap read buffer overrun in parsing X.509 SCTS timestamps
++   Spotted by oss-fuzz and reported by OpenAI Security Research Team,
++   and fix developed by Andrew Hamilton. [GNUTLS-SA-2025-07-07-1,
++   CVSS: medium] [CVE-2025-32989]
++
+ * Version 3.7.4 (released 2022-03-17)
+ 
+ ** libgnutls: Fixed double free during verification of pkcs7 signatures.
+diff --git a/lib/x509/x509_ext.c b/lib/x509/x509_ext.c
+index 064ca8357..05336a0c2 100644
+--- a/lib/x509/x509_ext.c
++++ b/lib/x509/x509_ext.c
+@@ -3855,7 +3855,7 @@ int gnutls_x509_ext_ct_import_scts(const gnutls_datum_t *ext, gnutls_x509_ct_sct
+ 	}
+ 
+ 	length = _gnutls_read_uint16(scts_content.data);
+-	if (length < 4) {
++	if (length < 4 || length > scts_content.size) {
+ 		gnutls_free(scts_content.data);
+ 		return GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE;
+ 	}
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index 5cd85c5996..48ddb269de 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -29,6 +29,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2024-28834.patch \
            file://CVE-2024-28835.patch \
            file://CVE-2024-12243.patch \
+           file://CVE-2025-32989.patch \
+           file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
            "
 
 SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f"
@@ -65,6 +67,10 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
+
+    # binary files cannot be delivered as diff
+    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
+    cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34 ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
 }
 
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
-- 
2.43.0


