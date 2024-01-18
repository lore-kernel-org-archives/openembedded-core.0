Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4245C47422
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 02:51:51 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.2909.1705546311577802091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 18:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tVOn/ajF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5ce942efda5so8683196a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 18:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705546310; x=1706151110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kefklrp6h/R4Qd/F6javO/3vOQhGilTVHllRcRi9oqQ=;
        b=tVOn/ajFPxPpb0c8Tyqw/cb0wziEztcvSZ9lpCO/PTRVImIPi/1vlAPvPijkDZFm/v
         2iEIli8ZgcubUsrD1vDyrZKAtqw81Bp0Qbmayigq/vvd1xEQK2x8/wc1NaJq9O608axI
         RBZq4+GC44UpCyUWAEmrjHRcTvhs0dIl7JEQ8/fbc9vrtqtDUynXuVI248Wt+DxtaEtG
         VyGuyi1OpmRlfMag6QqowA7j2EZurgqLQq4PInhUCq5XIGpzj1ttGKXIXH0A7fCNXlPV
         lVKqAQNYsIzoZCOMzYeH1+QwgJBAhCcsvIUDKoeHDo7bzqg9hD85a1SUXDjI2gBZsNCY
         8ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705546310; x=1706151110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kefklrp6h/R4Qd/F6javO/3vOQhGilTVHllRcRi9oqQ=;
        b=liVSirjf7BBG40DtIUgS2RABO3hzeHJrEvS4/REHg4nrVROqvnsMbweC7fv6NGchuC
         ltQuEytRK4tjlLXorhYRzpPZW4Ts0PohynTEf7GQ1b6N+OLJye0uIXgMgVAEW2VCXFBo
         9DUsSGM+tm29PtCaaaMatWFzrMOQdZJQxY573SQGHWge52cYBiu56cP+NizNqAN/1YQM
         wlpBavdQ2MCKw41GH20QKQTRoK31hl2COvzn4nf2NDfjdsINytHn5sCquxLjvfztVmfd
         ObjQYbOXkMV3ABrS88CJSOC22vZOiorbGVbQcpggQotskZsR7u05sVcQbbFJKPk8M839
         t13Q==
X-Gm-Message-State: AOJu0YzrXDct6KgnLsdMMJ/QoFaJtwYKY+qxuSfuZ5fmMoJ69mmcEhfD
	MSNcn39IkxSNrgC7LkVIuU9n2Amjpsc9rpopGC3QXXlWjqLibplstBkLc0Otj49DgYomjz6dU+s
	CCkc=
X-Google-Smtp-Source: AGHT+IGHPFL+hWM738m/YsdmHExN17TWWHxxIyCNPw4vRqQ6JVMhIkw2TwHj1PbCGwEJBwO9XFjWbQ==
X-Received: by 2002:a05:6a20:2453:b0:199:ddac:ad4f with SMTP id t19-20020a056a20245300b00199ddacad4fmr221310pzc.100.1705546310223;
        Wed, 17 Jan 2024 18:51:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb2-20020a17090b280200b0028dd956835bsm441844pjb.2.2024.01.17.18.51.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 18:51:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/6] zlib: ignore CVE-2023-6992
Date: Wed, 17 Jan 2024 16:51:36 -1000
Message-Id: <5dc87309639e78195eb1283afc193f6eac63b044.1705546122.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705546122.git.steve@sakoman.com>
References: <cover.1705546122.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193959

From: Peter Marko <peter.marko@siemens.com>

This CVE is for iCPE cloudflare:zlib.

Alternative to ignoring would be to limit CVE_PRODUCT, but
historic CVEs already have two - gnu:zlib and zlib:zlib.
So limiting it could miss future CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/zlib/zlib_1.2.11.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index 910fc2ec17..9355f0556e 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -53,3 +53,6 @@ do_install_append_class-target() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# this CVE is for cloudflare zlib
+CVE_CHECK_WHITELIST += "CVE-2023-6992"
-- 
2.34.1


