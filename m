Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B92FC636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:43 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.5.1676236284015063975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XvzfYm+s;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id be8so11624969plb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dqgv1sXLyVJNJt9k+6xvzMhVPcD5f2uoZ77RTA8bPUo=;
        b=XvzfYm+shbJq0Nb9cl3Cju5ZkwD+tbdM2GnLn7EmxfpZZmtxbWyfZAc68TovRtmgHr
         TQXMDky/Q4agUqHPCaJekQrbIWeM4XspKWFxU/xd/bOXXqlumqe/HUQn77lFIhFy9qDc
         +X8skiOalzKAv9mSxyMlOjLKqQVg9G37eClyzViioMb6Ya/8f9sifslmYhbV3FpZdCEa
         2buXeoFxXDDJcT76kSdyK8b7Pc9mikx97kgf939efzaV+FPMiBbYM+4zvA25eMmYXdIX
         qC4sTq5AEol/iYOZ0O8iID6OW19A+9WsQvAtBZFwWFoFhjsXjeCEnPYdPQ2Hk67Xcx5/
         AVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dqgv1sXLyVJNJt9k+6xvzMhVPcD5f2uoZ77RTA8bPUo=;
        b=IWzMTvFaY1jMBOlC9S3X3MTnagnbJisd9EnQZ7wFV0ZF5WUX5QAII4qhGpzQg6HmUN
         ARnH7q6tbgHlVxFrL5dj1isKP1fbSKfeRSx2UfNzcJL6ODO+i3EifyKIe1R7CRTMdNXz
         8vxACm8KUUWDyp8VFV4rFUcgZF6FQ/kvzo9EPae6qw6CsXVISfDj0P2sob07rzsX5XFk
         1D+a2Sv+AKbeXJC0PCYyVxLZRUNeG0zIXeOWExF4O8duwDUZhcc7OXR8w8GyTeI/2vqU
         fs2LTpBnvrJXq51Lh8vrCSA5BVnS1F+7zpx5zFzFNGJto0upbAQ0LixN55LRnUe1v0z9
         eGAg==
X-Gm-Message-State: AO0yUKXF9QDNiF3o/Xl1K3ta47HdCsEkW/Eg7dje0JDyRvkpdFe3oJur
	qNMbDF4nmuwYQqhlq4w8gVTgSuFw+AN6mrnATkA=
X-Google-Smtp-Source: AK7set9KK2zrYbuWJ2w1sQEy2o9RA7IjS66wu6p130oXAMwDmeXb8gfdtEoqO0uFCCA7MshGQ2NKgA==
X-Received: by 2002:a17:903:2308:b0:196:6162:1a76 with SMTP id d8-20020a170903230800b0019661621a76mr27069729plh.0.1676236297765;
        Sun, 12 Feb 2023 13:11:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/27] recipe_sanity: fix old override syntax
Date: Sun, 12 Feb 2023 11:10:41 -1000
Message-Id: <381fcdba555d0b56fcd4525d82bec851b3da95ec.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177068

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18eeea6fcd8ade49390a978134f51646da2f7764)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/recipe_sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_sanity.bbclass
index 7fa4a849ea..df6e9a7db9 100644
--- a/meta/classes/recipe_sanity.bbclass
+++ b/meta/classes/recipe_sanity.bbclass
@@ -10,7 +10,7 @@ def bad_runtime_vars(cfgdata, d):
     for var in d.getVar("__recipe_sanity_badruntimevars").split():
         val = d.getVar(var, False)
         if val and val != cfgdata.get(var):
-            __note("%s should be %s_${PN}" % (var, var), d)
+            __note("%s should be %s:${PN}" % (var, var), d)
 
 __recipe_sanity_reqvars = "DESCRIPTION"
 __recipe_sanity_reqdiffvars = ""
-- 
2.34.1


