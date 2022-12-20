Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28E2C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.57097.1671559636978449023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IFa0/eN1;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso9504003wmb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksYV95BQ8bPYBRNNBkhV9hxh0A8uxvnuBL03QfK9UC8=;
        b=IFa0/eN1cWOys6sK692gsnD1gqGKQk39MVaaH6IEN5zbGTCV02QKvCAOkwgtn2h69l
         oMkrQnVs/hypDpmSCu/f7Sfvu9KmE4j8/Ar2Nky9gTM7Y9Jw2Dsk1EylIAEnBIwXZY/W
         hUBINYtHFD0lc4Gcr79CesvnYwbycj8y8N+WnIzTW1j9voIxZP7EzOKZIbZUlEeH52RV
         xfY15FPdEr/NpK4jHhXoIz7LodfKHTmvo21ccoH0QTzn0fKRQie/2Q3/c0chnfEqxFhj
         1lId7b+jzhfFt1UkTK48d1JtZGzqwYbl6PeFCdcA9IJS4McCtpqB/6ln5V4s6oFKFVPC
         5jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksYV95BQ8bPYBRNNBkhV9hxh0A8uxvnuBL03QfK9UC8=;
        b=WRROAmqLt0XIZhYjiWFaobijtLJ4SM1cBQL1OWd0Fnayackc1QPLE5m4oV6VZt7Nhp
         solk7mt55ZYWqGRYTYIDtTvOgdKux79VboDSevBZeSSh5GNAY9WyAxRPHSt5aNG4Zx6b
         z0z6090VBjPyxNW7EyJPFtt6AiQE0kNDM/IfU0+DOmqktRMYBcEPqMbvSSE7VRGT7tW4
         YI3A+9TqreJ7jgGMYEDFe6QlAKKO2YnhRdxMi7wB5mAXFfYyYhJvTPLcd/K8EsuJ14RV
         6/M50X8sP/dzQfK16h2LIjEc6XYn/no7Ra/v9KTAiCImcFZb3l1AdoHdQLyNFQheU7PH
         0UUg==
X-Gm-Message-State: AFqh2kpk72bxzBkvM2OJSy6BvhAgV14u62b0CdP4zaESoRCdrnuZQfb3
	hNmKxeF2kC7h+dSgA3LIkdGJlhwwtu0=
X-Google-Smtp-Source: AMrXdXsxiJYznmZ5+KriiCKXab6ha8RkwidLwgZC2piap7d0tbNH3sQ2tcS5rVFkyyFcyOl9bmayNQ==
X-Received: by 2002:a05:600c:1f15:b0:3cf:98e5:f72 with SMTP id bd21-20020a05600c1f1500b003cf98e50f72mr2411568wmb.3.1671559642974;
        Tue, 20 Dec 2022 10:07:22 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:22 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 11/11] cargo: Extend DEBUG_PREFIX_MAP to cover vendor
Date: Tue, 20 Dec 2022 18:06:12 +0000
Message-Id: <20221220180612.24555-12-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174871

The cargo build builds vendored libgit and curl, but these exist outside
${S} which DEBUG_PREFIX_MAP covers.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/cargo/cargo_1.66.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/cargo/cargo_1.66.0.bb b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
index 6c167c0c5f0b..fe8049b68c9b 100644
--- a/meta/recipes-devtools/cargo/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/cargo/cargo_1.66.0.bb
@@ -20,6 +20,8 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit cargo pkgconfig
 
+DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
 	# Need to use uninative's loader if enabled/present since the library paths
-- 
2.39.0


