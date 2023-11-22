Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407E7C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.18523.1700657117446179213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BXnGVnYI;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5446c9f3a77so9590472a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657116; x=1701261916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGvOG3h9XoEJTOJuOYZwtMnrpSF7SmfcXtkZ0RRfnZc=;
        b=BXnGVnYIqAHKarvJkGEGuUSh7sHvLuufEFzPmyAwpTF5OEE5gTCPQin5NPUrYd3QJM
         wvEd0QXUEhihAmbnAXDctaZHYn/DGwr6xOKrMr5T8EsWRBd1R8ccFspf1ZVQ+M0mQkgr
         WRq+D+2MFgK7TJMrQuqn+k0UNJU1Uv1KvmUABiA9N5YA8gPP7pf2ih+NFW615EGJQUnI
         qrbG1mlcUFVg+CMZIUDp1iSa0wiPx2rUv2f2UG1pRHGkXE6xXeh5CvKrg4lHuYxeoqLh
         V7FMwvGEbCsaggK4df9z0TfuVjRDMWZvlz1ROhvS+GvErX351fponm82WfU61ZRXu4nd
         Twjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657116; x=1701261916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGvOG3h9XoEJTOJuOYZwtMnrpSF7SmfcXtkZ0RRfnZc=;
        b=DswoOGnZEmmvmyh7M+mBxBYZHGrkWIINSE8M0CMiwpEUtuqMFy4RN1d9kNelqOBJ8i
         zUnx121ZsSTw0A1EgCt6ud6y/qndikFw32hHJq13N/FyZl4xsF7G9ZpIBuRgX70DUoKd
         hXTqknB95/WWhLYz5j0yKXf9xYtVv1LvN71+rBMMdTVAD9szW7jaUD4el/kCa2kDZq34
         Xk5LH/LQSj8XmoHNi6vhZIhcM5gCFD/fRpBACln14kRSIE1+6JIqnsJseM3XqU26aw9C
         6pkXNVYn/XNIt08A0uZJIgmOLMQ65ZNYx4brdD77wkVSt/qUjtul6n60K3TitjJkv1vg
         DikQ==
X-Gm-Message-State: AOJu0YwaW2KncvHA/GNARS0N7jPTtNzpopXYID9hwGHnKVeQiXZ8fgfa
	4Dp1/D8hewjRVwuQIV+oDzs2l6tyQkw=
X-Google-Smtp-Source: AGHT+IH892urY4zI7XHA8kDlFJ/RlH5JrwNcrpKFjOaFQWrjdCXNRG6f8HS06Vsu6VIf3pK94bG8qA==
X-Received: by 2002:a17:906:14e:b0:a00:152a:1ec4 with SMTP id 14-20020a170906014e00b00a00152a1ec4mr1852375ejh.11.1700657115896;
        Wed, 22 Nov 2023 04:45:15 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q22-20020a1709066ad600b009e776cc92dcsm6599449ejs.181.2023.11.22.04.45.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/21] oeqa: bbtests.BitbakeTests.test_image_manifest: use just isfile() instead of islink()
Date: Wed, 22 Nov 2023 13:44:40 +0100
Message-ID: <1d362851c180f90ace447cf0364db3d11cfb01c9.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1700600804.git.martin.jansa@gmail.com>
References: <cover.1700600804.git.martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191087

* with [YOCTO #12937] changes the manifest is hardlink not symlink

* fixes:
  2023-11-16 00:16:33,967 - oe-selftest - INFO - test_image_manifest (bbtests.BitbakeTests.test_image_manifest)
  2023-11-16 00:19:05,060 - oe-selftest - INFO -  ... FAIL
  2023-11-16 00:19:05,060 - oe-selftest - INFO - Traceback (most recent call last):
    File "/OE/build/poky/meta/lib/oeqa/selftest/cases/bbtests.py", line 139, in test_image_manifest
      self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image. It should have been created in %s" % manifest)
  AssertionError: False is not true : No manifest file created for image. It should have been created in /OE/build/poky/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs--1.0-r0-20110405230000.manifest

[YOCTO #12937]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index d242352ea2..4276a9ba91 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -136,7 +136,7 @@ class BitbakeTests(OESelftestTestCase):
         deploydir = bb_vars["DEPLOY_DIR_IMAGE"]
         imagename = bb_vars["IMAGE_LINK_NAME"]
         manifest = os.path.join(deploydir, imagename + ".manifest")
-        self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image. It should have been created in %s" % manifest)
+        self.assertTrue(os.path.isfile(manifest), msg="No manifest file created for image. It should have been created in %s" % manifest)
 
     def test_invalid_recipe_src_uri(self):
         data = 'SRC_URI = "file://invalid"'
-- 
2.43.0


