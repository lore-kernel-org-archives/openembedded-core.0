Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.820.1589820590627640375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jfMpRRCU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id z1so5228668pfn.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=iKXapVgaEkatxFF2JHQ0OSIlOPEspe27mOmdkOrQwjA=;
        b=jfMpRRCUyCyJJicOZ5ThHnWeKSY7cz7Q6jk1L6Q7jzaze87nQAQ123IhSxifsAM26g
         y85dHkQ1fN618idkB7PPbtxUITEcjDz0bmC6elFA7LP+1Dmu8inFNO+LcD2lWM/70+gJ
         asK5wArh4oyuZWv+ULzDFMl58joOY98VNcdL5X8RWzz3UsBDZC8m3+C0Jh8hrlpFgqgV
         n1ULvOj+2MdMJSoqSUU7/i0MSxJkRkQlDgDKpwsWHAkBwpNpJz9joxLOTFkLldTkgFpX
         4TUMAnzIA0SBetLIJxEAfEt2+lP5EtkCuLYG0bSOWFaTwnGHXxT583+/KRN74Xe08Ew7
         tgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=iKXapVgaEkatxFF2JHQ0OSIlOPEspe27mOmdkOrQwjA=;
        b=ED3KFm/JsVvb2G5RgpmjO1xq1uF5zdCiruVufPgfuLgcNY8Pnfxywoz/fPvoDzOe4I
         8cYv3JSXqClS7xIX1Sqk7tXO6oKNFztR/KvkSCdGD7zvXL1gV+WsLfHN6dm485S/f1lH
         R8Jd6mmY1NN09qqmUOxwbD4tTobF75M6MjghCHmEXlt40SuVfavTHE1x5FyNLNCFZldJ
         LRDIodObpLXjFuftNQALq3nHNRkIemELXu7r91c6KDSGkoH+RnJqjZehWvKkgd6zqgi/
         IvaE7+RkLaS7lISPXyC089H9apd4tycGktEcVzvI3/RC+8ZpN6euawFEFCN3w9LeJi86
         hfCQ==
X-Gm-Message-State: AOAM531CAJVF5VJ4yy8IHMjpiNyQX7B6ett5ZX+YEwHaMsR78nQFEeHM
	S/uo984YpD4Ibw3ly7fdBYhGMcj1SZ3KeQ==
X-Google-Smtp-Source: ABdhPJxeC4vPzyWonAO0t+I9xYH3Pjo8dXA1qWkvSv+DZlkHFXbKFVmGhdFCrD/qS/C7YbruLZQoJw==
X-Received: by 2002:a63:ef12:: with SMTP id u18mr2196371pgh.375.1589820589671;
        Mon, 18 May 2020 09:49:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/19] selftest/imagefeatures: Enable sanity test for IMAGE_GEN_DEBUGFS
Date: Mon, 18 May 2020 06:48:37 -1000
Message-Id: <1038195fe9823c93cf20e2d256865171e0c915c4.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

Add new testcase to check IMAGE_GEN_DEBUGFS. Test makes
sure that debug filesystem is created accordingly. Test also check
for debug symbols for some packages as suggested by Ross Burton.

[YOCTO #10906]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 5c519ac3d6..2b9c4998f7 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -262,3 +262,35 @@ PNBLACKLIST[busybox] = "Don't build this"
         self.write_config(config)
 
         bitbake("--graphviz core-image-sato")
+
+    def test_image_gen_debugfs(self):
+        """
+        Summary:     Check debugfs generation
+        Expected:    1. core-image-minimal can be build with IMAGE_GEN_DEBUGFS variable set
+                     2. debug filesystem is created when variable set
+                     3. debug symbols available
+        Product:     oe-core
+        Author:      Humberto Ibarra <humberto.ibarra.lopez@intel.com>
+                     Yeoh Ee Peng <ee.peng.yeoh@intel.com>
+        """
+        import glob
+        image_name = 'core-image-minimal'
+        features = 'IMAGE_GEN_DEBUGFS = "1"\n'
+        features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"\n'
+        features += 'MACHINE = "genericx86-64"\n'
+        self.write_config(features)
+
+        bitbake(image_name)
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        dbg_tar_file = os.path.join(deploy_dir_image, "*-dbg.rootfs.tar.bz2")
+        debug_files = glob.glob(dbg_tar_file)
+        self.assertNotEqual(len(debug_files), 0, 'debug filesystem not generated at %s' % dbg_tar_file)
+        result = runCmd('cd %s; tar xvf %s' % (deploy_dir_image, dbg_tar_file))
+        self.assertEqual(result.status, 0, msg='Failed to extract %s: %s' % (dbg_tar_file, result.output))
+        result = runCmd('find %s -name %s' % (deploy_dir_image, "udevadm"))
+        self.assertTrue("udevadm" in result.output, msg='Failed to find udevadm: %s' % result.output)
+        dbg_symbols_targets = result.output.splitlines()
+        self.assertTrue(dbg_symbols_targets, msg='Failed to split udevadm: %s' % dbg_symbols_targets)
+        for t in dbg_symbols_targets:
+            result = runCmd('objdump --syms %s | grep debug' % t)
+            self.assertTrue("debug" in result.output, msg='Failed to find debug symbol: %s' % result.output)
-- 
2.17.1

