Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7C0C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:30 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13208.1668953750517925500
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fQNoOynL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id y10so7238748plp.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJzT/GzkK+Ke40r3eUMpEkr+SkOnILhR+E9lrR5C/Is=;
        b=fQNoOynLLcA0csLE3+/XxTMk5xaMRe9WQtJOXz4Em0HRyzL2XixvPnGbIr6chx74Tp
         WZHW9v3RWNYgYOC7L4uMcrrL9oYO7JpaF8p8fkuQaAXJFGicAnt3jU0vCeGz/3lcdg9k
         L9mxfoDXDdKFamFofEsl5RTG3eQQ+msa64ZgupiL1VXgOoLO3RT4OH6dws6459HFWJlh
         XUnqeiy0gFr5X1piLQvaPPYmZcZh9sK7mf2fasTDSOjuaSmbtz+AbYCEmpelee53A9ck
         lz8v/HI2zulehQohtgeyeISx63mqKoAlmTmDxAND7iJuBa0fZvBb35ungBYng6bhKOo7
         rKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJzT/GzkK+Ke40r3eUMpEkr+SkOnILhR+E9lrR5C/Is=;
        b=vVTVe5Fcu+u+u5OfZ7a9goy85ijLsehmhW/Jl3gqlwfj+65ZFUTAm0lAEiFy/7Ryp2
         wi4gQpdXhXo3DbsO7yvqkMK8l8V0I/E1irlEWcWJs6D1J8OTw4gMQ43fdgL7kPE6s35j
         Fg7SiOtkbKsRJ7BXSh7ov65a4BzAdmverpL8/Pza+neM9n+xJJ8O0TFu9loyOWJiKlCF
         8zJhq5BabBAlTqYIRs9HlSvNA8bSd+RyqZuyoNqHc+pQFRmUx86+L+heKzS49v/MtDCH
         BIC4y8aj2SuHfIcapMFEXwLU7BEWviIFUTbHYXxdrqArB3sHg/U3LDeZ+pQ3Eu9J1kZt
         rNKg==
X-Gm-Message-State: ANoB5plLI4zZZZg2G3ksH2vEzTw+Q+3Nt2k9fUFkQB2IpYsk3JMAtkqt
	1XgwIczMY4/uFTbM0RiUAhM2MKJ53QGe3lWBvBY=
X-Google-Smtp-Source: AA0mqf6gErvXYpLMM0Qh8FYfrbh9S7RLWJXrud72Jz/qaQKNz561b5BBEbUFROf62W3pTHOFuXj67Q==
X-Received: by 2002:a17:902:ee89:b0:187:1a3f:d54b with SMTP id a9-20020a170902ee8900b001871a3fd54bmr8043738pld.9.1668953785707;
        Sun, 20 Nov 2022 06:16:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/35] get_module_deps3.py: Check attribute '__file__'
Date: Sun, 20 Nov 2022 04:15:15 -1000
Message-Id: <1684457df9fb7029a276df4438c8fc4a17e3e1e9.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173626

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


