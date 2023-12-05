Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132D1C10F04
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:56:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.102646.1701788207840589358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=P6mHyx0G;
 spf=pass (domain: baylibre.com, ip: 209.85.221.43, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3332fc9b9b2so3850019f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788206; x=1702393006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+F67wpL35q/ZKAODwIUa1poeIOQktkVrGJ+0bl7lno=;
        b=P6mHyx0G4DDbOoFa+C2CB/jXvvQbvTWs/eW3VKqSIhcq9UGU4WZz9rBXWMha5lMzxY
         0YjmEnMpr64V6ngxrHvemMT0S9SGV+ScVQ45xOh2V9Rk2gclSeAcnqQHUoktueV3isSi
         Vb+ENC2RNDW2J3KOWrK61qJ/glRcyd79y5UqJ/Ykj7drOfaq4cjj37E/oWArUxEs+Zjp
         /cf3wySiD1bSopfX4xJ2IYDGuAU9b4p2IBgpdoL8nFrVj0QB9jgifsTB0LoihmBUrCPO
         QcbzG03nefM8ClMy7Dc7NoMfdWU54F8YyAIxw+VQJVZjaqJT/xFhfP0ZBf/WYI7iWml6
         oUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788206; x=1702393006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+F67wpL35q/ZKAODwIUa1poeIOQktkVrGJ+0bl7lno=;
        b=bz538++xgRuvJSJc6o95O+Or8Wm9lbEBMgoZAa+TFPfrRyRLizQpECzBu6yoHOnX2D
         ZOs4SqRLCF7IlylCJBXhoTabXFT4U3BmIk2W9McNKBBGtYY96ABvXb+0K84kWWk9XNEq
         8JbxFvbioUn0q3j9qj6brj2L6KXhrt9C3rSxA5F7KcwMVhJNF8CAWfoLEGeHhcUWB0E/
         +kr4A4+PkvwfmXHghnRtBzeTRj3oQ8GsXhGu+nTbDoJcEUeUGVh3s+lQvkcnJmArOaXT
         kd56tZJ4U8cl2eiAdRhjV/asR2LdZzpgD93LpvEX5Uv0FCBGjUZ0Qj0IFBPelbgHJMfx
         lEhA==
X-Gm-Message-State: AOJu0YyW4fOk51+YhHVVGfnD4zWjLkqgtwcMDyz+dY03TLy3JTa6lAiO
	iU9fkKqHEV2FWykONzsH1SAXuUa5KTz7HrsuK+LZEQ==
X-Google-Smtp-Source: AGHT+IHUUOoCEdeZafgID5+/tz2x2NdVh0z6iDxMPOmnfpAcSNSJqrdMpFQ8anowO69O0wE0eT+f/A==
X-Received: by 2002:a5d:61d0:0:b0:333:3117:c470 with SMTP id q16-20020a5d61d0000000b003333117c470mr1962398wrv.257.1701788205911;
        Tue, 05 Dec 2023 06:56:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:45 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 03/10] recipeutils: bbappend_recipe: fix docstring
Date: Tue,  5 Dec 2023 15:56:29 +0100
Message-ID: <20231205145636.960819-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191832

Add missing patchdir key in docstring description for srcfiles
parameters.

Also fix typo: value --> key in srcfile docstring description

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oe/recipeutils.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 0aa6d0593ed..01c9ad190fe 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -671,10 +671,12 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         rd: data dictionary for the recipe
         destlayerdir: base directory of the layer to place the bbappend in
             (subdirectory path from there will be determined automatically)
-        srcfiles: dict of source files to add to SRC_URI, where the value
+        srcfiles: dict of source files to add to SRC_URI, where the key
             is the full path to the file to be added, and the value is a
-            dict with 'path' key containing the original filename as it
-            would appear in SRC_URI or None if it isn't already present.
+            dict with following optional keys:
+                path: the original filename as it would appear in SRC_URI
+                    or None if it isn't already present.
+                patchdir: the patchdir parameter
             You may pass None for this parameter if you simply want to specify
             your own content via the extralines parameter.
         install: dict mapping entries in srcfiles to a tuple of two elements:
-- 
2.42.0


