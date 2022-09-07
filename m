Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C30C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 19:52:54 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.240.1662580368808579957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CHsR0MqU;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id j26so9427873wms.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=di3DVO49biHoHHeQaC8NWXE5+gazosHIPcwCmbdm7zE=;
        b=CHsR0MqU12l1xuWUBqXT3jBkrQ/DVZbA7u5MllKDpL0Q9B4LmzS6vpUHc+wHnOVvW6
         aopJdMPdXE8BQdGF3UrcPNJJsMjQ0EN/QupqIXsNIA/r8OOeg7qOdgNNziYMkdlmnDYS
         tLi2pycUFjP879JzLoPKCgsUKl+pXZ09Pi2Z7LpboyAWCzTL3lMNC5bJhjUZ65U15BNv
         lHGiLMLAzTEovgpZMuYZ333v+iG1lJmflWgtkjRdh8/HNOwtn6UFBWefGqMIebQIw413
         Ohc+Rxd6vUyuSKB4WwYTEKIacD/PdrrEXuGTxYZlM5Jh6JJOKIaWwZJpTXKHdZMhjYIZ
         yzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=di3DVO49biHoHHeQaC8NWXE5+gazosHIPcwCmbdm7zE=;
        b=TNzrkkOs/M6sTsY7+NpZz7ieu+bHVdmxgEI2zTK05Q2iT91yzxKXlPtbRttwmqzegl
         PqSDs0+TG8utIWuJvhuoioGBsom5zQ1hBXa7qfEBJ5fH+rO9rZsWqVPVTZ0AAWcAHMa0
         cBvo/bpNGkUKvJAs2DVCt5kbMpMm2B3P7U8gEQhFV84ugLTxU8mmvredisEQuWNu9u27
         sF6QPH5gw6g4wE9qjjR/HFCcYT74YeB3p+8CtwYW86n9ihqWChkSkjzViXtUPrExLOvy
         fVXdx+GyhiMpjhYDzxOzl5FnlA+Qa9UcEJjKnVTsRFDll98Aw/SJdoPvv18zipsoxr6y
         fBWA==
X-Gm-Message-State: ACgBeo2c94CbYM3uwsGokZi4RdDxzHD8vt4eeRNSU6B6U6Rg+hIl214M
	fZCe4+z218aKQ0juMjlwk6oTaAIzxnT9OQ==
X-Google-Smtp-Source: 
 AA6agR7nL+pY7oBdmplCCHPJBZb71dG96JN1i8dpWHJ3tN/UNnXsgsK5KLDsV3pWtL+vKC+sBHcf4w==
X-Received: by 2002:a05:600c:4f43:b0:3a6:2335:f5de with SMTP id
 m3-20020a05600c4f4300b003a62335f5demr44104wmq.109.1662580366833;
        Wed, 07 Sep 2022 12:52:46 -0700 (PDT)
Received: from developer.localdomain
 (dslb-002-205-007-019.002.205.pools.vodafone-ip.de. [2.205.7.19])
        by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b0022862fd933asm15030361wrp.96.2022.09.07.12.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:52:46 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>
Subject: [PATCH 1/5] oeqa/selftest: drop image_feature test from overlayfs
Date: Wed,  7 Sep 2022 21:51:35 +0200
Message-Id: <20220907195139.814465-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 19:52:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170426

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

The test checked the incorrect class use with INHERIT. This
functionality is now covered by bitbake

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index bff22f21b6..f550015b4b 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -333,24 +333,14 @@ EXTRA_IMAGE_FEATURES += "package-management"
         self.assertTrue("overlayfs-etc" in res.output, msg=res.output)
         self.assertTrue("package-management" in res.output, msg=res.output)
 
-    def test_image_feature_is_missing_class_included(self):
-        configAppend = """
-INHERIT += "overlayfs-etc"
-"""
-        self.run_check_image_feature(configAppend)
-
     def test_image_feature_is_missing(self):
-        self.run_check_image_feature()
-
-    def run_check_image_feature(self, appendToConfig=""):
         """
         Summary:   Overlayfs-etc class is not applied when image feature is not set
-                   even if we inherit it directly,
         Expected:  Image is created successfully but /etc is not an overlay
         Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
         """
 
-        config = f"""
+        config = """
 DISTRO_FEATURES:append = " systemd"
 
 # Use systemd as init manager
@@ -366,7 +356,6 @@ EXTRA_IMAGE_FEATURES += "read-only-rootfs"
 # Image configuration for overlayfs-etc
 OVERLAYFS_ETC_MOUNT_POINT = "/data"
 OVERLAYFS_ETC_DEVICE = "/dev/sda3"
-{appendToConfig}
 """
 
         self.write_config(config)
-- 
2.30.2


