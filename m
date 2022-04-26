Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B62C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 03:28:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.1989.1650943738606288737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 20:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gj8UOXck;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id n18so29042895plg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 20:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3q6dJg6vq7jFmT1v8QwMWZdNBQjtbd9rPRk6UdpdemA=;
        b=gj8UOXckV8pm3YZGP/ReEoegqAk+RkexoK2XJ2bIIYovhTyx9YFj4VLJj9pdgmJOxC
         /Y7mO5k8wKlrIhiktPxHhfU1j5d7dE1spf2VQpzYicC9FQvzhZNEyYSsFQwowTbsnnDG
         3zMGaYg8sZF7BHxqaLJoufN+CYe73MGTKQ8zuLH66ER6w0g24fZPLBOicdS5+20DXXNX
         t9G2oV9C79Xcw7o5WcPD1mvpKQGG/mKFr9YdrE87x/tUfQGsyMXXFtdLZxISFTMpeeHs
         ZjQb8E6HeSBZppFDq9CL3FdEs+954PtahIHYlosWO+p5+z3zrti1A0rdWFHiB42+GmAy
         H+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3q6dJg6vq7jFmT1v8QwMWZdNBQjtbd9rPRk6UdpdemA=;
        b=kTkSSEfLgNLTU1cYYusvyl7GuA+WUiscSg0v6q29uGjAbLANur8uHYNTEI4qvcYZRh
         zaesn4+fJfpDSFss+6qZTVrjQCm3/cGBgcNNtT+/pBmnEnrkgGk1CFBP0RCcOy2khqQi
         C/z31q2lCN3SGpc0QdPfBGDM7LlegFZi0FJimfKb5Tlf6j/zHZZsB5s7F9XzkXdxnTuy
         N8+E+vPbUTbq2Mc+RhV/I1zUMhdqw8LwfrU2S1FBqQ70PifS4TKRxUOnQQkojGIQ++Hh
         YeNLviFpMCOSiANBcewfRxOwZMC8MU4kJwd3YNAWI7Y+Q27NfVDLraTgGcBG+YmXglS5
         W6Aw==
X-Gm-Message-State: AOAM530KI8Wy/IinrecmAH/b/Oz464KMNEb47oPPOEBlDcBCTwev/uXq
	E97fqpQLpBJPr3ZYhuOiGk0+hT1wZDIHjg==
X-Google-Smtp-Source: 
 ABdhPJx40dQNp8b068wNWJI01aT0/FNxHLRpDE8Nb8wq/Q5CcDEysvJCgRPmhzR7BF0o0Ng5f6jLMw==
X-Received: by 2002:a17:902:d5cd:b0:156:6263:bbc7 with SMTP id
 g13-20020a170902d5cd00b001566263bbc7mr22236228plh.160.1650943737459;
        Mon, 25 Apr 2022 20:28:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 g6-20020a056a001a0600b004f7bd56cc08sm13112790pfv.123.2022.04.25.20.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 20:28:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4] musl-locales: Add package
Date: Mon, 25 Apr 2022 20:28:54 -0700
Message-Id: <20220426032854.878793-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 03:28:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164855

This package will provide a limited set of localedata for musl based
systems. It will fill in into images when IMAGE_LINGUAS variable is set
however the choice is limited to the given 13 locales as of now.

e.g.
IMAGE_LINGUAS ?= "de-de fr-fr en-gb"

would work fine

Default locale can be set by exporting LANG=<locale> in /etc/profile or some
such file e.g.

export LANG=de_DE.UTF-8

This will also help in ptest coverage with musl where some test packages
expect locales e.g. pango to name one.

Do not empty out IMAGE_LINGUAS forcibly for musl anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- Fix typo in LICENSE for musl-locales output package
- Do not reset IMAGE_LINGUAS for musl
v3:
- Skip parsing recipe when TCLIBC != musl
v4:
- Fix the tclibc check to include recipe only on musl

 meta/conf/distro/include/maintainers.inc   |  1 +
 meta/conf/distro/include/tclibc-musl.inc   |  3 +-
 meta/recipes-core/musl/musl-locales_git.bb | 75 ++++++++++++++++++++++
 3 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/musl/musl-locales_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8bbcf071603..8efa27324f3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -519,6 +519,7 @@ RECIPE_MAINTAINER:pn-mtd-utils = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-mtdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-mtools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-musl = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-musl-locales = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 8badbbb40a6..98d7a801ac8 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -10,6 +10,7 @@ PREFERRED_PROVIDER_virtual/libc ?= "musl"
 PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
 PREFERRED_PROVIDER_virtual/libintl ?= "musl"
 PREFERRED_PROVIDER_virtual/crypt ?= "musl"
