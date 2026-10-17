Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B85ECCF2C9
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 18:25:23 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1812.1792261518289875313
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 11:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jPh+xIED;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3550c917fd3so1044789eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261518; x=1792866318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0dLJzaR53kSaRXGFgJag+NGt/fHnBd1Qc+vyhSQibg8=;
        b=jPh+xIED8Hc+sg+Hrl1Kacl6VA9dNqSbOY8FGJuN30R+fy7D1vC9lQIfEcZrlNIR2I
         NpXePHsUoM6rtSg3qrDvO0RRQKVzDVXD6Bn6NNKgSwJb3RbDQ9Mky8ubM/vaQ9PdVhYL
         Bvq0G6wi3a0pscS1mM+2sDjW3ScQX6H2DEvtBK87rx1FvRhQPPSBM+MICyKNgCOWSd32
         4GaLPMET88/UyUiI86iz4rJUSC44cGWOB5NzvZ3hlm8ei4lekO8gDLaXs2JKkelhH+y9
         EW0wJ8785QHHoBgMbPsnvgRKfKmQZ0+g67x70vsEbf17QtkbiDPUABtAoD8gupaXiWg/
         SolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261518; x=1792866318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dLJzaR53kSaRXGFgJag+NGt/fHnBd1Qc+vyhSQibg8=;
        b=FP9r6quCdtfCSeVrm/Acmddb7igkB/cBbxYtgkKsCBBgak6yojNmO8qLoywLiPVp7m
         jgZOA83CZlXkg1/Dp5TdHd13xAWxKNFFT034jxNGHqZGDZshirZlr6fvbSLWydJHNZff
         CzkfaaOacYHas9YiRpLW+EUleeFWa1UZ5V7M/n6V9zEOA0BRrlqvPwreEaAj9GmaMnlX
         QFpAGb+Yt1TxcVQ1c7nsdIZT0LdiJ43RFh3bjnPvVTQWEwlHSx2x+nMqx5Z7aP//SAvP
         l5omZgRgG6p9z7p21hp6x93gObFkqEI41QggEYzpkVvT/bdht5JMw9XdqXFSK3FGnUvM
         ARYw==
X-Gm-Message-State: AFq9FYJUyfDqzkNcR+ve+N0uef3fvrC/NJEHSj0qUxgyBy+lfUILmQMN
	6WAoggGEqoQSEB4kPJn9xIXWaY5ti/SE3eJ5/2Xo5uHJo7nPtSZYhXSQot+PCnWoEJo=
X-Gm-Gg: AYBFou1K38AuKWqN3PPdvJQOPRyh15GGqJB2ZGderdTSAxi7nvCB84fmzGahxHuQg1l
	oxt8JQIPfHLx1s8E9AcB2AiJjtK8ckyA1hpZYJIVBiU9HtMr4bNLo0vVogm4B87xGBcKSp2hPa6
	RBKB8KL+t+qfwvTZlJvsKmJ0ur+4QqylYmdpP2znHmJ04IW34PAdGUmNoCRhkvKnrm3s+4hA0MA
	PCFUMaCe3snxKMNEqmpv+qpVL70slgTiad3nMVoH3ZPVvpn5jhIDcVnvHYNUrEdCCXibJmZp4kQ
	JxiVHYg5WuLqdoiittvbsaDv44wrzt+Gx0j61syldnp5XS6rvOmi9NrJAQDZak+5PH9QKC8298V
	go2dPPJOZwoOQm5pzB6MgtFMvmXQE8e8woB2YC/zfGuReQ+lSkvIj6y9rHpQ4x6OoaV2BJIaRiw
	9ku60HtAunZCViCJUPwQXFuZYDoBnlq/yFV44haF2k6NZpy2wILUexU6RLLnG0aVGjhXsnCdVio
	iHVc5v17ju6cf7cEsl1eJ4HDkpXFyuQkk9irEpXLiCLptF4OO9KHmYd1XM2/vm2U6aP2RpC7s4A
	S40+rRiAeN3/aTHnv4MQ5aAg2YORNfGFB7c9SX3r2ZwXE4SFXyPZ1Y0qPn3vLlHTYbZgo0+Kh9P
	DRXJ8YAFGgTa1baNhwHflSEn3BamrlEeuA9Jd2RIlG+NmCf+0SXFA+5z2q234iPAR9Z4eV3hUii
	D09mCUbNY3s7yUrYhJ0Yyqg7uxdcNGf/LAVUVcvLyOzjCR32HQa7J/S4Kf
X-Received: by 2002:a05:7300:80c6:b0:328:7033:9b8c with SMTP id 5a478bee46e88-361a12718d4mr6569703eec.6.1792261517397;
        Sat, 17 Oct 2026 11:25:17 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm19173325eec.8.2026.10.17.11.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/3] python3-sphinx: Add python3-compile to RDEPENDS
Date: Sat, 17 Oct 2026 11:25:11 -0700
Message-ID: <20261017182513.3727673-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 18:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248094

sphinx.util.osutil imports filecmp, which is packaged in python3-compile,
so importing sphinx fails on target:

  ModuleNotFoundError: No module named 'filecmp'

Seen in python3-breathe ptests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/python/python3-sphinx_9.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
index dcf769724f..44ed739fc9 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
@@ -18,6 +18,7 @@ do_install:append () {
 RDEPENDS:${PN} = "\
     python3-alabaster \
     python3-babel \
+    python3-compile \
     python3-docutils \
     python3-imagesize \
     python3-jinja2 \

