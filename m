Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28723C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:19 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.30671.1668892563684850806
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dN8PB5AV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 130so7926429pgc.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJzT/GzkK+Ke40r3eUMpEkr+SkOnILhR+E9lrR5C/Is=;
        b=dN8PB5AVLDOqLf796Y28j0hZp0gEiI/XFWRreGJc+izZDFqyPiUyTACBjJqf5xCt+U
         RpHFbTWBAU0cs9Dg9hjbUD7mRktEC8Dd6WmvrzUhPJV8ypixQWJhsQUbQv1aOMRXEy1J
         p8yGgRBtRtRMaHn7gmqR9vIgNgNcpQJ7Bgc+Dth3cohOyNEqxIPI0nJ3e/xcaWDhRF3z
         TYMf0hzwbBB3r42X46mDXz5PooGISiBOw6mtt+ncpoaSYR80qiFgpBiQRXYL/YSjXXjM
         0axfirCPNg7Yzwiv5nnrtYqOws+etHoSIWwXofJm2CLz9My/nYcgsv+VfYTrE28aY2/n
         Oo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJzT/GzkK+Ke40r3eUMpEkr+SkOnILhR+E9lrR5C/Is=;
        b=fC9krxiMRIdZeVSLXZp5du833a3zgr8FcbV+OxD9YL5289xGKe9J4j9D10Mf8UsEFw
         3UE1cuKaV0dc1wSj31/a08eqhEK5hr94zCwy6DAp+V9z1cFMTQ2wB6gw7tyDs6BOjZjO
         uNWLj1ROfJyMF2P0wXytpVtdyfN+NcsZlRzWUk36RX5v9KUfF8e6kG4CLPpxOCiT6WfV
         KbvKe8hRsJijNrcLEEMhP9CR7vNP0Ez6vnFjEHBpKvu9glxLGVfs/tjEcNU1JPO/TrLy
         r7oVC3Z/3/q0JadfJQ23yLG4mTCl1FR3gVpYPyaGo2heQn8tn3Tr/vkRk8EZ5Q0fiiKq
         jYBg==
X-Gm-Message-State: ANoB5pnaEGuOQsD/YPMAOEq2gC67q8TE2reAwbsh79b1n5Fn/rED0G6l
	03kA6rJ1rGgyAvgA+uXeFDJe27YRRFR3zTF07aU=
X-Google-Smtp-Source: AA0mqf7mUS4zi1mZnDPfVSwaSVva4Usrsv4Oc7WhLiUNpxiioSiK7bM+VLRIKjLP4zJYS7chiCKwmQ==
X-Received: by 2002:a63:411:0:b0:46f:f4c1:7d34 with SMTP id 17-20020a630411000000b0046ff4c17d34mr12056451pge.75.1668892569749;
        Sat, 19 Nov 2022 13:16:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 25/35] get_module_deps3.py: Check attribute '__file__'
Date: Sat, 19 Nov 2022 11:15:04 -1000
Message-Id: <ede7452e6dcb202952b85b76eecbd2e1760b11e9.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173565

From: Leon Anavi <leon.anavi@konsulko.com>

Check if the module object has attribute '__file__' to fix and
avoid errors like:

AttributeError: module '_abc' has no attribute '__file__'. Did you mean: '__name__'?

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8acce12c1a4cf37ac312c92d62a6ae93a349dddf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3/get_module_deps3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 1f4c982aed..0ca687d2eb 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -56,7 +56,7 @@ if debug == True:
 try:
     m = importlib.import_module(current_module)
     # handle python packages which may not include all modules in the __init__
-    if os.path.basename(m.__file__) == "__init__.py":
+    if hasattr(m, '__file__') and os.path.basename(m.__file__) == "__init__.py":
         modulepath = os.path.dirname(m.__file__)
         for i in os.listdir(modulepath):
             if i.startswith("_") or not(i.endswith(".py")):
-- 
2.25.1


