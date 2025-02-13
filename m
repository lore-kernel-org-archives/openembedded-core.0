Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB56C021A8
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 05:58:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.4984.1739426336025609707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 21:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CRIla/yC;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso4904405e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 21:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739426334; x=1740031134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ7sNtiDCiqs+PM/kP6I5gdURYbIXXqI8SshTgYSEC0=;
        b=CRIla/yCRMYvkxHgwEMVwwPcuNYoOl1FmZkByMMkCSwN10dmkNyN4QjZF7Yn4SHMCr
         kumZFkkdmENIa/q1gW+bDDuC7S4mVYFqW3YuYYAeZrDVU7A6nvUlzAPboQjSDDhlzjMw
         DGpj1nQewuX98iZU8RN/661DkaeOLXF4RXnst+UxhSPZxbHNvurPsdn/4lsAx96oHxjt
         0swI/8vjomUlXaqBqSAlV0yLkjXlV8brWHoqUGChUdYHZcqZ9y1lELGU9gLmq8IN6GE0
         AW2eOODNJJFy+23XrjEZ2xV5i/ZPXGpLYXs0fwJayuM8Rk8ShXBfTmNGUH7UTxWekDRN
         MBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739426334; x=1740031134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ7sNtiDCiqs+PM/kP6I5gdURYbIXXqI8SshTgYSEC0=;
        b=JdyT5u+T94VeTYbfQHC8UsQNixQWEGPO6Qp1m+ikoKu7lSH1xPA5MF29otcy2kjKkk
         HcOumYwwyIeWu7Q+ZxTUkLDDtVOsnRjDQoFFnJIhvC70vegwf4U4c1Zn8gRT0DJ7YmOr
         1DMCWkufD/rvzKVKthuysfoKuGOJ06R803FqlF5uUFqOo8o5x/oD8U/Sa+LnYaaCftcc
         th/MdPXOlBNRe+snhV6FqWUFKKLJXCKoN52UdBk6cnsBufxTTJuH0XWTBH+Nw39GqqYn
         AcNZhvtr15iuZIWetoK94M+18XV9KuRu9A5KpZwUvhT8XS0qg53jh/J5ncSQSmQQnZC3
         Gc/w==
X-Gm-Message-State: AOJu0YzPN5+7d4ayq+PhSlEpd3OCrgdT1hqByFSEBWCwyu3517AT+2If
	pB8QlYsPg8FLG1S3THgtYvw7arBQvEDRg0rHLiJxt4YglkbvTfRt0dyh/g==
X-Gm-Gg: ASbGncvqKqiBbINflt18cFmP5TCcF+F5Sz939NJlQIHFzs+Gl+xCnVMyuX0Ij/bU2vT
	HuLMfAMdUBerA9E7WyVxNoymQC88ogcA89Ex9XK/lj0o475ugy0U1Rkxq7nW9zbvjS/FCQMoCJD
	4Iv46VTr6FQy4tHv4YQEyAHet9czEguq5DYwCiCWYoR32HjA62DCCsiC07xHrZDyb+hA313c0JW
	3JIUkxO5x+aQLYoXS8dRdWeWBFmaeBoJSOni8Tng6KVgn/ICZuH5NLFhxPbbP/8bU1nvniXAMFk
	KiHzmuGlwH1pEr7SBNLhEiTxiws=
X-Google-Smtp-Source: AGHT+IEB7xWhf2/3RSsw3A8dAberG3y2ss34doxB20J3clH40PJnAcs2ayrS9GEwFHFo+YAVuFlsHw==
X-Received: by 2002:a5d:5109:0:b0:385:ee3f:5cbf with SMTP id ffacd0b85a97d-38f244e536emr1422620f8f.20.1739426333681;
        Wed, 12 Feb 2025 21:58:53 -0800 (PST)
Received: from voyage.lan ([2a0d:3341:cd51:2e10:d277:cf7f:82d1:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fc885sm7466515e9.9.2025.02.12.21.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 21:58:53 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v4][OE-core 4/4] cve-check: allow feed choice
Date: Thu, 13 Feb 2025 06:57:53 +0100
Message-ID: <20250213055811.6873-5-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213055811.6873-1-marta.rybczynska@ygreky.com>
References: <20250213055811.6873-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 05:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211294

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


