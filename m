Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47AE6D12D6F
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 14:35:47 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16702.1764772544757069881
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 06:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dUonb3zD;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3ed15120e55so4201081fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 06:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764772544; x=1765377344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zu1+4KBfxs/s1ry08+gseuwqjxNOMKxFuRZsdQGtzI=;
        b=dUonb3zDfANKbKXhnqKhJ75KpdZVNuj+n2E+wq1ls+5gQdbI6cilLXvkCdaSZs1t5q
         SQXtJo2/sObs6301NYp1C41ffOuIV5gqfLc3p/ixhhCTxGHdRzca2T5ZdUF9NPpS5+7P
         dIg5EIGg2pTeGcjOHdat5gPjP8be46AXFAsqZp8nSQkA1zJC1ZJ3U/e7xjPeUg3GaLIK
         QhSN9sILybaeCpDMtIk3M6otreVYNLbEE3xExTM9OVsYH/n9hAF6r5vDq9m6oY4xkAbh
         ZIghr3Yycd9IGANnhac4792vThwmKlxwEQI1HtGcTF8O7m4pjLSjjOR/TMTcHtpqAcHB
         CweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764772544; x=1765377344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zu1+4KBfxs/s1ry08+gseuwqjxNOMKxFuRZsdQGtzI=;
        b=AaQFXvyBD40o3VcviYNHeTGyVe0wcdRBynYNVsVvK5WhHIz8yCGbL0mjWVqXO0j50x
         SbHWZIHV1PANKkPmAMrKfvMTk0Czi10PKztmvnkDwVIoCsh5qeIQlhypIP6CQWJsGAJ7
         5plxoAlbAcDZw89AmIymL7ClOQ+75GESgpRgMbWqi6EMNQueGhnBFgH1+DTsq2fDrcb4
         XOGmhhe8iPAVtLoxMgjIm4iXN9eEgbS8JtY96JISHGlfi6gT7yOdf+DJwEtPv+nz60Ea
         QHuTnGwI6PAe38cb2dxj1htL8+0F2ev5ZbA43FFXuPHZ92cmjguJcaTd78cgpvLAvani
         Ubhg==
X-Gm-Message-State: AOJu0Yw9cR8zvgM9SR9pQ7JpNEGN6IquejPbLsXDnxYOE4dUZ9qTc78R
	SzGsc4LrGz70xttCeW1TY0VeZGeG6PdWNp6Ujdxy3oTDHZuiHEbn/GLcrc5EAQ==
X-Gm-Gg: ASbGncv7OiWti1KaqWH4ydfmpQ1MI8qCTbSiuWx+hEbHT8KcDPWEf2R02FFaoq5D6iE
	xueZA9RA1WyGVXeeVUInkHWlHEpfzBCf7NRQJu8XHBlMBnSptOkKIp2nMKfwgVU2B/q8GiTRx1R
	YZkQYrNqGOVmY5VAl1ZL73+OS/TZFjfqfEI+h76RVnWgt1Zus6zt//TvbiwTUmn4fX6L+dpmjJc
	3yrtmbF5Y5ugzYgUHtO1+EUNx84McVhxO7QB8TBd0cWf3ZpV/E1geWN2eAcv1URVmvuf125SFhB
	CQ24B0xpiXIsq2/OCgk2x7v7+GQN4Zm7b54L7c6tUoAHT7dKd9ikXDuYyJ6UjbRh7+oQUcKYXsZ
	4NN4EI0yaRZv8zQeI6LqToquq79HNh9nS7Bpbhp/B7KBsiW2RBJufH0Cjk+7W+DtC6lPdhav16v
	+XLsCpDo/z
X-Google-Smtp-Source: AGHT+IHAvk2d9Txzm2SGB1vaSUnuRTKPGJuyJCBI/dV8JsFdNGDp3zS7xv70spqrGoJ3B8QEvoaJqg==
X-Received: by 2002:a05:6808:c1b0:b0:450:b361:f48b with SMTP id 5614622812f47-4536e537701mr1183847b6e.56.1764772543860;
        Wed, 03 Dec 2025 06:35:43 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::c558])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-453170cd4a4sm7124626b6e.17.2025.12.03.06.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 06:35:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx-2.2: Fix CPE reference type
Date: Wed,  3 Dec 2025 07:35:40 -0700
Message-ID: <20251203143540.2765856-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 14:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227230

The CPE reference type should be the short name ("cpe23Type") not the
full RDF IRI.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 94e0108815..0ffaeba0e9 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -489,7 +489,7 @@ python do_create_spdx() {
         for cpe_id in cpe_ids:
             cpe = oe.spdx.SPDXExternalReference()
             cpe.referenceCategory = "SECURITY"
-            cpe.referenceType = "http://spdx.org/rdf/references/cpe23Type"
+            cpe.referenceType = "cpe23Type"
             cpe.referenceLocator = cpe_id
             recipe.externalRefs.append(cpe)
 
-- 
2.52.0


