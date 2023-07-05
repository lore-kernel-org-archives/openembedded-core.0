Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1499DEB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 15:30:37 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.20588.1688571029766889647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 08:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=oiCi/f03;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbac8b01b3so7907375e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1688571027; x=1691163027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bAq2zhKjn2HusNTxOuV/6eDRn7h1xQpioiwh+DvY2c8=;
        b=oiCi/f03d9aB0TvGWr+Lk4gQbo31YJhoKDdtsJzB+wvbxj1FXiI7OgCcuhTI9sOkJm
         MpVG5XfyqK1Hgprn7JUQwU4WRXai6SIcN3SP6/XxJuEcL5ZcMCL9uFjCTYND/qxeS1Xt
         Ih4R3qGp2XrvmnygBvg82m281fgbli9h5jr5Yd0Hq6FEHZnUS03Codv30v33CuML0qBs
         sRjrIwKf1HQeqDhM+ieoXRZ2omJ9wvaCv9VKFONqicPk9klGfx4Uobkiqpxca6t61kWh
         bQPdV751+RaBhRy4zrGRJlUUeS1WRZuBCgcOfee2xA0ajFWg7kXwmOmVowOcUT/92Ezp
         nPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688571027; x=1691163027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAq2zhKjn2HusNTxOuV/6eDRn7h1xQpioiwh+DvY2c8=;
        b=Qi535oc09rkOcotKCMlktb/7WeR85TunYPE0EaVOZxbT/xJ3LJoeyCpAi2ShejMjTr
         RsTcwnYVloYSs24JjE8vZdv9yUgcekxJQ6f0QkayraNIem9cN5mci60hBYi7kI7QH9h3
         ERn2EoTU/5UW5PA97J6se8xdZXHFWFEqBnYDAPM58bpAVdz6rCZ1vjTHFR3ec6m9a63j
         Rmx3pVvgDgoaWSFyTXFl/UmQI8aH7fWtZjG7Sur58SnnwQOpDGu5Zg620DDpSqHwh7k3
         JyoDUS7vz3IaRdX5h16CcXaNdi8HxBxph8ojrST/7EifN8Ve0PC3uWZgktNLYCujTwqm
         kmqQ==
X-Gm-Message-State: ABy/qLYQScmIUpqS9gWZ9tgv6I5+0b+LpPYj1T+fQcX6UO2r8+DZO6lP
	MVINrA9je5jmzwVelR9tLdRM6a2ujGtMeAWnVaY=
X-Google-Smtp-Source: APBJJlE1uGGUXkTpoIFVwtKKDefr0wvgohC8w05AeXIdVIwIophS2NHihTP0h34kylOBWrWPoKCdgg==
X-Received: by 2002:adf:eed2:0:b0:314:914:66cc with SMTP id a18-20020adfeed2000000b00314091466ccmr2516992wrp.8.1688571027277;
        Wed, 05 Jul 2023 08:30:27 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id e13-20020adffc4d000000b0031423a8f4f7sm14185309wrs.56.2023.07.05.08.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:30:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Fawzi KHABER <fawzi.khaber@smile.fr>
Subject: [PATCH v2] oeqa/selftest/devtool: add unit test for "devtool add -b"
Date: Wed,  5 Jul 2023 17:30:00 +0200
Message-Id: <20230705153000.80294-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 15:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183892

Fix [Yocto #15085]

Co-authored-by: Fawzi KHABER <fawzi.khaber@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 4c8e375d00..14a80d5ff4 100644
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
2.39.2


