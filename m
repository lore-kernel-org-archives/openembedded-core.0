Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776AFC54798
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 14:54:18 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.14602.1708613653146364260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 06:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0Z7Z/8WY;
 spf=pass (domain: baylibre.com, ip: 209.85.215.171, mailfrom: pidge@baylibre.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5c66b093b86so718429a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 06:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708613652; x=1709218452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4ApzvAikFO9oc5ZJQqzlgOspPqZe3SqYbktvFDaFZ4=;
        b=0Z7Z/8WY3Uj714bakzyBn5Y2JuLbv9vP4sn277lbwRLrQ7TjZZqpkVm/nhv6/sSWWt
         wm+XXYgAlrVifcWnK0HveTQ50tZB8qTuMyb2ra6PEo5S+HadsVTvhfJr73vO2iI16hFj
         49SMihS7viVkKdnYLwAqLSMGQ8M/vsNZPrckpOOz5NSnEi4Smzn1JlxY35yY6bbi+hV6
         BtX5ClDhcl1xSHv7LJDb5tS++fG6oEF9TxW+U7vu3DlIMDoCTc9wR3UaNHZMypg7HVXa
         yv48o2u+K/0C5QocHs1p9ojbTbFmiEXQwQU+5OPH711hSvXmNVqGjxShXC7o/1j/qevH
         lncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708613652; x=1709218452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4ApzvAikFO9oc5ZJQqzlgOspPqZe3SqYbktvFDaFZ4=;
        b=Q09WyLPfYuq5mZP1evpFiSyn/2RIKZEuBIhwTML14oMqH3Cj9LWDzQ0VRCEh2FH9CL
         Jf7M8MgKAGECQ+NzYKALKqI0elCCPB2nNJiqTZsfSASQowzkDLL4B0E24DxBr97KqubP
         V5DWCm4Zcp8c9orr2WqWQRC6ww/PmHQPKt4bYxl3q3/ndqOnosnF3WNRlbt+tRfNevIQ
         qyrIEAXttTp0FdrIfJi5Q48yKX/+PhuwvWF1onnKQDVBkLOXa6eK7Y3Dt4aqv7qx9p8+
         Us9uLaSC1O2s6qZ1ycIFGjVd9nfuhgS4XZliqFO/ivfOFEWBP+O8GOSWQdNbuII9bu9z
         cdug==
X-Gm-Message-State: AOJu0YwlIUBn2QlELlaDOsRm9pjGiWVJzDT7/FC7YUYOQwxfvJHq6VnZ
	xEJkomIZyl/Numlh89XDSS+obpusLvmSFvgFDZKTw8p0S7lE2W1PyiRyNi9JqoWjwH4Z2L/mELC
	JvU4=
X-Google-Smtp-Source: AGHT+IFHwHremysLoMdBC7fyskRdeQBDPejJ7rNXKWjBOH57sZc8Fy1IZaujhLhulCdRySfi2f7Wtg==
X-Received: by 2002:a17:90a:77c9:b0:296:2afd:ead2 with SMTP id e9-20020a17090a77c900b002962afdead2mr3857982pjs.21.1708613652594;
        Thu, 22 Feb 2024 06:54:12 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id sz5-20020a17090b2d4500b00298cc4c56cdsm4067410pjb.22.2024.02.22.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:54:12 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 2/3] selftest-users: Convoluted selftest for USERADD_DEPENDS
Date: Thu, 22 Feb 2024 14:53:55 +0000
Message-Id: <1a32096c84c5124388a1c47ae3105cab5207cd8b.1708613381.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708613381.git.pidge@baylibre.com>
References: <cover.1708613381.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 14:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196032

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


