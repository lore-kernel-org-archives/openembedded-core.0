Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FEBC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 21:58:22 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.36940.1650923894528661982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 14:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LkgRqibo;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id k14so14469663pga.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 14:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VqqGzC9H5Y1koDWnBnPmstA+otNMOzwKt1bGIl7kel0=;
        b=LkgRqiboGbUzEPdhdKTD9z7Jsgd8vnJEbRcMbtOS8ggOHEJi72kbg3i1VWwOC+DWD7
         siQ+Axb7dIom2/X/WtIfVa9Cl7IiY5Q936YZrIaE+9oO858I4RqB8C3h8qbUStdtfh0R
         29ACm6Z1GUBTXEiqnnnpwLiT4wBM+QxNR+5p2QEqF3FiMLFAfyT8wB5vbwa81WeNebh6
         QMpZ4nBWBmHqBM2o07I9f7WjHcypFodZkkLHoRqrjKx5zZT5UDv6wB1N7MZcGZLsUn2O
         5vKfxrt1at30TeNubbe/Sx1Jq5tWuJzz/gdCmqfI6hbXvTUEkjk6mVIvlPjNcBs4fMCV
         M2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VqqGzC9H5Y1koDWnBnPmstA+otNMOzwKt1bGIl7kel0=;
        b=4gw6IpInwqjgxw1KEBS/GfNQPBZ4N2UdOLCgGOTsB8KFzhzyAF8i2zbUxUF/z86W4l
         IMUoDRJYGG7kiHo12NCqN7OAirwv8p90BZIj5LwpBzw3EWM6a5Wr9vpOIXY7UIwVd4l9
         XlyrLjNUFT/QiP+LHKOiMUCaLyDfPhM8EN28JKaHl4tswqL056Olu1+fNOK0m79OPP6E
         Xrh/OQ6jHjZ6EVILPIiiItGBQLE8QTOGhMJTUmH3j2T0PwXg/3wYaFx0V9By7i4ci115
         j44gqx0Ccm4771YGF3T8TTc/Mt/uZMV3l1XBtMC8lFo1+Y6vuzxayotQ1teCIGrKR0tO
         dI7w==
X-Gm-Message-State: AOAM531Q+FzPaACmZSvIk6WT+yQDHRnMhpIa1yoIHsqkFzZcjH9blysX
	Sxxlmoo5ZIvGJ1I0CmGWMBc/A/FyYHVrBg==
X-Google-Smtp-Source: 
 ABdhPJy1swKzPHeuBVKWx0VZJRHfNVucMe8lsIbrU/X2YEaZ+sFIHh/Ln44bsCIGlg3WbxmTN7127Q==
X-Received: by 2002:a65:4503:0:b0:382:aad5:ad7d with SMTP id
 n3-20020a654503000000b00382aad5ad7dmr17010854pgq.488.1650923893649;
        Mon, 25 Apr 2022 14:58:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 g15-20020aa7818f000000b00505ce2e4640sm12351960pfi.100.2022.04.25.14.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 14:58:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] musl-locales: Add package
Date: Mon, 25 Apr 2022 14:58:10 -0700
Message-Id: <20220425215810.827661-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 21:58:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164845

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

 meta/conf/distro/include/maintainers.inc   |  1 +
 meta/conf/distro/include/tclibc-musl.inc   |  3 +-
 meta/recipes-core/musl/musl-locales_git.bb | 76 ++++++++++++++++++++++
 3 files changed, 78 insertions(+), 2 deletions(-)
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
index 00000000000..36377d27113
--- /dev/null
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -0,0 +1,76 @@
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
+#:wq
+python () {
+    if d.getVar('TCLIBC') == "musl":
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


