Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69413FF886C
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:00:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8389.1777363920090557000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 01:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZUsjKiF2;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so11204578f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777363918; x=1777968718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSPpAGe0QhXEcve7pLZOgeAXtZhG4hz4K0PrXKXCCsU=;
        b=ZUsjKiF2VutWCL0hznjTFID2rb/qQ6cNjN+2/hYuRf1s2WDLvgjz+cpTzhV1yT3MxW
         1oQAxOVgy9Tlwb53Jez2J9u0joTNfx+0Rq7Gaw9S5NYQSQdAtnMiCNzyNg4+mF4SY/q5
         U+Rsh+qQxKvMEvIyCHq8bzbC3FZvDo/GBOy86k5ZR/AxCU7tidhokieoH++7xH1DTaul
         f5BAbJDmcMGuM7k4jYcDgLPH2M3Iha4UsxtUF1Qc45jJZWmU7eW17wr1sTWAyauGrEWf
         nIZaX/tFfb2qRn4HROrbQ2a9RnYYiB49Bgm/OiSFZddeMCqEldSSrIZ/nUquOEPBHFHq
         wd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363918; x=1777968718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSPpAGe0QhXEcve7pLZOgeAXtZhG4hz4K0PrXKXCCsU=;
        b=mQ2fEAxv/TqAn/zMCwBBJ1zJ7TzMrpWi7sH4Nzzj7uaPAAktT2VV1nEAiknoJjKCZ0
         DM9OaMW10mNGiOSCZSH1zlDCmQFGediw/c3DeppmEOLvf2IdVSgKe1xnEcXauuFdoXrx
         f+zstLCFj7Uc/uNVmrjllbOO2/j2+NU/jocBKBmc5lErjZjla10d0v3Z1n+o2p/waZ1A
         tw8zZqVEVyCr/5JfDXDp3ticqp5vCDwFVXhFn8PJTb3KtVI58FFdTjeEpdo+ffZRm2CY
         p1kXF+5Fh2khuXWPOxv/FQ04X5wza8Ve5yvLcn65clH/ymFP/1cPEhq3InxugvChlqgU
         /eUg==
X-Gm-Message-State: AOJu0YwsP7DLkjYLP2vu3lLUePGSP6446hc87jqb2bCwEzHSKlPJ1di7
	pwwUMwCe6kx6My2fdBMXrkYFFty9tPuLxHX4eEfx25eK8zDWRkNHR5T/31qD5RP9PLc=
X-Gm-Gg: AeBDievH3vkPtDtj7H1wDVXTjx2aeau0cKJ+t/ygM+dxPR/wkMxBWoQzf2xAxJ8TRSy
	0JzXXJCIchLdl5V9W37hXLUKXLF1W0+Xmdm6ppW0yxfGuFlbYPWHDYo4c0iefccS+OdU1PaGulZ
	iOUjEcIFrnFdYP+MjALwNbN+i82WdKTnYk84KRY+J+WCpjW4qN9FIJzK1uIAiy/uCW2J+4PBhWE
	WrFWKmnweY95Vd5AOn5xaQngaD9HHUoXsbw0mbsHyyhJ/cFKrmbmDS0B7P00MSe/pU7qymJrLec
	2soOhurkNwz+8dPmyKTY4E5+590ja2tyrqhcAg/6UOgdMr4pkt6R5US4j8zJZIrUFpNyS+4QiJP
	Z7awNzWAOGeBn8B3Q/VdZLMPNUXlKMp8N0UtJtfgfXqOw4k5f5QT9eiBwcNRdEx+XdJwzkEJpFP
	y+ClEdC3EtR5f5nTqlsHKvML0s7f1vgtMprz9CooR0zrPmhKTe1UewRK76G5GGPJjWyVODiej2z
	clW8hY=
X-Received: by 2002:a5d:5f85:0:b0:43d:303f:f358 with SMTP id ffacd0b85a97d-4464761c249mr3514533f8f.2.1777363918081;
        Tue, 28 Apr 2026 01:11:58 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([79.123.125.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm4588351f8f.20.2026.04.28.01.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:11:57 -0700 (PDT)
From: "Sam Kent" <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v2 3/3] oeqa/selftest: add oe-selftest for kernel module pre-filter
Date: Tue, 28 Apr 2026 09:10:46 +0100
Message-Id: <20260428081046.1660101-4-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260428081046.1660101-1-sam.john.kent@gmail.com>
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 09:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236050

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


