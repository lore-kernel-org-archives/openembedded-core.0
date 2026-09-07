Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726A7C79FB7
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:05 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35222.1788788162485907014
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iF0zkoTI;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so42257195e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788161; x=1789392961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MColx7J6XcM0MYgfPUh8PlP59JqdWIZBob2boqar3B0=;
        b=iF0zkoTIxMwFf0NLcvSueow27xgwNeOsqGCdjSnT5CRImGOkXod3BM99OIPTziDr4d
         Io/SK38wF3KEstZdeBnOo3AaXufP9k8hgahLPCSNmX9uyel6wOhwAV1zJK79HaPg4dPh
         RU9+lsUSmbszO0HhpDHzh76rmG1Q678lAiGpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788161; x=1789392961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MColx7J6XcM0MYgfPUh8PlP59JqdWIZBob2boqar3B0=;
        b=CivYABV+qt+3istgaywBFInZFRh6tqEcOV97IjU0XtSeysyeCGX6YxOWujkcz4MT7g
         7i9dfsakc2sbWg0/E4DP2F+TEI301tQDTGSafu5W/OLqLKgHiEJCNyu7/wRY13i28n56
         2h70Er0DaIU7/y6fpxfNKIvw/mMvENHro5oiIvtPXc8gHm5eJj9EAyGuOH+gdmCgDbER
         /AvZdgxhdftmR/nPSmeyMhaTy09Ee6AHwNvH0YVbtyG+8EQ6JnQPnZLbxR7OYlmZ/OXP
         gQ8C8pGaKWtT4L+3SKO0rdFiS5xjmwnn5g+iMRiIL/46TmbnY82F4O2FjGQJAOMcuBnc
         Z0NA==
X-Gm-Message-State: AFuF++kSM8IdF05rKpytRZ4IsrWtijGSJuCQ1OyJuR2jQzSjlyalCgme
	hcPxLzO017Proy42X2bofa2xRq1lRfK7XoHCphCsRQL0LyJhO8HRPu4wEi0RNydbMdpP3jRezTt
	GIYfrTQ4=
X-Gm-Gg: AYBFou1de2cEXyGBWySxVAAauXgjgMvkhGhTfWqtyCaadsVkWLTA54WPvpOH4+0/BUS
	2lrvOK089NFD4cO+KdVzh+d+t8HwrYhUMcQ4ulb//XKzHbbVQH1S4i51auMDS56lSnaYNks8utw
	ynPde/R1s9kIef9flDoXNza3nhZdtfyvP2NBkW2FApyH4/SpMOCJwuOmnys8Hnr+j+FkHkPqoTM
	QILNfAst4LqEGgER4Pc6bxasm6305e8oMGztoY1R7hADusmYG4Es3eTEq/15N5HRs+I6jCw1W+0
	YcxhZqJzRDJB9tF9gcsfMYmkxoctAUaDzrsv8DJ+VaxyytBqJeSurWcMyTjwoxlGYTZL/WvlFHT
	8H9zKcDo5UKou5+VNl4jXqppskk8W+vgKMzzsSWuVqvuOGPxu00MVuWmXqaGt9QmDpRONl98sC/
	AJ6/zwIGjifArW43kCEsmUkbAcXmIZzMw7ifFbE2tlLwYsKJwSryj0+yrijZYxGKaztFolZ4H3I
	yV8p5Aa3iuqxI1tHkiLK6TUAdgo3LOtQAruTD9B+ej+t/9wkedkHtZocf1T2FXN
X-Received: by 2002:a05:600c:138a:b0:49c:fc6e:8cba with SMTP id 5b1f17b1804b1-49cfc6e8e34mr200530055e9.30.1788788160695;
        Mon, 07 Sep 2026 06:36:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/35] python3-attrs: fix CVE_PRODUCT
Date: Mon,  7 Sep 2026 15:35:14 +0200
Message-ID: <dbed62df037003f1200003c6d7a590574b8f6d33.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245276

From: Tim Orling <tim.orling@konsulko.com>

No new CVEs are caught, but attrs_project:attrs matches the upstream
NVD dictionary CPE. The pypi.bbclass default "python:attrs" generates
the wrong product identity for the packaged attrs source.

This changes the generated product identity, but the Scarthgap
cve-check database snapshot has no current CVE report delta.

Note: The original commit targeted python3-attrs_26.1.0.bb. This is
adjusted for Scarthgap, where the recipe version is 23.2.0.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc07eddb82fe42ecf86e685450ec0b5c9d3a9ce1)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-attrs_23.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index e39b64306c2..99cae50e9be 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19
 
 inherit pypi ptest python_hatchling
 
+CVE_PRODUCT = "attrs_project:attrs"
+
 SRC_URI += " \
 	file://0001-test_funcs-skip-test_unknown-for-pytest-8.patch \
 	file://0001-conftest.py-disable-deadline.patch \

