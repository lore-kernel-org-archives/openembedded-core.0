Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CB2E64035
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:51 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.10689.1732226084739485638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JbcG+qtD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724d23df764so861457b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226084; x=1732830884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTz4oUJ9zCGmo/XT4lG1lJ0MweYd6Z3tlgZ2irakZdM=;
        b=JbcG+qtDc5Kvahk1yyIlKMYBYJJ9mbKFvbiXcplOymr6SBGLlf/1Jb/MHiPY99NfMu
         Kws3Ta8gYVEPJOMqshG1+JYagcpqNe8C8VkDPoRqGa2NiAwH0bAMmd/bu820jL4bUhMw
         +pEyr2iaXFy2JVrx8p5fKTwuGa+OhdzTF2sYIDeaCCTxshhhojNmUpmAa8e+ADTD8qlg
         zqGOArI1PlZwp5Fexs9bCDulhABc3xjiUxI9WOJ0l8WBcus4f+b/aSswjM9SfVbxi2EQ
         GZZzBWPQgMg9bCD0rehhTGuzdJyBNFdyw3Ky0pHraLeblvlBeUAB8GRBKUMKhsS+TuNu
         avbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226084; x=1732830884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTz4oUJ9zCGmo/XT4lG1lJ0MweYd6Z3tlgZ2irakZdM=;
        b=CNYinwhHm9YGujkSJ1DBmEnVNoHbXeWGsdTFHjUCZQm+WAsCuRHY2SDjrjzNY2JHft
         kQ74Ykh7A7CQFbKJvbiY3X5BoOVvR2wpmQ33iG3qANCnwivJ234R3kdvvpw9OvBSDP/e
         jkBmnV7ZDbeqJlkQejz7oEcHBOH/QQhrQ8IHb7JSMrfmDsOlmhbTMpsDhB51OtRroOyB
         7+e3Z6ioxeLpVT713ZiVmxKWoYKDpmaLeqRyZlLiy550Sfir6fXCOVgTdKe6YbeZ+1vW
         iPCh4u4j9zuPPvET1YI8q1YEt9LDqrqZD5OEIU4kYbsF3jR4JgpQpmxGfSA2SISc6gBI
         ExqA==
X-Gm-Message-State: AOJu0YwjGmByGxoG/yPH3XP4xbYjdy0A6GUU8mOMubfEHcIdYTzlp+Wm
	9D4gAXAzPWlw5B+i2MeqnwMM0rznd9aYdwpX+jCRh75wOV/RBQXKKNXRwuq5BC0wZpihWDddvhY
	p
X-Gm-Gg: ASbGncvPdZuVr08maaernb4kqPIjaCN8KkAswsRn3y7IK6kWuHyd22BfEIeqnIddgFR
	GSl36X1yZlM5q2vErEP1+fx8UIoOpVy/Ozv4MurqJHIYpP1NoGjZYvmVyKZlFigIoRffJ8wIzNo
	TOCygrA0ZDo5yF+zMvOvJHsHdbGB/xeDuwrOaM6/GoaQ1NYbAMs+OewmJn5qVQUdXvPKbWOhNr5
	DiLEuwgI0elvx7ojtT3Ws5/Wfy39P+/QI3uLfg=
X-Google-Smtp-Source: AGHT+IGO+NXJ98LpnbMBMbicw+qe35kDuxxoKQvDWia+QRWFTaeq+wvTP4WEOKoU3MjjD43rk+YWiA==
X-Received: by 2002:a05:6a00:92a6:b0:71e:cf8:d6fa with SMTP id d2e1a72fcca58-724df62e225mr638056b3a.15.1732226083664;
        Thu, 21 Nov 2024 13:54:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/27] strace: download release tarballs from GitHub
Date: Thu, 21 Nov 2024 13:54:05 -0800
Message-Id: <6525ee380140779bed100cb0eaa70915677e885d.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207570

From: Ross Burton <ross.burton@arm.com>

Switch to downloading the release tarballs from GitHub.  Their CDN is
rock solid, and strace.io is hosted inside Russia which some networks
are blocking.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bbdbd6d943a64e5b0dae4c2ee705d017fb7ef80e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/strace/strace_6.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_6.7.bb b/meta/recipes-devtools/strace/strace_6.7.bb
index f365477ccd..c8c83cdf7c 100644
--- a/meta/recipes-devtools/strace/strace_6.7.bb
+++ b/meta/recipes-devtools/strace/strace_6.7.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2433d82e1432a76dc3eadd9002bfe304"
 
-SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
+SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
@@ -17,7 +17,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            "
 SRC_URI[sha256sum] = "2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7"
 
-inherit autotools ptest
+inherit autotools github-releases ptest
 
 # Not yet ported to rv32
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.34.1


