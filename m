Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B2DC4829A
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 09:14:04 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.17760.1707210834395873371
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 01:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQQtAn6j;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5608f7fd83cso1302883a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 01:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707210833; x=1707815633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1mpck2LqwThEboPBKhcjfIu4UVVizpYTZ+/VvjhivGY=;
        b=mQQtAn6jBoTns1vx6jsk0xC842nzgcErz4VANm84O5aGd2nRQ3jTcsb3TU7Z9I6F5G
         Iu+rVsuK+BlGiDQMa4mHUgBbWUDcJKPAS1cR94nJKI4dnvrOoTv9AIc8of1lGkcTUdUE
         akokaxA/YE3cH90ioGLwJIHGbuF0NjocNUBOfjU5TKKjrAtC7B3O1lHsvFJtyhZ9lAoP
         nh16WJC+AmRyk1J6Gm4uCXA9ReLijDzqsjd3rFjEk2QQHUzlZ4cc9NgrFphxIEWGmX3O
         k3QLan1ORMF4+5lW7piG1JR255TGNcBIpuy4KDbHSxgf9Eh5Y6W/OgbvAHTDT7o3mIQa
         lvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707210833; x=1707815633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mpck2LqwThEboPBKhcjfIu4UVVizpYTZ+/VvjhivGY=;
        b=LHkXUOeVtMWbKUXWPHkxK8B9zzym8erkB7NtOwvJW5yVTyDa5wnafbWoiBQVJB3vh/
         Fi2m+52RFWY5iji8fCoKQm8Jhrre0GOvlL5ZGrpfqfIeeTSqcnn45m/qw0TF8cokOuXl
         t/c0CsLkHWSbcW0U2lhv8DH4bvVfdKipeWFohXGtCJnXtkV3pP3jZsga6BkxiPL39L34
         EE7Abg+f84wrwpag6QgK00GkWWphjrPzxi5Ick4zLfpQ+yWOYTMXlSTZI8Kgp6umZtgj
         TEkfZdfmxcqjdm0yJvoER0+FTqKr2m6vRg0t04jw5G0dDEgEw+o8WN+t/ftadT6y4p/w
         IpYw==
X-Gm-Message-State: AOJu0YwXI3IKhJmNODTMak8xw5rGwCyzo0dXxANhXRrPql8SH+kJfrCX
	6j8y3KI1qCucVkd/vkKrLPXXD1pwAQHQe3dUqN5qOve0IaGEeDWT6PvpVUQT
X-Google-Smtp-Source: AGHT+IF1W9wTQYoZpFLMuTKVMTBXSAChTkPTDGt3LHoEiAtbJyUqQ7RqspdzfctrDhpI39c/DU6sbw==
X-Received: by 2002:aa7:c6d4:0:b0:560:cf3:d314 with SMTP id b20-20020aa7c6d4000000b005600cf3d314mr1074608eds.31.1707210832582;
        Tue, 06 Feb 2024 01:13:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n5-20020aa7c685000000b00560556fe9b7sm820662edq.78.2024.02.06.01.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 01:13:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/2] lzlib: add a recipe
Date: Tue,  6 Feb 2024 10:13:46 +0100
Message-Id: <20240206091347.1271851-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 09:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194975

This is needed for rpm reproducibility, as otherwise libmagic
will call an external lzip executable, which is both
non-threadsafe, and non-deterministic w.r.t sysroot presence.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-extended/lzip/lzlib_1.14.bb | 39 ++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
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
index 00000000000..a6010bbf27a
--- /dev/null
+++ b/meta/recipes-extended/lzip/lzlib_1.14.bb
@@ -0,0 +1,39 @@
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
+    '--libdir=${libdir}' \
+    '--sysconfdir=${sysconfdir}' \
+    '--enable-shared' \
+    '--disable-static' \
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


