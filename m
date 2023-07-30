Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBD9C41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:51 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.77652.1690740109903969206
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=EH62H3cg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686f94328a4so2015971b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740109; x=1691344909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LMJaFyZ4hz7eK4xBCvZpxP1+YiExGHOPZxs+dXzDuk=;
        b=EH62H3cgA3o8w4BL1jUAopxcnGGPBu9PQRer36rtamgWh5VkwJUMyhxjhDj/X19MU+
         fNC9dccwgJ1s0bOesmSByCsjEtgDaD0/RE0zGhHO/CZSNUUFLlNiVNKlpZUMlPP6Rg58
         YuGy5M7UlEnqPnCYfxzLdkmXCTn2uiNxy8X5aRbFl94BVBt70xs+qbqQ3gZuXYXnflxH
         GzjIVrM37+wVR8ps2IHhqTy5RIuKhbF1CqUYa+9MNbm//6tEL/95y6URDwzbddrv6ZAW
         O1HJYqtD+30WRsp19xqkawx72v51xniIQ1iqIat0yObvXBTR0DQulPMBEZQLik1m7zXY
         V6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740109; x=1691344909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LMJaFyZ4hz7eK4xBCvZpxP1+YiExGHOPZxs+dXzDuk=;
        b=Rovezd/z9AjNKx5mSuUMEtLGv/WFOgEqWoN4NW501ZyrnGhibcOq4oMQWS1Zw/jm1s
         p12y45Sfan59PPawC0AsUGwSpst7xHwsOlEX14rhngU+NgKxfz7arAI3E3JfG3vK+z2B
         +L8wJ15ySdw7SiLj7071Ewjf/eKeyACl1dmj64AyRkeZJul2/drGfgx6o6gxfIy++MWp
         Cm32mhiom62jdl9GBFj0KSGn1gq8/YqiPkugpuRKI46//0Jj6dktxAJB/FDUziZZ0ofY
         GlpRJqSBdR5S4q3sexmCot8m/HStpWh7kbVzjPO8rj52L6myVbBapxUl6+LypwRn+R9H
         yUnQ==
X-Gm-Message-State: ABy/qLa5P0/E3kVGCT22z/ANYR6VrmlNUHKbWw6pL24RQogMRw2w7x+2
	2qLLAj/T794XZRuiijfMBIMDEG97VJy/sKsiidsg1w==
X-Google-Smtp-Source: APBJJlEEV/Dv2XaUUUTXOazpwgFECfoj4dIHPcb/dzXaEy1k32vxTSwrn1fULjSEBkYaSW4imbXEFA==
X-Received: by 2002:a05:6a00:17a8:b0:64d:42b9:6895 with SMTP id s40-20020a056a0017a800b0064d42b96895mr10687811pfg.5.1690740109007;
        Sun, 30 Jul 2023 11:01:49 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/30] oeqa/selftest/devtool: add unit test for "devtool add -b"
Date: Sun, 30 Jul 2023 08:00:50 -1000
Message-Id: <ff2110458b52949ac80bdad0514d0546742c5a5b.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185105

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
index 64179d4004..aea2ad6561 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -348,6 +348,38 @@ class DevtoolAddTests(DevtoolBase):
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


