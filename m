Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBB1C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 22:53:30 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.107064.1699484003472346800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 14:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i7p5U+aS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso205823b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699484002; x=1700088802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RrIzqpm3upKMlVcpXdbub15rkifbC//H7A5gw16hMw=;
        b=i7p5U+aSvmUMrNS96GuZe2jtUXk8cQEJkL68AXJAkmPd3Ra1Dme10Vm94zUIfLSKw7
         NymAq1Nz8vQEFEQL6p3sp0YC+wfwQ5soUQB5761X3XYw2PIVNzwE48DJfqWmkhIAehSu
         RJYVxASeLNPdGO9+wYdehH1RvtQ9LpwslvGdjlncroM/REYqtyTUI4TOYQOm1f8QyRad
         NWGY0ArJJ5mgHT7gPllOYOTk9vV4YYtcSVtW3odqNyWhMicMJk7TBOnAhdoeVj22rqf7
         gt4vLJXq3nXAXJwNJsVBh3sQP3LQ8aYzjmPhtPXemePW4exyLqNDHNdG+3MeuiRgebJq
         nTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699484002; x=1700088802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RrIzqpm3upKMlVcpXdbub15rkifbC//H7A5gw16hMw=;
        b=ltYp3FHGGL1dGPcKiWk9Yn0OX7ORRvl85i7NqcSzFznKiN76SQson8wSJSFoPnOfGc
         6tX40qgX1ZEkRGanwU+IGn0jtMgnCesRHe1vN6uW/dObNMlAQ5+MOFFHmRhvMQPrNofI
         t4y+Nw9wpas48hWpTcsAqWaDqWuwbOvToyIyFSzBRXxsDq/2mkFjFSWyaUL2Ho8STwU0
         QbfmnkXsE9M/RRD6RH2Pv43lDcF14qDZ5NfUK2na0ta6G495ZP3u4fL2DjwVqfc1+Dvv
         pzzt3/3heIL9GgPYUbZH0Xu983n4DJ12hUW/bY9j9H86xEq/VeBF/gVhL9EnQunAYjFS
         fWMw==
X-Gm-Message-State: AOJu0Yx9gSufhXHLTw86SgOU/P2gdkbIJll3e5UenDZ0PhBg8ynKu9xW
	JTpQ7JhNxCHf/TW+ddgv4rqR9NOnWZSV87L5PLdgAA==
X-Google-Smtp-Source: AGHT+IGeoGxThRIfLjDmu79m20fNefsTJ2BcD1n3pCG4305tvrF3zbCFaB2bgpqK6Xf0gU+D6AdD+A==
X-Received: by 2002:a05:6a21:33a9:b0:184:9f3d:f7dd with SMTP id yy41-20020a056a2133a900b001849f3df7ddmr3459005pzb.29.1699484002204;
        Wed, 08 Nov 2023 14:53:22 -0800 (PST)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id du4-20020a056a002b4400b006884844dfcdsm9467883pfb.55.2023.11.08.14.53.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 14:53:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] cve-check: slightly more verbose warning when adding the same package twice
Date: Wed,  8 Nov 2023 12:53:04 -1000
Message-Id: <4b449d5dcbaebb0690a55cf45e3a735c2d8df101.1699483825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699483825.git.steve@sakoman.com>
References: <cover.1699483825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 22:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190363

From: Ross Burton <ross.burton@arm.com>

Occasionally the cve-check tool will warn that it is adding the same
package twice.  Knowing what this package is might be the first step
towards understanding where this message comes from.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c1179faec8583a8b7df192cf1cbf221f0e3001fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 42a77872e9..2efc4290af 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -159,7 +159,7 @@ def cve_check_merge_jsons(output, data):
 
     for product in output["package"]:
         if product["name"] == data["package"][0]["name"]:
-            bb.error("Error adding the same package twice")
+            bb.error("Error adding the same package %s twice" % product["name"])
             return
 
     output["package"].append(data["package"][0])
-- 
2.34.1


