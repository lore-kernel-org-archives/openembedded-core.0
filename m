Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A914FC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.16547.1741190336414661643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mUjXlnPp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2234e5347e2so144551095ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190335; x=1741795135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2UHh5KMu24PGIZtJ21ofxf8zqPLJ5B7ookhpJVtTU4=;
        b=mUjXlnPprzFDOQbPZdOaLY0RI9vPPq9U6zwLqFv0eTfojqEJOmsBmBFJrJf9ev8qex
         0qncDC9VPsL6RkVtRniApK6dN3CWH+3Vl/zHdlRRqlX/nQ6X+VzMvtogd1SjIL6O36uw
         GBla840X6LRegON4POnzlJi6qYirPAkPqazCWi+4KmWVkEhOOiHrlygbi6ibKVkMMGtM
         ekjStGNoamcJ8uNB+e36F8Mp3ArPC7OyBVTLA0dMOm7v0Q9KWj8+3QEPprR4pNn935h7
         t8bMxoHD/CY2aUcyzIeYROuDQ6K/r6P+wiNmdc/FGN3CO0CmuGfOMiZtz7IJKgAtv8HD
         a81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190335; x=1741795135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2UHh5KMu24PGIZtJ21ofxf8zqPLJ5B7ookhpJVtTU4=;
        b=B7ZbgwsL/zL9lg0q8QMh93V2E9Lrjeq/BoLftnrH1rN3wWLhXjzef8BbCSxd1JFxVn
         +LEyaHfICcaq5iIyOtVtcIbfeVb0qyFVnHjRBINsJyz3icVOEgZzfuENNWENkmtO/8GX
         oC4mznpOwm54mUI9v/LzIBEmpylXkCBKiuD8GppxqoCaPOw5purGDyfHc8pvmzZEjaZ/
         BRcbB+wHnd++nRzWnD6d1gAz4NAAm77XlgS2HESnYj1Bd/1XT3x5opmg4pcGhslGNrEM
         igE2xJrSSz8vXg4iUIxFyv3g9CGtQmC9nQbRIAuqfS3+NyJUd59knJV8TRQgIZc3Wbny
         FU+Q==
X-Gm-Message-State: AOJu0YxsgDi8JGHE4d2FBfOAQCZUyi4uMkGGI/AlBsA6UuU1y8H+qHRJ
	XWG09dZmEOSCK6URwSE6xVQkPzfBHPPsCnR9SmoY1Y2GgMIZe7sxlu23k+tcSI0rW36Hky2PUWx
	m
X-Gm-Gg: ASbGncuWFwXkesgptl0eRqLVfh8PMTHnDeUggRUK05+IKqofbkk00yuOE2aKidVDvUX
	ozuamHh/FX4EvF7OoX/84UZbctGZfh3QgEvlTZkj6Br5zHnYMqFR8UpaQME9r0C6IUWy24XqRQZ
	eDFZ0FhiZY9ffLM1UIZqDdjz+Z9ON8/r2lTloR8uhpbqa40ESpbPsW+TZRVPZuT/52nxDvQla2A
	7mCh/Uws5A1dstNXqM5HcQPhOyeBi6vYABOUfWNXT906Qyt71IKwPpB25ytGxc+6YKMc0S34/iV
	bTPzR+/Ym+8n23Hbr5dHqs44nVl/yZhRq7c=
X-Google-Smtp-Source: AGHT+IFqNg/2WolbYfjib2xu8SrWGJRdHmbC4TweWjgIJ96XGeaI+zMKTGi+QwJ70MJ/T0Vh55tNTA==
X-Received: by 2002:a17:902:d482:b0:221:7e04:d791 with SMTP id d9443c01a7336-223f1c9b5d4mr50171295ad.31.1741190335581;
        Wed, 05 Mar 2025 07:58:55 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.58.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:58:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/16] libxml2: mark patch as fixing CVE-2025-27113
Date: Wed,  5 Mar 2025 07:58:30 -0800
Message-ID: <204ff9dd9c62a8a346e89880b2e15a4c0e9ad6e0.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212323

From: Peter Marko <peter.marko@siemens.com>

This vulnerability has now a CVE assigned.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...lation-of-explicit-child-axis.patch => CVE-2025-27113.patch} | 1 +
 meta/recipes-core/libxml/libxml2_2.9.14.bb                      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-core/libxml/libxml2/{0001-pattern-Fix-compilation-of-explicit-child-axis.patch => CVE-2025-27113.patch} (98%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-27113.patch
similarity index 98%
rename from meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch
rename to meta/recipes-core/libxml/libxml2/CVE-2025-27113.patch
index 932c0ec422..92713375eb 100644
--- a/meta/recipes-core/libxml/libxml2/0001-pattern-Fix-compilation-of-explicit-child-axis.patch
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-27113.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] pattern: Fix compilation of explicit child axis
 The child axis is the default axis and should generate XML_OP_ELEM like
 the case without an axis.
 
+CVE: CVE-2025-27113
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/503f788e84f1c1f1d769c2c7258d77faee94b5a3]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 8f1d882505..1cbd620b34 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -34,7 +34,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2024-25062.patch \
            file://CVE-2024-34459.patch \
            file://CVE-2022-49043.patch \
-           file://0001-pattern-Fix-compilation-of-explicit-child-axis.patch \
+           file://CVE-2025-27113.patch \
            file://CVE-2024-56171.patch \
            file://CVE-2025-24928.patch \
            "
-- 
2.43.0


