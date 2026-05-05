Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94265CD343B
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 17:05:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1318.1778000739477177489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 10:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ooqxU/0H;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44509921fbcso2847272f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 10:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778000738; x=1778605538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSPpAGe0QhXEcve7pLZOgeAXtZhG4hz4K0PrXKXCCsU=;
        b=ooqxU/0HIhzVJxqAOjYrgqKDjcS/BwbGgIGW63LxF8DgsZA3wswDTVPPAqCkXQNsz/
         CJOeCUUpQabrNheSGALx7bRhBo+8B6MmwnwHuUIzZt+g5eAECMY3OTKBC2T9LjN4vtFG
         4TmHFw6oeqaeVbpyDq7P98WjV/NyHpB6i7ukokPLOUucSVvb5rN/ZecwIWThDcFtA2Or
         aYzFZQAfNBhxEp7sgByfrxk5+y7DrNlnLAsohCe6MOchW2Q+wS0Md0sLbYzFXeFiiOMQ
         Ra6sr7Vw7Kr4h5lWh5hR/RwJ8kPyWRubQZIr1yfz7de3FQF3k6Gv30XJHt5FWqcPuB0c
         9MnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000738; x=1778605538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSPpAGe0QhXEcve7pLZOgeAXtZhG4hz4K0PrXKXCCsU=;
        b=YTP6NTCQviy1ZBJxSPqJHzDnwfDHTYsajPxRW9IZKPrqpWSoOfDGulk2kpCrQSlWBr
         IN8efAZtG0E0CTd/wMbUE9Fbhova0RpTThpFss3/QOcg1uMTcwlLZrdbTerv7YWJq9QX
         qvsYY4c0a9FaIuv+pZ4RPFAmnMS4BjwdII+jgXFeKeUn7DzW4aJVhWB3aEdjDJvth9lJ
         5MndyyLaACgU5ANw5ACLzWpygB9djbeteYcWezceHYuTFxyFWPW+PkYRiLlL7AAbOzyD
         ge6BBXTjGLRdNHjre7J2zABXUTSc3Qgj8+aS7A/jr3xO+WhY8SN4XZEEZWZdOD5ph1Tp
         72Vg==
X-Gm-Message-State: AOJu0Yx0T6zTBH1KLOm84kck+BxzrvTXBzNHUhHAydEr1a7pPm60Cpej
	7Yw5/RjnCkMwhfiQfGBVPn6bQJI8QqjzkQG5hiw//qJ8SvBnCrzjSQIy/kE+hXUT+hqk0w==
X-Gm-Gg: AeBDievzmjr8NKA/obJ5KagHlzdG4vrpcYIoxhGrpxCHDtzhz+sZb78kfT9pwMVRomm
	KA+vwapY8PjFz4jdjbS4giaaZB1QTKjVzs5anqi6LbOv/dYiOBuAYUpHBtGnOl+3VZyLKlP1gG0
	H1vgauBAZyw7K77jMfu+sHznJSzEriVeclvx6TPNgsP2koM1szT4VP8ReNoSWrPGqRJlQtU3LmX
	q5XQtMVe6DP4Oeg1lyoyQ5CWMKUC5M2Kr2xUUAyLVVZKyPlDagfmZ3DCl0c+Lk9/q8QnzUbBGzH
	Lcht2ZVCA+qbTVeWEF4s/deYT5+lgbHZs9Z5fMHimmBq8POZ1H7zjcagtuA0rQ5w9h+DnrJxB04
	/F9tuN8ooNo17EBp65YMtnjRXPXafraOpKHMMI2Gl0uJfPTduM+h15vox0TpRJVZFzZpjWcfkx2
	JYicSrwvyutMqi0/Zc3y0fifoYdu4oZMZmyedWzKUUzvEszMvVCsOJWw+7aDp5vgWK78r39kYH3
	7kK5VXH/RP4RIGzQQ==
