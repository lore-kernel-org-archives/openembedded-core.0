Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0C9CD6E6B
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 11:05:52 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8728.1780571150696004420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 04:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qNJ8OiwA;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so421162f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 04:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780571149; x=1781175949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++BMtzNpPWCq95Vm1rKDvjDtFXKuPB6k6trlG3YDP54=;
        b=qNJ8OiwAzjh4d3Kzr12rQ7ynOGsAXPAf8hiRvkds5s+dAPihhkemxPUwonSUOI9B5a
         I3A9YjqMmw6J7Ogvoycgf7bcIsMKpbeb9YMzDB8bb+kkKPAvEFeFp8e2pbI76xY+WodV
         gLw6s3uVnBBTN2ezy39v8sI4AU5qCc0IwGkq4vaM2iYULrVinl4FPebQQwWl0U0026W/
         k9TtVKaYowN8+JOCs4CEPRmSjv9CZNKYbAPsGd/pQvPE7cJgNprF9hEK/E2KMkVK2jtK
         GYxo7yGyhAGEPo1T0Be9xKb58TwIjI27Mf03UeeeS77D7G61zgwLzCjJGuz9IS15aLBy
         1mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571149; x=1781175949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++BMtzNpPWCq95Vm1rKDvjDtFXKuPB6k6trlG3YDP54=;
        b=HzlYci76KgysZulK09Phf+SGuWgo8tCRbp4G4x6Tuxs00lN2OkYdC9j3eFRumK56N7
         B7VDrBcP0jpXI5SiZfNXw2nbAiwze55qGWwnOQ0U7DNQQe5n60brqYVcv41Jum1WdvRw
         hastTOIvn/8PC9Y08B7oyoJrvGf3DXlRd0VcAsJOJsrwOJA3D38zVoCylR/pq6Bk59Qb
         30yULxNw1Pch6TQaE1rOE/i5cOMj32JXQJUs6l9SKwUhCZ6bDcdY8szIuTBbk4s/GT+v
         u5Nh2aXa2uOb5Xlgd+Ev+WbTfW9zrNLxP7kyooyfTp+xFR/im0i5ZSflO/KMbWuimXnX
         NA+Q==
X-Gm-Message-State: AOJu0YyaLMXbTlurZAX+bziiujZXkXJ5c248oKY5yGeVwB2I6dgr+t0f
	eChMARfVecDzjRXxONRxuc4LgO7s4lIs9Qzz2us7yE/cHFv9Z36d0Orig6EWMg==
X-Gm-Gg: Acq92OE2lZ0xDGbhZbCORauQxOOnGeKj/aPVdihVhxTCuRT8jEPJrdx13dOW/aoirra
	Ed+WGKlYNTSGNeCK+1TtofmYpLZExf4pY7hLL2G9r+oL9TLx+FCbj9D3CxUpt6U24/Y3K+O8YMf
	3wrOq2eoCygcXUxf73C4km8u4PR19BiKdXHq/VJjYpEGrchwkqW6WzBTr26Eb0Ddh9pZTlrwL2U
	fvaKXtARYWYijEV1X4t432fiO57cHLIBYmaEJ4T6RH7UlxRZg638YDsa+0fr8awa4+su4c92XG9
	wvtO4h8N5A6t3JGJ4v68VxBAE4cR54boB0SvjoisADs62nEC4aUEtiMnMnWkZFsc8l2jq5iair9
	XHrqhcOxfb6v92g0eeve/PvGyR8WBuPmOhYPI4HLkeyOT3ZY0LlRJY44RxWCf7cFY7I/coQgo6a
	uHA/h3NcVDjrpC0e2Bqbv3MrQVNpx4indpfH2VyhTnS+HwFeNs1k4fYeMz6xRqhxGmwgWuag==
X-Received: by 2002:a5d:49c3:0:b0:452:273:5cd6 with SMTP id ffacd0b85a97d-460217830aamr7519343f8f.1.1780571148777;
        Thu, 04 Jun 2026 04:05:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm14946005f8f.37.2026.06.04.04.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 04:05:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] python3-qemu-qmp: add a recipe
Date: Thu,  4 Jun 2026 13:05:32 +0200
Message-ID: <20260604110545.1860309-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 11:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238123

From: Alexander Kanavin <alex@linutronix.de>

Also, adjust qemu recipe to be using it, instead of its
own internal copy. With qemu 11.x the internal copy is removed
and so a separate qemu-qmp recipes becomes a requirement.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../qemu/python3-qemu-qmp_0.0.6.bb            | 28 +++++++++++++++++++
 .../qemu/qemu-system-native_10.2.0.bb         |  6 +---
 3 files changed, 30 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 66902616f5..86048e791c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -706,6 +706,7 @@ RECIPE_MAINTAINER:pn-python3-pytest = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-subtests = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytz = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyyaml = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-qemu-qmp = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-rdflib = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-referencing = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-requests = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb b/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
new file mode 100644
index 0000000000..4b3bbe6670
--- /dev/null
+++ b/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
@@ -0,0 +1,28 @@
+SUMMARY = "QEMU Monitor Protocol Python library"
+DESCRIPTION = "An asyncio library for communicating with QEMU Monitor Protocol (QMP). \
+This library was split out of the QEMU source tree to provide a reference QMP \
+implementation usable both within and outside of the QEMU source tree."
+HOMEPAGE = "https://gitlab.com/qemu-project/python-qemu-qmp"
+LICENSE = "LGPL-2.0-only & GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4cf66a4984120007c9881cc871cf49db"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "qemu_qmp"
+
+SRC_URI[sha256sum] = "a3c25d871fab549122b2340810de1f99481002c942a2132476b062aacdbf6e92"
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} += "python3-core python3-asyncio"
+
+# Install to the custom path expected by oeqa/utils/qemurunner.py
+# which imports "qmp.legacy" from ${libdir}/qemu-python/
+do_install:append:class-native() {
+    install -d ${D}${libdir}/qemu-python/qmp/
+    cp -R --no-dereference --preserve=mode,links ${S}/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
+}
+
+FILES:${PN}:append:class-native = " ${libdir}/qemu-python"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
index 2e4f7328ad..62e8a0a83b 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
@@ -5,7 +5,7 @@ require qemu-native.inc
 # As some of the files installed by qemu-native and qemu-system-native
 # are the same, we depend on qemu-native to get the full installation set
 # and avoid file clashes
-DEPENDS += "glib-2.0-native zlib-native pixman-native qemu-native"
+DEPENDS += "glib-2.0-native zlib-native pixman-native qemu-native python3-qemu-qmp-native"
 
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
@@ -25,9 +25,5 @@ do_install:append() {
     rm -rf ${D}${datadir}/qemu/dtb
     rm -rf ${D}${datadir}/icons/
     rm -rf ${D}${includedir}/qemu-plugin.h
-
-    # Install qmp.py to be used with testimage
-    install -d ${D}${libdir}/qemu-python/qmp/
-    install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
 }
 
-- 
2.47.3


