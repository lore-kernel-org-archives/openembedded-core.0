Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3FCC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 15:13:50 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.21941.1700666027815299069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 07:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FGhmP53p;
 spf=pass (domain: baylibre.com, ip: 209.85.208.177, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso82489241fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 07:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700666025; x=1701270825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvpEbtippBQN5k1hXZocBdDkF+owThY0h19DF6jdr8Y=;
        b=FGhmP53pYOru9T9PJ2L7ywraXrv0SFxm6hFREOHl846Xwuk+hxZhupbyOyvtCcr6P6
         aEcT0xFCKxECmlsYmgItXnx/mMdJod3mO2RDuOQRxYEetXVqgsfdqH9A8izS0TOL/Zbk
         Tqx5swuu0o66Ldh9txZ32seVee3g7U6MoSJVgAVux3gfpf2XIpr9BV+Q6SgIxAmammLQ
         BIw1iyAWhSOnWtYLHhJVObqL0goQSpI8MocfGFwYjQQf2qFlkGqsRJGLFlcMU4190oLc
         JfquL3pt/KTmMIcW66cfAkcgP4A3M+990xpfQNOMgh30IUO5+CGevomdSvRUK7TVZNPv
         fdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700666025; x=1701270825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvpEbtippBQN5k1hXZocBdDkF+owThY0h19DF6jdr8Y=;
        b=FfLqiSmvjG8JznG+eMEwcZdwa1eIzYAyRMkaBr4xA1pHrv+lEUgJlVguMfKM4yzFBX
         pHbghrMbHcaR6F+utmXHe9rBOSEJZLW4EeMtCP9CnoQJ+exnfD7RyuWBfqOGfE8DNBLG
         noLEbutUO5RcByhx8NuUQSVOfCaDqGp6l+g+Nl7zG/X/NzLP/U6ZaQt6HcpzZeQqDyZ9
         32FKJ110gT/D7IxEqw+ftzUhhAWapSYLlVcPnauKXXvRwrAuiQ9F2WhHFB2Jd9vOpUkq
         NlAxyp37e01RrzyuSNX/qXlebG6FxTnIZ3mvZvn0Y0zLxjhIL6b2mFLWX0jpI03k/rki
         YKXQ==
X-Gm-Message-State: AOJu0YxAafGmoqDjRbdEJQ35VpadTMYZPLu7hRiWZWgnxtVKS4jyNnvW
	CxGhKH3zH8iSxGKYQTpznSmSSi3eNXENwZXoFa3NXg==
X-Google-Smtp-Source: AGHT+IGGKQ6jWv2Qu0ukJEdkukgOT9N0Rj6xa3dQYriTXOurcRrPcibp5QeDC1M5r6Z5gVAEBIZrzw==
X-Received: by 2002:a2e:9d59:0:b0:2c8:71b4:f8b5 with SMTP id y25-20020a2e9d59000000b002c871b4f8b5mr532710ljj.48.1700666025281;
        Wed, 22 Nov 2023 07:13:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c4ecf00b003fefaf299b6sm2503237wmq.38.2023.11.22.07.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 07:13:45 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH] bitbake: fetch2: git: add missing destsuffix and subpath parameters in docstrings
Date: Wed, 22 Nov 2023 16:13:39 +0100
Message-ID: <20231122151339.967674-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 15:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191111

Docstring for git fetcher is missing destsuffix and subpath parameters,
so add them

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 bitbake/lib/bb/fetch2/git.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 27a0d05144c..8a76cecdfdc 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -48,6 +48,14 @@ Supported SRC_URI options are:
    instead of branch.
    The default is "0", set nobranch=1 if needed.
 
+- subpath
+   Limit the checkout to a specific subpath of the tree.
+   By default, checkout the whole tree, set subpath=<path> if needed
+
+- destsuffix
+   The name of the path in which to place the checkout.
+   By default, the path is git/, set destsuffix=<suffix> if needed
+
 - usehead
    For local git:// urls to use the current branch HEAD as the revision for use with
    AUTOREV. Implies nobranch.
-- 
2.42.0


