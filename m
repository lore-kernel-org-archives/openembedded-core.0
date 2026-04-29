Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A292BCCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 12:45:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10383.1777466749757661028
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 05:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HyBtemkt;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso103747095e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 05:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777466748; x=1778071548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSPpAGe0QhXEcve7pLZOgeAXtZhG4hz4K0PrXKXCCsU=;
        b=HyBtemktbuKLzkjVsGShFVA1tVxKb0CaFEkm5E4PCuZ/qEELIUY3IrkOAMmb+YpiNu
         ijQRDLSMhrsTXGReMsKRi3fbuvAjZgH2YpFkw+DYTk+cO5tDI8ysYRqqrwypG7yUixaL
         JvfNM39FRepxXgnnENsaO7tqLmevBVMMucyK5pnMVIJNpjcM6jUgVodblSPRArRedNF5
         W6W8DREuqTL8pLRNoFSzVQPOYpYGHmTKuHnlFbYkAx4xS1DbpaqHGlbOBfSkIi+x3J5v
         i0OI6+E4uyjy9RO1UF+x1mhCWuTgrV9c7Yy5RZ2t0DPA2zTRj+t4K2htgnrQavs8jiY5
         JwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777466748; x=1778071548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSPpAGe0QhXEcve7pLZOgeAXtZhG4hz4K0PrXKXCCsU=;
        b=YAZIKnuIlN/zN/kxHfI+JPAy7mbIYWpJ0CAuBbAB5owOLP4hs5R65DJ6gR7gnX1GIa
         NBgcbFWWW7bkMIPEh3y4gUTo60zjF4/POeHllGEt+RMpe6b1no1miw+7+gJzxs+JnSsY
         /wd5Qiv8FI/+KVEueccaZ3rhzZlGclVdXpo1k6XOkWsCioRcgcfiN8Hc84MwzhqWfy+O
         zNoVmKLBuJd9Xa5Ci4hJGxG9L2lYalWtvUu5mcpVs3keYIJuJKNb9YjfYf7KJ41vq4N3
         AgTDjqwP1/N1kAhEzilCVxPYwFxLu2XBmFjxnZ8JE5Dw6mRhmZZrDrhCX8ZUyMo5cVLW
         CFdw==
X-Gm-Message-State: AOJu0Yw7pI7q8pyhTZgKrxlYdt/Ls9euYBANlbzgsuX8U1ph15vsvAg2
	N5AzS7NM5dYXwUNQt2zUnYCOdQq2ejiiuF8ElH/xscKnCjh41UZFV1DVD3MWSNPvcxI=
X-Gm-Gg: AeBDiev16zrdHwQhsb3cw4mKgEykU7SW7T7Zjj8NZMRbgbQBeL9A0ecijuFaipycb1r
	CniMA3gxz1OpgDO/CLkOnWQ5dxFd6UyRDEorder//gdV2d7pMPpead0mNP1tX0E5jFGlmUEMTMq
	pfCl0rPgXTZpAfyZMHHqTAfaH8TNIIElLJHuLWk10KbaBz3+g5ZTQrYNAA2xOoNFesBNDKUrDOE
	6AWvPCzmhJFIiEns0Qe3X4PJ52JiFR563LAjBUiHd95xlpvt8NTsLqMXtwwJWZrYWwRLTfQK1Ai
	dAyYRe7LjQpuiQZQEkKTBsbZAJIZUt90iCGhDjFo8/FSroLvEr7p6ww7+/UbBnlFK3+Bh7cPcm9
	TtMcW5oR6CZQY77taj3fuwS4eAvi0OTjMY/MI4syzrot9OR3QLFTXQ3v8SFARdHPdh4G2bLK88D
	6Px5RxAY6TqFDPxJ8h+VT31ZGh0Ib9FWOte/52Yc0D4jwcZbIb4+Kh4Ymeem8sANHgtFQtWrPnv
	CuYjTqtMfw1YGZYEDiOwEuYh3FQiUrEAhk/9gZld5dPRtcsQGinR/yfysz73cWv4k4U
X-Received: by 2002:a05:600c:3b0f:b0:487:20ee:bef6 with SMTP id 5b1f17b1804b1-48a77afec2amr119988805e9.11.1777466747502;
        Wed, 29 Apr 2026 05:45:47 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud (ec2-52-18-17-49.eu-west-1.compute.amazonaws.com. [52.18.17.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc1cb91sm55291405e9.6.2026.04.29.05.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:45:47 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v3 2/2] oeqa/selftest: add oe-selftest for kernel module pre-filter
Date: Wed, 29 Apr 2026 13:45:24 +0100
Message-Id: <20260429124524.2890648-2-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429124524.2890648-1-sam.john.kent@gmail.com>
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
 <20260429124524.2890648-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 12:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236100

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


