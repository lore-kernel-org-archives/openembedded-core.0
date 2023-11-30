Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77A6C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 20:58:20 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.5176.1701377899552679538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 12:58:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wIuc2vhF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c5fb06b131so1134693a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701377899; x=1701982699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCniEZbv6IcpnuXoAg8tbJR/li0dWjwKOBl9nT+p0L0=;
        b=wIuc2vhFF+pcfLuigN3k6BMMMiiOoHTglA3Zz6C0vSx66l7iZsxlN8E9V7mj1f2DfG
         T1A0od7vMqduK1v1wHDC5q3wqmP/TJvpSmTf371PHYlE2uj85D/iNTCu+aPv78CeAk8i
         eKS6A6S9oHZSEJUM2pwaLdL1MwvABJtv6/23xtMBynNF12WxGrFxKYjbzczEjwN+DlAI
         4uMHv8iufcQYmHxnoQSeNVS3RqfqjXWVknVWoM0SJr2vqLWMljJjSgSzYxnk3aXBYdm3
         RtgZcCNz4EaHxC8Fxzj39DxDoAzouBkxAN/H0HLKwv1YrvXGo0bGAEJnfhRwu9AsaITz
         HBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377899; x=1701982699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCniEZbv6IcpnuXoAg8tbJR/li0dWjwKOBl9nT+p0L0=;
        b=aNQ8e3ykHty+6Q90anWHk1ENfCsrBWKGDjMuYe43Ctl3dwFz7WrhkNSWAPgDpYnE30
         r73CHph5e7ZszgrO5M1Ntdj2zdjUOz3PEJyKFMO5O8+eElTx/MaydpzYuMAFkbWLNwoh
         oECybsxEw7s/DVEvUN/9gK3DZW8aSnRbTGl6FxmyjQefk1rxYupTsHMMlVm4kKMTZ+eG
         s66hIA4XPenazmL3RiXfD4NeuvB4RjPOM8mrwGzHC2aL+U7jh7h7te7tU+RpvhPLNJ8s
         kv+no4UTWfDv/dkEXxBRMdJNSGORgpM8BL2LpLs62kS9kgzlohTQlI9HOvRKq1FNWFN1
         pIHA==
X-Gm-Message-State: AOJu0YxsiN5xGRflDmgdSbpicKphIQG2fv6Pmx6W4MM6/KjHi40oJP4U
	D2g1hf9pKRbvNOQfvltnYEUZRH1CuaS7/wqOHzvz8w==
X-Google-Smtp-Source: AGHT+IH/uZUqnxBH300bWS3R6sIhBx7prFBAYaQC8vUSKwJ7AXF2uEYdS2pHeMfAo///54+//gdwiA==
X-Received: by 2002:a05:6a20:5490:b0:135:1af6:9a01 with SMTP id i16-20020a056a20549000b001351af69a01mr24567124pzk.8.1701377898751;
        Thu, 30 Nov 2023 12:58:18 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id f18-20020aa79d92000000b006cbbc07a1c0sm1635418pfq.156.2023.11.30.12.58.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:58:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 23/25] lib/oe/buildcfg.py: Include missing import
Date: Thu, 30 Nov 2023 10:57:31 -1000
Message-Id: <a888d56d46b01d6126179e3f38e3c1739c38d45c.1701377676.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701377676.git.steve@sakoman.com>
References: <cover.1701377676.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 20:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191541

From: Jermain Horsman <jermain.horsman@nedap.com>

get_layer_revisions() uses the os.path module but it is not included
in the imports.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4339ef5b46c39cce402d1cc3526b39702837b839)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/buildcfg.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index 90f5e05715..b9d32c7cc1 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -1,4 +1,5 @@
 
+import os
 import subprocess
 import bb.process
 
-- 
2.34.1


