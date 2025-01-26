Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654C4C02191
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:48:23 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.29395.1737895694720345788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 04:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNxQppwP;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43624b2d453so38412665e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 04:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737895693; x=1738500493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ctn7NvOOTY0sZwX1b2/2TR4cWSg+Kh59AnRbU6xPxI=;
        b=nNxQppwPbZjg2YRIlLPUZz+YPnfUT7RWLgyGlWOhE/X7XLQxSGAn4YMHoON4cMmZof
         SON2cmhzWL4FwL3emTsc5fuEMKYeks94SvEZDqWeFnbXSwWwgtgvxttUb4Gm6GAzOoxb
         mlLj8ZHh95RhrnMpERrGnQe/sOZ2UsMosbZX/m5vYjbJR7QBHnK36EKNQ+WeLINpzpzK
         QksALoDcdL2kavdIW4YOCUtOybLz9N0oRVitF2ahAx7ODGkQgZko4kBYAaabER80FGj3
         Z1P1SJBkgWddSJtUAaV0RtUZ2KuK7YGXaib4EYnnZ6G7aBgKyaboVqqRheKZdx8wqQ+l
         dQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737895693; x=1738500493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ctn7NvOOTY0sZwX1b2/2TR4cWSg+Kh59AnRbU6xPxI=;
        b=Yhj/aM/j/n1aELj26MQxbc7sdH4tjKTQT7t1/3Exli7qkVLYT4cU2Z0MsbXmKM/a9/
         RsMwGZhV4SAESNFhWwsIkhzQ9xUhRCxMmj5oIFXwJr1lS+3BTilWlyybGGgALRNP6w1F
         6Ap0mbN43oA4Nwg2rcdu5C9gbyndwMoWF0acskDzigmnISHXzLK8lv9GQ81SAuOmGnc+
         9noBJRvNZptup/CGpDi/EMplSaUiS/OGBFHmoNqEuzQCzA0tSH2QmikwOIigLzebJNI7
         tWbTp3be9zUDykWbFYEiGvU2O4HqbmAlOwntVkrtJnk7RoEuKQeqSOquobtDC5CDezDn
         3wlg==
X-Gm-Message-State: AOJu0YxM6DwT5Z9Hrl3BSp9qerqhfTUXUTmqo+lJ6vErWr5S/I4f9G/J
	O/Vv7+OiQPyRCYh/UQYL+MXAjAOZVzX+bqB8mF7uXjHGCTajIHBHgUaKGQ==
X-Gm-Gg: ASbGncuMThMkp0foAKG5CHE/v+CsB0u2/pQSPgjwLyxL2ddcPUlian3SEp2Qe+YSxuO
	UU531NGlk3ldEnaZBRsF/8TefNnqxt5M7v5yNe6l3NSYfgZdzAvLf7ByAWo76QK1BESynmqr30j
	T5c751M5scBnzoiRTD1odX7PdT8ycMfXjn8nGabqdQPUmQpCMH2kWofhIbeQSsBv7F/BDTYfa2q
	5huxPvtIfQtT7KSuI2gMOMTQkaoEeNQkkqyCMZxSWdO53vF4eEe2IyOGKWu1JByBT9lXcqp+IcI
	vMuM+xefJVRaPll+7R2Eu0B7vx0=
X-Google-Smtp-Source: AGHT+IGwxKYwN/R4sqtw2Y55VjybSxbCBArOxW6meZzlz9lTIuUMCAjzWL5VkKeiqozndcoa9TG5tQ==
X-Received: by 2002:a05:600c:1987:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-438913f2f4emr368750685e9.17.1737895692702;
        Sun, 26 Jan 2025 04:48:12 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a906sm95938295e9.18.2025.01.26.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:48:12 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap,styhead][PATCH 2/5] devtool: ide-sdk sort cmake preset
Date: Sun, 26 Jan 2025 13:48:03 +0100
Message-ID: <20250126124806.1453644-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
References: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 12:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210281

Sort the keys of the generated CMakeUserPreset.json file to make it
easier to search and compare.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/ide_sdk.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 65873b088d..eee5425aa7 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -493,7 +493,7 @@ class RecipeModified:
 
         vars = (key for key in d.keys() if not key.startswith(
             "__") and not d.getVarFlag(key, "func", False))
-        for var in vars:
+        for var in sorted(vars):
             func = d.getVarFlag(var, "func", False)
             if d.getVarFlag(var, 'python', False) and func:
                 continue
@@ -545,7 +545,7 @@ class RecipeModified:
         cache_vars = {}
         oecmake_args = d.getVar('OECMAKE_ARGS').split()
         extra_oecmake = d.getVar('EXTRA_OECMAKE').split()
-        for param in oecmake_args + extra_oecmake:
+        for param in sorted(oecmake_args + extra_oecmake):
             d_pref = "-D"
             if param.startswith(d_pref):
                 param = param[len(d_pref):]
-- 
2.47.1


