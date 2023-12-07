Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A317C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:45:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.83105.1701953145534657831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=S26qEr8G;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c05ce04a8so10746585e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 04:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701953144; x=1702557944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfYyuM4vKlJlOIXClfZabuHC7UiJN++yGUOU/+md4LU=;
        b=S26qEr8GFT+JTOqb92BY+iahZKbTBUOQVUKSNU+VV+5lu0aW79xaX+bJ1/3GtcUdRp
         AXwje24dCYATnKw0t9MvB3IiwmOOw99ezwSHRz6qVT2BaeXY9hzfZtBBic05GFE1OoDh
         raxXib1bo0clJ4QvAp6PlH7Y0eO1voTd7SnGWYIKi2z2WsFRP56JLyNeRCgPgNd/AgXr
         sBk8NO5c0/Ohc6iV/w6HAyRM63BSkfMgdyJEXexYVW16NOEuAyVcvAMUID+c0xvNKMgi
         NraqiAFkkGklbJAcc5JWDwFFCi3yZrjbldmCexg56nmcBZUQ1wo0QXw1ivxcg05O5tcx
         /HoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953144; x=1702557944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfYyuM4vKlJlOIXClfZabuHC7UiJN++yGUOU/+md4LU=;
        b=hyKYgpMVZQFJcvEF+8mUF2dD2Tlp8CD05ga9tSac3moudNhqXnmqRu2X7WKcpl0p7F
         xHhQBnid1IdZN3yR5jHjWLa2NJU66GJAHzeW3FvsecdcWy7k43wItqgU+r7GL9/wRo+C
         GiX75vJKt+0bV/1vP+EWi8kGuqrxas+OmSMGF9QjsG4dbTDGzzRjYkTNHJx3vFMcfLnd
         e6ZAcTaHZap6VI4nACO71eGPhnYAqlBXY6o83nXfouyloYMvb3DaXRQYW/LYQroEdfS5
         EW/Ti6SeOFuT2dLRnAbMabdydiOuzsJPJXVTFSH8foMQFpXDs6tGgXYHVsqOLKgfM2a+
         m4JA==
X-Gm-Message-State: AOJu0Yzo3taaAJUNpj+7+ncY+9TBmNmR/YbHhdodiRXCQChCJsR6hTX4
	NoW0G3Fije+ORgbocnkTPUMBF/xKni488DP4b4zYBw==
X-Google-Smtp-Source: AGHT+IHfPi4xa3PCujfHHlmIgIKp6MsZ2dkXe/rGyj5SW21v/c7QEN8Yla+g04wxtn3ysg0BmQFYUQ==
X-Received: by 2002:a05:600c:4ecd:b0:40b:5e22:2ee with SMTP id g13-20020a05600c4ecd00b0040b5e2202eemr722176wmq.90.1701953143830;
        Thu, 07 Dec 2023 04:45:43 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b0040b54335d57sm1901449wmb.17.2023.12.07.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:45:43 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 1/3] useradd: Fix issues with useradd dependencies
Date: Thu,  7 Dec 2023 12:45:32 +0000
Message-Id: <1560cc968f5f93a925cc3ba9436f13210dc4e4c5.1701952927.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701952927.git.pidge@baylibre.com>
References: <cover.1701952927.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191949

If recipe A requires the useradd actions of recipe B we need to
ensure that recipe B is part of the recipe A dependancy chain. In
order to do that, we introduce USERADD_DEPENDS. This makes sure
that the do_populate_sysroot_setscene of recipe B exists for
recipe A in case of a missing TMPDIR. This requires changes made in
runqueue.py by RP.

This commit along with the runqueue fixes effects:
Bug 13419 - recipes that add users to groups cannot rely on other recipes creating those groups (when population from sstate happens)
Bug 13904 - do_prepare_recipe_sysroot: postinst-useradd-* does not run in order of dependency and sometimes fails
Bug 13279 - Make sure users/groups exist for package_write_* tasks
Bug 15084 - For some reason using of same user in two recipes does not work properly

I've included the start of self-testing for useradd by adding tests for
13419 (which ends up testing 13904, 13279, 15084 by virtue of them all
      having the same root cause)

I've also added (and disabled), a test for 14961 - addtask between do_populate_sysroot and do_package breaks useradd class. A fix is still needed for this, but that fix is a better error message that stops people from doing this.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../selftest-users/creategroup1.bb            | 32 ++++++++++++++++++
 .../selftest-users/creategroup2.bb            | 33 +++++++++++++++++++
 .../selftest-users/useraddbadtask.bb          | 20 +++++++++++
 meta/classes/useradd.bbclass                  |  4 ++-
 .../lib/oeqa/selftest/cases/usergrouptests.py | 26 +++++++++++++++
 5 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup1.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup2.bb
 create mode 100644 meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/usergrouptests.py

diff --git a/meta-selftest/recipes-test/selftest-users/creategroup1.bb b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
new file mode 100644
index 00000000000..ebbbfaa83d3
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
@@ -0,0 +1,32 @@
+SUMMARY = "creategroup pt 1"
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
+
+	chown    gt1:grouptest ${TESTDIR}/file
+	chown -R gt1:grouptest ${TESTDIR}/dir
+	chown -h gt1:grouptest ${TESTDIR}/symlink
+	chown -R gt1:grouptest ${TESTDIR}/fifotest
+}
+
+FILES:${PN} = "${sysconfdir}/creategroup/*"
diff --git a/meta-selftest/recipes-test/selftest-users/creategroup2.bb b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
new file mode 100644
index 00000000000..ef697f09b4d
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
@@ -0,0 +1,33 @@
+SUMMARY = "creategroup pt 2"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+DEPENDS = "coreutils-native"
+USERADD_DEPENDS = "creategroup1"
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
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 4d3bd9a5f56..a4b8a2d6d60 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -177,9 +177,11 @@ SYSROOT_PREPROCESS_FUNCS += "${SYSROOTFUNC}"
 
 SSTATEPREINSTFUNCS:append:class-target = " useradd_sysroot_sstate"
 
+USERADD_DEPENDS ??= ""
+DEPENDS += "${USERADD_DEPENDS}"
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
 do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
-USERADDSETSCENEDEPS:class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS:class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene ${@' '.join(['%s:do_populate_sysroot_setscene' % pkg for pkg in d.getVar("USERADD_DEPENDS").split()])}"
 USERADDSETSCENEDEPS = ""
 
 # Recipe parse-time sanity checks
diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oeqa/selftest/cases/usergrouptests.py
new file mode 100644
index 00000000000..a63fce54dc9
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
@@ -0,0 +1,26 @@
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
+        bitbake(' creategroup2 creategroup1')
+        bitbake(' creategroup2 creategroup1 -c clean')
+        self.logger.info("Packaging creategroup2")
+        self.assertTrue(bitbake(' creategroup2 -c package'))
+
+    def _test_add_task_between_p_sysroot_and_package(self):
+        self.logger.info("Cleaning sstate for useraddbadtask")
+        #bitbake(' useraddbadtask -f -c cleansstate')
+        self.logger.info("Building useraddbadtask")
+        # This is expected to fail due to bug #14961
+        self.assertTrue(bitbake(' useraddbadtask -C fetch'))
+    
-- 
2.34.1


