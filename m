Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.430.1592848927598539394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YC6x10pe;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id d67so16413706oig.6
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=o5SylXOIn00HcFkwOtcNI2oxASzFvBuAc6Y/ug6EO3I=;
        b=YC6x10peuVGoj0Xl8d3/fARxb8gOfvcFHrZhCb+GSn0hR48GUJdO3XFfmAmRl/MfMK
         V6AEkZGlcMulwzNOIgNeaBOL4Zj7v5rtMorXF4kyPsVI1UQa3m6Isu1q+ODDopJfaDB3
         ptNURnkirG/GsCqEEH4p3WotyHGQdYcpQnxMBss4L3HrVatEbAy8hmkzTogzUGHlUVOC
         pifDArC5OFcpP3dyN3RthA7TPFUF3xdNf62SLxa/OGVAVZ/09QsJN8z6BK1sk9wziC4V
         DiNCc10a4cUklnyAyg0Ux4hqt9gMrJAVU04kJOWABSYc55yxoaWRaDZJMTaWRJpnx6iS
         XAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=o5SylXOIn00HcFkwOtcNI2oxASzFvBuAc6Y/ug6EO3I=;
        b=q7CaD5/okmUFA5RL1+YnQualo7XuZ7Yxz7bMlEC//Ks/AmYy6wlOQdSRnjhLDIrwkc
         KT/zOZzV+HVi5TfGLFyD9tG+ErH30lkIEiXFfOVoYJPyKmLhFTx9pV1n1EgJBTR3jLUI
         9WtFGasAb9sOCkrOLs/HmLvosE8TH71IDlXuQnxsavd8KG6qBddWCfFRw6iIJWvZln+g
         dDUABG3vG0x8AvRJMWn2S7kkK9Bp9nvUi0EhJHkUZOb5pFWNjcgeqSodydhEOmyuFZFw
         Owe5distL0yDIyuEIxHS4w//RjSbH1Zlmzb+z0owk0WzXaZhrKnZAl6qHCkDujmIONMb
         qrPw==
X-Gm-Message-State: AOAM530B6V1jCqgwdtF1QNWh6fwWPvYgEl7h6cyyQtX4EmIjzyRzssqg
	1AxIOgpymZ3N4XoBquBOCHglxHBDjdLDEg==
X-Google-Smtp-Source: ABdhPJxMhSM0XjpA6a9+SKALuCyNGWDmNTm2NewC/cwM++qNThC87GqMHor9SKW68lV+18+YZHOeHA==
X-Received: by 2002:aca:c501:: with SMTP id v1mr13601856oif.40.1592848926156;
        Mon, 22 Jun 2020 11:02:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.02.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:02:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/33] recipetool: create: fix SRCBRANCH not being passed to params
Date: Mon, 22 Jun 2020 07:58:25 -1000
Message-Id: <b4693546da296c039d9c88e0e2cbe1e2613bb798.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Tuomas Salokanto <tuomas.salokanto@gmail.com>

When explicitly passing a branch using --srcbranch in 'devtool add' or
'recipetool create', the branch name is not included in the params of
bb.fetch2.encodeurl and default 'master' branch is used instead.

Signed-off-by: Tuomas Salokanto <tuomas.salokanto@gmail.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0424df825f1e509faf6cd44403c0736bb91b57c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/create.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 6cbf4de674..8d78c5b6f9 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -460,6 +460,7 @@ def create_recipe(args):
                 logger.error('branch= parameter and -B/--srcbranch option cannot both be specified - use one or the other')
                 sys.exit(1)
             srcbranch = args.srcbranch
+            params['branch'] = srcbranch
         nobranch = params.get('nobranch')
         if nobranch and srcbranch:
             logger.error('nobranch= cannot be used if you specify a branch')
-- 
2.17.1

