Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE10DC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.2227.1743577836355912116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ui3jQ6Sh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so59102235e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577834; x=1744182634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSf2wfg5tDhZNl856XMRTWgX14yS3/99Po4AqcZJqYw=;
        b=Ui3jQ6ShrNE4QUGO0iTMCxaONq9eGGwKPZ6uzvD00cMP+0jD9IUbruFRQMC+kl+Asl
         LYfUHRcmA0WJyA/FgtB7rlylNyWAnB7BcYlMWg9JLBiq7p7q0EZvfjqGcEq9cF71M89M
         PjjUqiMY2V0JT00PoucHNw7hVezOJL5TUCkXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577834; x=1744182634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSf2wfg5tDhZNl856XMRTWgX14yS3/99Po4AqcZJqYw=;
        b=rPHI5IQWGZz9OTZdF5jmA/vJ8xenYbmgLCtxVyYKzL2888SQe4exjjezSXO3eFzgP5
         8LM2ZzmyN9CPnnqMo//sirGVjwCbXzJut3Geg/8n+iJIRJ2itVm5io0rDWTfYrkvhnQo
         WdCtUbB+lXlhpKC7z+wRTW5nPvJqTxME0oBMOJcu2rJg/ofHCqxIHU69+Mce8uJwpMU3
         QsL1idRSDSTXZuQT4K7pF234pvG81/HkImjNNIPscdJILNLX/y1WH8+KzpxgrWf2wQGx
         wBc5A6DQ1sHOyJfD67q21pQifbkUkWxtYAMiZ2+y6U476wl4Ze/oWVh4COqN+DiBfATW
         owQQ==
X-Gm-Message-State: AOJu0Yy3g4ZtafLlJ2YWJ33lKrBE7h6T/xX8JmnVLFWHayLHqpRCV+h/
	1hpylS/1hJ+wUpbi1QMdXUsrRrbFrY4vAxkh/4b8XRzFA5CwhuoVZhEJUoa2f6aqryRTMUXAzih
	k
X-Gm-Gg: ASbGncsG+TCciP7ohOdao/pMc02sVJO7tLCUyY3hYbPhXY7zegUCNR6mNUT+Yy3AFFq
	MXU2hSNKRq09GetSXoFbRMisoW4ZrtkNKpfY8LHm/H4rfnBCor90su5/wQ0HC4mUmIgSu8+0qy7
	HQWOBhwQ59UEOCSm802aX9ceukpkykcBcj32+/1OAPVi8q65sdnAyWJLUWRPtdhm0yznVOhoI15
	ysSb62y3zhsTNg72BHatZK/JlBfXOh7NklsDxJYXh6gROOYWYrZF804YclVjHF3iEQ2w5Dcfdqr
	H8js38gPL/I/d7j+giVg+cHPnYa3xR0NrEnjIJzn34yzO4qYeJEAOO34rNMAZq5vPqAi8eNMUA=
	=
X-Google-Smtp-Source: AGHT+IE1/30wyfdt41/dssxasYpR2unr1Izo00hUojCk3N8cNWijGLcByBi7ASoVmGEKNfA1ne9RbA==
X-Received: by 2002:a05:600c:b9b:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-43eb5cd30d8mr14266415e9.31.1743577834075;
        Wed, 02 Apr 2025 00:10:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/48] ccache: upgrade 4.11 -> 4.11.2
Date: Wed,  2 Apr 2025 08:09:35 +0100
Message-ID: <20250402071017.2157620-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214179

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ccache/{ccache_4.11.bb => ccache_4.11.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.11.bb => ccache_4.11.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.11.bb b/meta/recipes-devtools/ccache/ccache_4.11.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.11.bb
rename to meta/recipes-devtools/ccache/ccache_4.11.2.bb
index 9a305c257f7..3a41cb5736c 100644
--- a/meta/recipes-devtools/ccache/ccache_4.11.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.11.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "7dba208540dc61cedd5c93df8c960055a35f06e29a0a3cf766962251d4a5c766"
+SRC_URI[sha256sum] = "d51b82bb8c3932649323fd4cb8e5a0a9f7fe7f672c71a6d6839bee13b4ded4c5"
 
 inherit cmake github-releases
 

