Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2940BC77B6F
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:03:06 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.162547.1680796979381046015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KJLR2ahg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so41075862pjl.4
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796978; x=1683388978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrXOdH+8/U0fdwgCbqlR8eWdBhJ4cY1Tp0Wtyh0PNLM=;
        b=KJLR2ahggVsfoYu6VNB6QxiF/bZ5723ovacsoHNSEXYNxL7a6RnWk+iQmXriS1aWNv
         s8fO4f1L1yQeg2FMJMdFwlFwb68dOtjIvr34LZmoCASYeYQq8dtF735tCimyaDCQhQFH
         kg3uzQU7OapFu9kyevQPbqsQiEP/2x+xdSNPOoj7N7z9qH3PDxlANoujbCDyutDyygLU
         Pvc8RCx3paNF/MemvnNK9E52HtTTWu377TGDsT9IEEL7pQPBhB19KSj6BaoeiA5mNd/4
         E4FzqAuBgNKp4afSESv7OrQQ6Q7+FkNYZB5tlTotJm62XJ0UiITXLghSFxIprl+GGmmF
         LKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796978; x=1683388978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrXOdH+8/U0fdwgCbqlR8eWdBhJ4cY1Tp0Wtyh0PNLM=;
        b=wZOtfEjmNK5MHhpHZT52NfCt1j3bIwb14MlXpO0HUtEAkcckpcgsVtFvZ95XVlH+c2
         9VCG07+An6jMZVp1ihmgwCMnakK2c1jVxYCUV9yDylmeMDzC9VteJveTHxXrmntNosK0
         wpA1/K4U77uppnFx/jUyqX5+mxjsjPMzqvXj4VBrqoiZF0HmoVFBLMpl2sVP8/FT1mU/
         NODdzc88Rs4Mazj3QzuSQV+ZUjaswVxpC82r+FmkIyWakBiYsF1qCYxLIX6WYciWctde
         t4REaKD4YJfknhbgHGogfDUgVMnZSo6r3LA4QjL2Pyo2w9EkCiNH3Eo5Zh7GS+MwyuKx
         g4Zg==
X-Gm-Message-State: AAQBX9dajGP1mkuu/SRicGkALRcOuArb1WO3MM0hBG2b5sF47cnUNYM0
	3L1OhysEDQxz3/ybpwwempWsylGONHHZIy/y6Xk=
X-Google-Smtp-Source: AKy350a+5NmfcwLn227DnBzMbHkXTbVU6tWwcvzyOaFaQ7tMz9YVP3EN427LuN8dSjbAOOKJRv4W5w==
X-Received: by 2002:a05:6a20:3b18:b0:d9:3440:9a26 with SMTP id c24-20020a056a203b1800b000d934409a26mr72796pzh.20.1680796978476;
        Thu, 06 Apr 2023 09:02:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/26] selftest: runqemu: better check for ROOTFS: in the log
Date: Thu,  6 Apr 2023 06:01:48 -1000
Message-Id: <1079fade975c54b62b0187b1acd9c9475a5bbe7e.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179799

From: Martin Jansa <Martin.Jansa@gmail.com>

* it was searching for line like this:
  ROOTFS: [/OE/build/poky/build/build-st-2023-03-20-esdk-runqemu-patch1/runqemu.RunqemuTests.test_boot_machine_ext4/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64-20230320081121.rootfs.ext4]
  but with IMAGE_NAME_SUFFIX changed to something else than default ".rootfs"
  or with my pending changes the line looks like this:
  ROOTFS: [/OE/build/poky/build/build-st-2023-03-20-esdk-runqemu-patch2/runqemu.RunqemuTests.test_boot_machine_ext4/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20230320085744.ext4]
  and test was failing.

* Check for whole line starting with ROOTFS: and ending just with .ext4

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a0f622f23aff2c4eeca0606e7682931eb53287a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 72ca77b845..e72dc1036e 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -57,7 +57,8 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s ext4" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertIn('rootfs.ext4', f.read(), "Failed: %s" % cmd)
+                regexp = r'\nROOTFS: .*\.ext4]\n'
+                self.assertRegex(f.read(), regexp, "Failed to find '%s' in '%s' after running '%s'" % (regexp, qemu.qemurunnerlog, cmd))
 
     def test_boot_machine_iso(self):
         """Test runqemu machine iso"""
-- 
2.34.1


