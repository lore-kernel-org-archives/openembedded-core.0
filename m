Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A87C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:30:21 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.29854.1644427820387340433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=rPQp+ilj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id k25so2443241qtp.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bjrGkXIZy7nx60JzEzxstww5xDXP1XGZueIXt5zX560=;
        b=rPQp+iljDc1M9I2Qw9wpXxSthHvKNZrSo36I+TZqkgOSDm55AzZwb/T0ycvQCNEGHb
         nU1CDkEi8vNl9srA376nFxRIXAhrVesjkVCvCHFfYKe+VkwyaIODlJp12rfZtlJ8fNzC
         ENxFy0h2m3GtUMLP2aUQuy6IzXZEy2YE5D+KntXf4HV4DqTuEwkNhjjt7JJ7jdsngP4W
         1ahbXNMDielAkHg6SmP++V/fZ9fj2/ns71ZiWbwgU8n7SC4+0ei1B39hf8uH3d+rZftP
         w0chIQAqystH4zRb2OVzl8u9iGOPmqh+NkKJCFWYpeK7kJpQQwq5wcrkb7iBg12Kz8Cx
         GKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bjrGkXIZy7nx60JzEzxstww5xDXP1XGZueIXt5zX560=;
        b=aMKIJunSKgBncuBCK5Ty4wBVMABEbrDxJ+cQWtArBoczCzKSzUeSdfHLU0UU9cVSVU
         hu2QPZgpuiWjesyKTfcVmZEYucA/utrco+lmeP77HVnt3G+3ezyU2V6w9cZgYxAc2d6s
         EZ4ouXro0hUyetWO1taDX817jy6rAJc64gzCjESbLa9kvPftkqXWadg8t8Eqgv8pzOEz
         llOSOzujOQxdjDHqvXVx/rHfb9y2J6UVC2OKyRY9Dt+qDN87k2+wxwdJYhuVPG4IeHUu
         tbMFaj1+0KmvFn08e1OW+8J6gHcyGH4J4X6OnMTAXftTDRNyiHBCU32yMbnCxFu4t3ym
         2LFw==
X-Gm-Message-State: AOAM532y2G1Svtyy+SB5ic+9EwoyX9veo6Zs+zVY1M/qTZkUS3iN0Usi
	uBc0iky7F9P8Ex7OJUEX7C7ivx+VmPiWvQ==
X-Google-Smtp-Source: 
 ABdhPJwXZ7wf9eOnAkQuhF+IksK9/f2O078HzOtmRUtgWie9i5W+3UZAYj1FVLhaCULGn0j6km6Yzw==
X-Received: by 2002:ac8:4e89:: with SMTP id 9mr2170118qtp.484.1644427819382;
        Wed, 09 Feb 2022 09:30:19 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:6f2:2f18:c3b:979f])
        by smtp.gmail.com with ESMTPSA id
 s34sm9503266qtc.88.2022.02.09.09.30.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:30:19 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] poky-tiny: enable qemuarmv5/qemuarm64 and cleanups
Date: Wed,  9 Feb 2022 12:30:14 -0500
Message-Id: <20220209173014.1389378-6-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209173014.1389378-1-jdmason@kudzu.us>
References: <20220209173014.1389378-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:30:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161574

Add support for qemuarmv5 and qemuarm64, and remove qemuarm specific
entries, as it should be generic now.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 2c81e3c00506..e146ecddceb9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -1,5 +1,4 @@
 KBRANCH ?= "v5.15/standard/tiny/base"
-KBRANCH:qemuarm  ?= "v5.15/standard/tiny/arm-versatile-926ejs"
 
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
@@ -15,16 +14,16 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "67b4c868eafbd63c437d0e79523c3bdc5f3aa834"
 SRCREV_machine ?= "f46816a75d738acbe4b1211153badf2f8e412780"
 SRCREV_meta ?= "26e884f8c2d22607e97900d22ad52a290f555fd7"
 
+
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm|qemuarmv5"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5"
 
 # Functionality flags
 KERNEL_FEATURES = ""
-- 
2.30.2


