Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B22DC636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 17:41:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.19710.1676914866798966218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 09:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GAF4mXCW;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id t15so2137304wrz.7
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 09:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjV/hS2Ak0VQ2oQmGYFC3HhQburkW/zVO8t0bdSBVTA=;
        b=GAF4mXCWeLnm9Z0o2EkM5BkCsuKOGo9T5oBwYEM4XkmCftN2hRpoJPhV42HmGtUbNE
         dSGGv6sO8okKi0j+QwwBrYWcutixoj9OSrG1cJrR+zLC49GMHSAKyxf7rdpGzzFEyFOr
         z83CV3ks+ktLqMJafgBaj/+Jrz7qpTfBUem62JNSaAZho7TfJVo0rT+SsHFQ5w3hSXel
         AIJnIU4dN2d/irKDxUMQPeK9SqK0SsaLF5NcvcC1u3av8nLhb8Sx9t6GDhFLlFJ30OKC
         hgD4hKnLh5tTik95Y4cJuObT1oOWD3VzvQuLIG9gZ2NoyxQ4hRXeB7c+jsjkhZQ7QWzO
         NEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjV/hS2Ak0VQ2oQmGYFC3HhQburkW/zVO8t0bdSBVTA=;
        b=AfpmMtL1TFUCwNUDmFG3e4HzHbIW1XMSoy96oiZ97T0U3b7Sg7R9w6NOwpswycr6mS
         lxMKRi5SnxzDXrbay2nntIjAh7DoAMEUmfC/Pn1MO1j9kYsbz4gWGtzHqa39ggphCGn2
         ipimkSWkDacF13FIqkZl1Abp4rocmk4JzxDWhRbHtUUqvsbkk6s8bOKY7W+GdcAMLcg8
         i294n3qGQ7OTyAKaBLNJseon7ICuO5jv0N/O70YBD5VSWtMup0Lvcsw4eHDG19OI3xfO
         MuDTyLThDam0mwso+RPvjIzYPhrUIFaPCrMDWEN/PqoXhO4+5qBiD1j8sqXi/1RGzr0M
         Vw9Q==
X-Gm-Message-State: AO0yUKWANz4y2hvnnN2Pk7mQsdSjwwH4MfAreOSBXDxy6yqPrS3g3jOv
	Iw0MbtMoRNUaOYvXlIh//OqvBThbs8zcR8Fw
X-Google-Smtp-Source: AK7set+SghS1Ds3aag5UeNax3U03p3SA8IJkRWYpRaNwys0zGnifa3DVWA9hnG/SH5MIvUv8IBSvRw==
X-Received: by 2002:a05:6000:1289:b0:2c5:5451:9d7a with SMTP id f9-20020a056000128900b002c554519d7amr441443wrx.46.1676914864950;
        Mon, 20 Feb 2023 09:41:04 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id j9-20020adff009000000b002c3ea5ebc73sm2820168wro.101.2023.02.20.09.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 09:41:04 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs: handling the firmware installation with usrmerge
Date: Mon, 20 Feb 2023 17:40:35 +0000
Message-Id: <20230220174035.2731323-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 17:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177447

The ti-img-rogue-umlibs package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../libgles/ti-img-rogue-umlibs_1.18.6276027.bb               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
index 924e46ba..94d14ded 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.18.6276027.bb
@@ -25,6 +25,10 @@ PVR_WS = "lws-generic"
 RDEPENDS:${PN} += "mesa-megadriver libdrm ti-img-rogue-driver"
 
 do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
+        mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
+        rmdir ${D}/lib
+    fi
     rm -rf "${D}/etc/init.d"
     rm -rf "${D}/usr/lib/libvulkan.so"
     rm -rf "${D}/usr/lib/libvulkan.so.0"
-- 
2.34.1


