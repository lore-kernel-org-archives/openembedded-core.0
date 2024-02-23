Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB24C54E4C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 11:16:16 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.8365.1708686975750317250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 03:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=TkVfT7rf;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41296df8306so1293275e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 03:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708686974; x=1709291774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4ApzvAikFO9oc5ZJQqzlgOspPqZe3SqYbktvFDaFZ4=;
        b=TkVfT7rfehBDc7SPGL7WDoyIA5TNhK7rKnq45xgExWyAhG+hIa2iL6a1QuzJbc+DnX
         LBbfHZLSJX3ylkZkYJ83D7A1tQBFyjYUH3nHSxmm3IXw7umioSM2ewCEZSpqK+G+njDI
         Ph9cMy4yNRPwPpL/svSqdKxvkoxNExQO96YpsvqVW/8VGR1q/z83ZsJWRIUr+h2VY0Dy
         qPiper1Oky8yy8AxB7Kgsrt3onVKGhkKmFxXAFeGoAnSZGVF9ZqWdlJttv6PHJBinUY0
         q9Qr9duk+craJ+cyQcMkUPnxHQOvXqGcB1ZldtH+wh6AcuHmOegdTq5XoC8m4S40ZD8p
         /ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708686974; x=1709291774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4ApzvAikFO9oc5ZJQqzlgOspPqZe3SqYbktvFDaFZ4=;
        b=U/J/6lfv0EbkmNprIyws2Z+3J/dN6BD59rHFu9/yn6GANTTSMwd5gmQA8c9OAeQOCD
         xZHnIgg6AYrCLU9yjI+qUdaDnB+lEuna/m18Mv5KWc6+eRVG/XlSzKOL6AZQl+lzuiMs
         O+XKWzvljsRRikls9VGWxg1U09TOyifRfwG8P/D9M3EL6lHwOB8mbRQrwKGi+90gCz91
         lk/fRmTBnSHznlx014U0UcxhF88GLeTVF+3nQRIioAKRNiRIT6FdGk5iv+59rAo9TEeY
         FT2gnr/D8HfFPWKLjEz8fNxBKI2aAZDvlXr5M6hMLKF/Kz5nGryeAj7TSx1uSNkKdHgG
         VElw==
X-Gm-Message-State: AOJu0YzsAQqXqktJ2rezra5Khl+ViHlzeuusUkXv4zvD7oFhLt7evilZ
	ZM+4GNxmmd13pCD6IX9pXEbWWaW+z9sn1Xy5qdogVf4yDQpuyRqHU24YT6rZ246YWZmbrXl3Aj4
	Cffs=
X-Google-Smtp-Source: AGHT+IH0VQB/cgYTt1+n7xy86VlLULCojduAThl/NRr0ZOCQddkVK5fvQTHrMAZ2kvquZlKWdza1JQ==
X-Received: by 2002:a05:600c:3ac7:b0:412:96a0:dada with SMTP id d7-20020a05600c3ac700b0041296a0dadamr459398wms.3.1708686974281;
        Fri, 23 Feb 2024 03:16:14 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id jd17-20020a05600c68d100b004129335947fsm1895094wmb.8.2024.02.23.03.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 03:16:13 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH v2 2/3] selftest-users: Convoluted selftest for USERADD_DEPENDS
Date: Fri, 23 Feb 2024 11:16:03 +0000
Message-Id: <3cee65994b559494a038674015164450343238f8.1708686845.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708686845.git.pidge@baylibre.com>
References: <cover.1708686845.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 11:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196058

This adds a test for 13904's fix by creating a convoluted set of recipes
with USERADD_DEPENDS in non-alpha order.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../selftest-users/acreategroup.bb            | 32 ++++++++++++++++
 .../selftest-users/bcreategroup.bb            | 37 +++++++++++++++++++
 .../selftest-users/ccreategroup.bb            | 34 +++++++++++++++++
 .../selftest-users/dcreategroup.bb            | 33 +++++++++++++++++
 .../lib/oeqa/selftest/cases/usergrouptests.py |  4 ++
 5 files changed, 140 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/acreategroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/bcreategroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/ccreategroup.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/dcreategroup.bb

