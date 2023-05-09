Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933B3C7EE2F
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 16:14:03 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.37305.1683648834306359924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 09:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P8d+Gmbj;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so7810248a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683648832; x=1686240832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKo0wNmnFCrjbJ73DIWRrY+3KCiX5Z+IHFI+yPDnrHc=;
        b=P8d+GmbjdU2ofK2Ev85YCjycixP1aEbLxI269YWybmWvFvvoUktI/IMEHoZTeBSA4u
         +1bU5RuxS9FEhD97n/Be1Vsao5vf9QXHXBda9YafwLyzB/FAk/T3vcmmyHTwg8spz8mI
         eRVFdobUbT718J1hwPV6Pqm50Xfosy9zXCekTE5lwRYcnRHbX3FY4horB9U7WCdfH5ZW
         NXFFWv9fMxFUB68btdVch5hv08jzQ6g2XAUD7U+Bs2w2a6siURiCNME4J79J38YmLpHP
         lR59Qk3plN8BhXiDMVDiHkQ8A2TLTXPT2hs24R3Q/SJqns00p30t4AQLcgzj9Ir7kYbu
         9g6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648832; x=1686240832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKo0wNmnFCrjbJ73DIWRrY+3KCiX5Z+IHFI+yPDnrHc=;
        b=LSDep1d6PxsisWmzK2sdOZLTfRXJvI5KVFxn9MlJGZCnUbsTaGSDRospv/RMqAo2UV
         Lr2/lmGeYXyV2cS1YPUoApMab7JGJL8+eEHy60FBMZ6sbPLRD1/BY3KCZxJqj6FU6zFX
         EWS/cRS6u2tuiKCpqolI2wxjY9Rud0lXConxe2D0zW1d7hCaVhdm4cC6Mh5zpthJ46Ro
         5FPq1r69Hbh0fqwfZyeHZytge1AEYpMnK7IEY7Z8J3KXu4zADX4Yw/kiRKNig3barIVk
         Omht+sqVpm0Ie0h3qfE+OXEX7tLQWFxWRkLHZQaUMAaow9EnMn2HptoFYU/bKQY1BJa2
         Ggfg==
X-Gm-Message-State: AC+VfDxCy9PUFVmZ5gA4OLE2wlzv5qTUi9p4Qf5rxrgcMbGY6Z1D0Ra3
	8wUK9t5pMi3SosyO4iw8sT72CQ9wPk4=
X-Google-Smtp-Source: ACHHUZ4YVlpvHtVkXUmeXAFMxDcknZhjPDhy4U7L9xRJPYpm6wCc56xI5fjBBiI7lOLXzGuV86Gy5w==
X-Received: by 2002:a05:6402:18a:b0:50d:9e7c:264d with SMTP id r10-20020a056402018a00b0050d9e7c264dmr7173451edv.8.1683648832410;
        Tue, 09 May 2023 09:13:52 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id z19-20020aa7c653000000b0050bd2f16ef5sm903997edr.84.2023.05.09.09.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 09:13:51 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v2 1/3] libtraceevent: import from meta-openembedded
Date: Tue,  9 May 2023 18:13:08 +0200
Message-Id: <20230509161310.3839898-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230509161310.3839898-1-max.oss.09@gmail.com>
References: <20230509161310.3839898-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 16:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181050

From: Max Krummenacher <max.krummenacher@toradex.com>

Import from meta-openembedded at commit d250a0dc0 ("libtraceevent:
upgrade 1.7.1 -> 1.7.2").
Starting with kernel 6.4 libtraceevent is a dependency of perf. While
one can still build perf without it by opting out one would loose its
functionality compared with building perf from kernels before 6.4

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
 .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
new file mode 100644
index 0000000000..5e88048817
--- /dev/null
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
@@ -0,0 +1,40 @@
+From ed0a31000305d937abe47c44d705b5b52bb36f79 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 22 Dec 2022 18:32:17 -0800
+Subject: [PATCH] makefile: Do not preserve ownership in cp command
+
+Fixes
+
+ERROR: libtraceevent-1.7.0-r0 do_package_qa: QA Issue: libtraceevent: /usr/lib/libtraceevent.a is owned by uid 1000, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 965ff47..0e782cb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -287,7 +287,7 @@ $(BUILD_PREFIX): force
+ 	$(Q)$(call build_prefix,$(prefix))
+ 
+ define do_make_pkgconfig_file
+-	cp -f ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};	\
++	install -m 0644 ${PKG_CONFIG_SOURCE_FILE}.template ${PKG_CONFIG_FILE};	\
+ 	sed -i "s|INSTALL_PREFIX|${1}|g" ${PKG_CONFIG_FILE}; 		\
+ 	sed -i "s|LIB_VERSION|${EVENT_PARSE_VERSION}|g" ${PKG_CONFIG_FILE}; \
+ 	sed -i "s|LIB_DIR|${libdir_relative}|g" ${PKG_CONFIG_FILE}; \
+@@ -335,7 +335,7 @@ install: install_libs install_plugins
+ 
+ install_libs: libs install_headers install_pkgconfig
+ 	$(Q)$(call do_install,$(LIBTRACEEVENT_SHARED),$(libdir_SQ)); \
+-		cp -fpR $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
++		cp --no-preserve=ownership --recursive $(LIB_INSTALL) $(DESTDIR)$(libdir_SQ)
+ 	$(Q)$(call install_ld_config)
+ 
+ install_pkgconfig: $(PKG_CONFIG_FILE)
+-- 
+2.39.0
+
diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
new file mode 100644
index 0000000000..089b6814c7
--- /dev/null
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
@@ -0,0 +1,25 @@
+# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "API to access the kernel tracefs directory"
+HOMEPAGE = "https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
+                    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
+SECTION = "libs"
+
+SRCREV = "1c6f0f3b2bb47571fc455dc565dc343152517d98"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
+           file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+do_install() {
+    oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
+}
+
+PACKAGES += "${PN}-plugins"
+
+FILES:${PN}-plugins += "${libdir}/traceevent/plugins"
-- 
2.35.3


