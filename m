Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDE1E99069
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:05:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152780.1775815524867376888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iXGClCor;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d43e09de5so983843f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 03:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815523; x=1776420323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uF2vghswLiIVTlSWaE92Maltcg2c4oidfyDjVrc0B6w=;
        b=iXGClCorHETlSUo1n22lfmrUYJ3Q9As3eV2tll+1k2GN5fHUbcYwTCUPDiT+KJfXf9
         IKWvLZuUIgqOL9LWWn4HaUGtZIgHL+14ceaOAg9t9ZvxIqkrBMRuz22yJs+0CBbaqcZr
         1bd5h04w3sn22x2kOXGxvA6J6J3mM2Y1223o4apa3sO3icRZQ5XAXM2t1cWkFc9/Dtsy
         EyHwaIPQTc81yB1qKDUVwvh0Zk+NhT2ciZUqRh1hjFJERbQvjNqGrps/CW4aLW2/A9u1
         qz8ekQq6UNQgAeAJICVNHYBHxPMyRu+TOUH0iv+N5IeRCq4H6V0b5/BxV5ZBu50XW3ru
         XIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815523; x=1776420323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uF2vghswLiIVTlSWaE92Maltcg2c4oidfyDjVrc0B6w=;
        b=qgRfhNMP8Da/YFhsYxfocXUSkvkbZhEEWkShl8zO9dtUTBGhN7mbtYuEUPKMh9/bGT
         U9WHsISsx91UqMG164PXYpn83xPaLUlIgEub2BbHrshoX/UEr2I+QwHzzEESSGQBeGEV
         6Y7l1HDb3TUudIY1NJMTw3zAaRXF1hLeak3AsgCxoCogfvWq3hwwex+bDCuOr6bST7zd
         nv/fPH5W/k3I804Tz5uJ15VJwCOQXGRGu83AIQsoPLAGdqfpc5lauc1yPzy0jXu382mj
         4N5JpdRWWj0AiVkVFY/OvcqtavJ3K9ch2cs66b5PIGlEwHDDYYCfX1fkaT5ug5IC7KxJ
         fgNg==
X-Gm-Message-State: AOJu0YyZG1LshyDf3AGjGMh1ZPtUxJr1YjS8rjjtAUfh6JTjbcR/PlDn
	bhACvDzu70fJT3oDks8uufpyVU8SkRA3C2ocKvyO4sSdpC9DpCOkx4jLcXkqnQ==
X-Gm-Gg: AeBDievRq54/DVkj/KeRIfZdYdBe/AOfr3jCPobmyo8Wa4wVXU1QKq/8lq/6aImbrQ5
	sReG8kOKZDJh6NKbNm0CfzsN/VBmwe3t305Hu+cJQGcWwH7WnuQO+zpq8oD00k0PPfuTT7EX1ai
	7LYzw5Erq36UyOm5UxuDkcWxDMcJhffxSKCkgeByx+5kBsaBuDSQYNeKPVgUvF+r4K8L8DGdmua
	W9dimDTC/55AymLMxH/I0jL00Q5hL2QJ6/AfJZm022AZkF2NZxDaZD6alm7xs3QJaUQ2dzoWUte
	CWg04vQAkmzPJePZh55ut5kmq3vfkGpDOSIpYgIeE2EzchGSTBDb6DoFbEFWi2yauPZe6HdS3Kx
	TnHhboSnV285azXR4MsXYTdW4dGjWf+eMYZReV7JLJPcpf/ylwroFZp2hNNM+C2F9JXJ6qk13xC
	rJ2ov9mGlu7u8n6vk5rHtdDU5w2Gk6YS+wO/DEvmsXK6skdHTBbtzhzGBgURm3fLx0jzk40o7V2
	2fLoMnrLw==
X-Received: by 2002:a05:6000:401e:b0:43d:4a43:53e1 with SMTP id ffacd0b85a97d-43d642cbb41mr3663457f8f.43.1775815523072;
        Fri, 10 Apr 2026 03:05:23 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5062fsm5840037f8f.31.2026.04.10.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:05:22 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 3/3] libxcrypt: Use configure knob to disable warnings as errors
Date: Fri, 10 Apr 2026 12:05:16 +0200
Message-ID: <20260410100516.3923530-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410100516.3923530-1-martin.jansa@gmail.com>
References: <20260410100516.3923530-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235006

From: Khem Raj <raj.khem@gmail.com>

Passing Wno-error via environment flags for target and nativesdk
is intended but is not effective due to command line ordering and
as a result some patches have been added to disable particular kind
of warning as error. Given the scenario, warnings as errors should
be disabled for all builds, this makes it portable across hosts and
across compilers ( gcc, clang ) and glibc versions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index d84cbc9db3..25cb7f6178 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -18,9 +18,9 @@ SRCBRANCH ?= "master"
 PROVIDES = "virtual/crypt"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
-CPPFLAGS:append:class-nativesdk = " -Wno-error"
-CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+
+EXTRA_OECONF += "--disable-werror"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

