Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BD1E77160
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 22:38:58 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.809.1733265535028186029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 14:38:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QC+VCodN;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29e2e768952so3654603fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733265534; x=1733870334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhSOL/hQgrddmNocFmQKHkWIbGpGpeRcieDdfsiQ6zw=;
        b=QC+VCodNMr4HStE7G4TLoW/e0RO7yTp/eu13sHseumWfpU0pdAYXbvWLDHDtmS4FoZ
         S7tc5RYydMNXdeTLNXNbFPS7cTFctksqQXPszHjmeY9Le7r/EVvmon4Ds8QYZOMU7KEZ
         hQvNErQGbliaYKcUBvzFm1FOj2ZCGtaE9F3aVs0IIYW5pxUSP7EObDsxjl6O/O1cU3y6
         QbD70TJgjXmYSuRmD7FoMTufECWvwyps81UPIKLEt1fxs/SgM6OGapBj8q/iadinfi25
         TAgouj/qRclC0kDhoiGz68rMch+CVCwy6tonSe5pEnWJYd8UnxWsCvJyKA/hTjcpepoe
         Q6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733265534; x=1733870334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhSOL/hQgrddmNocFmQKHkWIbGpGpeRcieDdfsiQ6zw=;
        b=d3Xt2kioHPWara3ph/txTdExAQBwHd6Z+jUaC04H/XjZODixTdfqVuhc1xRMTyz5Bu
         WqZqGjr0uCjffTVN0QG0IQ/MjMceuInGh5IWLMM8Gb4ubEv7NL1NIC7DzIP5CqlHSEsX
         P6u0SwtdDLKjcZDPbr8xIuAcAgEO2lw1YMuF5AeHp/I686OQHKrzDOek3P5h6/KREQUd
         KEGyNUHVaC+x8nQRrQiL3h5Q3LImMEQS4qpE0H8GNaxXAwHbvoMH3SiLf2KtVWg1l2nb
         IatzByIBJW9M+lGYDKoEjTPZ0v2GeTZk1TvO2LYMYiiIH1cxL3l2riFbnSMZiClU6SBm
         X2IQ==
X-Gm-Message-State: AOJu0Yxl4yPVtMDH6ONyYRBqtPVkmEgAJsch3Mq1PG+eoJlAGCPmn8bP
	cyj6Ho5KhB2FwTXk4w5ulRwM8ZdT7XbfT3M64ur9iPjhN2tNWvNBCwa+5w==
X-Gm-Gg: ASbGncvfqWBkoz4aqsL359I7oemcXUTawJ6XQHO5Ybu7StwlTP/5mJ2czpcvBb+Y44L
	vyHw5vyMVAQYCRqtKi6Fsa1/f6+qQ51iUIPVjL5oHoeL1Czl0URsEGwXUp6Q9q/We/j/0XMtzvl
	p2VdQ1WfPEEjKgwpDk5L70M3VfgAUJ+RfepfkDsGOsGaekT1IHhvKJ57PPB5ZH8Lou4sn3ZvYH9
	OL9lbnIP70A0E/8xWUd3Igs8y2ssDeGiXYuI+nUgLD6XHvI
X-Google-Smtp-Source: AGHT+IEStOwTgJ9pInsr0FMVttXa88dv5omh/GvX+tQFlg1VZhtrzJtXaYIg1q3KPs40kAF6LLVPuQ==
X-Received: by 2002:a05:6870:4151:b0:29e:4c37:b471 with SMTP id 586e51a60fabf-29e8889287bmr5650058fac.30.1733265533759;
        Tue, 03 Dec 2024 14:38:53 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29de928c9b7sm4037836fac.22.2024.12.03.14.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 14:38:53 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 3/5] classes: create-spdx: Fix variable dependencies
Date: Tue,  3 Dec 2024 15:37:08 -0700
Message-ID: <20241203223844.2689172-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203223844.2689172-1-JPEWhacker@gmail.com>
References: <20241203223844.2689172-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208224

A few variable dependencies were incorrect from the SPDX tasks, which
prevented rebuilds from occurring, or caused them to occur when they
should not.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass |  3 +++
 meta/classes/create-spdx-3.0.bbclass              | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 51446162857..e0f1766bb76 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -55,6 +55,9 @@ do_create_image_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_image_spdx[cleandirs] = "${SPDXIMAGEWORK}"
 do_create_image_spdx[dirs] = "${SPDXIMAGEWORK}"
 do_create_image_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
+do_create_image_spdx[vardeps] += "\
+    SPDX_IMAGE_PURPOSE \
+    "
 
 python do_create_image_spdx_setscene() {
     sstate_setscene(d)
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 640f5490bda..25f3aa5f433 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -134,7 +134,15 @@ python do_create_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_spdx(d)
 }
-do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS"
+do_create_spdx[vardepsexclude] += "BB_NUMBER_THREADS SPDX_BUILD_HOST"
+do_create_spdx[vardeps] += "\
+    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
+    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
+    SPDX_PROFILES \
+    SPDX_NAMESPACE_PREFIX \
+    SPDX_UUID_NAMESPACE \
+    "
+
 addtask do_create_spdx after \
     do_collect_spdx_deps \
     do_deploy_source_date_epoch \
-- 
2.47.1


