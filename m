Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA53FC0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 21:19:54 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.145969.1692134386382332463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 14:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eI5QkZSp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe1fc8768aso58432055e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 14:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692134384; x=1692739184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTvHCLpUcV0pH5qcGDAqHyaOCYOp3T85mH7BDkA00Ko=;
        b=eI5QkZSp+wr6cHjkeUzX+JD6ezpEJYEXZF33O4c20i6RLnWNXmNVnjfGBY8kcwNU7L
         CQy92IIxQLpxzHpFo8nwg8biQXQoEPZWVIkHWfd45k405qYCpcnlhrDe+LpsYLXsVofh
         kgkBS22yn+xaWLXM0qqFENhg/wz2xTkKaf1sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692134384; x=1692739184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTvHCLpUcV0pH5qcGDAqHyaOCYOp3T85mH7BDkA00Ko=;
        b=cmRqalW3hvywbBOPdFKpQehU/4FDkDvoJgxPJ+xtdUoPsPcH76MeXsfEhnKnfOvO0R
         mYciDuCjqkCo+8KYBDOFWbSY1E9EAu+hk7TCkxKoguaYqbE38Fe47VTy8qoOWZUCUALN
         8lm4gIVzxLyC1Fa1Jc14J3rbAEyD0uS0wmePhkN1CqUZTqhD11sGVizSkZM4/9VsEYyc
         Z+RLAWhwmHDcDY2VviazQ3poujCc20hvXX78ASsFgNpzqmjdRXAVKiSvut7TmDY4H6ql
         s2xAziJPA95GziFaxCgBbWuFVUK54hWAsvUs+qLW/D1BpE+2mxuur6njvUvAufisQXwJ
         Im+A==
X-Gm-Message-State: AOJu0Yyg7PDhezgH9Uqa88j7R1qpgVO8sY8F5jL3xUg4bpuSEWs+ghQ3
	ROrnIDCnMGBDkvTVSxk2FOLM91A+t/+4KqHRfcA=
X-Google-Smtp-Source: AGHT+IE5n+JWqGGw5iQ90QhnlqgmH9TLeYNQaCuXMPUVc77o8LUhTnGWWqYGlf39r3rv0mooX8nEZw==
X-Received: by 2002:a05:600c:5121:b0:3fe:1b4e:c484 with SMTP id o33-20020a05600c512100b003fe1b4ec484mr11483282wms.5.1692134384622;
        Tue, 15 Aug 2023 14:19:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b782:7711:f696:663e])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003fe2696ccfcsm18962323wmi.23.2023.08.15.14.19.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 14:19:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lib/package_manager: Improve repo artefact filtering
Date: Tue, 15 Aug 2023 22:19:43 +0100
Message-Id: <20230815211943.476721-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 21:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186103

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
---
 meta/lib/oe/package_manager/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 0c313190cf8..6774cdb794d 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -470,7 +470,10 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
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
2.39.2


