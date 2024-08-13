Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6B7C531DF
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:12 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.70602.1723551432484912793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bDt/obJp;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7c3d9a5e050so1914265a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551432; x=1724156232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/xPi4U7jK0JjC587Y8vsp4dPfMTPaWLwXZ7Z43Ty5s=;
        b=bDt/obJps6n9YoSHvBAocS88SUAgUC+JaadZ0kIHCeUOTwgctzjLaI0xOlIa7T4hyr
         7kzIRT6K4nCCdSwx2cpZTIFFTJ+tETKOwdibPPlxuFRQEgjDE1dR0CVlelE5EEOmKVnQ
         7wIAsX0VBeQv5NcBLSuLAuAY+YGYj7SF8mA6THrV7g1tCc/DFY5Vo6lImkAw/XQGShnB
         MIdBKRHru1R8RyipHg/i95l7vJlb83VmT9sHCz7SFgsbhEpe2rceoCzyZnnXSMfaCKCv
         6ikApUM414CSrog8OvJL0NRh5J4ChwtnlikMmVVEhxAYCSw/KIrelH2uR6/FZk1ssWRg
         KdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551432; x=1724156232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/xPi4U7jK0JjC587Y8vsp4dPfMTPaWLwXZ7Z43Ty5s=;
        b=b8+oZsJ/2Z3yj0zqS4lXilSikRNS3rlLF5s/bQ2hB1hYJHDm5QUhXX22wWCJa8SNQx
         bWdEn9RZxMh0bbViiIKs9mA7XeqfT4EuNbIvmOpYy6RpFGeppQp28k9G9wT160KgZV3r
         83Uj4SUXEA6SLXAngK+jS6c9kAXZPx00Jjkz6iso41EaMjgm2ka9VltUsUmBDRhMM8Sk
         tO3hx9tNZQfkaJHqmZapwbmtHCG3Gp//UffTtMuS4H+9W4zGsheJM36mCwlmS/b+GMdk
         alP8QHTuaWqvqKoBD0IyedPf9vgxW/4rRwK9ZnAGEvifQzDoIkotPSGgQPnIwV75zdRK
         qxaQ==
X-Gm-Message-State: AOJu0YwFEnQc1352BJTbbYtHxQYSa+j+IvJpwpYZDlL9DDhifTeQse//
	7pBVjWFiqh4NxAICErQoldg0JsUKDVs7m5ZH1NxCHG5iAOFOyfDu1z4U+lTY9e4q7OA8fLA7tMo
	8K9E=
X-Google-Smtp-Source: AGHT+IHaBOSRu937l9ePtSXy4JCoGI2WAGbOE6exkQijaostFJjVoT2uWf5oyglXMWDTdC2kD6qP7w==
X-Received: by 2002:a17:90a:540d:b0:2cd:2c4d:9345 with SMTP id 98e67ed59e1d1-2d3924cb70dmr3592968a91.6.1723551431610;
        Tue, 13 Aug 2024 05:17:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.17.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:17:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/11] python3-pycryptodome(x): use python_setuptools_build_meta build class
Date: Tue, 13 Aug 2024 05:16:48 -0700
Message-Id: <037652806f786658f3dd091704befbc67dd2786d.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723551231.git.steve@sakoman.com>
References: <cover.1723551231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203275

From: Ross Burton <ross.burton@arm.com>

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a32fa3e64d1daf5846c29403e9f258aea42212d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb  | 2 +-
 meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
index 1e6c514224..fef9d2c96e 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.14.1.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "e04e40a7f8c1669195536a37979dd87da2c32dbdc73d6fe35f0077b0c17c803b"
 
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
index 31ad3fda5e..c981e53815 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "2ce76ed0081fd6ac8c74edc75b9d14eca2064173af79843c24fa62573263c1f2"
 
-- 
2.34.1