X-Received: by 2002:a05:6000:24ca:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-44bb2f28236mr23179625f8f.4.1778000737510;
        Tue, 05 May 2026 10:05:37 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([45.12.242.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm6521172f8f.28.2026.05.05.10.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:05:36 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v4 3/3] oeqa/selftest: add oe-selftest for kernel module pre-filter
Date: Tue,  5 May 2026 18:05:21 +0100
Message-Id: <20260505170521.1129945-3-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505170521.1129945-1-sam.john.kent@gmail.com>
References: <20260429124524.2890648-1-sam.john.kent@gmail.com>
 <20260505170521.1129945-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 17:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236517

Add selftest-ko-filter recipe and a PackageTests.test_kmodule_prefilter
oe-selftest that builds it to verify process_split_and_strip_files()
handles .ko.xz/.ko.gz alongside a real .ko without corrupting them.
Regression test for YOCTO #2348.

AI-Generated: Uses Claude Sonnet 4.6

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
---
 .../selftest-ko-filter/files/module.c         |  3 ++
 .../selftest-ko-filter/selftest-ko-filter.bb  | 29 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/package.py       | 22 ++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-ko-filter/files/module.c
 create mode 100644 meta-selftest/recipes-test/selftest-ko-filter/selftest-ko-filter.bb

diff --git a/meta-selftest/recipes-test/selftest-ko-filter/files/module.c b/meta-selftest/recipes-test/selftest-ko-filter/files/module.c
new file mode 100644
index 0000000..f6d50ba
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-ko-filter/files/module.c
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: MIT */
+/* Minimal relocatable object used as a .ko stand-in for pre-filter testing. */
+int selftest_ko_filter_marker = 42;
diff --git a/meta-selftest/recipes-test/selftest-ko-filter/selftest-ko-filter.bb b/meta-selftest/recipes-test/selftest-ko-filter/selftest-ko-filter.bb
new file mode 100644
index 0000000..1b8cc73
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-ko-filter/selftest-ko-filter.bb
@@ -0,0 +1,29 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+SUMMARY = "Test fixture for the kernel-module file pre-filter in package.py"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://module.c"
+S = "${UNPACKDIR}"
+
+MODDIR = "${libdir}/selftest-ko-filter"
+
+do_compile () {
+    ${CC} ${CFLAGS} -c module.c -o module.ko
+}
+
+do_install () {
+    install -d ${D}${MODDIR}
+    install -m 0644 module.ko ${D}${MODDIR}/
+
+    # Fake compressed modules — the pre-filter must not pass these to strip.
+    # Use octal escapes: dash (the OE recipe shell) does not support \xHH in printf.
+    printf '\375\067\172\130\132\000' > ${D}${MODDIR}/module.ko.xz
+    printf '\037\213'                 > ${D}${MODDIR}/module.ko.gz
+}
+
+FILES:${PN} = "${MODDIR}/*"
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 38ed717..d33424b 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -185,6 +185,28 @@ class PackageTests(OESelftestTestCase):
                 if not gdbtest(qemu, binary):
                     self.fail('GDB %s failed' % binary)
 
+    def test_kmodule_prefilter(self):
+        # Regression test for YOCTO #2348: process_split_and_strip_files() must
+        # use f.endswith(".ko") so that compressed modules (.ko.xz, .ko.gz) are
+        # not fed to is_elf() / strip.
+        bitbake("selftest-ko-filter -c package")
+
+        pkgdest = get_bb_var('PKGDEST', 'selftest-ko-filter')
+        libdir  = get_bb_var('libdir',  'selftest-ko-filter')
+        moddir  = pkgdest + "/selftest-ko-filter" + libdir + "/selftest-ko-filter"
+
+        self.assertTrue(os.path.exists(moddir + "/module.ko"),
+                        "module.ko missing from PKGDEST")
+
+        for fname, magic in [("module.ko.xz", b"\xfd\x37\x7a\x58\x5a\x00"),
+                             ("module.ko.gz", b"\x1f\x8b")]:
+            path = moddir + "/" + fname
+            self.assertTrue(os.path.exists(path),
+                            "%s missing from PKGDEST" % fname)
+            with open(path, "rb") as f:
+                self.assertEqual(f.read(len(magic)), magic,
+                                 "%s header corrupted in PKGDEST" % fname)
+
     def test_preserve_ownership(self):
         features = 'IMAGE_INSTALL:append = " selftest-chown"\n'
         self.write_config(features)
-- 
2.34.1


