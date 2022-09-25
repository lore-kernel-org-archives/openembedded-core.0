Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6CDC54EE9
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 14:35:10 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.17512.1664116510037791532
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 07:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IW5KD8nF;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id t4so2942833wmj.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=K9YefoM1dn84hAzrVKVDuYEqfRdl2BeALcLRJbQRh/M=;
        b=IW5KD8nFwj1NFsb8x76sqPXgmngpwppSbuzZAr2H3eiIdbrraYBvbab40AGdRDmIj+
         VqXNHXVF4MktKsPJu1Qd09vFLsKf2o1PaO2CFT2RoV5u6jD4yAkafvWTx7y5Mvccd/L1
         WR7xhuKyBrn1n/NE+LnLwGKCu1mfYTl6gB5jKjnBB8WkcksH3W0iyRXlIGVn96VTxGKQ
         CAKvAMYuN9sFhZ0WHQnkmKse2EzNvYlISsJcijnRIv2cca3XPEw65s3e9x3RKmdGMNgM
         X/lek7AFwSOE3ad23ZuVytB+0dPG7ciTGIJjtP1Esi1+GmGmi07Ckt/fF6GYckUo7usN
         47SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=K9YefoM1dn84hAzrVKVDuYEqfRdl2BeALcLRJbQRh/M=;
        b=DBJkPUupYsYrilYrs2WcUPekA3QMpKrlcj8fxy4VhPL0pQ+o4pSuaODH4xj2VwGj+E
         QoajvUG0wgnmYH+qAMBkmqEw08k8fIL/sb/+NScE4PbPw3fAYrFRV1x0kx0XTqltYgYh
         /Pbiey8+VxrXMidxDdZqo/msmz+2xFzBgDQIBGA2498XHjOMQPBkJ2KdeMN5jE0Icaph
         VBQeCwPsYtMhhGlJCsSEFRQBk5S9ft9fd+6iPpZEmOUWm+rLrISgGPX8ygsfg89OUtLv
         m4UF1pZPji1lvkXhydVrdwNMatoBZMnEL747W+M7PzvlxH64UHN3YgzDuTt3g22yUnXx
         B8Jg==
X-Gm-Message-State: ACrzQf3NKNylcDz1X+blxWWNGVjmFbofxaErjl0mLiLS9vqgf1de5RdM
	6kD3zmicBeLtKv0Dy++ICGYg+HX9fwQ=
X-Google-Smtp-Source: 
 AMsMyM5//LYw0jUSpFs2NuLtHj6YCW9Y1zCexojlLabtbvSIrxTQ3fLhcC6HGiOs7SoiTVJqUxjj4w==
X-Received: by 2002:a05:600c:2286:b0:3b4:85b0:1c3c with SMTP id
 6-20020a05600c228600b003b485b01c3cmr18983133wmf.21.1664116507937;
        Sun, 25 Sep 2022 07:35:07 -0700 (PDT)
Received: from localhost.localdomain (ip-109-40-242-105.web.vodafone.de.
 [109.40.242.105])
        by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003b4868eb71bsm9097373wmq.25.2022.09.25.07.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 07:35:07 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH 2/2] iproute2: merge .inc into .bb
