Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B46C761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 23:27:44 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.42225.1680218855276671192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 16:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=j0b7UY27;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id eh3so82910295edb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 16:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680218854; x=1682810854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZtOUbsp0oj9e0spNoak4rTegFzhbdMynV9r/hT8q/0=;
        b=j0b7UY27PhhgO4d5TuU2rNCTx9vKqfaSKwDia6AckeLDeUlZjvt8LmBTKHSnP8jBaq
         fP/wyKURqBKK2BLZdM6Vfr6pQl4g1rJL0Qrt/WiLTztmeY3R0evligAY+QntZvb1VNmb
         jVYbcMWLMTTLpVE5d5lyM3di05erq7kynt8RD3AygDStM0Jh9uE//l9NGz8XRgtEAHq/
         Adh3eeBLbgkdxa+hqg28Ir0Kj97Rw3eqRFXKki28q2sA5iI7aLjDinDwIx0PJ6pvJHvl
         mDp1GLR2wpCX+nebUe0YcsX90YFhAEswxRUOOcYUxeRYatsVHB0CI5W8XnF6kseMM62K
         WXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218854; x=1682810854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZtOUbsp0oj9e0spNoak4rTegFzhbdMynV9r/hT8q/0=;
        b=ratU4P2amQdDJ4A8z2N9cGB/qIIXc0fmbV7hFY1p9LgIpipXWydxRtuUElIzij/8QQ
         eLGvZtFsolKP5FHjA53mm2lgc1cGEmDAQoNHxRFMMee6ggMzYFELnvU8xnWiDcrBa1/O
         Ibqx58YufzIygF+iuw9jCgjRgFXNXGHcyjNrJK2GnT5CTZfpJjDBYEZh2qMgDY8kQbpY
         9YxJCuYH4O91T6wmydnXFF41tgz52KSLy68/jiboNuN/H7DhoGrMA6qIyUER/amMQuyh
         hVJ+SW6UptpF96Ml0GAjRHLecFf7i28Wp4QfIvrBMGsQbpZHLWlpv6aOEhXR1YIYaf90
         N+zA==
X-Gm-Message-State: AAQBX9e7TzTVOp1CT+zu5k/uF2UTuedy/cW990lBRV44m1aNhRMq4FZM
	br5WckupUZEgRsLExGwFwx/7Qw5e9mU=
X-Google-Smtp-Source: AKy350a5ljVYsytiVdCO+n8TedwE5bTnSh37lrsjQr9sKGTII3paUOitdkt0EGe+AOUwzF4gbg8Fzg==
X-Received: by 2002:a17:906:94cd:b0:931:f9f8:bf9e with SMTP id d13-20020a17090694cd00b00931f9f8bf9emr24044148ejy.74.1680218853601;
        Thu, 30 Mar 2023 16:27:33 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w14-20020a170906384e00b00932fa67b48fsm309765ejc.183.2023.03.30.16.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:27:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] selftest: runqemu: use better error message when asserts fail
Date: Fri, 31 Mar 2023 01:27:23 +0200
Message-Id: <20230330232724.2868639-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330232724.2868639-1-Martin.Jansa@gmail.com>
References: <20230330232724.2868639-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 23:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179379

* It was showing whole log and that the runqemu command failed, but not
  where the log file is, nor why it thinks the runqemu failed

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 4c6eca5970..e6efd752ef 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -70,7 +70,8 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s iso" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertIn('media=cdrom', f.read(), "Failed: %s" % cmd)
+                text_in = 'media=cdrom'
+                self.assertIn(text_in, f.read(), "Failed to find '%s' in '%s' after running '%s'" % (text_in, qemu.qemurunnerlog, cmd))
 
     def test_boot_recipe_image(self):
         """Test runqemu recipe-image"""
@@ -86,7 +87,8 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s wic.vmdk" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertIn('format=vmdk', f.read(), "Failed: %s" % cmd)
+                text_in = 'format=vmdk'
+                self.assertIn(text_in, f.read(), "Failed to find '%s' in '%s' after running '%s'" % (text_in, qemu.qemurunnerlog, cmd))
 
     @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
     def test_boot_recipe_image_vdi(self):
@@ -94,7 +96,8 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s wic.vdi" % (self.cmd_common, self.recipe)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertIn('format=vdi', f.read(), "Failed: %s" % cmd)
+                text_in = 'format=vdi'
+                self.assertIn(text_in, f.read(), "Failed to find '%s' in '%s' after running '%s'" % (text_in, qemu.qemurunnerlog, cmd))
 
     def test_boot_deploy(self):
         """Test runqemu deploy_dir_image"""
-- 
2.40.0


