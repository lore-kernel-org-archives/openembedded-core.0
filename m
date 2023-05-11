Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE60BC7EE24
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:22:18 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.11658.1683847338494313938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 16:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=obniHEAs;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-50c8d87c775so12440618a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 16:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683847337; x=1686439337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6h4ktFgu4anbaA8VVfvyjvqkFv/Bx72BwJ9qJEFj3Nc=;
        b=obniHEAsbS4Bc2I0ko7KANumOfh71g2bDAypZA2uJjvu1GiDTKPjsYIPVEOGCPetVc
         vYi99kfV1vhmO9I6cAgFyR4dWOt2jk/QsOK7Cj8ESD6/y4bTmC0QQQ8cz2cpQCWUzqyV
         Rt0jWnSIRV1CHbBifeFKANpO7B9EiR33astxFjYOA68AW56NvEMUiKXMe6/XAVRBAI6M
         wAlHI5Bz+1Ve+brAWrTNeJeY5ZPFTMz34YilPd4Ate14EXI4E6z62uf2x9vUWkUENswY
         +cXEHfiO0pnj0govBcT69h9p9M4MwefAaxvdjtOIjRXK7GO0GCtnia+rvVdv7fpnzumk
         Z1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683847337; x=1686439337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h4ktFgu4anbaA8VVfvyjvqkFv/Bx72BwJ9qJEFj3Nc=;
        b=lHwJXqN5mmokrF5SaTiJweF/veFub2wF19PPyxeiz6nm4GBv4X1EB9uTpnr4QM8/wo
         uRUCVqrWYMDpplp0HCxlDCpD7hSfpGmQtPSJuBWnTE4eoXhXck5kOcHw1iZXZMEGisR0
         7Un4MkliUQCJ6bjzx6g6pzft+sGZctWbpzr8mu/VOE2sX3mWZfta8gMzJpsI5DWHXKUa
         kzEOnU5fH0MwolbP3JrPhcVWcX4/UDGAdNDwLRXPhlwCE1y6PDtQ0gADZw1Gx8RHtOT2
         r+KLUVhz2O93NFFLjCEEZvZPAuYlGPti6mbwU/+UGsDJiVEAhBcI8sI1M/4ILKdy2xUc
         e0/A==
X-Gm-Message-State: AC+VfDwH1UvSh6HjJd+PW1Ktlh8oJz+L+7udD1BLjzDg+srH1DM8n+l3
	GIhiFhOMssqS33UWcFi4PmSUDH7qYc8=
X-Google-Smtp-Source: ACHHUZ6PdToDq40ioixfCbuuStwUeChWTbFKCJC0fB3WbZGUvLZhe/yMjJeZdZ9iXYzo0ou4Ra37ow==
X-Received: by 2002:a05:6402:503:b0:50b:d75d:3155 with SMTP id m3-20020a056402050300b0050bd75d3155mr18020529edv.37.1683847336818;
        Thu, 11 May 2023 16:22:16 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm3480162edv.36.2023.05.11.16.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:22:16 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	alexandre.belloni@bootlin.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v4 1/4] libtraceevent: import from meta-openembedded
Date: Fri, 12 May 2023 01:22:11 +0200
Message-Id: <20230511232214.993328-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230511232214.993328-1-max.oss.09@gmail.com>
References: <20230511232214.993328-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 23:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181168

From: Max Krummenacher <max.krummenacher@toradex.com>

Import from meta-openembedded at commit d250a0dc0 ("libtraceevent:
upgrade 1.7.1 -> 1.7.2").
Starting with kernel 6.4 libtraceevent is a dependency of perf. While
one can still build perf without it by opting out one would loose its
functionality compared with building perf from kernels before 6.4

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
 .../libtraceevent/libtraceevent_1.7.2.bb      | 25 ++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ec7ea90d16..3071671850 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -402,6 +402,7 @@ RECIPE_MAINTAINER:pn-libtirpc = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-libtool-native = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-libtraceevent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-libtry-tiny-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libucontext = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libunistring = "Anuj Mittal <anuj.mittal@intel.com>"
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


