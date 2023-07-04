Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43B4C001B1
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:29 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.61417.1688484626633178671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=J7ibGLGP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5577905ef38so2152128a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484626; x=1691076626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsXKyp4mGxb6HNutz1FHTLMQZfScifZPNeZZmbZTWlI=;
        b=J7ibGLGPDfXQ7HHtlgSLKB5DcxVPFapxI8vtRJkTHrV6k1N3TP/r0uv4GASW8FM+se
         aDi7LoCVwbzI32V05bueVaL3Ugwr83SzJcZ2HnrqR8KslfcVsswQpVcbzPV1ufViX+1o
         ynpHD89JjhO+j6lDgxINbBOJEBAtgVkl1i6ntFsABWxMRtZ0woNEftkTUebPvZoOdrgM
         HOGXtw+WkZ/GjSj9N5/KeKkrPpQMCVaR1JwERqNOjDqLCwNz7niDL00Ve5iBzwfJ/P5h
         lKFzSBNGH5mvI3FXrLLFhaNPnBJvHupekbUGbS/vHP9M6pjqpOabDCJX9Y+Ls67vaMBY
         QWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484626; x=1691076626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsXKyp4mGxb6HNutz1FHTLMQZfScifZPNeZZmbZTWlI=;
        b=K49eLt8u29Rv6AJ50gwjbyOavsn0OTiFSDCqzsIz1BzOWVOdHsZXczaFISmYpLwMEF
         liGwUDeivGmTXf0RW0Fa311Sk0QgRvyTcdhh3yu9sIDZ9DboxICPgvA2+UFL8BhsDyHa
         uNQ8wXcbagaUYuuPOCsjlwpMz+NkzdIhAFXDOawsQaqghDGXm/BT0aENX73I6rLB7Tnx
         nxPte6mj/mv8UhAzJU174jCzilyfaynpW3+LF3RoIG4PXc4aO4R4dwh3BMaB3n4yG82p
         Teeijm/+9HNS+irtLAWesJVMghxcOitCjgFEjlU1eAOjQup8CyTG+0adCfEgRwBepgqB
         ZhBg==
X-Gm-Message-State: AC+VfDyMNPjlqGwQs8YkfQ/BDfm28O9G2w12eM90/jvyliFPFKrt0VkD
	X1VoskW1AR5+bo5KZBn0bZK0WHU6vwfa0PB79Ybcag==
X-Google-Smtp-Source: ACHHUZ6a5cUw2Kjqwpc3iWhULKRiQg5+pmYM8SRyF5cfqUFMdYDShdnQi3sAjVAi46RoThmnDKZVzw==
X-Received: by 2002:a05:6a20:3d08:b0:11a:efaa:eb43 with SMTP id y8-20020a056a203d0800b0011aefaaeb43mr14614580pzi.3.1688484625711;
        Tue, 04 Jul 2023 08:30:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/30] unzip: remove hardcoded LARGE_FILE_SUPPORT
Date: Tue,  4 Jul 2023 05:29:25 -1000
Message-Id: <b7006ca2f56292312937fd1fa33e62ff908fad9f.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183858

From: Chen Qi <Qi.Chen@windriver.com>

Now that unzip's configure can correctly do the detection even in
case of cross compilation, there's no need to use this hardcoded
LARGE_FILE_SUPPORT flag.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dca7d1ce696e97ff4213dd63981f901dfd43ade2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 391e5cd22a..3051e9b5bc 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -47,9 +47,6 @@ UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
 S = "${WORKDIR}/unzip60"
 
-# Enable largefile support
-CFLAGS += "-DLARGE_FILE_SUPPORT"
-
 # Makefile uses CF_NOOPT instead of CFLAGS.  We lifted the values from
 # Makefile and add CFLAGS.  Optimization will be overriden by unzip
 # configure to be -O3.
-- 
2.34.1


