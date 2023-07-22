Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB76C0015E
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:19 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.11715.1690052239126306326
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iRa9CgxU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6686ef86110so1730383b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052238; x=1690657038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw+r46iwmZo1MzTnQueqi5V1bUEhNZPfAC1U6x1oL7g=;
        b=iRa9CgxUMZHXsD4e3bqBdaRWT9HSRkkVzUNP7bdUwNiVLECXb59YMM9ZSFescXGsMm
         hyjFh21p4qjt6EJOJ2fvnLU6DlQkp8GGfm2nUyBG2zM1FDjqPVdrEk2OkhUSQ8BMio+A
         +JxxmO1N+5EAeaLBNeso826/S9tNI24uCLUQYhlpRi1acw6dG3A9hAgeaSiHHVCmeXvS
         4ki90tpiM/teczPELahxCxo1rj2ZjFICIiWncWzqDjYtLyEA9j0POEQPKm0fSo1Fc6AG
         h/tl1AyxR5uB2nL4+x1BSuiDy+wtQEvTD43KB5Ro2AbW1mIHwiK1L2+RFDEK/+fzcEI/
         fm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052238; x=1690657038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gw+r46iwmZo1MzTnQueqi5V1bUEhNZPfAC1U6x1oL7g=;
        b=N9S6J7N70DY9ZltnYp+Z/vLmzWfCsQMENlSuqAE7nkn/mAPUYw8M8b2Dky4z9cJN8U
         t31eB90V+VArK2yeeh0tsSyn/SJsILLD9iZHj0dRAGCjzRR5zwBPPFSTYHHxkDzRMQNS
         UoBk6qA3fGe+CHj8QQ0VVRpAP/ksKGZPUcalia6htGPt5H9x0bSrU/LXPbwFndiAkB1k
         Cb+2oRls3mczL9T7/cGaQB8fWIfRjCiXTjeWdl2BXvpRmnmAGe6pQDMBIrCJvqb90UD4
         0U2B95mzJqcEOCsuGOKipQA9lDPXQdBY7GGG/qOks6F+qmqzyobezYpjBtpaYbdXtlei
         FAhQ==
X-Gm-Message-State: ABy/qLYu7YF0sxYy9SqZMeb1fs2aP6ahaLBngT0JJOyAuk+XU5aJUYW7
	XzOOI2fYXR3tVS2rY8wEHDFMEpxpGt8UCH4qsRI=
X-Google-Smtp-Source: APBJJlFH2yfeYKK8i1suqAmrIiWff5jmcACRuGYYHhQi/EyQk6z/J5DZIa7RwfmzNXwAHuBu8TWo8g==
X-Received: by 2002:a05:6a20:1018:b0:137:48cc:9cfa with SMTP id gs24-20020a056a20101800b0013748cc9cfamr3349239pzc.24.1690052238288;
        Sat, 22 Jul 2023 11:57:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 08/11] gcc: don't pass --enable-standard-branch-protection
Date: Sat, 22 Jul 2023 08:56:52 -1000
Message-Id: <81351d984bc6238e9b901ae83c0de6e3d3463c77.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184731

From: Ross Burton <ross.burton@arm.com>

By changing the default code generation of GCC we're inadvertently
breaking the GCC test suite, which has ~120K+ more failures when run for
aarch64 compared to x86-64.

This was because the generated code fragments included the BTI
instructions, which the test case wasn't expecting.  We can't tell the
tests globally to run without branch protection, as that will break the
tests which also turn it on.

Remove the enabling of branch protection by standard in GCC, we'll
enable it in the tune files instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb4b9017db6a893ed054a2d2ad4cc671dec09c42)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index e4cdb73f0a..dba25eb754 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -40,7 +40,6 @@ EXTRA_OECONF = "\
     ${@get_gcc_mips_plt_setting(bb, d)} \
     ${@get_gcc_ppc_plt_settings(bb, d)} \
     ${@get_gcc_multiarch_setting(bb, d)} \
-	--enable-standard-branch-protection \
 "
 
 # glibc version is a minimum controlling whether features are enabled. 
-- 
2.34.1


