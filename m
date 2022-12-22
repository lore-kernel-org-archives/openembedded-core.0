Return-Path: <pzalewski@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A30BC001B2
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 10:38:40 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.42712.1671705515428978269
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 02:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20210112.gappssmtp.com header.s=20210112 header.b=HBSpWn35;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.221.43, mailfrom: pzalewski@thegoodpenguin.co.uk)
Received: by mail-wr1-f43.google.com with SMTP id co23so1202705wrb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 02:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DyFbqb+N06XMS3t1nbAvRqEEBI37h2x+GPFr56KZ3WE=;
        b=HBSpWn35PGqI9pfOp4jVSRsSyaeTFEy7btcdBHuNKq782aL8AOqxB1VElSI8xjSdsi
         /NV67JksER9WYOPbj4mTPTL5o385WfliI1jENm9W5mNHvdKSN8UjhXdx25+PjrFPPJfL
         XQ0Zc1wHtdZlw652VvERAgsDSoYPs4vnGWN2yIYb3svbEBNWnPyZj6pe32nG1DSaKeOr
         GHHAFcKjzX4SuZmbxgWyheaaq5MLUB8W2GW9//83yvCJt2rgJWFwg/SdZVcHu6EM1fty
         HBt0LPWqsdmW0GseTmDQLKn4NvDTykykLuxPs3Nc+yhedxBY7tKKNWyYDB3w2QKiiVvH
         +++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyFbqb+N06XMS3t1nbAvRqEEBI37h2x+GPFr56KZ3WE=;
        b=E93qUawBOTtGDonXHXqeo55kd7FVlmwxH+tooyutYtspqngaxOniAIdfefvX5Htutr
         2RIsli1QWV2c15Rz0NgvmtMyNaNIqLpVrmGm7HqfddqLbLtZkVtMBHTCecvLNFjyrh9m
         qg1SAhekOs9C24kfLJ17P1Y8hr34m9z9wO7jOSjSlkNpYlbSqz5RNOnUAUNN2PR51Xa+
         80lkpQrCQngVRdYpxYsu5w5LZFwmtsUcLkMDvlKaie5j3gHp3H8GERfTejIntaSec6xv
         rBO8sO/w3KsHUsM3fJZtJollUrch9vFaVhayl5UYQn2UO79PnE/9CKA/qgDkcKCEr4CJ
         5QYQ==
X-Gm-Message-State: AFqh2kpvQCYZR3dSNrr6SUC5Sn/gSvzT+V/jfakv7XBk1d09r+l4jOjG
	7acQy0HKo2/mtV+w8SS1ItrdkF45VIUHVXLA
X-Google-Smtp-Source: AMrXdXvRPxLSosvGIVvKdbdsGQjb0vY28/bn6iPJ2UKL5SPpXDXgk+oB3pbFdc8FBludviodJrKFtg==
X-Received: by 2002:adf:f183:0:b0:255:96ed:950b with SMTP id h3-20020adff183000000b0025596ed950bmr3322748wro.60.1671705513503;
        Thu, 22 Dec 2022 02:38:33 -0800 (PST)
Received: from pawel-TGP.home ([95.146.6.255])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d668b000000b00242257f2672sm142649wru.77.2022.12.22.02.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 02:38:33 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH] classes: decode output data to text
Date: Thu, 22 Dec 2022 10:38:29 +0000
Message-Id: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 10:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174960

The default return value from subprocess.check_output is an encoded byte.
The applied fix will decode the value to a string.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 meta/classes/fs-uuid.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
index 9b53dfba7a..731ea575bd 100644
--- a/meta/classes/fs-uuid.bbclass
+++ b/meta/classes/fs-uuid.bbclass
@@ -4,7 +4,7 @@
 def get_rootfs_uuid(d):
     import subprocess
     rootfs = d.getVar('ROOTFS')
-    output = subprocess.check_output(['tune2fs', '-l', rootfs])
+    output = subprocess.check_output(['tune2fs', '-l', rootfs], text=True)
     for line in output.split('\n'):
         if line.startswith('Filesystem UUID:'):
             uuid = line.split()[-1]
-- 
2.34.1


