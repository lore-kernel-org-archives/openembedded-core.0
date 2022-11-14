Return-Path: <nathan@nathanrossi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515DAC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 08:17:48 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.3292.1668413859768674215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 00:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=PlSdBzyX;
 spf=pass (domain: nathanrossi.com, ip: 209.85.215.179, mailfrom: nathan@nathanrossi.com)
Received: by mail-pg1-f179.google.com with SMTP id 62so1277852pgb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 00:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/V7cdNfquPszFuAEW9Mq3ArFg++fV3I2r9x3HEfZZc=;
        b=PlSdBzyX49Fu7RnKuDOpH0IGJOut+FHnz1RjwByB+X6vgqTRJnT+5ZvEzDZ2WbfY2Z
         pwYhi0Pwn9vaeGdUTI5aGlKdUtXVMZVDhNfMcQ9EchESe8LJwwiPIWBrXkRqJGjZJnus
         HKsJqmDfKlWRSecQpZBqyBp629dg5YuNizKTa5Z5xUBx4CqdO72LktzaV1NUN+FR/jdu
         asKqA13AM26lkWrQyXrDUu/el9+uUJL0gF1ju+LZj6iQr/IRqVjnQyOa/oGiJWfEw/ar
         +5yuFE4TVChuqKXp4J9c5SaAwsuW3KPG4xZxQGGCkgHCj8/zB+gNsibSXOS7RWarDMmD
         5lZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:content-transfer-encoding:subject:cc:to:from
         :references:in-reply-to:message-id:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/V7cdNfquPszFuAEW9Mq3ArFg++fV3I2r9x3HEfZZc=;
        b=oDlRe4f0EBs1ljM+OXWgPy2Xv1/tOIKtwrl/OYP/YAuQLKL/ILQIIfWH8UD85USRAa
         yk308XBUizirBKLD3I2GuMhwt3Kigj1VR64mDA9SQa/cGkl5Ahoyivjbw5EskzMOHuIE
         vpeWaSBvVGOH8wInckhqTRuRFWMMSaL0WxBv+Cv7iKsPn8ToSbWx+htn1ob4c2EFmLMG
         gUr25gBYNRCmrBhsSVqvapmfWmHuBIrQJ0rCoSYNYzVch//cjAqX7jW+AA60Fh4pfLbW
         /TKhVHbRFUkPoCH0kMUJ9hq7ebJEYMbMuEB1DR1YwcRPwxm7Jiejbspy9Rbyx0TXP0jR
         BQwQ==
X-Gm-Message-State: ANoB5pkW6uB8bJ2KqIph5g7V7JP3o387IS5li6MFQNXwzOcMr3nZLiPO
	W91QERNRVx0uJLjJstVUCCt9ECQwK/1uwg==
X-Google-Smtp-Source: AA0mqf7n5/jmHrobhUko0KUW2KbfmGQCEUpIaaIBXD6grYc/ohhRZHLWRISvi3TOjFb5fG4QDYhn4w==
X-Received: by 2002:a63:4859:0:b0:457:4863:2e85 with SMTP id x25-20020a634859000000b0045748632e85mr10850476pgk.6.1668413858747;
        Mon, 14 Nov 2022 00:17:38 -0800 (PST)
Received: from [127.0.1.1] (117-20-68-146.751444.bne.nbn.aussiebb.net. [117.20.68.146])
        by smtp.gmail.com with UTF8SMTPSA id d14-20020a170902654e00b001743ba85d39sm6731707pln.110.2022.11.14.00.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 00:17:37 -0800 (PST)
Date: Mon, 14 Nov 2022 08:17:18 +0000
Message-Id: <20221114081718.50468-2-nathan@nathanrossi.com>
In-Reply-To: <20221114081718.50468-1-nathan@nathanrossi.com>
References: <20221114081718.50468-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>,
 Nathan Rossi <nathan.rossi@digi.com>, Steve Sakoman <steve@sakoman.com>
Subject: [kirkstone][PATCH 2/4] oeqa/selftest/minidebuginfo: Create selftest
 for minidebuginfo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 08:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173229

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
---
The commit from master relies on the 'target_sys' parameter of runCmd,
this was introduced in afa3d3ba00b40fd29e9852eeaa2c2c9b68f18659
(langdale and later). That commit could be backported alongside this
commit however it adds '/bin' to the PATH by default which may cause
issues (?). As such this commit is modified to add the TARGET_SYS path
into the PATH environment passed into the runCmd call.
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 49 +++++++++++++++++++++++++++
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
---
2.38.1

