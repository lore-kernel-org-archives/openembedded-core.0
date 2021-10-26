Return-Path: <tomasz.dziendzielski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB288C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 07:33:02 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.8948.1635233581500205119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 00:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SmSEb+0Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id h11so5730915ljk.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 00:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nhGL7XKWDFx7F6fR0MO/eRj9QoE7ZkMVCXc1FP4dpkA=;
        b=SmSEb+0YP1p63aQkvIJMqqOUFS+AhZNmr6v8VWk/bn7vw+puT9gKy1uhj7UYY82uxb
         CJMds4tV/MuTn9xgY9ilfZ0W0P9CPHLfag4YPu2x8LKPX+HGXpiK4LIEjXVs1YFVprqr
         9f4bXgq48OFCnLi7b98AsJppcmk43urVocB8gH/l30gk10vxHSWXXV4d17kzu8E5RpUN
         qCz31sv7rCtxGe2OZfyTC7h4oHCxRiNhmD5LxRCg13UMAY0MuOMsf4dzdGzmX64UW8Mj
         OI4bKpsG3a4pHOVgjTkrI6HCp3KFcRCMYhwPeSRYsjPYAkdkaZDNx5flYNq5HFbX9bXp
         JHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nhGL7XKWDFx7F6fR0MO/eRj9QoE7ZkMVCXc1FP4dpkA=;
        b=GT8EMQGPZzEjcOwCmPh2SPKOYeSkoS9LCW072HFINgxYOzOcuBKl4F5JgTyq1JUIu0
         +qD/yzoORtw7MS/nsxOihesmyaCLubMq3GdeO4JGL4sANWr28iKyGYRwNzg5fIz6ejWm
         W1Ur08we4JKPdWYOXy+Na903rcof7svXofO3YtrQTCVinXqUe8VHpqoNrXMTJqoJTZdz
         dA4QwenqOVANGmzSr+bK2TS4d/gsDiPKYPgNkAOpmKpeTGeLQPYJKZe7w8karc00BXjo
         uN5Uv3QbVtCwFty2nYescXD/yszWGZe87uQkTne8bk6JsLFQ//upFtum0WAHzt/BgaeU
         AGtA==
X-Gm-Message-State: AOAM530E7AiGlp3fF/Cjx57s3ceyPrsej2WgSXS6DCWMPjlcV4q31uyg
	YjQlKGdFJYbTjFlFBMYC6vF7Fd+ECv+e7g==
X-Google-Smtp-Source: 
 ABdhPJw/lpINHnRj2maCsUBQYCeh6Ufqzz+bKIUfR0qgwHLfL+TQOKmnMb63TkTIsfJsnBZw4z2W/w==
X-Received: by 2002:a2e:9801:: with SMTP id a1mr24200297ljj.183.1635233579208;
        Tue, 26 Oct 2021 00:32:59 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a317:e437:bf00:3580:3e57:72c5:520])
        by smtp.gmail.com with ESMTPSA id
 z6sm1919390ljc.112.2021.10.26.00.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 00:32:58 -0700 (PDT)
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>,
	Jan Brzezanski <jan.brzezanski@gmail.com>,
	Ricardo Rodrigues <rrodrigues80@gmail.com>,
	Szymon Czarnuch <szymek125.14@gmail.com>,
	Kamil Kwiek <kamil.kwiek@gmail.com>
Subject: [PATCH] license_image: Prevent do_populate_lic_deploy from using
 image recipes' recipeinfo
Date: Tue, 26 Oct 2021 09:32:49 +0200
Message-Id: <20211026073249.3424-1-tomasz.dziendzielski@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 07:33:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157375

If image recipe depends on another image recipe it will try to use
license recipeinfo that is not deployed. It will result in:
| Exception: FileNotFoundError: [Errno 2] No such file or directory:
| 'TMPDIR/deploy/licenses/foo-image/recipeinfo'

In such case check for image_license.manifest file (which means dep is
an image recipe) and skip if true.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
Signed-off-by: Ricardo Rodrigues <rrodrigues80@gmail.com>
Signed-off-by: Szymon Czarnuch <szymek125.14@gmail.com>
Signed-off-by: Kamil Kwiek <kamil.kwiek@gmail.com>
---
 meta/classes/license_image.bbclass | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index bf70bee99b..cc1d9ea651 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -201,10 +201,17 @@ def license_deployed_manifest(d):
         man_dic[dep]["PN"] = dep
         man_dic[dep]["FILES"] = \
             " ".join(get_deployed_files(dep_dic[dep]))
-        with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
-            for line in f.readlines():
-                key,val = line.split(": ", 1)
-                man_dic[dep][key] = val[:-1]
+        try:
+            with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
+                for line in f.readlines():
+                    key,val = line.split(": ", 1)
+                    man_dic[dep][key] = val[:-1]
+        except FileNotFoundError:
+            if os.path.exists(os.path.join(
+                    lic_dir, "%s-%s" % (dep, d.getVar("MACHINE")), "image_license.manifest")):
+                del man_dic[dep]
+            else:
+                raise
 
     lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
                                     d.getVar('IMAGE_NAME'))
-- 
2.33.0


