Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.215.1616173026783243990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 09:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fY1DQqb+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id j18so9809124wra.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kt5pqjvXzYSTaDEYFB5VJIEG7HOPn0k6d1z3Sw4EtQI=;
        b=fY1DQqb+OLeFoAjHlts52dhQFc3rc4c+Y2mwJxwySGQrNQg8f3bRFkTeKgTbdghmti
         eW4knfkgxvaq7cMG896aePbqn0098VsOZ+DxJ67yhd2r8HQxkNxzNxCWJTkUY202ALQd
         PLVGO0VpZeBqnQtcd403g2tWYlY8+95YTUh7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kt5pqjvXzYSTaDEYFB5VJIEG7HOPn0k6d1z3Sw4EtQI=;
        b=O6d4Bk6bnDfQ9GesV1yQ8GLpMjDBMJfPW1GuyUjxkXkdGhadjJYfE1ezZQd/+OHU3g
         FUOwFC88tyljZ7TwDWg5SYNmyoDgubP2ONRtOX5/tD5gpd7CPo9WJAE2TywOAZmTEcHU
         z8pfU70LUWcB24Z6VDXgs+0sEfCJhbWQvBYuWRO5gHmqHerAQrwIROsfIl9EmdHzOewH
         SkOXrWs+sCZEtmyvEnK2QkQiBP0R4PV4IvQskgADMX7oE/MDdxIjSDWrGpVdfWHzuJs3
         tiaaVkyD3Vbvv5OI84ML+oh8EvrdERdIpVsmznf23oNNCjH1oE7TjRo3FJaFrz1rlitT
         VAGQ==
X-Gm-Message-State: AOAM531oYC1iOyeUMRj7L+Oxvp5CxTjj8LjoYZxKm/QZboakQXRtUJJz
	J+6hnCAIJksYG+P4ZHVf6bMyhdtxYM7vEg==
X-Google-Smtp-Source: ABdhPJyTLAyCE9fuTxfGYknLHuUFt+TZQaGMcApBeaQMYi0a1ij8XRU8EZt5bVQO2N4eXnDI/nMfwA==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr5719360wra.288.1616173024897;
        Fri, 19 Mar 2021 09:57:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id p18sm8556766wrs.68.2021.03.19.09.57.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 09:57:04 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/wic: Fix dependency issue in rawcopy test
Date: Fri, 19 Mar 2021 16:57:04 +0000
Message-Id: <20210319165704.228235-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current test code contains a subtle race. It is building an ext4,
then trying to reuse that image in a wic build for the same recipe.
Whilst this happened to work, the code is within its rights to clean
up the output before the wic code runs.

Avoid this by using separate image targets instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 2bf5cb9a861..fa81584a8cc 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -979,14 +979,18 @@ class Wic2(WicTestCase):
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
-        # build ext4 and wic images
-        for fstype in ("ext4", "wic"):
-            config = 'IMAGE_FSTYPES = "%s"\nWKS_FILE = "test_rawcopy_plugin.wks.in"\n' % fstype
-            self.append_config(config)
-            self.assertEqual(0, bitbake('core-image-minimal').status)
-            self.remove_config(config)
+        # build ext4 and then use it for a wic image
+        config = 'IMAGE_FSTYPES = "ext4"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
 
-        with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_rawcopy_plugin.wks.in"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal-mtdutils').status)
+        self.remove_config(config)
+
+        with runqemu('core-image-minimal-mtdutils', ssh=False, image_fstype='wic') as qemu:
             cmd = "grep sda. /proc/partitions  |wc -l"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-- 
2.30.2

