Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.1250.1593029612125681213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 13:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Qzb5Qj8E;
 spf=pass (domain: konsulko.com, ip: 209.85.221.66, mailfrom: matt.ranostay@konsulko.com)
Received: by mail-wr1-f66.google.com with SMTP id z13so3530854wrw.5
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 13:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PR5dqP8Z9iQMU18ftLC/TnrTUoUCiDWZLEKtOUZAuOI=;
        b=Qzb5Qj8Ekl25IJuLwxiF/iC+jfF/QUHvwtK1vUrpZ2qaR94ZltTZXVIT488+J4czte
         BhxV+SGiYjL4I5xRgciCISkGOa7XM95FrQVVxUeR1tj6u+KIvkeAjghAhe17fs9EZdsh
         5CkMrkhcBZdVIEeq/RbK3Yg0zNeQl3XW4WfQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PR5dqP8Z9iQMU18ftLC/TnrTUoUCiDWZLEKtOUZAuOI=;
        b=PH9uApUfS8Z6wExxyl3bzy//1U8fsQGk+BEOEa79Ix2K0yAI6jU2NlbBw3bKURUm34
         uPei53QbivQ4jUYJkn05Wt+GF5LkiQPGHwVeTL3hzKu2Mi8TQ6sEZ6qizvFmiRdB3oTF
         Qa0rPLklvyE7Eihc7LrWah/qDFVLO7DtX1qUiDNdazsFIWRJbuRNi/WnXf7TCkVvdRQi
         kyVZ1k1i4rZ+Yg0fdgJY8LtHvxLbLeDuhcMEuNTHzOFoTQLtdguLKfh8ZRo+U0tP15eJ
         eXABWLShRsnctsava7uUibRukS5cZ+BbFsrdZ7UBOhMDUo2olAVNQzBgYsfvyFXDgz5v
         xlWw==
X-Gm-Message-State: AOAM532rF3k81imtMZvLJqSx6DkESpwN8RwEw7s1fHUK4MaAbL4ncGbx
	3O8jc+8PncABnu98UUAjqkZxMMFzeYD92w==
X-Google-Smtp-Source: ABdhPJwDs79CpsgKFE9lt58BQABV6ePygaKmChx4NaVxLUoiG7Xnje8oe+NIG3UPrkG4GLwL2Bq+0g==
X-Received: by 2002:adf:fd8b:: with SMTP id d11mr35636987wrr.371.1593029610204;
        Wed, 24 Jun 2020 13:13:30 -0700 (PDT)
Return-Path: <matt.ranostay@konsulko.com>
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d9sm28200840wre.28.2020.06.24.13.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 13:13:29 -0700 (PDT)
From: "Matt Ranostay" <matt.ranostay@konsulko.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][zeus][PATCH 1/2] python3: make gdbm optional
Date: Wed, 24 Jun 2020 23:13:25 +0300
Message-Id: <20200624201326.1225-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

The use case is building a gpl3-free image, without having
to rely on outdated recipes from meta-gplv2 layer.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...report-missing-dependencies-for-disa.patch | 31 +++++++++++++++++++
 ...tutils-prefix-is-inside-staging-area.patch |  2 +-
 meta/recipes-devtools/python/python3_3.7.7.bb | 18 ++++++++---
 3 files changed, 46 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch

diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
new file mode 100644
index 0000000..c15295c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -0,0 +1,31 @@
+From e3b59cb9658e1d3efa3535840939a0fa92a70a5a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 7 Oct 2019 13:22:14 +0200
+Subject: [PATCH] setup.py: do not report missing dependencies for disabled
+ modules
+
+Reporting those missing dependencies is misleading as the modules would not
+have been built anyway. This particularly matters in oe-core's automated
+build completeness checker which relies on the report.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ setup.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/setup.py b/setup.py
+index 4b53668..0097643 100644
+--- a/setup.py
++++ b/setup.py
+@@ -365,6 +365,10 @@ class PyBuildExt(build_ext):
+                 print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
+                                               longest, g))
+ 
++        # There is no need to report missing module dependencies,
++        # if the modules have been disabled in the first place.
++        missing = list(set(missing) - set(sysconf_dis))
++
+         if missing:
+             print()
+             print("Python build finished successfully!")
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 0bafec7..d49604b 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 6229502e5ae6cbb22240594f002638e9ef78f831 Mon Sep 17 00:00:00 2001
+From a274ba778838824efcacaba57c415b7262f779ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.7.7.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
index bff84f6..be67c81 100644
--- a/meta/recipes-devtools/python/python3_3.7.7.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
+           file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch \
            "
 
@@ -67,7 +68,7 @@ ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
 ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 gdbm openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
@@ -92,13 +93,22 @@ python() {
         d.setVar('PACKAGECONFIG_PGO', '')
 }
 
-PACKAGECONFIG_class-target ??= "readline ${PACKAGECONFIG_PGO}"
-PACKAGECONFIG_class-native ??= "readline"
-PACKAGECONFIG_class-nativesdk ??= "readline"
+PACKAGECONFIG_class-target ??= "readline ${PACKAGECONFIG_PGO} gdbm"
+PACKAGECONFIG_class-native ??= "readline gdbm"
+PACKAGECONFIG_class-nativesdk ??= "readline gdbm"
 PACKAGECONFIG[readline] = ",,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
 PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
+PACKAGECONFIG[gdbm] = ",,gdbm"
+
+do_configure_prepend () {
+    mkdir -p ${B}/Modules
+    cat > ${B}/Modules/Setup.local << EOF
+*disabled*
+${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
+EOF
+}
 
 CPPFLAGS_append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
 
-- 
2.20.1