Date: Sun, 25 Sep 2022 14:34:41 +0000
Message-Id: <20220925143441.38925-2-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220925143441.38925-1-changhyeok.bae@gmail.com>
References: <20220925143441.38925-1-changhyeok.bae@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 14:35:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171011

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/iproute2.inc                     | 89 ------------------
 .../iproute2/iproute2_5.19.0.bb               | 91 ++++++++++++++++++-
 2 files changed, 89 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iproute2/iproute2.inc

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
deleted file mode 100644
index c292b95e36..0000000000
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ /dev/null
@@ -1,89 +0,0 @@
-SUMMARY = "TCP / IP networking and traffic control utilities"
-DESCRIPTION = "Iproute2 is a collection of utilities for controlling \
-TCP / IP networking and traffic control in Linux.  Of the utilities ip \
-and tc are the most important.  ip controls IPv4 and IPv6 \
-configuration and tc stands for traffic control."
-HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
-SECTION = "base"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
-
-DEPENDS = "flex-native bison-native iptables libcap"
-
-inherit update-alternatives bash-completion pkgconfig
-
-PACKAGECONFIG ??= "tipc elf devlink"
-PACKAGECONFIG[tipc] = ",,libmnl,"
-PACKAGECONFIG[elf] = ",,elfutils,"
-PACKAGECONFIG[devlink] = ",,libmnl,"
-PACKAGECONFIG[rdma] = ",,libmnl,"
-
-IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc rdma', d)}"
-
-EXTRA_OEMAKE = "\
-    CC='${CC}' \
-    KERNEL_INCLUDE=${STAGING_INCDIR} \
-    DOCDIR=${docdir}/iproute2 \
-    SUBDIRS='${IPROUTE2_MAKE_SUBDIRS}' \
-    SBINDIR='${base_sbindir}' \
-    LIBDIR='${libdir}' \
-"
-
-do_configure:append () {
-    sh configure ${STAGING_INCDIR}
-    # Explicitly disable ATM support
-    sed -i -e '/TC_CONFIG_ATM/d' config.mk
-}
-
-do_install () {
-    oe_runmake DESTDIR=${D} install
-    mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
-    install -d ${D}${datadir}
-    mv ${D}/share/* ${D}${datadir}/ || true
-    rm ${D}/share -rf || true
-}
-
-# The .so files in iproute2-tc are modules, not traditional libraries
-INSANE_SKIP:${PN}-tc = "dev-so"
-
-IPROUTE2_PACKAGES =+ "\
-    ${PN}-devlink \
-    ${PN}-genl \
-    ${PN}-ifstat \
-    ${PN}-ip \
-    ${PN}-lnstat \
-    ${PN}-nstat \
-    ${PN}-rtacct \
-    ${PN}-ss \
-    ${PN}-tc \
-    ${PN}-tipc \
-    ${PN}-rdma \
-"
-
-PACKAGE_BEFORE_PN = "${IPROUTE2_PACKAGES}"
-RDEPENDS:${PN} += "${PN}-ip"
-
-FILES:${PN}-tc = "${base_sbindir}/tc* \
-                  ${libdir}/tc/*.so"
-FILES:${PN}-lnstat = "${base_sbindir}/lnstat \
-                      ${base_sbindir}/ctstat \
-                      ${base_sbindir}/rtstat"
-FILES:${PN}-ifstat = "${base_sbindir}/ifstat"
-FILES:${PN}-ip = "${base_sbindir}/ip.${PN} ${sysconfdir}/iproute2"
-FILES:${PN}-genl = "${base_sbindir}/genl"
-FILES:${PN}-rtacct = "${base_sbindir}/rtacct"
-FILES:${PN}-nstat = "${base_sbindir}/nstat"
-FILES:${PN}-ss = "${base_sbindir}/ss"
-FILES:${PN}-tipc = "${base_sbindir}/tipc"
-FILES:${PN}-devlink = "${base_sbindir}/devlink"
-FILES:${PN}-rdma = "${base_sbindir}/rdma"
-
-ALTERNATIVE:${PN}-ip = "ip"
-ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
-ALTERNATIVE_PRIORITY = "100"
-
-ALTERNATIVE:${PN}-tc = "tc"
-ALTERNATIVE_LINK_NAME[tc] = "${base_sbindir}/tc"
-ALTERNATIVE_PRIORITY_${PN}-tc = "100"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
index 6a007797c9..3cbf80a810 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb
@@ -1,4 +1,15 @@
-require iproute2.inc
+SUMMARY = "TCP / IP networking and traffic control utilities"
+DESCRIPTION = "Iproute2 is a collection of utilities for controlling \
+TCP / IP networking and traffic control in Linux.  Of the utilities ip \
+and tc are the most important.  ip controls IPv4 and IPv6 \
+configuration and tc stands for traffic control."
+HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
+SECTION = "base"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
+
+DEPENDS = "flex-native bison-native iptables libcap"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
@@ -8,6 +19,82 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
 
 SRC_URI[sha256sum] = "26b7a34d6a7fd2f7a42e2b39c5a90cb61bac522d1096067ffeb195e5693d7791"
 
+inherit update-alternatives bash-completion pkgconfig
+
+PACKAGECONFIG ??= "tipc elf devlink"
+PACKAGECONFIG[tipc] = ",,libmnl,"
+PACKAGECONFIG[elf] = ",,elfutils,"
+PACKAGECONFIG[devlink] = ",,libmnl,"
+PACKAGECONFIG[rdma] = ",,libmnl,"
+
+IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc rdma', d)}"
+
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-EXTRA_OEMAKE:append = " CCOPTS='${CFLAGS}'"
+EXTRA_OEMAKE = "\
+    CC='${CC}' \
+    KERNEL_INCLUDE=${STAGING_INCDIR} \
+    DOCDIR=${docdir}/iproute2 \
+    SUBDIRS='${IPROUTE2_MAKE_SUBDIRS}' \
+    SBINDIR='${base_sbindir}' \
+    LIBDIR='${libdir}' \
+    CCOPTS='${CFLAGS}' \
+"
+
+do_configure:append () {
+    sh configure ${STAGING_INCDIR}
+    # Explicitly disable ATM support
+    sed -i -e '/TC_CONFIG_ATM/d' config.mk
+}
+
+do_install () {
+    oe_runmake DESTDIR=${D} install
+    mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
+    install -d ${D}${datadir}
+    mv ${D}/share/* ${D}${datadir}/ || true
+    rm ${D}/share -rf || true
+}
+
+# The .so files in iproute2-tc are modules, not traditional libraries
+INSANE_SKIP:${PN}-tc = "dev-so"
+
+IPROUTE2_PACKAGES =+ "\
+    ${PN}-devlink \
+    ${PN}-genl \
+    ${PN}-ifstat \
+    ${PN}-ip \
+    ${PN}-lnstat \
+    ${PN}-nstat \
+    ${PN}-rtacct \
+    ${PN}-ss \
+    ${PN}-tc \
+    ${PN}-tipc \
+    ${PN}-rdma \
+"
+
+PACKAGE_BEFORE_PN = "${IPROUTE2_PACKAGES}"
+RDEPENDS:${PN} += "${PN}-ip"
+
+FILES:${PN}-tc = "${base_sbindir}/tc* \
+                  ${libdir}/tc/*.so"
+FILES:${PN}-lnstat = "${base_sbindir}/lnstat \
+                      ${base_sbindir}/ctstat \
+                      ${base_sbindir}/rtstat"
+FILES:${PN}-ifstat = "${base_sbindir}/ifstat"
+FILES:${PN}-ip = "${base_sbindir}/ip.${PN} ${sysconfdir}/iproute2"
+FILES:${PN}-genl = "${base_sbindir}/genl"
+FILES:${PN}-rtacct = "${base_sbindir}/rtacct"
+FILES:${PN}-nstat = "${base_sbindir}/nstat"
+FILES:${PN}-ss = "${base_sbindir}/ss"
+FILES:${PN}-tipc = "${base_sbindir}/tipc"
+FILES:${PN}-devlink = "${base_sbindir}/devlink"
+FILES:${PN}-rdma = "${base_sbindir}/rdma"
+
+ALTERNATIVE:${PN}-ip = "ip"
+ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
+ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE:${PN}-tc = "tc"
+ALTERNATIVE_LINK_NAME[tc] = "${base_sbindir}/tc"
+ALTERNATIVE_PRIORITY_${PN}-tc = "100"
-- 
2.17.1


