Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AEDCD3439
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 18:29:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.726.1778005743877515364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 11:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ldwosoL4;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43fe62837baso3089373f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 11:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005742; x=1778610542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSPpAGe0QhXEcve7pLZOgeAXtZhG4hz4K0PrXKXCCsU=;
        b=ldwosoL43r0Hw5sXO05lfUx7GzgaChOijtNg9UhksBcl+/GOKVWjgx0TcgcjKAJMXe
         AxJAq+/+myORpyghatIzMOwFhRCui8Z/yxJtbtRU6vLiJEvjp1fwOEPhtt3CS5/4HTVo
         aQhQnRRIXbQYKd0FssCZMCOPP4h8rH5+nT9Ozl1wpaOc7x7AkGuX9NzkRmBNPlyBb3sw
         9rdyBrtqliDQQplOOtFEObJscTD35DuY543BYAbdjKoW78jhuSmOwyop2TBSUButwLDh
         GiUhNG9kO3E7ahevGVkSf1LuHC08mCOFV9G8BpD3zG8IbyCHDoEGmCkO+SPrtwjuSlwP
         jPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005742; x=1778610542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSPpAGe0QhXEcve7pLZOgeAXtZhG4hz4K0PrXKXCCsU=;
        b=e10+DXIVUPNIq0J7moblsuAQok6GQzFa1KNo2hX3S71RFJTxTshBQ0pEib6vP0Fziy
         HDTuHDr4IYJ9jHjI1nFiV++CN+6Hu0Ze7I5PTAOB7Z0pl1ZrhNozoh3K4KdnfszjUgY6
         8Daa41arBJvVLDp+vltlc6pZMeQSFMyZz6fgDF/MHeGRPsE9QSX5taUF5JR0lFhmbU47
         4aSJpXqXXEUq03YBcD3kvV7Iis/ihBTK4uO7zRCu3o3YD8osRL17TxRvuUXaEWRmMkFn
         1z5Jh+S8o/D/FY9aYl0UKrZJHjEvkqoUH93Er7WVKPMWOyh9a4CCKsXEvAqM4xUcVJmR
         5BTA==
X-Gm-Message-State: AOJu0Yz+DIq1/bTL3Gsv3BmxpI5bk5rwyw77Ra+lUWJoRwFr0fWRAnr+
	24P+pWXazEbgxGNkpH9zOwC+rHxMTZ/qxDDmR5dsH3NmKtU4x1ewVPTCmPbfyjmmge7D/w==
X-Gm-Gg: AeBDievFW+2StodHNaXtfxnNWEQ52LltoFN16IFjziNwgMPDmKDWR8vL9N5wC6Ig+w8
	htK7I9bCsfMtVZNtZuGYsY4fo3R+Kuc7PIteMzl6ZvWFPLkk3CljK6VEZCWf45Vcc47W+pX1m8p
	3c41NbIzbuf63AGbsunJ2ZxNIdki+iNoXp3ZG2ip1sZk/NxfhEArwwH7Cg27juKT6Nost3Z6Hpy
	ThLle4uzf8vi3koQ3qaS8DCENHRmxtS0aV6wQRTPg6PgvTgWpNJSxd6OZw1ztKFwHtLwQuyrKRu
	d/MWqyxnb4VkdhlD8u3W9cGUqFSFnFdQ/PMCJK3kTPVldvT/HPle7iKy4xUXKvOkKPaw602xvwU
	RVQdG3EMguJyshHB+9iUfuNBaDSq5Y/jDUU8wXce2Icx7nDuR8TZAa4h/IMMwxEe1tbKQ88jeis
	nLisbB1bKcSTFfAWYAn3AMsPSrtosXf5EHAG65qYhM2U+smxJzQjOq1c+DYxuEQ2iQudS373GLL
	usoerA=
X-Received: by 2002:a05:6000:2995:20b0:43d:762e:76c6 with SMTP id ffacd0b85a97d-4515b05738bmr357438f8f.7.1778005741901;
        Tue, 05 May 2026 11:29:01 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([45.12.242.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03d4csm6818780f8f.22.2026.05.05.11.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:29:01 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v5 3/3] oeqa/selftest: add oe-selftest for kernel module pre-filter
Date: Tue,  5 May 2026 19:28:44 +0100
Message-Id: <20260505182844.1136632-3-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505182844.1136632-1-sam.john.kent@gmail.com>
References: <20260505170521.1129945-1-sam.john.kent@gmail.com>
 <20260505182844.1136632-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 18:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236526

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


