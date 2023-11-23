Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D49C624B4
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 13:49:07 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.90973.1700747346672453138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 05:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FN4Ale10;
 spf=pass (domain: baylibre.com, ip: 209.85.221.42, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32d81864e3fso585913f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 05:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700747345; x=1701352145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nrKhUR3SzwXfk55KDK/4XAKQk4VvumGM7CMmkG+JWM=;
        b=FN4Ale10A7QLbIp2b1RB38gKw/nb7yNYDZbMyoEdocRl+1P5mY21RxQ658r74zGGcl
         rYkxtHc4sBZW+Q4IG1NGPlKwSTcax8It3C3wtmbkG7gqJPo8rR+3ItdbHRwStzY283iO
         ACcIibZTusEMTM8IS8ucqlV2fKscFYzPLV5ItmlG4RjGry/gSljq7n0b8gb6KMwx+NC3
         L0Yyn4DDlAhsWH9P2Ko03ZcJlVT5rm7JggD/bRyIIrwPFQa0u5iin7PWn0PiEdfanjvc
         e1rr6ZiddNN9/6nV5r1+BgDWHs9CeXzaIlTKziHg2Vi0AaA4sSWccnZHwHLgkw7xBnYD
         YS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700747345; x=1701352145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nrKhUR3SzwXfk55KDK/4XAKQk4VvumGM7CMmkG+JWM=;
        b=jkltX23laQTIIeew3yRsL7b71levSrqLBK1p4DgaicMlRhzQHOnLf/+EGv43evSHeC
         fjhSG+F/CgZBVS2yP9WHOBurZA4MhEMwl7FEFfpo0mV28BR5OuIs69ZXRPnNMyM4c52g
         63p4s8dVyH0Nu6zrRxATp0FSiUpWbnFnFGotdZ0cRbAKluZ6zCqC9VyfMFT73/8U7wQJ
         2hfWM8l+7NU+UJbPeBrR4VfyTpXI8e/altGzpC3qY0qvPs2mPMInDZVFhlQ/Of+d7whe
         pLiAY4jhqLEHVFSqtBAk3FF6vPjlUGwyR0anK9GbZD3zR35tAU0o+rs6T6R2ZC516iSs
         c0Cg==
X-Gm-Message-State: AOJu0YybzOFHjqxi9yjOaC+9qXrRLAiC27WFJwzc4CPP+QpL6bOsenCZ
	Ld6hYKf9/9oizz1OolZ5VouaGVeEMlqHhVCGp+KMmA==
X-Google-Smtp-Source: AGHT+IGxI5akkGswqx3eINAO/GWHm8loBiq5uxXWLZUFETj26bHHZ8BkPCaG1ovjaUB37XgF6tLxtw==
X-Received: by 2002:adf:fc10:0:b0:331:6b5d:84d2 with SMTP id i16-20020adffc10000000b003316b5d84d2mr3481025wrr.19.1700747345255;
        Thu, 23 Nov 2023 05:49:05 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id c3-20020a5d4143000000b0032dde679398sm1754983wrq.8.2023.11.23.05.49.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 05:49:04 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC 1/2] usergrouptests: Add initial useradd testing
Date: Thu, 23 Nov 2023 13:49:00 +0000
Message-Id: <9dc02c0f89156ed4ce47350f90d44cb05e7d3897.1700746611.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700746611.git.pidge@baylibre.com>
References: <cover.1700746611.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 13:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191154

This commit tests for
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13419
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14961

Fixes for these are in following commits.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../selftest-users/creategroup1.bb            | 32 +++++++++++++++++++
 .../selftest-users/creategroup2.bb            | 32 +++++++++++++++++++
 .../selftest-users/useraddbadtask.bb          | 20 ++++++++++++
 .../lib/oeqa/selftest/cases/usergrouptests.py | 32 +++++++++++++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup1.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup2.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/usergrouptests.py

