Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD79C4321E
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:51:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.1932.1650581972962316312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 15:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QR4j5GCt;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id c12so6939750plr.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 15:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0YgrboZ8+0byZwOleOs+DEM8AH/lHNud/xMTzAEA6d4=;
        b=QR4j5GCtJ6K04VNP8i21rAchtTZHUsj+Dv+gJUMYxjkVnIAXAlnSVjqVLpWSqnl2XQ
         7S9IML/052cDTLRK6YV5m/eW7I30SrLys9peDziG3dvOHgRbjSWAEJIa2w38LRUMLCSU
         Kz8ZHQiLftkQOCBHrnaO4BKefGu1gRu3PL0kliPvaYmH0SoWXvoInMo+thbKBoM+ek1Q
         hds1dRQgRnMUCcI20wOehgVwpbNN4WiOs+/pLXeuChbl0/3XVkfYaulg/JIYsrJaLSr0
         g7dtRrdpuaJJIlDrgJqgCzYqTYoPoSVqh8ksl5p4qh0mn1fGjTL+hu9lGhMZ0roZ9vAd
         WOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0YgrboZ8+0byZwOleOs+DEM8AH/lHNud/xMTzAEA6d4=;
        b=opicMymet5JlcffoakLLNFHpbyn9wTMkoFfjHDKFEARKJ3wdbs6A7gMnQDcvB1/LBO
         UUQ0ODfn6gLv25loRpBVWnKQUf5BcgMd77wsqARiBK87a2t0oQYhD+omzDI6Mv9rkA5x
         H0MhGbMW6PIODtW7qwBTfWzO4NiixSbIXWOcZHdrM5gh57bwCy1uXdh/CK9ZikTdyacU
         Mel5Wye950XVtOnP0/wrXZs1y4DOB3V4oqLLGy06p00XhOABKjVsDEgMlrhAOVkFrtdX
         LFKdM2bUT0MN/ynAR4kaolxpLGYfSMF/gWoYlTr3S5TDAcw1USn6iK7A47PETJ+sdIJP
         6o3w==
X-Gm-Message-State: AOAM533RJ+3NK9aKyI1LT7bH1DMuhjLLgz9cvzoZVIbyleBoxD9mnFw0
	DNqWiEnEgimkfRn/7uILDZWMp8g68NhBFQ==
X-Google-Smtp-Source: 
 ABdhPJzGD1aF+c5yOeKNcqS8RbW7WJ1LEoxjRblmGJ1xkSLCe9hYn+k7I4RPjvV/pEIcTNBGEcmBoA==
X-Received: by 2002:a17:903:22d2:b0:159:606:e620 with SMTP id
 y18-20020a17090322d200b001590606e620mr1689636plg.59.1650581971874;
        Thu, 21 Apr 2022 15:59:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 h7-20020aa786c7000000b00505bf336385sm165686pfo.124.2022.04.21.15.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 15:59:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl-locales: Add package
Date: Thu, 21 Apr 2022 15:59:28 -0700
Message-Id: <20220421225928.101707-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:51:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164767

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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc   |  1 +
 meta/conf/distro/include/tclibc-musl.inc   |  1 +
 meta/recipes-core/musl/musl-locales_git.bb | 73 ++++++++++++++++++++++
 3 files changed, 75 insertions(+)
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
index 8badbbb40a6..9698d35a7a4 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -10,6 +10,7 @@ PREFERRED_PROVIDER_virtual/libc ?= "musl"
 PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
 PREFERRED_PROVIDER_virtual/libintl ?= "musl"
 PREFERRED_PROVIDER_virtual/crypt ?= "musl"
+PREFERRED_PROVIDER_virtual/libc-locale ?= "musl-locales"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
new file mode 100644
index 00000000000..e883d602b21
--- /dev/null
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -0,0 +1,73 @@
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
+#
+COMPATIBLE_HOST = ".*-musl.*"
+
+# only locale binaries are under GPL-3.0-or-later others are MIT
+LICENSE:${PN} = "GPL-3.0-or-later"
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


