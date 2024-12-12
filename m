Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BCEE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 06:55:18 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.14494.1733986508667471054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 22:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZF6QnBUp;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385df53e559so178962f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 22:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733986506; x=1734591306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hB+qUWIh+gedA7JZAjT4U2ezxczkJofQBdcm0CgrESY=;
        b=ZF6QnBUp81A/UlT67qLQ3PYnf4CfcqX2dTb3841ne/VH8dvvr7Cf4FHCDAWRclvT4p
         Bs/AJ0AjkfLgjsNev8S3+RjsONsCu/+XwJyIDEZUy+KOmkHR0r4EMyaDVajVv53OwMDW
         ShusSqN4s7cMnfbw0NSTaXgIiqKF6Y3AGaxEsOn7Js+Ikg/KKIWXzpiqNmuXQQlsP6Z4
         7aJADX+0StnLVFn57VPjzWcVdrz6NeFjkk4cCrrFj/zu3wOrpGPFxHE3u4Wc+wu6x5rt
         IJ9q3AgjqchzwvU2/YdT6XFIjpPEhtL395D3516QgP/c8Z8wFFKadxoli6pFMp0uCmGm
         F3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986506; x=1734591306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hB+qUWIh+gedA7JZAjT4U2ezxczkJofQBdcm0CgrESY=;
        b=LvhWklnqqpZ07JEK5LqEdYaZYHeR522oklTaTirlJw4rsl/qh/kngsTzg8Le28ZWWI
         c7sL1o5EIeVKB6IH0HzQfhlOk96PUTgPe4H+hge/Xi31hAxcd9qx/KnrPWrHHEupr+Qh
         96gECThO7t3uPr8E7depVUJNCmTynHmdknijPVcbvh7vljj0LfcXMLIUT6E6gp6GcEpE
         7hD9fjBp2Imnj0afo+zPaRvi6Ey0EET8p0+mvzMYRTDyMOLDCC58iFhJ8QxJ+MXoxDNi
         hxAuRnJ8tI2G0VySUDQFKtUhN0wLx/DuXgmPUwJ7/51YnqZ+DwWH3SoTMOGqKhXBGGhv
         qdeg==
X-Gm-Message-State: AOJu0Yy+PfwNVw6EKJAzXF9IjT3xdbhWduYn4jTpwC4PdeTXngvEF1/+
	4SZgloRxX2n229FdZaXRGQE8nY2tz87uq9+Dy+vjJ6ldcgu5ji7cCLQmjQ==
X-Gm-Gg: ASbGncuSquvLl7dTAi9Zj58TszoJiUmN69JZxY29OpEKScOfZ4S6irT75jFwxTsnt46
	6Ml+VMjFTJHHfruGPO90SccdU7CGJbkzrfta4iv+YOQfnfsGaNRZh09SE0Dg2x9KMWxDgKvJy2/
	qEzXR2icr1yIUq6F8ssNWU2SYJNy8LN9tg3v8iUU+FcX2SCfgTRJELI6WBnnlSagOqcOtASTps7
	UyKMpfgQf0fMToHrXMGdvfZOfBNTwgBwmkn8G5pDP/2fvZYLiYvMLSkFOOo0l4ZwF4WqQ==
X-Google-Smtp-Source: AGHT+IHgx3ADBxiT6DQfJ+LgwjHTPfss95DQHnuSfhdnWDsfS2NhEbnYHiXuEQTOs2MHiw3KJsKNvQ==
X-Received: by 2002:adf:e181:0:b0:385:edd1:2249 with SMTP id ffacd0b85a97d-387876c4969mr1775979f8f.50.1733986506340;
        Wed, 11 Dec 2024 22:55:06 -0800 (PST)
Received: from voyage.lan ([2a0d:3344:23bc:5a10:70e8:c835:72ed:f8f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm3154021f8f.74.2024.12.11.22.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:55:05 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [RFC v2 4/4] cve-check: allow feed choice
Date: Thu, 12 Dec 2024 07:54:22 +0100
Message-ID: <20241212065435.15582-5-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
References: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208625

Allow choice of one of three feeds and update task dependencies
accordingly. All feeds contain data from NVD.

Set the NVD_DB_VERSION variable to choose feed:
NVD2 (default) - the NVD feed with API version 2
NVD1 - the NVD JSON feed (deprecated)
FKIE - the FKIE-CAD feed reconstruction

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 meta/classes/cve-check.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6e10dd915a..98c5129a62 100644
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
@@ -182,7 +186,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-nvd2-native:do_unpack"
+do_cve_check[depends] = "${CVE_CHECK_DB_FETCHER}:do_unpack"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
-- 
2.45.2


