Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE967C021A7
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 05:58:28 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5165.1739426305939094059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 21:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cDa8qobq;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so207135f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 21:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739426304; x=1740031104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o8VyK+/K2wgBttKy3LyA6ijkSnUwmtdFqkSla9wH2Jg=;
        b=cDa8qobqBaPCc0VLn1bk29d1LqN2SXqLuS5vPQoFp0NzqUIJm3nEg1Fz6E6Nu6n1qm
         N8os6ZeUzfNmf+Sk6p6XRnR7/ku/SxUmUjaGq+Dihh7llbbg4bLtRIIwTQ7AA0AatnZb
         ZfPfTtFbAvsrXICY5RnBrrrIjC0YOYL7nzJfvzYE0iyHphnk0OFDJ69UkCy5ZPcjWiMN
         CRqm8f2bIS/HTX6l3LvNLeKg1+REn4SEAoaLoTJ0HZ36mtDIzJSUHIa+sLRC9BGBXKPd
         5eP7+Cgh7xGV4/LgcPeOR18HDC5QyBqmpqiogGBwjY5eOPUjy4wFqnI61r+VTeonp5YX
         q9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739426304; x=1740031104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8VyK+/K2wgBttKy3LyA6ijkSnUwmtdFqkSla9wH2Jg=;
        b=dmKGBEhtyfrLTqQQydm/Xtr+kw+usRzNm09SW1870rQhZXLaNVa8+A4zd4HEA2J7Fp
         R3CTdDQxY0WQx1XVqHZIMTqH0VtQyw0Q+nwLy4tQiOluP+j+k7ULHUsdD0y9Lh3e8l9Y
         kvLIOh9EYq6gEkRyWM2GPoB+vFivnH/W/YypwdzUQe/VD2l2lz4NnXOCt4d60OeFQCD5
         E4GBuiXA0LpL4cYii1AgoP8WpoAYEdRY16DnfHvbImdIXsYr9OrGwKKSK6CoKuLRrPSu
         yIGoSHAYSvqf8IlfJ6Pb23O+9GKrMXlxrIO+OQAJwPcFCHXRjxV3WugTu6cvcGfSgxR4
         JO1w==
X-Gm-Message-State: AOJu0YzozoyAFN7PoP4xvPW9QFOo1G6XaGvZUlFeLW87AHoaVFyN6UOn
	G4XgYiKh2yJEctPpjYFAqyjtkcWJNdUghif5uXVZ1yEfqKJlOfYN76YwCw==
X-Gm-Gg: ASbGncu0Z6vmc5xwUfRAqzLyJ+AX9Zo+nzwYZ3UsnjQpWydZXctDTbkIYm8vy9hfAUR
	SUFYR7HFqAmVA1OyMhKdXiEvocycNUK9Zmw1fgEtrRHx64qkybIjw5CEsbCLng/BGBbBB7I6YPi
	ahU20/Y5sCosY+Nx1VotdLFLmhbKPcRWY4qMkZHl/lvkRmZmhkD87p9ndrbOQzGaE2FH5n/j13w
	sIfJf5U6RCbBOVrxjmHTDD+FAuNNgHSCYi+9VawFp2jUwk4c8/r7ZkEiZy8WItJDdiay1RkcjQp
	kmKRQUsTP1OURCuLDQrHDGSYg1Y=
X-Google-Smtp-Source: AGHT+IG/xBEhjmhDN1IlWW6uTC69xB/tHKso6K+dR30LGYEAd7FfYW1ACrr4kC2SjFaq6YF5Y1F2Dg==
X-Received: by 2002:a05:6000:1562:b0:38d:e378:20f7 with SMTP id ffacd0b85a97d-38f24519c03mr1778784f8f.41.1739426303345;
        Wed, 12 Feb 2025 21:58:23 -0800 (PST)
Received: from voyage.lan ([2a0d:3341:cd51:2e10:d277:cf7f:82d1:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fc885sm7466515e9.9.2025.02.12.21.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 21:58:22 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v4][OE-core 0/4] cve-check: allow feed selection
Date: Thu, 13 Feb 2025 06:57:49 +0100
Message-ID: <20250213055811.6873-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 05:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211290

This series is allowing choice of the NVD feed to use, you can
configure them using the NVD_DB_VERSION variable in local.conf

Available feeds:
- NVD2 (default) - the current NVD API v2 feed
- NVD1 - the old NVD feed (deprecated, but still working)
- FKIE - the NVD feed restoration from FKIE-CAD

Marta Rybczynska (4):
  cve-update-db-native: restore
  cve-update-db-native: update structure
  cve-update-db-native: add the fkie source
  cve-check: allow feed choice

 meta/classes/cve-check.bbclass                |  14 +-
 .../recipes-core/meta/cve-update-db-native.bb | 405 ++++++++++++++++++
 2 files changed, 417 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb

-- 
2.45.2


