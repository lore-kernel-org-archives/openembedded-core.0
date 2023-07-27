Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26397C001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:42 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.16734.1690487079058049323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KWNyqQmA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-26830595676so955557a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487078; x=1691091878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDh57VxGPmSqGCt/RKNB7L/R49gwc9EvYauLzV/c8MU=;
        b=KWNyqQmAW0PYQAxDdCZchpQHP+v1ZD9SkHTO2swyM3V82KkzeZVwluT5jicjGnT6R1
         c6dCaTLezepQ57Jfp2r9Sjo/zWN/0ZgrOfD69Fr+TziHYYy/it4OhX7N8y9ugoLgd8WT
         uahWtrhaQLJTyszwFQcuUALyZolYdioWdi18vORwxFy7t/PEICyArJzSlEdfhDH2rbkb
         ru1m9cpyKm7tvni9lPCImaqLHy7ltLBQq66YftuJ6nfDEJ6F5M7HsyWASH203GhmpOEn
         0+JYnkwqfwXz8W+hTUJSTxkLStdGq2/WXFqOqhCGUvmgHwImECN8gPb3CuNhpzz8vPd2
         l7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487078; x=1691091878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDh57VxGPmSqGCt/RKNB7L/R49gwc9EvYauLzV/c8MU=;
        b=lrVqHpXhP56sVTnr4O5T6jDaijb/YXMQLXYeVGbHEO+EXvv1ffQ7YyHCrl69a27Fds
         rHL97njKyEnhPs9n0MUPOiIuZy3BggDYp0Ub5zOh2Gy9y1xwIYqxHCCSpt047jDiElPQ
         2+HoWC38Du/jlO99aMFfR15jTJwhT62PF79fSFT7VhhGMeUS9Cn+GbxkX8K1aefNIGGl
         huzZ4VNrEKSlprEKVjhw9xpJDrJ+AacT2xTpy1dLYs1AHJgga3CW2Ja0aoyHzG5dbgS4
         bDyDbHFrnhXDD1Fz+JfLK5TZM+NHRJ2p1B8FrhnzP+LzSkKdzY94K2LLcVruJonNevlf
         6MNw==
X-Gm-Message-State: ABy/qLZbLbD+rWCpTfQ3kSbfsbWsBOng6LaI3AAaLa2SA1UeTT84ffGH
	E05BrMslqSHiazD++sEMTxlIafpiTqosXJ41Kss=
X-Google-Smtp-Source: APBJJlGpBP9YF7k5cT1TgiLZeSUS0PVTTwJEKh0UtwheD4Y/2itReZ9p7BRBW/TPIdQ8lHq6Cqy+yQ==
X-Received: by 2002:a17:90a:bc94:b0:267:f66a:f25f with SMTP id x20-20020a17090abc9400b00267f66af25fmr284141pjr.11.1690487078186;
        Thu, 27 Jul 2023 12:44:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/27] oeqa/selftest/devtool: add unit test for "devtool add -b"
Date: Thu, 27 Jul 2023 09:43:42 -1000
Message-Id: <2dca7cba28a08d63e0ca88bb9897e01661e177ef.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184999

From: Yoann Congal <yoann.congal@smile.fr>

Fix [Yocto #15085]

Co-authored-by: Fawzi KHABER <fawzi.khaber@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d5eedf8ca689ccb433c2f5d0b324378f966dd627)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index f51de8efe0..7ea56d3133 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -366,6 +366,38 @@ class DevtoolAddTests(DevtoolBase):
             bindir = bindir[1:]
         self.assertTrue(os.path.isfile(os.path.join(installdir, bindir, 'pv')), 'pv binary not found in D')
 
+    def test_devtool_add_binary(self):
+        # Create a binary package containing a known test file
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        pn = 'tst-bin'
+        pv = '1.0'
+        test_file_dir     = "var/lib/%s/" % pn
+        test_file_name    = "test_file"
+        test_file_content = "TEST CONTENT"
+        test_file_package_root = os.path.join(tempdir, pn)
+        test_file_dir_full = os.path.join(test_file_package_root, test_file_dir)
+        bb.utils.mkdirhier(test_file_dir_full)
+        with open(os.path.join(test_file_dir_full, test_file_name), "w") as f:
+           f.write(test_file_content)
+        bin_package_path = os.path.join(tempdir, "%s.tar.gz" % pn)
+        runCmd("tar czf %s -C %s ." % (bin_package_path, test_file_package_root))
+
+        # Test devtool add -b on the binary package
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c cleansstate %s' % pn)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool add  -b %s %s' % (pn, bin_package_path))
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
+
+        # Build the resulting recipe
+        result = runCmd('devtool build %s' % pn)
+        installdir = get_bb_var('D', pn)
+        self.assertTrue(installdir, 'Could not query installdir variable')
+
+        # Check that a known file from the binary package has indeed been installed
+        self.assertTrue(os.path.isfile(os.path.join(installdir, test_file_dir, test_file_name)), '%s not found in D' % test_file_name)
+
     def test_devtool_add_git_local(self):
         # We need dbus built so that DEPENDS recognition works
         bitbake('dbus')
-- 
2.34.1


