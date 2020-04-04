Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.1124.1585961073561979863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 17:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ainM74P1;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id 142so4404866pgf.11
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 17:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHLlEPwRbbgGzFNERpQ46N2xXlNqkybOYipofTBDgZw=;
        b=ainM74P1Q6xi65gv2E6GRj4aGsCxdi9nJ6qMCz4psWdlozpymMSw0bUHLe0SFaAb6a
         oFfb6YlOnLCR++axcZFHBfBGlLtEDAcHlf4DOxme4WwLyUHNElv+x1EhfcSubHuEjHhI
         aEld/P/2oZqZROkRs9pbhZo2nFGqy13ppjGUDfnH+NnH9Xk/7ptJhByNuwvqPheA5lRN
         IPQAnEQ0ohTg9bUAALAugB11VHHvt4JpODPbq3RcyKMlJkGhlQmteInwlOEJszIhqZdg
         fkbosLheg25g/TWeZ//lERlbJexqTq1XNgDY2dYF9qcHay/G4qQ7yp1OdQs/e3VQ77nc
         yvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tHLlEPwRbbgGzFNERpQ46N2xXlNqkybOYipofTBDgZw=;
        b=p6DXM350HnkDdDksc3FexvoJmD2pImKdtxYwLmDhh/UfRlADgcou/xYjNqcBlhK+53
         TSGeyP3oxAkrb46ioOjxAbupDIzCllYqVMsgB2LA0f60chko7HB2t669KqWJ4LYSFD+5
         vDFrGMLE1zsMjuvMc4+SARaXV7hYtv3t/XoDnR906u78qvnyG3SNEoPP/vbY7kaIib1D
         emmUiwjtWjApu0kms09DiwvWTTXbScukpDOTHOQtjsEyCJ649NFgFVEHUEkT5SksiUkx
         +h3Zf5OsCiyvjsg3owmndqLxcMbvKenwUdx/3X1ok1u5HKDfAW+Lr4z5zV3vnvpiCNEI
         8wOg==
X-Gm-Message-State: AGi0PuagEgY9+AoMK+EgQ5nP6ePTtUJfrDLTcpOxZi7SSBxw6Y350E3+
	4jbEa6JqRUkNkqqwMELEGdGLE6ojOKk=
X-Google-Smtp-Source: APiQypLZZ/JJ03HoWyTFC0BOngWNz4luWqfRn9c+YPp5hh7s8WZI6ITfYCTFoeUBA3Qnc98Rc7ifcA==
X-Received: by 2002:aa7:9511:: with SMTP id b17mr11319391pfp.243.1585961072601;
        Fri, 03 Apr 2020 17:44:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3e84])
        by smtp.gmail.com with ESMTPSA id n7sm6037965pgm.28.2020.04.03.17.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 17:44:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Use configure options to disable gdb and dependencies
Date: Fri,  3 Apr 2020 17:44:45 -0700
Message-Id: <20200404004445.3088044-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deleting sources is a rough way of dealing with disabling components,
using configure option is elegant way and we also keep the sources
unchanged, this should not cause any funcitonal changes otherwise

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.34.inc | 4 ----
 meta/recipes-devtools/binutils/binutils.inc      | 5 +++++
 meta/recipes-devtools/binutils/binutils_2.34.bb  | 5 +++++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index ed9f902fd2..4b085b6fe0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -43,7 +43,3 @@ SRC_URI = "\
      file://CVE-2020-0551.patch \
 "
 S  = "${WORKDIR}/git"
-
-do_configure_prepend () {
-        rm -rf ${S}/gdb ${S}/libdecnumber ${S}/readline ${S}/sim
-}
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index f6c20fc229..4119960c63 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -75,6 +75,11 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-werror \
                 --enable-deterministic-archives \
                 --enable-plugins \
+                --disable-gdb \
+                --disable-gdbserver \
+                --disable-libdecnumber \
+                --disable-readline \
+                --disable-sim \
                 ${LDGOLD} \
                 ${EXTRA_TARGETS} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
diff --git a/meta/recipes-devtools/binutils/binutils_2.34.bb b/meta/recipes-devtools/binutils/binutils_2.34.bb
index bfc9346822..2e645e1ed8 100644
--- a/meta/recipes-devtools/binutils/binutils_2.34.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.34.bb
@@ -18,6 +18,11 @@ EXTRA_OECONF_class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
                              --enable-install-libiberty \
                              --enable-install-libbfd \
+                             --disable-gdb \
+                             --disable-gdbserver \
+                             --disable-libdecnumber \
+                             --disable-readline \
+                             --disable-sim \
                              --disable-werror"
 
 # gcc9.0 end up mis-compiling libbfd.so with O2 which then crashes on target
-- 
2.26.0

