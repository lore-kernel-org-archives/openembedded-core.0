Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0699EE368F
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 14:30:34 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46262.1770906625646987261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 06:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=icJFuqpI;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aad1dc8856so35794305ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 06:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770906624; x=1771511424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2CtQw3DseX1yMDMMlb147+QcCJV4jQG5B1mwPDPfHo=;
        b=icJFuqpIW0qzlSerErw9DJKnTZ/x+Hu1qCErE1b2FKMe3ryL9SS51JnYZ5X0IbKL9j
         gim1gP+QPNbSFJp9OHUREGhEiZlaQnqUksxxWldQe+PCT5q4oq2STkRHpOHphK25GSxp
         Otdponz47BIC7Lz4DimrxbqiQR7SkH7ULrscs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906624; x=1771511424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2CtQw3DseX1yMDMMlb147+QcCJV4jQG5B1mwPDPfHo=;
        b=hrwjUEeX33uhvfpqEAR0JqUrQWlEeS72vE0ggTeBcvzC5+h3759PM3iNW1pbbVjLsj
         hlNZVajCHPMldrDtKT5dGscnlGiNqX6eKr8YvPhuzWlpFSPMPcsPZNbsu5pXxuIuIvk3
         zB0V06GswVex7xZr4VnK12qYIBglknSW2dV173uztRV4mHWgxWrHF3JJaDJeyADhCP1S
         l5LeNN/jkkxRfiQAyolT18mU6HBrSCJP0XtC8DZVZBhxmt7ERU0VpEsnupfvgRse2vyk
         9/rnsxyfcEoZF8aXBqsPXZFYmcWkHHsTZnjUauvGQIlgHyGz2sikwGCu9H4u8dLc4YvR
         dnJQ==
X-Gm-Message-State: AOJu0YxUMv92IeiEoRdLaXod6Qr8rHZ9d2I1Asd6cRqI/zKdmNUC8LSV
	E0NNOJSoDRMLm+GdSNSID2XkxbEKo2KOuKdV54F8GolZLLiaC39iX15GiDiAL6fQKbLB8vjJ8Jh
	vVw7ycwg=
X-Gm-Gg: AZuq6aI/RcdalVkCcoKcAhflIM3o2Y1L58NP6krp4xGgjxB6PWQWSu6m/pAtCpxLbXe
	HbccZTT48Gy64z/X7JX3pftH219KV5lkbYb/+FA0fJhAV8hm+xYaM4juWr1Gp48Kj6uriu7kDcc
	i4Fmw1ZigKdUYtuV3FBZhjyq1C2a6OqdXBlZH4v7m/dMalPrZtnico9wWFTgVbMDPJl7jQlPbdo
	CZPaRK4QDWIIoG/fzvbg0lnQRtNoV+ePADZ8NKwIc/rkh8zhVl1lQS0JATB94S9Nbvqi8kv/EaT
	6Seg1r5mDlHdOhgyLkwe9YPkNGJb3rgtAsths3gqm5k/XnfCLb+D/X+qo5Rsjt7xv3a85DAPKrg
	ymmZZi0yJB7H19mBOcyY841ic8kTVyXFA6xQ/4y3UDrrkZiHRaHlYz2im4dkcWveKyyntiEypYw
	0KhJYuhPUFM4hg3Uc9z0Hgr8U=
X-Received: by 2002:a17:903:3d51:b0:2a9:5c0b:e5e9 with SMTP id d9443c01a7336-2ab39c563c2mr22034085ad.35.1770906624178;
        Thu, 12 Feb 2026 06:30:24 -0800 (PST)
Received: from MVIN00352.. ([2406:7400:54:f9ef:bf72:241c:c358:30b2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29998b74sm56544295ad.84.2026.02.12.06.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:30:23 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] bind: Upgrade 9.18.41 -> 9.18.44
Date: Thu, 12 Feb 2026 20:00:12 +0530
Message-ID: <20260212143013.75735-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 14:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231034

This upgrade fixes CVE-2025-13878

Changelog
==========
https://downloads.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../bind/{bind_9.18.41.bb => bind_9.18.44.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.41.bb => bind_9.18.44.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.41.bb b/meta/recipes-connectivity/bind/bind_9.18.44.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.41.bb
rename to meta/recipes-connectivity/bind/bind_9.18.44.bb
index a83ec29bb4..d424edcb4e 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.41.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d"
+SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


