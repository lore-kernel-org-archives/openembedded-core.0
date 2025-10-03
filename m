Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921C4CAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:48:23 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.887.1759510096242110938
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V2e39nGS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-267f0fe72a1so19350885ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759510095; x=1760114895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpBomaPJVh1bV1leGaiwQdGFsJlpVkLI7iIBYECSBu8=;
        b=V2e39nGSlTqBR9NwsxYg8qrX248pxDGOOI7WFSFsM26epsZj8K26YNycyAVNLyYfsm
         dlAczF9XvLln0tWYxoMEWkgiccIvDj8RnelwqerANsn4HEzfpPUIvL774EKNGeN8hvqy
         3M4MLAwFgAJXsMVrh+yxgkItTThBhTJP0B2o6aexCfhI0/fuABgDjGe06NPTV3uC6krg
         qwVkp2HNdGEKF3CKaE6Vp87SDhIQaxPC5YChWf3buBvBFFEBH9OpwcxBjNYWmhoPJXpE
         9GGnFics6xCdpe0CwIiK/WxuNquRyKp4fsy6ejotJa65ofY/XUkPtI3koPxFcz8+91eL
         kJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510095; x=1760114895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpBomaPJVh1bV1leGaiwQdGFsJlpVkLI7iIBYECSBu8=;
        b=a9gNxu49QpugiHvF0oEq3IWGJ8RpXoI4237kH3WLdxX01MZL9CqjKST/jpW2QOrWLe
         Rw6eRaeexA2fOQtL9TcKYRTfXQMLK5kdYlF7DW0uT7Sv2SPqKpSVcmYUfRZi7DKcBfRs
         ovXegpxgegFs8ewGqajyAMehUGbaJaIeaRGPiyNQTnP3Nn5wIurpsdECUo6k+XHLs5mV
         CX5irqjvH3ovH+wqdJi705cYgIdgn/n8lCDtyaM3lDjtSkV0hs5lynf/Rq7MctBDqfkR
         9gL2jlo/ngcRuozvx+MXZSY5vVdOuKcVt0KRQNiJXZmOMtf+cWUMyKhrDY74ZXsPEx0K
         fo5Q==
X-Gm-Message-State: AOJu0YzTTNRTYanvyXbYZaCdnIzkxdfnm1/nk/QgZaGP4MMpY29Rv3qg
	VrrW08ITImB5f6b58VUege41Xgt+84i2Cn1gStDEdqhgLJjyakai5+FVyvAbZ73lghYCNTg27Yf
	7ZJKt
X-Gm-Gg: ASbGnct573/so3ZvoP8MQn3O91CJ36cS2RMPpha4eJ7wOFYxTm5K2Dz3y70miBpXy/z
	cKBVZs0Z6QUE+FwyHBlDNVtKOmQkgEwOj0GyWPmepxTlfvC6VYzzaMHfDwyfTBJExyELGZ7rh2l
	rm8GBQ6dmV+88gVFZ2P2oo2zTuJlIgBTBrNy7zg6S7oqN9BN3wGJpZ70yHmJM4OEwkNR9lqfBT5
	zte1oV456fvlP0qjio3KzXeqCj+2i5eJ/tqESCFWJf36SVOmVUal7LUkrQtGWFQccWggsUAv4I6
	yq13sKwr8m4FhOlPhQV+kStLRlvgFjAsyC9lvXiSfHFNMULVesLeLNii+tS83N8k0vKpUQ0ptL0
	n6NnYXGUyLKquxWA2UczAkydWItUab49uZRambg==
X-Google-Smtp-Source: AGHT+IFR1aimwu+ePnxGoG0CQMkLEodxvAvbgTqP2uVu2nCpHwoenVFLXjkg9tQmrGHXkwH0mfYIcw==
X-Received: by 2002:a17:902:f642:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-28e9a5fabbdmr39965075ad.18.1759510095462;
        Fri, 03 Oct 2025 09:48:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bdb:26c8:eafe:889c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm54352445ad.100.2025.10.03.09.48.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:48:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] expect: fix native build with GCC 15
Date: Fri,  3 Oct 2025 09:47:54 -0700
Message-ID: <2696c50af9946f425ccaf7d0e7e0eb3fd87c36bb.1759509931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759509931.git.steve@sakoman.com>
References: <cover.1759509931.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224410

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This does not work for native builds:
  CFLAGS += "-std=gnu17"
The line from native.bbclass gets priority:
  CFLAGS = "${BUILD_CFLAGS}"

From bitbake-getvar -r expect-native CFLAGS
  ...
  append ...poky/meta/recipes-devtools/expect/expect_5.45.4.bb:44
     "-std=gnu17"
  set ...poky/meta/classes-recipe/native.bbclass:44
     "${BUILD_CFLAGS}"
  ...

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index a89b48ef1c..f1d30d8217 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -41,7 +41,7 @@ S = "${WORKDIR}/${BPN}${PV}"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
-CFLAGS += "-std=gnu17"
+CFLAGS:append = " -std=gnu17"
 
 do_install:append() {
     mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
-- 
2.43.0


