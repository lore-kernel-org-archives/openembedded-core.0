Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D1CD25B57
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 12:59:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12576.1769605107399387757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 04:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=aPNpcv2B;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.128.41, mailfrom: alba@thehoodiefirm.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4801bc32725so52294025e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 04:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1769605105; x=1770209905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUnQQqbf2R/BqY4Fh31LPvXfwoV0m62d0660ZkOudDw=;
        b=aPNpcv2Bx8Tu1o7sdxPg+col0Ph+lTbcUBAg4zZ2obWtvCJ0x5Oc0MVw9rMDu//v6i
         CVL1tApkgzTektArq2z7ZVtRwf8w08/87nbdz6YwRqqcWu2HSIc5P0/E1urYSpZKNyV0
         t8r//ha7/RIgE2uE9s/sErHAbXBoRQk+J2IhTck7Htt5wJIFoTidt+1QPB++P+nczSR7
         aVDgeHb9b6qDZXgg6P1NI6Zf9gt2fEwn7NEcJN2T1zrFuYgkL/NHtyLvNTxVY4PonNzO
         3Y7I2svh7nvd/Rip2zuPTpV2LFewd9T+Agfn552R6T76v1/iRkqbh8MVCoVr6iegHyGQ
         qQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605105; x=1770209905;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUnQQqbf2R/BqY4Fh31LPvXfwoV0m62d0660ZkOudDw=;
        b=IlW2hQATgUpDoAPi+pZgoIr7euH0ABFPwuSPu3nS/fE11e2uc5oMTpXl6igGFGBUDX
         4/IpqPDf3i0+n9Fg+zF6gapUFbKDh7srez/1lKrS/L+Ds1pe6VUPyvnM4OgNp+lkHW92
         QE094zg02VeFmZu00/Eb8/7+KHJCCkaG9g6DyU+tycP7XRG0dvxq/NdZj+uvhvKmcyMw
         o+Pe3xbp/cMLFpTpQTvoEsFEONhV0D5eVZLkMn9ggto/9zDnZ7nFT5GwL2R8WJV21DOG
         syf/Uvv5zK48N0M96p1yeVg8Kihw500IUYcyh4w0GDFFaBijKsJlwWnOFW91gdIP26j9
         APXQ==
X-Gm-Message-State: AOJu0YztVobrcyPJqtKbc5gvXaZ/HBAIXzZNg6ZvHByzTJ5Z3HdhXPVG
	UfgHNQ0dO3oB2p5pYCPUl8V6osfEYC3jJ41OexPMdgIkmzlpGG49+MyD9nYkMqoWriFsqOA+8cW
	cTn3fRGQ=
X-Gm-Gg: AZuq6aLZoS2nQoDZy1fM5Xamo2PhEOOZRYrphtTBs8edyeS33rDhQ7hys3rmYS3tsGm
	TEmPIZZ89PkDukOngfPBHRDNMF993fxZD9dDcRmeZiexfIYyfQ6R3wKFD2YQcxAiN9IiGoojSRJ
	Z/L5faSmHn09sHdzZmXCeGCVoM9Xn3n8D4WJBSXt0NngoDr1yZXRJn2FVEYTGC//y+iUROFbDNu
	UBgGa3IWwF+ltPmF0W/inEXbRhXamjXH7zoXT+kf9/br37rBtLe7FAqMBdvawbZVd1UqIsIBdH5
	CcLG7Rnc8ZQeZabbcld85+vUj2JarSy+T1nNzzJ/baKFL0kEgyGPmIAv7Au/MggpsJxY+ckDioo
	PGchrCFfkdffPw+RLgvSODTkAN1rNUdp8CtGmUoWK+f22I1xFVa1Lr3yubEHK3obtfOEaTOSZ2z
	cZdt8NRUAX7iQkOQcCPhsJEeu3u6p8GVKkGRMAcyAVQe4mK7kx/anGznBNkx4M/QptJJOpMCcS4
	G4rRwTe713sCMw=
X-Received: by 2002:a05:600c:450a:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-48069c3968amr69395605e9.10.1769605105408;
        Wed, 28 Jan 2026 04:58:25 -0800 (PST)
Received: from localhost.localdomain (253.red-83-57-139.dynamicip.rima-tde.net. [83.57.139.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm64744475e9.6.2026.01.28.04.58.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Jan 2026 04:58:25 -0800 (PST)
Sender: =?UTF-8?B?QWxiYSBIZXJyZXLDrWFzIFJhbcOtcmV6?= <alba@thehoodiefirm.com>
From: =?UTF-8?B?QWxiYSBIZXJyZXLDrWFz?= <alba@thehoodiefirm.com>
X-Google-Original-From: Alba Herrerias <albaherreriasdev@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Alba Herrerias <albaherreriasdev@gmail.com>
Subject: [PATCH 0/1] build_perf: add commit annotations
Date: Wed, 28 Jan 2026 12:57:44 +0000
Message-Id: <20260128125745.58440-1-albaherreriasdev@gmail.com>
X-Mailer: git-send-email 2.40.1
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 12:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230092

STA 2025 Milestone 4: Add commit annotations to openembedded-core build_perf pages. 
Now loads commit annotations from https://git.yoctoproject.org/yocto-buildstats/plain/annotations.json
and inserts them into the page where necessary. Also refactored and simplified charts instantiation
and template handling in general.

Alex Feyerke (1):
  build_perf: add commit annotations

 .../build_perf/html/measurement_chart.html    | 168 -------------
 scripts/lib/build_perf/html/report.html       | 222 +++++++++++++++---
 scripts/oe-build-perf-report                  | 153 +++++++++++-
 3 files changed, 339 insertions(+), 204 deletions(-)
 delete mode 100644 scripts/lib/build_perf/html/measurement_chart.html

-- 
2.40.1


