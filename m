Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EC6C4829E
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 09:37:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.8034.1707471446469475865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 01:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gLP4B0TK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40ef3f351d2so10203585e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707471445; x=1708076245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8p1ybia84d/21vqEbW/ZHvt8zzN+2PNqQxBlVbwSBo=;
        b=gLP4B0TKBjotQLD5Hm681ktE1mFrR7XQSOVx7Xm613or4+zfdtYhncEB0Qeah0Fa+o
         xmNmlREUNk4mBEGXtZ0gM9+bFCmf7OmbLf2hSxAp4BMIhMJNgCtpGDkmEdsrDJwShpvb
         98Skd1x4d5G7nwHZYDinN555NLWGjiC5+d+JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707471445; x=1708076245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8p1ybia84d/21vqEbW/ZHvt8zzN+2PNqQxBlVbwSBo=;
        b=Bsrp0SRj1zI/WvZk6jHPVRxMJ36iNMi0SL6ZGH81aburKDycLnvalVx760rzRSXgJf
         stIOM37Dcx1q1dxbgeFqy0RlEyojvK8ssfWo+qtuH7nRBFG4xqe7pxSLY9gaZStYsNUc
         fU28fM9eZ/amPcAjSntyOI6z/E7RKxhJnX/slqCj/CxlUjdqo01RIJfs4VwT6ZsoXaJu
         hDhwAOSVCJMarv7KrEKKjqJ/NJ7qvrf20z+DX19AQ/pN0XYxczhoYe29HSPMlhHfgg8s
         CtGGya4thmT59TFivEGBx9AXor4qYZ5kL2gYT7M1n2ux6pFuYUasERyLOOSSLVjS+yei
         ex0Q==
X-Gm-Message-State: AOJu0YyUyccPxKpi6icSh0jXWzd9VHFbjVtRAvnyqYdAxuuKU/OYLe3I
	cuBnrWPujliWcJs76U+HKjSkwW+MgFQYUg1U9aOOsmsFkMA0ypUZQlc3t1mEy3ZRkRMYL8plzDc
	y
X-Google-Smtp-Source: AGHT+IEd441Vewsci0EMCTw3Evkdpsy7Glv4FoDF6M0pa4U7znvawrkcjyy9IRxHAGECellVJryfjg==
X-Received: by 2002:a05:600c:1c8b:b0:40f:b0d9:632a with SMTP id k11-20020a05600c1c8b00b0040fb0d9632amr490559wms.14.1707471444866;
        Fri, 09 Feb 2024 01:37:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:47e1:ee11:154c:e6b3])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d554c000000b0033b5ee36963sm1330764wrw.23.2024.02.09.01.37.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:37:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] selftest/recipetool: Improve test failure output
Date: Fri,  9 Feb 2024 09:37:22 +0000
Message-Id: <20240209093722.3363011-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240209093722.3363011-1-richard.purdie@linuxfoundation.org>
References: <20240209093722.3363011-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 09:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195193

When the test fails, it simply says the file doesn't exist. This isn't helpful
so improve the output.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 9deafcda0d9..6a8d0302f71 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -459,8 +459,9 @@ class RecipetoolCreateTests(RecipetoolBase):
         os.makedirs(temprecipe)
         recipefile = os.path.join(temprecipe, 'meson_git.bb')
         srcuri = 'https://github.com/mesonbuild/meson;rev=1.3.1'
-        result = runCmd(['recipetool', 'create', '-o', temprecipe, srcuri])
-        self.assertTrue(os.path.isfile(recipefile))
+        cmd = ['recipetool', 'create', '-o', temprecipe, srcuri]
+        result = runCmd(cmd)
+        self.assertTrue(os.path.isfile(recipefile), msg="recipe %s not created for command %s, output %s" % (recipefile, " ".join(cmd), result.output))
         checkvars = {}
         checkvars['LICENSE'] = set(['Apache-2.0', 'Proprietary', 'Unknown'])
         checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https;branch=1.3'
-- 
2.40.1


