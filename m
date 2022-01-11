Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56832C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:00:05 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.11456.1641924004235395516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i2YEvtLx;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id s19so114756qtc.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UuiqvOZUPuPKBn7++Xe+oQKp6w7PL+XQeBjw9hnaPDA=;
        b=i2YEvtLx0zjY2UUvPpQskWfSVdox+NN4GZjlfY7pNHztXCh8bGxsS8LsU4rd13v+qP
         7SYurWTKNoqQllf8RfxihNh/QpDxzcKL4IM1d7osbMIjEu0wJ6vahi2u5ulgzS9/BhXw
         LgE1D5AryqwjnT70HQc5JDqnC8qXgGW09rgjQfwmxTcIr5udVjCzZP0GyxV90rApYzDk
         yEAT+LAPHlw/vMC3vI+u4amHOlKG2rzCdpwJRwVTEwlEZO9rV/H17ceSbJK+RTcT4Bmv
         1AtHsHrT4UFhcd1Lkk0n13SzfmzeIqyRSyT+rWz9xJgASXXixmA0MxK1ceykAZleZjqN
         s7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UuiqvOZUPuPKBn7++Xe+oQKp6w7PL+XQeBjw9hnaPDA=;
        b=Iqa/+e0LuP43lkdYGaDGQo26XzFT0sJNF2hwF3OteXMnSGuSy1CgiPWZFh+Yucl/Nz
         nJsp/QllmNMFW0fX8+OMhpoVDF87VSyMHYJLvo8k1zR3PlNILbi5tLbHI0NkiTgba+NR
         hhP/QXCdBKqmi/6hKUNH73wQS3BpZrSxe5vt+BLd5+0DL+Wc27LGSkoc3cEQe2kt9gj+
         WyV75veaDhJLlucy0NSPgYGRNOnkONWMrh0+RGx0XTHV0+Ew1qxzpDpzoe1SF6vr2HQx
         SZNPZ2wQ+SR9WSgn57kWN4HOIDuB3XqOOAqXdn2BkSovt/J5G+b0pbtCAJHxkB1mJLEg
         3EFg==
X-Gm-Message-State: AOAM531VtkFxvRwQGqqipKdqNAOmsi3tIhkbvwfSa/Qyj01118/eSt3B
	3reiQy4L/51tGCiqYd2SqzYStSPn3lpiww==
X-Google-Smtp-Source: 
 ABdhPJyeeHa0FcLNNQIcpP/PPKh0V6OSjgLfEV4PrB0T519ulu+rhZeXytd9XQlA83J1iZYQr0H9vw==
X-Received: by 2002:a05:622a:118d:: with SMTP id
 m13mr4578338qtk.507.1641924003377;
        Tue, 11 Jan 2022 10:00:03 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x7sm7360749qkp.128.2022.01.11.10.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 10:00:02 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] linux-yocto/5.14: fix arm 32bit -rt warnings
Date: Tue, 11 Jan 2022 12:59:51 -0500
Message-Id: 
 <0749da9e022971e6efb6ba8221bf56f55b8e3c0e.1641923693.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 18:00:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160427

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

f9e349e1745 preempt-rt.scc: arm should come after ftrace
25f5db372ac drivers-zynq.cfg: update CONFIG_NET_CADENCE option

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.14.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 7dcab51f01..6f22173b1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b18aaa90f5ce15336aacf4cc24c7a086aeb4bc84"
-SRCREV_meta ?= "4f4ad2c8083408bb303e110090dcf5ca0ad447dd"
+SRCREV_meta ?= "f9e349e174542980f72dcd087445d0106b7a5e75"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 23062df3b0..d44fac6094 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "159f57f8e022351d5193e51c02c951f2e255db1a"
 SRCREV_machine ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_meta ?= "4f4ad2c8083408bb303e110090dcf5ca0ad447dd"
+SRCREV_meta ?= "f9e349e174542980f72dcd087445d0106b7a5e75"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index aa7bf53682..b5be96b7c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
 SRCREV_machine:qemux86-64 ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
 SRCREV_machine:qemumips64 ?= "f6646a344afbf6cacc91cbeaaec4240b372dd192"
 SRCREV_machine ?= "9d5572038eacda2e2a86e3f743f35ec415319fb4"
-SRCREV_meta ?= "4f4ad2c8083408bb303e110090dcf5ca0ad447dd"
+SRCREV_meta ?= "f9e349e174542980f72dcd087445d0106b7a5e75"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1


