Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8FCC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 07:56:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.16820.1667462177959287032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 00:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=JPiMOeP+;
 spf=pass (domain: nathanrossi.com, ip: 209.85.216.51, mailfrom: nathan@nathanrossi.com)
Received: by mail-pj1-f51.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso1104619pjc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 00:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XvRg4DCEbacSr99FrAHr/qvloPm/7yL2+spmbXiP7x8=;
        b=JPiMOeP+shmg5cE2sXvOAIoS6Wiwl4CaVj1YE9uzzClckrrkVngiV3FmXgkdARETxI
         Pn6IYjO48QQT92u1BPRX2xKiHlcdPAil87yi/cwLpcRAkz5pzmykwNL7LnYPueG/wIbG
         Fd77LD+p08ZtLyqZErvxDz0qaHkVItC2PTSktaRQHB6z+znHaAX/SHiY9kBmaNSliew9
         0uqEA5Wjh99lF0oo+B1FgbfmNAh3v5o0/0BEvhsLRuW1YmJhyK/2Ehn51xVeCarWzg4e
         f5EymYX8zjrii4S375hjT1ctJLjog/RAX58XOwkyS4HNowvbfQ4rv4LGWEZ7NjXdGQZ1
         9ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvRg4DCEbacSr99FrAHr/qvloPm/7yL2+spmbXiP7x8=;
        b=vBtIflUoSPO5cAESVGNRr78lCBWc9eTh1UwnfzyrmY9i4e0RBBHHPJP3QIiyNJvsTA
         tZIhR8f6npzOx1lLjp8r0JjbPMwPZGTfHw5SlHV63J/D5tHVJoTQmkuTbVplUNmqtumd
         QCuSzbDNBxvjKo2iOuDQWg4bcLcHKPo/0nDyhQlZE6zCvK8C+aimL7rPS4Tsw5muE1Pp
         bRWvjSOp8pCZJLlAL/+6QJ/CXBSk9gm8RO2wSNhhlswBsnbjxsrt29M2EsPqWNa5On7j
         HwBZO9YxkAXkCsBVQiAXGMpk6wEbVR2Ik5/0OVFKXCbFY/H/sVVZDyBof4BZLmCJl61S
         bVEg==
X-Gm-Message-State: ACrzQf1bFJTOzlyq9zH6bLLc+8sF06Fzmq1m1mvgId3LUTz3U4YTh3xu
	CGh5hQBby4DNrkfIhz/+ZwEN3w==
X-Google-Smtp-Source: AMsMyM5Lj1KWpBIkyyKtMw1NTKEpwdHiebSDVLSw4ay1OYOoDN64+4iLHx4sjp2UhyKko8qB3xTb4A==
X-Received: by 2002:a17:902:7c91:b0:17f:6711:1fac with SMTP id y17-20020a1709027c9100b0017f67111facmr28923754pll.118.1667462177260;
        Thu, 03 Nov 2022 00:56:17 -0700 (PDT)
Received: from [127.0.1.1] (117-20-68-146.751444.bne.nbn.aussiebb.net. [117.20.68.146])
        by smtp.gmail.com with UTF8SMTPSA id j4-20020a170903028400b001868981a18esm9647474plr.6.2022.11.03.00.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 00:56:16 -0700 (PDT)
Date: Thu, 03 Nov 2022 07:56:06 +0000
Message-Id: <20221103075606.208982-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: 
 Nathan Rossi <nathan@nathanrossi.com>, Nathan Rossi <nathan.rossi@digi.com>
Subject: 
 [PATCH 1/3] oeqa/selftest/minidebuginfo: Create selftest for minidebuginfo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 07:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172615

From: Nathan Rossi <nathan.rossi@digi.com>

Add a new selftest to validate minidebuginfo support. This selftest
builds a complete target image with PACKAGE_MINIDEBUGINFO enabled. ELFs
included in the image are expected to have minidebuginfo included in the
resulting executables and shared libraries, the self test validates this
by unpacking the image and checking for the associated ".gnu_debugdata"
section on busybox and libc ELFs.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/minidebuginfo.py

diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
new file mode 100644
index 0000000000..7947c3803c
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
@@ -0,0 +1,43 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+import os
+import subprocess
+import tempfile
+import shutil
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runCmd
+
+
+class Minidebuginfo(OESelftestTestCase):
+    def test_minidebuginfo(self):
+        target_sys = get_bb_var("TARGET_SYS")
+        binutils = "binutils-cross-{}".format(get_bb_var("TARGET_ARCH"))
+
+        self.write_config("""
+PACKAGE_MINIDEBUGINFO = "1"
+IMAGE_FSTYPES = "tar.bz2"
+""")
+        bitbake("core-image-minimal {}:do_addto_recipe_sysroot".format(binutils))
+
+        deploy_dir = get_bb_var("DEPLOY_DIR_IMAGE")
+        native_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", binutils)
+        readelf = get_bb_var("READELF", "core-image-minimal")
+
+        # confirm that executables and shared libraries contain an ELF section
+        # ".gnu_debugdata" which stores minidebuginfo.
+        with tempfile.TemporaryDirectory(prefix = "unpackfs-") as unpackedfs:
+            filename = os.path.join(deploy_dir, "core-image-minimal-{}.tar.bz2".format(self.td["MACHINE"]))
+            shutil.unpack_archive(filename, unpackedfs)
+
+            r = runCmd([readelf, "-W", "-S", os.path.join(unpackedfs, "bin", "busybox")],
+                    native_sysroot = native_sysroot, target_sys = target_sys)
+            self.assertIn(".gnu_debugdata", r.output)
+
+            r = runCmd([readelf, "-W", "-S", os.path.join(unpackedfs, "lib", "libc.so.6")],
+                    native_sysroot = native_sysroot, target_sys = target_sys)
+            self.assertIn(".gnu_debugdata", r.output)
+
---
2.37.2

