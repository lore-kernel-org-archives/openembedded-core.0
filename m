Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6969EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 07:10:55 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.10591.1687936247315837602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 00:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=VXLuSEh/;
 spf=pass (domain: smile.fr, ip: 209.85.167.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso5885621e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1687936245; x=1690528245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WoqpBBHcUK7tK7MAFlI8ugBY9/ylE2RP3PmGJSiuiKM=;
        b=VXLuSEh/c1i1uh+liKU4JrZ6Yom8BXivBCzFTVmOwsMJxDKNgGFKvmuRVEFuX1bXmo
         8fhBruaXWLnAKQgrrS3xTLlfcGjZXMd9XqC5oSEUN6lIJVweiiKteJGZ11QuhIcMZ1US
         gj/xM/P1WIbb9ZcbcccxkxTj3GDzmoQ57af8nuDfw8/Da5B3mj9Mh6FHfg7Glt/F4U2+
         kIQ4jjpPf0hZinvsw05e5OcFhi8o1QZyQqu6vGpRALWZp65yLxvt9oPfjX3DOTKWqiKz
         VqHL7u2ySRr7Azg3qIi0nlyNF3jqelNnzI9m+b2gggP7H8LzRlORrEcMgTucY+CBVotz
         5mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687936245; x=1690528245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoqpBBHcUK7tK7MAFlI8ugBY9/ylE2RP3PmGJSiuiKM=;
        b=d5lW4Fq6n8mj27yeGfaLvUK0fxtaXG6hH/6966708LpZ00WpLe4S8803sQoHnp8o1e
         HcqVFmsuWW7rrQgFkw1erDJDlpDT6BYaGDXZyNiQ2Ig5d1w85DyxBEtDMmPTdmSBuPOo
         Laj+s294sag3GA6JTLXczeLKf7fykxHYwE/zIfcgv1lp77DlhzbNjmJNe/5YMQBVhoaY
         BOX+wlOW3ld9qMJIfnP9YwWO1OLcY7+3zGvsZh2v3/PI//9mvkAZ/JieZXYK33xYptA9
         UQ749d6o/qFVTNcn9yDdfU1sI+fMlTsEID2nBc/zEo53kRjY+Jju+R6IV7Ly12xmp5EV
         PduQ==
X-Gm-Message-State: AC+VfDzRb8/yTKh0K1lVbH6BFre2y6ez6nyLjmNMPfjdbDjMDQbUBibi
	TvNpYsG1UC0M0T5Vfim9PYkmGP5bvafiVQ3xgwg=
X-Google-Smtp-Source: ACHHUZ7PGMENggm/TUiJsE5XEhnK+HOZnNrvHtK5YvnZzqYiwoot+uOBNLrLo8SNAnCfiXDJmJtWOQ==
X-Received: by 2002:a05:6512:b94:b0:4f9:5ff6:c06a with SMTP id b20-20020a0565120b9400b004f95ff6c06amr14301165lfv.67.1687936245204;
        Wed, 28 Jun 2023 00:10:45 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([2a04:cec0:1003:a5b7:e391:4c22:e22b:1c45])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c020e00b003fba92fad35sm556119wmi.26.2023.06.28.00.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 00:10:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] recipetool: Fix inherit in created -native* recipes
Date: Wed, 28 Jun 2023 09:10:37 +0200
Message-Id: <20230628071037.1298932-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183544

native and nativesdk classes are special and must be inherited last :
put them at the end of the gathered classes to inherit.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/recipetool/create.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 824ac6350d..e99e0714bf 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -745,6 +745,10 @@ def create_recipe(args):
     for handler in handlers:
         handler.process(srctree_use, classes, lines_before, lines_after, handled, extravalues)
 
+    # native and nativesdk classes are special and must be inherited last
+    # If present, put them at the end of the classes list
+    classes.sort(key=lambda c: c in ("native", "nativesdk"))
+
     extrafiles = extravalues.pop('extrafiles', {})
     extra_pn = extravalues.pop('PN', None)
     extra_pv = extravalues.pop('PV', None)
-- 
2.30.2


