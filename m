Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C56CD5BB4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.952.1779233431089656438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iabpLA8L;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so24508165e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233429; x=1779838229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4QbPNFNlo9az+eFASZc6qC/jQFj97YGYCUZSwuhQxE=;
        b=iabpLA8L+NGoEvJnxeLJrUcJUY+3rDnsxavXobq+jxkFs56jTnjRe4Z3A87VlGlq8q
         qsn9+lpKiLZm6asmpi5ikjJtSSQl9aDzZe3PwqcJalAUtuWK+iF6zR6r+O4CtBp2UAhv
         dEOAWmcwO5oL+fvTHN0tgt9405Aa3adEI6qA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233429; x=1779838229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r4QbPNFNlo9az+eFASZc6qC/jQFj97YGYCUZSwuhQxE=;
        b=bsyxGs3b9oaVfCDiQO3iqAeYRUySPPHYgGFzE21r2Lh1sBThio0E7+uFsTMBanR8ap
         CgQ3fROT0cpMw0Ups7op7dvnGRI6UWp9aKh2GzwbscpGuRmzbyj1Ao4sYVOiw2DqkDRF
         0thRsdidYbMB8AOL9PDuzQ0hGSDwkoDngp79YefWBrZpEYbGH5HtaJAoCcvXB25iUBUf
         KWMbF+bHnGSdsWjl3CJuq9M4NhGQEUVvlbtKFA6rek5yc5CAJDSc5yZVnC8Zcz+DhcJw
         qREgUIz3AuM88oaTXrQOzbjHiESD/yHpESEc/pRkBYtOTgpc/04626BBjG7I9Hwe7jZT
         WUxw==
X-Gm-Message-State: AOJu0YxVEdvFZp3Nt/H2vB136yw4G57VBGLGW5xgtrS2p8t+OAA7HTRc
	iRDEOLBpsOt7uc/feYjvKKbCjqswoUltFVBasypsyV6qV6D44L6ytsB2iEYH0y6mVhMsNJtpEFE
	rjRtj
X-Gm-Gg: Acq92OGMqeBrf66XKFEo7SZ/eWRuPmLLIoSY8m0UEnAKrsrvID/xHMcOsrd9kHLq8pG
	LfPijc2S/TICerCyE/JM39IzQmv3MP6PQA9+3KOvPGLKqMKr+EELkeoP3ZIx5hTZcJ6IQzwp2K9
	ZhCMC+HrZ01hUr989bzukugEdcNTgg3CPM32Hb8XWVXOZ1OO5EWRs2oLGcekvWT1+stfI/dY4HB
	89ny3uVzhSJ9PNheEw2GTchQ43L+CbWboxkSW8kMiXh2+Eih0Ls2YwgllTzWYLdKXWQXhzeX+WG
	akZabIXTRDOL2QDRYToYTyF2j74PMnNVHcbgqQcblRxikIqC2PyELSzyskqoZRAelkFzMYK/cAA
	jb/TTOLWH/QlUfM+pUbi/+Ccxni0mP55kFZ9W6MqXfM49T77udA8ebvkCZXTw5bJEGEiM2DqYdb
	fgzJXbovJcEK+zXhhyjucG+W81/rHUONDWEpfHg+6KmwKGb48eNzzm+zhUwqDggHtzsTzUiFTZa
	zqLUB1VSW+EpgbRyvH/gT13CHY=
X-Received: by 2002:a05:600c:c494:b0:48e:706b:53e8 with SMTP id 5b1f17b1804b1-48fe60ecd88mr311273525e9.11.1779233429250;
        Tue, 19 May 2026 16:30:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/28] sbom-cve-check-update-cvelist-native: Update source revision
Date: Wed, 20 May 2026 01:29:43 +0200
Message-ID: <ff88f9e551c2ed66ba1749e1c6ab4542ee39da26.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237353

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

Update source revision to cve_2026-05-07_1300Z

(cherry picked from commit 30b1f91d2a8cb1df5d4a65d2b55a3d26ff76937f)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
index 33871221659..3763e7f21f7 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-# 2026-03-19_baseline
-SRCREV = "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
+# cve_2026-05-07_1300Z
+SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
 
 require sbom-cve-check-update-db.inc

