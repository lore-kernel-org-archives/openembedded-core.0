Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30243C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 18:55:55 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.6341.1744311345643345333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 11:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L7DDnJ1+;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c554d7dc2aso179110585a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744311344; x=1744916144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KPSm7d2WwRCB+ehLblmE+7hXRqPc2E9CBpweIRNrCM=;
        b=L7DDnJ1+Swq8AwubRWqOurkshkSYyuiDdeLOnQLc74D5yAqzEKyKncoqITq5HXyKnJ
         fjUmAH6gmNsG3NyFBxI4S0lwkDXNTIg38mlErIWkQ8EZ+w1OwW5r0bc3N/Aq+e0C8jgx
         SZPgcC1V1E/XvPCQz4/79U7yPXyG8qzVfHbr619a0ER0teAWgp8NzYTp9xuFvK/Dtx28
         ZnAujaoSS7Wm8UPFHM+nDcVAyyck0rjTjikbJwFciiFdkXW6S0q3KUe6pcIeZ0q/Bb3H
         O4FfKNXHdf8nFZY3xUUN2UZJ5Fl8wBehsWVUE3a6tTznfj2dplXMoKRUbPgpyPybupLz
         oAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744311344; x=1744916144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KPSm7d2WwRCB+ehLblmE+7hXRqPc2E9CBpweIRNrCM=;
        b=LBgXWpDUe70BSCKeskqQxst4Q55YLuxd6JzPddpg0TR3oMVPgpsWX9BJt0tEvWhIL0
         Hm2VM2L99xVvTIFU161TkOfzOddy1uDYKcQa06TY9Y9Nobw1XoIpT2ls9/ZCP7Qzy3E4
         qoU1lN5CkYgzQTvFy4+utSKirG6u7CDnH1DTAEfwNOiR47hvpdQVrxn4Kiq2Eo3DrNdV
         SrXO0k95N/VyOnIttTvl4AQlH5TheE6ruIO/B37gPs4perEhNwNFGAAzlv05wkrJX4hU
         klf6Y7HViqdfmJE8vMyd95xcuwpBTZu4MwUsuVbmvnTaIpWIAAwMgrBYZjgnujMRvefk
         O3/A==
X-Gm-Message-State: AOJu0YyCJF/hshtpitNKmjsG6sUhjGWnx8ePS1ApxvT/lg9r9acUN54W
	Gr1W01LG7njhwZIKmdWKjQwmEdx1ZKDqBF0hvzEgUvRQmFtaA40P
X-Gm-Gg: ASbGncvd/hmrgwcvEq399Dcq4tmp5wuiFDxeHufI6R4IHVMzzUrvOSa0YAGEzGcnLPQ
	sIZDspCkdP4RApJ95VpPYOTsNSd3cK5ptCMF+o8HRDZu6eoOurnX1+j1J4QEFn1WuHDMRdIeriv
	IJgmnW9J8wKFg3jEIY62LjsUIcZfiawvVwRmpBK992EezE2m/NbII+ih2Pv3FZUceMvQS51DpnK
	a89XG6HyD0RhGKHk141sFHTojJ2nKmiGWIMMZCTYirKjRssGjp0GHYZj0u6GxniwamGKzHbGtbQ
	bI422sEdoj0Y9I4OLwQsly3iSW6EvPDuAQ7Z/3aWR7j3w/jumWLXO39ep5h29RQ/lw9wFSbG+uZ
	iM7Tw5YYCDECecei5sI0RQpe9HAc3JsHYnGRZkmmuXA==
X-Google-Smtp-Source: AGHT+IGZMUDImKgSkYw7M1cgpBVf2cvp2vYerev+FnRwV1AJ5YXsWgEloSdqjHMXfYJutBP0EZ9EnA==
X-Received: by 2002:a05:620a:8397:b0:7c5:4dc4:ae48 with SMTP id af79cd13be357-7c7af11f998mr11671085a.39.1744311344615;
        Thu, 10 Apr 2025 11:55:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8942eadsm134956585a.5.2025.04.10.11.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 11:55:43 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] kern-tools: allow comments after configuration options
Date: Thu, 10 Apr 2025 14:55:38 -0400
Message-Id: <f78f402c3f8fc1a0007b92051e2448ea19c3288e.1744311165.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1744311165.git.bruce.ashfield@gmail.com>
References: <cover.1744311165.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214696

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the kern-tools SRCREV to allow comments after configuration
options.

Without this update of the regex, symbol_why will incorrectly detect
that options are not in the final .config during audit.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 9f30be01ff..6dd19f1f09 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "bfca22a52ec54c77ed0d34a56338bc1fe0a3b0db"
+SRCREV = "c8c1f17867d0cc7d04be225ba4901f2373428be2"
 PV = "0.3+git"
 
 inherit native
-- 
2.39.2


