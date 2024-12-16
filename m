Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2815CE77183
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:44:31 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.62606.1734371065396244741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVUSUCtN;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436341f575fso30840975e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 09:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371063; x=1734975863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbAa0Pu7sqj71oQIxq5N/BDzE2UBYAzsc6fFBS4ZWMM=;
        b=IVUSUCtN+1jXH0yougoiXoJSxgbn2aUiKYStODHargnJMhl7sGFsbuQTmilNtboE0f
         df9tBpRCUCwZT223LP0fsGb2kXGOBQxvC6AWjQ34KVSQpEvR/QAur7ZNxW5qIPQk3Egs
         PAEA0XxYTyvblnBbJj75WSBFX/lYZqUnQqpheZiU/3n/2rq7KqOCM0C/PLJRtnwy1Exs
         Z3dgXuXtmMg9s3RAp11Uf0U/V0abjsxMjtX0snqauRUJulZIkinVrOKzlUG5jG/yuxtW
         f1lo4ICPrWkx6BqZ1s3qJlrq8i2Xm8+d1r3LPPd6QeIyd+vaiQnp16BCFTp8z7OsIQFh
         Ndfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371063; x=1734975863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbAa0Pu7sqj71oQIxq5N/BDzE2UBYAzsc6fFBS4ZWMM=;
        b=G0hvUJZG/irLbO1E5LvIZp/S32QpTq57BPgExOiOB0oYSNtKvqscW5ESo+a/bxV2Nh
         FkG68HRPTwyjJXH8B4SKWN8vMrxle5SjhvWqb4A3E7JPnp5zYdraYJ/9oW6tDs8rdASd
         DFf0J719d+G178TEdqpTD5KPEYzjKDoF5kXgEYIQ6Oi9rHbmybQqYFhosBqQg1ABPFzj
         vMZ4ESatGfg4UGrEDIy3eLx03XXUDwBx07ZLRmcDzlq54euX4lyiyxbGDxSFKFRtNAnr
         j1ev23iosqjeiSrn64grVS1MS1HGKY4ImT6lXnnBq0SyftPVbCdFKe6Sh7bLAIbper/+
         8mSA==
X-Gm-Message-State: AOJu0Yz7F2t3++WKnXb13l9KDGnhBb3Et2wZHbjn6eARPqvKASVfUFNi
	o6g357y0qUnRMimPJG+QKyOv3Gbe/N0hBNT+bfcsHNGIlryzQd9TF+jEQQ==
X-Gm-Gg: ASbGncsuUFA9ExBjuTzOMhY2XHb/JCd2deXptPE8+GasWD94zpU1OaZLEoPzelM+2//
	EPIM6PqO4NSsa6Pu/LRqf4b5JdR6p9Y+iE7q21EhTwsAwXCfrhNSQRC20NaWoIhtMU3GAVsNkCl
	krqtRTxn6LloktVbAeKCaxK2LAVDSXOOWws3r2gindSMw7Kh1ISMCwhMgbLsDeZMdYNQcmT1h2n
	uAI1WMf2lUTGFnBJqmVtRYiRyg//B0t4ME9AKmMD7jEgv29xqas2/uijgZBZS8miN15HF2IJtLK
X-Google-Smtp-Source: AGHT+IG9AvEvI5NLRrqeOeKxdLsXFwK0pKV7CU5WkawE3iqwyK1ctfeZtA3bIottR9HZuMuPWis00w==
X-Received: by 2002:a05:6000:178b:b0:37d:4833:38f5 with SMTP id ffacd0b85a97d-38880ae14a8mr10684582f8f.30.1734371063189;
        Mon, 16 Dec 2024 09:44:23 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c46sm8892338f8f.71.2024.12.16.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:44:22 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/4] oe-selftest: devtool ide-sdk use modify debug-build
Date: Mon, 16 Dec 2024 18:43:06 +0100
Message-ID: <20241216174406.3128556-5-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216174406.3128556-1-adrian.freihofer@gmail.com>
References: <20241216174406.3128556-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 17:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208789

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8d80501becb..fb9d7966eda 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2533,7 +2533,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
 
-        result = runCmd('devtool modify %s -x %s' % (recipe_name, tempdir))
+        result = runCmd('devtool modify %s -x %s --debug-build' % (recipe_name, tempdir))
         self.assertExists(os.path.join(tempdir, build_file),
                           'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf',
-- 
2.47.0


