Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29613C77B71
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:03:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.162529.1680796961067041969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tAVEy93i;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id iw3so37907830plb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796980; x=1683388980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6TqyLke9G/XVvHTNVp2hhe1HAshStAG4Qw5AVUYnGM=;
        b=tAVEy93i4zInPeUQJEWaivFvsg3guJmBGdO8peeJ1r61ehOLeESrTUvkjKCw16EvBB
         ulSEJESwHYr27ZnB3uk8WTd8FdzVsvvk3zTgd8UeDFNJjbt9e3H//GEb50EMwsrsBVAY
         eJfVdbWvjg94v19WlH+N96D0ctRrJLsHh9WhTcbub8Z5eUpcplYSOPrzvSJniRWQgu1p
         AoLahkqvceC6hZCZJg+w9NNjAM8PZrN1Woj7svPXSyOfV8pqwsLMsLxh0wl8IoYD7Hp4
         yVA5wMwSSLJFXycQdukyOYx9muCQJNtzc3/ow7soTh4Ca00zUbOxCFyk+0cB326z8Tfv
         O+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796980; x=1683388980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6TqyLke9G/XVvHTNVp2hhe1HAshStAG4Qw5AVUYnGM=;
        b=Tttqn4Z4+HuF0KoI18JwEZAbHbjAkBS5udEODgH+fM1GM+gbREAWHeMav0KQQekGII
         d+3/ZuERlbmVXCUX0++Sd1hpe3jl54pzpnb2H3dsaqK+/hPb87830DQl2vnts8g6qR9e
         JksCD1po/5aOW8O3I9rs8G0GLYe61YQLmyT8vy1wWkxBdAA9bt6qN03BKoBeCKC6CX0M
         KbOGGVMvd7jyetToPaPgLSIgcbMzJUott4sLRN9kiP29psQQT7uK+Q0nK+zNIjct4TNd
         8fhbiopJbvrbqkWQUz0GGl+Li4Ux0O+a6nUvABCV87MEORvVOGgH7+d1SczjE8fu0bIs
         YEhg==
X-Gm-Message-State: AAQBX9cYXLqCmHmX3RixLhBo4+lmfc7t3m0EzGI5ep2dA6kXvs7x7lOa
	/Ojs+gFcktdoRV+cFGC4BeeBhJ3lr/0Mc+OpKss=
X-Google-Smtp-Source: AKy350aRrh4qPCl/OoF4jOf3ReiuMm4PYemYx4m/3PvBRhfm1PlxvlTuxbO65NjAml9L/9R14Mv5FQ==
X-Received: by 2002:a05:6a20:1207:b0:da:368e:7c73 with SMTP id v7-20020a056a20120700b000da368e7c73mr19404pzf.37.1680796980199;
        Thu, 06 Apr 2023 09:03:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/26] selftest: runqemu: use better error message when asserts fail
Date: Thu,  6 Apr 2023 06:01:49 -1000
Message-Id: <c79334f7bd52db6edf05f05616c5a3398d32a55c.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179800

From: Martin Jansa <Martin.Jansa@gmail.com>

* It was showing whole log and that the runqemu command failed, but not
  where the log file is, nor why it thinks the runqemu failed

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad4b72e6524114a3bdee10cab71f194ea143cd24)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index e72dc1036e..d3eeee3b41 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -65,7 +65,8 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s iso" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertIn('media=cdrom', f.read(), "Failed: %s" % cmd)
+                text_in = 'media=cdrom'
+                self.assertIn(text_in, f.read(), "Failed to find '%s' in '%s' after running '%s'" % (text_in, qemu.qemurunnerlog, cmd))
 
     def test_boot_recipe_image(self):
         """Test runqemu recipe-image"""
@@ -80,14 +81,16 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s wic.vmdk" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertIn('format=vmdk', f.read(), "Failed: %s" % cmd)
+                text_in = 'format=vmdk'
+                self.assertIn(text_in, f.read(), "Failed to find '%s' in '%s' after running '%s'" % (text_in, qemu.qemurunnerlog, cmd))
 
     def test_boot_recipe_image_vdi(self):
         """Test runqemu recipe-image vdi"""
         cmd = "%s %s wic.vdi" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertIn('format=vdi', f.read(), "Failed: %s" % cmd)
+                text_in = 'format=vdi'
+                self.assertIn(text_in, f.read(), "Failed to find '%s' in '%s' after running '%s'" % (text_in, qemu.qemurunnerlog, cmd))
 
     def test_boot_deploy(self):
         """Test runqemu deploy_dir_image"""
-- 
2.34.1


