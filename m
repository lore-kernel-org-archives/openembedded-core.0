Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F2FC021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:07:31 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.7901.1740582447598431946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:07:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAIoW/Mf;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: colinmca242@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-8559461c2c2so183060139f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 07:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740582446; x=1741187246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yaBp9RWwWBExEtJvIXxM293HGmLN5BRDZGG1judENI=;
        b=lAIoW/MfhrFlaf/ipv2G1/TzYcu5NUIrfJeleb5LQlHFEG2zhKdJb3D9TFU7gL4cPZ
         CnB/oJW8/YsxkYu85WbuUjfXHYApJTCly/+Rt3nRwiU/bzD4+BJ0VUijPv4YUJ00xb79
         ciCVT84WXc8GVRsKEFGTqGaNx1zSK7Pqx6eMTom+Q4BgbqakQCl+/tfqbVVznj+VljrV
         aSw3S/NoCjVY32hcA8OZKCLdiOMR7Efo9AVbI3cFCBmW4RzH0cC1JKDVxJsEiXAjqa+f
         9QhCyQOgtEpGuxp4cqpCL9IaejRtMgjhmLUbIk9CgyfpIS+RpVQ15jab4eiwjODaPPNa
         Em+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740582446; x=1741187246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yaBp9RWwWBExEtJvIXxM293HGmLN5BRDZGG1judENI=;
        b=BRtkhqiZuIGSTazufFLRzcq9Qcn42v7iUkeQ91E5TyRShs8B0gr3U3gpZEXuISkheh
         7UN9TKrzYGvuxwpVCsFJJKMHSsY5M/GeeQBup5/dyt0+iOd1Evx9ooKaan7nQuGz2uA/
         OOWY3CZhH3aykVNFkTVGl+flVckU0FhzLTnColisb4fOIoUgJptKxlpUh2Elqymgi+kB
         0e0/g65SUsIbjYNz21OBdC58zsuVRgHYphUg4J4qolWyYtN8sTh7TtiK69Dpa4zGAakN
         8k77IzQXHEI/5OOmsAnJ7NubHILRuW9DG30dqvb81bSl41T0iJiay1epeyxgYvxYPqIN
         qSVA==
X-Gm-Message-State: AOJu0YysTOMU6a8VmcZpHZJrs7Pef/xCA7kJuC3trDr471uZZeWteyA+
	q42Eiud+/2VlIyaSTI8BRUHdbC09SZQzFPYQ4/TUXwjAMSjw41cdQKonGA==
X-Gm-Gg: ASbGncvowok54tqgyxNSOHRw+uLAd4oEEieVq42lVEtDeNeI6neNzEdBelqlqef/y7X
	+8f+RZuNdULTB4otbN41XW5ueg1CcWbLUP5ajbilxWJM6XpVAx8hLTp8o3R1tCB/eaGNnLWwIUT
	ESx607iQP70DCs72M2URUni31kVqtBY8CfxgVZsf13Ow5OpArRYAyYL8H7Ngs6dR42DYutZ7DQP
	O7eFqQEx+1ILUQPFFrTI8iCBiZPhSoS50e/C7wuhJrBBMLaJSXVt2LoyU2Jhchua6sQDeIcpRtm
	Z6paFxubObhIAK1f5XlmVZiqPw9Vdj4XtAhbZ+45
X-Google-Smtp-Source: AGHT+IFWn7tnj+jAIO+V+kmr6own8aizzFZ2aCJLEzUns4TS3xF9/ORPplkvas3KNb2XfYkBH7hs7Q==
X-Received: by 2002:a05:6602:60c3:b0:855:2919:17d4 with SMTP id ca18e2360f4ac-857c176fd27mr450114039f.5.1740582446142;
        Wed, 26 Feb 2025 07:07:26 -0800 (PST)
Received: from monolith.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85620aba34esm75044839f.33.2025.02.26.07.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 07:07:24 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH] cve-check-map: Add accept-risk tag
Date: Wed, 26 Feb 2025 15:07:20 +0000
Message-Id: <20250226150720.143127-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 15:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211961

Adds tag for downstream users of Poky to accept risk for CVEs.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
Upcoming cybersecurity regulations allow for CVEs to be accepted on a
risk basis. This tag will allow consumers of Poky to mark CVEs as
ignored with this tag, which will help when feeding cve-check output
into compliance documentation.

This is not intended to be used upstream and the comment tries to
indicate that. If I need to be more explicit in my comment, I'm happy to
send up a v2 patch. 

 meta/conf/cve-check-map.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index ac956379d1..ef3aabe641 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -32,6 +32,8 @@ CVE_CHECK_STATUSMAP[not-applicable-config] = "Ignored"
 CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
 # use when upstream acknowledged the vulnerability but does not plan to fix it
 CVE_CHECK_STATUSMAP[upstream-wontfix] = "Ignored"
+# for poky consumers to use when adding justification for why they don't plan to fix it
+CVE_CHECK_STATUSMAP[accept-risk] = "Ignored"
 
 # use when it is impossible to conclude if the vulnerability is present or not
 CVE_CHECK_STATUSMAP[unknown] = "Unknown"
-- 
2.34.1


