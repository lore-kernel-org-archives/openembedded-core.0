Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A31C52D6D
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:41 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.30122.1722791381334239523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WmaQIpaN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso8443760b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791381; x=1723396181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8ICrTyxiE2481vRHDZNTf/mi/gap5kC+FNnvaW6+38=;
        b=WmaQIpaNPp78/5CgcKK4GpmuyVPE4y+7AjQ+asVe8fiIv3x8kX04K6BtxRHbsBvKVd
         3BPGA2pAfsLp03xPZljF9/KQIL/v5out2r0yuB05OFXkSdei8CzYadIEN8e0xsBdzAVx
         xA7SFAWelMdlpG2wn0AKB+nNI8o8vWBbUBbL1CHNFa4YeVcWA41JYAOz0VIqMoYhIJeN
         2RbWdZTCqI+ypSruwTRbfnkt0ADjBxYvMJPlWmjSNG6s/L8JQdcxQhs9meQ2HtkRLuS9
         SWudjb1dpzbS1PBCUDXxBVy4WHbT/9slrmDV2FiamgodDyNOoMLRWNxj+NdzTi4ZMOxr
         gCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791381; x=1723396181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8ICrTyxiE2481vRHDZNTf/mi/gap5kC+FNnvaW6+38=;
        b=YG8KpfekqvaOfKTn1rtcf2e+IKU3hMUR+NPrrKpn8I2BR+QM58AHHnJrwzEhdkePAN
         q3V+ClcecZT2+LXBpbPcx16/cv16zoE0o2e1WZJyTofuEehQzRLtp+MmOPySf0jg9Ycl
         GPKi96eS3DhGRjwJxW8sWDFJ7pVSQkpW/eLghDAC76XXgr/qPSb68W2+erxpEGxKwaJI
         p1lqdk0RBfjROkK17KDkTj4IySswv6tt76EkAKj/w9Q6LKhXpvGjOr+Ie3TQPdYMtD/P
         Mvge9HXKhueNdezFYrDTiL96GAwghghrIQCrfTeJffbmUWMOMkNmP0z6JeBLrQHowWPP
         JFXg==
X-Gm-Message-State: AOJu0YynOb0XsP8w6ZxmTB8YWUoQrryEL7568H2A5+myvkJ7Gd8OozsF
	QDnf3Ps4Jx1UYkycz1qEO+KZx4GKlTcWXMOZVEEXtVjeGEsqHXCq608HCSdBA0mZ5YTPZHaIPyU
	F/elyog==
X-Google-Smtp-Source: AGHT+IGw0LtShtsmJ2BDPhmKo1ftFziIK5YaoVPCRPLVcV4bDVnOPHUYdKSWZLd8qaxv0y+n6bpnXA==
X-Received: by 2002:a05:6a21:329e:b0:1c4:2132:e205 with SMTP id adf61e73a8af0-1c69966ba57mr14677865637.48.1722791380497;
        Sun, 04 Aug 2024 10:09:40 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/18] create-spdx-3.0/populate_sdk_base: Add SDK_CLASSES inherit mechanism to fix tarball SPDX manifests
Date: Sun,  4 Aug 2024 10:09:13 -0700
Message-Id: <95660951a09e2a3fe63eb1017ad8f1d7fc9cd503.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202969

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently, "tarball" sdk based recipes don't generate SPDX manifests as they
don't include the rootfs generation classes. Split the SPDX 3.0 image class into
two so the SDK components can be included where needed.

To do this, introduce an SDK_CLASSES variable similar to IMAGE_CLASSES which
the SDK code can use.

Migrate testsdk usage to this.

Also move the image/sdk spdx classes to classes-recipe rather than the general classes
directory since they'd never be included on a global level.

For buildtools-tarball, it has its own testsdk functions so disable the class there as
a deferred inherit would overwrite it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit 662396533177b72cc1d83e95841b27f7e42dcb20)

Eliminate spdx-3.0 items, not applicable to Scarthgap.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 3 +++
 meta/classes-recipe/testimage.bbclass         | 2 --
 meta/recipes-core/meta/buildtools-tarball.bb  | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 6cb43ade30..a103e7b738 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -4,6 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
+SDK_CLASSES += "${@bb.utils.contains("IMAGE_CLASSES", "testimage", "testsdk", "", d)}"
+inherit_defer ${SDK_CLASSES}
+
 PACKAGES = ""
 
 # This exists as an optimization for SPDX processing to only run in image and
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index ed0d87b7a7..2f68f83dfd 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -483,5 +483,3 @@ python () {
     if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
         bb.build.addtask("testimage", "do_build", "do_image_complete", d)
 }
-
-inherit testsdk
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 92fbda335d..e2ce5b3ecf 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -112,6 +112,9 @@ INHIBIT_DEFAULT_DEPS = "1"
 # Directory in testsdk that contains testcases
 TESTSDK_CASES = "buildtools-cases"
 
+# We have our own code, avoid deferred inherit
+SDK_CLASSES:remove = "testsdk"
+
 python do_testsdk() {
     import oeqa.sdk.testsdk
     testsdk = oeqa.sdk.testsdk.TestSDK()
-- 
2.34.1


