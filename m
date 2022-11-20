Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91183C4321E
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:10 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.13197.1668953736410795498
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=v1AnQGQC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso8685764pjt.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJTcDp+ea0WJY+cTVNiOw5Rnp/XpLwHhX+SIhX9o54I=;
        b=v1AnQGQCjgqUr0/V9G0BiD/pmllCo5AEEmM+uF+E8OTTwSABI1u0dzSkzQ9psVXFny
         377TSnC17kZVmSrzh8qc4addT4r9EI6bvpVFYh3zU4aaZf54mAZ5pXfzr12DlP5xKrRl
         SLvZlbUaRfpKFQrj+L1Qab5I9zUI2zgN3uGQLAB9P1hLuF7Hv6wvwwi2D6gduxVNpkOU
         Lfk9Uwd/L3aMU/2DXmC1VQZAzAoT8aiPV+/tD5prGcP3Cqd6l429zvElHN5uJpOT2OR8
         aEC7Vv/cEKPQ4rworE2mj/TLH8tL9PHq6tvL6O7YiVaRUHHfDgzOcGNR52CKk/LxPhxd
         +Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJTcDp+ea0WJY+cTVNiOw5Rnp/XpLwHhX+SIhX9o54I=;
        b=Jm+gc4/xWTqat+RMV0UTcbw/cJSHczht4l1sw+FWfYIwYyEnF6QvahFw3729jq4A2f
         ihXmN8XChKJrZTHbk0n1ZNig0rNEruVj4/rt1h4OKCw8fknWn6ERWa77FLKy3Sma+k60
         QWUKtjPF4bu42qXI8wo5KBbBJ171vA5qbhsa6jcl3S0cb/lYZ0IgVZ+GhrESdSXEe8zs
         U8HspvjXHh4aAQXi7pbPLi/PWVqkRc++zJGL8DAnlN+CNnDOTyCX+dXss7ZkWEO5+D8a
         HKFyWHmK8StCsiYRKA3PZfii7WEQUbgRPHJyjz5BfPLCLD2dI9SCRaL5tyzyq9TvwLQf
         jlLA==
X-Gm-Message-State: ANoB5pk/C2+/JIBshQ8ZsfC/3O6Owujvx21rJePnvZmxc3MryovIqG4E
	1EVdoASFheXFYGdyaAfITHYtBWzkHoESJ9kBZuE=
X-Google-Smtp-Source: AA0mqf5/ikSNqEG4hCaeKNXBdDuLSL0iqnRGoSK3jnFZCw6iyR2VeV5J1gC7ox2a3vF1maklsM1kGg==
X-Received: by 2002:a17:902:e74d:b0:186:887b:baa2 with SMTP id p13-20020a170902e74d00b00186887bbaa2mr7854107plf.27.1668953764666;
        Sun, 20 Nov 2022 06:16:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/35] oeqa/selftest/minidebuginfo: Create selftest for minidebuginfo
Date: Sun, 20 Nov 2022 04:15:04 -1000
Message-Id: <e7b0b23fd8357456ba41fe8d222f10313536d2d3.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173615

From: Nathan Rossi <nathan.rossi@digi.com>

Add a new selftest to validate minidebuginfo support. This selftest
builds a complete target image with PACKAGE_MINIDEBUGINFO enabled. ELFs
included in the image are expected to have minidebuginfo included in the
resulting executables and shared libraries, the self test validates this
by unpacking the image and checking for the associated ".gnu_debugdata"
section on busybox and libc ELFs.

Signed-off-by: Nathan Rossi <nathan.rossi@digi.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5063a31ad05b75ec6ac12158fe759e81fcdb1585)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/minidebuginfo.py

diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
new file mode 100644
index 0000000000..414dad64a3
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
@@ -0,0 +1,49 @@
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
+        # add usr/bin/${TARGET_SYS} to PATH
+        env = os.environ.copy()
+        paths = [os.path.join(native_sysroot, "usr", "bin", target_sys)]
+        paths += env["PATH"].split(":")
+        env["PATH"] = ":".join(paths)
+
+        # confirm that executables and shared libraries contain an ELF section
+        # ".gnu_debugdata" which stores minidebuginfo.
+        with tempfile.TemporaryDirectory(prefix = "unpackfs-") as unpackedfs:
+            filename = os.path.join(deploy_dir, "core-image-minimal-{}.tar.bz2".format(self.td["MACHINE"]))
+            shutil.unpack_archive(filename, unpackedfs)
+
+            r = runCmd([readelf, "-W", "-S", os.path.join(unpackedfs, "bin", "busybox")],
+                    native_sysroot = native_sysroot, env = env)
+            self.assertIn(".gnu_debugdata", r.output)
+
+            r = runCmd([readelf, "-W", "-S", os.path.join(unpackedfs, "lib", "libc.so.6")],
+                    native_sysroot = native_sysroot, env = env)
+            self.assertIn(".gnu_debugdata", r.output)
+
-- 
2.25.1


