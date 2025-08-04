Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72311C87FD1
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 13:46:35 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.18166.1754315190333551530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 06:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nu2WzpVg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b780bdda21so2953420f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1754315188; x=1754919988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeEQNP/L5SDW69RIAvDLnTwqI+ORCRco+aBaADHFzcE=;
        b=Nu2WzpVgl2OhXAWGG7Jy4OcNtPsSlxWKPkBTRuVM3+vRPfFOMl6DAHt5rpvFae9xXt
         68jHUj3C+7pL0qmZwshdJLt4KeShDH/Z2P/e2RJctzZP4adRVkrLibRod3m887HNTavv
         Y4hFH7MIlbVjdBSoBmBYFwVHwlDjs0psIvfCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754315188; x=1754919988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeEQNP/L5SDW69RIAvDLnTwqI+ORCRco+aBaADHFzcE=;
        b=Pu44VLik308ckFwTwY6+st2yadC1A2owEZ1Sqt6FFtZpRN2HEb7h9TWrCtW9CYJelS
         BXs5EAKiSAA85rHl0qcNwyV5+pauHa2n2tHZuIhwmZsuH73JHWPkl31ZBDqEC/qs1utN
         jp35A0TibamsMZVuEqWXPvyJ7VV0IinktXIapfYzpa6J9VlpVZGoEHMNZIxNLW2s0muF
         caOFcjr9W0eo3oBeSDoTGchg1r6/KZWEGT6qzA2Qi4O/a3ghEjWfBBiEesHKiPpWfVQ5
         2qr9BAFEnZM2PmByBhy/6j8FS+SN/T+OW7fJB/d8Gr+/g6/PolC8vVWFFFtOe0Nl+NE+
         dqYg==
X-Gm-Message-State: AOJu0YycqmhZ47EcrXCNiL+NxDj4Klt4wAYRveh9bcayU4Lno1jhxWZn
	1mww1qdMCnCICh7yjRcO1MaClL3t56bUosia3WKUSzntVtvwpR9yVQTllO0//tES9FRtC8vdhAq
	0zENY
X-Gm-Gg: ASbGncsRgeWCEMlKruh2Gxa863IIn5mbQyBeMjVWaxcqtCt+fmnF9kIJz/Pw4FJpUr9
	G9QS0JoIZk6dSNdEIKYyJ7hBFUIgI6Ns6LZLliW4reA4vxi52hxypkujzAT1+kSDZUxShrvr471
	+kzGI4Ji3QNb8lhJqHh2GSeu8haKZhc7KdVwNfyjNrfa0V+9K7WovcEsc9rQPltlP6yTVpaZpxt
	T0peC+KygTx2XWXTTJw8yT8S53Tqq27jQDzYTFBPoLUrQ0pC3oU7YeqPUsCVCNmup93zTWalBj6
	ewxpSuB5VpTwhoZsp0GHXUlMO8e4bCk04KtbP2SvAb6TEa/aIj3Kq7YnZ+AB0/Fq5d5TGnrABzp
	KBeepbcQjopUcXIQplbnWuq7IOiwRYu3tqFjuYrakdbgRGAg8Dcx5vWVzzvYHdw==
X-Google-Smtp-Source: AGHT+IHgENLWMAiUtM+KTwcwtgLrWUlTPpYxKHGp1nxwqgl2ho9nxHb1aekxMc+PNUeAEXamybvH4w==
X-Received: by 2002:a05:6000:2383:b0:3b7:810f:6caf with SMTP id ffacd0b85a97d-3b8d94bc74bmr6949123f8f.32.1754315188235;
        Mon, 04 Aug 2025 06:46:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2c76:58bb:66fc:3164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b4f9e952sm104869005e9.9.2025.08.04.06.46.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 06:46:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] oeqa/selftest/runqemu: Use snapshot mode for image testing
Date: Mon,  4 Aug 2025 14:46:23 +0100
Message-ID: <20250804134624.1412716-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250804134624.1412716-1-richard.purdie@linuxfoundation.org>
References: <20250804134624.1412716-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 13:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221430

We don't need to preserve changes to these images so use snapshot mode
so we don't save writes to them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index bedcf975487..74d47a6db1b 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -33,7 +33,7 @@ class RunqemuTests(OESelftestTestCase):
         if self.machine == "qemux86-64":
             self.fstypes += " wic.vmdk wic.qcow2 wic.vdi wic.zst"
 
-        self.cmd_common = "runqemu nographic"
+        self.cmd_common = "runqemu nographic snapshot"
         kvm = oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.td["TARGET_ARCH"])
         if kvm:
             self.cmd_common += " kvm"
@@ -192,7 +192,7 @@ class QemuTest(OESelftestTestCase):
         cls.machine = get_bb_var('MACHINE')
         cls.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
         cls.image_link_name = get_bb_var('IMAGE_LINK_NAME', cls.recipe)
-        cls.cmd_common = "runqemu nographic"
+        cls.cmd_common = "runqemu nographic snapshot"
         cls.qemuboot_conf = "%s.qemuboot.conf" % (cls.image_link_name)
         cls.qemuboot_conf = os.path.join(cls.deploy_dir_image, cls.qemuboot_conf)
         bitbake(cls.recipe)
@@ -218,7 +218,7 @@ class QemuTest(OESelftestTestCase):
 
     def test_qemu_can_shutdown(self):
         self.assertExists(self.qemuboot_conf)
-        cmd = "%s %s" % (self.cmd_common, self.qemuboot_conf)
+        cmd = "%s snapshot %s" % (self.cmd_common, self.qemuboot_conf)
         shutdown_timeout = 120
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             qemu_shutdown_succeeded = self._start_qemu_shutdown_check_if_shutdown_succeeded(qemu, shutdown_timeout)

