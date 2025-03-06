Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A3BC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 09:06:11 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.8577.1741251970378448445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 01:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BgopBEdZ;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: pdoshi@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22337bc9ac3so6732885ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 01:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741251969; x=1741856769; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrGe9UrZF46G09cSo1XFPXQxL7d3jf5mZB+J6TC+jeM=;
        b=BgopBEdZMqerYBlbjDys6lsE6IObhqlbiIbewlTE9AxI/fGLTHePjteG0YtKUKGrVu
         6DULY5cHj4HVnlOZpCJsAjRmcIHQx806DVJQbTmflwIBwPV+rWLpFJGNjXW0R2Rp44F/
         lcRuogkKUhgAaZIV1r2rEphc7plc+/GruvAEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741251969; x=1741856769;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrGe9UrZF46G09cSo1XFPXQxL7d3jf5mZB+J6TC+jeM=;
        b=Y2Asqb7YJ+zVVuUhRNmWmG17wGi0FWZPizu73PHNSRU9OEl2lnIEUs/6yfuGXViSe7
         2CZCmlTwLeTSckA9FaBMUilKzt6UBiEfVHPnz5qYVW1BPkQh3YjVMHPQzto7TbEtcrFL
         0owS2uutM9VsPLEmIwSJARd/pSxaskEJk9LyCnG7au+G0jC0t9DY8sCfWuIL6EeAPjbz
         rNvJ5cOSJmog/8iYoU6Jg35wBPGNxL2NO3sqnCcE1sNfRJUel7MEhlwCwHHbqz7fk1mM
         rn5eXLqchCc7a2RA+KDcphdpjwT9Izf4Pexjzj4IaIa53ZOY/v7T2idpLNAMHF2dlA6E
         KItA==
X-Gm-Message-State: AOJu0YzXcChMFx6b4WdbD3WO/WayzYqksLSnuB7amoSkiGgT/h3rIRQE
	GIsaQgwPEANN2TEHSmqmmUXxpv0KrurgCBkbmiEgvN6cxw1JmdVHFf+VC716zj5wDZvLZbhTVrl
	W
X-Gm-Gg: ASbGncu7ParoVnrX+FQzlIlLKQxXPGljyMQ+jxXtmruoq5tmiyC2Sv6OLprA7mLAnOd
	T0f0u6Z5ssyxc1XuOZBiuXE7VV+dt9Q8CzZpqcWgStKddo2Sc5ow7Kdl0EsCQqS9UhH78lESiCZ
	mPLW+T9fIEo6MYsHTmCThZGWRWs3DhO2EvhXc9QRw3jdYPEzRKFpAL4WQXSDevzsqA+lTw6aalT
	4t2WKJltnmEFBvbCcT63VmMSgRguZPaOReG1xweQ/u564rTm3qrbwedgXP65JUpny6b9c2AGDEX
	IJkDY6QNErXRKrf/2WKE9lVbs7qKVV2Mgh5V1XXp3s0+3c+iGOzEww==
X-Google-Smtp-Source: AGHT+IHnI8brel8fHkbxT/AdkkNO91RNH6QTx+vouBA02+GHianSvknmbfn90ZsAo4jHWt0GZY3Kxw==
X-Received: by 2002:a17:903:1c3:b0:223:50f0:b97 with SMTP id d9443c01a7336-223f1d20df7mr84218115ad.52.1741251969406;
        Thu, 06 Mar 2025 01:06:09 -0800 (PST)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7fac1sm7419155ad.124.2025.03.06.01.06.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Mar 2025 01:06:08 -0800 (PST)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH] tzdata/tzcode-native: upgrade 2024b -> 2025a
Date: Thu,  6 Mar 2025 14:35:53 +0530
Message-Id: <1741251953-2404-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 09:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212377

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index adf0952..f1dbd7b 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024b"
+PV = "2025a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
-SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
+SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
+SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
-- 
2.7.4


