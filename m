Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13CDC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:53 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.1535.1654188768476044096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=CQsN9kOe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id y189so5199227pfy.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ko1d/yugSDSMUa0qMC/sgakf45qC1DZPdXQWcM0tjH8=;
        b=CQsN9kOeEniTkoptVYxk3gg5ZpEo5zbp4ceTe8BWNBGe9u41A33UaW3PeIvG5wsL30
         MIT0qjYtm+uTzlyaKczg/2QF+YPvf3LzFq3GORGzNgFf4TgiZ8yegzbBt7XPoFpk2cyn
         C8olueS3zf7QyE5Q6GstX1OVAjuKVrrdFHh3JRPt/fPPzCaMSeYEbhRqShzUZPYip5iR
         ycPEdrPOItBj7rAVmYX1ZQiiq2m/XGNZkmY+GjI4Tsv8oa5h7Tz7BdIRQ0IX5Y0rzhqJ
         IAJvjqjusqFY/aixT8R58zyxLN4Zbxc8f3xtLXfk8rXdkWwBqbnNw0VU7npSsZ+58DQv
         9JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ko1d/yugSDSMUa0qMC/sgakf45qC1DZPdXQWcM0tjH8=;
        b=7abgaXV6J13rdGuG+fsqIZ5k4stHQ/asubeD8+XLGO8o7NVSUgn4XTM8D1ff5hshKk
         +qUfsi+SflrgV4qzoaX4hJuIoyfdPloBOOkfCM33GEYx9WipXc5RmkROUAsvJW5sAyTx
         YoghYfZWZychUOYY/MaEBFekfovffsOIpS4hovE4bkLlAFZ+dKlSM5kMLLOK2oHQhUM0
         l1BTqO7gr97bfYYemSs9bORC6A09hcUAPZx6r2zV1sGrgaYCVfWi09Mg5HDMrhyX5YMR
         Heoq+XSxl43Asm4nUpN2QhUYlaOSLiCr/tP0JN7Cerc6VExfOikoKR4WflU7FE7uaUql
         6F0w==
X-Gm-Message-State: AOAM531NuvcCDTf8smon5FxOkyXR2CiuY26uw3vHBnwowghp0LggI/cE
	rSEyK4+RnA7WUWetAXSlfzMySCOPoYdYP4rR
X-Google-Smtp-Source: 
 ABdhPJydzdeuAdfUuOEgH8VBCl6bk7Q6nYcOjc5gL7kM1mNZ7jJjyGKa5Ix2ZZ0wf7dUtzz5h3xngA==
X-Received: by 2002:a65:428c:0:b0:3db:822e:2163 with SMTP id
 j12-20020a65428c000000b003db822e2163mr4912957pgp.466.1654188770325;
        Thu, 02 Jun 2022 09:52:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/26] staging.bbclass: process direct
 dependencies in deterministic order
Date: Thu,  2 Jun 2022 06:51:48 -1000
Message-Id: 
 <bd72b15e9a4c9bb4f155d19c84bcf20d788bd568.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166493

From: Martin Jansa <Martin.Jansa@gmail.com>

* this doesn't fix any issue (at least AFAIK),
  just keeps the log files more deterministic to avoid unnecessary churn like in:

  --- /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/keymaps/1.0-r31/temp/log.do_patch.2213051      2022-05-26 11:35:44.110063749 +0200
  +++ /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/keymaps/1.0-r31/temp/log.do_patch.2213372      2022-05-26 11:35:54.553062630 +0200
  @@ -1,7 +1,7 @@
   DEBUG: Executing python function extend_recipe_sysroot
  -NOTE: Direct dependencies are ['virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot']
  +NOTE: Direct dependencies are ['/OE/build/oe-core/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']
   NOTE: Installed into sysroot: []
  -NOTE: Skipping as already exists in sysroot: ['patch-native', 'quilt-native', 'attr-native', 'libtool-native', 'gettext-minimal-native', 'texinfo-dummy-native']
  +NOTE: Skipping as already exists in sysroot: ['quilt-native', 'patch-native', 'attr-native', 'libtool-native', 'gettext-minimal-native', 'texinfo-dummy-native']
   DEBUG: Python function extend_recipe_sysroot finished
   DEBUG: Executing python function do_patch
   DEBUG: Executing python function patch_do_patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3ebb37b97da15166d452bf51f5f7e0c312ae42e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 8372a4574a..bf8ca58b0b 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -352,7 +352,7 @@ python extend_recipe_sysroot() {
     #bb.note(" start is %s" % str(start))
 
     # Direct dependencies should be present and can be depended upon
-    for dep in set(start):
+    for dep in sorted(set(start)):
         if setscenedeps[dep][1] == "do_populate_sysroot":
             if dep not in configuredeps:
                 configuredeps.append(dep)
-- 
2.25.1


