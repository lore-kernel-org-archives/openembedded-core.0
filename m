Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAEBC88CB2
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.5612.1692931687971660146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mVQV7G0n;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68a3ced3ec6so420151b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931687; x=1693536487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHj5CzMb8kUvW9Vj28gSUJzdas9Uy2Vg9vvcrHGzu3E=;
        b=mVQV7G0nyZLOtqfigbe7S5ZSuYKWIJVFuMHDw6H/e8eMG2d1ivBkCHGZ330B+QM+jV
         IYYamZPpDuFVfnzUo/E+sigI+S+I5ypYgALjKDO4Y2iPeUfaT6OwoIYkYB0JoCjmgPsc
         cK8zR0hRgfe4Hcngn0E/grhi+HWhZB4QMMxgkhIhAVyP75FpnHg3ct7ZW/Xz5F0WHW7U
         7JN+YoCS1s6zoAC68kQA/s6UO48aEGLQ/njcbitQwtSqB+4h3GfbyYIXbNF9sKzfda46
         2HQpMPevlBtTSd4OPJIQ7f6biqZ2owRGVDCZeTYz/iAKNTN0VLW2VqIMLfMwXue12s/b
         4nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931687; x=1693536487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHj5CzMb8kUvW9Vj28gSUJzdas9Uy2Vg9vvcrHGzu3E=;
        b=X8LhL1g2KwnbX3V9Q0JGXRDLwh0CYZka/0NFXo/N9eHNkBqxNZCBIywEXZbYYAlu71
         IWvosRH3B31sWGkfHACK960kfDeR9RYDIFSDyDe/cejUZgR0/KgJM0L6Uml2uirHfR/z
         3o6WCLVRvVcDcEmha5bL53TmeRuC8EfJ/mPIyyjM6hTHsH13TxZ7j9n6LY53bQrQef1+
         IOUrP/Ri2lP8wTFiQ6AXvchiK8MSWJnOTecU6L9AHaFZC4913gQ46atStxUR578gvvXx
         SsYlr0bNBw2/xR8CQqQW5QuTI7+Ps0B5ZG5dX5Ir3aEvVjrFJphTN1P4FyUSc8Mbiags
         nG5w==
X-Gm-Message-State: AOJu0YyU0cpm3612+2/u7XMgJNlC/uFdOUTLZv5fRcveQ7Kno6zw4+Yf
	aMHJ0G1K/5ptq1uNwZvQxEc37WmhOPOzqWVbHdQ=
X-Google-Smtp-Source: AGHT+IG3NsZw/j1ag+mewntD9CrTpK0HffZy0B7CXKETe/F1otUEVJH6wsy89yoclisDBVR3/wPVlQ==
X-Received: by 2002:a05:6a20:6d11:b0:148:7454:6e7e with SMTP id fv17-20020a056a206d1100b0014874546e7emr15142946pzb.44.1692931687060;
        Thu, 24 Aug 2023 19:48:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.48.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:48:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] recipetool: Fix inherit in created -native* recipes
Date: Thu, 24 Aug 2023 16:47:36 -1000
Message-Id: <21d8c26efd48d6a1ba784d859feb2522751b277f.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186685

From: Yoann Congal <yoann.congal@smile.fr>

native and nativesdk classes are special and must be inherited last :
put them at the end of the gathered classes to inherit.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6614fd800cbe791264aeb102d379ba79bd145c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/create.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 798cb0cefe..a2c6d052a6 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -745,6 +745,10 @@ def create_recipe(args):
     for handler in handlers:
         handler.process(srctree_use, classes, lines_before, lines_after, handled, extravalues)
 
+    # native and nativesdk classes are special and must be inherited last
+    # If present, put them at the end of the classes list
+    classes.sort(key=lambda c: c in ("native", "nativesdk"))
+
     extrafiles = extravalues.pop('extrafiles', {})
     extra_pn = extravalues.pop('PN', None)
     extra_pv = extravalues.pop('PV', None)
-- 
2.34.1


