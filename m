Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651E8EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 21:33:21 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.1411.1687987992618107708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 14:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HkWrO97w;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7656652da3cso183985a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687987991; x=1690579991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ar39DWV+KTtQBaqQBGAxISXrG/1lEFD0G89NfcxJhB4=;
        b=HkWrO97wpT4MvWmPqhUswANzAsOXnufdArzH4la3JqzNHXY9V9Aa87LJ9LbpfwtSD6
         GeIw5rdZcOsXlTlOot5dPJxX7PJ3DwU2Mo05p7P4VKzAaNkhUwANOpbLn8+O48He01BQ
         n+h+nvEKiMNrdlN0lv0AXOb+meqKNksb54x1+diuRclyEviSiPIIE88kQUaVnGf+qVrW
         6B1H2BqsrOVGdWuUo9bXmxyCbdYKUcxL/NOp7vE/jSqZam7g4OphhWSw0Z9v685S0O+s
         OW4OPIojXD5QcXabVgfRpE7A2T/cu3+Nq5m9V1WKknSzQLbVVjEfu8UAra1x2eeHvxw7
         VgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687987991; x=1690579991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ar39DWV+KTtQBaqQBGAxISXrG/1lEFD0G89NfcxJhB4=;
        b=TDFphXVrqLpnRMSBPEdEYozTKRkIBo79bmsrnyxacPpfMfcNjymLe0YuRdG8hX9ytA
         3eE1rNg2ksuBBfOD3PjEiH9fueUbKZu3L/zvNAD2KEZeQ7B49RMP7vCpI14W5RfESilc
         sPFLGBW7qoubCKxaAsFlUAeonBr+04n40d8jEkAJNo2AZiHg3UA5awQOc9EYzEkPAszG
         +oDoDdJdGMXT/l9Mu4l7hboziRj6rZjJ09DqKXXRKkFxEul5SUVca5bOX3CkG/JqAfOQ
         GK1+0OSIpt58lFdV0aNRnxDZ/H/Rzulz/nZCZWTwbVAnttg5tT+NSFIwZ5aki4cHGPk5
         qF/g==
X-Gm-Message-State: AC+VfDwRQIf5dfDVsxr6RqN6xwh7Wg6bHq+3GCy8i9TNJ58yoVN0EhX1
	wAFMCtnq0dbHAR/aYlCDL3IK/d52auUIqA==
X-Google-Smtp-Source: ACHHUZ6c+9TrIcSbUA5dTZzsXj8e4CGifw8gKW2pPsKVUgy63W4bLALacttRVjJWe3igBLckYHBKYA==
X-Received: by 2002:a05:620a:288e:b0:765:874f:bd78 with SMTP id j14-20020a05620a288e00b00765874fbd78mr11745417qkp.0.1687987991409;
        Wed, 28 Jun 2023 14:33:11 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id pc27-20020a05620a841b00b0075772c756e0sm806093qkn.101.2023.06.28.14.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 14:33:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.4: cfg: fix DECNET configuration warning
Date: Wed, 28 Jun 2023 17:33:09 -0400
Message-Id: <20230628213309.920646-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 21:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183602

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Dropping CONFIG_DECNET as it has been removed from -stable
and we now get a configuration warning.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 541d169379..d775a60e9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "8d8179549a233e7517523ac12887016451da2e20"
-SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
+SRCREV_meta ?= "465d61ba36f5c7e32d1fddef078d5d2068fcc2cc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 171ff8493c..5e2b2ab6cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "ca5368c73bab4eb276a8e721df28c02ceb8f3eeb"
 SRCREV_machine ?= "abb579170926348d1518bc1a2de8cb1cdf403808"
-SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
+SRCREV_meta ?= "465d61ba36f5c7e32d1fddef078d5d2068fcc2cc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 527728d9d0..336e72eede 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
 SRCREV_machine_qemux86-64 ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
 SRCREV_machine_qemumips64 ?= "66cac7d41a43594760f6ac48e848d73315cc5dd3"
 SRCREV_machine ?= "d18af0e8acb7c4cb245739fa8165a44845ff2ba0"
-SRCREV_meta ?= "b6e41788aebaf8058d1f15f6cdcf55a6edb77755"
+SRCREV_meta ?= "465d61ba36f5c7e32d1fddef078d5d2068fcc2cc"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.34.1


