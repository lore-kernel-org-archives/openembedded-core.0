Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D904AE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 10:26:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.31184.1735035993548473108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Dec 2024 02:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=biridPJE;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436249df846so34284655e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 02:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735035991; x=1735640791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKyM9mEsxzmevPHxXCPAkND/BZKVTRw9k+/As2XO6TI=;
        b=biridPJEBtWxzXRpZIm558Acyul6h9PJD/pgwqEioTzaFW8uleicZBHmZ3Z9smedrn
         8kxVb7Ei3c0V1QSfgaQJGJNRWGmMgNoRzuJPqIzcI7gXKvcyZisuYSFBpq8Lo9+OyV3t
         XwloAKLWwkFztg/Hfdq7CDttbu+eJp03r0evxL8nmfWdJRO4JWnXu3M64/PX2jCSUnZ1
         QTJlAItJRdv/eG1R5x3LTierc8rS6fgBJ9GaXMPcLcBOFQ2TC9b8lRxoaDJ4MAe6bKIa
         DJEnXvRuh5LaPlUXQjaM8qgb7zYx9hXWU0QBJZZyXa72n56eXHIiIER7TMBthFRLAoT8
         +4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035991; x=1735640791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKyM9mEsxzmevPHxXCPAkND/BZKVTRw9k+/As2XO6TI=;
        b=UNS1O3aJVFY3SMg0OmY2sOiTeXe5VInPPrAyRrFsYk5u+aoPv+rhM34n/Cb6Pjmy39
         6dE1g1AvrnMwZ9jPfq8kDNIKFhyyvz47CTjD8E693D/ZFljUZuj6y72nTtEJ7WPYkZYq
         KdZ3Yt4Vx+b15dr/QOSrsrd6bo97QEFxzPaojW70CQ8YHfwzrVbZ1Ei/umQUw0bYlXdH
         ohiVACyQnGPJECT9EfPq9PcEULNsxPHhrLlCcFfPMRSeQ3a7vnNpTW1mvTEG558+U/RT
         MY2xxgGOLNQ4y0tByLNeZA8wLREr573rr0p7aqBQzZ5UjEu7raUejQEhvIKd1l9B/Hw0
         S/Qw==
X-Gm-Message-State: AOJu0YxbZJV32UBiJdAVgGuUumjH3STn2XC64dWxxJHbmBa72FYFLrbb
	J0yAzmebW6sBCM2UM4IS5CNyVNK4Sz9x4IUwBvXIJAmUb7dIlB9iyCmsBQ==
X-Gm-Gg: ASbGncsMJdH7Ed6GI+BZj1II7AswM81JT2sTGZEKmMsQq7H+QtK5tl29pBZ2uF8Yinq
	5y8dNZdkP8hX3otWcSeIIxcDNwewzq/BOr5JLoRakM4tixPmohymTqmIiMfyBkz7Jh8n7VSpxZz
	bmdXPsFxcyRO3o2HaXlTkqi+CxktCLPQzEWQWzC8x1AMD8YSMOoitx2z0bFkO4MXpqPM7IaH4yj
	CMdzAEVmpQcz0c6hdp6MWzqTMgNI/osyeIo3tnMy91fQB3JO2Idsg2Q3szjtXmhu2nYsO4f7OmO
	vJ4=
X-Google-Smtp-Source: AGHT+IEOYu2lDkk5kq53irsNh7QeVonCu6jCOnVV1MPyvbbRf45H4oUkIC2WNhqKuV437TXQx1zUEw==
X-Received: by 2002:a5d:5e09:0:b0:386:1cd3:8a0e with SMTP id ffacd0b85a97d-38a22406ddemr16270011f8f.48.1735035991327;
        Tue, 24 Dec 2024 02:26:31 -0800 (PST)
Received: from localhost.localdomain ([80.215.86.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm13788030f8f.41.2024.12.24.02.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:26:30 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v2][OE-core 4/4] cve-check: allow feed choice
Date: Tue, 24 Dec 2024 11:25:39 +0100
Message-ID: <20241224102557.9300-5-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241224102557.9300-1-marta.rybczynska@ygreky.com>
References: <20241224102557.9300-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 10:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209065

Allow choice of one of three feeds and update task dependencies
accordingly. All feeds contain data from NVD.

Set the NVD_DB_VERSION variable to choose feed:
NVD2 (default) - the NVD feed with API version 2
NVD1 - the NVD JSON feed (deprecated)
FKIE - the FKIE-CAD feed reconstruction

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 meta/classes/cve-check.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6e10dd915a..4bd9af4abf 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,7 +31,11 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_FILENAME ?= "nvdcve_2-2.db"
+# Possible database sources: NVD1, NVD2, FKIE
+NVD_DB_VERSION ?= "NVD2"
+
+CVE_CHECK_DB_FILENAME ?= "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION') == 'NVD2' else 'nvdcve_1-3.db'}"
+CVE_CHECK_DB_FETCHER ?= "${@'cve-update-nvd2-native' if d.getVar('NVD_DB_VERSION') == 'NVD2' else 'cve-update-db-native'}"
 CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
@@ -114,6 +118,11 @@ python () {
                 d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_group, "status"))
         else:
             bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % cve_status_group)
+
+    nvd_database_type = d.getVar("NVD_DB_VERSION")
+    if nvd_database_type not in ("NVD", "NVD2", "FKIE"):
+        d.setVar("NVD_DB_VERSION", "NVD2")
+        bb.warn("Malformed NVD_DB_VERSION, resetting to NVD2")
 }
 
 def generate_json_report(d, out_path, link_path):
@@ -182,7 +191,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-nvd2-native:do_unpack"
+do_cve_check[depends] = "${CVE_CHECK_DB_FETCHER}:do_unpack"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
-- 
2.45.2


