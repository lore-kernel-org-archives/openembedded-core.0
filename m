Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54982C02190
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:57:14 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.15746.1737734233594402048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f8Dd9CfO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so4289709a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 07:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737734233; x=1738339033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oy16Us4q0lcH9jG7ufOrQmakS7QkZ+U8JbczeFnGeHk=;
        b=f8Dd9CfOKMvj1XzrbHP9UrDqiqXgqzcZ0kECVR4rKCyaf/0HNrdlD9dlq1X6asyimC
         zLDRay5t/vAWKrDV87WSlk/LFMMfFIAzr/nsIDP8taUqMDI5UAjgrjC2xg2qnOvB9KEb
         v5wvICITabiSuO62eUDQU+MJVT0hqexs8vm9rNtJ6Qel7oO1JQK8Ca6Qi7CzjMwXACQc
         gxVs+Wzz0Ystivct/IWvJa7XCj2m3w0QCNdhxKHtBFM6ENYjSVC/vxK0yl+NSmuahnqB
         d9nwDus4ah/xB9j8p2CqsphILl33k2xqfQX0IXisM89zNPpNyN6IqcwuMH8y7m09PALu
         qdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734233; x=1738339033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oy16Us4q0lcH9jG7ufOrQmakS7QkZ+U8JbczeFnGeHk=;
        b=LHcQEl05/eKJtaa5WGEtP0zLYpOlQn5a/LgS2G+wMTk+aIk3FtU666VzwlWKg0Kk3t
         nIqSuLHtHobjUcyISPC4t7zpL6LjJtmSAL7AW6HY2MOR+YAmQPsPh1QgheWrMN64F9g7
         g9emOk2mP5ZUNP0rXbDEy6f7LbSxDtcTrs5vzeAAIMFPLHEJo25Aqhjts6EF+JSxyreR
         m3NzOp2v3Ui7NN1rvIQPr7T++goe8pVL4oC3bxy3S9QFENg7APx1J8JMGbNBhYcBt86Y
         QJaCbG5AyIyCaVsVAnqWEfZSKYulriPW5phNlTCxAqrX7zvyyh94k9WXLTUrjSgxk5bm
         4DDQ==
X-Gm-Message-State: AOJu0Yygc40RQx4Tb1QiksFNoYVQKC9HIt+EhBNzhVR0vLE821Dn6Byb
	caXijXmdx9SGWddkfXCXYy0eBjDnzuPfA1OVY8Aexm5e1LrOQjq1HzU27rWVGheR1N3Tx86RfMh
	iw1o=
X-Gm-Gg: ASbGncvKiJ4323Yg2HYZY0HRn7e7G8jnlmBzL2Z/KmbrtFoc/NkxMHmO7P1fNpcNz9m
	uLeQLaRNoW35Q9lh8tIVP0CJVPwpvGfp2i64qLtHS1u3+HFMPD2tPLlCD2q+2h0d0kLrjDbZlUB
	rXPXZVtziQCphLZKICGh2DDwFSC4jnv58CygMvnyVk0qrt+ivtMn84gL58sfPfALnWi3hWy7+Ft
	ySx30moIzQCliLZL/rPighVNXATlPOHwuJxy6lZQZOsUpT61I1uIrwJc8vSbYsov6Jsyg==
X-Google-Smtp-Source: AGHT+IGMCA5QsXR+686f6divkwajLOuUkpLewx2wfz6EISuznH/GpzIJujWjVty5kG59+BGPXKObPQ==
X-Received: by 2002:a17:90b:2e0b:b0:2ea:83a0:47a5 with SMTP id 98e67ed59e1d1-2f782c66295mr44738564a91.4.1737734232731;
        Fri, 24 Jan 2025 07:57:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm1879168a91.38.2025.01.24.07.57.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:57:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 6/6] boost: fix do_fetch error
Date: Fri, 24 Jan 2025 07:56:54 -0800
Message-ID: <06439dff5437782f7b6627e0374eaa24ca5aee4a.1737734087.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737734087.git.steve@sakoman.com>
References: <cover.1737734087.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210233

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: boost-native-1.86.0-r0 do_fetch: Checksum failure encountered with download of https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_86_0.tar.bz2 - will attempt other sources if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


