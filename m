Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.1545.1614644298548474375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 16:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZTCjw83W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id j2so5156910wrx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 16:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NNggE0OlIZCLQE9MCwa31nKeSiTgDH3gLVfxROr+/0c=;
        b=ZTCjw83WW0Qxj7MLkQG+XnlB3T+O5YVjqykKjiq9A3VigHHwQ6cPWAPKt+lIHZ+qik
         suLvWwjEVOeBbL7+Px55q/zs/AQvg2giPqiCUvUds4delZ9Lfp2pwbqE9BySRvU5YPEX
         MSQ2cX7SqxPGmvALYD6HN/XUEWHqWuJ8oKk30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NNggE0OlIZCLQE9MCwa31nKeSiTgDH3gLVfxROr+/0c=;
        b=udVF63a4xNq5kuB/TKAJSdusAkvDFiFGvOaj/apJy5tuO/v5syG/PbJA3Wsz2WobLu
         E7soC87WvUEVc2DT+usbZj7XReMW2+T6S5+LWqUjV+MenFdee1GeLes05ojtYZZQI52B
         m6ZvYpLOiLfsc+4Y8lAR1YjWh2masI7kZZQBsw7E2C1enp1KUJSldHfGqziP4tNlNbYk
         A087ifqsFKNNUbu0KVRSi673N9sbP6UKc6tAjJA5zXGFJVJ64HUArHLUjXUyzBrxy9op
         PNMDgTKaT2cKjQSxA+IzrpvtW0UeUO9Xgt5AE7bdYqq1DoSZ4RlyIqGgdV8hG5beQlLz
         o+Vg==
X-Gm-Message-State: AOAM5321kp5vWcq9xBSF5lFLthWBaeDGB05MP7BqTlvSyBC6eZcbfGXB
	ZO/gFFhpyS18jexjVJmEoxoyard5NppHhA==
X-Google-Smtp-Source: ABdhPJyusKPEUL49NnS5bX8+BqzrKCGtIhfvTdLLcOGVvjdYULQSuf0VyvEePoh3wGio3kGhIg4uiQ==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr19506698wre.83.1614644296533;
        Mon, 01 Mar 2021 16:18:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53])
        by smtp.gmail.com with ESMTPSA id j16sm1569045wmi.2.2021.03.01.16.18.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 16:18:16 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu: Determinism fixes
Date: Tue,  2 Mar 2021 00:18:14 +0000
Message-Id: <20210302001815.2209318-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to address two determinism issues and allow reproducible
builds.

Also strip full paths we don't need out of some ptest files,
we can use the installed binaries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 meta/recipes-devtools/qemu/qemu.inc           |  4 ++
 .../qemu/qemu/determinism.patch               | 41 +++++++++++++++++++
 3 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/determinism.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a510ad5200b..b78f5e1d7f0 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -41,7 +41,6 @@ exclude_packages = [
 	'ovmf-shell-efi',
 	'perf',
 	'python3-cython',
-	'qemu',
 	'ruby-ri-docs'
 	]
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cb854914b2e..a6dc9416247 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,6 +28,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://mingwfix.patch \
            file://mmap.patch \
            file://mmap2.patch \
+           file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
@@ -57,6 +58,9 @@ do_install_ptest() {
         sed -i -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
             ${D}/${PTEST_PATH}/tests/qemu-iotests/common.env 
 	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}/tests/data/acpi/disassemle-aml.sh
+
+	# Strip the paths from the QEMU variable, we can use PATH
+	sed -i -e "s#^QEMU=.*/qemu-#QEMU=qemu-#g" ${D}${PTEST_PATH}/tests/tcg/*.mak
 }
 
 # QEMU_TARGETS is overridable variable
diff --git a/meta/recipes-devtools/qemu/qemu/determinism.patch b/meta/recipes-devtools/qemu/qemu/determinism.patch
new file mode 100644
index 00000000000..cb1c907777f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/determinism.patch
@@ -0,0 +1,41 @@
+When sources are included within debug information, a couple of areas of the 
+qemu build are not reproducible due to either full buildpaths or timestamps.
+
+Replace the full paths with relative ones. I couldn't figure out how to get
+meson to pass relative paths but we can fix that in the script.
+
+For the keymaps, omit the timestamps as they don't matter to us.
+
+Upstream-Status: Pending [some version of all/part of this may be accepted]
+RP 2021/3/1
+
+Index: qemu-5.2.0/scripts/decodetree.py
+===================================================================
+--- qemu-5.2.0.orig/scripts/decodetree.py
++++ qemu-5.2.0/scripts/decodetree.py
+@@ -1303,8 +1303,8 @@ def main():
+     toppat = ExcMultiPattern(0)
+ 
+     for filename in args:
+-        input_file = filename
+-        f = open(filename, 'r')
++        input_file = os.path.relpath(filename)
++        f = open(input_file, 'r')
+         parse_file(f, toppat)
+         f.close()
+ 
+Index: qemu-5.2.0/ui/keycodemapdb/tools/keymap-gen
+===================================================================
+--- qemu-5.2.0.orig/ui/keycodemapdb/tools/keymap-gen
++++ qemu-5.2.0/ui/keycodemapdb/tools/keymap-gen
+@@ -317,9 +317,8 @@ class LanguageGenerator(object):
+         raise NotImplementedError()
+ 
+     def generate_header(self, database, args):
+-        today = time.strftime("%Y-%m-%d %H:%M")
+         self._boilerplate([
+-            "This file is auto-generated from keymaps.csv on %s" % today,
++            "This file is auto-generated from keymaps.csv",
+             "Database checksum sha256(%s)" % database.mapchecksum,
+             "To re-generate, run:",
+             "  %s" % args,
-- 
2.27.0

