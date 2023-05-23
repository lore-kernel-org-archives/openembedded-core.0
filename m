Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BE7C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 15:41:28 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.93.1684856484318337148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 08:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=ZnEzQ+RN;
 spf=pass (domain: baylibre.com, ip: 209.85.166.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-77487fc1f16so44407439f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684856483; x=1687448483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tImNtW1qm9sMxeApzEId+srdMH7bVJxAQslNQpizgtw=;
        b=ZnEzQ+RNWi+nJnTdNbzmGvct3+LyYqbAGe1OM6PfOQMFYWZGEF3DN8gRd8ebKvoXbh
         jfcSkZdL9Arrgtke/rj95A9/nCT2agPlucRG5XbtqgxEF81EfdJD44oedfkvsBJ53L0Z
         nt8Ih3wr+owkXeH45IH+Ugzu0BnB42jMCwv9UG/LYRkM6gCGja+j98j57RWJFnUgCpBM
         gGoJPjhMnjuC6RYuDrQyr4FBwGOYJ5JZhFFEqaBcx/dvrCoXDCrb5pxhzQDqfhq0P/1R
         OVvDQjlsdcGW2S3qT+lbJ6D7brtvzY9DZtT8TCd0/d6u5lzOy+92fCWWnAXzd/N1bvq9
         NEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684856483; x=1687448483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tImNtW1qm9sMxeApzEId+srdMH7bVJxAQslNQpizgtw=;
        b=WfRo/p1drUHyu2Zx4ehPXINAw2Rds5OFtuIvDkb8xS/JXnqgdJustWg/zrdK2iuStX
         7VJDl6vVHZFKsn9SjMauJ/IqJLr/tq1b4lxil3Aot+CA6rzC3MPMC5Sw3+Gy7gNqhITO
         00bH4sginbTw3/oGCA/46LJB/NCv2xNYtzjYRbmmAiC2CCNRZpTRsy3sgBSeQthLSo/g
         ll7NPl8s8M8n/7PX1RpuGF1/cdcotJsWEKArOV/hQoHjkwuOgMyoDgK7paOOlftECHJ3
         QKtfoBim+w4yziPXtjBQKCLexTrgsix8cQHWjwHdUQBleLi3vUYQZx7TnLevmXPOU38M
         3M1w==
X-Gm-Message-State: AC+VfDzXtl52EmraCitJbDrflpcGgJjNXxusLh+C4ib9IQUNwCDq9PkQ
	itHAnUzs0jRf+qwOwERjT8jAQ/+to5VmZEvarfc=
X-Google-Smtp-Source: ACHHUZ6qrunRTaXD6aIkSwNqi1e9hEqh/qkymCAvP0l9i6IXloVdGeM3xquEX/L6gkSj2ya9Y0Im9Q==
X-Received: by 2002:a6b:db19:0:b0:769:82a4:4419 with SMTP id t25-20020a6bdb19000000b0076982a44419mr9623573ioc.14.1684856483355;
        Tue, 23 May 2023 08:41:23 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:4839:d997:f6ce:5f02])
        by smtp.gmail.com with ESMTPSA id u16-20020a5d83d0000000b00770196f2d6asm2699588ior.3.2023.05.23.08.41.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 08:41:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] b4: add recipe
Date: Tue, 23 May 2023 11:41:22 -0400
Message-Id: <20230523154122.1798757-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 15:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181644

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/b4/b4_0.12.2.bb         | 35 +++++++++++++++++++
 ...skip-tests-requiring-git-filter-repo.patch | 30 ++++++++++++++++
 meta/recipes-devtools/b4/files/run-ptest      |  3 ++
 5 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/b4/b4_0.12.2.bb
 create mode 100644 meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch
 create mode 100644 meta/recipes-devtools/b4/files/run-ptest

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e99fbe4aef..72145a0a38 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -52,6 +52,7 @@ RECIPE_MAINTAINER:pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-b4 = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-babeltrace2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-baremetal-helloworld = "Alejandro Hernandez <alejandro@enedino.org>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index da9153b998..2c9fb3433d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -7,6 +7,7 @@ PTESTS_FAST = "\
     acl \
     apr-util \
     attr \
+    b4 \
     babeltrace \
     babeltrace2 \
     bc \
diff --git a/meta/recipes-devtools/b4/b4_0.12.2.bb b/meta/recipes-devtools/b4/b4_0.12.2.bb
new file mode 100644
index 0000000000..f222a8b2e5
--- /dev/null
+++ b/meta/recipes-devtools/b4/b4_0.12.2.bb
@@ -0,0 +1,35 @@
+SUMMARY = "B4 workflow tools"
+DESCRIPTION = "A tool to work with public-inbox and patch archives"
+HOMEPAGE = "https://git.kernel.org/pub/scm/utils/b4/b4.git/"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+SRC_URI[sha256sum] = "b6f4afd78bf78a28055b389f0909792b1c7805fb3557f5d71efbda3682aabe6e"
+
+inherit python_setuptools_build_meta ptest
+
+SRC_URI += "git://git.kernel.org/pub/scm/utils/b4/b4.git;branch=stable-0.12.y;protocol=https \
+            file://run-ptest \
+            file://0001-test_ez-skip-tests-requiring-git-filter-repo.patch \
+"
+
+SRCREV = "0529d7ae380c46f8006892d8fffb563326e2d131"
+
+RDEPENDS:${PN} += " \
+        ${PYTHON_PN}-mailbox \
+        ${PYTHON_PN}-requests \
+"
+
+RDEPENDS:${PN}-ptest += " \
+        git \
+        ${PYTHON_PN}-pytest \
+        ${PYTHON_PN}-unittest-automake-output \
+"
+
+S = "${WORKDIR}/git"
+
+do_install_ptest() {
+      install -d ${D}${PTEST_PATH}/tests
+      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch b/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch
new file mode 100644
index 0000000000..579c31d090
--- /dev/null
+++ b/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch
@@ -0,0 +1,30 @@
+From 5b77018e0d5648f519345a682752df91d99a6a09 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 23 May 2023 11:09:07 -0400
+Subject: [PATCH] test_ez: skip tests requiring git-filter-repo
+
+git-filter-repo isn't available and is difficult to properly add as a
+recipe, so skip b4 ptests that require it to be installed.
+
+Upstream-Status: Inappropriate (oe-specific)
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ tests/test_ez.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/test_ez.py b/tests/test_ez.py
+index 1b02e7b..059c84c 100644
+--- a/tests/test_ez.py
++++ b/tests/test_ez.py
+@@ -32,6 +32,7 @@ def prepdir(gitdir):
+      ['log', '--format=%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thread-with-followups-and-tripledash',
+      None),
+ ])
++@pytest.mark.skip(reason="no git-filter-repo")
+ def test_trailers(sampledir, prepdir, mboxf, bundlef, rep, trargs, compareargs, compareout, b4cfg):
+     if b4cfg:
+         b4.MAIN_CONFIG.update(b4cfg)
+-- 
+2.40.1
+
diff --git a/meta/recipes-devtools/b4/files/run-ptest b/meta/recipes-devtools/b4/files/run-ptest
new file mode 100644
index 0000000000..b63c4de0d9
--- /dev/null
+++ b/meta/recipes-devtools/b4/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.40.1


