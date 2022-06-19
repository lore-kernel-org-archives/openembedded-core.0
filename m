Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E94CCA47A
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:47 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.22130.1655667341948551715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=b5sXHXHx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id r66so2509001pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yc+j+1cdHtCNYlddmGWJ5jvKdLsAmIIvR5DN1pLjbsI=;
        b=b5sXHXHxnjp3JkVwRML48aW433o7707f9QU7K//ziAxrIzyKW3Mg5T4n8pIGXSTRqO
         yUXCEu8qbpfVLJngIZq9V/k3azROFHk7CQ6qX7xCdaeHX+QzMbF8liJEountZYgYlpOb
         o71LZETlM/6cSqeT50CgF4gy1y/tCkgNe3jz0KiX/2EksOur07vZZdAYiQRVI4NDu9zw
         W6w8suD3NBtflO8u/zTOPzNCXYxtYgoNNZxLNiooGDMJRe1opX4j/E/DkelMLBL8BqZ6
         EibtWDfyTHTJ6ykzfbY5Z5JeUz5K9Vu/J6rYWt0gLPVVGPfsaMfKQEmtpHZTyxeKdzVf
         qnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yc+j+1cdHtCNYlddmGWJ5jvKdLsAmIIvR5DN1pLjbsI=;
        b=QlH2/s87wV2kE7Cl/E8efw4PnLfMAxccXB0EJwm8vYjKNhCwpoSf8QjtUiqeF6m9c0
         fkEftsxstZedtbLYJE00IYKMgZKj0uZ1MyK4QNmoxYXoN8pIZQfE1wRYT9EtJHFMXA6d
         tlkqLBUQLKWtK4opsRdZ7jyrMgjcG6WpGe250jGE954QLpwVLQ6UDAd1XYmVzVKSDkLS
         tnxXs9xuFuEA4AJgeW/MUXXbVUdxk2Y15HPNNCXt+fwKP5nsO/HIX/veEfrUJKOQ9FL8
         JAOh95AIDXBTuIUXIu03OVjwHB3qxz9Sel6i9ctq5P81BC47fjcUO3BjRUnMJx0er1qH
         ROcw==
X-Gm-Message-State: AJIora/1+G7VkdRiloZvfGEqOHr7ZyPcr6lnHdJG5HdV70T1oZCyBKYS
	Jy58TkKTRAfXCFcfuOHTRlfyYoMoCAarGMsp
X-Google-Smtp-Source: 
 AGRyM1tSPGSoliYJGl5/ckjyMjlZP8tKcGfEdzVdgB5kQbdDlXAizZ1I8ez27VD2VEY/pLLSJUBf9A==
X-Received: by 2002:a63:3fce:0:b0:40c:23a5:2827 with SMTP id
 m197-20020a633fce000000b0040c23a52827mr15865484pga.314.1655667340965;
        Sun, 19 Jun 2022 12:35:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] gcc-source: Fix incorrect task dependencies
 from ${B}
Date: Sun, 19 Jun 2022 09:35:05 -1000
Message-Id: 
 <14aa189c2e47a2c5a4a0099235a2605666651f74.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167073

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some tasks may reference ${B} for gcc-source which in general would not exist.
It has dependencies on HOST_SYS and TARGET_SYS which are not appropriate for a
shared recipe like gcc-source. This causes problems for the archiver and
multiconfigs in particlar.

Set B to something else to avoid these task hash issues.

Acked-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit beb2a76c591e985c6fc7ed473abd1bee27f955a2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-source.inc | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 629fa26dfe..69a3536965 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -100,7 +100,7 @@ BINV = "${PV}"
 #S = "${WORKDIR}/gcc-${PV}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 
-B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+B ?= "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 target_includedir ?= "${includedir}"
 target_libdir ?= "${libdir}"
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 03bab97815..224b7778ef 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -18,6 +18,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
 
+B = "${WORKDIR}/build"
 
 # This needs to be Python to avoid lots of shell variables becoming dependencies.
 python do_preconfigure () {
-- 
2.25.1


