Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5716C001DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:30 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.26522.1688656049645525971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5Mfk+RLR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b8baa836a5so5081075ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656049; x=1691248049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6zYdKm6UugVS2wQHdCacweCmZrFqTxGF/Ki0lM40LI=;
        b=5Mfk+RLRXr6WHz+segHXHlmecUWk7MQN31tYsnl7iTnGq5sde3kYMr8qAJfjWPhJC0
         DWig0YUzfvt0P6RngB9lOhJPiHHhPh5SBZFhMqMTLS4Lu6mDW59+jhJBF3oTW/SLg+IY
         9eQEmmWBzj3I4qrY/O+RlPWa3kDGbSlg2vy58djh4ZtCYeqnkfisfVysMl8ltIYYrsdg
         JBdPmyVP+6wE7aIm1CtpKV8hJ38kmpY1ybsjT3qCaARvzntBvuG4mKxhUClR5YQs2pop
         e/RTHQ2nB6X180KYVL9h2Dq3fLpMGWoc9FKRLtZgpxzOqIWjvcAnxFw3ovZ1Bk5q/9e8
         08Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656049; x=1691248049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6zYdKm6UugVS2wQHdCacweCmZrFqTxGF/Ki0lM40LI=;
        b=De3vNGRKLMAfIcCOPW70a9K/NrHmXiu+euzWQ0xJrMQjZp5y6Oi7FKID9VFOORGtI+
         9cALiHG4hQfT8iL3gxoQQrEixfT8dm7pm9+5xFXgQ3zF8B37glmtGHXMqh/CsbtGLmVy
         MJ1jv19uZpYLxDKIgOZnEHm96IpN/MkEMYK4kluIiuR0f11nzGY1bGokHCVvV9FjlrMY
         hFUcth6B5HqzSHdMu5T8pc0P8B+Ubsg6D1Cuclimow1vJHFee57w3sCWVKh/6Xlaissg
         zPOAYuR7tR1uW77kpgsYGAro33kIKq2lkYWC6En/KvaLTr3MpFK+H/4wqm+gpOor93nT
         LnrQ==
X-Gm-Message-State: ABy/qLbkkNqvEy171TOaZTxY/73aorzSRXABtDEHaRojSeHdt7E2APvM
	0jm+LvzlyXczdvVFl9IVdqIOGFenBqiwgor9nGc=
X-Google-Smtp-Source: APBJJlGQEDnRMeOLdqtnReYE1xNCExL9QD1pQovAHDDyyp9/skoII71ZctOBEILYugd41kvgvrAelg==
X-Received: by 2002:a17:903:32ce:b0:1b8:7265:9289 with SMTP id i14-20020a17090332ce00b001b872659289mr2556793plr.13.1688656048675;
        Thu, 06 Jul 2023 08:07:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/28] devtool: Fix the wrong variable in srcuri_entry
Date: Thu,  6 Jul 2023 05:06:27 -1000
Message-Id: <1487bdda6b443480e9ce45d8b8527ad61c2a50a4.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183977

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
index e2a8335a62..7a005c9010 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1628,7 +1628,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     else:
         patchdir_params = {'patchdir': relpatchdir}
 
-    def srcuri_entry(fname):
+    def srcuri_entry(basepath):
         if patchdir_params:
             paramstr = ';' + ';'.join('%s=%s' % (k,v) for k,v in patchdir_params.items())
         else:
-- 
2.34.1


