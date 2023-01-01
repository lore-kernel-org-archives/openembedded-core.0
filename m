Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088BFC54E76
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:46 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.16446.1672594689110446248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zgzdzi+A;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id k19so9734775pfg.11
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxVQDrxvdYPvsRC7zv7MprxF0v536nhht5TEDnZPd1w=;
        b=zgzdzi+A96j1IbA49atUS1pSET6xLlqTQL192Kdh5gFJMyM01rEa1eupMc6LMd/Vpg
         Na6DTGH0TuXYFdLEy+MeO5SKISl6BjugonT+jwX8zwz/w7IIxcg8hYGwQ3+xWqkzyaQM
         B8DDmxojqmUno7TbQczXEy2ii3VEj5YTs8vSOuFChQ1o+N2faECY0KoCkI9YwlaEOZwe
         afrUamtM+lx85alwJbaGl94MA/RK6cE/C5LDhEqKdL10UvFw4yOWrCE+voG+V4q79to1
         YHVRwkmqIzsZvCdzpF7BahoMJUTUC6B7PrSv2wLYXmT4LmldgCjuuAEGwJyp5Crfjc2p
         addg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxVQDrxvdYPvsRC7zv7MprxF0v536nhht5TEDnZPd1w=;
        b=goL7ltL6Hu1vraI8OC3/wPx6GAIuIImzJ2NyPFETh9+Y3sTAUT6a2i0w8y3EiWR6wY
         7tODG/GIwjBm9nwMQD1Z+D6oQzlKCh4LydVou3p+dmlMPvmL7GWD6JJmT2V7hHyTehgf
         aK7+UVHzKXN7qKLAy23xRpIEgadcvI3/UsigYMVffmyViVAleai5GGheqsgOnSkl2nST
         jJCqQBoz7XBRWt4Kyc8+prtr3zFUG7RYkLixiPqB/ieyTxQ6HDSooV6GX6UTv/cfrQvf
         JmwoM7C9dNPNvu6m9BR2tS34E1ahYVJFtCOC9+6xxKVnhH36/n+UXDnVztutrgwP/U3h
         OV/w==
X-Gm-Message-State: AFqh2ko3l9v5DDW9mkYZ+JGBUP+guKNa3A61tolc2HSHitAVySXrPIkI
	ZSxYB9guD1i862yJpM+P0XyyW3Ny50bywtUXvIM=
X-Google-Smtp-Source: AMrXdXtBxM3KS9b6LGmpOm+Z3eX3GCyijQ8fWjSwEwdxY9OyX4YKozGYVM0X/T3duqerJFhn7psOgg==
X-Received: by 2002:a05:6a00:be2:b0:56b:fa67:1f7f with SMTP id x34-20020a056a000be200b0056bfa671f7fmr39548268pfu.19.1672594718726;
        Sun, 01 Jan 2023 09:38:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/29] go-crosssdk: avoid host contamination by GOCACHE
Date: Sun,  1 Jan 2023 07:37:43 -1000
Message-Id: <0275d696dc5f3023aac016e4bb1935b38ef656f2.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175209

From: Robert Andersson <robert.m.andersson@atlascopco.com>

By default GOCACHE is set to $HOME/.cache.

Same issue for all other go recipes had been fixed by commit 9a6d208b:
[ go: avoid host contamination by GOCACHE ]

but that commit missed go-crosssdk recipe.

Signed-off-by: Robert Andersson <robert.m.andersson@atlascopco.com>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e5fd10c647ac4baad65f9efa964c3380aad7dd10)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-crosssdk.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index cd23cca2fe..766938670a 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -4,6 +4,8 @@ DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TA
 PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
 
+export GOCACHE = "${B}/.cache"
+
 do_configure[noexec] = "1"
 
 do_compile() {
-- 
2.25.1


