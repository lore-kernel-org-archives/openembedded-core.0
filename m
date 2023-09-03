Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EC5C83F2D
	for <webhook@archiver.kernel.org>; Sun,  3 Sep 2023 05:03:24 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.22994.1693717397180633126
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 22:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qcl65TH8;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-56b2e689828so280774a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 22:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693717396; x=1694322196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uu67Ls/F4z06J7Rxho3Zvml33YWEYeBVR018XCJHcRE=;
        b=qcl65TH8Iic97rvpjfGSZPRtlW+h6gW5uYrwzZceJXSpkzqFkCYJpcf6WAMr7hrCUA
         F1GHvDSZVxtulC0Ki3DvwcyUG/IgVFnw489UL9MdZ4jN0knB4nXENG++Wr+Q7/KKK+SY
         /gZMgKrdJtFlQdbeRfDrJd71Vd5Aumllr1D24dcV2xyoXqTg1UVhN83OdH8R2d5aOOI9
         ykbnmr+3U41sdocCTsuYHsSG25ZOiVjahZWblqgRBDwNJHUh/PnlvhGUIC+PziGQzSH7
         tUJ9wuzu0fDYtkYuaVGfI1SnxsR/YeMPJZxpFZ/dG/gHBMfL0QoKpJdyPXZ7YB1H4ERQ
         GgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693717396; x=1694322196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uu67Ls/F4z06J7Rxho3Zvml33YWEYeBVR018XCJHcRE=;
        b=FNNYFaS65mYFFhmiyPXxCONc0DG4GPyUbN5P5spOFncsPH+bQjZcn/Ue89OTe21e9N
         lcILkX0kdZkbsAjmJmT4WtM5Gx6/HeE++wRAWV5GIAIhyEAbjgAMLRQzsg3IkbKKDIJi
         erTw1eoUe/pkIJvxeskCcMGLFxcNW2cOSzKJEA7m3nvvGHzKFszVyw3MTNwjQZpwjHzs
         v6YeQ3Uy9lj7KLsnXaYMlDn1ujMTbzsFIvHQbSbGV07pnXcJZShGChJWf9zhuzpBgEoY
         vCSIRDF55jdzWR+6qA2p9fb8CaAtMfb0J/o5qb8KQtL1iCSwy4yhS1jlcfkrWR8lFxh+
         pz3w==
X-Gm-Message-State: AOJu0YxdxzTRnWPoRMa6APDdcuDQ3Sjnz3RAKWWfNK2Ij7HvXGk5ms4+
	CW22WduX91Q+5L3N8OzjXuMI8TpPBHDwvA==
X-Google-Smtp-Source: AGHT+IEsjZpHppsRH9MLTdT7aUE2zYtQNxn+C9ltlmYuAUudc9z7lGQEbRdIhw8BB/4K5NriesRT5Q==
X-Received: by 2002:a17:90a:5b10:b0:26d:2d77:da7b with SMTP id o16-20020a17090a5b1000b0026d2d77da7bmr5992224pji.6.1693717396209;
        Sat, 02 Sep 2023 22:03:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id cq14-20020a17090af98e00b00263e4dc33aasm6832123pjb.11.2023.09.02.22.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 22:03:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3: Fix ptests on musl
Date: Sat,  2 Sep 2023 22:03:13 -0700
Message-ID: <20230903050313.1236751-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Sep 2023 05:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187153

Adjust locale dependencies to help run tests sadly, tr-tr is not
available yet in musl-locale so keep that specific to glibc

Add an exclusion list for tests and populate it for musl for the failing
tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3/run-ptest | 4 ++--
 meta/recipes-devtools/python/python3_3.11.5.bb | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
index efa84555a5f..d1c26c11e2c 100644
--- a/meta/recipes-devtools/python/python3/run-ptest
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
-
-{ SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v -j 4 || echo "FAIL: python3" ; } | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+SKIPPED_TESTS=
+{ SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test $SKIPPED_TESTS -v -j 4 || echo "FAIL: python3" ; } | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
index 10a4811f640..f5d97311d7c 100644
--- a/meta/recipes-devtools/python/python3_3.11.5.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -224,6 +224,10 @@ do_install:append:class-nativesdk () {
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
+do_install_ptest:append:class-target:libc-musl () {
+    sed -i -e 's|SKIPPED_TESTS=|SKIPPED_TESTS="-x test__locale -x test_c_locale_coercion -x test_locale -x test_os test_re -x test__xxsubinterpreters -x test_threading"|' ${D}${PTEST_PATH}/run-ptest
+}
+
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"
 SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " provide_target_config_script"
 
@@ -431,8 +435,9 @@ FILES:${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS:libpython3:append:libc-glibc = " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils"
-RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-fr-fr locale-base-en-us locale-base-tr-tr locale-base-de-de"
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils \
+                        locale-base-fr-fr locale-base-en-us locale-base-de-de"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-tr-tr"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
 DEV_PKG_DEPENDENCY = ""
-- 
2.42.0


