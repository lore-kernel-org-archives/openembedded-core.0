Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24585EEE271
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 22:59:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.61248.1726181949467668594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 15:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Qt8ITf4o;
 spf=pass (domain: smile.fr, ip: 209.85.167.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53653682246so1869784e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 15:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726181947; x=1726786747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=snmbcLGoDKDwJG7Ht46tYLPoJYG8G0OAiTrDqG3boek=;
        b=Qt8ITf4oypsgrAGuvBMn5i0C3QjR9ANaRDQq3kgbGKbeNnLARB4BqQtHoozYoc8AFV
         /YCGuWsGDV4OJq50GsJhp3v1LibRBFXCxDxGXnLXU5GEGbI1eXNkRe4gNEEjyy1tuyym
         QjoIhZxi2NeHi4fCW7lW8CrAfG4jCfZukKZms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726181947; x=1726786747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snmbcLGoDKDwJG7Ht46tYLPoJYG8G0OAiTrDqG3boek=;
        b=f//22cVXgxNjMTnN6iFwX/hizSahERW9EHEwcNqTTzG/LvEHb5gHmUw3MN5dnyh/cv
         HwopM1w6IIDjekISKQpJDLbPqSiRs/x97C7W7bxexDRzqE6YS1Ga78g9XdP+wLY8bejd
         Ehm6pqpZsULnRJC4XaHKpytJ5V1bxRrErRSyMt74Mv10l5xtQRzeGRM0KzYpQPAz5o4R
         lNAFRK2I/okm1PaPCcsijdAd9AeMUmlQdvbbqxsKQSCvPqjnvgCQMLj20EH5RpGLFEc2
         oFbF2vGkkdiuQuAkSF8ocv5dXVe1eyXc7cadOMkZrPr+PCzrhlEEexYAC88fNbGNYId+
         VVJQ==
X-Gm-Message-State: AOJu0YyRqhEJIY4S8kXU2i7OWdNZ9goRgRIz+QGE7W66qXWs3s1fxYDW
	uqlt1bXMHf5TDpBTkiBn9RTA0MrTCdmfWFbMvs5jJWb6PIBr+NtYELtu5mcjV2pc/XOsNjHa+4Y
	3Jyk=
X-Google-Smtp-Source: AGHT+IFtVbKMHpsXXiuP8H/T5Ld0n48ZFI8cgIEnHAIGkJFhCzyyrww09TQB1wFl51UuOAGhxLP8aA==
X-Received: by 2002:a05:6512:39c6:b0:536:536f:c666 with SMTP id 2adb3069b0e04-53678fb4679mr3259519e87.8.1726181946587;
        Thu, 12 Sep 2024 15:59:06 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90d347sm2064831e87.257.2024.09.12.15.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 15:59:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] cve-exclusion: Drop the version comparision/warning
Date: Fri, 13 Sep 2024 00:57:43 +0200
Message-Id: <20240912225741.2147108-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 22:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204467

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Since the CVE repository is no longer being updated, drop the warning
comparision since it is no longer valid.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a232a9c3023dfec7e2d2c7e384d64006d1cf1af)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Backport: Applied the idea of the original patch to the corresponding
files.
---
 meta/recipes-kernel/linux/cve-exclusion_5.10.inc | 14 +++++++-------
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
index 4d959c90b1..4ce0664c0d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
@@ -2,13 +2,13 @@
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
 # Generated at 2024-02-21 03:55:27.305577 for version 5.10.209
 
-python check_kernel_cve_status_version() {
-    this_version = "5.10.209"
-    kernel_version = d.getVar("LINUX_VERSION")
-    if kernel_version != this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+#python check_kernel_cve_status_version() {
+#    this_version = "5.10.209"
+#    kernel_version = d.getVar("LINUX_VERSION")
+#    if kernel_version != this_version:
+#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+#}
+#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
 # fixed-version: Fixed after version 2.6.12rc2
 CVE_CHECK_IGNORE += "CVE-2003-1604"
diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index f5ccf2bc22..1f5c783db4 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -2,13 +2,13 @@
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
 # Generated at 2024-05-02 12:18:54.390781 for version 5.15.157
 
-python check_kernel_cve_status_version() {
-    this_version = "5.15.157"
-    kernel_version = d.getVar("LINUX_VERSION")
-    if kernel_version != this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+#python check_kernel_cve_status_version() {
+#    this_version = "5.15.157"
+#    kernel_version = d.getVar("LINUX_VERSION")
+#    if kernel_version != this_version:
+#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+#}
+#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
 # fixed-version: Fixed after version 2.6.12rc2
 CVE_CHECK_IGNORE += "CVE-2003-1604"

