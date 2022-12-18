Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A822C10F1E
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 16:13:49 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.32491.1671380022330272187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 08:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2rvGQiBl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso12086121pjb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar86LaAF3BpUFetRwPtcv4ZJbB4PML4ZD8H0ZnjrTm0=;
        b=2rvGQiBl1SV+IFS0xh/vra5wY4wdBrGyxYoIKwRX5g/GJHaNJeo+bvHw7orrl6xhWT
         tqZdOTRs8stOdyk+vv8XhwTVSCf/mzZXOFEAc3u9Z37N0ZJKzk7HX1Wdi3WXu/Hz4XQ6
         yjhxboPZm3ZnNf4Vh852qEyoiGvb5hlQzPF1t8K0wphyN9z81s/odJkEfP2gSoYgAs1h
         +++rfJ7cp81/R13eH2NH57luBeDaGeLQNg0Vhc1KjBG3YJWvy6nTWUmWGAOWgiHe+Y3w
         NelNP2uRvOOeiUfnm+vCq+96s3+UdYdFUIGiiF5Taisi4jq3Sui+WTM2PXR0U952BYBz
         EBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ar86LaAF3BpUFetRwPtcv4ZJbB4PML4ZD8H0ZnjrTm0=;
        b=hZDKzLXMjIFOU90VlUubUo8DGqd64SXoWzOIK2VxOEVGzTpx1WQ+OED3vEvQEDZirI
         kMo7jYcgpKxBqR3bR3U3NzqhOQz9G1OxAe5gLdpeATaMFFFnj0ZkpiCwU3VjIpGJ9S+q
         c4cVlZ9xiBwx476pYbRWRyFmLul7U2IPceaCPLAs0te38Dlk7AA3v6OgjHNMyMOuaadB
         NychUPkXBiMYFirE4fGSxxT+CAOWXfKW7H/YLN6rKwzfJ1RrA+h/siB2OxVWSnXO9E2x
         Xnnkdg290PkADZMX5jxtwGhkehlum/IStPlCL9tYkUX+RiY+grCbYj6Vubw80ZGtrgHz
         JztQ==
X-Gm-Message-State: ANoB5pmgTSydVEEtXKLy+VkQPUgR0re70l0s8l50m2VI4TE9jPhLOYVI
	mJWooOUiLkhtE2k/SgiUTjYnep7p42XlVymYlb0=
X-Google-Smtp-Source: AA0mqf7MxgBKUJDWcrt3xigLLNA01lXmgY8cBxUt9cbG/OwD8JALymAXAxuPAOjqWYQeWnmvwS/0cg==
X-Received: by 2002:a17:902:bc88:b0:186:748e:9383 with SMTP id bb8-20020a170902bc8800b00186748e9383mr35700218plb.46.1671380021365;
        Sun, 18 Dec 2022 08:13:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902d48700b001896522a23bsm5278763plg.39.2022.12.18.08.13.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 08:13:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/19] oeqa/selftest/externalsrc: add test for srctree_hash_files
Date: Sun, 18 Dec 2022 06:12:58 -1000
Message-Id: <c3647c6beb04426774e4d99f2442f460d6a6b42c.1671379841.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671379841.git.steve@sakoman.com>
References: <cover.1671379841.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 16:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174801

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


