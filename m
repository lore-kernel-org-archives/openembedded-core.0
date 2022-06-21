Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABB5C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 14:10:24 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.43759.1655820623135068864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HCza4DQl;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id fd6so16796171edb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=79PAvbmhWHAaoXMMD2jfclMMLJTC8H5IYVTvn6zWU6c=;
        b=HCza4DQlm+7s2RXlTp/H5vBJEgq4IKrLeP+JTiJOCfn3Z2lSA/yJP8dWXlq/ZZZlxV
         WFPmaJF4b4Dir9t6+nY7+lni2xWY0vhrF/g2JqJDoKFhO1OuLTIMOIm/DwYranPQHo3m
         k/jaPdjhaOt/WvCOnUJyZi/isxe2MWR2JtBmXn/xU7q4HNBGOBctYLfE/l5i1rl88QZM
         bSI7HQ3FNKozUtB1qz+LMhSz5bAELFhXu5y8uMHSmS5Tr8y10SL7LFxfseGnbP/MIW8k
         L9RLGfNZ/O5iHHPAohHFEKQNrzD9u+ZMPzIllvwOOx0SVXJ0yfzoy8RvYEa0TPX7ep+q
         fxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=79PAvbmhWHAaoXMMD2jfclMMLJTC8H5IYVTvn6zWU6c=;
        b=FTblv3Zfl87Kk17MK3jyFO68FqP/Pu7BSKx/E3RCYdJhtAUKZfatCxr2Fb3Kt1fxB6
         KytkCOQFvjlj9ocKfBAIE/VxkmNWtAzEd26xw0OCZ8VWVcWOw1pDLILVCdLpfeC384jF
         sTcgHKTWRBZvqQE/1/+YDOIIOIn1BebEio8+K1Y9rN2zL1Aj5/RwSOTLPuMTfcU+cp+5
         CEAfMF5j4rUPLvinVzK7mw9ebdFGxGk4BW/dW/zsq6arUHhCPwF9uPg83wJSBBud8MYt
         MPKL0urNrhTV7RQbYrIwdc70xiw5l6Glt9TxJmgxD/kLrhb/BOt9imtJMKWA/t+eVHP7
         YmEA==
X-Gm-Message-State: AJIora8IJiJjt9She/765eHpDxrZa9CzBrqzd1Ks+G/fthpSHKM9XEXd
	J8IFs3KdFH9DqjsI7+LxLpz29N0dIFg=
X-Google-Smtp-Source: 
 AGRyM1tp1MycwvJTASLmkyoOuTbSIS4X4r7rZvneXiI2anYRe4eTs3YSi3VlQIR5G92WRHxsFLkIlw==
X-Received: by 2002:a05:6402:3551:b0:431:51e1:856f with SMTP id
 f17-20020a056402355100b0043151e1856fmr35925140edd.323.1655820621488;
        Tue, 21 Jun 2022 07:10:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 12-20020a170906318c00b0072124df085bsm5266562ejy.15.2022.06.21.07.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:10:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] wic: fix WicError message
Date: Tue, 21 Jun 2022 16:10:10 +0200
Message-Id: <20220621141010.1954113-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 14:10:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167155

* add missing % to print the values instead of:
  | INFO: Build artifacts not found, exiting.
  | INFO:   (Please check that the build artifacts for the machine
  | INFO:    selected in local.conf actually exist and that they
  | INFO:    are the correct artifacts for the image (.wks file)).
  |
  | ERROR: ("The artifact that couldn't be found was %s:\n  %s", 'kernel-dir', '/OE/build/deploy/images/qemux86-64')

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index aee63a45aa..06e0b48db0 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -209,7 +209,7 @@ def wic_create_subcommand(options, usage_str):
             logger.info("  (Please check that the build artifacts for the machine")
             logger.info("   selected in local.conf actually exist and that they")
             logger.info("   are the correct artifacts for the image (.wks file)).\n")
-            raise WicError("The artifact that couldn't be found was %s:\n  %s", not_found, not_found_dir)
+            raise WicError("The artifact that couldn't be found was %s:\n  %s" % (not_found, not_found_dir))
 
     krootfs_dir = options.rootfs_dir
     if krootfs_dir is None:
-- 
2.35.1


