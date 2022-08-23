Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BB4C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:48 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.4546.1661294203177576849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iLEWms4s;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id l64so13490202pge.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=DQsweaolqqeCxvUALG14UOaZl8oGCrXYE46HChk/CVE=;
        b=iLEWms4svLtzp75JojrgwCmWhQ4h4sagFKh38bjJflvCleeqM3LTOrbUn343rCq4i1
         uLuvLL+0TZYeeVZVRLBgSyz+1izvVD3v4Lj1oggSXkr8mKZEJNCj7tiR/jnn9zcREy07
         NNI+XZQTrdui+WO8aZIJ0zt4IigKAYTovR+V80uOfUctJyGWe7+9LgB51xc4Vz+n6q0B
         V3JoxV1TPf96blpY6xYxcXxepMDzke2h5cFulKudcyl2MLXM8gs1UlL2gJXTTu6dHZI6
         OhSLrOa9dCdZhNSAxwaovsK5dmgTyy8cuA8Rh1q6cQLSLdyMDX8dalAaKn61jZZKhc7B
         JeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=DQsweaolqqeCxvUALG14UOaZl8oGCrXYE46HChk/CVE=;
        b=0WKgJv/34fgxM2/DT1iXvTp2IByk6YyGjl9pYhZmfnTNheU9Fb2FL4rpkPRX85EO9P
         ibirhjnvI93Vhd7LT3X6MbeNlgeXbZ9wbqXV602393SKe9bjkqJDPx3e6+hXQ93nVEnC
         ClwjIx6yswgtRQXXJvj1Fj84lF1oJRUPCWd4lmxBy5mNCd3lF0jd+PeRouMa0kOKELQf
         SabV+XNfBcwVaSP2A9O9KBMQ9cckzKelPiWyPSQ+awbSlD8esJUpY0EDobmV/i2e/eDG
         Tm6ntmD94quaxQ/2zvFJqbM3FwzD+B/aZd5UGTJkQedpsK4618FaPAXsf7QPQhw+gr7y
         RRuA==
X-Gm-Message-State: ACgBeo3zQiqaiRofQt1mziOdDKhvzKPALWzjdOwiF85f/MZH9J9QVzrU
	uNWuuOLQ5CJiOrGw0O+QlyLTYSLYY3kGC2oy
X-Google-Smtp-Source: 
 AA6agR4mk7HcjLZgJAtlzvcVtResT8p+WOqzqS1GrhdYL/8lxvOPCMvVh404cnHG90c5+Fakn8KtFw==
X-Received: by 2002:aa7:814d:0:b0:535:c875:dd4f with SMTP id
 d13-20020aa7814d000000b00535c875dd4fmr26696271pfn.4.1661294202275;
        Tue, 23 Aug 2022 15:36:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/28] linux-yocto: prepend the the value with a
 space when append to KERNEL_EXTRA_ARGS
Date: Tue, 23 Aug 2022 12:35:38 -1000
Message-Id: 
 <099e000999383c464d38e5d6b044994e5d08a1ea.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169758

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6183b2d2f625515ea767dba3d8076a53a246874)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index cabc8f4975..7ea661e138 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -60,7 +60,7 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 
 KERNEL_DEBUG_OPTIONS ?= "stack"
-KERNEL_EXTRA_ARGS:append:x86-64 = "${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
+KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
 
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
-- 
2.25.1


