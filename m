Return-Path: <spencercw@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E39DBC3DA7F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 14:57:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.9998.1722869827763775992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 07:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abUoZg6/;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: spencercw@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so69552765e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 07:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722869826; x=1723474626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h2ptfwJOWJXgw4HYwjLGbGQhIq9aIzcluWZmcUC9Y38=;
        b=abUoZg6/7ZU5C3gDdaZY1uKZjU8M2tZ8SBPIDYsyW3qOJSVJI3L3ntVQbPp42art8B
         9nxuLq1mEPxrOMgOXMN9bOHjFUh/z2/EzlweJrkwHQU5EA5UibRZxMejdT3DH6vzHJ2n
         qbn4y0W4Ercwti0a4WBcaJ44J7fibpnGdaID15uJMflDFBWMk+4IcbV3yztvV42RqqI1
         AnZJQYaA8A2PGC6+IWyUEY7l8629R4E8XRezZ20xnpWdelIOV5jcBM8hc5rQlep3B05F
         BMXJiPbFRhsZIIaJARhdxx+t/mxna5/COAv0YNuI7PpdLuTJyjQ8D9JnYO9vIzU4bdCQ
         TY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722869826; x=1723474626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2ptfwJOWJXgw4HYwjLGbGQhIq9aIzcluWZmcUC9Y38=;
        b=XfuZVSG1QcR2bMKZ6c4/CLDvivw6mGWgdoCNDL9UeMD6V9b2ErC03gemrfoHC3FPSO
         kytgTycXVQcmLPAvuLxJ+KYuZbAWfzn+rpfUrbvgeczbPyJBhCZgMD5duS37oSn/Ym85
         ET/aIsNw4uhtrzPvEXD9M3prJouh1J8eMLVhXkHgnfC6Hms8x4mRW/bt75z1oHbVU1nb
         KGWh05v/mjpdEdmQcwGN/fCLe65ucizor2lRktZYcYi3dzWvKe+dWgTQ1qBEWEruec5b
         8O9frfldmWsaESX+hgH5ONk2TCbx/+NRbeZq8D9cIUXaXb+VjewqPDrJFuSkKQDDhAE5
         Dm4w==
X-Gm-Message-State: AOJu0YzNEZp8RuPree296AR4UR6T1vbXRBNF8PaBDU9hygMmmKBirzhV
	xHCiN2qhWNA1lPZcHBRrvrjRZBCkBWQ3MOsLEcE1tdt4OdLs3hvEKfz7zzSr
X-Google-Smtp-Source: AGHT+IHLGYny68e4Cf3TzrKwDVHSD1vnOwBWFkCFoUOUNY0x47eI65P+uj5+mn+D05gUOqWVk46Qvg==
X-Received: by 2002:a05:600c:3585:b0:426:6945:75b8 with SMTP id 5b1f17b1804b1-428e6b93fcbmr79241205e9.31.1722869825910;
        Mon, 05 Aug 2024 07:57:05 -0700 (PDT)
Received: from chrispc.tailb45b3.ts.net ([87.74.75.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0dc9asm10013386f8f.15.2024.08.05.07.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 07:57:05 -0700 (PDT)
From: Chris Spencer <spencercw@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chris Spencer <spencercw@gmail.com>
Subject: [PATCH] cargo_common.bbclass: Support git repos with submodules
Date: Mon,  5 Aug 2024 15:56:39 +0100
Message-ID: <20240805145639.764677-1-spencercw@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 14:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202994

This is useful for cargo dependencies specified as git repositories, where
those repositories themselves have submodules that need to be checked out.

Signed-off-by: Chris Spencer <spencercw@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 2386cc3d77..c528ae7f39 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -142,7 +142,7 @@ python cargo_common_do_patch_paths() {
     fetcher = bb.fetch2.Fetch(src_uri, d)
     for url in fetcher.urls:
         ud = fetcher.ud[url]
-        if ud.type == 'git':
+        if ud.type == 'git' or ud.type == 'gitsm':
             name = ud.parm.get('name')
             destsuffix = ud.parm.get('destsuffix')
             if name is not None and destsuffix is not None:
-- 
2.45.2


