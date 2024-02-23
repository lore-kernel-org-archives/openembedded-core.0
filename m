Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09A2C54E41
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 13:25:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.10339.1708694740300563152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 05:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MoHM29ZS;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33da6f289cfso310500f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 05:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708694739; x=1709299539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0BSSTx3OYUXeI5PPdhJ1bfPylh3EZmIzQWPYW3/Zko=;
        b=MoHM29ZS8aPsFltZvAFTDVzj7VJbET6bN8CQM+r5Ca8Cm1xu+SfenxRUOFRJrcZ/bx
         nWgvV8XA0DLF3/pkDKxSWJnDA7nhLJJviTCb2ztBse//GQLZ89c8gXc7CCzKBe0KLvA/
         CkFxTiGihkqbsOE8GAhOLuNiy0j6a/Xh4aWu+KK+dcBYxXcllss0J8jH9mIhAABs4wyX
         tiFk2tJKmMifPfX0WKW4zxlUOCR1QYGtP8fSFJ6gyKDmdUlIH48KXCn1B4eHG6YkL8DK
         lfTvyz4YpunHwXBFLMX+5CmtkJWSYNd/Ozb7eh7RAa/GSPRTQm8oOW60ryC1JEgPmJdk
         spUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708694739; x=1709299539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0BSSTx3OYUXeI5PPdhJ1bfPylh3EZmIzQWPYW3/Zko=;
        b=XhIwKBiIibOuSyVowcbZlDMIGikxyhRbjSz18viE6n3PdY8R48wIRXQoSVwomf7lVS
         sWsdl/mxRWQhlbmr4PpXaqxKevxCq/Bdx4vseZOIEpMRqv45d40eSYmQxiHGJjevDb1W
         vEtAHb6KT+7O8FKNNtZZPtmacxyRRdqrnFZFf+2guYFyT4YlLTV1fAe2SSavYivCCCtO
         upkhY6tCm/ixCqeIZ2YNoVHd7GG/Z71UEmp6hEjrKDokwNs8vk1JEbp4FgLhJ2dMLyw7
         PElL/AG9T/i181rdGWCtoADx/UpPHL4JyULF3Eql3OCySj73h8QjAAEJL1xorAVWTgZv
         /bNw==
X-Gm-Message-State: AOJu0YwMlng92LpqPG7UIDLQMavfBHqOu2h+KAdCAXU9WQ5phaYyXAm/
	an3cVSR86u0KNE1cHAxMwD9NIsEXvJBH19gaOaCSwolJFvIYi8tfBFjDBMyGYimz62pcn70XyjJ
	vY2Y=
X-Google-Smtp-Source: AGHT+IFN0vj/uYl0fMwCWcf8Ufh4Y86BFCuD1FVtVmll3KwDllSoA9noO0evGPNLeyLgf8FsF8+18w==
X-Received: by 2002:adf:fe87:0:b0:33d:2629:c518 with SMTP id l7-20020adffe87000000b0033d2629c518mr1574332wrr.64.1708694738872;
        Fri, 23 Feb 2024 05:25:38 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b0033d3b8820f8sm2793450wrb.109.2024.02.23.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 05:25:38 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH v3 2/3] selftest-users: Convoluted selftest for USERADD_DEPENDS
Date: Fri, 23 Feb 2024 13:25:21 +0000
Message-Id: <5385ea75165e7973c7c0c9e635fff2502b086fe3.1708694024.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708694024.git.pidge@baylibre.com>
References: <cover.1708694024.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196077

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
index 00000000000..66ed5695a26
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
index 00000000000..c4844dd0da0
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
index 00000000000..021b1ebbf77
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
index 00000000000..b96ca92a160
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
index a331ca9f2c4..3c59b0f2908 100644
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


