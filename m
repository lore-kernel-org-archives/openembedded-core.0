Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4A5C4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 17:17:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.2173.1702401437277627470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 09:17:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0WPj7XIN;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c1e3ea2f2so60018395e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 09:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702401435; x=1703006235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QbtaYay3r2CFHrBltUQOrXcrCpr6nCsgJf2zq5hOflo=;
        b=0WPj7XINNE4FT9CQcxgTWO2AK5hxFF17hnTD56guXZwcjE1la17jSKES+Au3624FNA
         tXQsfiH519u/3MytZU1ySsr7sJIAegwIwZcGPkhtyLQFgtMVBgwKZe3HOhlmxRDdqYLV
         s0nh+bhZ7hd3+DmIr/9ESyoBuFnzaFyTIvxE7wbuLCK+rWwX/0a+irzrEQrEOkqDUREO
         mpYgKy0SbMTq0rD+c5NwoCUC/ScGNMv9LyMefwuU9wVurnWDLm8jDTDQKrsLPmmuM4l1
         z4oay98nYiTqSFt+eQPHTuYj1FWlytEXZrOkhk/QjDlGAQiU0aSuYKzVOC5WRn/G7VXx
         4fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702401435; x=1703006235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbtaYay3r2CFHrBltUQOrXcrCpr6nCsgJf2zq5hOflo=;
        b=gRvU6nwlC+veKYbMZ4m5ZTocf+z8F9JAJu4zkpx6iTyf9XjqTkQkADfVDQLeHxi5TL
         4Evlp8ev99PynVQgbANO8r/Nw7Ut0LBfxdl2Uq1z/pRi3ZmyunCY0oBLc5/t0iLYfA0g
         VTk4syhVo+xW7cN2q90vn+nV0IkHf7spqda9lnk4LOfJyk53JwtoYhdT8fV6kA87WXSW
         9DgrkY6RQE+7XxoTgM3e8SM9wRWGWwfxNgZEccLVbkoC4qoL+qTL84BiuHSLaDpSGhSM
         IBXQC1ihDeuo4AWhDc4g1OcgN39/4X7kgDERpSLpDgw38Y41sT9C818dfIsdv5zFmDd4
         l5Jw==
X-Gm-Message-State: AOJu0YyLrCq/edY5gSK0Y/DzJLNXWoODfcPCV9L0V5i1AVto5vnURwcy
	16thw25nVg+YC0OckIg1Of+MmAdWb1hA6VXUg2PsvA==
X-Google-Smtp-Source: AGHT+IG1qDQCSpj7zwVMPvc9wezUmNse+6ah7qlLMh1gM6H6WTL6jGivjQf2oIiFrA97CVMHXjx+Ew==
X-Received: by 2002:a7b:ce0f:0:b0:40c:3103:2eb1 with SMTP id m15-20020a7bce0f000000b0040c31032eb1mr3476396wmc.22.1702401435045;
        Tue, 12 Dec 2023 09:17:15 -0800 (PST)
Received: from localhost.localdomain ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c311100b0040c4535f1a2sm9286079wmo.39.2023.12.12.09.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 09:17:14 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 1/2] usergrouptests.py: Test that postinst-useradd-* run in order
Date: Tue, 12 Dec 2023 17:17:10 +0000
Message-Id: <add845338f015b4fce34a9e68a7be4ba304d74fa.1702401361.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 17:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192238

This tests for 13904, that postinst-useradd-* run in order.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../selftest-users/asecondgroup.bb            | 31 +++++++++++++++++++
 .../selftest-users/bfirstgroup.bb             | 29 +++++++++++++++++
 .../selftest-users/cthirdgroup.bb             | 30 ++++++++++++++++++
 .../recipes-test/selftest-users/groupdep.bb   | 25 +++++++++++++++
 .../lib/oeqa/selftest/cases/usergrouptests.py |  7 +++++
 5 files changed, 122 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/asecondgroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/bfirstgroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/cthirdgroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/groupdep.bb

diff --git a/meta-selftest/recipes-test/selftest-users/asecondgroup.bb b/meta-selftest/recipes-test/selftest-users/asecondgroup.bb
new file mode 100644
index 00000000000..0ab4ba2a81f
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/asecondgroup.bb
@@ -0,0 +1,31 @@
+SUMMARY = "asecondgroup"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+DEPENDS = "coreutils-native"
+
+
+S = "${WORKDIR}"
+
+inherit useradd allarch
+USERADD_DEPENDS = "bfirstgroup"
+
+USERADD_PACKAGES = "${PN}"
+
+USERADD_PARAM:${PN} = "-r -g grouptest3 -G grouptest2 -s /sbin/nologin gt4"
+GROUPADD_PARAM:${PN} = "-r grouptest3"
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
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
+
diff --git a/meta-selftest/recipes-test/selftest-users/bfirstgroup.bb b/meta-selftest/recipes-test/selftest-users/bfirstgroup.bb
new file mode 100644
index 00000000000..e9e2ab21d57
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/bfirstgroup.bb
@@ -0,0 +1,29 @@
+SUMMARY = "bfirstgroup"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+DEPENDS = "coreutils-native"
+
+S = "${WORKDIR}"
+
+inherit useradd allarch
+
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "-r -g grouptest2 -s /sbin/nologin gt3"
+GROUPADD_PARAM:${PN} = "-r grouptest2"
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
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
diff --git a/meta-selftest/recipes-test/selftest-users/cthirdgroup.bb b/meta-selftest/recipes-test/selftest-users/cthirdgroup.bb
new file mode 100644
index 00000000000..fda4b670ef5
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/cthirdgroup.bb
@@ -0,0 +1,30 @@
+SUMMARY = "asecondgroup"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+DEPENDS = "coreutils-native"
+
+
+S = "${WORKDIR}"
+
+inherit useradd allarch
+USERADD_DEPENDS = "asecondgroup"
+
+USERADD_PACKAGES = "${PN}"
+
+USERADD_PARAM:${PN} = "-r -g grouptest4 -G grouptest3 -s /sbin/nologin gt5"
+GROUPADD_PARAM:${PN} = "-r grouptest4"
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
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
diff --git a/meta-selftest/recipes-test/selftest-users/groupdep.bb b/meta-selftest/recipes-test/selftest-users/groupdep.bb
new file mode 100644
index 00000000000..ef2f0865725
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/groupdep.bb
@@ -0,0 +1,25 @@
+SUMMARY = "groupdep"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+DEPENDS = "coreutils-native cthirdgroup"
+
+S = "${WORKDIR}"
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
+	chown  gt3:grouptest2 ${TESTDIR}/file
+	chown -R gt3:grouptest2 ${TESTDIR}/dir
+	chown -h gt4:grouptest3 ${TESTDIR}/symlink
+	chown -R gt4:grouptest3 ${TESTDIR}/fifotest
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
index a331ca9f2c4..3beccc5ce7e 100644
--- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -51,3 +51,10 @@ class UserGroupTests(OESelftestTestCase):
         self.write_config("USERADD_GID_TABLES += \"files/static-group\"")
         self.logger.info("Rebuild with other staticids")
         self.assertTrue(bitbake(' core-image-minimal'))
+        
+    def test_postinst_order(self):
+        # Test for YOCTO #13904
+        bitbake(' bfirstgroup asecondgroup cthirdgroup groupdep -c clean')
+        self.logger.info("Building groupdep do_prepare_recipe_sysroot")
+        self.assertTrue(bitbake(' groupdep -c do_prepare_recipe_sysroot'))
+
-- 
2.34.1


