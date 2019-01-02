Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 116CB6BDCD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 19:21:21 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b7so15576330pfi.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ctLZkGV79n5BK2zjtTuFJoI5GyIlYWbRmZ4Oj0DrR6c=;
	b=Od6ovoOMIKzzZwEj/2UZsTOmWTxr3PIZ46iN8gkm0rSbpCzMlncAB7q4vhZeDPB/2/
	qnAOpG6YSDv9+r98/P2bBJVo42RazX0/GBYln0ylRbnM1GyimsXymFlwJBq1QgSMXr2R
	CXZR200BCep6w3lLkfIy6Jhuig7yyGC+efzXT8Eb+7hR8FTldar62JbRLyuS0FK6Y114
	h/jmuOXzLQ4YES3X3/yfeX2neZCkaziZVT9hrCDpM/UVboCjfUzQ91O5qWSZ1UJmD3LO
	WAgGsGjfVwvMMBz2Uj7E7DPfuHoE94khhiAnw1Drp+JGY0G3VCgMSPgCRGQpgAkkfMqs
	B2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ctLZkGV79n5BK2zjtTuFJoI5GyIlYWbRmZ4Oj0DrR6c=;
	b=O6bRdoQQDtWRAZsxliUrEHornqjlulc3NpSc6a50+ge4b6ZO7t9ZKRw9AeAqW5roiO
	fzYhFof50fYUIY9aSauzDEx/R3S7mLzQLfdYArpA3ezKHYNIMRVjwnFdYl0Op0dITlLK
	iDL38FtaO8ghjsSgyIt548ou89DtOnIOxJzloFzTHdKjfAfUG0c1uuM0fL4OrKgc11cF
	Y+w11KpUXsSpoBR3T6U9NT25W24WJsGRk0SqzpNyCoYsudkZ5PnqjnqNdijf+DUlECpm
	YUcGy0NFWZoAY15LQOeYLau1KHndEmbZCCAR9IQxPQ0+wtdTJrcZbI4jE1lyaVq5sfG3
	tl8Q==
X-Gm-Message-State: AJcUukdB6b/X3bNcGcO2qnGWwRwexNVfgvmmNjQEuQKLO4WWwcQg1DTQ
	vT/TlOKnmJ4QDx22a2tYZhtMkG7W4Kg=
X-Google-Smtp-Source: ALg8bN4mjGyNpeXfB9rk+Tc/vd8XlqabuLp/s2Z78gFQI5cmJrMvd7Ugji+11v93mHg1uZcjPI0AJg==
X-Received: by 2002:a63:193:: with SMTP id 141mr14616118pgb.136.1546456882655; 
	Wed, 02 Jan 2019 11:21:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	o189sm87556966pfg.117.2019.01.02.11.21.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 11:21:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 11:21:11 -0800
Message-Id: <20190102192111.33587-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190102192111.33587-1-raj.khem@gmail.com>
References: <20190102192111.33587-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] busybox: Enable mountpoint and setsid applets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2019 19:21:22 -0000
Content-Transfer-Encoding: 8bit

This is needed by some init system services and if
init system is not sysvinit then we dont have it, therefore
its useful to have it provided via busybox as a backup

Enable CONFIG_SETSID to get setsid, needed by runit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 0c4099031f..d11707abc3 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -815,13 +815,13 @@ CONFIG_DC=y
 # CONFIG_FEATURE_MAKEDEVS_TABLE is not set
 # CONFIG_MAN is not set
 CONFIG_MICROCOM=y
-# CONFIG_MOUNTPOINT is not set
+CONFIG_MOUNTPOINT=y
 # CONFIG_MT is not set
 # CONFIG_RAIDAUTORUN is not set
 # CONFIG_READAHEAD is not set
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
-# CONFIG_SETSID is not set
+CONFIG_SETSID=y
 # CONFIG_SETFATTR is not set
 CONFIG_STRINGS=y
 CONFIG_TIME=y
-- 
2.20.1


