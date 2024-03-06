Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967E3C54E67
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.15011.1709739726273025944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XR5GXDkE;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a45670f9508so450348866b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739725; x=1710344525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qbc9gFGMO+dPwRrUctmGdv76G3M793H7oW37FMl9tE=;
        b=XR5GXDkEQ1966Z7RzSL4W/UmDlubKp1J8bJ8H0vXEhcdTY9IMlf+rYE2qOixF1PNH9
         ea4ZkLw2R7lhgnZT2MgWATIaJi/T5BTtWDcOFY+Hzf+SG+5vYkqW3EKA26k4mACtU6Z4
         OMrrrL9zHVfGdv3b4MTd68Ae3ks/PalBgnCU6bNQomsPDwXVH+n7Kc0Wci8mjhsGqoC7
         5FT45lLz65QpSQv9zJQAtYuDXqFOQHE4v3Qtfy9GCTGSH9HCph8IP8tNmXGh8H3lTGV8
         GoatYl25KY9bQTsjeYDPT1Kjhd/EOjtQCKz5dFQ8qSSJOmIy9m71uXNpyU5QCdaTmepP
         E78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739725; x=1710344525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qbc9gFGMO+dPwRrUctmGdv76G3M793H7oW37FMl9tE=;
        b=HNXY+nHHRpwYj8ZKP6pdFyH8n38V5BGC1yNwtHADKc/JSPsblyI1WVgFk3DNERNh+o
         qheGn4IfydOFEKGeCFZpFaOE4hdoXe5B0q2gBu0RM/yPLNdWFwGlU/Bqz+oRu8xzuIzi
         hF+1ovs/qWpgcFrFGAgujllmZTy0dxHZcmhgOMPCIOwT6Hw94rjCagG6qS44fvqq5bYD
         ToM2KuvzRI4ArcXkr+G09jNOtZ1IwDt7h9mtgURS4cjhs2E7hmnSrBS31Nux/8rWA6rh
         1YLS+/TGZmUzUZEhSOe0ULY67tQ1Aie1zPIkJqpjSBaYjY2LFAeTvjPpeopZNhvz0qP6
         YMCA==
X-Gm-Message-State: AOJu0YysCqmfwUwmPbqw3OmBDwPP6DsTs+ePtDHdQeEzx2KMoElN54Eu
	Y935bZZqTKcfWupviZP8NW0lmg1OtnuEjHwZsnFb+llJE+7lxrCqKA4S8OP8
X-Google-Smtp-Source: AGHT+IHjHgU7+RODKPPegCmPE/mXphGKRuJwMQ6C4JRcs+y5j22akjZZlw36+xz9upwgygxjRTr5bw==
X-Received: by 2002:a17:906:81cf:b0:a45:b3f5:8229 with SMTP id e15-20020a17090681cf00b00a45b3f58229mr2059499ejx.40.1709739724573;
        Wed, 06 Mar 2024 07:42:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/47] ell: upgrade 0.62 -> 0.63
Date: Wed,  6 Mar 2024 16:41:13 +0100
Message-Id: <20240306154151.3741709-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196692

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ell/{ell_0.62.bb => ell_0.63.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.62.bb => ell_0.63.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.62.bb b/meta/recipes-core/ell/ell_0.63.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.62.bb
rename to meta/recipes-core/ell/ell_0.63.bb
index c6ec91afb41..7ecb63a4787 100644
--- a/meta/recipes-core/ell/ell_0.62.bb
+++ b/meta/recipes-core/ell/ell_0.63.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f1efae12085610049714dc509c6fab3478925801609ad4232ce873b7daf1e03d"
+SRC_URI[sha256sum] = "7397c76996d7646b9917ebf016cd67586b10166295af2e0e18cdb5b8f6659965"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.39.2


