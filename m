Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B164CC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:12:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9139.1678889519080699794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MZkTtJBu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id bi20so2752367wmb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678889517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2l4vtTVyd1h2E7btbLrdFZ7Bl4zsYGCXDvkLLjKcoo=;
        b=MZkTtJBuc1goY1r/HeoZG3Ph1NBF67g1WFg8byQ1fFVpsQGdx0NKgAcfoI3bwiQIz/
         n800U1TeLoXy2YdcrlBCL3vX71inpGgJX5OptvHbk0zSduDbvWrMH/Rki09u0luFbdF4
         7jnqB20+U99qnq3upEUtvEmXtcwHxV64IZr1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678889517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n2l4vtTVyd1h2E7btbLrdFZ7Bl4zsYGCXDvkLLjKcoo=;
        b=1pKYrxurormvWxsoUr/21t7NHJrJbBgdhBJE2GQxJjFe7Zv3I0ppAld+8mhlI0L8kG
         Pa/JQOZmpZf5KygW2R+oDi25SWyGWWWswtAEZ9mJHj1OrH03jzSv2pBb/85RL6oxo7Ce
         pL4bMPYEvsixXC89t9FG/fGFKvJQp+z56nEacJlSAaGOjp6lhNWW9AzBem+DtHG3UdJ0
         qxJuUR0bhuKsd/Mx0v5Ea0CXbchqzJ0Ca+uiFgOmheJoBWO2uP3pGDZAMwTSJaCc85s+
         FFPSq6ImC7Bwfe+BauQMbBaANCChZ3cAy/2m0kvEouWjtrZTNHrj5QkvB5e2epJppjX8
         cVEQ==
X-Gm-Message-State: AO0yUKUFbT4ETE2Kn9BCnWJfKnUXMHs3X8cuSNSJF6VEIozlDprXiFZd
	YkOdGimp5Bx36WcCOfEVuVwuHrwgvIw0bGiAQuI=
X-Google-Smtp-Source: AK7set+T4ZAFDQXU27bEZOZYq/ZO1MuY3Gu8f2WQdfiS8mWQuSDLDGN0CVDOmAjbWDoGpTTpm6jNBw==
X-Received: by 2002:a05:600c:198f:b0:3ea:f6c4:5f26 with SMTP id t15-20020a05600c198f00b003eaf6c45f26mr17531518wmq.17.1678889517298;
        Wed, 15 Mar 2023 07:11:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ec68:35fb:ce4:5d63])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d42d2000000b002ceb7a11eb9sm4764269wrr.42.2023.03.15.07.11.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:11:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pybootchartui: Fix python syntax issue
Date: Wed, 15 Mar 2023 14:11:56 +0000
Message-Id: <20230315141156.4121259-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178575

Fix:

scripts/pybootchartgui/pybootchartgui/parsing.py:134: SyntaxWarning: "is" with a literal. Did you mean "=="?
  if pid is 0:

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/pybootchartgui/pybootchartgui/parsing.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 362d5153e84..63a53b6b885 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -131,7 +131,7 @@ class Trace:
     def compile(self, writer):
 
         def find_parent_id_for(pid):
-            if pid is 0:
+            if pid == 0:
                 return 0
             ppid = self.parent_map.get(pid)
             if ppid:
-- 
2.38.1


