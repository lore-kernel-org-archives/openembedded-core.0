Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BD2EE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.13083.1692801418934555143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rivSGZIA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bdf4752c3cso34747855ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801418; x=1693406218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mm/lTMmBLa3nJqGseETBHcjtCF2/7w0TlbH0dQ4eAwQ=;
        b=rivSGZIACvaucGK1koFtGhLW5uMPBkQP6HH2rSeQ/47kTX5NtpKLQHCZwZ4UOA2XTX
         t1TDZ/OSvfYEiShAbNerDgzSOz86TXiNXw/j9ws8zzyU+OCIiFJGCa3+tBIWLVEkvVLA
         h4vfXPjNajmT/IN46LRtomlq8b0J2fnV5eddH/yGzrC0xTW/bYGDGneDH4beEUa/BYOt
         142Gn8Usez2Dic+lzUGEYR7hT7s+uWDQ+6gqFgsnE+G7+BqIx+fxMCaQuA1m2EKUAxLw
         4K+PB55Z1fo8DdFlndauuBG0DmLy3xWChxGzS/OoSnCMZ5wAoaC+jdpBJdmgCEttLLxu
         TWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801418; x=1693406218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mm/lTMmBLa3nJqGseETBHcjtCF2/7w0TlbH0dQ4eAwQ=;
        b=ciSmkjDy5kxx5lp3wsl7HfnBTnV80tn3t4VKCEdr/XAKtjf9e7MmXh4QtZUQssYyiJ
         S9vTa4RQY+Sf/emAPPRtgM955u30KvWZTPK2+HsEBKtjJzhFKA+GQVTG3Hm6RUDt8VZI
         rTa8iu+kKSpy8f2zBi1Ya/HuLA4xftOsrl4dq/KA4/E/bsOT+9eSFVZIbXe0xTuq2pWJ
         54bI4jgD9NYwzL21edOdFKmclNAURhr7sQ4MKZY5XTX8LduhXHKBW5HU/DUmXff5ZzXk
         3VSvEKJ67dhHR5UHu38MfVvG+aUjk0ojSmSUfzuIdaCS7NQel65FhUWmOA/sY8isSqVB
         3MYg==
X-Gm-Message-State: AOJu0YzXGvq2hXnMKjrJBMX1lo2+Jk2ESE34uYNsb6OWA+i+4v5ntgIQ
	tvnSyRSFVcZKNSeHwdxQnGOCL9IXAM9j0ZXBYZM=
X-Google-Smtp-Source: AGHT+IFzNzORLN47MoCIGSCw5q9HMHF+0dpfyk346hAOLD7PCU1O+fTelz5LBjQtQGmJTFwChZqstA==
X-Received: by 2002:a17:903:110d:b0:1bb:d59d:8c57 with SMTP id n13-20020a170903110d00b001bbd59d8c57mr12032215plh.18.1692801417906;
        Wed, 23 Aug 2023 07:36:57 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/36] lib/package_manager: Improve repo artefact filtering
Date: Wed, 23 Aug 2023 04:35:48 -1000
Message-Id: <b811ce9e1c94532d49db54d4c3458cd804d96adb.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186599

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If you run an arm build followed by an x86 one and then ask for a
full repo to be created, it will include all of the arm and x86 packages.
testexport will then find the arm socat package rather than the x86 one
and try and run arm binaries within an x86 qemu image with no success.

The reproducer for this was:

oe-selftest -r fitimage.FitImageTests.test_initramfs_bundle runtime_test.TestImage.test_testimage_install

This patch only symlinks in the compatible package archictures rather
than all of them which fixes the failure and the resulting autobuilder
intermittent failure too.

[YOCTO #15190]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30b45bcf49bf8207fd96bb45a55d7708661f3359)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 80bc1a6bc6..6615258470 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -467,7 +467,10 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
     # Detect bitbake -b usage
     nodeps = d.getVar("BB_LIMITEDDEPS") or False
     if nodeps or not filterbydependencies:
-        oe.path.symlink(deploydir, subrepo_dir, True)
+        for arch in d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").split() + d.getVar("ALL_MULTILIB_PACKAGE_ARCHS").replace("-", "_").split():
+            target = os.path.join(deploydir + "/" + arch)
+            if os.path.exists(target):
+                oe.path.symlink(target, subrepo_dir + "/" + arch, True)
         return
 
     start = None
-- 
2.34.1


