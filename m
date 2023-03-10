Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743D3C74A4B
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 09:54:38 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.15614.1678442073313015206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 01:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OCFEF/O9;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id da10so18244923edb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 01:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678442071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNCoznBFWUyYbr6Cf8QuFEz6cg5GvyEvPHn4+xOK0ts=;
        b=OCFEF/O9Te3xKsKAiSChCGqJGOFdFq8PD8ixGZGMclLrtOxTyVFIuCtf+0Loastueh
         4dQ6PWrpElSSwDY7FsZ4rAAfRKB3obk0zj6/bUeMjmnY46tgmUgbDp2H4AwSxVL9+lUn
         l8CNeP6t912ghRNC2C27lb63W82hyJWeXS0hIg/CJ3vHTAp2TA7FSlgeMeKKAT6t8NVj
         qBnJCHW8ieE+S7rVzv1JSzPeYLIrK1sq8laeCLVJ8xQRumgO1xzF9DhIsYRfZgLPU1fU
         pRFE67ZULwQkVTqJRZFg0/t4r5TkOJqs0mWZhNMeYaiIFatptZGxKbi0dZZenmj/5K58
         /sEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNCoznBFWUyYbr6Cf8QuFEz6cg5GvyEvPHn4+xOK0ts=;
        b=G2znh1pudhOnZMsX5aPbM4UOR0YoyIDpqX2uMIU0ZTjVz+gm9NJ/dktTRGAOgR3xeW
         k9h6kXDl97QlB2Eu2/0Yf+LzGVnAPboqOXuW/IPAAnAlP5B2YCyJix0NAzuhWKW75LMJ
         v03s70L2A6KzKeDyxX0N77gjiBkXj4CQuMIef0ltuL6HYtpA+bw8bbPYN7aNDq1OO8gq
         RfScwg7Fyhf9Kf38q/ZP24Z+VFHlY2jCr4h05id+BetYWJaTjIy2Z8/Pji2rN1jD96yH
         byPTT4bOegxod3ouay5zq+s/sDjZ/T2ECPb21Kxuu4NvFXZQXh+gw6HjDNIwrwh6jrTW
         uEvA==
X-Gm-Message-State: AO0yUKVsjHC9izSyRqslXI7gb+1yxgaI3om6qXwCt7mMk9pXUAurSgWP
	2nkPpON9+Sdl6XxlwoXmR7dejzbPwSI=
X-Google-Smtp-Source: AK7set8/hDzhbQsaVkDMX9ILC9AXo9625pE4EN4LPeRMhYBtag9/P2vIbZutd8u4uUYii19syWFBGA==
X-Received: by 2002:a17:907:868b:b0:907:9bda:93b9 with SMTP id qa11-20020a170907868b00b009079bda93b9mr33882707ejc.17.1678442071281;
        Fri, 10 Mar 2023 01:54:31 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id kq10-20020a170906abca00b008c405ebc32esm759549ejb.28.2023.03.10.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:54:30 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 4/4] python3-ninja: New recipe
Date: Fri, 10 Mar 2023 10:54:19 +0100
Message-Id: <20230310095419.3487056-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310095419.3487056-1-zboszor@gmail.com>
References: <174B040A85AB843D.27660@lists.openembedded.org>
 <20230310095419.3487056-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 09:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178319

Some python modules rely on "import ninja".

Only build and ship the python parts, and don't download and
build ninja from sources. Use the already built ninja instead.

The CMakeLists.txt file is a crippled copy from this ninja
python module's sources, removing almost everything, and
adding a dummy install target, so do_install() doesn't fail.

The python code is patched so ninja is used from PATH.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-ninja/CMakeLists.txt       |  9 ++++++
 .../python3-ninja/run-ninja-from-path.patch   | 11 +++++++
 .../python/python3-ninja_1.11.1.bb            | 30 +++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-ninja/CMakeLists.txt
 create mode 100644 meta/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch
 create mode 100644 meta/recipes-devtools/python/python3-ninja_1.11.1.bb

diff --git a/meta/recipes-devtools/python/python3-ninja/CMakeLists.txt b/meta/recipes-devtools/python/python3-ninja/CMakeLists.txt
new file mode 100644
index 0000000000..04fa451e72
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-ninja/CMakeLists.txt
@@ -0,0 +1,9 @@
+cmake_minimum_required(VERSION 3.15)
+
+project(NinjaPythonDistributions)
+
+set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_MODULE_PATH})
+
+install(CODE "
+ message(STATUS \"Install ninja project\")
+")
diff --git a/meta/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch b/meta/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch
new file mode 100644
index 0000000000..26bd037373
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-ninja/run-ninja-from-path.patch
@@ -0,0 +1,11 @@
+--- ninja-1.11.1/src/ninja/__init__.py.old	2022-11-05 09:49:23.000000000 +0100
++++ ninja-1.11.1/src/ninja/__init__.py	2023-03-10 09:45:13.452082888 +0100
+@@ -44,7 +44,7 @@
+ 
+ 
+ def _program(name, args):
+-    return subprocess.call([os.path.join(BIN_DIR, name)] + args, close_fds=False)
++    return subprocess.call([name] + args, close_fds=False)
+ 
+ 
+ def ninja():
diff --git a/meta/recipes-devtools/python/python3-ninja_1.11.1.bb b/meta/recipes-devtools/python/python3-ninja_1.11.1.bb
new file mode 100644
index 0000000000..64f5c5c32b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-ninja_1.11.1.bb
@@ -0,0 +1,30 @@
+SUMMARY = "Ninja is a small build system with a focus on speed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE_Apache_20;md5=19cbd64715b51267a47bf3750cc6a8a5"
+
+DEPENDS = "ninja-native cmake-native python3-scikit-build-native"
+
+PYPI_PACKAGE = "ninja"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "c833a47d39b2d1eee3f9ca886fa1581efd5be6068b82734ac229961ee8748f90"
+
+SRC_URI += " \
+	file://CMakeLists.txt \
+	file://run-ninja-from-path.patch \
+"
+
+addtask do_patchbuild after do_patch before do_configure
+
+do_patchbuild () {
+	rm -f ${S}/CMakeLists.txt
+	cp ${WORKDIR}/CMakeLists.txt ${S}/
+}
+
+do_install:append () {
+	rm -rf ${D}${bindir}
+}
+
+RDEPENDS:${PN} = "ninja"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


