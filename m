Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541AFC02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 14:35:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.13328.1738766124879269805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 06:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHL1RNIo;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38daf14018eso1314545f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 06:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738766123; x=1739370923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ7sNtiDCiqs+PM/kP6I5gdURYbIXXqI8SshTgYSEC0=;
        b=CHL1RNIormZ0ShmrSEl7olsoKKc5nnipCIfdq8CU+RO5DoOggi0soE/RlOnUGmfBKW
         SSefW+OBCv/ZgGb8Ko0ch/wfybMHbjrjW/rvLgrKcEci+lWI1kFUsOhybiPqDzddB3/G
         7K5SbwWBepQsxQbB2c31rwIbh6tAFktElQqX0/Y0jskqp78//qAWzY1QUhkQf0h14AHY
         5Dy6fIBlRMSMu8iMmExIj/s6phRv7Gj1lJxz24qZsQqBnDnGEolK44KSQroirqR35Rq1
         V/aA/EKflgN3lM+k+0uZSmnvdW0KU9BRceO1u8q3De2BGHiSPu/qLWHdLrSqbDd+Te7K
         kF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766123; x=1739370923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ7sNtiDCiqs+PM/kP6I5gdURYbIXXqI8SshTgYSEC0=;
        b=BNYZco877tFo4NzYeH2Tdt2/RJSkmKzKKXjzWHbNDhYWv/xSzykDgke+tgVuZcHYO3
         juXGwXsrz6HRBjgxVohKkOQEwtmkPyIP826c4gL4pqAylP9GjBh0CBanMUP5m7tnKvvH
         +H6djBMr2PysHWGiKaI01G7soFktExCpt/HZrl+OIYaZ7DkrXAUz3bwwtMnLFfnMTmSE
         Wg3h7j8DNsSddou4IIHO4gff/Zu8lBgE6FvH2Kn1ZUrkZ46hBuxHX1+mROfUWkNgWaoe
         NExCnRby+yWtm9eaiEeYEKACNFYiov/RH3dPC8erlmRETBlfWlEDeBv+cMGbVVpTJP5T
         0T1w==
X-Gm-Message-State: AOJu0YwFqrWd8l6kAoA9QjqtAnjQBdyDVBs5GhsJR7BKXI1eZRslYsWy
	AI5qUkSfR5dLPMFAy5coSqtslfitmhoTftcfbevbB501sBY/MTnYYMEWodpm
X-Gm-Gg: ASbGncs/em9t8HTT2WZqmv7NQXTJ6FLbJ7RB6cSEC0iIj1D99S4bJScL7TrplQhFrBI
	HCT1VRQ6uwn3JZrWyrpyOHg2m3EuYTRF8fA/Q6z4qN7LkhmJ/NbkGQSQPZxAOCchYVnbxIOVa3q
	MmY/e4NXnJFzRE/9m0p+kv2btggcjKWVGkZmvpdEWvFzmuTPreJ6+p4+4N4k/mblE4oqLbx+f1/
	gYxwG4nZKD+Jpbjr6+Ugnn2p2H/8J3R2id1SsDglIlu/O/4kanyMNvk6Hy+Cij4ylM485UBwcwj
	GMwsD0i3fRX1u/lD3N14yjIpbn99URY+i4Y3bGmsDIUX
X-Google-Smtp-Source: AGHT+IGrbsFAP10tPxfGz3IM6VDsiQQlyC4DpW9gpujScMyhQDGwL7gTCkG3SkaNTZNucvN6eQlX5w==
X-Received: by 2002:a5d:5f4d:0:b0:385:ec6e:e87a with SMTP id ffacd0b85a97d-38db493f0famr2639072f8f.43.1738766122807;
        Wed, 05 Feb 2025 06:35:22 -0800 (PST)
Received: from localhost.localdomain ([2a04:cec0:10ef:d61d:4bb8:b29b:dacd:c52b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bccsm18614600f8f.27.2025.02.05.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:35:22 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v3][OE-core 4/4] cve-check: allow feed choice
Date: Wed,  5 Feb 2025 15:34:13 +0100
Message-ID: <20250205143439.38233-5-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205143439.38233-1-marta.rybczynska@ygreky.com>
References: <20250205143439.38233-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 14:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210853

Allow choice of one of three feeds and update task dependencies
accordingly. All feeds contain data from NVD and are stored in
different files.

Set the NVD_DB_VERSION variable to choose feed:
NVD2 (default) - the NVD feed with API version 2
NVD1 - the NVD JSON feed (deprecated)
FKIE - the FKIE-CAD feed reconstruction

In case of malformed database feed name, we default to NVD2 and show
an error.

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 meta/classes/cve-check.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6e10dd915a..90097cfde8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,7 +31,12 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_FILENAME ?= "nvdcve_2-2.db"
+# Possible database sources: NVD1, NVD2, FKIE
+NVD_DB_VERSION ?= "NVD2"
+
+# Use different file names for each database source, as they synchronize at different moments, so may be slightly different
+CVE_CHECK_DB_FILENAME ?= "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSION') == 'NVD2' else 'nvdcve_1-3.db' if d.getVar('NVD_DB_VERSION') == 'NVD1' else 'nvdfkie_1-1.db'}"
+CVE_CHECK_DB_FETCHER ?= "${@'cve-update-nvd2-native' if d.getVar('NVD_DB_VERSION') == 'NVD2' else 'cve-update-db-native'}"
 CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
@@ -114,6 +119,11 @@ python () {
                 d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_group, "status"))
         else:
             bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % cve_status_group)
+
+    nvd_database_type = d.getVar("NVD_DB_VERSION")
+    if nvd_database_type not in ("NVD1", "NVD2", "FKIE"):
+        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD1, NVD2, FKIE. Defaulting to NVD2")
+        d.setVar("NVD_DB_VERSION", "NVD2")
 }
 
 def generate_json_report(d, out_path, link_path):
@@ -182,7 +192,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-nvd2-native:do_unpack"
+do_cve_check[depends] = "${CVE_CHECK_DB_FETCHER}:do_unpack"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
-- 
2.45.2


