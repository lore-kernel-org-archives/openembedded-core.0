Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F827C38162
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.5388.1650607856342250922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 23:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ACgmiwXe;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d15so8647170pll.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVwwX+LDBnFaeoupfhUwPJz1wdt+JEJwFalRAmehp6w=;
        b=ACgmiwXe/b9D3HCaX2454PiQJDOLEiHfZPt1qSVlZROop5PkbjITuaPZkTHu0ozS1C
         ZVihJNHR09ztyE9OGEe86iaHYjPpSVHoDW2xIAi5D266u6cOpDeYbJF4U6MOoi9D5ihI
         8wgdtEIkyKoFc7mH4JY/sEtCSoeH6reG8deoHV56LBHBhg+7QaMRu6gKmUTB3gzdjnNb
         /qLPZN5N45N9BYmLKfLhHzEfLkbftxnhbzZYymjnMURh0039HsMeXSTXGYaTmEeU9g7E
         8oUPC+7AIJO2O7vg57MAsxYybb3P8CWUvleeTDsb52RC/9CAwukhPR4g2wGRz+LqSwub
         L4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVwwX+LDBnFaeoupfhUwPJz1wdt+JEJwFalRAmehp6w=;
        b=fy/9k6Anonkr74f+F0L+ObvhYaoKrmwyYTeHHv+ZlQm3Lb9fWVpVrqBQIgngOPWlav
         IY4f2LGCjKeGt1PXQhBi9fIaFVioLvsjEMAT2NNasO8rGFuA5HdSibPdfopQebr9kOZJ
         KAIPutX2QfuWZqzVjbervGQ9IisjROiYwtaFIWzIIo327eWUhsDnJc4rApeV1RlzO+7K
         P51Egk+f7eCRzNA1MZNwlJgS4bi+syY8tDiPaOrNmCzcWEAwAUMXAGBpMSfRyHm6ptAK
         Ot41iynQ/cQ7syMuV/qDy2CVPIRU74bAKuVwxqLwaPJ8avGNJl///SJAorKEPCBFsFpq
         Sb3g==
X-Gm-Message-State: AOAM5311HdZw3XAeKHNyVo05+kp8tlL4g+M7fu91jvvgdip6iM2ohF4A
	yVXr+G9iV60KxhsUNyHR9HK4IRri3s37WQ==
X-Google-Smtp-Source: 
 ABdhPJxkLwMPtBvXUPUefkDjXaE2FExhiEh1n9X8O5O3PI0QUDk5d9LLO73Phjfsj6oVXBUYnB3EWQ==
X-Received: by 2002:a17:90a:4e08:b0:1cb:a3ac:938b with SMTP id
 n8-20020a17090a4e0800b001cba3ac938bmr14299235pjh.112.1650607855455;
        Thu, 21 Apr 2022 23:10:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 l4-20020a056a0016c400b004f79504ef9csm1172481pfc.3.2022.04.21.23.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 23:10:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] musl-locales: Add package
Date: Thu, 21 Apr 2022 23:10:52 -0700
Message-Id: <20220422061052.2577710-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164776

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

 meta/conf/distro/include/maintainers.inc   |  1 +
 meta/conf/distro/include/tclibc-musl.inc   |  3 +-
 meta/recipes-core/musl/musl-locales_git.bb | 73 ++++++++++++++++++++++
 3 files changed, 75 insertions(+), 2 deletions(-)
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
index 00000000000..99e71092e7d
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


