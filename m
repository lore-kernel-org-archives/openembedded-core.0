Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5574DC4332F
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:17 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.20373.1637901376235564287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EadM8AOH;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id z6so7698563pfe.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UK7FC1pd2sVfVkkpmgC951rn8iThjn5eprrPRV/hZnY=;
        b=EadM8AOH1c0nKmi0v7FlV1Iz2y4b1lU5hOPlqOKRxW/2D+PSltd9c5g6YkTEGg8v44
         x28KvmyslLzji2MXNIRTUpIVMq8VF8spcgaC6Wh5MfZJ32WUysHVz1+KhbT2Q3ag3mve
         Lfae+Pp8kokZHGlztTocq3/QQoZWwXFLBoWq0JajUJ3Y2m00RyL3FkTHN/W6R3UyoFpy
         DUC5He295l9ca993y1MyVG0D3/eDtttnUA75nLcrZ7uFy/B04EtkVgI2nKvLnhgtJgl2
         KzqmnrKkEc1VfcaAtjzm4eU1d4PSdEJhTX2M/5bJUhuPpNAsliV94Uz3OAfWWu7th752
         7mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UK7FC1pd2sVfVkkpmgC951rn8iThjn5eprrPRV/hZnY=;
        b=dxVHSE/3uXo7cuFLIDfRiM6IYtZvEO7hx0nilTn9DVqBBelIvFLLBAkw1vjsEtCuAj
         pQbae/4E4L2sl7e0V44aZYpFNJumdVpJ9CTD8cUdFehiSg3jBgSl2B20OPr6SCoOG5k7
         YTW8h5CtZRLtTjkiIZx06lwmjSpz4ngHaD+h9p/ZKNYnHoAamDhJlSUi15KMISKhfLz2
         JlIaG+B/JmNfM99pedLEno6W0rvCY0TYOiEmrR76sXz+eaaZtqkx278VASovqz6QOnAK
         MpggcyG/a0WMAjnHdtoW0pW9MwkCCe0Lmjf9Vic1bkrmudP/DehCgjrc0ruP2+3h9vjg
         2k4Q==
X-Gm-Message-State: AOAM533dZRnZMVY6cSWGHnLd9ChACJebERuObOA4R/CekxkhAaxjo8Yz
	wOtUu8SRtVZJELv42um4KVjdmrGbNbI=
X-Google-Smtp-Source: 
 ABdhPJyB1zOMlkIcDLcUTXB1eheKiUoIhqksTPlZxq/AAcTy79a5iqU2HH75qO/JDHkbddS0A2nsLA==
X-Received: by 2002:a65:40cd:: with SMTP id
 u13mr19645421pgp.450.1637901375432;
        Thu, 25 Nov 2021 20:36:15 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:15 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 01/26] classes/distutils-*: add warning of deprecation
Date: Thu, 25 Nov 2021 20:35:40 -0800
Message-Id: 
 <aa3135f37d48aa1718d5e7eb2a8bf30da007bfb1.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158797

distutils has been deprecated in Python 3.10 and will be removed in
Python 3.12 (predicted release date October 2023).

Add a warning now that recommends using the roughly equivalent
setuptools-* classes.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/classes/distutils-common-base.bbclass | 3 +++
 meta/classes/distutils3-base.bbclass       | 3 +++
 meta/classes/distutils3.bbclass            | 4 ++++
 3 files changed, 10 insertions(+)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index bc994f78de3..59c750a3cf7 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -23,3 +23,6 @@ FILES:${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${PYTHON_SITEPACKAGES_DIR}/*.la \
 "
+python __anonymous() {
+    bb.warn("distutils-common-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
+}
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index d41873e4869..850c535bb17 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -4,3 +4,6 @@ RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-tar
 
 inherit distutils-common-base python3native python3targetconfig
 
+python __anonymous() {
+    bb.warn("distutils3-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
+
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index be645d37bd0..a6d8e8763f3 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -14,6 +14,10 @@ DISTUTILS_PYTHON:class-native = "nativepython3"
 
 DISTUTILS_SETUP_PATH ?= "${S}"
 
+python __anonymous() {
+    bb.warn("distutils3.bbclass is deprecated, please use setuptools3.bbclass instead")
+}
+
 distutils3_do_configure() {
     :
 }
-- 
2.30.2


