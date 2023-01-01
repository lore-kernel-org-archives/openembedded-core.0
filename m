Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F9BC4167B
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:26 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.16621.1672595001494051911
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LjRxtUcv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id ge16so24176759pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lgEZDgkNqXFrKv/3B+UZNrshkibwsjE0A19ThMchAA=;
        b=LjRxtUcvWn5js7jZWeDb/CCw/WEpgtqCGNyganUHzfj6aEceuEzATtiqVTiFGkTAA4
         0oC6qcDDT9+VlAoRUSDGQP+D97A3SyYO8NU7U/arPsbrE2uCgsWveNaeusTmwUhponfT
         lsCxV6b4HK6pG3wHZGqWxAU60EaFI8A7LRwmavQ/ixaHsJk7V76W9ZoN6gNhrpiQZHN8
         Pw7aohaEu9pBL6YPftBLL4ctrMTjodlqqF3xUMysNW6wc3sggkQJ7pGOFXqKYE4cHm88
         JZIYTahXeYBNHUyQi5MABx8wMUQPSUnpmma/LkmHPjgS47Evt1kBLohYgZIlGnZgp9aB
         HgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lgEZDgkNqXFrKv/3B+UZNrshkibwsjE0A19ThMchAA=;
        b=msFlcXPm5Lfv/WYIANAT0vzsetmbi0cVN/slukbuTtshtXOyDEtNgSUgdFIsbUHKsA
         N7+szzJNRcMS4kcvjCv3ivzNHfL0fRLms+0+ruGnIgyIBkA9WF3NXxBw1+537en67xju
         7cwGdGgqN9vlKoDcmfSeBarpsj90MuPMTjcJccQRkIRPGLlS0Po4QBRW+F8o8WCLWwii
         Ok8G0k8IZtKKrIu68rk0GvItgDb0SRWbBQt1E/8EiVZdCDzAUtYQVoiVGJHOtHa0dqxy
         Ub0Y8uUmZvqRltEAnTSAPrJcHwluhs9bV6JOqYFfPM8o63rTBk95GLCvtPzGuYeUwxle
         esBA==
X-Gm-Message-State: AFqh2kpsVhAZqewDFDucXhztncilEWMkC9JOhj4wt7iLqLAd6NIAjFVU
	xq2rBJ8c8N7CqTPTHOoVJj7j3d85E3cACOaHIQk=
X-Google-Smtp-Source: AMrXdXt5XjNe2rDMOygntW7VApRmUqN0+tPMWktvZf+UOhumCJl3R0ADFI4J38fdwfO1gdLs6OfejQ==
X-Received: by 2002:a17:902:ee13:b0:191:3c8:a7bd with SMTP id z19-20020a170902ee1300b0019103c8a7bdmr42822084plb.6.1672595000647;
        Sun, 01 Jan 2023 09:43:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.43.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:43:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/18] go-crosssdk: avoid host contamination by GOCACHE
Date: Sun,  1 Jan 2023 07:42:33 -1000
Message-Id: <01afb8d08abcb105018b08d3c531be5844e1354b.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175235

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
index f0bec79719..36c9b12af8 100644
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


