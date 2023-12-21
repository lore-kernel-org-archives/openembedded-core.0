Return-Path: <renat_khalikov@trimble.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500F8C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 21:57:51 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.5987.1703195868978999684
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 13:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@trimble.com header.s=google header.b=R0TNTagf;
 spf=pass (domain: trimble.com, ip: 209.85.167.178, mailfrom: renat_khalikov@trimble.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bb82a52002so583573b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 13:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trimble.com; s=google; t=1703195868; x=1703800668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jlBCzV6iT0Yp+lY/kDYXPA6cXAsIUnrfzUnZ9c36RDc=;
        b=R0TNTagfoJmUTVgKcPI70PZrkEsRTkcAIZSFFdloC5EhZUYlnEZZS68G/N4upwzO8F
         p6s6ZZc+JjYpG5xqSWLLdN7I0lmHR8CYvKk/dDOJhTczAgJVj5gdbQRezmqBA7r6YIV6
         s3VUMajSaGs9RT0WhpfUGA8Awer93yKpjfSuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703195868; x=1703800668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlBCzV6iT0Yp+lY/kDYXPA6cXAsIUnrfzUnZ9c36RDc=;
        b=NciMAgsAoHKn6C5nkXSZWqm/Gsh3x86P9qtVmqM2F9N+TgMJiotqEvQ91qfAaQh934
         v5ZZNfFE7C6OqtXQP+IPFAgrV/IKBmXAM2QvAtqcPDlnSy7HtJpOQoahMZ4wC7wXji4q
         yYWPRkDi3aLoHNRnNu6z+rDRUwbEcMbGQoIcDj7layERabd5M4gsaf9fZmpAeJ3sHf+e
         79hpiK/SFypADMvWDTE4v8HFZdzo8+l+RgmypIbljudLZCOSw8ocdYHTsEHN5FZbNYpt
         cNnxJDXemi4vB9Y/203ueFC/HHlKgXQO2ufsxJKl6KrLTsET0fUw6HsSAVBXgc1Vbv3R
         etGQ==
X-Gm-Message-State: AOJu0YyWMjsYnuJ6Rtz5X7zTHmfQWI9Ka0LC1c1mjm1FypUDWyXeWI6b
	QqpE0To8opxhdQUbNOWqvACMHPCnAK4Vk6Z/Urt+lkYzbHsIfh204nVxyh0+08oNOo/ysJhH+gp
	Njxdul9m9v8WBMqxcvlHFJGhlvfbUlThfrxCu2ILHn2vK5e+ToBE+lRlV8Wpm9moIjm/px8lNGp
	+m7Iqw0R3u0tjtMR3hwXBgnfeIlcxuXGZzc+4ut34=
X-Google-Smtp-Source: AGHT+IEg1b2QVsYGTc/NnRxnQu0Ym/vu8EqbAJScwD7Ko8LZveISedL9uVtZkQDrHZijv4UCt/Wj8A==
X-Received: by 2002:a05:6808:1186:b0:3bb:6cf0:fce0 with SMTP id j6-20020a056808118600b003bb6cf0fce0mr424043oil.34.1703195868145;
        Thu, 21 Dec 2023 13:57:48 -0800 (PST)
Received: from beast.am.trimblecorp.net ([155.63.136.49])
        by smtp.gmail.com with ESMTPSA id bd24-20020ad45698000000b0067f2c373115sm900684qvb.20.2023.12.21.13.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 13:57:47 -0800 (PST)
From: Renat Khalikov <renat_khalikov@trimble.com>
To: openembedded-core@lists.openembedded.org
Cc: Renat Khalikov <renat_khalikov@trimble.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [OE-core][PATCH] python3-maturin: Add missing space appending to CFLAGS
Date: Thu, 21 Dec 2023 14:57:33 -0700
Message-Id: <20231221215733.1057373-1-renat_khalikov@trimble.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 21:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192852

When the CFLAGS variable is appended to, the missing space causes build
errors when CFLAGS was set previously.

For example:

  error: unrecognized command-line option '-mno-unaligned-access-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home'

Signed-off-by: Renat Khalikov <renat_khalikov@trimble.com>
CC: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-maturin_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
index 07ad1201b8..82e65abb24 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14cfc70378b
 
 S = "${WORKDIR}/maturin-${PV}"
 
-CFLAGS:append = "-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
+CFLAGS:append = " -fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
 
 DEPENDS += "\
     python3-setuptools-rust-native \
-- 
2.34.1


