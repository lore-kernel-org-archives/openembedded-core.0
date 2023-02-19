Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F67CC05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.3852.1676835079540292228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hfec3TBn;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id bk4so884543wrb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTy+3czUHt6b2irCgOSPLqGS2LmqZYS5eWaGSCkKWb4=;
        b=Hfec3TBnJxuXQcMrzj33/zNeYLVpbbKn7VS48SojiMFP4wkbjFT98IioqYeGqY6XMi
         tEY7QG+DopSyMArdYTtn/iHHy7r/FdEQ/WmRTz+NwppiMe/dpZEMnIRQAFVX/rV0Q6ob
         /xxswKMHq7OwZgXcoJpApXzDAWSyalIpY8boiIdnbv9z+omEtSFVVmoP0ASOhorJp/cf
         u9McYwTsSDxBmHtBy9sx2JImtdDgIbSQf7Z5ApHP1QH2rTxnHPc0P32qUo/ELF3His1Z
         JPxBtcU42xpRwX7t0fb12YDPxCTn34k/LpYtF47edYUg/sFHTeLa9/Ou4aBNC77QW4EG
         cG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTy+3czUHt6b2irCgOSPLqGS2LmqZYS5eWaGSCkKWb4=;
        b=bGA3DL5byg9bSTbN6aChvrKHEdRAEJkXVRFI0nfbe8vsvlfnOWSTJdX8yjqyf5ncsd
         ITMSEfdl121nruf//Mi606P0kLrlXRub4ze97xpPgGzN2EJQmrem4f5PACwcB0P02ZJM
         XYus+Tcxna23pef8UuNBoES8IvA9GTD9o7YZeIEWGIw0qBqI+S9k7lKAyysSzT63nUP2
         cXr6MkVl79ZDGFVyvS6fCMBvejy7P5Xc4YhYN+rMcddoTkSNHzyE+Dppdijz7ftNBk9h
         2LcZ+xPKwvRzkcUa3wgR4iQLF9Tc4l9HSttxXCffjg4PrRZKRXgOz+DAEVqnWj7Nwjxa
         q14w==
X-Gm-Message-State: AO0yUKVgjlJGDw3R3xszMUfYjAnL7Z8gzlnNxKa3AZu8ccrJCZGPZBGF
	EljYB7Wji+2DnTXbou13JoBAexhdQLM=
X-Google-Smtp-Source: AK7set9/T1S0xxln7OMr0g5X3IE6VV1zWvkXYr0aZx5py97ywZKECI8h2QBRTGP3VGgz95bIMFqs0A==
X-Received: by 2002:adf:f58e:0:b0:2c3:f6ff:292c with SMTP id f14-20020adff58e000000b002c3f6ff292cmr1467486wro.55.1676835088071;
        Sun, 19 Feb 2023 11:31:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/39] libcap: upgrade 2.66 -> 2.67
Date: Sun, 19 Feb 2023 20:30:57 +0100
Message-Id: <20230219193101.338397-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177377

License-Update: added spdx ids

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...k-libcap-Raise-the-size-of-arrays-containing.patch |  2 +-
 .../libcap/{libcap_2.66.bb => libcap_2.67.bb}         | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.66.bb => libcap_2.67.bb} (84%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 8bd2050ea5..2ac1e6e560 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From a3196f3a06e7bbfde30d143c92a4325be323b3d0 Mon Sep 17 00:00:00 2001
+From 709aa8e156415215b0bb034d05b2aa2f44be044e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
diff --git a/meta/recipes-support/libcap/libcap_2.66.bb b/meta/recipes-support/libcap/libcap_2.67.bb
similarity index 84%
rename from meta/recipes-support/libcap/libcap_2.66.bb
rename to meta/recipes-support/libcap/libcap_2.67.bb
index c50e9d8cc7..008183d9a0 100644
--- a/meta/recipes-support/libcap/libcap_2.66.bb
+++ b/meta/recipes-support/libcap/libcap_2.67.bb
@@ -5,11 +5,10 @@ users, without giving them full root permissions."
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 # no specific GPL version required
 LICENSE = "BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM_PAM = "file://pam_cap/License;md5=0ad4c9c052b9719ee4fce1bfc7c7dee4"
-LIC_FILES_CHKSUM = "\
-    file://License;md5=e2370ba375efe9e1a095c26d37e483b8 \
-    ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${LIC_FILES_CHKSUM_PAM}', '', d)} \
-"
+LIC_FILES_CHKSUM_PAM = "file://pam_cap/License;md5=905326f41d3d1f8df21943f9a4ed6b50"
+LIC_FILES_CHKSUM = "file://License;md5=2965a646645b72ecee859b43c592dcaa \
+                    ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${LIC_FILES_CHKSUM_PAM}', '', d)} \
+                    "
 
 DEPENDS = "hostperl-runtime-native gperf-native"
 
@@ -20,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "15c40ededb3003d70a283fe587a36b7d19c8b3b554e33f86129c059a4bb466b2"
+SRC_URI[sha256sum] = "ce9b22fdc271beb6dae7543da5f74cf24cb82e6848cfd088a5a069dec5ea5198"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.30.2