diff --git a/meta-selftest/recipes-test/selftest-users/acreategroup.bb b/meta-selftest/recipes-test/selftest-users/acreategroup.bb
new file mode 100644
index 0000000000..66ed5695a2
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/acreategroup.bb
@@ -0,0 +1,32 @@
+SUMMARY = "creategroup_a"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+S = "${WORKDIR}"
+
+EXCLUDE_FROM_WORLD="1"
+
+inherit useradd allarch
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "-u 5560 --gid a_group a_user"
+GROUPADD_PARAM:${PN} = "-r a_group"
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
+	chown    a_user:a_group ${TESTDIR}/file
+	chown -R a_user:a_group ${TESTDIR}/dir
+	chown -h a_user:a_group ${TESTDIR}/symlink
+	chown -R a_user:a_group ${TESTDIR}/fifotest
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
diff --git a/meta-selftest/recipes-test/selftest-users/bcreategroup.bb b/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
new file mode 100644
index 0000000000..c4844dd0da
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/bcreategroup.bb
@@ -0,0 +1,37 @@
+SUMMARY = "creategroup_b"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+# This recipe requires a and c. C requires A. Reverse alpha.
+
+USERADD_DEPENDS = "acreategroup ccreategroup"
+
+S = "${WORKDIR}"
+
+EXCLUDE_FROM_WORLD="1"
+
+inherit useradd allarch
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "-u 5561 -g b_group -G a_group,c_group b_user "
+GROUPADD_PARAM:${PN} = "-r b_group"
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
+	chown    a_user:a_group ${TESTDIR}/file
+	chown -R c_user:c_group ${TESTDIR}/dir
+	chown -h a_user:a_group ${TESTDIR}/symlink
+	chown -R b_user:b_group ${TESTDIR}/fifotest
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
+
diff --git a/meta-selftest/recipes-test/selftest-users/ccreategroup.bb b/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
new file mode 100644
index 0000000000..021b1ebbf7
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/ccreategroup.bb
@@ -0,0 +1,34 @@
+SUMMARY = "creategroup_c"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+USERADD_DEPENDS = "acreategroup"
+
+S = "${WORKDIR}"
+
+EXCLUDE_FROM_WORLD="1"
+
+inherit useradd allarch
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "-u 5563 --gid c_group -G a_group c_user"
+GROUPADD_PARAM:${PN} = "-r c_group"
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
+	chown    c_user:c_group ${TESTDIR}/file
+	chown -R c_user:c_group ${TESTDIR}/dir
+	chown -h c_user:c_group ${TESTDIR}/symlink
+	chown -R c_user:c_group ${TESTDIR}/fifotest
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
diff --git a/meta-selftest/recipes-test/selftest-users/dcreategroup.bb b/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
new file mode 100644
index 0000000000..b96ca92a16
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/dcreategroup.bb
@@ -0,0 +1,33 @@
+SUMMARY = "creategroup_d"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+USERADD_DEPENDS = "bcreategroup"
+
+S = "${WORKDIR}"
+
+EXCLUDE_FROM_WORLD="1"
+
+inherit useradd allarch
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "-u 5564 -g d_group -G b_group d_user "
+GROUPADD_PARAM:${PN} = "-r d_group"
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
+	chown    d_user:d_group ${TESTDIR}/file
+	chown -R d_user:b_group ${TESTDIR}/dir
+	chown -h d_user:d_group ${TESTDIR}/symlink
+	chown -R d_user:b_group ${TESTDIR}/fifotest
+}
+
diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
index a331ca9f2c..3c59b0f290 100644
--- a/meta/lib/oeqa/selftest/cases/usergrouptests.py
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -22,6 +22,10 @@ class UserGroupTests(OESelftestTestCase):
         # Test for YOCTO #14961
         self.assertTrue(bitbake('useraddbadtask -C fetch'))
 
+    def test_postinst_order(self):
+        self.logger.info("Building dcreategroup")
+        self.assertTrue(bitbake(' dcreategroup'))
+
     def test_static_useradd_from_dynamic(self):
         metaselftestpath = get_test_layer()
         self.logger.info("Building core-image-minimal to generate passwd/group file")
-- 
2.34.1


