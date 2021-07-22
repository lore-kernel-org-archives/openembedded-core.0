Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.5679.1626947639872687603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 02:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=abtjVF9J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id c15so5261463wrs.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 02:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUTjq8ksnDPyeecKiYguxdnYS3qNJW52lNXw8StR0Ok=;
        b=abtjVF9JqHL9wE/XUk0s0L9vP//TCenQa+/PTHFPH4xMEfXRJ6NODtCbil2HM0qdjR
         Mf72GC5sjcZUQnDWtcgqx8zjcxjWsGzH2NDCOezLsKwRcoK6GwDvZnOZ4VeyoLaIg4WA
         JxSSrD4ZUv7iie7T3XfcmbtYSismMZi8OYrtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUTjq8ksnDPyeecKiYguxdnYS3qNJW52lNXw8StR0Ok=;
        b=PewFWWYqtBCL2gbwuVjFK9wJO6CCnyw+yQ5r5O9dNcRMrlsbwHtv2bM7Z8JulfDYeb
         5HsphLY+GGQaHLnGE22B8DeZsFNKDe+bVD0YMjb4MV5qGhqqZgbLIxHYv1aDlqBXuSWI
         BopLyoPRjH/6Smnk/2rWZ7pfMldL5tYtaVANSQ7BnsnGwfOZvNnq9SHWUXNEAiMefw9y
         Ln3dP2970oyUFMlL2ROlU+5b4/eRCTgT3/aox1jKz/pzCPrxVbz+nMOo2XP83BlbVMei
         R/yYwj4xMtzIj8z0GhrQCzuiwWlATOIIWIwDd5iUPhvnkTgnn/GbJ5awdWnUM4NycsYD
         6fgg==
X-Gm-Message-State: AOAM532u7YqZWuqy4fuAPRvX7gK4i1/TYQSjUgSxmP6IG1ie45ayoTns
	HyIRPFZdzUPnsgMp4EGw3VKJKnuVLR8EaQ==
X-Google-Smtp-Source: ABdhPJzeUZhkC78Imy1txuwX/Y7/ycp18lrv28qAWOXwszH9OskLXW0rzi0lvrSlJ1Wo3bECdrYtyA==
X-Received: by 2002:adf:f592:: with SMTP id f18mr46464520wro.179.1626947638043;
        Thu, 22 Jul 2021 02:53:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:40b3:3f27:e412:a801])
        by smtp.gmail.com with ESMTPSA id o28sm31323480wra.71.2021.07.22.02.53.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 02:53:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-check-layer: Remove duplicated code
Date: Thu, 22 Jul 2021 10:53:57 +0100
Message-Id: <20210722095357.3104990-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nicolas Dechesne spotted there was duplicate code I had introduced with a
previous fix. Remove the second statement since the earlier one is correct
all that is needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/yocto-check-layer | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 44e77b73d0d..05494e752ca 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -152,8 +152,6 @@ def main():
         logger.info("Setting up for %s(%s), %s" % (layer['name'], layer['type'],
             layer['path']))
 
-        shutil.copyfile(bblayersconf + '.backup', bblayersconf)
-
         missing_dependencies = not add_layer_dependencies(bblayersconf, layer, dep_layers, logger)
         if not missing_dependencies:
             for additional_layer in additional_layers:
-- 
2.30.2

