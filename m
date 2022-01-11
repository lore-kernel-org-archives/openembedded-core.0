Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597E8C43217
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:00:06 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.11306.1641924005606467270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YMTqDLn4;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id c19so126529qtx.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=40QHQONOEXzwL7cSVlGm8E+fA15BNrhH49KdbVV0YCE=;
        b=YMTqDLn4IHC4G2ZGgOAXeD5MUqaYnvJeN2E8PhPb9X/z5Gxq7HACMfAv0/7y7d84RV
         QWKVMUZmaqw9gVWGGn7szsWBanWOII8iUq6Vs4XhxU6QUmSoJil6k/QAdt7J1bqfTCMK
         obqMbu5JKTy9zf7IlbHFSJRVoCiQ1rpP+ohxwuVGRy+oiBb2M28oHQ9UwHN073HMAVkt
         mkB7lGfDoi8xexUEXk9Pym3yDn+MsLb6O+SLfnGzlU//jWPICCpEag/sIzSvwnK3lrdK
         uJUqao363CemPqIBpcqmB3AVR+6QZHfxoI1WyU43wRoR1U+zX2KghSSpGxcJitITmL2v
         enwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=40QHQONOEXzwL7cSVlGm8E+fA15BNrhH49KdbVV0YCE=;
        b=FVvFV3q++C7tZbomEePLIVFIgm4yW2Qar524pPEdMTwJwQBXM0i0g+iWfAwHWMmrh8
         s+nAjKQVwwoNLYQ0pjgVCk5IheIfA4mXpDp0/QRwBu4aDU7FAtY5dDyGUpFhY4SLwm6X
         sm4Od11yfWMXU9OPlKr2H/LhLQzajD59m5mg3IM9YVZm2GlhdGe0A1HitTQDKwJ4kzgC
         Pem+4aaGuTJpihflmVPyZ0O18tcc8ZImM3197Xi8A6/oqj7Qsw+GMASlrsIrZvkhlhco
         QAwY9DPcT3fnZztkUStik2/k6z4uhNssp+B4otEGBnNS81J26jC0PGzMFB1aWHH9igdr
         vfTQ==
X-Gm-Message-State: AOAM530nZyUAfGfyIvFualH+vHMVeOul+8YttEnh3jqFZdwXLGXbJf/D
	m9VDgUUV6ep4HpLzUSEut8J5tqt8ObC/Jg==
X-Google-Smtp-Source: 
 ABdhPJxtx92VixFEBGgwNdCOr26DkE1rAEnxOxcy/EWZ6SjFduNl1p+zS5HJy5urDGbqJh4uZ3Aoaw==
X-Received: by 2002:a05:622a:104c:: with SMTP id
 f12mr4720868qte.362.1641924004222;
        Tue, 11 Jan 2022 10:00:04 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x7sm7360749qkp.128.2022.01.11.10.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 10:00:03 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] linux-yocto/5.15: fix arm 32bit -rt warnings
Date: Tue, 11 Jan 2022 12:59:52 -0500
Message-Id: 
 <1f3649826040b8f005bb44a180ffcc2941f9bd0d.1641923693.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 18:00:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160428

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to:

41e5b01b59c preempt-rt.scc: arm should come after ftrace
6fe0a923260 drivers-zynq.cfg: update CONFIG_NET_CADENCE option

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index ea50600972..3d600acde6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "11651ef1c948677add527afd54c9f960a33884c8"
-SRCREV_meta ?= "c5d4d9353dad22aa75f6192cd4ff15cf14c69a68"
+SRCREV_meta ?= "41e5b01b59c69ac58f588bc7dc7d2e2cb80d82e1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index bf7e39b630..6f5bf33d74 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "0f7af34df7639ad8c513e6698d5f1a6081b55f77"
 SRCREV_machine ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_meta ?= "c5d4d9353dad22aa75f6192cd4ff15cf14c69a68"
+SRCREV_meta ?= "41e5b01b59c69ac58f588bc7dc7d2e2cb80d82e1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index cdb7be779a..b06184a2ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
 SRCREV_machine:qemux86-64 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
 SRCREV_machine:qemumips64 ?= "723cf54aff5756af97663c4a8a7bf0754d0d940e"
 SRCREV_machine ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
-SRCREV_meta ?= "c5d4d9353dad22aa75f6192cd4ff15cf14c69a68"
+SRCREV_meta ?= "41e5b01b59c69ac58f588bc7dc7d2e2cb80d82e1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


