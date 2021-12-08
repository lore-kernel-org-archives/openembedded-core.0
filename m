Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC318C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:17 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.3052.1639000817040281922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hWJ7NWgV;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id a18so6498029wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OHUCBMaMS10nU2LzlIc61d8frikKzh17e9P/VoP7L8g=;
        b=hWJ7NWgVdW6deI153Hq14u9AqgHcBGtTHacWu8uv2P/Xq9N+agyR1wGXwc/7X9vhcv
         gZBZTz6m5AP4xr/wIyHByZ84Co+/USDWxMIeUJVKAJgN31IWYHwd1GINYjrYI4VaF6Df
         r0AxUCd+vp3zl4EoXdmMQHgPfB5M4569Nvx4h3MqNj9MztoYhZoarLnrmTWxwXaRdDNP
         UoEyYGVHGfl1CDp23341YoYfo1Wvo+Q4gmEGOzjHCTtK1uxIDQw2HMqFLmHK8e5p5wSV
         mWgdAQCqLuBL0EU1kLAP8FusIp7Ua9XoELnVfDN/oQvifdIABD3ZYH2awx0ifbilaRU6
         berw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHUCBMaMS10nU2LzlIc61d8frikKzh17e9P/VoP7L8g=;
        b=xF6E4ULQHfgw3MtQxeVEwBnYnlS/mwWwKfBPBvoMtae029fHu7Er7o4vOPCxA0qr2x
         U0dDvwl2H3SvFQyxOt56ghBGbqYQ1ncQB+gI/L0HFWFTAlqirzogc4QKWAFzsStPoaNr
         p1AIbh3aGMw+ajM6wjByAZ2DFddgVe/dPMcXp5NgBEoOHHA5eF6MkF1ifHJW2y1ZWC5p
         GX2VzbWO9qbC0ZhJtVR4VUAecVdWAc2DvqJrQjMOyEUdV1wTgOtLuW0vzRkZP/l2C5RY
         3oKyicWcikvKUwXpFUikDh0IY8cZRY0woXbcXpl/2DXf4vjN3QqvzFqkRUvu/ZNw9Z/8
         lb1w==
X-Gm-Message-State: AOAM533VxvgWIM1AFaIHbvEa7zwz/7C2R7ovS9KMEfq6w+d4riXMfo3K
	d9j34Dy/PhBY8xKmjcbYrbjG/Y/vfy7nKw==
X-Google-Smtp-Source: 
 ABdhPJwjaLF4qsfAwtp7vBkn12zHmAucB6UwXSubHs2liTPfZ46jWVVL+yK2RWhgPsg8scQnoqxOeg==
X-Received: by 2002:a5d:53c9:: with SMTP id a9mr1502439wrw.119.1639000815602;
        Wed, 08 Dec 2021 14:00:15 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Chen Qi <Qi.Chen@windriver.com>
Subject: [PATCH 27/29] xxhash: upgrade 0.8.0 -> 0.8.1
Date: Wed,  8 Dec 2021 22:59:45 +0100
Message-Id: <20211208215947.1979470-27-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159393

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: GPL2 license for cli tool moved to a separate file
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...pe-special-regex-characters-in-paths.patch | 55 -------------------
 .../{xxhash_0.8.0.bb => xxhash_0.8.1.bb}      | 10 ++--
 2 files changed, 5 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-support/xxhash/files/0001-Makefile-escape-special-regex-characters-in-paths.patch
 rename meta/recipes-support/xxhash/{xxhash_0.8.0.bb => xxhash_0.8.1.bb} (68%)

