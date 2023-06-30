Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC89BEB64D9
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:30:04 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.3871.1688092200405683139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Nu2vEEEA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-666683eb028so870875b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092199; x=1690684199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtNjY/qdCMT7MY6h5tVMX1zG24y36nTDyBpcwCNe8bU=;
        b=Nu2vEEEAvATBaQmC6UTPsijg4u7mBJe9ZGMUpBQu1bb9vm/vMq0n5PLLihT0phxkuu
         BXCmKnN7REY8UPbcuPp4MLo4rVcjfYZd4XwAZcSwVpzsJI3jvXlNjybRaiiu7mi7JVdj
         WaDQl7C0AQ/+/V5cX+CfLeTF3q8DKXk0hEZQOku5QnP3CR4a3jjYNcQforppK5ZgohFE
         R/pRg6ZwKkhLvpSZwtI/oNXUt0mAttXzEI3dKZ94v2uU00jnLBeNkGZTtHYTP88QKyFg
         QnnONEjHuc7onZ8xSqQqjrQQgA32fjoZH1DGbUAc45OvWPjbORHY8uTnvXW/fvFz+85P
         60dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092199; x=1690684199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtNjY/qdCMT7MY6h5tVMX1zG24y36nTDyBpcwCNe8bU=;
        b=JMy8DE9yIjPtZEwpvhqGns6tFKkgeGMBdwdxqnMnr+hT6JYc2iKvsGLlHkgPIXFZOH
         b4D1zwtBeybccbBZc92gH2NnxhESo/evc4YJ2a41j+v9C5/8f4NIOWdhn+IMb+8YpkqB
         gQGisxtq60JmhULBXDbSlti7OLDHumuoQ1wk3JqkQOwQkYEMsIKRpLrP04vnxrCBWCgV
         VGrDKutnQVHOwZds1yWQUTi5EQu37BwKnTc/Rnrl7fgv7VuWvG+WRFPDcxoAi4OaGJuH
         +eAW11LpOJy2SQwzYY68fZZ+9AqPfCAAZqO4Jd7Y3sYMoH6naHkVsYiu3Fm8A51ma7qo
         Q2FQ==
X-Gm-Message-State: ABy/qLYYsN2iCFQ9ecxcsmk6FZmdYFeYXpnVbXVUkDmJFbMvObuAMs2E
	iVXTK/W5Gq1vUri6FbDELY0hQmtkdHfrGVQdfdFovA==
X-Google-Smtp-Source: APBJJlGhq95gPgP/1k6mq2BzqAyr7WmXuILU9l7DZt+DEVRo8BCbN/xOuH1zhXz5M3aO3SUHZPl1Fw==
X-Received: by 2002:a05:6a00:cc3:b0:668:6eed:7c12 with SMTP id b3-20020a056a000cc300b006686eed7c12mr2055904pfv.22.1688092199453;
        Thu, 29 Jun 2023 19:29:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 29/30] devtool: Fix the wrong variable in srcuri_entry
Date: Thu, 29 Jun 2023 16:29:05 -1000
Message-Id: <6e9d2bfed4bb1a02b9ad023cb70cef90366f8233.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183669

From: Charlie Wu <chiachiwu@google.com>

devtool crashes when running "update-recipe" and append changes on the recipe.
"$ devtool update-recipe -a <layer> <recipe>"
Traceback (most recent call last):
...
File "/ovss/ovss_quanta/poky/scripts/lib/devtool/standard.py", line 1636, in srcuri_entry
    return 'file://%s%s' % (basepath, paramstr)
                            ^^^^^^^^
NameError: cannot access free variable 'basepath' where it is not associated with a value in enclosing scope

The input variable 'fname' should have the same meaning as the variable 'basepath'.
Modify the 'fname' to 'basepath' and solve the issue.

Signed-off-by: Charlie Wu <chiachiwu@google.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c3231756bbc2cb5641204414ad3670d7f8607ed3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 0339d12763..abf80e2f31 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1629,7 +1629,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     else:
         patchdir_params = {'patchdir': relpatchdir}
 
-    def srcuri_entry(fname):
+    def srcuri_entry(basepath):
         if patchdir_params:
             paramstr = ';' + ';'.join('%s=%s' % (k,v) for k,v in patchdir_params.items())
         else:
-- 
2.34.1


