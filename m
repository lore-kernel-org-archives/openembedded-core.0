Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AFDC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 23:27:44 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.42224.1680218854556300898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 16:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=e+aGKCGF;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id eh3so82910139edb.11
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 16:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680218853; x=1682810853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P8U1qWkGz2arjMJi1RWjgHZ1C+AKtlRlHsZIFGcihek=;
        b=e+aGKCGFjHIutUUVSNbskUCZR3yVO38La1+dH+grkEQJ4esB49zjDUpRVFKO8V925R
         JPTVy8J5PEOaoPVOs3DOdjstv1BHAVejKcvKLojnjU8zAK6KDqZYfeuyPXgbOtlw8Yrm
         bpVQhSar3mIIPS7gxbfS8eWrsV9bdxZ+KZhK+RGCtZbkSLSqPPro52QnXTwmS7gCPyul
         jJkpaNdGxHxYDMKv7vZJ44mWOy9A81MrpvijLwvnVhm96mSb+CHxQDEEvzWLjjbEOlAQ
         fJdZDOTWsX8yOHAidLXx1BcUpOl0rKzjZfKJXAo8mJ5KoJS47tyC19rDVPkFLLzQQVTE
         w9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218853; x=1682810853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8U1qWkGz2arjMJi1RWjgHZ1C+AKtlRlHsZIFGcihek=;
        b=XjwCrYF4yRkPLDBnibRv+nFCcv5JLOYvOouKXwOJxhOMVqDelaFJt/ZNVMkVmWs6C1
         +cyz3VvDxKQGO1pHXXSl+7SYrQqQntGH937VJpTI3n7EaAfltrdO2XrNxQTh4tg6cX1b
         k6QvQeo7pmkc/INUnZDd98YvSnNon4UjIKMXmziO4HTOf62zKe/NV8AVa6wt0WMZFhFj
         tH70BlFMcoMlEacP67qKEFKYC7BI2y1rohMYsEfi+MBHncc4tA1mxFpPA9Da0dfTwFAx
         gFTZa21E9KyzBw2QGZwf3fDOihq3s8AYn0cNFtFxcPl1fTnwYdBwiCcF1wiOjOml/oTj
         3NIA==
X-Gm-Message-State: AAQBX9deTCigeppWJ4mlqW+iH+LSgQpDwpjxJJD4xuCB/oiTUGtxLC4l
	VGF6jcGWUK8U1wAVHeVhptJ3ZPrwrWw=
X-Google-Smtp-Source: AKy350byj3pUtN5p2KVljKcq/+TcVDSPrduHiYnPxc3jperF+k/jPavrlOVY6lTVDsa2zPwkjwCWOQ==
X-Received: by 2002:a17:907:1c2a:b0:886:7e24:82eb with SMTP id nc42-20020a1709071c2a00b008867e2482ebmr27564694ejc.21.1680218852723;
        Thu, 30 Mar 2023 16:27:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a23-20020a170906369700b0092a59ee224csm309222ejc.185.2023.03.30.16.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:27:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/3] selftest: runqemu: better check for ROOTFS: in the log
Date: Fri, 31 Mar 2023 01:27:22 +0200
Message-Id: <20230330232724.2868639-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 23:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179378

* it was searching for line like this:
  ROOTFS: [/OE/build/poky/build/build-st-2023-03-20-esdk-runqemu-patch1/runqemu.RunqemuTests.test_boot_machine_ext4/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64-20230320081121.rootfs.ext4]
  but with IMAGE_NAME_SUFFIX changed to something else than default ".rootfs"
  or with my pending changes the line looks like this:
  ROOTFS: [/OE/build/poky/build/build-st-2023-03-20-esdk-runqemu-patch2/runqemu.RunqemuTests.test_boot_machine_ext4/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs-20230320085744.ext4]
  and test was failing.

* Check for whole line starting with ROOTFS: and ending just with .ext4

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index e72ff529c4..4c6eca5970 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -61,7 +61,8 @@ SYSLINUX_TIMEOUT = "10"
         cmd = "%s %s ext4" % (self.cmd_common, self.machine)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             with open(qemu.qemurunnerlog) as f:
-                self.assertIn('rootfs.ext4', f.read(), "Failed: %s" % cmd)
+                regexp = r'\nROOTFS: .*\.ext4]\n'
+                self.assertRegex(f.read(), regexp, "Failed to find '%s' in '%s' after running '%s'" % (regexp, qemu.qemurunnerlog, cmd))
 
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_boot_machine_iso(self):
-- 
2.40.0