diff --git a/meta/recipes-support/xxhash/files/0001-Makefile-escape-special-regex-characters-in-paths.patch b/meta/recipes-support/xxhash/files/0001-Makefile-escape-special-regex-characters-in-paths.patch
deleted file mode 100644
index 6d3da147f2..0000000000
--- a/meta/recipes-support/xxhash/files/0001-Makefile-escape-special-regex-characters-in-paths.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 9ab56f841b1986cd5cdff66cb5ef222794b9ed39 Mon Sep 17 00:00:00 2001
-From: Dmitry Kalinkin <dmitry.kalinkin@gmail.com>
-Date: Mon, 22 Feb 2021 14:07:58 -0500
-Subject: [PATCH] Makefile: escape special regex characters in paths
-
-Fixes a problem with certain valid install paths:
-
-make prefix=/tmp/a+b/
-Makefile:434: *** configured libdir (/tmp/a+b//lib) is outside of exec_prefix (/tmp/a+b/), can't generate pkg-config file.  Stop.
-
-Upstream-Status: Backport [f79cd22a806993b4a62d8a4f1ba529a29a9d9ff5]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index ef24e94..baa1533 100644
---- a/Makefile
-+++ b/Makefile
-@@ -411,14 +411,18 @@ INSTALL_PROGRAM ?= $(INSTALL)
- INSTALL_DATA    ?= $(INSTALL) -m 644
- 
- 
--PCLIBDIR ?= $(shell echo "$(LIBDIR)"     | $(SED) -n $(SED_ERE_OPT) -e "s@^$(EXEC_PREFIX)(/|$$)@@p")
--PCINCDIR ?= $(shell echo "$(INCLUDEDIR)" | $(SED) -n $(SED_ERE_OPT) -e "s@^$(PREFIX)(/|$$)@@p")
-+# Escape special symbols by putting each character into its separate class
-+EXEC_PREFIX_REGEX ?= $(shell echo "$(EXEC_PREFIX)" | $(SED) $(SED_ERE_OPT) -e "s/([^^])/[\1]/g" -e "s/\\^/\\\\^/g")
-+PREFIX_REGEX ?= $(shell echo "$(PREFIX)" | $(SED) $(SED_ERE_OPT) -e "s/([^^])/[\1]/g" -e "s/\\^/\\\\^/g")
-+
-+PCLIBDIR ?= $(shell echo "$(LIBDIR)"     | $(SED) -n $(SED_ERE_OPT) -e "s@^$(EXEC_PREFIX_REGEX)(/|$$)@@p")
-+PCINCDIR ?= $(shell echo "$(INCLUDEDIR)" | $(SED) -n $(SED_ERE_OPT) -e "s@^$(PREFIX_REGEX)(/|$$)@@p")
- PCEXECDIR?= $(if $(filter $(PREFIX),$(EXEC_PREFIX)),$$\{prefix\},$(EXEC_PREFIX))
- 
- ifeq (,$(PCLIBDIR))
- # Additional prefix check is required, since the empty string is technically a
- # valid PCLIBDIR
--ifeq (,$(shell echo "$(LIBDIR)" | $(SED) -n $(SED_ERE_OPT) -e "\\@^$(EXEC_PREFIX)(/|$$)@ p"))
-+ifeq (,$(shell echo "$(LIBDIR)" | $(SED) -n $(SED_ERE_OPT) -e "\\@^$(EXEC_PREFIX_REGEX)(/|$$)@ p"))
- $(error configured libdir ($(LIBDIR)) is outside of exec_prefix ($(EXEC_PREFIX)), can't generate pkg-config file)
- endif
- endif
-@@ -426,7 +430,7 @@ endif
- ifeq (,$(PCINCDIR))
- # Additional prefix check is required, since the empty string is technically a
- # valid PCINCDIR
--ifeq (,$(shell echo "$(INCLUDEDIR)" | $(SED) -n $(SED_ERE_OPT) -e "\\@^$(PREFIX)(/|$$)@ p"))
-+ifeq (,$(shell echo "$(INCLUDEDIR)" | $(SED) -n $(SED_ERE_OPT) -e "\\@^$(PREFIX_REGEX)(/|$$)@ p"))
- $(error configured includedir ($(INCLUDEDIR)) is outside of prefix ($(PREFIX)), can't generate pkg-config file)
- endif
- endif
--- 
-2.17.1
-
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.0.bb b/meta/recipes-support/xxhash/xxhash_0.8.1.bb
similarity index 68%
rename from meta/recipes-support/xxhash/xxhash_0.8.0.bb
rename to meta/recipes-support/xxhash/xxhash_0.8.1.bb
index 686fbea591..ec559a8759 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.0.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.1.bb
@@ -3,14 +3,14 @@ DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
 working at speeds close to RAM limits."
 HOMEPAGE = "http://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b335320506abb0505437e39295e799cb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cdfe7764d5685d8e08b3df302885d7f3 \
+                    file://cli/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                   "
 
-SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https \
-           file://0001-Makefile-escape-special-regex-characters-in-paths.patch \
-           "
+SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-SRCREV = "94e5f23e736f2bb67ebdf90727353e65344f9fc0"
+SRCREV = "35b0373c697b5f160d3db26b1cbb45a0d5ba788c"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


