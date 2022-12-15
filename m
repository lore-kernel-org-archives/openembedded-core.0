Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF8BC46467
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:54 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.143576.1671132092006139649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VwTtMeW4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so166650pjd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar86LaAF3BpUFetRwPtcv4ZJbB4PML4ZD8H0ZnjrTm0=;
        b=VwTtMeW40jPEwb4uYFSgqw0fTOqeeRbu0RRBHc5U4XsNvAF3ucV/p2XdrDojwXkS23
         562xWEi4uRBuLnSoCK0PUqhrdCrO+8oKpo42Anikf4LYjOG/ssPVOT3OLNbfh9zey9XE
         qakYVy1wesW2MKgAg6bhOqgxl9zqMlAPHFVwyIcz/1ZOjizbnyr6Hoafz9HA9R8iB+fB
         W49a460HuPoi/unBL94IcEok7hy68nuVQRYa9RPfihwwK4ivQeuY4qDq3gWpXHXX9nBA
         hwO/v0YpxLIHlbpDNH4ce0z5nNd0WDPOV/xOVQGoCIH58MKCRgUQbvSDlYnXGuTP5fs/
         kQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ar86LaAF3BpUFetRwPtcv4ZJbB4PML4ZD8H0ZnjrTm0=;
        b=WyceqEDKIYpK/TQRaDJDtJKFLrfNs7XqHyyE7dIKQBrXM9VaNeREpF6VB2XQIweijP
         RkvtM5h5VdbiyBFwCDdx5/AxsTHoGrEBw2E5/SFTpJPqZcZO10w5T2F48CP+afc3V9cH
         9zuW7kKI59+xq8ywHspumfUUqKnPWfYALWGgIqW+Z9EjpaNJNPaVG7rMiQi4n/kbw7ij
         YKCPjswshhLB4kper55CQ+VRgqPQynt7zdYwfVH6le5hhgc/ncsqWDSqC1xFQKx1dU61
         iTmvgCrQfCEp6j+qjK1Yc+2XHfayyAs6IXNDJIaUNwURA6r9CeDZFm1BMXbr53U4Aman
         VKxQ==
X-Gm-Message-State: ANoB5plWoYnZDIw6WudUDKzO1gIfMMABspCeD+8bk1pa/jEQqjzaN6x4
	3U/vhcv3lRdqzwg4pVYlmo/U/7dPnrK5NAJmcOM=
X-Google-Smtp-Source: AA0mqf59WgrDt5dkH7qk1zL8exJrC2jB0fGxgJ0wFgVMj9eeRfHk/TDtl1MDC7Z2o+r2RgXAMDIHCw==
X-Received: by 2002:a05:6a20:8c06:b0:ad:aaac:d40b with SMTP id j6-20020a056a208c0600b000adaaacd40bmr17277066pzh.45.1671132105875;
        Thu, 15 Dec 2022 11:21:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 26/30] oeqa/selftest/externalsrc: add test for srctree_hash_files
Date: Thu, 15 Dec 2022 09:20:50 -1000
Message-Id: <213604cec02be2fa429ee42760125b8ad2a4f046.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174618

From: Peter Marko <peter.marko@siemens.com>

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7b9728e5b8bdf1193c1304ec3beeca4b5bf8d2da)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/externalsrc.py | 44 +++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/externalsrc.py

diff --git a/meta/lib/oeqa/selftest/cases/externalsrc.py b/meta/lib/oeqa/selftest/cases/externalsrc.py
new file mode 100644
index 0000000000..1d800dc82c
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/externalsrc.py
@@ -0,0 +1,44 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import shutil
+import tempfile
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import get_bb_var, runCmd
+
+class ExternalSrc(OESelftestTestCase):
+    # test that srctree_hash_files does not crash
+    # we should be actually checking do_compile[file-checksums] but oeqa currently does not support it
+    #     so we check only that a recipe with externalsrc can be parsed
+    def test_externalsrc_srctree_hash_files(self):
+        test_recipe = "git-submodule-test"
+        git_url = "git://git.yoctoproject.org/git-submodule-test"
+        externalsrc_dir = tempfile.TemporaryDirectory(prefix="externalsrc").name
+
+        self.write_config(
+            """
+INHERIT += "externalsrc"
+EXTERNALSRC:pn-%s = "%s"
+""" % (test_recipe, externalsrc_dir)
+        )
+
+        # test with git without submodules
+        runCmd('git clone %s %s' % (git_url, externalsrc_dir))
+        os.unlink(externalsrc_dir + "/.gitmodules")
+        open(".gitmodules", 'w').close()  # local file .gitmodules in cwd should not affect externalsrc parsing
+        self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, msg = "S does not equal to EXTERNALSRC")
+        os.unlink(".gitmodules")
+
+        # test with git with submodules
+        runCmd('git checkout .gitmodules', cwd=externalsrc_dir)
+        runCmd('git submodule update --init --recursive', cwd=externalsrc_dir)
+        self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, msg = "S does not equal to EXTERNALSRC")
+
+        # test without git
+        shutil.rmtree(os.path.join(externalsrc_dir, ".git"))
+        self.assertEqual(get_bb_var("S", test_recipe), externalsrc_dir, msg = "S does not equal to EXTERNALSRC")
-- 
2.25.1


