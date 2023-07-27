Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254BBC00528
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:32 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.16766.1690487070319108340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Uh6+5bD+;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a5abb5e2aeso1107559b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487069; x=1691091869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elSirK48+rEGCGzNdFlYj8W5V1jzoy1eV+g/1kwDSF0=;
        b=Uh6+5bD+LHd9yBc2BEtNBT/WYoaB0mcnOc7fuJbpOuKt6oXNIkhhts7A6ZeBbWTV6f
         dtNj7pnxVl6SKbekUlm8RdHPwUW20GfCCowLhgR9F1jTLRMWWmr4NPzvgcbvJKG8RVY2
         F2K39c2WRRVrTBWeze4T3qZnz+5kO1KJGZUyqEBPlAprqA+f8gl1BazWNDRGefDmIKPO
         fJUuX5GTb+0HJrB1td0lf8WVK1SF+/Fpkc/8QEF1cZprS3rlzzouGuOnDLF4DzKOTzsa
         4jzota1OjOYM3Ke4KMPrdvk/ctf7RKr8PQhda9aG7/aDTMYogWWsFanR3beWsDeZ67mm
         jKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487069; x=1691091869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elSirK48+rEGCGzNdFlYj8W5V1jzoy1eV+g/1kwDSF0=;
        b=KuuFvjZCkcJNdzXO8m//j/tvkP6UW2k9Yfwg71qNQqorK9YJdJ+eP3SujNrDStoP4X
         tJMAXLjn68WflMPpAe3DgbABkapUs7aIT3EEXkOVdH97yfR7aStTKTVLJ45TUSrFJkaR
         w3DwmTCBfgJgFQ3DDc4JctiOtV/vohlCLYaBo24doQ14INgZRdzOcEdy4AcQ/LZXGZmt
         AAfnVAoGEa2j/oa5RbyWLl97vJZCM6jyxUaZDRkiEJQTIpOq+vTeVUMYOtVsl2+eH1xJ
         v1GSjtCJHpckMnBTAsiUL7GOyOYhHbmrpQn/0oKSopZ/X/LDyVizDXOjznmOSEnxQGnv
         4loA==
X-Gm-Message-State: ABy/qLZ+t2ag5L4aOrVev96ChJ4gitErut4p5L/cc/jVYZmr/XsH5NJS
	TbMC/MEAzwENUjI0/BRR3MroP35FnUFcVZEw2Do=
X-Google-Smtp-Source: APBJJlFZ98wuOP8dwpEvkFr4g422h9SxCQYLWPxPpRmFs+XlMtfBcRIZeXkP2z/NGf6tJEBRtPTLDQ==
X-Received: by 2002:a05:6808:124e:b0:397:ec35:f5a6 with SMTP id o14-20020a056808124e00b00397ec35f5a6mr153673oiv.57.1690487069291;
        Thu, 27 Jul 2023 12:44:29 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/27] python3: fix missing comma in get_module_deps3.py
Date: Thu, 27 Jul 2023 09:43:37 -1000
Message-Id: <f24236b7b52dd753d7170bac9c38dff1133db76e.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184994

From: Ross Burton <ross.burton@arm.com>

Wes Tarro <wes.tarro@azuresummit.com> noticed a missing comma in a
preplace() call, add it.

That said, calling replace() with one argument results in a TypeError,
so this is obviously dead code.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b2e2c8d809e7ca34451ec9702b029a00dfb410b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3/get_module_deps3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 0ca687d2eb..8e432b49af 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -32,7 +32,7 @@ def fix_path(dep_path):
     dep_path = dep_path[dep_path.find(pivot)+len(pivot):]
 
     if '/usr/bin' in dep_path:
-        dep_path = dep_path.replace('/usr/bin''${bindir}')
+        dep_path = dep_path.replace('/usr/bin','${bindir}')
 
     # Handle multilib, is there a better way?
     if '/usr/lib32' in dep_path:
-- 
2.34.1