diff --git a/meta-selftest/recipes-test/selftest-users/creategroup1.bb b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
new file mode 100644
index 00000000000..2b0c443858c
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
@@ -0,0 +1,32 @@
+SUMMARY = "creategroup pt 1"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+DEPENDS:append = "coreutils-native"
+
+S = "${WORKDIR}"
+
+inherit useradd allarch
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "-u 5555 --gid grouptest gt1"
+GROUPADD_PARAM:${PN} = "-r grouptest"
+
+TESTDIR = "${D}${sysconfdir}/creategroup"
+
+do_install() {
+	install -d   ${TESTDIR}
+	install -d   ${TESTDIR}/dir
+	touch        ${TESTDIR}/file
+	ln -s ./file ${TESTDIR}/symlink
+	install -d   ${TESTDIR}/fifotest
+	mkfifo       ${TESTDIR}/fifotest/fifo
+    which chown
+	chown    gt1:grouptest ${TESTDIR}/file
+	chown -R gt1:grouptest ${TESTDIR}/dir
+	chown -h gt1:grouptest ${TESTDIR}/symlink
+	chown -R gt1:grouptest ${TESTDIR}/fifotest
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
diff --git a/meta-selftest/recipes-test/selftest-users/creategroup2.bb b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
new file mode 100644
index 00000000000..6f25592c09f
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
@@ -0,0 +1,32 @@
+SUMMARY = "creategroup pt 2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+DEPENDS:append = "coreutils-native creategroup1"
+
+S = "${WORKDIR}"
+
+inherit useradd allarch
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "-u 5556 --gid grouptest gt2"
+
+TESTDIR = "${D}${sysconfdir}/creategroup"
+
+do_install() {
+	install -d   ${TESTDIR}
+	install -d   ${TESTDIR}/dir
+	touch        ${TESTDIR}/file
+	ln -s ./file ${TESTDIR}/symlink
+	install -d   ${TESTDIR}/fifotest
+	mkfifo       ${TESTDIR}/fifotest/fifo
+
+	chown    gt2:grouptest ${TESTDIR}/file
+	chown -R gt2:grouptest ${TESTDIR}/dir
+	chown -h gt2:grouptest ${TESTDIR}/symlink
+	chown -R gt2:grouptest ${TESTDIR}/fifotest
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
+
diff --git a/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb b/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
new file mode 100644
index 00000000000..99e04a80b34
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
@@ -0,0 +1,20 @@
+SUMMARY = "UserAddBadTask"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+DEPENDS:append = "coreutils-native"
+
+S = "${WORKDIR}"
+
+inherit useradd allarch
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "-u 5555 --gid groupaddtask useraddtask"
+GROUPADD_PARAM:${PN} = "-r groupaddtask"
+
+do_badthingshappen() {
+ echo "foo"
+}
+
+addtask badthingshappen after do_populate_sysroot before do_package
diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
new file mode 100644
index 00000000000..14f7a0beab0
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -0,0 +1,32 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var
+import bb.utils
+import os
+
+class UserGroupTests(OESelftestTestCase):
+    def test_group_from_dep_package(self):
+        self.logger.info("Building creategroup2")
+        self.logger.info("Cleaning sstate for creategroup1 and creategroup2")
+        bitbake(' creategroup1 creategroup2 -f -c cleansstate')
+        self.logger.info("Building creategroup2")
+        bitbake(' creategroup2')
+        self.logger.info("Wiping out TMPDIR")
+        tmpdir = get_bb_var('TMPDIR')
+        if os.path.exists(tmpdir):
+            bb.utils.remove(tmpdir, recurse=True)
+        self.logger.info("Packaging creategroup2")
+        self.assertTrue(bitbake(' creategroup2 -c package'))
+
+    def test_add_task_between_p_sysroot_and_package(self):
+        self.logger.info("Cleaning sstate for useraddbadtask")
+        bitbake(' useraddbadtask -f -c cleansstate')
+        self.logger.info("Building useraddbadtask")
+        # This is expected to fail due to bug #14961
+        self.assertTrue(bitbake(' useraddbadtask'))
+    
-- 
2.34.1


