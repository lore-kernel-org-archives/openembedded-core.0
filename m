Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC499CD4945
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.16006.1695367490224113363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=igl8CqIV;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-99c1c66876aso219680866b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367488; x=1695972288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0CQbA930IMlv8PgD5CWckHjHD5yQaQEsH6WjQW7gc4=;
        b=igl8CqIVEz2WlQlrtPapc2aEzlRkKNMLrRbUvdr+00X01PlzDrQzY5SA1Qcguqenqs
         iGsMgWBGNpQh1YJj8f0D/H1AJICGxyAoPIV5Z998qOb7wRMZGq2DA2GkeDQn40LH4QA6
         miVBsz8BU4Hw8EbTDE4eIUKQ/pRkNUTrB4PBm6QVP6Il1YAIX+qBtHSOgJEjJLLFd0tB
         XN2OQQk3f2W2yCbg/x2hSSOWI1w3S4Qd2WdX3pTeU+72ChKmuX6LwQV30vd6wTt6Ykpu
         2QtlUZllvjlNgRo9fdX0exh5+bAWIVjK24EK6GBBuLZBy3cbvEvEVS6NmiDxpgG6EOB0
         ViBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367488; x=1695972288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0CQbA930IMlv8PgD5CWckHjHD5yQaQEsH6WjQW7gc4=;
        b=uMIxfcqTG5PNT68Owp19GhEQcqAm6O/5D9xiqrlWsQ0oRxjrUYK24oA6JQP5fC7kAp
         ssgFsR5BrnAniDsAneO9tkDyYwMn9/u3gpJT0W3i36J4STa13dNTNAaC/p63Kc57Q8f/
         hdyAuT5YvYxUgLuAoZXWkrfbxrDmuyMRE5fCcqY2/i02TIm+pnmnqLL2qrQvwvFoETYh
         fs/tKxne5J7UAEsT7gy0OfcQ6xMQEql7CKNt9J23fGQcx5RiNnJXS7a4BYsawVtQJAOS
         wprXNVlsb96Bp0tomdo+kmki50QHr7wHmuz0M5X+cKyme0YFB6JG5Ci6USoh4uPDdL8T
         P6lQ==
X-Gm-Message-State: AOJu0YyKI71lKaBgTxF0DV+1g8YmDKCcGJhpYTtX2ssAOfOVp4y1dU6x
	4mM7z2fI/522xFbvUJVbBslHlnpf97I=
X-Google-Smtp-Source: AGHT+IGgtsGv7IoX5tcF8XpJTv/wb8F+EHeoJtfi/tl8qFmM0j+g6XLKAObhUZROx8cUQL9yyMIubA==
X-Received: by 2002:a17:906:cc:b0:9ae:6ad0:f6cd with SMTP id 12-20020a17090600cc00b009ae6ad0f6cdmr2330235eji.24.1695367488579;
        Fri, 22 Sep 2023 00:24:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/40] libsdl2: upgrade 2.28.0 -> 2.28.3
Date: Fri, 22 Sep 2023 09:24:13 +0200
Message-Id: <20230922072431.1481743-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188065

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsdl2/{libsdl2_2.28.0.bb => libsdl2_2.28.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.28.0.bb => libsdl2_2.28.3.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.28.0.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.28.0.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
index 1228217e8c1..f866a3618f7 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.28.0.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.28.3.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "d215ae4541e69d628953711496cd7b0e8b8d5c8d811d5b0f98fdc7fd1422998a"
+SRC_URI[sha256sum] = "7acb8679652701a2504d734e2ba7543ec1a83e310498ddd22fd44bf965eb5518"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.30.2


