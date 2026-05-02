Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC2DCD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9497.1777739444489058031
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VutRoX0n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488d2079582so30205325e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739442; x=1778344242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pfWCuUOxdxYT1LBO+v9Nz510vMPnYIfitJn9Sc0xqY=;
        b=VutRoX0nU5yq99zIz1+ISCRi2kYPWhOiViwZih8iJlt9RG9GKkVg3iIo6ilr2WHcca
         zUEqGH5p9DC5kreN3nCf/cFL+SBytxClzXS+6L/Skn7AVfTSHECLE8NpoOb0MshuWB8K
         6ozOR7vKpU5vcp1T4T5vb90GpkOpaOt/IsPa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739442; x=1778344242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4pfWCuUOxdxYT1LBO+v9Nz510vMPnYIfitJn9Sc0xqY=;
        b=DyfVRVNjO0R8+ad4Bhlnud/Qrdew2+3ttB5kGX7hyHm1Up5c8k026iP9isamfjOu2W
         Cfrjg4eTafhRSjlIAp+maQdl/yideVu/Qyyr1Uy/NoZx+kc1JIZHYJCmG57LuIilOKAk
         UOzSx0L+OABMrxXgWRs7+FHe4VBXhlzzD70+Hgn2JCELGs9PPr/ORQQTVFhLalkINdjv
         emBLy2EF7CpmAiUnaJn+ml3aTB6CH5mzSHfZVAKNrIfS/025C9Af2nUUkS41JgbWt0E1
         MlDkHeWcWIA7PcvMHX5UqZjvm0kaNVsr47O5G2CskTK3xRMr1BaKjiRH30nAiWU1eXtq
         3NoQ==
X-Gm-Message-State: AOJu0Yzb90oTufnz85PRsPUke0u7AKfsMYHYfIv2fVll5BfqNNUbdHng
	4r6qym8kRvsZUfSUPg+HS+TqHCWmsY69ldXxh5WYyWvq3Ay5bqvxGP58jkYowwogwYM4PgOXbAm
	7fUVVhzyEfV3TXBsZzrV/JhiCgmvGl9quBXGrfwAUq3ygUMMV2JE/ahtkTNMcgZ/f8BCKe9rj9j
	PTtm9Ln7luPD0z+Jc=
X-Gm-Gg: AeBDietcpRH8u1tyBLDcuoP6P0iGrRiZ77dMcX/Pcy1JBft0m0N8kAceFjS0nGm+PB1
	lQKwdHo+2ihKEcopu0opwOa5rwGAB/Hn1fR7ar1wMHKc1VMRzwDVh3uV0S01NiglL9pLAsGNbx/
	FsW7wE/OG+foqCcPVtRrb3JfrejwHlqI4mAjvhDx2+XTXu+XR4qTT//JkQPOFNzr7/BzTVpTdxf
	0YBzMQ3/o6/pz/LL4S7W+PwMND8vIC45ozA7px2r5ayeIkIQgYjXGUY7pfdBI68NcjETPOvp7wR
	bfe5nKQAJN6E+oQy9DOAC/YTvUwfusrPqCJVeqcU5Ci5Sj4buLZ5qe8cUsZ1Wp/djAduTZ8+yRN
	U1ZZ31iH6m2eioNyZu976juRu4OdG7kTBfEsp+O35lzlENwoJFXJSiT9VUtqEUO7RVC1Uzz+zCP
	69Sqr1gX6GXmKHOGUwvOYgaeOVZVmlGZ4YybAp5AyvI6brgGtx8HTy4p6mLY4EHa4=
X-Received: by 2002:a05:600c:4a25:b0:489:1ff5:edda with SMTP id 5b1f17b1804b1-48a9853c8fbmr34170875e9.6.1777739442381;
        Sat, 02 May 2026 09:30:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 34/62] python3-click: upgrade 8.3.1 -> 8.3.3
Date: Sat,  2 May 2026 17:28:54 +0100
Message-ID: <20260502162929.1377831-34-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236343

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.3.1.bb => python3-click_8.3.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/recipes-devtools/python/python3-click_8.3.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.3.1.bb
rename to meta/recipes-devtools/python/python3-click_8.3.3.bb
index 1f42fe1a50c..12fd3cbfbdd 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a"
+SRC_URI[sha256sum] = "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
 
 inherit pypi python_flit_core ptest-python-pytest
 

