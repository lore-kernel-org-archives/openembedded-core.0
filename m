Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1272C531DE
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:30 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.96185.1723636947543849987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 05:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tL+0gixJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cfdc4deeecso4840636a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723636947; x=1724241747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtI5+eLMVtEJ0NggdLUxRaQ8HZa2JoHLdhq5Fadf2pc=;
        b=tL+0gixJdN76fE8+tmyU0IAdMMlZzUgkQFlS5i3+eXAXPmBevR3UjLd34kxh69XIKX
         TdB98621aypm485ZnAJMrOnQQYJaF0O6hdvPY9ke4xD0Gvrov9nZJDr5MgzlZtKhx3/z
         INhdgkFlL24cLi/ZNGD7JfZ9c/jIyI+ph14CJpG7WHB/TYdl/2cucMXhgyHmRfgpuMHY
         H7lEr9A0Bs1cXCnr83fRlODDrWnxzNKkuTGbCIz1UTPTrWHyun1Uem3L91WnrjE+Wn+b
         e2oH1ngmh/GIpydabDASDizsH6IgIwnKk2QP/x/1Yf8N8glTlKaKqZqBzjIXITsRCaWu
         EqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636947; x=1724241747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtI5+eLMVtEJ0NggdLUxRaQ8HZa2JoHLdhq5Fadf2pc=;
        b=WeL7Jd5vAFiMNmKQkCdlS8VT09t9deWL7V3JJCIjHEEOFI/F8kKxgk3Ulp4b6JeCsv
         3JusNySNi/G8DoEch3TKbL+/vASron+qO2Sla936D3I94vVjPvzxVPWpHe1WlqKS3HM7
         OZ1CfzW2GEXKFA6vDyCDsNv655G5Ivs267BlUOKD0Ys8UCj7U5ML1pGWxyAFACrjNmYg
         xrGQmHZ/de6WXd7dMH9oCPObcSQNZoaqMBhe1c3e2ufZ7ulST8F4cSUZIpNq5dsBmT1J
         7NUXDR1CQhBh9Hey1fxxWAdDElCY+tN+Sn0hRX9d0nZKH6nTcwOymwGVzhcBFXFGqy/l
         o+JQ==
X-Gm-Message-State: AOJu0YwwruJqtCUpGqpsFohn2r7nJ/+jphQKiXWe4F7IiZPDrljsixBd
	vtNhUH6M+ouJliETQlH0CpDK/FVyR5dP8CSIk+FzqbizPpc/OaT8TfoPKCVHlPM2C/W8qxwULJm
	9ggs=
X-Google-Smtp-Source: AGHT+IFiMCOe5WCBViqs2g0+9WMGyKVC3BRa3m34C3u+3+KAmxkfe7JufVjei++PNXGTsgX+/PT5cA==
X-Received: by 2002:a17:90a:2c4c:b0:2c9:6d07:18f4 with SMTP id 98e67ed59e1d1-2d3aab86430mr2815375a91.35.1723636946233;
        Wed, 14 Aug 2024 05:02:26 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac80e0d1sm1512214a91.43.2024.08.14.05.02.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:02:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/9] python3-pycryptodome(x): use python_setuptools_build_meta build class
Date: Wed, 14 Aug 2024 05:02:05 -0700
Message-Id: <1f33cbdeb5756eb876f01b637e3d0ea9dae0c63f.1723636705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723636705.git.steve@sakoman.com>
References: <cover.1723636705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203316

From: Ross Burton <ross.burton@arm.com>

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a32fa3e64d1daf5846c29403e9f258aea42212d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb  | 2 +-
 meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
index d24fa58d43..6c93c205ac 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "09609209ed7de61c2b560cc5c8c4fbf892f8b15b1faf7e4cbffac97db1fffda7"
 
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
index 2673ea8326..54578d2850 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e"
 
-- 
2.34.1


