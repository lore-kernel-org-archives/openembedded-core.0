Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C35F46115
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:05 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18023.1774273859732464410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cgeYHPIc;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5091d71aa11so52291251cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273859; x=1774878659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6PIZiE+R6OwHZh5B6SNxEs6ZEt7RzDaLshQjXPEUeU=;
        b=cgeYHPIcekJQ0O5nrzjLZoVbpk2+N1drjyTDbr4z1WytZQ689syq+7m0wxbM181pjV
         pW/zKT0kzjsEyxDvXIl7LoVXVYL4jWynMRFWEcUfgycZesK5DNLTwh0W2WigRuLmQl5Z
         Tdkipi8lDbXh2wYz8QDP5iZybSXnjx/65Klki8eOYgf1ekQ395FBfiA9T6HxMZwcwnMK
         WQE+dzBKHhdT0NgsivQEca8sX+ffBb2LEA5WRr52sXMSeRZMiXd4S6OWS/Bx16QY3Ej8
         tRDOfwOnxPwt1wL/tPFQDscC7qmZDiukzj2PY1sqmVDbMyX6fGMOLqPapMPAx2kEYoVC
         DXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273859; x=1774878659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6PIZiE+R6OwHZh5B6SNxEs6ZEt7RzDaLshQjXPEUeU=;
        b=THC3EY6/I5mKqbwARRvqtsnbNr+R2VfKwFXTsu4SLworLiefe5NdQmbclZpS/XEnhS
         JXsOc96j9/AzRNPNyT2qAE2to6Rz6bp+u5vtufnaQUdfF1c22CcRoH7/o94DRJn4TQjd
         Yb8pCXfGSw/ikRLbMv2CWFV+LH+H82YBZaZTBYmHuzORFqc4jx+mlvXGdU3vVBcSHQuQ
         owY/XCc1RU/wrtpsfkV49KoPiDo+njV+/yE1haXFrL0pFIu6WVOrf6bUJCu35jvf1OrL
         BJcpNvLsQLLYCJ+ZZSAhMX8Ok1Uh23JL3gHTRtgJKgWfDb6HzWMHbdAP1ZtZ4/db5TFM
         zRFg==
X-Gm-Message-State: AOJu0YyGDTcvD9vOGIBufWFYZPFn1MERlESP1XzZt0AUoLDieRHiaAE/
	G8sZkeejEpBfufMqfvjrG8n1DPts5/RlUIjJ1hdr5AI2HLeEvKtuUY7r
X-Gm-Gg: ATEYQzyzwFfnpqccFjaMq3ebuvp2AxQG9MTm3Ie1XAcK3LMcJqo/6xTSR911EZtdufC
	bbJ6UVV+KE6VXmN98RRee+RmXc7UwaoahdpMAVyFwKQ+41W9FcToVfIl3ZWQEJmJuEHDDKIaNN5
	7spXiIer6IE3GLyjVmP8O7Op7ZdmDyxN3/N/TVxNUjV+bqu91GkM/mB+sV/2DhSQXj6ff4xg3wr
	m1izgSLNaI2t8SXpDhqvQd6ZLFTGuTSoId10sCW7duBeYMV9HMgISQwu54esUOCK65+es0Doyl/
	NVauDKQq6tcotIiIpk8eTKjmVsC2KdCGohEE1ESravV4Ok8hGDuKVFwKWUCW6o6n7M9IFtHT0L7
	OFiYknha/hno4GBgyg2khd68QzDFZ1xuRxVjHAvg+ilMQr1t+zicrnZzE5As5e+nUVfvXsenJus
	e9YnmTA16m2fD3uvPQ4eIGoZNfp8LPKdwFCGPptbCwnSaMz9Qjmhvq1KtkTbZY7W74wYgQSLqM6
	iTkT6e14T+CDmIfati5hJgIY2iJX1ttECfeh+RjC91Ibw3yQH2XGy9zFE8fRBCJkNSCWw==
X-Received: by 2002:a05:622a:98a:b0:50b:2fcb:9891 with SMTP id d75a77b69052e-50b36ed66efmr165602281cf.0.1774273858676;
        Mon, 23 Mar 2026 06:50:58 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:50:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/11] linux-yocto: consolidated pull request
Date: Mon, 23 Mar 2026 09:50:46 -0400
Message-ID: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233719

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

As usual, I'm still working on optimizing my requests across the
separate repositories. There's a single numbering across both
repos 0-11, so hopefully b4 is happy with that. I've put them in
the single series again, as without the yocto-bsp bump to match
the reference kernel number, we'll get a kver mismatch and a build
failure

Other than that, it is pretty routine stuff.

I've also moved us to v7.0 for the dev kernel. I didn't find any
6.x assumptions in my testing, but you never know what is lurking

Bruce

openembedded-core (9):
  linux-yocto/6.18: genericarm64: enable additional qcom drivers
  linux-yocto/6.18: genericarm64: fix configuration audit
  linux-yocto/6.18: update to v6.18.16
  linux-yocto/6.18: update CVE exclusions (6.18.16)
  linux-yocto/6.18: update to v6.18.18
  linux-yocto/6.18: update CVE exclusions (6.18.18)
  linux-yocto-dev: bump to v7.0
  linux-yocto/6.18: update to v6.18.19
  linux-yocto/6.18: update CVE exclusions (6.18.19)

meta-yocto (2):
  yocto-bsps: update to v6.18.18
  yocto-bsps: update to v6.18.19

 openembedded-core:
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc   | 124 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |   6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |   6 +++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |  24 ++++++++++++------------
 5 files changed, 137 insertions(+), 27 deletions(-)

 meta-yocto:
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

