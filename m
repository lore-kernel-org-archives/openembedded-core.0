Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBD7C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 17:13:52 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.49354.1737566026870220414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 09:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ElvKO8D6;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso5905385f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 09:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737566025; x=1738170825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IySAKbvg8bWAGUNeV5sH1Af6t63E+wNd9m0s3SJzGVs=;
        b=ElvKO8D6N/759ujItsydl263oza0xnpEDBAtIbsCLLoK/vohV0QbIFuhCHORwrp2T2
         3KDDFYnoJJh88lLYyG96ng+UhvMj763qpeN5KPD0JxYtNk69OC5X96f490KGu3+HBfaK
         xEmL+byNbN/kGffgDNkvZbTYPW2rBYI9bTyuBI/V+xUvJVqcIGffrx8P9g95GfnP0u1N
         Mz0yN76R9LGts4h7ojffUa0cdLTK0DvOAjfUW6nbrbNBmDyJ6uF9M1ORnHBGdwXwdUU0
         lN4V1VAga2/dPBr3oMQ3G3MkqHlHaEFE2jCfooVMTrlQ/5xUcoPIt0Vk3MpsJlu9iBFd
         J3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737566025; x=1738170825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IySAKbvg8bWAGUNeV5sH1Af6t63E+wNd9m0s3SJzGVs=;
        b=e1kc3o6m+hBcPqFPJYR5UkyBZYHI5kB48xrGD0VrViYBjh9MNavbYIoCRwJtHatWJq
         3yuhRvyEV7WcMhbp0soSepZKQOyi+MG/xRmfHfSDuUgodR0tYcg0WS+Q2uvRzuQgREQn
         LhqCjq+gM/IIM+q8RKppSfAu4aK3iCDSX9QC79+xzGLJaEwR7vABGui67A/j7f535ITj
         Y+OQTERygjdjwYRgOE5qc9vUR+DRkf9uJzQOrNQvCZF70d2VVM/OLzX6JSwJOqcj3f0j
         cVA8xJMqSpDa9vlzeVB673er5cU4QWJwMfxVSIjb+VIpObMRsT2HxpddlhvaJMaxooJr
         L/bg==
X-Gm-Message-State: AOJu0YyawpY9J8joxA3AS1GMP80Z+JUd50HeNnYn5+bAK7WglbRt8luJ
	1J+6dMRz+ZCOzt0XDaudBXFUnS/1x1dWimZb1zsz2RzzVJnLsT4l0zfjxQ==
X-Gm-Gg: ASbGncvWgHdXkNDeQodphu0EFXVCeUJPdiufHaomjirZ8pcN/Ht2j83efGR+IaRIKwl
	6oyuNzzK7DqLBQR1KznpQC5ZxoLXWuhyxtFYZ12t8Pb7pesxbBxU3TKyPFYAjzhoqf6adT9GQ9Q
	15WHnKayIKzhJGBanZj12xxObekw+HND8ZR6O/bzNmm4LY69GP0enKMPlEeyEqD4kdvWiorovOc
	tK1lSYL4VpNYsB2p8Fsx9Fh01zCefY4xoUBLvDMQImoTlqWp/gPSBxr4GqZtr4e+AiQ2krUkrNQ
	D1kfizMenfZTzOn5F0owl9y7vBc=
X-Google-Smtp-Source: AGHT+IFxhlm+iYQMHun4jwi3gJxxtBT17w+Kga65VQNhxySxH0eP1qQpNAv4+0Tyv+eA6B/xL04FaQ==
X-Received: by 2002:adf:f48c:0:b0:385:f996:1b8e with SMTP id ffacd0b85a97d-38bf5659a94mr18199401f8f.16.1737566025107;
        Wed, 22 Jan 2025 09:13:45 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438b31a0f47sm30851545e9.15.2025.01.22.09.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 09:13:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [styhead][PATCH] boost: fix do_fetch error
Date: Wed, 22 Jan 2025 18:13:36 +0100
Message-ID: <20250122171336.2261801-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 17:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210158

From: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: boost-native-1.86.0-r0 do_fetch: Checksum failure encountered with download of https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_86_0.tar.bz2 - will attempt other sources if available

Signed-off-by: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-support/boost/boost-1.86.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.86.0.inc b/meta/recipes-support/boost/boost-1.86.0.inc
index 2378b27575..7113a50049 100644
--- a/meta/recipes-support/boost/boost-1.86.0.inc
+++ b/meta/recipes-support/boost/boost-1.86.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[sha256sum] = "1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-- 
2.48.1


