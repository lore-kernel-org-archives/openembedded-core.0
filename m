Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40506C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:43:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.138612.1700836986717791168
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBQNnt6F;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso13638715e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 06:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700836985; x=1701441785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ySC4dDyweR5VFj2WS61RFNg+TxexzTf09mSnx81sP3E=;
        b=iBQNnt6FHjzoYnpthRWmCuOyMqw8ANeDBPEghevWbq0ZNbV4hgFt24NUP8IFIw51tO
         sUti27Yz2PhRopAbwVLpxrnsdxxkZnmSfYspAT1QCohcOfiD4K1v0P4U3zgZbjTSDHli
         6jY2bEuNbNvXUaSb1q6RSS50cGSp9ObHtqnv+859b75pANEbbCCK2vZvSeQ3jES4qnBR
         GGfbcYSSYgYZZioTyFdUgQLmYlLKmRepL0sEnU8gTq+6kzMFyOYSPi43OEzc8W/Dw5EI
         wggpz0M++GFsN7pW3rp/s2SMmyJdhLKPj1sGQdU99g88MezCdoTWmtg6C3ROwdG+EnyS
         96ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700836985; x=1701441785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySC4dDyweR5VFj2WS61RFNg+TxexzTf09mSnx81sP3E=;
        b=iVbbEMtiQU1Q8tP6gRBi7/b8nkqOBhn0kSkRn0NP/Yd2XfxH25fsxz2BJDDK70MZgi
         K64Ma+67geaqKf06gZGDG8ESnPBEbK8QtamoaR6V48XRZMYekqLoMp4RCJGqVgRcLwTr
         Qb+YQTVbV+oTKFvdBt6PHI+ygpXdsun7el7THcxsKMU8A6c9nLx3b9CZ1VG2ICGP4b47
         KqmEnKAoroiCwrctQkiubyvPZwgIGuVx2b/tFJaMU7ZqSrmJz4cEQLoPiUk6GnoV3LWd
         DENNM5e4noh/Cu9s9w4m3qrJpa4ykaQDdmL0sHzTED7mu67AMXIJblGIFFzNpru1ub7v
         wBNw==
X-Gm-Message-State: AOJu0Yx6uLF3CQUt3+iJBXansPCokKML5JYzzcyIRqONN+DW3YV+MK3L
	D4elyYy0RJ7XNu5Z5BlcM8p0Hcg/lgs=
X-Google-Smtp-Source: AGHT+IFexu6HE/xEW7UWP8dTS1Cz64BU5+eWgDb3FNF1K1f5avK8ycntn2B+uGz2dJwRHIRn1jKrSQ==
X-Received: by 2002:a05:600c:41d1:b0:408:4d0e:68b2 with SMTP id t17-20020a05600c41d100b004084d0e68b2mr2344059wmh.36.1700836984545;
        Fri, 24 Nov 2023 06:43:04 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:c45d:d5a9:301f:4fd6])
        by smtp.gmail.com with ESMTPSA id c9-20020adfef49000000b00331698cb263sm4507602wrp.103.2023.11.24.06.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 06:43:04 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/2] rust: Delete python2 configparser code path
Date: Fri, 24 Nov 2023 14:42:52 +0000
Message-Id: <20231124144253.14955-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191203

We no longer support python2, remove the python2 fallback code.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/rust_1.70.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-devtools/rust/rust_1.70.0.bb
index 16d433910f8e..2e34b3de1c45 100644
--- a/meta/recipes-devtools/rust/rust_1.70.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
@@ -72,10 +72,7 @@ do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
 
 python do_configure() {
     import json
-    try:
-        import configparser
-    except ImportError:
-        import ConfigParser as configparser
+    import configparser
 
     # toml is rather similar to standard ini like format except it likes values
     # that look more JSON like. So for our purposes simply escaping all values
-- 
2.39.0