+PREFERRED_PROVIDER_virtual/libc-locale ?= "musl-locales"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
@@ -19,8 +20,6 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED += "ldconfig"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
-IMAGE_LINGUAS = ""
-
 LIBC_DEPENDENCIES = "\
     musl \
     musl-dbg \
diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
new file mode 100644
index 00000000000..fa814d2bd90
--- /dev/null
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -0,0 +1,75 @@
+# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+#
+SUMMARY = "Locales support for musl"
+HOMEPAGE = "https://gitlab.com/rilian-la-te/musl-locales"
+LICENSE = "MIT & LGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cf5713fba707073020b1db2acaa73e78 \
+                    file://LICENSE.MIT;md5=a4f1c6864a83ddf4b754cdab7d593523"
+
+SRC_URI = "git://gitlab.com/rilian-la-te/musl-locales;protocol=https;branch=master"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "1101fb2bcdd189cd9415b8bd1c775eb43527d25c"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "virtual/libintl"
+
+PROVIDES = "virtual/libc-locale"
+
+inherit cmake gettext
+
+EXTRA_OECMAKE = ""
+#
+# We will skip parsing for non-musl systems
+python () {
+    if d.getVar('TCLIBC') != "musl":
+        raise bb.parse.SkipRecipe("Only use it with Musl C library")
+}
+
+# only locale binaries are under GPL-3.0-or-later others are MIT
+LICENSE:${PN} = "LGPL-3.0-or-later"
+LICENSE:locale-base-ch-de = "MIT"
+LICENSE:locale-base-de-ch = "MIT"
+LICENSE:locale-base-de-de = "MIT"
+LICENSE:locale-base-en-gb = "MIT"
+LICENSE:locale-base-en-us = "MIT"
+LICENSE:locale-base-es-es = "MIT"
+LICENSE:locale-base-fr-fr = "MIT"
+LICENSE:locale-base-it-it = "MIT"
+LICENSE:locale-base-nb-no = "MIT"
+LICENSE:locale-base-nl-nl = "MIT"
+LICENSE:locale-base-pt-br = "MIT"
+LICENSE:locale-base-ru-ru = "MIT"
+LICENSE:locale-base-sv-se = "MIT"
+
+PACKAGES =+ "locale-base-ch-de \
+             locale-base-de-ch \
+             locale-base-de-de \
+             locale-base-en-gb \
+             locale-base-en-us \
+             locale-base-es-es \
+             locale-base-fr-fr \
+             locale-base-it-it \
+             locale-base-nb-no \
+             locale-base-nl-nl \
+             locale-base-pt-br \
+             locale-base-ru-ru \
+             locale-base-sv-se \
+             "
+FILES:locale-base-ch-de += "${datadir}/i18n/locales/musl/ch_DE.UTF-8"
+FILES:locale-base-de-ch += "${datadir}/i18n/locales/musl/de_CH.UTF-8"
+FILES:locale-base-de-de += "${datadir}/i18n/locales/musl/de_DE.UTF-8"
+FILES:locale-base-en-gb += "${datadir}/i18n/locales/musl/en_GB.UTF-8"
+FILES:locale-base-en-us += "${datadir}/i18n/locales/musl/en_US.UTF-8"
+FILES:locale-base-es-es += "${datadir}/i18n/locales/musl/es_ES.UTF-8"
+FILES:locale-base-fr-fr += "${datadir}/i18n/locales/musl/fr_FR.UTF-8"
+FILES:locale-base-it-it += "${datadir}/i18n/locales/musl/it_IT.UTF-8"
+FILES:locale-base-nb-no += "${datadir}/i18n/locales/musl/nb_NO.UTF-8"
+FILES:locale-base-nl-nl += "${datadir}/i18n/locales/musl/nl_NL.UTF-8"
+FILES:locale-base-pt-br += "${datadir}/i18n/locales/musl/pt_BR.UTF-8"
+FILES:locale-base-ru-ru += "${datadir}/i18n/locales/musl/ru_RU.UTF-8"
+FILES:locale-base-sv-se += "${datadir}/i18n/locales/musl/sv_SE.UTF-8"
+
+UPSTREAM_CHECK_COMMITS = "1"
-- 
2.36.0


