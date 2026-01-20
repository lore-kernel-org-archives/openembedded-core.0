Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9F2D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6485.1768916303139138935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pvGA+9a2;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801bbbdb4aso27713035e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916301; x=1769521101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilMKlRQY/10UAVKjx7aQWg6+R9GK+WobpA/H+LHEURE=;
        b=pvGA+9a20MmBTejPFT/hW8rW6Pr1IeUlik/aFxGQ1yLFZc05jvqbu1AwyFa1cjm8b0
         +QxthXJiTOpevA1kAC6PO7Ryp1HHPVtrpvGGDf2oSLhirEe4luT1uTvuYQqWuxjiN75J
         Dsha3hyEdRfNYrTPkgituAuTV10AXLrqntgWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916301; x=1769521101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ilMKlRQY/10UAVKjx7aQWg6+R9GK+WobpA/H+LHEURE=;
        b=V013S2eRIIN+ewBNv6ytMDu9ct77/8iTnsGUMrsHh6CAq7poYvV4xGrX+q2GTln8N5
         4KG/YI3YWvXXmjsjHpoL8cggK1+L/roDqzF7Okcuyc4m9HETO/dF8IFUUaMrunqr8CW0
         nkmt0VnMmMv1Xbux3WgxaquFO4FmLzNXBAGGBbWiBXKx5zAw/Pm4J0PL2+WOjUyMYMXb
         PFDXIfpgiXpij2XZgcVmykD3kGoy9xtoOn1OBqQOHouP5C+89FbfmVX2IvDc86RVTQNw
         zFJC8FSJ0UwGRUCiK9XFouogqDyV+DequxvddRGv/LiWe32/d+szQXmNVGAHzuJNOL26
         f5gg==
X-Gm-Message-State: AOJu0YzdgWIhLZnYqVnkdz9y7GJYbbmFX/1YA3ADKeml23C9d70VF6eG
	buoZkCwWA97rucmlI1oPZkYimwpFiqjRu3IQUgnYekLu1WFSinnf7vUKYpVNckwwyoI3MnvwaxC
	80zJD
X-Gm-Gg: AY/fxX5UJJT59nXjVd6muqF8coHkJfB0tTohck/n1/PD3nf2plS4NxaZklBvAy+jgim
	TO8sAIHQOlqMuV78fz4DHJ8isokl6LYt5WOXEu2nD+/4+GysbNcsNg+WetjGlOqgaqi9tGMl8qm
	lFbfLcqOhrAHH9KBXox4mRZb00hDi/S3jXzKfAV++Pp80CSzKmBH6bnRW5S1YLcBDWFerN6CBit
	cp4XkY1Vb1SvNBJMttbWqZP3tTQ3AY5pN02XDRytrBqzlHvhvVofSegIjhdD7+hTYVnahgheUNF
	Qim0GJScUPPe+D1AllpHp6HkqIp5swCp34WUDkU2OVdk535y/VUPU/AhjBVDuvOQ9pXmnyfdXtl
	jpqAiM/gNbG62YKJwCfprNT5G8GNhnjU79N5v2OeuuZjtuTch04ZTh0+S8+a4qxY8PyfEj+dhWQ
	XjY7CG/DmRMfRAaoi7AJ3u2WMVp2QjHjfqKnJWlQND3gQlfg7ThVwKy9yjZNHjtA+z+dcrp9z4H
	YeuREBK4iRRg0hDhxlYNw==
X-Received: by 2002:a05:600c:8184:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-4801e530d08mr183396255e9.1.1768916301288;
        Tue, 20 Jan 2026 05:38:21 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/26] oeqa: Use 2.14 release of cpio instead of 2.13
Date: Tue, 20 Jan 2026 14:37:48 +0100
Message-ID: <20ff1a4ac744855b54952d7fad7424696500a230.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229732

From: Khem Raj <raj.khem@gmail.com>

2.13 may not be buildable with latest compilers without patching

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 406a33f896accc35a9cb6ab156f1e0f42dda67d8)
Backport: Fix [YOCTO #16137] by using the same archive as the cpio
recipe, ensuring the archive is in DL_DIR and so, avoiding reaching
unreliable upstream server.
This upgrade is safe to do because this archive is only use to test that
it compiles.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py     | 4 ++--
 meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index e29bf16ccb..90abd98c40 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -12,7 +12,7 @@ class BuildCpioTest(OERuntimeTestCase):
 
     @classmethod
     def setUpClass(cls):
-        uri = 'https://downloads.yoctoproject.org/mirror/sources/cpio-2.13.tar.gz'
+        uri = 'https://downloads.yoctoproject.org/mirror/sources/cpio-2.14.tar.gz'
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 00088d0ea0..2e9d4f5f18 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -17,10 +17,10 @@ class BuildCpioTest(OESDKTestCase):
     """
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftpmirror.gnu.org/gnu/cpio/cpio-2.13.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftpmirror.gnu.org/gnu/cpio/cpio-2.14.tar.gz")
 
             dirs = {}
-            dirs["source"] = os.path.join(testdir, "cpio-2.13")
+            dirs["source"] = os.path.join(testdir, "cpio-2.14")
             dirs["build"] = os.path.join(testdir, "build")
             dirs["install"] = os.path.join(testdir, "install")
 
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 3dc81b20a7..1432736b7e 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -40,7 +40,7 @@ class MetaIDE(OESelftestTestCase):
     def test_meta_ide_can_build_cpio_project(self):
         dl_dir = self.td.get('DL_DIR', None)
         self.project = SDKBuildProject(self.tmpdir_metaideQA + "/cpio/", self.environment_script_path,
-                        "https://ftpmirror.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
+                        "https://ftpmirror.gnu.org/gnu/cpio/cpio-2.14.tar.gz",
                         self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
         self.assertEqual(self.project.run_configure('$CONFIGURE_FLAGS --disable-maintainer-mode','sed -i -e "/char \*program_name/d" src/global.c;'), 0,

