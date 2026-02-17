Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977E6E6816F
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:50:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9500.1771325437437053908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ExIe2vR8;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-436356740e6so4834725f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 02:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771325436; x=1771930236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZnRm2I0Ztar8GCxUxx+9qhY22fLhZn5weSXkmwcGpE=;
        b=ExIe2vR8szXOxz3856R11c8FGHjSjROe3ta4eFAUFms4/qpyJLx9qeadyglUlE2Z9F
         YIxvg3tUt9wpiS4sJuVtkgS78bCuL0sOh5/uR2r38AQLQrri4NbS3dLZxX4aZo0TtDO3
         U/AL7+BEc9hcoo0Aq2Apo+saFkdrKCoVyKo382K65moL4KxWHi0OsMbNzDJ0ttS2p7f4
         gOLKiwd/9vKCytH1zH+jmQg/IESBgUz8LOQLHyTl53IP/hGCFztQf4jOLnDL6xwsjGFG
         Ec9ORqb+rHCeKUyV8VTD6M19RIaw0zRdaanqh6Vc5pUtysQBaEZub6TzMKZEOCOwDuxM
         eqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771325436; x=1771930236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZnRm2I0Ztar8GCxUxx+9qhY22fLhZn5weSXkmwcGpE=;
        b=FIxBjDRxtIvcp8Tn+y6MlCdVEF3gr48dPjfpVuKI0tsbgXmccODSw2cSNqg32/wVyC
         EAkL55ahczMIqh4Pb87eNSpQYdhId2kfA7aOam290lTN+6b0JkyDyeYyefLfeQn7il8a
         flJoEHVPRmDdCdabqDHr4j3+gWTWbYlogyYCw/okJvqSsrOfDzJtEOjYaeYGHZjDNrcV
         hTwBGrhfnjHCa97yTwkoanwGoiK7z/JFYIDEVoAOKT4Q4kNXH85o0bo/+WwjlaOm5GVD
         bU2aY9rXFz2cvi8RvEcdlA/5IaTp3Nrx4QgNliKiO/MLpYoxyYW4IykFi67zxsLGyrKe
         mnSQ==
X-Gm-Message-State: AOJu0YzXQs9b2EHdYTYixhXS2na8r6vDMuXcaWq3J3Mkdahh6JKmPRuV
	Faao3ChadHXLE7SPIXPoPrdbD6iHrqRHXpnvC3o+VaBQOBl8DPBXa8XtbI6B5w==
X-Gm-Gg: AZuq6aLoLn3l3PFSTVXWVJBxO+EVmOs03+G2epIanAbRtYEdJWiyOCYvqqtNRYW40u8
	w3FpheKn7FRFxsOuv/EEdAiYdZ9EndIXpIsa+/1OkyEXpTh3/0PNJ9oqBQ6uz9Y2wA6NY1wnVKr
	VNzrwdud6QibKZPKZ1uj7CZKj9L2DVNGZZ2B1pbt2xM1rKhIHseJtjrRmi6vSErXIV7YLJ/BTCg
	iq78vcAv7y0cwRsN9gx8V7UrlGZgV5jRCfy0R1EfJjMeH/g5hs37zk36so8Ay6A4Ii/Q/++70EU
	PfuOFq6dzOH3PIuED2hq22zAlv6z/6HVKAGjCzaPgeA6L7i6MZDUaCjCbdGlPdXNpaMcW2nl+e8
	Gm+ewFQvi4y9bNJmcYbJkNqj2kde5oIyNSNciR07ajM3X4GX83W56KxhTnuJPUhmAR+b9SEZE6m
	5mvNIMu+4oyKananN0aXpnSAgclPrlajjf2c1neDTu1CkbiORvUzqGIWvm05c=
X-Received: by 2002:a05:6000:26d2:b0:436:d824:621b with SMTP id ffacd0b85a97d-4379db93458mr20239753f8f.32.1771325435536;
        Tue, 17 Feb 2026 02:50:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acffcesm30878989f8f.37.2026.02.17.02.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:50:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] blktrace: correct SRC_URI
Date: Tue, 17 Feb 2026 11:50:30 +0100
Message-ID: <20260217105031.3385098-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 10:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231241

From: Alexander Kanavin <alex@linutronix.de>

AI scrapers prompted the move:
https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git/commit/?id=9b24b42ef59d2e8015957db3dd70ffedb7ebcfe8

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-kernel/blktrace/blktrace_1.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
index f053490409..2c1b6b1d6c 100644
--- a/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_1.3.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;protocol=https;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git;protocol=https;branch=master \
            file://0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch \
           "
 
-- 
2.47.3


