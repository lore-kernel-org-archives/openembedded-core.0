Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D16ECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 11:14:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.23993.1661944451699092633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bb9jyzL2;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so11496781wme.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=aCfN+01A1GAEPeLvo+v+lKDT24CcTK8ssBznLi8zgZs=;
        b=Bb9jyzL24m3VTh5/kB2euX4IY5jZiGBDTOuc2uNl33KmaNOPa7VYUPEpqe3iO4tAxV
         V6T1gFZlAmjNyDjqGyLgIFpaMpofilFbvQvb5b4UeUNsoDlSmtP/5vHT2GuHqQKDwspo
         CQ6ybBqnAjrWfU4AHx9jHK69xBy7pGUK4RJEE9+ZFh2exhmvNNFfls6If3CZ9R6GkmF4
         1R4yiBtKJjztZPWj2wfk/My7Qd6aDa+6gY20br3OOA6vQosowEh5dnMQv7FJObe1MjfN
         H/ZZgifdvvyYnT2uyIHq7M8hjChBGIsEFIuJvqYWMQpnBch/0cGDHf9gEL9ANGHhNBU5
         5gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=aCfN+01A1GAEPeLvo+v+lKDT24CcTK8ssBznLi8zgZs=;
        b=n+pCD4h7H3xL8z8pf7RcfRyozwJdBjjqBxB0qBc4vsSHRou8c5WETjP939nrOOY5Kb
         9OS+68JMjPRSuPmfdE79E0xqaT7UVXw9/yCHBE5UKkiyTbHAAK/2oXabkQyX2coVgQdx
         lPv+uPRV1yAZM7ytd5RCiI9KYZ52em50LWY6nNWi4uvdUyS92Jeu4ZIJPjW7lNJOVH6K
         /DUiIs3t5I9Kr80UvpWxA4r4gX5/4+p7/VI9jp+wEzpvyxjVpRoxUJrHVfn3yENpfC+o
         DTmONJSzJSnCINio5r3bVYOi/1m+eoXj59pVr7Ku9XR5HslONeJqs20IM7kpvEjPjCfl
         X3Xw==
X-Gm-Message-State: ACgBeo14t7+KGor3nXAomKs+aqt6MBDnAya40myx8VjS/yAa8k0m2Wxk
	SlbwyDbdI6H12yVLRTtCDVWSIVJ64Q4=
X-Google-Smtp-Source: 
 AA6agR4RV68DI4D/PEt27RT24f/7MDRyL0FXuXgPgO6lJrESHqgMQCs93oXVDF5Zayiuu0t6VeUUpQ==
X-Received: by 2002:a05:600c:1e89:b0:3a6:38de:7024 with SMTP id
 be9-20020a05600c1e8900b003a638de7024mr1675236wmb.184.1661944450178;
        Wed, 31 Aug 2022 04:14:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b003a60edc3a44sm2324753wmb.5.2022.08.31.04.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 04:14:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/7] scripts/oe-setup-builddir: add a check that TEMPLATECONF
 is valid
Date: Wed, 31 Aug 2022 13:13:55 +0200
Message-Id: <20220831111401.3330342-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 11:14:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170101

specifically that ../../layer.conf exists, and that second-from-last
component in the path is 'templates'.

This requires tweaking template.conf creation in eSDK bbclass, as
we need to ensure that the path in it is valid, and exists
(which may not be the case if the SDK is poky-based).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 3 ++-
 scripts/oe-setup-builddir                    | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 56e24c4eed..925cb313fc 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -438,7 +438,8 @@ python copy_buildsystem () {
     else:
         # Write a templateconf.cfg
         with open(baseoutpath + '/conf/templateconf.cfg', 'w') as f:
-            f.write('meta/conf\n')
+            f.write('meta/conf/templates/default\n')
+        os.makedirs(os.path.join(baseoutpath, core_meta_subdir, 'conf/templates/default'), exist_ok=True)
 
     # Ensure any variables set from the external environment (by way of
     # BB_ENV_PASSTHROUGH_ADDITIONS) are set in the SDK's configuration
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 5d644168cb..bf832ee0ca 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -61,6 +61,11 @@ if [ -n "$TEMPLATECONF" ]; then
             echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
             exit 1
         fi
+        templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
+        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
+            echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
+            exit 1
+        fi
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
-- 
2.30.2


