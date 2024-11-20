Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F73D6394E
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:34 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13836.1732111049290905570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OeTyFLVf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21271dc4084so5203355ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111048; x=1732715848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgJHb//3tSoZO8DpVaI5uCt9BA8heULtS+p+U/dSdmw=;
        b=OeTyFLVfXFavHH9WdU8XeHt6S+fkhKNJglGzunXR+FEsh4WnTGQkOhflv2AZB5YSu+
         OO3/ICHn3/NNrvWz7tusSPa6ELML2c1Ssoq0IEFrzOqsii92rQ4BI1Zn3fLu3jZbKwbZ
         dTn+GXvCEWeuc29G7Dbg3NLXa4wKaR3Nm5ZtEPH4BR7qoadkx9HXy1FQplMRLnAjK8JJ
         1bygkTTzOH/10Ue2mKbJtSwZBNiTln3fyJXRIcICdLsQGslpD0pBDNYOkFztO3HCW6fP
         sodK2XC0Xz8dH4nvfrIEhhjxv2rJ8mufrvfVwiFwUfgC8wmjnBpKvrri/VfewbSzYAVQ
         ImPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111048; x=1732715848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LgJHb//3tSoZO8DpVaI5uCt9BA8heULtS+p+U/dSdmw=;
        b=wGmQqH2TQk6oQRwMMC8CnIFa2LHGTFneSysXrQKd3jiDBKfa77Go1itPGX0b0be2GA
         nHGgqZMiPgzktMWsH99nnHhtdXPdnYhR/O6mGEiD97Ofix595afX2VJxiGMbjbyp9pmj
         76uAUUVBUTnIazsPW/wTNmNWui/6s70L2E8BNGh7tIF/TEjgoclkukhfKObCiPnYmyAv
         Q7EnhtdPDR1V78uKmBw+aj9h9xhkf61bTpyOvHBs9YSZOS92laIU+nSZEaypkTurEHKy
         htwzDoNSBEPAjKg42q14VOmGBnjLN8uP7LDDDXwwoeChuwMbVZ8xGLcL03XMZ9ZmQXyI
         KO5A==
X-Gm-Message-State: AOJu0YzfwhCGgk1kxPEMgO+X4KYfHpFFF2WQ4VkcSgGe17YtabtADR+U
	18loyGBP0yORvJMO8pqzvRP9WBf17MYNLca43s2vF+iwaQ6JjVFP/YD5HnHo0DZAVWcqukvU6aP
	9
X-Google-Smtp-Source: AGHT+IGZ2yjPhTj0l2wrIgegE3y7l7ROkIO7Izj9obWx3qTE7LNyWNqZYDTO27goqX/Ok4bixZDezQ==
X-Received: by 2002:a17:903:2282:b0:211:f674:9d60 with SMTP id d9443c01a7336-2126cb3ac18mr28401865ad.50.1732111048577;
        Wed, 20 Nov 2024 05:57:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 11/31] strace: download release tarballs from GitHub
Date: Wed, 20 Nov 2024 05:56:43 -0800
Message-Id: <6e5456a6e953ae388612f60f87b8ff0c61e9376c.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207435

From: Ross Burton <ross.burton@arm.com>

Switch to downloading the release tarballs from GitHub.  Their CDN is
rock solid, and strace.io is hosted inside Russia which some networks
are blocking.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bbdbd6d943a64e5b0dae4c2ee705d017fb7ef80e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/strace/strace_6.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_6.10.bb b/meta/recipes-devtools/strace/strace_6.10.bb
index a534fccd4f..d9f34c2f81 100644
--- a/meta/recipes-devtools/strace/strace_6.10.bb
+++ b/meta/recipes-devtools/strace/strace_6.10.bb
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
 SRC_URI[sha256sum] = "765ec71aa1de2fe37363c1e40c7b7669fc1d40c44bb5d38ba8e8cd82c4edcf07"
 
-inherit autotools ptest
+inherit autotools github-releases ptest
 
 # Not yet ported to rv32
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.34.1


