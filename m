Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.723.1593028047982277217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 12:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uZytqIhq;
 spf=pass (domain: konsulko.com, ip: 209.85.221.67, mailfrom: matt.ranostay@konsulko.com)
Received: by mail-wr1-f67.google.com with SMTP id h5so3458157wrc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 12:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9doWnllOTdFnUiRqejVHC5t7YxRwrJBwC7gUcaVcoiE=;
        b=uZytqIhqkJ+gWpGeuF/rpg5QJc6M2qdKWEAFkpSFhda8GG0Lpl3I96o97K+0djy6kJ
         WHFChcokxenpDBwhaGI7oAYbZmQ65agIgtLNh5y/UYv90UyKpjXNRZCxNnKF2N4rl6jB
         R9+TC5yoQ1POiX6k7uXFAijVXTYh2kMZozQmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9doWnllOTdFnUiRqejVHC5t7YxRwrJBwC7gUcaVcoiE=;
        b=ucNFsGSsZuszY7+YkRXSvKaHTr3kWhUjkPvZAYWKRKIinPyv3za27Ivo1/1EtRMKiY
         V4VBxZeLqBS5L0Io2MIc8yaog8x+zGujPd9TBIk2G5WMm9xMV1j1AStVAPVxg+WOY2Lu
         AD0VKAG5VUQEr2NsaddVFnFRlTJDNoEsQn2ec9OCY2k+vGxqMEPbZVg+123v1AazJT3V
         x8Y2rLXGFMy8/YjfKexYUE5/q8EZVd0o/PNp1Fcovvy5z4f3XqOUMmzI9/gKpiobjTRW
         G6CHUOlX483+ZTkcNoXnb2FRDOCTGFuyEnGbxddeLeE+lTOBCbj7AveJd9TEy6dmz9Hs
         GABw==
X-Gm-Message-State: AOAM531bphZSHquNnwD7ZLGNehIEqeQhtUU5gBQz/leNcVbvrYlV18xN
	xYeqP8YyeouM7YvBVZomVBpCctkWwXs=
X-Google-Smtp-Source: ABdhPJydVL2OBE/WZokSWDSfn4uivahHmqhz61jCjtFwCBvM35Tes4iUN6TH6xjThVanCHjD9BdJvg==
X-Received: by 2002:adf:eb86:: with SMTP id t6mr34785099wrn.166.1593028045886;
        Wed, 24 Jun 2020 12:47:25 -0700 (PDT)
Return-Path: <matt.ranostay@konsulko.com>
Received: from taos.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id n16sm22018315wrq.39.2020.06.24.12.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 12:47:24 -0700 (PDT)
From: "Matt Ranostay" <matt.ranostay@konsulko.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][warrior][PATCH 1/2] python3: make gdbm optional
Date: Wed, 24 Jun 2020 22:47:15 +0300
Message-Id: <20200624194716.1107-1-matt.ranostay@konsulko.com>
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
 meta/recipes-devtools/python/python3_3.7.7.bb | 18 ++++++++---
 2 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch

diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
new file mode 100644
index 0000000000..c15295c034
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
diff --git a/meta/recipes-devtools/python/python3_3.7.7.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
index 114cf2fe09..4d1c5b0d10 100644
--- a/meta/recipes-devtools/python/python3_3.7.7.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
+           file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -65,7 +66,7 @@ ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
 ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
 
 
-DEPENDS = "bzip2-replacement-native libffi bzip2 gdbm openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
@@ -82,13 +83,22 @@ CACHED_CONFIGUREVARS = " \
                 ac_cv_working_tzset=yes \
 "
 
-PACKAGECONFIG_class-target ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'pgo', '', d)}"
-PACKAGECONFIG_class-native ??= "readline"
-PACKAGECONFIG_class-nativesdk ??= "readline"
+PACKAGECONFIG_class-target ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'pgo', '', d)} gdbm"
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

