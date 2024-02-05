Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9511C48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:12:27 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.64871.1707145941332096548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 07:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cgWAf8s4;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a364b5c5c19so711106166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707145940; x=1707750740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVrc+dHIVrcdkE8KPOMT/NWKxavU/TyxN9ZsDqAmG30=;
        b=cgWAf8s4ug1N9D5FDdJiaQI87Zo075YP38kDMeO6xfgexqoCWMOmk61YToFIz6jbWM
         Y96F6uPXlBNVVPoq2rfQ1fmPl14dyzCco6QWsxfTczmTDChbv1p/0ynzdVbfs9TMBsGU
         cziOjo7VNff5c/UuKsEJyV/AQqIJmFY0K97m4dAqpMIOllqBskUDSQW1GaOmtucLd32N
         EKBAj1OCpdk89J10+PIUDYHT6ONciCvqbbVxHQ8dekmmy6G8HwpFiwcwrA3zLG/bTMHV
         zHDqmF8YE4nHzNoIIaSwEywI7QkzFHW2ZalhKflcvilEgV0e62AR/3ZUnfJIgxu6LcPx
         2Jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707145940; x=1707750740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVrc+dHIVrcdkE8KPOMT/NWKxavU/TyxN9ZsDqAmG30=;
        b=QyMO1xenUuylWsvsBqbQJj2vvx4GbRIUbxXYi3JUxjYxSMHAL7c5otuqFz4H24Ib2p
         d99cQ8hOnFd2LZ4vb08rXhmRz9YcxZucS49tSnicj5FMlKAKI6t20yZbARY1D9iVS/ty
         K3XFPGp9AUIDsKkHAZM3AAzg273Siu60lNETmk4WfjS59KCwmOSnNqAe0kBiZcf43Dye
         YES2SwTNpdTUMhcv31Gx1PSM+1zboEEl6BcZv8rX6h/12w0iVWFiz2smyc9Dx4svmEFF
         LWG5FHZ8OvdM+Un6RJjzPQMjMHoVzsxtBKncDB0pMwBoWbl/7PP5j3nA5l2mjY1lpM0P
         inIQ==
X-Gm-Message-State: AOJu0YwTSHOVIdNw3jnt13L4AtMQGvC7WKy855arfyHzF5d5OUr1gFMt
	01XkqFrxDsEg+x0fMM48FFM1+aTq/ONwEYLpfXy9YsWZHk9D6wmog/kH3ozv
X-Google-Smtp-Source: AGHT+IEYUOIwqyF/6lkLwhJQFgppyni15HREqR7NCsNFnOb7vJ0/3x6arHFgXfEFMS3jR0bemFD2xA==
X-Received: by 2002:a17:906:52d8:b0:a35:9e3c:80dd with SMTP id w24-20020a17090652d800b00a359e3c80ddmr11514225ejn.5.1707145939488;
        Mon, 05 Feb 2024 07:12:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id hw16-20020a170907a0d000b00a372330e834sm3792170ejc.102.2024.02.05.07.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 07:12:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] lzlib: add a recipe
Date: Mon,  5 Feb 2024 16:11:01 +0100
Message-Id: <20240205151102.512785-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 15:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194947

This is needed for rpm reproducibility, as otherwise libmagic
will call an external lzip executable, which is both
non-threadsafe, and non-deterministic w.r.t sysroot presence.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-extended/lzip/lzlib_1.14.bb | 37 ++++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/lzip/lzlib_1.14.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f0e27b8380e..277e3b16363 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -485,6 +485,7 @@ RECIPE_MAINTAINER:pn-lua = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-lz4 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzo = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzip = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER:pn-lzlib = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-m4 = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-m4-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-make = "Robert Yang <liezhi.yang@windriver.com>"
diff --git a/meta/recipes-extended/lzip/lzlib_1.14.bb b/meta/recipes-extended/lzip/lzlib_1.14.bb
new file mode 100644
index 00000000000..0fac508869f
--- /dev/null
+++ b/meta/recipes-extended/lzip/lzlib_1.14.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Data compression library providing in-memory LZMA compression and decompression functions"
+HOMEPAGE = "https://www.nongnu.org/lzip/lzlib.html"
+DESCRIPTION = "Lzlib is a data compression library providing in-memory LZMA compression and decompression functions, including integrity checking of the decompressed data. The compressed data format used by the library is the lzip format. Lzlib is written in C. "
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=04d943636aa1482e0a97d924d9f4f68f \
+                    "
+
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzlib/lzlib-${PV}.tar.gz"
+SRC_URI[sha256sum] = "5acac8714ed4f306020bae660dddce706e5f8a795863679037da9fe6bf4dcf6f"
+
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+CONFIGUREOPTS = "\
+    '--srcdir=${S}' \
+    '--prefix=${prefix}' \
+    '--exec-prefix=${exec_prefix}' \
+    '--bindir=${bindir}' \
+    '--datadir=${datadir}' \
+    '--infodir=${infodir}' \
+    '--sysconfdir=${sysconfdir}' \
+    '--enable-shared' \
+    'CC=${CC}' \
+    'CPPFLAGS=${CPPFLAGS}' \
+    'CXXFLAGS=${CXXFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
+
+do_configure () {
+    ${S}/configure ${CONFIGUREOPTS}
+}
+
+do_install () {
+    oe_runmake 'DESTDIR=${D}' install
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


